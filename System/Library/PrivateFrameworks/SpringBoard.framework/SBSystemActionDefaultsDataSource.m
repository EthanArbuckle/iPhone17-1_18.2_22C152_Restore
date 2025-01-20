@interface SBSystemActionDefaultsDataSource
- (id)executorForSystemAction:(id)a3;
- (id)initWithDefaults:(void *)a3 instanceIdentity:;
- (void)updateSelectedAction;
@end

@implementation SBSystemActionDefaultsDataSource

- (id)initWithDefaults:(void *)a3 instanceIdentity:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (a1)
  {
    if (!v6)
    {
      v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"defaults != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionDefaultsDataSource initWithDefaults:instanceIdentity:](sel_initWithDefaults_instanceIdentity_, (uint64_t)a1, (uint64_t)v17);
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8940F88);
    }
    if (!v7)
    {
      v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"instanceIdentity != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionDefaultsDataSource initWithDefaults:instanceIdentity:](sel_initWithDefaults_instanceIdentity_, (uint64_t)a1, (uint64_t)v18);
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8940FECLL);
    }
    objc_storeStrong(a1 + 5, a2);
    uint64_t v9 = [v8 copyWithZone:0];
    id v10 = a1[6];
    a1[6] = (id)v9;

    v11 = [v8 hostIdentifier];
    v22.receiver = a1;
    v22.super_class = (Class)SBSystemActionDefaultsDataSource;
    a1 = (id *)objc_msgSendSuper2(&v22, sel_initWithHostIdentifier_, v11);

    if (a1)
    {
      objc_initWeak(&location, a1);
      v12 = [NSString stringWithUTF8String:"configuredActionArchive"];
      v23[0] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      id v14 = MEMORY[0x1E4F14428];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __70__SBSystemActionDefaultsDataSource_initWithDefaults_instanceIdentity___block_invoke;
      v19[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v20, &location);
      id v15 = (id)[v6 observeDefaults:v13 onQueue:MEMORY[0x1E4F14428] withBlock:v19];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __70__SBSystemActionDefaultsDataSource_initWithDefaults_instanceIdentity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSelectedAction];
}

- (id)executorForSystemAction:(id)a3
{
  v3 = (void *)[a3 newExecutor];
  return v3;
}

- (void)updateSelectedAction
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "(%{public}@) Error unarchiving configured action: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceIdentity, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)initWithDefaults:(uint64_t)a3 instanceIdentity:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  __int16 v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_6_1();
  uint64_t v9 = @"SBSystemActionDefaultsDataSource.m";
  __int16 v10 = 1024;
  int v11 = 30;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithDefaults:(uint64_t)a3 instanceIdentity:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  __int16 v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_6_1();
  uint64_t v9 = @"SBSystemActionDefaultsDataSource.m";
  __int16 v10 = 1024;
  int v11 = 31;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end