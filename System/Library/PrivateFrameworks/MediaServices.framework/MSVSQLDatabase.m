@interface MSVSQLDatabase
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)executeStatementString:(id)a3 error:(id *)a4;
- (MSVSQLDatabase)initWithMemory;
- (MSVSQLDatabase)initWithMemoryNamed:(id)a3;
- (MSVSQLDatabase)initWithURL:(id)a3 error:(id *)a4;
- (NSString)description;
- (NSURL)databaseURL;
- (id)markdownTableForSQL:(id)a3;
- (id)markdownTableForStatement:(id)a3;
- (id)markdownTableForTableNamed:(id)a3;
- (id)resultsForStatement:(id)a3;
- (id)statementWithString:(id)a3 error:(id *)a4;
- (id)transactionWithName:(id)a3 error:(id *)a4;
- (void)registerAggregateFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 start:(id)a6 add:(id)a7 remove:(id)a8 value:(id)a9;
- (void)registerFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 block:(id)a6;
- (void)setDatabaseURL:(id)a3;
- (void)unregisterFunctionNamed:(id)a3 arguments:(int64_t)a4;
@end

@implementation MSVSQLDatabase

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  connection = self->_connection;
  if (connection) {
    connection = (_MSVSQLConnection *)connection->_databaseURI;
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %p uri=%@>", v4, self, connection];
}

- (id)resultsForStatement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = -[MSVSQLRowEnumerator initWithStatement:]((id *)[MSVSQLRowEnumerator alloc], v3);

  return v4;
}

- (MSVSQLDatabase)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MSVSQLDatabase *)self init];
  if (v7)
  {
    v8 = [_MSVSQLConnection alloc];
    v9 = [v6 path];
    v10 = -[_MSVSQLConnection initWithDatabaseURI:options:error:]((char *)v8, v9, 0, a4);
    connection = v7->_connection;
    v7->_connection = (_MSVSQLConnection *)v10;

    if (!v7->_connection)
    {
      v14 = 0;
      goto LABEL_6;
    }
    uint64_t v12 = [v6 copy];
    databaseURL = v7->_databaseURL;
    v7->_databaseURL = (NSURL *)v12;
  }
  v14 = v7;
LABEL_6:

  return v14;
}

- (id)transactionWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[_MSVSQLConnection mutableCloneWithError:](&self->_connection->super.isa, (uint64_t)a4);
  if (v7) {
    v8 = -[MSVSQLDatabaseTransaction initWithConnection:name:error:]((__CFString *)[MSVSQLDatabaseTransaction alloc], v7, v6, a4);
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)setDatabaseURL:(id)a3
{
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (id)markdownTableForTableNamed:(id)a3
{
  uint64_t v4 = [NSString stringWithFormat:@"SELECT * FROM %@", a3];
  v5 = [(MSVSQLDatabase *)self statementWithString:v4 error:0];

  id v6 = [(MSVSQLDatabase *)self markdownTableForStatement:v5];
  [v5 invalidate];

  return v6;
}

- (id)markdownTableForStatement:(id)a3
{
  id v3 = [(MSVSQLDatabase *)self resultsForStatement:a3];
  uint64_t v4 = [v3 markdownTable];

  return v4;
}

- (id)markdownTableForSQL:(id)a3
{
  id v4 = a3;
  v5 = [(MSVSQLDatabase *)self transactionWithName:@"markdown-table" error:0];
  id v6 = [v5 statementWithString:v4 error:0];

  v7 = [(MSVSQLDatabase *)self markdownTableForStatement:v6];
  [v6 invalidate];
  [v5 rollback];

  return v7;
}

- (BOOL)executeStatementString:(id)a3 error:(id *)a4
{
  return [(_MSVSQLConnection *)self->_connection executeStatementString:a3 error:a4];
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return [(_MSVSQLConnection *)self->_connection executeStatement:a3 error:a4];
}

- (id)statementWithString:(id)a3 error:(id *)a4
{
  return [(_MSVSQLConnection *)self->_connection statementWithString:a3 error:a4];
}

- (void)registerAggregateFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 start:(id)a6 add:(id)a7 remove:(id)a8 value:(id)a9
{
}

- (void)unregisterFunctionNamed:(id)a3 arguments:(int64_t)a4
{
}

- (void)registerFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 block:(id)a6
{
}

- (MSVSQLDatabase)initWithMemoryNamed:(id)a3
{
  id v4 = a3;
  v5 = [(MSVSQLDatabase *)self init];
  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"file:%@?mode=memory&cache=shared", v4];
    v7 = -[_MSVSQLConnection initWithDatabaseURI:options:error:]((char *)[_MSVSQLConnection alloc], v6, 1, 0);
    connection = v5->_connection;
    v5->_connection = (_MSVSQLConnection *)v7;
  }
  return v5;
}

- (MSVSQLDatabase)initWithMemory
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];

  v5 = [(MSVSQLDatabase *)self initWithMemoryNamed:v4];
  return v5;
}

@end