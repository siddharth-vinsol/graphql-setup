module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: false, description: 'Return list of users'

    field :user, Types::UserType do
      argument :id, ID
    end

    field :authors, [Types::AuthorType], description: 'Returns all authors'
    field :book, Types::BookType, description: 'Return one book' do
      argument :id, ID
    end
    field :books, resolver: Queries::Books

    def users
      User.all
    end

    def user(id:)
      if @user = User.find_by(id: id)
        @user
      else
        context.add_error(GraphQL::ExecutionError.new('No such user exist', extensions: { code: 'USER_INVALID_ID' }))
      end
    end

    def authors
      Author.includes(:books).all
    end

    def book(id:)
      if @book = Book.find_by(id: id)
        @book
      else
        context.add_error(GraphQL::ExecutionError.new('No such book exist', extensions: { code: 'BOOK_INVALID_ID' }))
      end
    end
  end
end
