@interface STCommunicationSafetyViewModelCoordinator
- (NSManagedObjectID)userObjectID;
- (NSNumber)userDSID;
- (STCommunicationSafetyViewModel)viewModel;
- (STCommunicationSafetyViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4;
- (STCommunicationSafetyViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4 modelUpdatedHandler:(id)a5;
- (STGroupFetchedResultsController)fetchedResultsController;
- (STPersistenceControllerProtocol)persistenceController;
- (id)modelUpdatedHandler;
- (void)_loadViewModel;
- (void)_registerForPersistentStoreNotifications;
- (void)_reportCoreAnalyticsEventCommunicationSafetyEnabled:(BOOL)a3;
- (void)persistCommunicationSafetySettingsWithCompletionHandler:(id)a3;
- (void)saveCommunicationSafetyReceivingRestricted:(BOOL)a3 communicationSafetySendingRestricted:(BOOL)a4 completionHandler:(id)a5;
- (void)setFetchedResultsController:(id)a3;
- (void)setModelUpdatedHandler:(id)a3;
- (void)setUserDSID:(id)a3;
- (void)setUserObjectID:(id)a3;
@end

@implementation STCommunicationSafetyViewModelCoordinator

- (STCommunicationSafetyViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4 modelUpdatedHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)STCommunicationSafetyViewModelCoordinator;
  v12 = [(STCommunicationSafetyViewModelCoordinator *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_persistenceController, a3);
    uint64_t v14 = [v10 copy];
    v15 = (void *)v14;
    if (v14) {
      v16 = (void *)v14;
    }
    else {
      v16 = &unk_26D966EC8;
    }
    objc_storeStrong((id *)&v13->_userDSID, v16);

    v17 = _Block_copy(v11);
    id modelUpdatedHandler = v13->_modelUpdatedHandler;
    v13->_id modelUpdatedHandler = v17;

    uint64_t v19 = objc_opt_new();
    viewModel = v13->_viewModel;
    v13->_viewModel = (STCommunicationSafetyViewModel *)v19;

    [(STCommunicationSafetyViewModelCoordinator *)v13 _loadViewModel];
    [(STCommunicationSafetyViewModelCoordinator *)v13 _registerForPersistentStoreNotifications];
  }

  return v13;
}

- (STCommunicationSafetyViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4
{
  return [(STCommunicationSafetyViewModelCoordinator *)self initWithPersistenceController:a3 userDSID:a4 modelUpdatedHandler:0];
}

- (void)_registerForPersistentStoreNotifications
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F671A0];
  v4 = [MEMORY[0x263F67160] fetchRequest];
  v5 = [v3 requestWithFetchRequest:v4];

  id v6 = objc_alloc(MEMORY[0x263F671A8]);
  v7 = [(STCommunicationSafetyViewModelCoordinator *)self persistenceController];
  v8 = [v7 viewContext];
  v11[0] = v5;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = (void *)[v6 initWithContext:v8 resultsRequests:v9];

  [v10 setDelegate:self];
  [(STCommunicationSafetyViewModelCoordinator *)self setFetchedResultsController:v10];
}

- (void)_loadViewModel
{
  v1 = [a1 userDSID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_225B06000, v2, v3, "Loading viewModel for userDSID %{public}@...", v4, v5, v6, v7, v8);
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke(uint64_t a1, void *a2)
{
  v40[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = (id *)(a1 + 32);
  uint64_t v6 = [v5 viewModel];
  uint64_t v7 = [*v4 userObjectID];

  id v8 = *v4;
  if (v7)
  {
    id v9 = [v8 userObjectID];
    id v10 = [v3 objectWithID:v9];

    id v11 = 0;
    if (v10)
    {
LABEL_3:
      char v12 = objc_msgSend(v10, "isCommunicationSafetyReceivingRestricted", v3);
      char v13 = [v10 isCommunicationSafetySendingRestricted];
      char v14 = [v10 isCommunicationSafetyNotificationEnabled];
      char v15 = [v10 isCommunicationSafetyAnalyticsEnabled];
      v16 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_6();
      }

      v17 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_5();
      }

      v18 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_4();
      }

      uint64_t v19 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_3();
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_51;
      block[3] = &unk_264767718;
      id v20 = v6;
      char v34 = v12;
      char v35 = v13;
      char v36 = v14;
      char v37 = v15;
      id v21 = *v4;
      id v32 = v20;
      id v33 = v21;
      dispatch_async(MEMORY[0x263EF83A0], block);
      objc_super v22 = v32;
      id v3 = v30;
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  id v10 = [v8 userDSID];
  objc_super v22 = [MEMORY[0x263F67168] fetchRequestForUsersWithDSID:v10];
  id v38 = 0;
  v23 = [v22 execute:&v38];
  id v11 = v38;
  if (v23)
  {
    v24 = [v23 firstObject];
    v25 = [v24 objectID];
    [*v4 setUserObjectID:v25];

    id v10 = v24;
    if (v24) {
      goto LABEL_3;
    }
LABEL_14:
    v26 = +[STUILog communicationSafety];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_2(v4, v26);
    }

    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F67300];
    uint64_t v39 = *MEMORY[0x263F08320];
    v40[0] = @"user could not be found";
    id v10 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    [v27 errorWithDomain:v28 code:11 userInfo:v10];
    objc_super v22 = v11;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v29 = +[STUILog communicationSafety];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
    __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_1();
  }

LABEL_20:
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_51(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsCommunicationSafetyReceivingRestricted:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) setIsCommunicationSafetySendingRestricted:*(unsigned __int8 *)(a1 + 49)];
  [*(id *)(a1 + 32) setIsCommunicationSafetyNotificationEnabled:*(unsigned __int8 *)(a1 + 50)];
  [*(id *)(a1 + 32) setIsCommunicationSafetyAnalyticsEnabled:*(unsigned __int8 *)(a1 + 51)];
  uint64_t v2 = [*(id *)(a1 + 40) modelUpdatedHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2]();
    uint64_t v2 = v3;
  }
}

- (void)persistCommunicationSafetySettingsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STCommunicationSafetyViewModelCoordinator *)self persistenceController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_264767790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBackgroundTaskAndWait:v7];
}

void __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) viewModel];
  uint64_t v5 = [*(id *)(a1 + 32) userObjectID];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) userObjectID];
    uint64_t v7 = [v3 objectWithID:v6];

    objc_msgSend(v7, "setIsCommunicationSafetyReceivingRestricted:", objc_msgSend(v4, "isCommunicationSafetyReceivingRestricted"));
    objc_msgSend(v7, "setIsCommunicationSafetySendingRestricted:", objc_msgSend(v4, "isCommunicationSafetySendingRestricted"));
    objc_msgSend(v7, "setIsCommunicationSafetyNotificationEnabled:", objc_msgSend(v4, "isCommunicationSafetyNotificationEnabled"));
    objc_msgSend(v7, "setIsCommunicationSafetyAnalyticsEnabled:", objc_msgSend(v4, "isCommunicationSafetyAnalyticsEnabled"));
    if (_os_feature_enabled_impl())
    {
      id v8 = [MEMORY[0x263F67088] sharedController];
      [v8 saveContext:v3 error:0];

      id v9 = 0;
    }
    else
    {
      id v11 = [*(id *)(a1 + 32) persistenceController];
      id v21 = 0;
      char v12 = [v11 saveContext:v3 error:&v21];
      id v9 = v21;

      if ((v12 & 1) == 0)
      {
        char v13 = +[STUILog communicationSafety];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_cold_2();
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportCoreAnalyticsEventCommunicationSafetyEnabled:", objc_msgSend(v4, "isCommunicationSafetyReceivingRestricted"));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_57;
    block[3] = &unk_264767628;
    id v14 = *(id *)(a1 + 40);
    id v19 = v9;
    id v20 = v14;
    id v15 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v10 = +[STUILog communicationSafety];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_cold_1(v10);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_58;
    v16[3] = &unk_264767768;
    id v17 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v16);
    uint64_t v7 = v17;
  }
}

uint64_t __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveCommunicationSafetyReceivingRestricted:(BOOL)a3 communicationSafetySendingRestricted:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [(STCommunicationSafetyViewModelCoordinator *)self persistenceController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __143__STCommunicationSafetyViewModelCoordinator_saveCommunicationSafetyReceivingRestricted_communicationSafetySendingRestricted_completionHandler___block_invoke;
  v11[3] = &unk_2647677B8;
  BOOL v13 = a3;
  BOOL v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 performBackgroundTaskAndWait:v11];
}

void __143__STCommunicationSafetyViewModelCoordinator_saveCommunicationSafetyReceivingRestricted_communicationSafetySendingRestricted_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userObjectID];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) userObjectID];
    id v6 = [v3 objectWithID:v5];

    [v6 setIsCommunicationSafetyReceivingRestricted:*(unsigned __int8 *)(a1 + 48)];
    [v6 setIsCommunicationSafetySendingRestricted:*(unsigned __int8 *)(a1 + 49)];
    if (_os_feature_enabled_impl())
    {
      id v7 = 0;
    }
    else
    {
      id v9 = [*(id *)(a1 + 32) persistenceController];
      id v17 = 0;
      char v10 = [v9 saveContext:v3 error:&v17];
      id v7 = v17;

      if ((v10 & 1) == 0)
      {
        id v11 = +[STUILog communicationSafety];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_cold_2();
        }
      }
    }
  }
  else
  {
    id v8 = [MEMORY[0x263F67088] sharedController];
    [v8 saveContext:v3 error:0];

    id v7 = 0;
  }
  [*(id *)(a1 + 32) _reportCoreAnalyticsEventCommunicationSafetyEnabled:*(unsigned __int8 *)(a1 + 48)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __143__STCommunicationSafetyViewModelCoordinator_saveCommunicationSafetyReceivingRestricted_communicationSafetySendingRestricted_completionHandler___block_invoke_59;
  block[3] = &unk_264767628;
  id v12 = *(id *)(a1 + 40);
  id v15 = v7;
  id v16 = v12;
  id v13 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __143__STCommunicationSafetyViewModelCoordinator_saveCommunicationSafetyReceivingRestricted_communicationSafetySendingRestricted_completionHandler___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_reportCoreAnalyticsEventCommunicationSafetyEnabled:(BOOL)a3
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F67130]) initWithCommunicationSafetyEnabled:a3];
  [MEMORY[0x263F67150] reportEvent:v3];
}

- (STCommunicationSafetyViewModel)viewModel
{
  return (STCommunicationSafetyViewModel *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (NSManagedObjectID)userObjectID
{
  return self->_userObjectID;
}

- (void)setUserObjectID:(id)a3
{
}

- (STGroupFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
}

- (id)modelUpdatedHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setModelUpdatedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modelUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_userObjectID, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_225B06000, v1, OS_LOG_TYPE_FAULT, "failed to fetch user with DSID %{public}@: %{public}@", v2, 0x16u);
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_2(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  __int16 v3 = [*a1 userDSID];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "user with DSID could not be found: %{public}@", v4, 0xCu);
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_3()
{
  uint64_t v0 = objc_msgSend((id)OUTLINED_FUNCTION_2(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_225B06000, v1, v2, "Copied isCommunicationSafetyAnalyticsEnabled from DB to viewModel: %@", v3, v4, v5, v6, v7);
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_4()
{
  uint64_t v0 = objc_msgSend((id)OUTLINED_FUNCTION_2(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_225B06000, v1, v2, "Copied isCommunicationSafetyNotificationEnabled from DB to viewModel: %@", v3, v4, v5, v6, v7);
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_5()
{
  uint64_t v0 = objc_msgSend((id)OUTLINED_FUNCTION_2(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_225B06000, v1, v2, "Copied isCommunicationSafetySendingRestricted from DB to viewModel: %@", v3, v4, v5, v6, v7);
}

void __59__STCommunicationSafetyViewModelCoordinator__loadViewModel__block_invoke_cold_6()
{
  uint64_t v0 = objc_msgSend((id)OUTLINED_FUNCTION_2(NSNumber), "numberWithBool:");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_225B06000, v1, v2, "Copied isCommunicationSafetyReceivingRestricted from DB to viewModel: %@", v3, v4, v5, v6, v7);
}

void __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_225B06000, log, OS_LOG_TYPE_FAULT, "Communication Safety View Model has no userObjectID. Nothing will be saved.", v1, 2u);
}

void __101__STCommunicationSafetyViewModelCoordinator_persistCommunicationSafetySettingsWithCompletionHandler___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_225B06000, v0, OS_LOG_TYPE_FAULT, "Failed to save Communication Safety settings: %{public}@", v1, 0xCu);
}

@end