@interface SYApplicationStateObserver
- (BOOL)appIsActive;
- (SYApplicationStateObserver)initWithBecomeActiveHandler:(id)a3 resignActiveHandler:(id)a4;
- (void)_handleAppBecomeActive:(id)a3;
- (void)_handleAppResignActive:(id)a3;
- (void)_updateAppStateOnMainThread;
- (void)_updateAppStateWithCompletion:(id)a3;
- (void)registerForAppStateNotifications;
@end

@implementation SYApplicationStateObserver

- (BOOL)appIsActive
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_appStateIsActive);
  return v2 & 1;
}

- (void)_handleAppBecomeActive:(id)a3
{
  id v4 = a3;
  id becomeActiveHandler = self->_becomeActiveHandler;
  if (becomeActiveHandler)
  {
    v6 = (void *)[becomeActiveHandler copy];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__SYApplicationStateObserver__handleAppBecomeActive___block_invoke;
    v8[3] = &unk_1E64639B8;
    id v10 = v6;
    id v9 = v4;
    id v7 = v6;
    [(SYApplicationStateObserver *)self _updateAppStateWithCompletion:v8];
  }
}

- (SYApplicationStateObserver)initWithBecomeActiveHandler:(id)a3 resignActiveHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SYApplicationStateObserver;
  v8 = [(SYApplicationStateObserver *)&v15 init];
  id v9 = v8;
  if (v8)
  {
    atomic_store(0, (unsigned __int8 *)&v8->_appStateIsActive);
    uint64_t v10 = [v6 copy];
    id becomeActiveHandler = v9->_becomeActiveHandler;
    v9->_id becomeActiveHandler = (id)v10;

    uint64_t v12 = [v7 copy];
    id resignActiveHandler = v9->_resignActiveHandler;
    v9->_id resignActiveHandler = (id)v12;

    v9->_needsRegisterForAppStateNotifications = 1;
    [(SYApplicationStateObserver *)v9 _updateAppStateWithCompletion:0];
  }

  return v9;
}

- (void)_updateAppStateWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(SYApplicationStateObserver *)self _updateAppStateOnMainThread];
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__SYApplicationStateObserver__updateAppStateWithCompletion___block_invoke;
    v5[3] = &unk_1E6463BA8;
    v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

- (void)_updateAppStateOnMainThread
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (_localUIApplicationIsExtension())
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2050000000;
    id v4 = (void *)getUIApplicationClass_softClass_0;
    uint64_t v11 = getUIApplicationClass_softClass_0;
    if (!getUIApplicationClass_softClass_0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getUIApplicationClass_block_invoke_0;
      v7[3] = &unk_1E64635F8;
      v7[4] = &v8;
      __getUIApplicationClass_block_invoke_0((uint64_t)v7);
      id v4 = (void *)v9[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v8, 8);
    id v6 = [v5 sharedApplication];
    unsigned __int8 v3 = [v6 applicationState] == 0;
  }
  atomic_store(v3, (unsigned __int8 *)&self->_appStateIsActive);
}

uint64_t __53__SYApplicationStateObserver__handleAppBecomeActive___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)registerForAppStateNotifications
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getUIApplicationWillResignActiveNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYApplicationStateObserver.m", 23, @"%s", dlerror());

  __break(1u);
}

uint64_t __60__SYApplicationStateObserver__updateAppStateWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAppStateOnMainThread];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unsigned __int8 v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_handleAppResignActive:(id)a3
{
  id v4 = a3;
  id resignActiveHandler = self->_resignActiveHandler;
  if (resignActiveHandler)
  {
    id v6 = (void *)[resignActiveHandler copy];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__SYApplicationStateObserver__handleAppResignActive___block_invoke;
    v8[3] = &unk_1E64639B8;
    id v10 = v6;
    id v9 = v4;
    id v7 = v6;
    [(SYApplicationStateObserver *)self _updateAppStateWithCompletion:v8];
  }
}

uint64_t __53__SYApplicationStateObserver__handleAppResignActive___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resignActiveHandler, 0);
  objc_storeStrong(&self->_becomeActiveHandler, 0);
}

@end