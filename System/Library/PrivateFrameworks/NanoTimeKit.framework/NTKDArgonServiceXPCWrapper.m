@interface NTKDArgonServiceXPCWrapper
+ (id)sharedXPCWrapper;
- (void)displayUserNotificationForKeyDescriptor:(id)a3 completion:(id)a4;
- (void)ingestKeyDescriptor:(id)a3 withMethod:(unint64_t)a4 completion:(id)a5;
- (void)knownKeyDescriptors:(id)a3;
- (void)queryForNewFaces:(id)a3;
- (void)requestCurrentEnvironment:(id)a3;
- (void)requestResetOnNextLaunch:(id)a3;
- (void)setCurrentEnvironment:(int64_t)a3 completion:(id)a4;
@end

@implementation NTKDArgonServiceXPCWrapper

- (void)queryForNewFaces:(id)a3
{
  id v3 = a3;
  id v4 = +[NTKDArgonService sharedService];
  [v4 queryForNewFaces:v3];
}

+ (id)sharedXPCWrapper
{
  if (sharedXPCWrapper_onceToken != -1) {
    dispatch_once(&sharedXPCWrapper_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedXPCWrapper_wrapper;

  return v2;
}

void __46__NTKDArgonServiceXPCWrapper_sharedXPCWrapper__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedXPCWrapper_wrapper;
  sharedXPCWrapper_wrapper = v0;
}

- (void)ingestKeyDescriptor:(id)a3 withMethod:(unint64_t)a4 completion:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = a3;
    v9 = +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder];
    v10 = [v8 fileName];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__NTKDArgonServiceXPCWrapper_ingestKeyDescriptor_withMethod_completion___block_invoke;
    v13[3] = &unk_1E62C0D88;
    id v14 = v10;
    id v11 = v10;
    [v9 beginRecordingForIdentifier:v11 method:a4 completion:v13];
    v12 = +[NTKDArgonService sharedService];
    [v12 ingestKeyDescriptor:v8 withMethod:a4 completion:v7];
  }
}

void __72__NTKDArgonServiceXPCWrapper_ingestKeyDescriptor_withMethod_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __72__NTKDArgonServiceXPCWrapper_ingestKeyDescriptor_withMethod_completion___block_invoke_cold_1();
    }
  }
}

- (void)requestResetOnNextLaunch:(id)a3
{
  id v3 = a3;
  id v4 = +[NTKDArgonService sharedService];
  [v4 requestResetOnNextLaunch:v3];
}

- (void)knownKeyDescriptors:(id)a3
{
  id v3 = a3;
  id v4 = +[NTKDArgonService sharedService];
  [v4 knownKeyDescriptors:v3];
}

- (void)displayUserNotificationForKeyDescriptor:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NTKDArgonService sharedService];
  [v7 displayUserNotificationForKeyDescriptor:v6 completion:v5];
}

- (void)requestCurrentEnvironment:(id)a3
{
  id v3 = a3;
  id v4 = +[NTKDArgonService sharedService];
  [v4 requestCurrentEnvironment:v3];
}

- (void)setCurrentEnvironment:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[NTKDArgonService sharedService];
  [v6 setCurrentEnvironment:a3 completion:v5];
}

void __72__NTKDArgonServiceXPCWrapper_ingestKeyDescriptor_withMethod_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't ingest key from JSON %@ - %@");
}

@end