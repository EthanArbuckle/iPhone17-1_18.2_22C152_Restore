@interface NDTSQSchema
- (NDTSQFile)db;
- (id)instanceName;
- (int64_t)changes;
- (int64_t)currentVersion;
- (unint64_t)lastInsertedRowId;
- (void)begin;
- (void)commit;
- (void)executeSql:(id)a3;
- (void)parseSql:(id)a3 andRun:(id)a4;
- (void)rollback;
- (void)setDb:(id)a3;
@end

@implementation NDTSQSchema

- (id)instanceName
{
  return &stru_1000AB888;
}

- (int64_t)currentVersion
{
  return 1;
}

- (void)executeSql:(id)a3
{
  id v4 = a3;
  id v5 = [(NDTSQSchema *)self db];
  [v5 executeSql:v4];
}

- (void)parseSql:(id)a3 andRun:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NDTSQSchema *)self db];
  [v8 parseSql:v7 andRun:v6];
}

- (void)begin
{
  id v2 = [(NDTSQSchema *)self db];
  [v2 begin];
}

- (void)commit
{
  id v2 = [(NDTSQSchema *)self db];
  [v2 commit];
}

- (void)rollback
{
  id v2 = [(NDTSQSchema *)self db];
  [v2 rollback];
}

- (int64_t)changes
{
  id v2 = [(NDTSQSchema *)self db];
  int64_t v3 = sqlite3_changes((sqlite3 *)[v2 db]);

  return v3;
}

- (unint64_t)lastInsertedRowId
{
  id v2 = [(NDTSQSchema *)self db];
  sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)[v2 db]);

  return insert_rowid;
}

- (NDTSQFile)db
{
  return self->_db;
}

- (void)setDb:(id)a3
{
}

- (void).cxx_destruct
{
}

@end