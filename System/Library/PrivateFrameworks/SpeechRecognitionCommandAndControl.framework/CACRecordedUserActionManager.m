@interface CACRecordedUserActionManager
+ (id)sharedManager;
- (BOOL)isExecuting;
- (BOOL)isRecording;
- (CACRecordedUserActionManager)init;
- (id)recordedUserActionFlow;
- (void)addRecognizedSpokenCommand:(id)a3;
- (void)beginExecutingRecordedUserActionFlow:(id)a3 completionBlock:(id)a4;
- (void)cancelExecution;
- (void)startRecordingUserActions;
- (void)stopRecordingUserActions;
@end

@implementation CACRecordedUserActionManager

+ (id)sharedManager
{
  if (sharedManager_singletonInit != -1) {
    dispatch_once(&sharedManager_singletonInit, &__block_literal_global_2);
  }
  v2 = (void *)sCACRecordedUserActionManager;
  return v2;
}

uint64_t __45__CACRecordedUserActionManager_sharedManager__block_invoke()
{
  sCACRecordedUserActionManager = objc_alloc_init(CACRecordedUserActionManager);
  return MEMORY[0x270F9A758]();
}

- (CACRecordedUserActionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CACRecordedUserActionManager;
  v2 = [(CACRecordedUserActionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordedUserActions = v2->_recordedUserActions;
    v2->_recordedUserActions = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addRecognizedSpokenCommand:(id)a3
{
  id v8 = a3;
  v4 = [v8 identifier];
  v5 = v4;
  if (self->_isRecording
    && ([v4 isEqualToString:@"System.StartRecordingCommands"] & 1) == 0
    && ([v5 isEqualToString:@"System.StopRecordingCommands"] & 1) == 0)
  {
    recordedUserActions = self->_recordedUserActions;
    v7 = [[CACRecordedUserAction alloc] initWithSpokenCommand:v8];
    [(NSMutableArray *)recordedUserActions addObject:v7];
  }
}

- (void)startRecordingUserActions
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableArray *)obj->_recordedUserActions removeAllObjects];
  obj->_isRecording = 1;
  objc_sync_exit(obj);
}

- (void)stopRecordingUserActions
{
  obj = self;
  objc_sync_enter(obj);
  obj->_isRecording = 0;
  objc_sync_exit(obj);
}

- (id)recordedUserActionFlow
{
  v2 = [[CACRecordedUserActionFlow alloc] initWithUserActions:self->_recordedUserActions];
  return v2;
}

- (void)beginExecutingRecordedUserActionFlow:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (v9->_isExecuting)
  {
    objc_sync_exit(v9);
  }
  else
  {
    v9->_isExecuting = 1;
    objc_storeStrong((id *)&v9->_executingUserActionFlow, a3);
    objc_sync_exit(v9);

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __85__CACRecordedUserActionManager_beginExecutingRecordedUserActionFlow_completionBlock___block_invoke;
    v10[3] = &unk_264D11990;
    v10[4] = v9;
    id v11 = v8;
    [v7 beginExecutingWithCompletionBlock:v10];
  }
}

void __85__CACRecordedUserActionManager_beginExecutingRecordedUserActionFlow_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v7 = a2;
  objc_sync_enter(v4);
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  objc_super v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = 0;

  objc_sync_exit(v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelExecution
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_isRecording && obj->_isExecuting)
  {
    executingUserActionFlow = obj->_executingUserActionFlow;
    if (executingUserActionFlow) {
      [(CACRecordedUserActionFlow *)executingUserActionFlow cancelExecution];
    }
  }
  objc_sync_exit(obj);
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executingUserActionFlow, 0);
  objc_storeStrong((id *)&self->_recordedUserActions, 0);
}

@end