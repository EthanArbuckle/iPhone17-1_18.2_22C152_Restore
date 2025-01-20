@interface _PICompositionControllerTransaction
- (BOOL)commit;
- (NSArray)changes;
- (_PICompositionControllerTransaction)init;
- (void)begin;
- (void)didAddAdjustment:(id)a3;
- (void)didRemoveAdjustment:(id)a3;
- (void)didUpdateAdjustment:(id)a3;
- (void)didUpdateAdjustments:(id)a3;
@end

@implementation _PICompositionControllerTransaction

- (void).cxx_destruct
{
}

- (NSArray)changes
{
  return (NSArray *)[(NSMutableSet *)self->_changes allObjects];
}

- (void)didUpdateAdjustments:(id)a3
{
}

- (void)didUpdateAdjustment:(id)a3
{
}

- (void)didRemoveAdjustment:(id)a3
{
}

- (void)didAddAdjustment:(id)a3
{
}

- (BOOL)commit
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t count = self->_count;
  if (!count)
  {
    v5 = NUAssertLogger_1518();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [NSString stringWithFormat:@"Invalid transaction count"];
      int v18 = 138543362;
      v19 = v6;
      _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v18, 0xCu);
    }
    v7 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v9 = NUAssertLogger_1518();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific(*v7);
        v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        int v18 = 138543618;
        v19 = v13;
        __int16 v20 = 2114;
        v21 = v17;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v18, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      int v18 = 138543362;
      v19 = v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v18, 0xCu);
    }
    _NUAssertFailHandler();
  }
  unint64_t v3 = count - 1;
  self->_unint64_t count = v3;
  return v3 == 0;
}

- (void)begin
{
}

- (_PICompositionControllerTransaction)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PICompositionControllerTransaction;
  v2 = [(_PICompositionControllerTransaction *)&v6 init];
  unint64_t v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  changes = v2->_changes;
  v2->_changes = v3;

  return v2;
}

@end