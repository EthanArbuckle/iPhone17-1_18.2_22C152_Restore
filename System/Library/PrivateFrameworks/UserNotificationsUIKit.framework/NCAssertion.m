@interface NCAssertion
- (BOOL)isValid;
- (NCAssertion)initWithInstantiationReason:(id)a3;
- (NSString)description;
- (NSString)instantiationReason;
- (NSString)invalidationReason;
- (void)addInvalidationBlock:(id)a3;
- (void)dealloc;
- (void)invalidateWithReason:(id)a3;
@end

@implementation NCAssertion

- (NCAssertion)initWithInstantiationReason:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NCAssertion;
  v5 = [(NCAssertion *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_valid = 1;
    uint64_t v7 = [v4 copy];
    instantiationReason = v6->_instantiationReason;
    v6->_instantiationReason = (NSString *)v7;
  }
  return v6;
}

- (void)dealloc
{
  if ([(NCAssertion *)self isValid]) {
    [(NCAssertion *)self invalidateWithReason:@"deallocation"];
  }
  v3.receiver = self;
  v3.super_class = (Class)NCAssertion;
  [(NCAssertion *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  [v3 appendFormat:@"; instantiationReason: %@", self->_instantiationReason];
  BOOL v4 = [(NCAssertion *)self isValid];
  v5 = NSStringFromBOOL();
  [v3 appendFormat:@"; isValid: %@", v5];

  if (!v4 && self->_invalidationReason) {
    [v3 appendFormat:@"; invalidationReason: %@", self->_invalidationReason];
  }
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (void)addInvalidationBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    aBlock = v4;
    v5 = self;
    objc_sync_enter(v5);
    invalidationBlocks = v5->_invalidationBlocks;
    if (!invalidationBlocks)
    {
      uint64_t v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      v8 = v5->_invalidationBlocks;
      v5->_invalidationBlocks = v7;

      invalidationBlocks = v5->_invalidationBlocks;
    }
    v9 = _Block_copy(aBlock);
    [(NSMutableOrderedSet *)invalidationBlocks addObject:v9];

    objc_sync_exit(v5);
    id v4 = aBlock;
  }
}

- (void)invalidateWithReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NCAssertion *)self isValid])
  {
    v5 = self;
    objc_sync_enter(v5);
    v5->_valid = 0;
    uint64_t v6 = [v4 copy];
    invalidationReason = v5->_invalidationReason;
    v5->_invalidationReason = (NSString *)v6;

    v8 = *MEMORY[0x1E4FB3798];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3798], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "Assertion did invalidate: %{public}@", buf, 0xCu);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v9 = v5->_invalidationBlocks;
    uint64_t v10 = [(NSMutableOrderedSet *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableOrderedSet *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    invalidationBlocks = v5->_invalidationBlocks;
    v5->_invalidationBlocks = 0;

    objc_sync_exit(v5);
  }
  else
  {
    v14 = *MEMORY[0x1E4FB3798];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3798], OS_LOG_TYPE_ERROR)) {
      -[NCAssertion invalidateWithReason:]((uint64_t)self, v14);
    }
  }
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSString)instantiationReason
{
  return self->_instantiationReason;
}

- (NSString)invalidationReason
{
  return self->_invalidationReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationReason, 0);
  objc_storeStrong((id *)&self->_instantiationReason, 0);

  objc_storeStrong((id *)&self->_invalidationBlocks, 0);
}

- (void)invalidateWithReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_ERROR, "Attempt to invalidate invalid assertion: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end