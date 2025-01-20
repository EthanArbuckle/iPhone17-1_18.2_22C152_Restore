@interface SPUISpotlightSceneManager
+ (id)sharedManager;
- (BSTimer)watchdogTimer;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (NSHashTable)foregroundScenes;
- (NSHashTable)managedScenes;
- (OS_dispatch_queue)queue;
- (RBSAssertion)backgroundingAssertions;
- (RBSAssertion)initializationAssertions;
- (RBSProcessHandle)spotlightProcessHandle;
- (SPUISpotlightSceneManager)init;
- (SPUISpotlightSceneManagerDelegate)delegate;
- (void)addScene:(id)a3;
- (void)launchSpotlightIfNeededWithForegroundPriority:(BOOL)a3;
- (void)removeScene:(id)a3;
- (void)sceneWillBackground:(id)a3;
- (void)sceneWillForeground:(id)a3;
- (void)setBackgroundingAssertions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForegroundScenes:(id)a3;
- (void)setInitializationAssertions:(id)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setManagedScenes:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSpotlightProcessHandle:(id)a3;
- (void)setWatchdogTimer:(id)a3;
- (void)spendMoreTimeReleasingMemory;
@end

@implementation SPUISpotlightSceneManager

void __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) spotlightProcessHandle];
  if (!v2) {
    goto LABEL_3;
  }
  v3 = (void *)v2;
  v4 = [*(id *)(a1 + 32) spotlightProcessHandle];
  v5 = [v4 currentState];
  char v6 = [v5 isRunning];

  if ((v6 & 1) == 0)
  {
LABEL_3:
    v7 = qword_26AB56270;
    if (!qword_26AB56270)
    {
      SPUIInitLogging();
      v7 = qword_26AB56270;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224D5D000, v7, OS_LOG_TYPE_DEFAULT, "Spotlight launch via runningboard", buf, 2u);
    }
    v8 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.Spotlight"];
    v9 = [MEMORY[0x263F644E0] contextWithIdentity:v8];
    [v9 setExplanation:@"Spotlight launch via runningboard"];
    if (*(unsigned char *)(a1 + 40))
    {
      v10 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.spotlight" name:@"LaunchInForeground"];
      v28[0] = v10;
      v11 = (void **)v28;
    }
    else
    {
      v10 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.spotlight" name:@"LaunchInBackground"];
      v27 = v10;
      v11 = &v27;
    }
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v9 setAttributes:v12];

    v13 = (void *)[objc_alloc(MEMORY[0x263F644F0]) initWithContext:v9];
    v14 = v13;
    if (v13)
    {
      id v24 = 0;
      id v25 = 0;
      id v23 = 0;
      char v15 = [v13 execute:&v25 assertion:&v24 error:&v23];
      id v16 = v25;
      id v17 = v24;
      id v18 = v23;
      if ((v15 & 1) == 0)
      {
        v19 = qword_26AB56270;
        if (!qword_26AB56270)
        {
          SPUIInitLogging();
          v19 = qword_26AB56270;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke_cold_2((uint64_t)v18, v19);
        }
      }
      [*(id *)(a1 + 32) setSpotlightProcessHandle:v16];
      v20 = [*(id *)(a1 + 32) initializationAssertions];
      [v20 invalidate];

      [*(id *)(a1 + 32) setInitializationAssertions:v17];
      if (!*(unsigned char *)(a1 + 40))
      {
        v21 = [*(id *)(a1 + 32) delegate];
        [v21 willLaunchSpotlightInBackground];
      }
    }
    else
    {
      v22 = qword_26AB56270;
      if (!qword_26AB56270)
      {
        SPUIInitLogging();
        v22 = qword_26AB56270;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke_cold_1(v22);
      }
    }
  }
}

- (RBSProcessHandle)spotlightProcessHandle
{
  return (RBSProcessHandle *)objc_getProperty(self, a2, 56, 1);
}

- (void)launchSpotlightIfNeededWithForegroundPriority:(BOOL)a3
{
  BOOL v3 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke;
  v8[3] = &unk_264702F18;
  v8[4] = self;
  BOOL v9 = a3;
  v5 = (void *)MEMORY[0x22A622110](v8, a2);
  char v6 = [(SPUISpotlightSceneManager *)self queue];
  v7 = v6;
  if (v3) {
    dispatch_sync(v6, v5);
  }
  else {
    dispatch_async(v6, v5);
  }
}

void __33__SPUISpotlightSceneManager_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.spotlightui"];
  char v6 = [v5 BOOLForKey:@"SPUIPrewarmSpotlightDisabled"];

  if (v6) {
    goto LABEL_18;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v7 = [v4 elements];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v8)
  {

    goto LABEL_18;
  }
  uint64_t v9 = v8;
  id obj = v7;
  uint64_t v22 = a1;
  id v23 = v4;
  BOOL v10 = 0;
  char v11 = 0;
  char v24 = 0;
  uint64_t v12 = *(void *)v27;
  uint64_t v13 = *MEMORY[0x263F794D0];
  uint64_t v14 = *MEMORY[0x263F3F3C8];
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      id v17 = objc_msgSend(v16, "identifier", v22);
      char v18 = [v17 isEqualToString:v13];

      if (v18)
      {
        char v24 = 1;
        if (!v10) {
          goto LABEL_9;
        }
      }
      else
      {
        v20 = [v16 identifier];
        char v21 = [v20 isEqualToString:v14];

        v11 |= v21;
        if (!v10)
        {
LABEL_9:
          v19 = [v16 bundleIdentifier];
          BOOL v10 = v19 != 0;

          continue;
        }
      }
      BOOL v10 = 1;
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v9);

  id v4 = v23;
  if (!(v11 & 1 | ((v24 & 1) == 0) | v10) && [v23 displayBacklightLevel] >= 1) {
    [*(id *)(v22 + 32) launchSpotlightIfNeededWithForegroundPriority:0];
  }
LABEL_18:
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3);
  }
  uint64_t v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __42__SPUISpotlightSceneManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (SPUISpotlightSceneManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)SPUISpotlightSceneManager;
  uint64_t v2 = [(SPUISpotlightSceneManager *)&v15 init];
  if (v2)
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:0];
    [(SPUISpotlightSceneManager *)v2 setManagedScenes:v3];

    id v4 = (void *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:0];
    [(SPUISpotlightSceneManager *)v2 setForegroundScenes:v4];

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("spotlight process queue", v5);
    [(SPUISpotlightSceneManager *)v2 setQueue:v6];

    uint64_t v7 = +[SPUIAppService sharedAppService];
    appService = v2->_appService;
    v2->_appService = (SPUIAppService *)v7;

    uint64_t v9 = [MEMORY[0x263F3F478] configurationForDefaultMainDisplayMonitor];
    [v9 setNeedsUserInteractivePriority:1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __33__SPUISpotlightSceneManager_init__block_invoke;
    v13[3] = &unk_264702EF0;
    BOOL v10 = v2;
    uint64_t v14 = v10;
    [v9 setTransitionHandler:v13];
    char v11 = [MEMORY[0x263F3F470] monitorWithConfiguration:v9];
    [(SPUISpotlightSceneManager *)v10 setLayoutMonitor:v11];
  }
  return v2;
}

- (void)addScene:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUISpotlightSceneManager *)self managedScenes];
  [v5 addObject:v4];
}

- (void)removeScene:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUISpotlightSceneManager *)self managedScenes];
  [v5 removeObject:v4];

  id v6 = [(SPUISpotlightSceneManager *)self foregroundScenes];
  [v6 removeObject:v4];
}

- (void)sceneWillForeground:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:@"searchScreen"];

  if (v6)
  {
    uint64_t v7 = qword_26AB56270;
    if (!qword_26AB56270)
    {
      SPUIInitLogging();
      uint64_t v7 = qword_26AB56270;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SPUISpotlightSceneManager sceneWillForeground:](v7, v4);
    }
    [(SPUIAppService *)self->_appService activate];
  }
  uint64_t v8 = [(SPUISpotlightSceneManager *)self foregroundScenes];
  [v8 addObject:v4];

  [(SPUISpotlightSceneManager *)self applyAssertionAsNeeded];
}

- (void)sceneWillBackground:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:@"searchScreen"];

  if (v6)
  {
    uint64_t v7 = qword_26AB56270;
    if (!qword_26AB56270)
    {
      SPUIInitLogging();
      uint64_t v7 = qword_26AB56270;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SPUISpotlightSceneManager sceneWillBackground:](v7, v4);
    }
    [(SPUIAppService *)self->_appService deactivate];
  }
  uint64_t v8 = [(SPUISpotlightSceneManager *)self foregroundScenes];
  [v8 removeObject:v4];

  [(SPUISpotlightSceneManager *)self applyAssertionAsNeeded];
}

- (void)spendMoreTimeReleasingMemory
{
  v17[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(SPUISpotlightSceneManager *)self backgroundingAssertions];
  [v3 invalidate];

  id v4 = [(SPUISpotlightSceneManager *)self spotlightProcessHandle];
  id v5 = [v4 identity];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F64408]);
    uint64_t v7 = [MEMORY[0x263F64630] targetWithProcessIdentity:v5];
    uint64_t v8 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.spotlight" name:@"ReleaseMemory"];
    v17[0] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    BOOL v10 = (void *)[v6 initWithExplanation:@"spotlightMemoryBG" target:v7 attributes:v9];
    [(SPUISpotlightSceneManager *)self setBackgroundingAssertions:v10];

    char v11 = [(SPUISpotlightSceneManager *)self backgroundingAssertions];
    id v14 = 0;
    [v11 acquireWithError:&v14];
    id v12 = v14;

    if (v12)
    {
      uint64_t v13 = qword_26AB56270;
      if (!qword_26AB56270)
      {
        SPUIInitLogging();
        uint64_t v13 = qword_26AB56270;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v12;
        _os_log_impl(&dword_224D5D000, v13, OS_LOG_TYPE_DEFAULT, "Failed to acquire background assertion with error %@", buf, 0xCu);
      }
    }
  }
}

- (SPUISpotlightSceneManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SPUISpotlightSceneManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSHashTable)managedScenes
{
  return (NSHashTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManagedScenes:(id)a3
{
}

- (NSHashTable)foregroundScenes
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setForegroundScenes:(id)a3
{
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLayoutMonitor:(id)a3
{
}

- (BSTimer)watchdogTimer
{
  return (BSTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWatchdogTimer:(id)a3
{
}

- (void)setSpotlightProcessHandle:(id)a3
{
}

- (RBSAssertion)initializationAssertions
{
  return (RBSAssertion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInitializationAssertions:(id)a3
{
}

- (RBSAssertion)backgroundingAssertions
{
  return (RBSAssertion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBackgroundingAssertions:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_backgroundingAssertions, 0);
  objc_storeStrong((id *)&self->_initializationAssertions, 0);
  objc_storeStrong((id *)&self->_spotlightProcessHandle, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_foregroundScenes, 0);
  objc_storeStrong((id *)&self->_managedScenes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appService, 0);
}

void __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224D5D000, log, OS_LOG_TYPE_ERROR, "RBS has no launch request", v1, 2u);
}

void __75__SPUISpotlightSceneManager_launchSpotlightIfNeededWithForegroundPriority___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224D5D000, a2, OS_LOG_TYPE_ERROR, "Spotlight launch failed because of error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)sceneWillForeground:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_0_0(&dword_224D5D000, v5, v6, "Activate for %@", v7, v8, v9, v10, 2u);
}

- (void)sceneWillBackground:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_0_0(&dword_224D5D000, v5, v6, "Deactivate for %@", v7, v8, v9, v10, 2u);
}

@end