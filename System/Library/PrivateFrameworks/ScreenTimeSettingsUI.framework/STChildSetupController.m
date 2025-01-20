@interface STChildSetupController
+ (BOOL)isCommunicationSafetyAlreadyEnabledForUser:(id)a3;
- (STChildSetupController)initWithDSID:(id)a3;
- (STChildSetupController)initWithDSID:(id)a3 isChildDevice:(BOOL)a4;
- (STChildSetupController)initWithDSID:(id)a3 isChildDevice:(BOOL)a4 childAge:(id)a5 childName:(id)a6 updateExistingSettings:(BOOL)a7;
- (STChildSetupController)initWithDSID:(id)a3 isChildDevice:(BOOL)a4 updateExistingSettings:(BOOL)a5;
- (STChildSetupController)initWithDSID:(id)a3 updateExistingSettings:(BOOL)a4;
- (STChildSetupController)initWithDSID:(id)a3 updateExistingSettings:(BOOL)a4 childAge:(id)a5 childName:(id)a6;
- (STIntroductionController)introductionController;
- (STRootViewModelCoordinator)coordinator;
- (UIViewController)initialViewController;
- (id)completionHandler;
- (id)completionHandlerWithIntroductionModel;
- (id)initOnChildDeviceWithDSID:(id)a3 childAge:(id)a4;
- (id)initOnChildDeviceWithDSID:(id)a3 childAge:(id)a4 childName:(id)a5;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionHandlerWithIntroductionModel:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setIntroductionController:(id)a3;
@end

@implementation STChildSetupController

- (STChildSetupController)initWithDSID:(id)a3
{
  return [(STChildSetupController *)self initWithDSID:a3 isChildDevice:0 childAge:0 childName:0 updateExistingSettings:0];
}

- (STChildSetupController)initWithDSID:(id)a3 updateExistingSettings:(BOOL)a4
{
  return [(STChildSetupController *)self initWithDSID:a3 isChildDevice:0 childAge:0 childName:0 updateExistingSettings:a4];
}

- (STChildSetupController)initWithDSID:(id)a3 updateExistingSettings:(BOOL)a4 childAge:(id)a5 childName:(id)a6
{
  return [(STChildSetupController *)self initWithDSID:a3 isChildDevice:0 childAge:a5 childName:a6 updateExistingSettings:a4];
}

- (STChildSetupController)initWithDSID:(id)a3 isChildDevice:(BOOL)a4
{
  return [(STChildSetupController *)self initWithDSID:a3 isChildDevice:a4 childAge:0 childName:0 updateExistingSettings:0];
}

- (id)initOnChildDeviceWithDSID:(id)a3 childAge:(id)a4
{
  return [(STChildSetupController *)self initWithDSID:a3 isChildDevice:1 childAge:a4 childName:0 updateExistingSettings:0];
}

- (id)initOnChildDeviceWithDSID:(id)a3 childAge:(id)a4 childName:(id)a5
{
  return [(STChildSetupController *)self initWithDSID:a3 isChildDevice:1 childAge:a4 childName:a5 updateExistingSettings:0];
}

- (STChildSetupController)initWithDSID:(id)a3 isChildDevice:(BOOL)a4 updateExistingSettings:(BOOL)a5
{
  return [(STChildSetupController *)self initWithDSID:a3 isChildDevice:a4 childAge:0 childName:0 updateExistingSettings:a5];
}

- (STChildSetupController)initWithDSID:(id)a3 isChildDevice:(BOOL)a4 childAge:(id)a5 childName:(id)a6 updateExistingSettings:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v10 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)STChildSetupController;
  v15 = [(STChildSetupController *)&v40 init];
  if (v15)
  {
    v16 = +[STUILog childSetup];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v10;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v13;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v14;
      *(_WORD *)&buf[38] = 1026;
      LODWORD(v42) = v7;
      _os_log_impl(&dword_225B06000, v16, OS_LOG_TYPE_DEFAULT, "Initializing STChildSetupController with dsid:%@ isChildDevice:%{public}d childAge:%@ childName:%@ updateExistingSettings:%{public}d", buf, 0x2Cu);
    }

    v17 = [[STRootViewModelCoordinator alloc] initWithUserDSID:v12 deviceIdentifier:0 usageReportType:0 usageContext:0];
    objc_storeStrong((id *)&v15->_coordinator, v17);
    if (v14)
    {
      id v18 = v14;
    }
    else
    {
      v19 = [(STRootViewModelCoordinator *)v17 viewModel];
      v20 = [v19 me];
      id v18 = [v20 givenName];
    }
    v21 = [STIntroductionController alloc];
    v22 = [(STChildSetupController *)v15 coordinator];
    uint64_t v23 = [(STIntroductionController *)v21 initWithDSID:v12 childAge:v13 childName:v18 updateExistingSettings:v7 restrictionsDataSource:v22];
    introductionController = v15->_introductionController;
    v15->_introductionController = (STIntroductionController *)v23;

    [(STIntroductionController *)v15->_introductionController setAllowParentalControls:1];
    [(STIntroductionController *)v15->_introductionController setForceParentalControls:1];
    [(STIntroductionController *)v15->_introductionController setSkipAppLimitsPane:1];
    if (v7)
    {
      BOOL v25 = v10;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      buf[24] = 1;
      v26 = [MEMORY[0x263F67088] sharedController];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke;
      v37[3] = &unk_264767510;
      id v38 = v12;
      v39 = buf;
      [v26 performBackgroundTaskAndWait:v37];
      [(STIntroductionController *)v15->_introductionController setShowCommunicationSafetyPane:*(unsigned char *)(*(void *)&buf[8] + 24) == 0];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      [(STIntroductionController *)v15->_introductionController setShowCommunicationSafetyPane:1];
      BOOL v25 = v10;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__1;
    *(void *)&buf[32] = __Block_byref_object_dispose__1;
    v27 = v15;
    v42 = v27;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_22;
    v32[3] = &unk_264767560;
    BOOL v35 = v25;
    v34 = buf;
    BOOL v36 = v7;
    v28 = v17;
    v33 = v28;
    [(STIntroductionController *)v15->_introductionController setCompletionBlock:v32];
    uint64_t v29 = [(STIntroductionController *)v15->_introductionController initialViewController];
    initialViewController = v27->_initialViewController;
    v27->_initialViewController = (UIViewController *)v29;

    _Block_object_dispose(buf, 8);
  }

  return v15;
}

void __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  v4 = [MEMORY[0x263F67168] fetchUserWithDSID:v3 inContext:a2 error:&v7];
  id v5 = v7;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[STChildSetupController isCommunicationSafetyAlreadyEnabledForUser:v4];
  }
  else
  {
    v6 = +[STUILog childSetup];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
}

void __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_22(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    BOOL v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (*(unsigned char *)(a1 + 48))
    {
      v8 = [v10 completionHandlerWithIntroductionModel];
      if (v8)
      {
        v11 = +[STUILog childSetup];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225B06000, v11, OS_LOG_TYPE_DEFAULT, "Calling STChildSetupController completion handler with introduction model. Screen Time was not enabled on child's device.", buf, 2u);
        }

        v8[2](v8, 0, 0);
      }
    }
    else
    {
      v8 = [v10 completionHandler];
      if (v8)
      {
        uint64_t v23 = +[STUILog childSetup];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225B06000, v23, OS_LOG_TYPE_DEFAULT, "Calling STChildSetupController completion handler. Screen Time was not enabled for remote child from parent's device.", buf, 2u);
        }

        ((void (*)(void (**)(void, void, void), void))v8[2])(v8, 0);
      }
    }
    goto LABEL_24;
  }
  if (*(unsigned char *)(a1 + 49))
  {
    id v7 = +[STUILog childSetup];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225B06000, v7, OS_LOG_TYPE_DEFAULT, "Updating existing settings for remote child from parent's device.", buf, 2u);
    }

    v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) coordinator];
    v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) completionHandler];
    [v8 applyIntroductionViewModel:v6 withCompletionHandler:v9];

LABEL_24:
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void (***)(void, void, void))(v24 + 40);
    *(void *)(v24 + 40) = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) completionHandlerWithIntroductionModel];
    if (v12)
    {
      id v31 = objc_alloc(MEMORY[0x263F671B8]);
      id v13 = [v6 appAndWebsiteActivityEnabled];
      v30 = [v6 bedtime];
      uint64_t v29 = [v30 simpleSchedule];
      id v14 = [v29 startTime];
      v28 = [v6 bedtime];
      v27 = [v28 simpleSchedule];
      v15 = [v27 endTime];
      v16 = [v6 restrictions];
      v17 = [v6 parentalControlsPasscode];
      id v18 = [v6 communicationSafetyEnabled];
      v19 = [v6 screenDistanceEnabled];
      v32 = (void *)[v31 initWithAppAndWebsiteActivityEnabled:v13 downtimeStartTime:v14 downtimeEndTime:v15 restrictions:v16 passcode:v17 communicationSafetyEnabled:v18 eyeReliefEnabled:v19];

      if (_os_feature_enabled_impl() && _os_feature_enabled_impl()) {
        objc_msgSend(v32, "setImageGenerationRestriction:", objc_msgSend(v6, "imageGenerationRestriction"));
      }
      v20 = +[STUILog childSetup];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225B06000, v20, OS_LOG_TYPE_DEFAULT, "Calling STChildSetupController completion handler with introduction model. Screen Time will be enabled on child's device.", buf, 2u);
      }

      ((void (**)(void, uint64_t, void *))v12)[2](v12, 1, v32);
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = 0;
  }
  else
  {
    BOOL v25 = *(void **)(a1 + 32);
    v26 = [v5 parentalControlsPasscode];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_23;
    v33[3] = &unk_264767538;
    uint64_t v35 = *(void *)(a1 + 40);
    id v34 = v6;
    [v25 enableManagementWithPIN:v26 recoveryAltDSID:0 completionHandler:v33];

    id v12 = (void (**)(void, void, void))v34;
  }
LABEL_25:
}

void __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) completionHandler];
  id v5 = +[STUILog childSetup];
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_23_cold_1((uint64_t)v3, v6);
    }

    if (v4) {
      ((void (**)(void, id))v4)[2](v4, v3);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl(&dword_225B06000, v6, OS_LOG_TYPE_DEFAULT, "Screen Time was successfully enabled for remote child from parent's device. Will save values for model.", v10, 2u);
    }

    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) coordinator];
    [v7 applyIntroductionViewModel:*(void *)(a1 + 32) withCompletionHandler:v4];

    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

+ (BOOL)isCommunicationSafetyAlreadyEnabledForUser:(id)a3
{
  id v3 = a3;
  if (([v3 isCommunicationSafetyReceivingRestricted] & 1) != 0
    || ([v3 isCommunicationSafetySendingRestricted] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isCommunicationSafetyNotificationEnabled];
  }

  return v4;
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandlerWithIntroductionModel
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandlerWithIntroductionModel:(id)a3
{
}

- (UIViewController)initialViewController
{
  return self->_initialViewController;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (STIntroductionController)introductionController
{
  return self->_introductionController;
}

- (void)setIntroductionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_introductionController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong(&self->_completionHandlerWithIntroductionModel, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

void __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "Failed to fetch user to determine whether to show Communication Safety pane: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __95__STChildSetupController_initWithDSID_isChildDevice_childAge_childName_updateExistingSettings___block_invoke_23_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "Failed to enable management for remote child from parent's device: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end