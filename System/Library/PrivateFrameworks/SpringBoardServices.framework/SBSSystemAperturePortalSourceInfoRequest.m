@interface SBSSystemAperturePortalSourceInfoRequest
+ (SBSPortalSource)_portalSource;
+ (void)_setPortalSource:(id)a3;
+ (void)rootWindowPortalSourceWithCompletion:(id)a3;
@end

@implementation SBSSystemAperturePortalSourceInfoRequest

+ (void)rootWindowPortalSourceWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_RequestLock);
  v5 = [a1 _portalSource];

  if (v5
    || ([MEMORY[0x1E4F28B50] mainBundle],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 bundleIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:@"com.apple.springboard"],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    if (v4)
    {
      v9 = [a1 _portalSource];
      v4[2](v4, v9);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F50BB8];
    v11 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v12 = +[SBSSystemAperturePortalSourceInfoRequestServiceSpecification identifier];
    v13 = [v10 endpointForMachName:v11 service:v12 instance:0];

    if (v13)
    {
      v14 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v13];
    }
    else
    {
      v14 = 0;
    }
    [v14 configureConnection:&__block_literal_global_38];
    [v14 activate];
    v15 = [v14 remoteTarget];

    if (v15)
    {
      v16 = SBLogSystemApertureHosting();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FBC5000, v16, OS_LOG_TYPE_DEFAULT, "System Aperture Portal Source request connection handled-requested.", buf, 2u);
      }

      v17 = [v14 remoteTarget];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_8;
      v21 = &unk_1E566D438;
      id v23 = a1;
      v22 = v4;
      [v17 rootWindowPortalSourceWithCompletion:&v18];
    }
    [v14 invalidate:v18, v19, v20, v21];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_RequestLock);
}

void __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = +[SBSSystemAperturePortalSourceInfoRequestServiceSpecification interface];
  [v4 setInterface:v2];

  v3 = +[SBSSystemAperturePortalSourceInfoRequestServiceSpecification serviceQuality];
  [v4 setServiceQuality:v3];

  [v4 setInvalidationHandler:&__block_literal_global_7_3];
}

void __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_2()
{
  v0 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_2_cold_1(v0);
  }
}

void __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = SBLogSystemApertureHosting();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v9 = "System Aperture Portal Source request connection handled succcessfully.";
    v10 = v7;
    uint32_t v11 = 2;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543362;
    id v18 = v6;
    v9 = "System Aperture Portal Source request connection handled with failure. Error: %{public}@";
    v10 = v7;
    uint32_t v11 = 12;
  }
  _os_log_impl(&dword_18FBC5000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  [*(id *)(a1 + 40) _setPortalSource:v5];
  if (*(void *)(a1 + 32))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_9;
    v14[3] = &unk_1E566BB80;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v15 = v12;
    uint64_t v16 = v13;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

void __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _portalSource];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (SBSPortalSource)_portalSource
{
  os_unfair_lock_lock(&_PortalSourceLock);
  id v2 = (id)_PortalSourceLock_SBSSystemApertureRootWindowPortalSource;
  os_unfair_lock_unlock(&_PortalSourceLock);
  return (SBSPortalSource *)v2;
}

+ (void)_setPortalSource:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock(&_PortalSourceLock);
  id v4 = (void *)_PortalSourceLock_SBSSystemApertureRootWindowPortalSource;
  _PortalSourceLock_SBSSystemApertureRootWindowPortalSource = (uint64_t)v3;

  os_unfair_lock_unlock(&_PortalSourceLock);
}

void __81__SBSSystemAperturePortalSourceInfoRequest_rootWindowPortalSourceWithCompletion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "System Aperture Portal Source request connection invalidated remotely.", v1, 2u);
}

@end