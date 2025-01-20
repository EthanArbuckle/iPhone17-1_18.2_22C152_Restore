@interface ML3BulkStatementExecutionOperation
- (BOOL)_execute:(id *)a3;
- (BOOL)_executeStatements:(id)a3 onConnection:(id)a4 withError:(id *)a5;
- (unint64_t)type;
@end

@implementation ML3BulkStatementExecutionOperation

- (BOOL)_executeStatements:(id)a3 onConnection:(id)a4 withError:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v22 = a5;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "sql", v22);
        v17 = [v15 parameters];
        id v23 = 0;
        int v18 = [v9 executeUpdate:v16 withParameters:v17 error:&v23];
        id v19 = v23;

        if (v18) {
          BOOL v20 = v19 == 0;
        }
        else {
          BOOL v20 = 0;
        }
        if (!v20)
        {
          if (v22)
          {
            id v19 = v19;
            id *v22 = v19;
          }
          goto LABEL_19;
        }
        if ([(ML3BulkStatementExecutionOperation *)self isCancelled])
        {
          id v19 = 0;
          LOBYTE(v18) = 0;
          goto LABEL_19;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v19 = 0;
      LOBYTE(v18) = 1;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v19 = 0;
    LOBYTE(v18) = 1;
  }
LABEL_19:

  return v18;
}

- (BOOL)_execute:(id *)a3
{
  v12[4] = *(id *)MEMORY[0x1E4F143B8];
  v5 = [(ML3DatabaseOperation *)self attributes];
  v6 = [v5 objectForKey:@"MLDatabaseOperationAttributeStatementsKey"];
  v7 = [(ML3DatabaseOperation *)self transaction];
  id v8 = [v7 connection];

  v12[0] = 0;
  LOBYTE(v7) = [(ML3BulkStatementExecutionOperation *)self _executeStatements:v6 onConnection:v8 withError:v12];
  id v9 = v12[0];

  id v10 = v9;
  *a3 = v10;

  return (char)v7;
}

- (unint64_t)type
{
  return 2;
}

@end