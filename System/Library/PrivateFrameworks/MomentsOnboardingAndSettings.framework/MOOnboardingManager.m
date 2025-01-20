@interface MOOnboardingManager
+ (id)sharedInstance;
- (BOOL)isOnboarded;
- (MOOnboardingManager)init;
- (MOOnboardingManagerDelegate)delegate;
- (id)_getOnboardingManagerUI;
- (id)getSheetOnboardingViewController;
- (id)getSheetOnboardingViewControllerWithDelegate:(id)a3;
- (unint64_t)onboardingFlowCompletionStatus;
- (unint64_t)onboardingFlowRefreshCompletionStatus;
- (void)onboardingFlowRefreshCompletionStatus;
- (void)setDelegate:(id)a3;
- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3;
@end

@implementation MOOnboardingManager

- (MOOnboardingManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MOOnboardingManager;
  v2 = [(MOOnboardingManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    ui = v2->ui;
    v2->ui = 0;

    *(_WORD *)&v3->hasCheckedOnboardingStatus = 0;
    v5 = v3;
  }

  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__MOOnboardingManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance_shared_2;
  return v2;
}

uint64_t __37__MOOnboardingManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_shared_2 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (id)_getOnboardingManagerUI
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__MOOnboardingManager__getOnboardingManagerUI__block_invoke;
  block[3] = &unk_265424C38;
  block[4] = self;
  if (_getOnboardingManagerUI_onceToken != -1) {
    dispatch_once(&_getOnboardingManagerUI_onceToken, block);
  }
  return self->ui;
}

uint64_t __46__MOOnboardingManager__getOnboardingManagerUI__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)getSheetOnboardingViewController
{
  v2 = [(MOOnboardingManager *)self _getOnboardingManagerUI];
  v3 = [v2 createSheetOnboardingViewController];

  return v3;
}

- (id)getSheetOnboardingViewControllerWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(MOOnboardingManager *)self _getOnboardingManagerUI];
  v6 = [v5 createSheetOnboardingViewControllerWith:v4];

  return v6;
}

- (unint64_t)onboardingFlowCompletionStatus
{
  self->hasCheckedOnboardingStatus = 1;
  v2 = +[MOOnboardingAndSettingsManager sharedInstance];
  unint64_t v3 = [v2 getOnboardingFlowCompletionStatus];

  return v3;
}

- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3
{
  if (!self->hasCheckedOnboardingStatus)
  {
    v6 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOOnboardingManager setOnboardingFlowCompletionStatus:]();
    }

    objc_super v7 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOOnboardingManager.m", 73, @"Can't set onboarding status if you have not checked what it was before trying to set it (in %s:%d)", "-[MOOnboardingManager setOnboardingFlowCompletionStatus:]", 73);
  }
  self->hasSetOnboardingStatus = 1;
  v8 = +[MOOnboardingAndSettingsManager sharedInstance];
  [v8 setOnboardingFlowCompletionStatus:a3];
}

- (unint64_t)onboardingFlowRefreshCompletionStatus
{
  if (!self->hasSetOnboardingStatus)
  {
    id v4 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MOOnboardingManager onboardingFlowRefreshCompletionStatus]();
    }

    v5 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOOnboardingManager.m", 80, @"Can't check onboarding refresh status if you have not changed onboarding status (in %s:%d)", "-[MOOnboardingManager onboardingFlowRefreshCompletionStatus]", 80);
  }
  v6 = +[MOOnboardingAndSettingsManager sharedInstance];
  unint64_t v7 = [v6 getOnboardingFlowRefreshCompletionStatus];

  return v7;
}

- (BOOL)isOnboarded
{
  return ([(MOOnboardingManager *)self onboardingFlowCompletionStatus] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (MOOnboardingManagerDelegate)delegate
{
  v2 = +[MOOnboardingAndSettingsManager sharedInstance];
  unint64_t v3 = [v2 onboardingManagerDelegate];

  return (MOOnboardingManagerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v3 = a3;
  id v4 = +[MOOnboardingAndSettingsManager sharedInstance];
  [v4 setOnboardingManagerDelegate:v3];
}

- (void).cxx_destruct
{
}

- (void)setOnboardingFlowCompletionStatus:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  int v2 = 73;
  _os_log_error_impl(&dword_256D32000, v0, OS_LOG_TYPE_ERROR, "Can't set onboarding status if you have not checked what it was before trying to set it (in %s:%d)", v1, 0x12u);
}

- (void)onboardingFlowRefreshCompletionStatus
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  int v2 = 80;
  _os_log_error_impl(&dword_256D32000, v0, OS_LOG_TYPE_ERROR, "Can't check onboarding refresh status if you have not changed onboarding status (in %s:%d)", v1, 0x12u);
}

@end