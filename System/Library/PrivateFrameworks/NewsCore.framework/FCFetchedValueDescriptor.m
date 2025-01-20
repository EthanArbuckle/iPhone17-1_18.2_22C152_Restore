@interface FCFetchedValueDescriptor
- (BOOL)isValue:(id)a3 equalToValue:(id)a4;
- (FCFetchedValueDescriptor)init;
- (FCFetchedValueDescriptorObserving)observer;
- (NSArray)inputManagers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fastCachedValue;
- (id)valuePromiseWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4;
- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)setObserver:(id)a3;
@end

@implementation FCFetchedValueDescriptor

- (void).cxx_destruct
{
}

- (FCFetchedValueDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCFetchedValueDescriptor;
  return [(FCFetchedValueDescriptor *)&v3 init];
}

- (void)setObserver:(id)a3
{
}

uint64_t __82__FCFetchedValueDescriptor_Promise__valuePromiseWithCachePolicy_qualityOfService___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __82__FCFetchedValueDescriptor_Promise__valuePromiseWithCachePolicy_qualityOfService___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__FCFetchedValueDescriptor_Promise__valuePromiseWithCachePolicy_qualityOfService___block_invoke_2;
  v12[3] = &unk_1E5B55420;
  id v13 = v6;
  id v14 = v5;
  id v10 = v5;
  id v11 = v6;
  [v7 fetchValueWithCachePolicy:v8 qualityOfService:v9 completion:v12];
}

- (id)valuePromiseWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4
{
  id v7 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__FCFetchedValueDescriptor_Promise__valuePromiseWithCachePolicy_qualityOfService___block_invoke;
  v10[3] = &unk_1E5B51E40;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  uint64_t v8 = (void *)[v7 initWithResolver:v10];
  return v8;
}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCFetchedValueDescriptor fetchValueWithCachePolicy:qualityOfService:completion:]";
    __int16 v13 = 2080;
    id v14 = "FCFetchedValueDescriptor.m";
    __int16 v15 = 1024;
    int v16 = 24;
    __int16 v17 = 2114;
    v18 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  uint64_t v9 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFetchedValueDescriptor fetchValueWithCachePolicy:qualityOfService:completion:]"];
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)fastCachedValue
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCFetchedValueDescriptor fastCachedValue]";
    __int16 v9 = 2080;
    id v10 = "FCFetchedValueDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 29;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFetchedValueDescriptor fastCachedValue]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCFetchedValueDescriptor isValue:equalToValue:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCFetchedValueDescriptor.m";
    __int16 v16 = 1024;
    int v17 = 34;
    __int16 v18 = 2114;
    uint64_t v19 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFetchedValueDescriptor isValue:equalToValue:]"];
  id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (NSArray)inputManagers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCFetchedValueDescriptor inputManagers]";
    __int16 v9 = 2080;
    id v10 = "FCFetchedValueDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 39;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFetchedValueDescriptor inputManagers]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_super v3 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v9 = "-[FCFetchedValueDescriptor copyWithZone:]";
    __int16 v10 = 2080;
    __int16 v11 = "FCFetchedValueDescriptor.m";
    __int16 v12 = 1024;
    int v13 = 45;
    __int16 v14 = 2114;
    uint64_t v15 = v3;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFetchedValueDescriptor copyWithZone:]"];
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (FCFetchedValueDescriptorObserving)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (FCFetchedValueDescriptorObserving *)WeakRetained;
}

@end