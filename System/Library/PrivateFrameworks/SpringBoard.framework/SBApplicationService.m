@interface SBApplicationService
+ (id)sharedInstance;
- (id)_initWithApplicationController:(id)a3;
- (void)applicationServer:(id)a3 client:(id)a4 deleteSnapshotsForApplicationIdentifier:(id)a5;
@end

@implementation SBApplicationService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_57);
  }
  v2 = (void *)sharedInstance___sharedInstance_4;
  return v2;
}

void __38__SBApplicationService_sharedInstance__block_invoke()
{
  v0 = [SBApplicationService alloc];
  id v3 = +[SBApplicationController sharedInstance];
  uint64_t v1 = [(SBApplicationService *)v0 _initWithApplicationController:v3];
  v2 = (void *)sharedInstance___sharedInstance_4;
  sharedInstance___sharedInstance_4 = v1;
}

- (id)_initWithApplicationController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBApplicationService;
  v6 = [(SBApplicationService *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_applicationController, a3);
    v8 = +[SBApplicationServer sharedInstance];
    [v8 setMiscDelegate:v7];
  }
  return v7;
}

- (void)applicationServer:(id)a3 client:(id)a4 deleteSnapshotsForApplicationIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 processHandle];
  if (([v9 hasEntitlement:@"com.apple.frontboard.delete-application-snapshots"] & 1) != 0
    || [v9 hasEntitlement:@"com.apple.springboard.delete-application-snapshots"])
  {
    objc_super v10 = [(SBApplicationController *)self->_applicationController applicationWithBundleIdentifier:v8];
    v11 = v10;
    if (v10)
    {
      [v10 deleteAllSnapshots];
      [v11 _clearSceneTitles];
    }
  }
  else
  {
    v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBApplicationService applicationServer:client:deleteSnapshotsForApplicationIdentifier:]((uint64_t)v8, (uint64_t)v7, v11);
    }
  }
}

- (void).cxx_destruct
{
}

- (void)applicationServer:(uint64_t)a1 client:(uint64_t)a2 deleteSnapshotsForApplicationIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Unable to delete snapshots for bundle identifier: %{public}@ because client: %{public}@ does not have the proper authorization permissions required.", (uint8_t *)&v3, 0x16u);
}

@end