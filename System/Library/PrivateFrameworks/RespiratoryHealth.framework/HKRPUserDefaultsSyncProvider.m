@interface HKRPUserDefaultsSyncProvider
- (HKRPUserDefaultsSyncProvider)initWithUserDefaultsDomain:(id)a3;
- (NSString)userDefaultsDomain;
- (void)synchronizeKeys:(id)a3;
@end

@implementation HKRPUserDefaultsSyncProvider

- (HKRPUserDefaultsSyncProvider)initWithUserDefaultsDomain:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKRPUserDefaultsSyncProvider;
  v5 = [(HKRPUserDefaultsSyncProvider *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    userDefaultsDomain = v5->_userDefaultsDomain;
    v5->_userDefaultsDomain = (NSString *)v6;

    v8 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    manager = v5->_manager;
    v5->_manager = v8;
  }
  return v5;
}

- (void)synchronizeKeys:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    v7 = objc_opt_class();
    userDefaultsDomain = self->_userDefaultsDomain;
    *(_DWORD *)v10 = 138543874;
    *(void *)&v10[4] = v7;
    *(_WORD *)&v10[12] = 2114;
    *(void *)&v10[14] = userDefaultsDomain;
    *(_WORD *)&v10[22] = 2114;
    id v11 = v4;
    id v9 = v7;
    _os_log_impl(&dword_21D42F000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting NanoSync to sync %{public}@ user defaults domain for keys: %{public}@", v10, 0x20u);
  }
  -[NPSManager synchronizeUserDefaultsDomain:keys:](self->_manager, "synchronizeUserDefaultsDomain:keys:", self->_userDefaultsDomain, v4, *(_OWORD *)v10, *(void *)&v10[16], v11);
}

- (NSString)userDefaultsDomain
{
  return self->_userDefaultsDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsDomain, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end