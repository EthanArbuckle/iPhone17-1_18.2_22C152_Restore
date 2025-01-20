@interface TRIPETLogHandler
- (void)logEvent:(id)a3 subgroupName:(id)a4 queue:(id)a5;
@end

@implementation TRIPETLogHandler

- (void)logEvent:(id)a3 subgroupName:(id)a4 queue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__TRIPETLogHandler_logEvent_subgroupName_queue___block_invoke;
  v11[3] = &unk_1E596A260;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)a5, v11);
}

void __48__TRIPETLogHandler_logEvent_subgroupName_queue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [MEMORY[0x1E4F93728] sharedInstance];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v2) {
    [v3 logMessage:v4 subGroup:*(void *)(a1 + 32)];
  }
  else {
    [v3 logMessage:v4];
  }
}

@end