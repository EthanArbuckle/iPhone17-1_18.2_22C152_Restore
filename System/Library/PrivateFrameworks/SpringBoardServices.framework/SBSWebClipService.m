@interface SBSWebClipService
+ (id)_setupAndActivateServiceConnection;
+ (void)launchWebClipWithIdentifier:(id)a3;
+ (void)launchWebClipWithIdentifier:(id)a3 origin:(unint64_t)a4;
+ (void)updateWebClipPropertiesWithIdentifier:(id)a3;
@end

@implementation SBSWebClipService

+ (void)launchWebClipWithIdentifier:(id)a3
{
}

+ (void)launchWebClipWithIdentifier:(id)a3 origin:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = SBLogWebClip();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = (void *)v9;
    if (a4 > 3) {
      v11 = @"Unknown";
    }
    else {
      v11 = off_1E566CA18[a4];
    }
    int v15 = 138543874;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_18FBC5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Received request to launch web clip with identifier: %{public}@ origin:%{public}@", (uint8_t *)&v15, 0x20u);
  }
  v12 = [a1 _setupAndActivateServiceConnection];
  v13 = [v12 remoteTarget];
  v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  [v13 launchWebClipWithIdentifier:v6 origin:v14];

  [v12 invalidate];
}

+ (void)updateWebClipPropertiesWithIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogWebClip();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v10 = 138543618;
    v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Received request to update web clip properties with identifier: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v8 = [a1 _setupAndActivateServiceConnection];
  uint64_t v9 = [v8 remoteTarget];
  [v9 updateWebClipPropertiesWithIdentifier:v4];

  [v8 invalidate];
}

+ (id)_setupAndActivateServiceConnection
{
  v3 = (void *)MEMORY[0x1E4F50BB8];
  id v4 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  v5 = +[SBSWebClipServiceSessionSpecification identifier];
  id v6 = [v3 endpointForMachName:v4 service:v5 instance:0];

  v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke;
  v9[3] = &__block_descriptor_40_e42_v16__0___BSServiceConnectionConfiguring__8l;
  v9[4] = a1;
  [v7 configureConnection:v9];
  [v7 activate];

  return v7;
}

void __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[SBSWebClipServiceSessionSpecification interface];
  [v2 setInterface:v3];

  id v4 = +[SBSWebClipServiceSessionSpecification serviceQuality];
  [v2 setServiceQuality:v4];

  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_2;
  v14[3] = &unk_1E566C9D8;
  id v7 = v6;
  id v15 = v7;
  [v2 setActivationHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_17;
  v12[3] = &unk_1E566C9D8;
  id v8 = v7;
  id v13 = v8;
  [v2 setInterruptionHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_18;
  v10[3] = &unk_1E566C9D8;
  id v11 = v8;
  id v9 = v8;
  [v2 setInvalidationHandler:v10];
}

void __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogWebClip();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Received activation for connection: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogWebClip();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Received interruption for connection: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __55__SBSWebClipService__setupAndActivateServiceConnection__block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogWebClip();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Received invalidation for connection: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

@end