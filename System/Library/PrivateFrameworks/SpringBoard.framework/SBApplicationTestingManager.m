@interface SBApplicationTestingManager
+ (id)sharedInstance;
- (NSMutableDictionary)_idleTimerDisableAssertions;
- (NSString)currentTestName;
- (NSString)scrollTestActiveSubtest;
- (SBApplicationTestingManager)init;
- (void)_handleTestEnded;
- (void)_installTestEndedHandler:(id)a3;
- (void)_prepareForTestStartup:(id)a3;
- (void)installNotificationObserverForNotificationName:(id)a3 forOneNotification:(BOOL)a4 usingBlock:(id)a5;
- (void)installNotificationObserverForNotificationName:(id)a3 notificationCenter:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6;
- (void)markUserLaunchInitiationTime;
- (void)setCurrentTestName:(id)a3;
- (void)setScrollTestActiveSubtest:(id)a3;
- (void)setupKeyboardAnimationSubTestsForTestName:(id)a3;
@end

@implementation SBApplicationTestingManager

+ (id)sharedInstance
{
  v2 = (void *)sharedInstance_sharedInstance_2;
  if (!sharedInstance_sharedInstance_2)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBApplicationTestingManager);
    v4 = (void *)sharedInstance_sharedInstance_2;
    sharedInstance_sharedInstance_2 = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)sharedInstance_sharedInstance_2;
  }
  return v2;
}

- (void)markUserLaunchInitiationTime
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [(SBApplicationTestingManager *)self currentTestName];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
    strncpy(__dst, (const char *)[v4 UTF8String], 0x10uLL);
    [v4 hash];
    [v4 length];
    kdebug_trace();
  }
}

- (NSString)currentTestName
{
  return self->_currentTestName;
}

- (void)setCurrentTestName:(id)a3
{
}

- (SBApplicationTestingManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBApplicationTestingManager;
  v2 = [(SBApplicationTestingManager *)&v6 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;
  }
  return v2;
}

- (void)setupKeyboardAnimationSubTestsForTestName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v6 = *MEMORY[0x1E4F43B88];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke;
  v27[3] = &unk_1E6B02DA8;
  id v7 = v5;
  id v28 = v7;
  id v8 = v4;
  id v29 = v8;
  [(SBApplicationTestingManager *)self installNotificationObserverForNotificationName:v6 forOneNotification:1 usingBlock:v27];
  uint64_t v9 = *MEMORY[0x1E4F43AC8];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_2;
  v24[3] = &unk_1E6B02DA8;
  id v10 = v7;
  id v25 = v10;
  id v11 = v8;
  id v26 = v11;
  [(SBApplicationTestingManager *)self installNotificationObserverForNotificationName:v9 forOneNotification:1 usingBlock:v24];
  uint64_t v12 = *MEMORY[0x1E4F43B80];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_3;
  v21[3] = &unk_1E6B02DA8;
  id v13 = v10;
  id v22 = v13;
  id v14 = v11;
  id v23 = v14;
  [(SBApplicationTestingManager *)self installNotificationObserverForNotificationName:v12 forOneNotification:1 usingBlock:v21];
  uint64_t v15 = *MEMORY[0x1E4F43AC0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_4;
  v18[3] = &unk_1E6B02DA8;
  id v19 = v13;
  id v20 = v14;
  id v16 = v14;
  id v17 = v13;
  [(SBApplicationTestingManager *)self installNotificationObserverForNotificationName:v15 forOneNotification:1 usingBlock:v18];
}

uint64_t __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startedSubTest:@"keyboardShowing" forTest:*(void *)(a1 + 40)];
}

uint64_t __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedSubTest:@"keyboardShowing" forTest:*(void *)(a1 + 40)];
}

uint64_t __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) startedSubTest:@"keyboardHiding" forTest:*(void *)(a1 + 40)];
}

uint64_t __73__SBApplicationTestingManager_setupKeyboardAnimationSubTestsForTestName___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedSubTest:@"keyboardHiding" forTest:*(void *)(a1 + 40)];
}

- (void)installNotificationObserverForNotificationName:(id)a3 notificationCenter:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  }
  id v13 = v12;
  id v14 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__59;
  v34 = __Block_byref_object_dispose__59;
  id v35 = 0;
  id v15 = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __127__SBApplicationTestingManager_installNotificationObserverForNotificationName_notificationCenter_forOneNotification_usingBlock___block_invoke;
  v25[3] = &unk_1E6B02DD0;
  id v28 = &v30;
  BOOL v29 = a5;
  id v16 = v15;
  id v26 = v16;
  id v17 = v11;
  id v27 = v17;
  uint64_t v18 = [v16 addObserverForName:v9 object:0 queue:v14 usingBlock:v25];
  id v19 = (void *)v31[5];
  v31[5] = v18;

  id v20 = +[SBApplicationTestingManager sharedInstance];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __127__SBApplicationTestingManager_installNotificationObserverForNotificationName_notificationCenter_forOneNotification_usingBlock___block_invoke_2;
  v22[3] = &unk_1E6AF4B88;
  v24 = &v30;
  id v21 = v16;
  id v23 = v21;
  [v20 _installTestEndedHandler:v22];

  _Block_object_dispose(&v30, 8);
}

void __127__SBApplicationTestingManager_installNotificationObserverForNotificationName_notificationCenter_forOneNotification_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = v3;
    if (*(unsigned char *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObserver:");
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v4 = v7;
  }
}

void __127__SBApplicationTestingManager_installNotificationObserverForNotificationName_notificationCenter_forOneNotification_usingBlock___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:");
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
}

- (void)installNotificationObserverForNotificationName:(id)a3 forOneNotification:(BOOL)a4 usingBlock:(id)a5
{
}

- (void)_prepareForTestStartup:(id)a3
{
  id v11 = a3;
  id v4 = [NSString stringWithFormat:@"PPT Test %@", v11];
  uint64_t v5 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  uint64_t v6 = [v5 acquireIdleTimerDisableAssertionForReason:v4];

  idleTimerDisableAssertions = self->_idleTimerDisableAssertions;
  if (!idleTimerDisableAssertions)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = self->_idleTimerDisableAssertions;
    self->_idleTimerDisableAssertions = v8;

    idleTimerDisableAssertions = self->_idleTimerDisableAssertions;
  }
  id v10 = [(NSMutableDictionary *)idleTimerDisableAssertions objectForKey:v11];

  if (!v10) {
    [(NSMutableDictionary *)self->_idleTimerDisableAssertions setObject:v6 forKey:v11];
  }
}

- (void)_handleTestEnded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBApplicationTestingManager *)self _idleTimerDisableAssertions];
  id v4 = [(SBApplicationTestingManager *)self currentTestName];
  uint64_t v5 = [v3 objectForKey:v4];

  if (v5)
  {
    [v5 invalidate];
    uint64_t v6 = [(SBApplicationTestingManager *)self _idleTimerDisableAssertions];
    id v7 = [(SBApplicationTestingManager *)self currentTestName];
    [v6 removeObjectForKey:v7];
  }
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:@"SBApplicationDidExitNotification" object:0];

  [(SBApplicationTestingManager *)self setCurrentTestName:0];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__59;
  id v23 = __Block_byref_object_dispose__59;
  id v24 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBApplicationTestingManager__handleTestEnded__block_invoke;
  block[3] = &unk_1E6AF4B88;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(queue, block);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v10 = (id)v20[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v25 count:16];
    }
    while (v11);
  }

  _Block_object_dispose(&v19, 8);
}

void __47__SBApplicationTestingManager__handleTestEnded__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = 0;
}

- (void)_installTestEndedHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBApplicationTestingManager *)self currentTestName];

  if (v5)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__SBApplicationTestingManager__installTestEndedHandler___block_invoke;
    v7[3] = &unk_1E6AF6828;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

void __56__SBApplicationTestingManager__installTestEndedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  id v6 = (id)MEMORY[0x1D948C7A0](*(void *)(a1 + 40));
  [v2 addObject:v6];
}

- (NSMutableDictionary)_idleTimerDisableAssertions
{
  return self->_idleTimerDisableAssertions;
}

- (NSString)scrollTestActiveSubtest
{
  return self->_scrollTestActiveSubtest;
}

- (void)setScrollTestActiveSubtest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollTestActiveSubtest, 0);
  objc_storeStrong((id *)&self->_currentTestName, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertions, 0);
  objc_storeStrong((id *)&self->_queue_testEndedHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end