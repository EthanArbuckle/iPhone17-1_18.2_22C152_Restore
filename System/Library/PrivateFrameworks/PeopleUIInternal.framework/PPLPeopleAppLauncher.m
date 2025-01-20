@interface PPLPeopleAppLauncher
+ (id)sharedLauncher;
- (OS_dispatch_queue)queue;
- (PPLPeopleAppLauncher)init;
- (PPLPeopleAppLauncherDelegate)delegate;
- (RBSAssertion)initializationAssertion;
- (RBSProcessHandle)peopleAppProcessHandle;
- (void)launchPeopleAppIfNeededWithForegroundPriority:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInitializationAssertion:(id)a3;
- (void)setPeopleAppProcessHandle:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation PPLPeopleAppLauncher

+ (id)sharedLauncher
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__PPLPeopleAppLauncher_sharedLauncher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLauncher_onceToken != -1) {
    dispatch_once(&sharedLauncher_onceToken, block);
  }
  v2 = (void *)sharedLauncher___sharedLauncher;
  return v2;
}

uint64_t __38__PPLPeopleAppLauncher_sharedLauncher__block_invoke()
{
  sharedLauncher___sharedLauncher = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (PPLPeopleAppLauncher)init
{
  v7.receiver = self;
  v7.super_class = (Class)PPLPeopleAppLauncher;
  v2 = [(PPLPeopleAppLauncher *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("people app queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)launchPeopleAppIfNeededWithForegroundPriority:(BOOL)a3
{
  BOOL v3 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke;
  v8[3] = &unk_2646129B0;
  v8[4] = self;
  BOOL v9 = a3;
  v5 = (void *)MEMORY[0x223C9B060](v8, a2);
  v6 = [(PPLPeopleAppLauncher *)self queue];
  objc_super v7 = v6;
  if (v3) {
    dispatch_sync(v6, v5);
  }
  else {
    dispatch_async(v6, v5);
  }
}

void __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke(uint64_t a1)
{
  v33[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) peopleAppProcessHandle];
  if (!v2) {
    goto LABEL_3;
  }
  BOOL v3 = (void *)v2;
  dispatch_queue_t v4 = [*(id *)(a1 + 32) peopleAppProcessHandle];
  v5 = [v4 currentState];
  char v6 = [v5 isRunning];

  if ((v6 & 1) == 0)
  {
LABEL_3:
    objc_super v7 = PPLPeopleViewServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2225B4000, v7, OS_LOG_TYPE_DEFAULT, "people launched via runningboard", buf, 2u);
    }

    v8 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.PeopleViewService"];
    BOOL v9 = [MEMORY[0x263F644E0] contextWithIdentity:v8];
    [v9 setExplanation:@"people launched via runningboard"];
    if (*(unsigned char *)(a1 + 40))
    {
      v10 = [MEMORY[0x263F64438] grantWithUserInteractivity];
      v33[0] = v10;
      v11 = [MEMORY[0x263F643C8] attributeWithCompletionPolicy:0];
      v33[1] = v11;
      v12 = [MEMORY[0x263F644D8] grantWithForegroundPriority];
      v33[2] = v12;
      v13 = v33;
    }
    else
    {
      v10 = [MEMORY[0x263F64438] grantUserInitiated];
      v32[0] = v10;
      v11 = [MEMORY[0x263F643C8] attributeWithCompletionPolicy:0];
      v32[1] = v11;
      v12 = [MEMORY[0x263F644D8] grantWithBackgroundPriority];
      v32[2] = v12;
      v13 = v32;
    }
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
    [v9 setAttributes:v14];

    v15 = (void *)[objc_alloc(MEMORY[0x263F644F0]) initWithContext:v9];
    v16 = v15;
    if (v15)
    {
      id v29 = 0;
      id v30 = 0;
      id v28 = 0;
      char v17 = [v15 execute:&v30 assertion:&v29 error:&v28];
      id v18 = v30;
      v19 = v29;
      id v20 = v28;
      v21 = PPLPeopleViewServiceLog();
      v22 = v21;
      if (v17)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2225B4000, v22, OS_LOG_TYPE_DEFAULT, "successfully launched app", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_cold_2((uint64_t)v20, v22);
      }

      [*(id *)(a1 + 32) setPeopleAppProcessHandle:v18];
      v23 = [*(id *)(a1 + 32) initializationAssertion];
      [v23 invalidate];

      [*(id *)(a1 + 32) setInitializationAssertion:v19];
      if (!*(unsigned char *)(a1 + 40))
      {
        v24 = [*(id *)(a1 + 32) delegate];
        [v24 willLaunchPeopleAppInBackground:*(void *)(a1 + 32)];
      }
      dispatch_time_t v25 = dispatch_time(0, 1000000000);
      v26 = [*(id *)(a1 + 32) queue];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_12;
      v27[3] = &unk_264612988;
      v27[4] = *(void *)(a1 + 32);
      dispatch_after(v25, v26, v27);
    }
    else
    {
      v19 = PPLPeopleViewServiceLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_cold_1(v19);
      }
    }
  }
}

uint64_t __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) initializationAssertion];
  [v2 invalidate];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setInitializationAssertion:0];
}

- (PPLPeopleAppLauncherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PPLPeopleAppLauncherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RBSProcessHandle)peopleAppProcessHandle
{
  return self->_peopleAppProcessHandle;
}

- (void)setPeopleAppProcessHandle:(id)a3
{
}

- (RBSAssertion)initializationAssertion
{
  return self->_initializationAssertion;
}

- (void)setInitializationAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationAssertion, 0);
  objc_storeStrong((id *)&self->_peopleAppProcessHandle, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2225B4000, log, OS_LOG_TYPE_ERROR, "no launch request", v1, 2u);
}

void __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2225B4000, a2, OS_LOG_TYPE_ERROR, "Failed to launch with error: %@", (uint8_t *)&v2, 0xCu);
}

@end