@interface _PBFSQLitePreparedCompoundStatement
- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5;
- (id)initWithDatabaseConnection:(void *)a3 statements:;
@end

@implementation _PBFSQLitePreparedCompoundStatement

- (id)initWithDatabaseConnection:(void *)a3 statements:
{
  id v5 = a3;
  if (a1)
  {
    v6 = -[PBFSQLitePreparedStatement _initWithDatabaseConnection:](a1, a2);
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      id v8 = v6[3];
      v6[3] = (id)v7;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v10 = self->_statements;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "executeWithBindings:resultRowHandler:error:", v8, v9, a5, (void)v17))
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (void).cxx_destruct
{
}

@end