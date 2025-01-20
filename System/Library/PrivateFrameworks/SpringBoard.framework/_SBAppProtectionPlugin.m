@interface _SBAppProtectionPlugin
- (SBAppProtectionCoordinator)_owningCoordinator;
- (void)setApplication:(id)a3 shielded:(BOOL)a4 forOutlet:(id)a5 completion:(id)a6;
- (void)set_owningCoordinator:(id)a3;
@end

@implementation _SBAppProtectionPlugin

- (void)setApplication:(id)a3 shielded:(BOOL)a4 forOutlet:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  v10 = SBLogAppProtection();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v8;
    __int16 v16 = 1024;
    BOOL v17 = v7;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ shielded: %{BOOL}u", buf, 0x12u);
  }

  v13 = v8;
  id v11 = v9;
  id v12 = v8;
  BSDispatchMain();
}

- (SBAppProtectionCoordinator)_owningCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__owningCoordinator);
  return (SBAppProtectionCoordinator *)WeakRetained;
}

- (void)set_owningCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end