@interface SBUISystemApertureAssertion
- (BOOL)isValid;
- (NSArray)_descriptionConstituents;
- (NSDate)creationDate;
- (NSString)_invalidationReason;
- (NSString)description;
- (SBUISystemApertureAssertion)init;
- (void)addInvalidationBlock:(id)a3;
- (void)dealloc;
- (void)invalidateWithReason:(id)a3;
@end

@implementation SBUISystemApertureAssertion

- (SBUISystemApertureAssertion)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBUISystemApertureAssertion;
  v2 = [(SBUISystemApertureAssertion *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_valid = 1;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
    creationDate = v3->_creationDate;
    v3->_creationDate = (NSDate *)v4;
  }
  return v3;
}

- (void)dealloc
{
  if ([(SBUISystemApertureAssertion *)self isValid]) {
    [(SBUISystemApertureAssertion *)self invalidateWithReason:@"deallocation"];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBUISystemApertureAssertion;
  [(SBUISystemApertureAssertion *)&v3 dealloc];
}

- (NSString)description
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  [(SBUISystemApertureAssertion *)self _descriptionConstituents];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        objc_super v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * j);
              v14 = [v8 objectForKey:v13];
              [v3 appendFormat:@"; %@: %@", v13, v14];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v10);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (void)addInvalidationBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    invalidationBlocks = v5->_invalidationBlocks;
    if (!invalidationBlocks)
    {
      objc_super v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      id v8 = v5->_invalidationBlocks;
      v5->_invalidationBlocks = v7;

      invalidationBlocks = v5->_invalidationBlocks;
    }
    uint64_t v9 = (void *)MEMORY[0x1AD0CF1C0](v10);
    [(NSMutableOrderedSet *)invalidationBlocks addObject:v9];

    objc_sync_exit(v5);
    id v4 = v10;
  }
}

- (void)invalidateWithReason:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 length])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBUISystemApertureAssertion.m", 70, @"Invalid parameter not satisfying: %@", @"[reason length] > 0" object file lineNumber description];
  }
  if ([(SBUISystemApertureAssertion *)self isValid])
  {
    v6 = self;
    objc_sync_enter(v6);
    v6->_valid = 0;
    uint64_t v7 = [v5 copy];
    invalidationReason = v6->_invalidationReason;
    v6->_invalidationReason = (NSString *)v7;

    uint64_t v9 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v23 = v6;
      _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_DEFAULT, "Assertion did invalidate: %{public}@", buf, 0xCu);
    }

    id v10 = v6;
    objc_sync_enter(v10);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = v10[1].isa;
    uint64_t v12 = [(objc_class *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v14++) + 16))();
        }
        while (v12 != v14);
        uint64_t v12 = [(objc_class *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    Class isa = v10[1].isa;
    v10[1].Class isa = 0;

    objc_sync_exit(v10);
    objc_sync_exit(v10);
  }
  else
  {
    id v10 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v23 = self;
      _os_log_impl(&dword_1A7607000, v10, OS_LOG_TYPE_DEFAULT, "Attempt to invalidate invalid assertion: %{public}@", buf, 0xCu);
    }
  }
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_invalidationReason, 0);
  objc_storeStrong((id *)&self->_invalidationBlocks, 0);
}

- (NSString)_invalidationReason
{
  return self->_invalidationReason;
}

- (NSArray)_descriptionConstituents
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v4 = [(SBUISystemApertureAssertion *)self isValid];
  id v5 = NSStringFromBOOL();
  [v3 setObject:v5 forKey:@"isValid"];

  if (!v4)
  {
    invalidationReason = self->_invalidationReason;
    if (invalidationReason) {
      [v3 setObject:invalidationReason forKey:@"invalidation reason"];
    }
  }
  v9[0] = v3;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return (NSArray *)v7;
}

@end