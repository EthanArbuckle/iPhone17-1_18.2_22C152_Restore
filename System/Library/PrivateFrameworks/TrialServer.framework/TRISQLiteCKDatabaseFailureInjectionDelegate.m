@interface TRISQLiteCKDatabaseFailureInjectionDelegate
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldProcessFetchOperation:(id)a3 error:(id *)a4;
- (BOOL)shouldProcessQueryOperation:(id)a3 error:(id *)a4;
- (NSMutableArray)fetchErrors;
- (NSMutableArray)queryErrors;
- (TRISQLiteCKDatabaseFailureInjectionDelegate)initWithCoder:(id)a3;
- (TRISQLiteCKDatabaseFailureInjectionDelegate)initWithErrorForAllOperations:(id)a3;
- (TRISQLiteCKDatabaseFailureInjectionDelegate)initWithQueryErrors:(id)a3 fetchErrors:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setFetchErrors:(id)a3;
- (void)setQueryErrors:(id)a3;
@end

@implementation TRISQLiteCKDatabaseFailureInjectionDelegate

- (TRISQLiteCKDatabaseFailureInjectionDelegate)initWithErrorForAllOperations:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabaseFailureInjectionDelegate.m", 18, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRISQLiteCKDatabaseFailureInjectionDelegate;
  v6 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v5];
    queryErrors = v6->_queryErrors;
    v6->_queryErrors = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v5];
    fetchErrors = v6->_fetchErrors;
    v6->_fetchErrors = (NSMutableArray *)v9;
  }
  return v6;
}

- (TRISQLiteCKDatabaseFailureInjectionDelegate)initWithQueryErrors:(id)a3 fetchErrors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TRISQLiteCKDatabaseFailureInjectionDelegate;
  v8 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 mutableCopy];
    queryErrors = v8->_queryErrors;
    v8->_queryErrors = (NSMutableArray *)v9;

    uint64_t v11 = [v7 mutableCopy];
    fetchErrors = v8->_fetchErrors;
    v8->_fetchErrors = (NSMutableArray *)v11;
  }
  return v8;
}

- (BOOL)shouldProcessQueryOperation:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self queryErrors];
  if (v8
    && (uint64_t v9 = (void *)v8,
        [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self queryErrors],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v9,
        v11))
  {
    v12 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self queryErrors];
    objc_super v13 = [v12 firstObject];

    objc_super v14 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self queryErrors];
    [v14 removeObjectAtIndex:0];

    v15 = TRILogCategory_XCTest();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Query operation %@ being rejected with error %@", buf, 0x16u);
    }

    if (!a4)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabaseFailureInjectionDelegate.m", 41, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
    }
    id v16 = *a4;
    *a4 = v13;

    BOOL v17 = 0;
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)shouldProcessFetchOperation:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self fetchErrors];
  if (v8
    && (uint64_t v9 = (void *)v8,
        [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self fetchErrors],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v9,
        v11))
  {
    v12 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self fetchErrors];
    objc_super v13 = [v12 firstObject];

    objc_super v14 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self fetchErrors];
    [v14 removeObjectAtIndex:0];

    v15 = TRILogCategory_XCTest();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Fetch operation %@ being rejected with error %@", buf, 0x16u);
    }

    if (!a4)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"TRISQLiteCKDatabaseFailureInjectionDelegate.m", 53, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
    }
    id v16 = *a4;
    *a4 = v13;

    BOOL v17 = 0;
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISQLiteCKDatabaseFailureInjectionDelegate)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"queryErrors"];
  uint64_t v9 = [v5 decodeObjectOfClasses:v7 forKey:@"fetchErrors"];

  v10 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self initWithQueryErrors:v8 fetchErrors:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self queryErrors];
  [v4 encodeObject:v5 forKey:@"queryErrors"];

  id v6 = [(TRISQLiteCKDatabaseFailureInjectionDelegate *)self fetchErrors];
  [v4 encodeObject:v6 forKey:@"fetchErrors"];
}

- (NSMutableArray)queryErrors
{
  return self->_queryErrors;
}

- (void)setQueryErrors:(id)a3
{
}

- (NSMutableArray)fetchErrors
{
  return self->_fetchErrors;
}

- (void)setFetchErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchErrors, 0);
  objc_storeStrong((id *)&self->_queryErrors, 0);
}

@end