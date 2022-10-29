module Mutations
  class CreateUser < BaseMutation
    # arguments passed to the `resolve` method
    argument :name, String, required: true

    # return type from the mutation
    type Types::UserType

    def resolve(name: nil)
      @user = User.new(name: name)

      if @user.save
        @user
      else
        raise GraphQL::ExecutionError, @user.errors.full_messages.join(", ")
      end
    end
  end
end
