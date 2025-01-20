@interface WFCoreDataDatabaseResultConcatFetchRequestOperation
- (BOOL)isEqual:(id)a3;
- (NSArray)fetchRequests;
- (NSEntityDescription)entity;
- (NSSet)relationshipKeysAffectingDescriptors;
- (NSString)description;
- (WFCoreDataDatabaseResultConcatFetchRequestOperation)initWithFetchRequests:(id)a3 resultsLimit:(int64_t)a4;
- (WFCoreDataDatabaseResultConcatFetchRequestOperation)initWithFetchRequests:(id)a3 resultsLimit:(int64_t)a4 relationshipKeysAffectingDescriptors:(id)a5;
- (id)resultsWithContext:(id)a3 error:(id *)a4;
- (int64_t)countWithContext:(id)a3 error:(id *)a4;
- (int64_t)resultsLimit;
- (unint64_t)hash;
@end

@implementation WFCoreDataDatabaseResultConcatFetchRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequests, 0);
  objc_storeStrong((id *)&self->_relationshipKeysAffectingDescriptors, 0);
}

- (int64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (NSArray)fetchRequests
{
  return self->_fetchRequests;
}

- (NSSet)relationshipKeysAffectingDescriptors
{
  return self->_relationshipKeysAffectingDescriptors;
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
  v7 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self fetchRequests];
  v8 = [v6 fetchRequests];
  id v9 = v7;
  id v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
  }
  else
  {
    if (!v9 || !v10)
    {

LABEL_14:
      BOOL v14 = 0;
      goto LABEL_15;
    }
    int v12 = [v9 isEqualToArray:v10];

    if (!v12) {
      goto LABEL_14;
    }
  }
  int64_t v13 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self resultsLimit];
  BOOL v14 = v13 == [v6 resultsLimit];
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  v3 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self fetchRequests];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self resultsLimit] ^ v4;

  return v5;
}

- (NSString)description
{
  v3 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self fetchRequests];
  uint64_t v4 = [v3 valueForKeyPath:@"predicate.predicateFormat"];

  unint64_t v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"<%@: %p, predicates: %@>", v7, self, v4];

  return (NSString *)v8;
}

- (NSEntityDescription)entity
{
  v2 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self fetchRequests];
  v3 = [v2 firstObject];
  uint64_t v4 = [v3 entity];

  return (NSEntityDescription *)v4;
}

- (int64_t)countWithContext:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self fetchRequests];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        v10 += [v6 countForFetchRequest:*(void *)(*((void *)&v15 + 1) + 8 * i) error:a4];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    int64_t v10 = 0;
  }

  if ([(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self resultsLimit] >= 1)
  {
    int64_t v13 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self resultsLimit];
    if (v10 >= v13) {
      int64_t v10 = v13;
    }
  }

  return v10;
}

- (id)resultsWithContext:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self fetchRequests];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        int64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self resultsLimit] >= 1)
        {
          int64_t v14 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self resultsLimit];
          unint64_t v15 = v14 - [v7 count];
          unint64_t v16 = [v13 fetchLimit];
          if (v16 >= v15) {
            unint64_t v17 = v15;
          }
          else {
            unint64_t v17 = v16;
          }
          [v13 setFetchLimit:v17];
        }
        uint64_t v18 = [v6 executeFetchRequest:v13 error:a4];
        if (!v18)
        {

          id v21 = 0;
          goto LABEL_20;
        }
        v19 = (void *)v18;
        [v7 addObjectsFromArray:v18];
        if ([(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self resultsLimit] >= 1)
        {
          unint64_t v20 = [v7 count];
          if (v20 >= [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self resultsLimit])
          {

            goto LABEL_19;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  id v21 = v7;
LABEL_20:

  return v21;
}

- (WFCoreDataDatabaseResultConcatFetchRequestOperation)initWithFetchRequests:(id)a3 resultsLimit:(int64_t)a4 relationshipKeysAffectingDescriptors:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WFCoreDataDatabaseResultConcatFetchRequestOperation;
  uint64_t v10 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    fetchRequests = v10->_fetchRequests;
    v10->_fetchRequests = (NSArray *)v11;

    v10->_resultsLimit = a4;
    uint64_t v13 = [v9 copy];
    relationshipKeysAffectingDescriptors = v10->_relationshipKeysAffectingDescriptors;
    v10->_relationshipKeysAffectingDescriptors = (NSSet *)v13;

    unint64_t v15 = v10;
  }

  return v10;
}

- (WFCoreDataDatabaseResultConcatFetchRequestOperation)initWithFetchRequests:(id)a3 resultsLimit:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  id v8 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)self initWithFetchRequests:v6 resultsLimit:a4 relationshipKeysAffectingDescriptors:v7];

  return v8;
}

@end