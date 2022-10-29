import { useState } from 'react';
import axios from 'axios';
import './App.css';
import { createGraphiQLFetcher } from '@graphiql/toolkit';
import { GraphiQL } from 'graphiql';
import 'graphiql/graphiql.css';

function App() {
  const fetcher = createGraphiQLFetcher({
    url: 'http://127.0.0.1:3000/graphql',
  });

  return (
    <GraphiQL fetcher={fetcher} />
  )
}

export default App;
