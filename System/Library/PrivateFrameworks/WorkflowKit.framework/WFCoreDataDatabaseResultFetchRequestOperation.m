@interface WFCoreDataDatabaseResultFetchRequestOperation
- (BOOL)isEqual:(id)a3;
- (NSEntityDescription)entity;
- (NSFetchRequest)fetchRequest;
- (NSSet)relationshipKeysAffectingDescriptors;
- (NSString)description;
- (WFCoreDataDatabaseResultFetchRequestOperation)initWithFetchRequest:(id)a3;
- (WFCoreDataDatabaseResultFetchRequestOperation)initWithFetchRequest:(id)a3 relationshipKeysAffectingDescriptors:(id)a4;
- (id)resultsWithContext:(id)a3 error:(id *)a4;
- (int64_t)countWithContext:(id)a3 error:(id *)a4;
- (unint64_t)hash;
@end

@implementation WFCoreDataDatabaseResultFetchRequestOperation

- (NSSet)relationshipKeysAffectingDescriptors
{
  return self->_relationshipKeysAffectingDescriptors;
}

- (NSEntityDescription)entity
{
  v2 = [(WFCoreDataDatabaseResultFetchRequestOperation *)self fetchRequest];
  v3 = [v2 entity];

  return (NSEntityDescription *)v3;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (id)resultsWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WFCoreDataDatabaseResultFetchRequestOperation *)self fetchRequest];
  v8 = [v6 executeFetchRequest:v7 error:a4];

  return v8;
}

- (int64_t)countWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(WFCoreDataDatabaseResultFetchRequestOperation *)self fetchRequest];
  int64_t v8 = [v6 countForFetchRequest:v7 error:a4];

  return v8;
}

- (WFCoreDataDatabaseResultFetchRequestOperation)initWithFetchRequest:(id)a3 relationshipKeysAffectingDescriptors:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFDatabaseResult.m", 260, @"Invalid parameter not satisfying: %@", @"fetchRequest" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFDatabaseResult.m", 261, @"Invalid parameter not satisfying: %@", @"relationshipKeysAffectingDescriptors" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFCoreDataDatabaseResultFetchRequestOperation;
  v11 = [(WFCoreDataDatabaseResultFetchRequestOperation *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fetchRequest, a3);
    objc_storeStrong((id *)&v12->_relationshipKeysAffectingDescriptors, a4);
    v13 = v12;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_relationshipKeysAffectingDescriptors, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  v7 = [(WFCoreDataDatabaseResultFetchRequestOperation *)self fetchRequest];
  id v8 = [v6 fetchRequest];

  id v9 = v7;
  id v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    char v12 = 1;
  }
  else
  {
    char v12 = 0;
    if (v9 && v10) {
      char v12 = [v9 isEqual:v10];
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(WFCoreDataDatabaseResultFetchRequestOperation *)self fetchRequest];
  id v4 = [v3 entityName];
  uint64_t v5 = [v4 hash];
  id v6 = [(WFCoreDataDatabaseResultFetchRequestOperation *)self fetchRequest];
  v7 = [v6 predicate];
  unint64_t v8 = [v7 hash] ^ v5;

  return v8;
}

- (NSString)description
{
  v3 = [(WFCoreDataDatabaseResultFetchRequestOperation *)self fetchRequest];
  id v4 = [v3 entityName];

  uint64_t v5 = [(WFCoreDataDatabaseResultFetchRequestOperation *)self fetchRequest];
  id v6 = [v5 predicate];
  v7 = [v6 predicateFormat];

  unint64_t v8 = NSString;
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"<%@: %p, type: %@, predicate: %@>", v10, self, v4, v7];

  return (NSString *)v11;
}

- (WFCoreDataDatabaseResultFetchRequestOperation)initWithFetchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(WFCoreDataDatabaseResultFetchRequestOperation *)self initWithFetchRequest:v4 relationshipKeysAffectingDescriptors:v5];

  return v6;
}

@end