@interface PLCloudPhotoLibraryUserSwitchHandler
- (PLCloudPhotoLibraryUserSwitchHandler)init;
- (PLCloudUserSessionHandling)sessionHandler;
- (void)dealloc;
- (void)setSessionHandler:(id)a3;
- (void)willSwitchUser;
@end

@implementation PLCloudPhotoLibraryUserSwitchHandler

- (void).cxx_destruct
{
}

- (void)setSessionHandler:(id)a3
{
}

- (PLCloudUserSessionHandling)sessionHandler
{
  return (PLCloudUserSessionHandling *)objc_getProperty(self, a2, 8, 1);
}

- (void)willSwitchUser
{
  v2 = [(PLCloudPhotoLibraryUserSwitchHandler *)self sessionHandler];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB3720] taskWithName:@"CPLEnqueuePendingUploads" reason:@"Enqueing pending derivative generation and CPL uploads" forBundleID:@"com.apple.cloudphotod"];
    [v3 begin];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__PLCloudPhotoLibraryUserSwitchHandler_willSwitchUser__block_invoke;
    v5[3] = &unk_1E5875CE0;
    id v6 = v3;
    id v4 = v3;
    [v2 endUserSessionWithCompletionHandler:v5];
  }
}

uint64_t __54__PLCloudPhotoLibraryUserSwitchHandler_willSwitchUser__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) end];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  [v3 unregisterStakeHolder:self status:0 reason:@"dealloc"];

  v4.receiver = self;
  v4.super_class = (Class)PLCloudPhotoLibraryUserSwitchHandler;
  [(PLCloudPhotoLibraryUserSwitchHandler *)&v4 dealloc];
}

- (PLCloudPhotoLibraryUserSwitchHandler)init
{
  if ((PLIsEDUMode() & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PLCloudPhotoLibraryUserSwitchHandler.m" lineNumber:23 description:@"Should only be created in EDU mode"];
  }
  v8.receiver = self;
  v8.super_class = (Class)PLCloudPhotoLibraryUserSwitchHandler;
  objc_super v4 = [(PLCloudPhotoLibraryUserSwitchHandler *)&v8 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB36F8] sharedManager];
    [v5 registerUserSwitchStakeHolder:v4];
  }
  return v4;
}

@end