@interface GKSQLRunner
+ (id)runnerWithConnection:(id)a3;
- (GKDatabaseConnection)connection;
- (GKSQLRunner)initWithConnection:(id)a3;
- (int)runSQL:(id)a3;
- (int)runSQLFromFileAtPath:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation GKSQLRunner

+ (id)runnerWithConnection:(id)a3
{
  id v3 = a3;
  v4 = [[GKSQLRunner alloc] initWithConnection:v3];

  return v4;
}

- (GKSQLRunner)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKSQLRunner;
  v5 = [(GKSQLRunner *)&v8 init];
  v6 = v5;
  if (v5) {
    [(GKSQLRunner *)v5 setConnection:v4];
  }

  return v6;
}

- (int)runSQLFromFileAtPath:(id)a3
{
  id v4 = +[NSString stringWithContentsOfFile:a3 encoding:4 error:0];
  LODWORD(self) = [(GKSQLRunner *)self runSQL:v4];

  return (int)self;
}

- (int)runSQL:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  connection = self->_connection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DA3D4;
  v8[3] = &unk_1002D9868;
  v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [(GKDatabaseConnection *)connection performSync:v8];
  LODWORD(connection) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)connection;
}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end