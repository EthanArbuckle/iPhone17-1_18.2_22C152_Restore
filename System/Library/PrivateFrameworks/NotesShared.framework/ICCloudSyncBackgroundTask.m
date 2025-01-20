@interface ICCloudSyncBackgroundTask
+ (id)makeTaskRequest;
- (ICCloudContext)cloudContext;
- (ICCloudSyncBackgroundTask)initWithCloudContext:(id)a3;
- (void)handleTaskExpiration;
- (void)runTaskWithCompletion:(id)a3;
@end

@implementation ICCloudSyncBackgroundTask

+ (id)makeTaskRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F18B40]) initWithIdentifier:@"com.apple.notes.cloud.backgroundSync"];
  [v2 setRequiresNetworkConnectivity:1];
  [v2 setRequiresExternalPower:1];
  return v2;
}

- (ICCloudSyncBackgroundTask)initWithCloudContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCloudSyncBackgroundTask;
  v6 = [(ICCloudSyncBackgroundTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cloudContext, a3);
  }

  return v7;
}

- (void)runTaskWithCompletion:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F837E8] postBasicEvent:24];
  id v5 = [(ICCloudSyncBackgroundTask *)self cloudContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ICCloudSyncBackgroundTask_runTaskWithCompletion___block_invoke;
  v7[3] = &unk_1E64A4418;
  id v8 = v4;
  id v6 = v4;
  [v5 syncWithReason:@"BackgroundSyncTask" completionHandler:v7];
}

void __51__ICCloudSyncBackgroundTask_runTaskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5) {
    uint64_t v3 = 13;
  }
  else {
    uint64_t v3 = 12;
  }
  [MEMORY[0x1E4F837E8] postBasicEvent:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)handleTaskExpiration
{
  [MEMORY[0x1E4F837E8] postBasicEvent:14];
  uint64_t v3 = [(ICCloudSyncBackgroundTask *)self cloudContext];
  [v3 cancelEverythingWithCompletionHandler:0];

  id v4 = +[ICBackgroundTaskScheduler sharedScheduler];
  [v4 scheduleTask:objc_opt_class() completion:0];
}

- (ICCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void).cxx_destruct
{
}

@end