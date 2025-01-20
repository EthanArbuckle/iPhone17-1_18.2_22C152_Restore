@interface WFCoreDataDatabaseResult
- (WFCoreDataDatabaseResult)initWithDatabase:(id)a3 fetchOperation:(id)a4;
- (WFCoreDataDatabaseResult)initWithDatabase:(id)a3 fetchRequest:(id)a4;
- (WFCoreDataDatabaseResult)initWithDatabase:(id)a3 fetchRequest:(id)a4 relationshipKeysAffectingDescriptors:(id)a5;
- (WFCoreDataDatabaseResultFetchOperation)fetchOperation;
- (id)description;
- (id)unsearchedDescriptorsWithError:(id *)a3;
- (void)setFetchOperation:(id)a3;
@end

@implementation WFCoreDataDatabaseResult

- (WFCoreDataDatabaseResultFetchOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (WFCoreDataDatabaseResult)initWithDatabase:(id)a3 fetchRequest:(id)a4 relationshipKeysAffectingDescriptors:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[WFCoreDataDatabaseResultFetchRequestOperation alloc] initWithFetchRequest:v9 relationshipKeysAffectingDescriptors:v8];

  v12 = [(WFCoreDataDatabaseResult *)self initWithDatabase:v10 fetchOperation:v11];
  return v12;
}

- (WFCoreDataDatabaseResult)initWithDatabase:(id)a3 fetchOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFDatabaseResult.m", 214, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"WFDatabaseResult.m", 215, @"Invalid parameter not satisfying: %@", @"fetchOperation" object file lineNumber description];

LABEL_3:
  id v10 = [(WFDatabaseResult *)self _init];
  v11 = v10;
  if (v10)
  {
    WFDatabaseResultCommonInit(v10);
    [(WFDatabaseResult *)v11 setDatabase:v7];
    [(WFCoreDataDatabaseResult *)v11 setFetchOperation:v9];
    [v7 startObservingChangesForResult:v11];
    v12 = v11;
  }

  return v11;
}

- (void)setFetchOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)unsearchedDescriptorsWithError:(id *)a3
{
  v5 = [(WFDatabaseResult *)self database];
  id v9 = 0;
  v6 = [v5 descriptorsForCoreDataResult:self state:&v9 error:a3];
  id v7 = v9;

  [(WFDatabaseResult *)self setState:v7];
  return v6;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFCoreDataDatabaseResult *)self fetchOperation];
  id v7 = [v3 stringWithFormat:@"<%@: %p, operation: %@>", v5, self, v6];

  return v7;
}

- (WFCoreDataDatabaseResult)initWithDatabase:(id)a3 fetchRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [WFCoreDataDatabaseResultFetchRequestOperation alloc];
  id v9 = objc_opt_new();
  id v10 = [(WFCoreDataDatabaseResultFetchRequestOperation *)v8 initWithFetchRequest:v6 relationshipKeysAffectingDescriptors:v9];

  v11 = [(WFCoreDataDatabaseResult *)self initWithDatabase:v7 fetchOperation:v10];
  return v11;
}

@end