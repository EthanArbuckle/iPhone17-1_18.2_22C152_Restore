@interface FCCoreConfigurationFetchedValueDescriptor
- (BOOL)isValue:(id)a3 equalToValue:(id)a4;
- (FCCoreConfigurationFetchedValueDescriptor)init;
- (FCCoreConfigurationFetchedValueDescriptor)initWithConfigurationManager:(id)a3;
- (FCCoreConfigurationManager)configurationManager;
- (id)fastCachedValue;
- (id)inputManagers;
- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
@end

@implementation FCCoreConfigurationFetchedValueDescriptor

- (BOOL)isValue:(id)a3 equalToValue:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "left");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCCoreConfigurationFetchedValueDescriptor isValue:equalToValue:]";
    __int16 v12 = 2080;
    v13 = "FCCoreConfigurationFetchedValueDescriptor.m";
    __int16 v14 = 1024;
    int v15 = 65;
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "right");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCCoreConfigurationFetchedValueDescriptor isValue:equalToValue:]";
    __int16 v12 = 2080;
    v13 = "FCCoreConfigurationFetchedValueDescriptor.m";
    __int16 v14 = 1024;
    int v15 = 66;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:

  return v5 == v6;
}

- (FCCoreConfigurationFetchedValueDescriptor)initWithConfigurationManager:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configurationManager");
    *(_DWORD *)buf = 136315906;
    __int16 v12 = "-[FCCoreConfigurationFetchedValueDescriptor initWithConfigurationManager:]";
    __int16 v13 = 2080;
    __int16 v14 = "FCCoreConfigurationFetchedValueDescriptor.m";
    __int16 v15 = 1024;
    int v16 = 30;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCCoreConfigurationFetchedValueDescriptor;
  id v6 = [(FCFetchedValueDescriptor *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configurationManager, a3);
  }

  return v7;
}

- (id)inputManagers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)fastCachedValue
{
  v2 = [(FCCoreConfigurationFetchedValueDescriptor *)self configurationManager];
  v3 = [v2 configuration];

  return v3;
}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v6 = a5;
  v7 = [(FCCoreConfigurationFetchedValueDescriptor *)self configurationManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__FCCoreConfigurationFetchedValueDescriptor_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke;
  v9[3] = &unk_1E5B4EEC8;
  id v10 = v6;
  id v8 = v6;
  [v7 fetchConfigurationIfNeededWithCompletion:v9];
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

uint64_t __99__FCCoreConfigurationFetchedValueDescriptor_fetchValueWithCachePolicy_qualityOfService_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

- (FCCoreConfigurationFetchedValueDescriptor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCCoreConfigurationFetchedValueDescriptor init]";
    __int16 v9 = 2080;
    id v10 = "FCCoreConfigurationFetchedValueDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 25;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCoreConfigurationFetchedValueDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

@end