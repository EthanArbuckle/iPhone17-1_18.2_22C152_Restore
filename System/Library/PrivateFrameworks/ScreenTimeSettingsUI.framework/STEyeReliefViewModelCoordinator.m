@interface STEyeReliefViewModelCoordinator
- (NSManagedObjectID)userObjectID;
- (NSNumber)userDSID;
- (STEyeReliefViewModel)viewModel;
- (STEyeReliefViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4;
- (STGroupFetchedResultsController)fetchedResultsController;
- (STPersistenceControllerProtocol)persistenceController;
- (void)_loadViewModel;
- (void)_loadViewModelWithContext:(id)a3;
- (void)_registerForPersistentStoreNotifications;
- (void)persistEyeReliefState:(BOOL)a3;
- (void)persistEyeReliefState:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)setFetchedResultsController:(id)a3;
- (void)setUserDSID:(id)a3;
- (void)setUserObjectID:(id)a3;
@end

@implementation STEyeReliefViewModelCoordinator

- (STEyeReliefViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4
{
  v6 = (STPersistenceControllerProtocol *)a3;
  v21.receiver = self;
  v21.super_class = (Class)STEyeReliefViewModelCoordinator;
  id v7 = a4;
  v8 = [(STEyeReliefViewModelCoordinator *)&v21 init];
  persistenceController = v8->_persistenceController;
  v8->_persistenceController = v6;
  v10 = v6;

  v11 = (void *)[v7 copy];
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = &unk_26D967420;
  }
  objc_storeStrong((id *)&v8->_userDSID, v12);

  uint64_t v13 = objc_opt_new();
  viewModel = v8->_viewModel;
  v8->_viewModel = (STEyeReliefViewModel *)v13;

  v15 = [(STEyeReliefViewModelCoordinator *)v8 persistenceController];
  v16 = [v15 viewContext];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__STEyeReliefViewModelCoordinator_initWithPersistenceController_userDSID___block_invoke;
  v19[3] = &unk_264766F30;
  v17 = v8;
  v20 = v17;
  [v16 performBlockAndWait:v19];

  [(STEyeReliefViewModelCoordinator *)v17 _registerForPersistentStoreNotifications];
  return v17;
}

void __74__STEyeReliefViewModelCoordinator_initWithPersistenceController_userDSID___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [v1 persistenceController];
  v2 = [v3 viewContext];
  [v1 _loadViewModelWithContext:v2];
}

- (void)_registerForPersistentStoreNotifications
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F671A0];
  v4 = [MEMORY[0x263F67160] fetchRequest];
  v5 = [v3 requestWithFetchRequest:v4];

  id v6 = objc_alloc(MEMORY[0x263F671A8]);
  id v7 = [(STEyeReliefViewModelCoordinator *)self persistenceController];
  v8 = [v7 viewContext];
  v11[0] = v5;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v10 = (void *)[v6 initWithContext:v8 resultsRequests:v9];

  [v10 setDelegate:self];
  [(STEyeReliefViewModelCoordinator *)self setFetchedResultsController:v10];
}

- (void)_loadViewModel
{
  id v3 = [(STEyeReliefViewModelCoordinator *)self persistenceController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__STEyeReliefViewModelCoordinator__loadViewModel__block_invoke;
  v4[3] = &unk_264767740;
  v4[4] = self;
  [v3 performBackgroundTask:v4];
}

uint64_t __49__STEyeReliefViewModelCoordinator__loadViewModel__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadViewModelWithContext:a2];
}

- (void)_loadViewModelWithContext:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[STUILog eyeRelief];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(STEyeReliefViewModelCoordinator *)self userDSID];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Loading EyeRelief viewModel for userDSID %{public}@...", (uint8_t *)&buf, 0xCu);
  }
  id v7 = [(STEyeReliefViewModelCoordinator *)self viewModel];
  v8 = [(STEyeReliefViewModelCoordinator *)self userDSID];
  v9 = [(STEyeReliefViewModelCoordinator *)self userObjectID];
  if (v9)
  {
    v10 = [v4 objectWithID:v9];
    v11 = 0;
    if (v10)
    {
LABEL_5:
      uint64_t v12 = [v10 isEyeReliefEnabled];
      uint64_t v13 = +[STUILog eyeRelief];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [NSNumber numberWithBool:v12];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_225B06000, v13, OS_LOG_TYPE_DEFAULT, "Copied isEyeReliefEnabled from DM to viewModel: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v28 = __61__STEyeReliefViewModelCoordinator__loadViewModelWithContext___block_invoke;
      v29 = &unk_264767588;
      v30 = v7;
      char v31 = v12;
      v15 = v27;
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        ((void (*)(void *, void))v28)(v15, 0);
      }
      else
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v36 = __STUICallCompletionHandlerOnMainThread_block_invoke_3;
        v37 = &unk_264767628;
        v26 = v15;
        id v38 = 0;
        id v39 = v26;
        dispatch_async(MEMORY[0x263EF83A0], &buf);
      }
      v25 = v30;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  v10 = [MEMORY[0x263F67168] fetchRequestForUsersWithDSID:v8];
  id v32 = 0;
  v16 = [v10 execute:&v32];
  v11 = v32;
  if (v16)
  {
    v17 = [v16 firstObject];
    [v17 objectID];
    v18 = v7;
    v19 = v8;
    objc_super v21 = v20 = v4;
    [(STEyeReliefViewModelCoordinator *)self setUserObjectID:v21];

    id v4 = v20;
    v8 = v19;
    id v7 = v18;

    v10 = v17;
    if (v17) {
      goto LABEL_5;
    }
LABEL_11:
    v22 = +[STUILog eyeRelief];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[STEyeReliefViewModelCoordinator _loadViewModelWithContext:]();
    }

    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F67300];
    uint64_t v33 = *MEMORY[0x263F08320];
    v34 = @"user could not be found";
    v10 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v23 errorWithDomain:v24 code:11 userInfo:v10];
    v11 = v25 = v11;
    goto LABEL_16;
  }
  v25 = +[STUILog eyeRelief];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
    -[STEyeReliefViewModelCoordinator _loadViewModelWithContext:]();
  }
LABEL_16:
}

uint64_t __61__STEyeReliefViewModelCoordinator__loadViewModelWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsEyeReliefEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)persistEyeReliefState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = +[STUILog eyeRelief];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Setting Eye Distance on viewModel: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(STEyeReliefViewModelCoordinator *)self persistEyeReliefState:v3 withCompletionHandler:&__block_literal_global_23];
}

void __57__STEyeReliefViewModelCoordinator_persistEyeReliefState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = +[STUILog eyeRelief];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __57__STEyeReliefViewModelCoordinator_persistEyeReliefState___block_invoke_cold_1();
    }
  }
}

- (void)persistEyeReliefState:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  int v7 = [(STEyeReliefViewModelCoordinator *)self persistenceController];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke;
  v9[3] = &unk_264767A20;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performBackgroundTaskAndWait:v9];
}

void __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userObjectID];
  v5 = [v3 objectWithID:v4];

  [v5 setIsEyeReliefEnabled:*(unsigned __int8 *)(a1 + 48)];
  if (_os_feature_enabled_impl())
  {
    id v6 = 0;
  }
  else
  {
    int v7 = [*(id *)(a1 + 32) persistenceController];
    id v19 = 0;
    char v8 = [v7 saveContext:v3 error:&v19];
    id v6 = v19;

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = +[STUILog eyeRelief];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke_cold_1();
      }
    }
  }
  id v10 = (void *)MEMORY[0x263F67150];
  BOOL v11 = (void *)[objc_alloc(MEMORY[0x263F67190]) initWithEyeReliefEnabled:*(unsigned __int8 *)(a1 + 48)];
  [v10 reportEvent:v11];

  uint64_t v12 = +[STUILog eyeRelief];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [v5 isEyeReliefEnabled];
    *(_DWORD *)long long buf = 67240192;
    int v21 = v13;
    _os_log_impl(&dword_225B06000, v12, OS_LOG_TYPE_DEFAULT, "Successfully saved Eye Relief state: %{public}d", buf, 8u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke_57;
  block[3] = &unk_264767628;
  id v14 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v14;
  id v15 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (STEyeReliefViewModel)viewModel
{
  return (STEyeReliefViewModel *)objc_getProperty(self, a2, 8, 1);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_userObjectID, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)_loadViewModelWithContext:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_225B06000, v1, OS_LOG_TYPE_FAULT, "Failed to fetch user with DSID %{public}@:%{public}@", v2, 0x16u);
}

- (void)_loadViewModelWithContext:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_225B06000, v0, OS_LOG_TYPE_FAULT, "User with DSID could not be found: %{public}@", v1, 0xCu);
}

void __57__STEyeReliefViewModelCoordinator_persistEyeReliefState___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225B06000, v0, OS_LOG_TYPE_ERROR, "Could not save Eye Relief setting: %{public}@", v1, 0xCu);
}

void __79__STEyeReliefViewModelCoordinator_persistEyeReliefState_withCompletionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_225B06000, v0, OS_LOG_TYPE_FAULT, "Failed to save Eye Relief state: %{public}@", v1, 0xCu);
}

@end