@interface WFDatabaseWorkflowStorage
- (BOOL)reloadRecord:(id)a3 withReference:(id)a4 error:(id *)a5;
- (BOOL)saveRecord:(id)a3 withReference:(id)a4 error:(id *)a5;
- (WFDatabase)database;
- (WFDatabaseWorkflowStorage)initWithDatabase:(id)a3;
@end

@implementation WFDatabaseWorkflowStorage

- (void).cxx_destruct
{
}

- (WFDatabase)database
{
  return self->_database;
}

- (BOOL)reloadRecord:(id)a3 withReference:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(WFDatabaseWorkflowStorage *)self database];
  LOBYTE(a5) = [v10 reloadRecord:v9 withDescriptor:v8 error:a5];

  return (char)a5;
}

- (BOOL)saveRecord:(id)a3 withReference:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(WFDatabaseWorkflowStorage *)self database];
  LOBYTE(a5) = [v10 saveRecord:v9 withDescriptor:v8 error:a5];

  return (char)a5;
}

- (WFDatabaseWorkflowStorage)initWithDatabase:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFDatabaseWorkflowStorage;
  v6 = [(WFDatabaseWorkflowStorage *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    id v8 = v7;
  }

  return v7;
}

@end