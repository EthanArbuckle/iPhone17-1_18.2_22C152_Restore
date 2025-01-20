@interface _PBFSQLiteDeferredPreparedSimpleStatement
- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5;
- (id)initWithDatabaseConnection:(void *)a3 deferredSql:;
@end

@implementation _PBFSQLiteDeferredPreparedSimpleStatement

- (id)initWithDatabaseConnection:(void *)a3 deferredSql:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (!v6)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel_initWithDatabaseConnection_deferredSql_, a1, @"PBFSQLitePreparedStatement.m", 346, @"Invalid parameter not satisfying: %@", @"sql" object file lineNumber description];
    }
    a1 = -[_PBFSQLitePreparedSimpleStatement _initWithDatabaseConnection:statement:](a1, v5, 0);
    if (a1)
    {
      uint64_t v8 = [v7 copy];
      id v9 = a1[4];
      a1[4] = (id)v8;
    }
  }

  return a1;
}

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (self->_deferredSql)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._dbConnection);
    v12 = WeakRetained;
    if (!WeakRetained)
    {
      int v13 = 21;
      *((_DWORD *)v19 + 6) = 21;
      if (!a5)
      {
LABEL_8:

        _Block_object_dispose(&v18, 8);
LABEL_12:
        BOOL v14 = 0;
        goto LABEL_13;
      }
LABEL_7:
      -[_PBFSQLitePreparedSimpleStatement _sqliteError:]((uint64_t)self, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88___PBFSQLiteDeferredPreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke;
    v17[3] = &unk_1E6983F68;
    v17[4] = self;
    v17[5] = &v18;
    v17[6] = a2;
    -[PBFSQLiteDatabaseConnection performSyncWithDatabase:]((uint64_t)WeakRetained, v17);
    int v13 = *((_DWORD *)v19 + 6);
    if (v13)
    {
      if (!a5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }

    _Block_object_dispose(&v18, 8);
  }
  if (!self->super._statement) {
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)_PBFSQLiteDeferredPreparedSimpleStatement;
  BOOL v14 = [(_PBFSQLitePreparedSimpleStatement *)&v16 executeWithBindings:v9 resultRowHandler:v10 error:a5];
LABEL_13:

  return v14;
}

- (void).cxx_destruct
{
}

@end