@interface STTimeAllowancesViewModelCoordinator
+ (BOOL)saveAllowance:(id)a3 forUser:(id)a4 error:(id *)a5;
- (BOOL)isDowntimeActive;
- (NSManagedObjectID)userObjectID;
- (NSNumber)userDSID;
- (STAskForTimeClient)askForTimeClient;
- (STGroupFetchedResultsController)groupFetchResultsController;
- (STPersistenceControllerProtocol)persistenceController;
- (STTimeAllowancesViewModel)viewModel;
- (STTimeAllowancesViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4;
- (double)timeToNextExpectedStateChange;
- (id)_iCloudAccountPredicate;
- (int64_t)currentDowntimeState;
- (void)_registerForPersistentStoreNotifications;
- (void)deleteAllowance:(id)a3 completionHandler:(id)a4;
- (void)groupResultsController:(id)a3 didChangeResultsForRequest:(id)a4 objectID:(id)a5 changeType:(unint64_t)a6;
- (void)loadViewModelWithCompletionHandler:(id)a3;
- (void)respondToAskForTime:(id)a3 withApproval:(BOOL)a4 timeApproved:(id)a5 completionHandler:(id)a6;
- (void)saveAllAllowancesEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)saveAllowance:(id)a3 completionHandler:(id)a4;
- (void)saveAlwaysAllowList:(id)a3 completionHandler:(id)a4;
- (void)saveDefaultAlwaysAllowListWithCompletionHandler:(id)a3;
- (void)saveDeviceBedtime:(id)a3 completionHandler:(id)a4;
- (void)setUserDSID:(id)a3;
- (void)setUserObjectID:(id)a3;
- (void)toggleDowntimeWithCompletionHandler:(id)a3;
@end

@implementation STTimeAllowancesViewModelCoordinator

- (STTimeAllowancesViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STTimeAllowancesViewModelCoordinator;
  v9 = [(STTimeAllowancesViewModelCoordinator *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistenceController, a3);
    uint64_t v11 = objc_opt_new();
    askForTimeClient = v10->_askForTimeClient;
    v10->_askForTimeClient = (STAskForTimeClient *)v11;

    uint64_t v13 = [v8 copy];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = &unk_26D967408;
    }
    objc_storeStrong((id *)&v10->_userDSID, v15);

    uint64_t v16 = objc_opt_new();
    viewModel = v10->_viewModel;
    v10->_viewModel = (STTimeAllowancesViewModel *)v16;

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __79__STTimeAllowancesViewModelCoordinator_initWithPersistenceController_userDSID___block_invoke;
    v20[3] = &unk_2647671B0;
    v18 = v10;
    v21 = v18;
    [(STTimeAllowancesViewModelCoordinator *)v18 loadViewModelWithCompletionHandler:v20];
    [(STTimeAllowancesViewModelCoordinator *)v18 _registerForPersistentStoreNotifications];
  }
  return v10;
}

uint64_t __79__STTimeAllowancesViewModelCoordinator_initWithPersistenceController_userDSID___block_invoke(uint64_t a1)
{
  uint64_t result = _os_feature_enabled_impl();
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 saveDefaultAlwaysAllowListWithCompletionHandler:0];
  }
  return result;
}

- (void)saveDefaultAlwaysAllowListWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(STTimeAllowancesViewModelCoordinator *)self viewModel];
  v6 = [v5 alwaysAllowList];

  if (!v6)
  {
    id v7 = +[STUILog persistence];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225B06000, v7, OS_LOG_TYPE_DEFAULT, "Always Allow list does not exist. Saving default Always Allow list.", buf, 2u);
    }

    id v8 = [(STTimeAllowancesViewModelCoordinator *)self userDSID];
    v9 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke;
    v11[3] = &unk_264767790;
    id v12 = v8;
    id v13 = v4;
    id v10 = v8;
    [v9 performBackgroundTask:v11];
  }
}

void __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v19 = 0;
    v5 = [MEMORY[0x263F67168] fetchUserWithDSID:v4 inContext:v3 error:&v19];
    id v6 = v19;
    if (v5)
    {
      id v18 = v6;
      int v7 = [MEMORY[0x263F67108] saveDefaultAlwaysAllowListIfNecessaryForUser:v5 error:&v18];
      id v8 = v18;

      v9 = *(void **)(a1 + 40);
      if (v7)
      {
        id v10 = v9;
        if (v10)
        {
          if ([MEMORY[0x263F08B88] isMainThread])
          {
            v10[2](v10, 0);
          }
          else
          {
            uint64_t block = MEMORY[0x263EF8330];
            uint64_t v21 = 3221225472;
            objc_super v22 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
            v23 = &unk_264767628;
            v17 = v10;
            id v24 = 0;
            v25 = v17;
            dispatch_async(MEMORY[0x263EF83A0], &block);
          }
        }
      }
      else
      {
        id v10 = v9;
        id v8 = v8;
        if (v10)
        {
          if ([MEMORY[0x263F08B88] isMainThread])
          {
            ((void (**)(id, id))v10)[2](v10, v8);
          }
          else
          {
            uint64_t block = MEMORY[0x263EF8330];
            uint64_t v21 = 3221225472;
            objc_super v22 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
            v23 = &unk_264767628;
            v25 = v10;
            id v24 = v8;
            dispatch_async(MEMORY[0x263EF83A0], &block);
          }
        }
      }
      goto LABEL_25;
    }
    uint64_t v11 = +[STUILog persistence];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_2();
    }
  }
  else
  {
    id v6 = 0;
  }
  id v12 = +[STUILog persistence];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_1();
  }

  id v13 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = *MEMORY[0x263F67300];
  uint64_t v26 = *MEMORY[0x263F08320];
  v27[0] = @"user could not be found";
  v15 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  uint64_t v16 = [v13 errorWithDomain:v14 code:11 userInfo:v15];

  v5 = (void (**)(id, id))*(id *)(a1 + 40);
  id v8 = v16;
  if (v5)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v5[2](v5, v8);
    }
    else
    {
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      objc_super v22 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      v23 = &unk_264767628;
      v25 = v5;
      id v24 = v8;
      dispatch_async(MEMORY[0x263EF83A0], &block);
    }
  }

LABEL_25:
}

- (void)_registerForPersistentStoreNotifications
{
  id v3 = (void *)MEMORY[0x263F67108];
  uint64_t v4 = [(STTimeAllowancesViewModelCoordinator *)self userDSID];
  id v14 = [v3 fetchResultsRequestsForChangesToBlueprintsForUserWithDSID:v4];

  v5 = (void *)MEMORY[0x263F671A0];
  id v6 = [MEMORY[0x263F670F0] fetchRequest];
  int v7 = [v5 requestWithFetchRequest:v6];

  id v8 = objc_alloc(MEMORY[0x263F671A8]);
  v9 = [v14 arrayByAddingObject:v7];
  id v10 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
  uint64_t v11 = [v10 viewContext];
  id v12 = (STGroupFetchedResultsController *)[v8 initWithResultsRequests:v9 cacheName:0 managedObjectContext:v11];
  groupFetchResultsController = self->_groupFetchResultsController;
  self->_groupFetchResultsController = v12;

  [(STGroupFetchedResultsController *)self->_groupFetchResultsController setDelegate:self];
}

- (void)groupResultsController:(id)a3 didChangeResultsForRequest:(id)a4 objectID:(id)a5 changeType:(unint64_t)a6
{
}

- (void)loadViewModelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(STTimeAllowancesViewModelCoordinator *)self viewModel];
  id v6 = [(STTimeAllowancesViewModelCoordinator *)self userDSID];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__6;
  v19[4] = __Block_byref_object_dispose__6;
  id v20 = [(STTimeAllowancesViewModelCoordinator *)self userObjectID];
  objc_initWeak(&location, self);
  int v7 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke;
  v11[3] = &unk_2647686B8;
  uint64_t v16 = v19;
  id v8 = v6;
  id v12 = v8;
  id v9 = v4;
  id v15 = v9;
  id v13 = self;
  id v10 = v5;
  id v14 = v10;
  objc_copyWeak(&v17, &location);
  [v7 performBackgroundTask:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(v19, 8);
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v118[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v79 = v3;
  uint64_t v80 = a1;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v4 = objc_msgSend(v3, "objectWithID:");
  }
  else
  {
    id v4 = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v5 = 0;
    if (v4) {
      goto LABEL_6;
    }
LABEL_12:
    id v17 = +[STUILog persistence];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2();
    }

    id v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v117 = *MEMORY[0x263F08320];
    v118[0] = @"user could not be found";
    id v19 = [NSDictionary dictionaryWithObjects:v118 forKeys:&v117 count:1];
    id v20 = [v18 errorWithDomain:*MEMORY[0x263F67300] code:11 userInfo:v19];

    uint64_t v21 = (void (**)(id, id))*(id *)(v80 + 56);
    id v22 = v20;
    if (v21)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v21[2](v21, v22);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v108 = 3221225472;
        v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        v110 = &unk_264767628;
        v112 = v21;
        id v111 = v22;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }

    goto LABEL_95;
  }
  id v10 = v4;
  uint64_t v11 = [MEMORY[0x263F67168] fetchRequestForUsersWithDSID:*(void *)(a1 + 32)];
  id v106 = 0;
  id v12 = [v11 execute:&v106];
  id v5 = v106;
  if (v12)
  {
    id v13 = [v12 firstObject];

    uint64_t v14 = [v13 objectID];
    uint64_t v15 = *(void *)(*(void *)(v80 + 64) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    id v4 = v13;
    if (v13)
    {
LABEL_6:
      v77 = v4;
      v78 = [v4 managingOrganization];
      if (v78)
      {
        id v6 = [MEMORY[0x263F67108] fetchRequestMatchingBlueprintsForUser:v77 ofType:*MEMORY[0x263F672B8] fromOrganization:v78 includeTombstones:0];
        id v105 = v5;
        int v7 = [v6 execute:&v105];
        id v8 = v105;

        if (!v7)
        {
          v25 = +[STUILog persistence];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5();
          }

          uint64_t v26 = (void (**)(id, id))*(id *)(v80 + 56);
          id v22 = v8;
          if (v26)
          {
            if ([MEMORY[0x263F08B88] isMainThread])
            {
              v26[2](v26, v22);
            }
            else
            {
              uint64_t block = MEMORY[0x263EF8330];
              uint64_t v108 = 3221225472;
              v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              v110 = &unk_264767628;
              v112 = v26;
              id v111 = v22;
              dispatch_async(MEMORY[0x263EF83A0], &block);
            }
          }

          goto LABEL_94;
        }
        id v9 = [v7 firstObject];
        if (v9) {
          v76 = [[STDeviceBedtime alloc] initWithBlueprint:v9];
        }
        else {
          v76 = 0;
        }

        v82 = objc_opt_new();
        v75 = [MEMORY[0x263F67108] fetchRequestMatchingBlueprintsForUser:v77 ofType:*MEMORY[0x263F672D0] fromOrganization:v78 includeTombstones:0];
        id v104 = v8;
        v27 = [(STAlwaysAllowList *)v75 execute:&v104];
        id v74 = v104;

        if (!v27)
        {
          v46 = +[STUILog persistence];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
            __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_6();
          }

          v47 = (void (**)(id, id))*(id *)(v80 + 56);
          id v22 = v74;
          if (v47)
          {
            if ([MEMORY[0x263F08B88] isMainThread])
            {
              v47[2](v47, v22);
            }
            else
            {
              uint64_t block = MEMORY[0x263EF8330];
              uint64_t v108 = 3221225472;
              v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              v110 = &unk_264767628;
              v112 = v47;
              id v111 = v22;
              dispatch_async(MEMORY[0x263EF83A0], &block);
            }
          }

          goto LABEL_92;
        }
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        id v28 = v27;
        char v29 = 0;
        uint64_t v30 = [v28 countByEnumeratingWithState:&v100 objects:v116 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v101;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v101 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v100 + 1) + 8 * i);
              v34 = [v33 configurations];
              BOOL v35 = [v34 count] == 0;

              if (v35)
              {
                v39 = +[STUILog persistence];
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                  __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_8(v114, v33, &v115, v39);
                }

                [v33 tombstone];
                char v29 = 1;
              }
              else
              {
                v36 = [[STAllowance alloc] initWithBlueprint:v33];
                v37 = [(STAllowance *)v36 identifier];

                if (v37)
                {
                  v38 = [(STAllowance *)v36 identifier];
                  [v82 setObject:v36 forKeyedSubscript:v38];
                }
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v100 objects:v116 count:16];
          }
          while (v30);
        }

        v40 = (void *)MEMORY[0x263F67108];
        uint64_t v41 = *(void *)(v80 + 32);
        v42 = [v77 alwaysAllowActivationIdentifier];
        v43 = [v40 fetchRequestMatchingBlueprintsForUserWithDSID:v41 ofType:*MEMORY[0x263F672B0] withIdentifier:v42 fromOrganization:v78];

        id v99 = v74;
        v44 = [v43 execute:&v99];
        id v5 = v99;

        if (!v44)
        {
          v48 = +[STUILog persistence];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
            __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_7();
          }

          v49 = (void (**)(id, id))*(id *)(v80 + 56);
          id v22 = v5;
          if (v49)
          {
            if ([MEMORY[0x263F08B88] isMainThread])
            {
              v49[2](v49, v22);
            }
            else
            {
              uint64_t block = MEMORY[0x263EF8330];
              uint64_t v108 = 3221225472;
              v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              v110 = &unk_264767628;
              v112 = v49;
              id v111 = v22;
              dispatch_async(MEMORY[0x263EF83A0], &block);
            }
          }

          goto LABEL_93;
        }
        v45 = [v44 firstObject];
        if (v45) {
          v75 = [[STAlwaysAllowList alloc] initWithBlueprint:v45];
        }
        else {
          v75 = 0;
        }

        int v73 = v29 & 1;
      }
      else
      {
        v82 = objc_opt_new();
        int v73 = 0;
        v75 = 0;
        v76 = 0;
      }
      v81 = [MEMORY[0x263F670F0] fetchRequest];
      v50 = (void *)MEMORY[0x263F08A98];
      v51 = [*(id *)(v80 + 40) userDSID];
      v52 = [MEMORY[0x263EFF910] date];
      v53 = [v50 predicateWithFormat:@"%K == %@ AND %K == nil AND %K > %@", @"requestingUser.dsid", v51, @"answer", @"expirationDate", v52];
      [v81 setPredicate:v53];

      id v98 = v5;
      v54 = [v81 execute:&v98];
      id v55 = v98;

      if (v54)
      {
        v56 = objc_opt_new();
        long long v96 = 0u;
        long long v97 = 0u;
        long long v95 = 0u;
        long long v94 = 0u;
        id v57 = v54;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v94 objects:v113 count:16];
        if (v58)
        {
          uint64_t v59 = *(void *)v95;
          do
          {
            for (uint64_t j = 0; j != v58; ++j)
            {
              if (*(void *)v95 != v59) {
                objc_enumerationMutation(v57);
              }
              v61 = [[STUIAskForTimeRequestResponse alloc] initWithRequestResponse:*(void *)(*((void *)&v94 + 1) + 8 * j)];
              v62 = [(STUIAskForTimeRequestResponse *)v61 identifier];
              [v56 setObject:v61 forKeyedSubscript:v62];
            }
            uint64_t v58 = [v57 countByEnumeratingWithState:&v94 objects:v113 count:16];
          }
          while (v58);
        }

        v63 = [v77 unmodeledManagingOrganizationSettings];
        char v64 = [v63 allLimitsEnabled];
        v84[0] = MEMORY[0x263EF8330];
        v84[1] = 3221225472;
        v84[2] = __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_267;
        v84[3] = &unk_264768690;
        id v85 = *(id *)(v80 + 48);
        v86 = v76;
        id v87 = v82;
        char v93 = v64;
        v88 = v75;
        id v65 = v56;
        id v89 = v65;
        objc_copyWeak(&v92, (id *)(v80 + 72));
        long long v72 = *(_OWORD *)(v80 + 56);
        id v66 = (id)v72;
        long long v91 = v72;
        uint64_t v90 = *(void *)(v80 + 40);
        dispatch_async(MEMORY[0x263EF83A0], v84);
        if (v73)
        {
          v67 = [*(id *)(v80 + 40) persistenceController];
          id v83 = v55;
          char v68 = [v67 saveContext:v79 error:&v83];
          id v22 = v83;

          if (v68)
          {
            v69 = +[STUILog persistence];
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block) = 0;
              _os_log_impl(&dword_225B06000, v69, OS_LOG_TYPE_DEFAULT, "Saved database after deleting corrupt blueprints", (uint8_t *)&block, 2u);
            }
          }
          else
          {
            v69 = +[STUILog persistence];
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
              __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4();
            }
          }
        }
        else
        {
          id v22 = v55;
        }

        objc_destroyWeak(&v92);
      }
      else
      {
        v70 = +[STUILog persistence];
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
          __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3();
        }

        v71 = (void (**)(id, id))*(id *)(v80 + 56);
        id v22 = v55;
        if (v71)
        {
          if ([MEMORY[0x263F08B88] isMainThread])
          {
            v71[2](v71, v22);
          }
          else
          {
            uint64_t block = MEMORY[0x263EF8330];
            uint64_t v108 = 3221225472;
            v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
            v110 = &unk_264767628;
            v112 = v71;
            id v111 = v22;
            dispatch_async(MEMORY[0x263EF83A0], &block);
          }
        }
      }
LABEL_92:
      v43 = v75;
LABEL_93:

      id v6 = v76;
LABEL_94:

      goto LABEL_95;
    }
    goto LABEL_12;
  }
  v23 = +[STUILog persistence];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
    __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_2();
  }

  id v24 = (void (**)(id, id))*(id *)(a1 + 56);
  id v22 = v5;
  if (v24)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v24[2](v24, v22);
    }
    else
    {
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v108 = 3221225472;
      v109 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      v110 = &unk_264767628;
      v112 = v24;
      id v111 = v22;
      dispatch_async(MEMORY[0x263EF83A0], &block);
    }
  }

LABEL_95:
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_267(uint64_t a1)
{
  [*(id *)(a1 + 32) setBedtime:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setAllowancesByIdentifier:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setAllAllowancesEnabled:*(unsigned __int8 *)(a1 + 104)];
  [*(id *)(a1 + 32) setAlwaysAllowList:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setPendingAskForTimeByIdentifier:*(void *)(a1 + 64)];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  [WeakRetained setUserObjectID:v2];

  id v4 = (void (**)(id, void))*(id *)(a1 + 80);
  if (v4)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v4[2](v4, 0);
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      block[3] = &unk_264767628;
      id v13 = 0;
      uint64_t v14 = v4;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }

  id v5 = [*(id *)(a1 + 56) allowedBundleIDs];
  id v6 = [MEMORY[0x263F318B0] sharedCategories];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_264768668;
  uint64_t v7 = *(void *)(a1 + 72);
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  [v6 categoriesForBundleIDs:v8 completionHandler:v9];
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9B0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_270;
    v13[3] = &unk_264767050;
    id v8 = v7;
    id v14 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v13];
    id v9 = [MEMORY[0x263F08A48] mainQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2_273;
    v11[3] = &unk_264767078;
    void v11[4] = *(void *)(a1 + 40);
    id v12 = v8;
    id v10 = v8;
    [v9 addOperationWithBlock:v11];
  }
  else
  {
    id v10 = +[STUILog persistence];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2_cold_1();
    }
  }
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [a3 canonicalBundleIdentifier];
  id v8 = (id)v6;
  if (v6) {
    id v7 = (id)v6;
  }
  else {
    id v7 = v5;
  }
  [v4 addObject:v7];
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2_273(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 40) array];
  uint64_t v2 = [*(id *)(a1 + 32) viewModel];
  id v3 = [v2 alwaysAllowList];
  [v3 setAllowedBundleIDs:v4];
}

- (id)_iCloudAccountPredicate
{
  uint64_t v2 = (void *)MEMORY[0x263F33380];
  id v3 = [(STTimeAllowancesViewModelCoordinator *)self userDSID];
  id v4 = [v3 stringValue];
  id v5 = [v2 buildWithDSID:v4];

  return v5;
}

- (void)saveDeviceBedtime:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__STTimeAllowancesViewModelCoordinator_saveDeviceBedtime_completionHandler___block_invoke;
  v11[3] = &unk_2647686E0;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  [v8 performBackgroundTask:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __76__STTimeAllowancesViewModelCoordinator_saveDeviceBedtime_completionHandler___block_invoke(id *a1, void *a2)
{
  v39[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = [WeakRetained userObjectID];

  if (v5)
  {
    uint64_t v6 = [v3 objectWithID:v5];
    if (v6)
    {
      id v7 = (void (**)(id, id))v6;
      id v8 = [a1[4] scheduleByWeekdayIndex];
      if (v8)
      {
        id v9 = 0;
        id v10 = 0;
      }
      else
      {
        id v17 = [a1[4] simpleSchedule];
        id v9 = [v17 startTime];
        id v10 = [v17 endTime];
      }
      uint64_t v18 = [a1[4] askForMoreTime];
      id v19 = (void *)MEMORY[0x263F67108];
      uint64_t v20 = [a1[4] deviceBedtimeEnabled];
      id v31 = 0;
      LODWORD(v18) = [v19 saveDowntimeForUser:v7 startTime:v9 endTime:v10 scheduleByWeekdayIndex:v8 enabled:v20 behaviorType:v18 error:&v31];
      id v21 = v31;
      if (v18)
      {
        if (_os_feature_enabled_impl())
        {
          id v22 = (void (**)(id, void))a1[5];
          if (v22)
          {
            if ([MEMORY[0x263F08B88] isMainThread])
            {
              v22[2](v22, 0);
            }
            else
            {
              uint64_t block = MEMORY[0x263EF8330];
              uint64_t v33 = 3221225472;
              v34 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              BOOL v35 = &unk_264767628;
              v27 = v22;
              id v36 = 0;
              v37 = v27;
              dispatch_async(MEMORY[0x263EF83A0], &block);
            }
          }

          id v16 = v21;
          goto LABEL_32;
        }
        char v29 = v9;
        id v24 = [MEMORY[0x263F67088] sharedController];
        id v30 = v21;
        char v25 = [v24 saveContext:v3 error:&v30];
        id v16 = v30;

        id v26 = a1[5];
        if (v25)
        {
          v23 = (void (**)(id, void))v26;
          id v9 = v29;
          if (v23)
          {
            if ([MEMORY[0x263F08B88] isMainThread])
            {
              v23[2](v23, 0);
            }
            else
            {
              uint64_t block = MEMORY[0x263EF8330];
              uint64_t v33 = 3221225472;
              v34 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              BOOL v35 = &unk_264767628;
              id v28 = v23;
              id v36 = 0;
              v37 = v28;
              dispatch_async(MEMORY[0x263EF83A0], &block);
            }
          }
          goto LABEL_27;
        }
        v23 = (void (**)(id, void))v26;
        id v16 = v16;
        id v9 = v29;
        if (!v23)
        {
LABEL_26:

LABEL_27:
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        v23 = (void (**)(id, void))a1[5];
        id v16 = v21;
        if (!v23) {
          goto LABEL_26;
        }
      }
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        ((void (**)(id, id))v23)[2](v23, v16);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v33 = 3221225472;
        v34 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        BOOL v35 = &unk_264767628;
        v37 = v23;
        id v36 = v16;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
      goto LABEL_26;
    }
  }
  uint64_t v11 = +[STUILog persistence];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_1();
  }

  id v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v13 = *MEMORY[0x263F67300];
  uint64_t v38 = *MEMORY[0x263F08320];
  v39[0] = @"user could not be found";
  id v14 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
  uint64_t v15 = [v12 errorWithDomain:v13 code:11 userInfo:v14];

  id v7 = (void (**)(id, id))a1[5];
  id v16 = v15;
  if (v7)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v7[2](v7, v16);
    }
    else
    {
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      v34 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      BOOL v35 = &unk_264767628;
      v37 = v7;
      id v36 = v16;
      dispatch_async(MEMORY[0x263EF83A0], &block);
    }
  }

LABEL_33:
}

- (void)toggleDowntimeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STTimeAllowancesViewModelCoordinator *)self userObjectID];
  uint64_t v6 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke;
  v9[3] = &unk_2647679A8;
  uint64_t v11 = self;
  id v12 = v4;
  id v10 = v5;
  id v7 = v4;
  id v8 = v5;
  [v6 performBackgroundTask:v9];
}

void __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v33[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32) && (objc_msgSend(v3, "objectWithID:"), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (id)v5;
    id v7 = objc_alloc(MEMORY[0x263F67288]);
    id v8 = [v6 dsid];
    id v9 = (void *)[v7 initWithDSID:v8];

    int v10 = [*(id *)(a1 + 40) isDowntimeActive];
    id v25 = 0;
    uint64_t v11 = [MEMORY[0x263F67108] applyAutomaticOnDemandDowntimeStateChange:v10 ^ 1u forUserID:v9 context:v4 error:&v25];
    id v12 = v25;

    if (v11)
    {
      uint64_t v13 = [MEMORY[0x263F67088] sharedController];
      id v24 = v12;
      int v14 = [v13 saveContext:v4 error:&v24];
      id v15 = v24;

      if (v14) {
        id v16 = 0;
      }
      else {
        id v16 = v15;
      }
      id v12 = v15;
    }
    else
    {
      id v16 = v12;
    }
    id v22 = (void (**)(id, id))*(id *)(a1 + 48);
    id v23 = v16;
    if (v22)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v22[2](v22, v23);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v27 = 3221225472;
        id v28 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        char v29 = &unk_264767628;
        id v31 = v22;
        id v30 = v23;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
  else
  {
    id v17 = +[STUILog persistence];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke_cold_1();
    }

    uint64_t v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F67300];
    uint64_t v32 = *MEMORY[0x263F08320];
    v33[0] = @"user could not be found";
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v21 = [v18 errorWithDomain:v19 code:11 userInfo:v20];

    id v6 = *(id *)(a1 + 48);
    id v12 = v21;
    if (v6)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        (*((void (**)(id, id))v6 + 2))(v6, v12);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v27 = 3221225472;
        id v28 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        char v29 = &unk_264767628;
        id v31 = (void (**)(id, id))v6;
        id v30 = v12;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
}

- (BOOL)isDowntimeActive
{
  id v3 = objc_alloc(MEMORY[0x263F67288]);
  id v4 = [(STTimeAllowancesViewModelCoordinator *)self userDSID];
  uint64_t v5 = (void *)[v3 initWithDSID:v4];

  id v6 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
  id v7 = [v6 viewContext];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__STTimeAllowancesViewModelCoordinator_isDowntimeActive__block_invoke;
  v11[3] = &unk_2647683A0;
  id v8 = v5;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  int v14 = &v15;
  [v9 performBlockAndWait:v11];
  LOBYTE(v7) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v7;
}

void __56__STTimeAllowancesViewModelCoordinator_isDowntimeActive__block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  id v4 = [MEMORY[0x263F67108] downtimeConfigurationForUserID:v2 context:v3 error:&v7];
  id v5 = v7;
  unint64_t v6 = [v4 currentState];

  if (v6 <= 4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0x100010000uLL >> (8 * v6);
  }
}

- (int64_t)currentDowntimeState
{
  id v3 = objc_alloc(MEMORY[0x263F67288]);
  id v4 = [(STTimeAllowancesViewModelCoordinator *)self userDSID];
  id v5 = (void *)[v3 initWithDSID:v4];

  unint64_t v6 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
  id v7 = [v6 viewContext];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__STTimeAllowancesViewModelCoordinator_currentDowntimeState__block_invoke;
  v12[3] = &unk_264768708;
  uint64_t v15 = &v16;
  id v8 = v5;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [v9 performBlockAndWait:v12];
  int64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __60__STTimeAllowancesViewModelCoordinator_currentDowntimeState__block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v6 = 0;
  id v4 = [MEMORY[0x263F67108] downtimeConfigurationForUserID:v2 context:v3 error:&v6];
  id v5 = v6;
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v4 currentState];
}

- (double)timeToNextExpectedStateChange
{
  id v3 = objc_alloc(MEMORY[0x263F67288]);
  id v4 = [(STTimeAllowancesViewModelCoordinator *)self userDSID];
  id v5 = (void *)[v3 initWithDSID:v4];

  id v6 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
  id v7 = [v6 viewContext];

  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__6;
  id v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__STTimeAllowancesViewModelCoordinator_timeToNextExpectedStateChange__block_invoke;
  v15[3] = &unk_264768708;
  uint64_t v18 = &v19;
  id v8 = v5;
  id v16 = v8;
  id v9 = v7;
  id v17 = v9;
  [v9 performBlockAndWait:v15];
  if (v20[5])
  {
    int64_t v10 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    uint64_t v11 = STLocalDateFromUTCErasedDate();
    [v11 timeIntervalSinceNow];
    double v13 = v12;
  }
  else
  {
    double v13 = -1.0;
  }

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __69__STTimeAllowancesViewModelCoordinator_timeToNextExpectedStateChange__block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  id v4 = [MEMORY[0x263F67108] downtimeConfigurationForUserID:v2 context:v3 error:&v9];
  id v5 = v9;
  uint64_t v6 = [v4 nextStateChangeDate];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)saveAllowance:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__STTimeAllowancesViewModelCoordinator_saveAllowance_completionHandler___block_invoke;
  v11[3] = &unk_2647679A8;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 performBackgroundTask:v11];
}

void __72__STTimeAllowancesViewModelCoordinator_saveAllowance_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v34[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userObjectID];
  if (!v4 || ([v3 objectWithID:v4], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v12 = +[STUILog persistence];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_1();
    }

    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F67300];
    uint64_t v33 = *MEMORY[0x263F08320];
    v34[0] = @"user could not be found";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v16 = [v13 errorWithDomain:v14 code:11 userInfo:v15];

    id v6 = (void (**)(id, id))*(id *)(a1 + 48);
    id v17 = v16;
    if (v6)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v6[2](v6, v17);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        char v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        id v30 = &unk_264767628;
        uint64_t v32 = v6;
        id v31 = v17;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }

    goto LABEL_26;
  }
  id v6 = (void (**)(id, id))v5;
  id v7 = objc_opt_class();
  uint64_t v8 = *(void *)(a1 + 40);
  id v26 = 0;
  int v9 = [v7 saveAllowance:v8 forUser:v6 error:&v26];
  id v10 = v26;
  if (!v9)
  {
    uint64_t v18 = (void (**)(id, void))*(id *)(a1 + 48);
    id v19 = v10;
    goto LABEL_14;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v20 = [MEMORY[0x263F67088] sharedController];
    id v25 = v10;
    char v21 = [v20 saveContext:v3 error:&v25];
    id v17 = v25;

    id v22 = *(void **)(a1 + 48);
    if (v21)
    {
      uint64_t v18 = v22;
      if (v18)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          v18[2](v18, 0);
        }
        else
        {
          uint64_t block = MEMORY[0x263EF8330];
          uint64_t v28 = 3221225472;
          char v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
          id v30 = &unk_264767628;
          id v24 = v18;
          id v31 = 0;
          uint64_t v32 = v24;
          dispatch_async(MEMORY[0x263EF83A0], &block);
        }
      }
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
    uint64_t v18 = v22;
    id v19 = v17;
LABEL_14:
    id v17 = v19;
    if (v18)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        ((void (**)(id, id))v18)[2](v18, v17);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        char v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        id v30 = &unk_264767628;
        uint64_t v32 = v18;
        id v31 = v17;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }

    goto LABEL_25;
  }
  uint64_t v11 = (void (**)(id, void))*(id *)(a1 + 48);
  if (v11)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v11[2](v11, 0);
    }
    else
    {
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      char v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      id v30 = &unk_264767628;
      id v23 = v11;
      id v31 = 0;
      uint64_t v32 = v23;
      dispatch_async(MEMORY[0x263EF83A0], &block);
    }
  }

  id v17 = v10;
LABEL_27:
}

+ (BOOL)saveAllowance:(id)a3 forUser:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 timeByDay];
  if (v8)
  {
    int v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __68__STTimeAllowancesViewModelCoordinator_saveAllowance_forUser_error___block_invoke;
    v31[3] = &unk_264768730;
    id v32 = v9;
    id v29 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v31];
    id v10 = (void *)MEMORY[0x263F67108];
    uint64_t v11 = [v7 identifier];
    id v12 = [v7 bundleIdentifiers];
    id v13 = [v7 webDomains];
    uint64_t v14 = [v7 categoryIdentifiers];
    char v15 = [v7 allowanceEnabled];
    uint64_t v16 = [v7 behaviorType];

    LOBYTE(v28) = v15;
    char v17 = [v10 saveUsageLimitWithIdentifier:v11 user:v6 bundleIdentifiers:v12 webDomains:v13 categoryIdentifiers:v14 dailyBudgetLimit:v29 budgetLimitByWeekday:0.0 enabled:v28 behaviorType:v16 error:a5];
  }
  else
  {
    uint64_t v18 = [v7 time];
    +[STAllowance timeIntervalForAllowanceDateComponents:v18];
    double v20 = v19;

    char v21 = (void *)MEMORY[0x263F67108];
    id v22 = [v7 identifier];
    id v23 = [v7 bundleIdentifiers];
    id v24 = [v7 webDomains];
    id v25 = [v7 categoryIdentifiers];
    LOBYTE(v18) = [v7 allowanceEnabled];
    uint64_t v26 = [v7 behaviorType];

    LOBYTE(v28) = (_BYTE)v18;
    char v17 = [v21 saveUsageLimitWithIdentifier:v22 user:v6 bundleIdentifiers:v23 webDomains:v24 categoryIdentifiers:v25 dailyBudgetLimit:0 budgetLimitByWeekday:v20 enabled:v28 behaviorType:v26 error:a5];
  }
  return v17;
}

void __68__STTimeAllowancesViewModelCoordinator_saveAllowance_forUser_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = NSNumber;
  id v6 = a2;
  +[STAllowance timeIntervalForAllowanceDateComponents:a3];
  objc_msgSend(v5, "numberWithDouble:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (void)deleteAllowance:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STTimeAllowancesViewModelCoordinator *)self userObjectID];
  int v9 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__STTimeAllowancesViewModelCoordinator_deleteAllowance_completionHandler___block_invoke;
  v13[3] = &unk_2647679A8;
  id v15 = v6;
  id v16 = v7;
  id v14 = v8;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  [v9 performBackgroundTask:v13];
}

void __74__STTimeAllowancesViewModelCoordinator_deleteAllowance_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = objc_msgSend(v3, "objectWithID:");
    if (v5)
    {
      id v6 = (void (**)(id, id))v5;
      id v7 = (void *)MEMORY[0x263F67108];
      uint64_t v8 = [*(id *)(a1 + 40) identifier];
      id v23 = 0;
      LODWORD(v7) = [v7 deleteUsageLimitWithIdentifier:v8 user:v6 managedObjectContext:v4 error:&v23];
      id v9 = v23;

      if (v7)
      {
        id v10 = [MEMORY[0x263F67088] sharedController];
        id v22 = v9;
        char v11 = [v10 saveContext:v4 error:&v22];
        id v12 = v22;

        id v13 = *(void **)(a1 + 48);
        if (v11)
        {
          id v14 = v13;
          if (v14)
          {
            if ([MEMORY[0x263F08B88] isMainThread])
            {
              v14[2](v14, 0);
            }
            else
            {
              uint64_t block = MEMORY[0x263EF8330];
              uint64_t v25 = 3221225472;
              uint64_t v26 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
              uint64_t v27 = &unk_264767628;
              char v21 = v14;
              id v28 = 0;
              id v29 = v21;
              dispatch_async(MEMORY[0x263EF83A0], &block);
            }
          }
LABEL_22:

          goto LABEL_23;
        }
        id v14 = v13;
        id v20 = v12;
      }
      else
      {
        id v14 = (void (**)(id, void))*(id *)(a1 + 48);
        id v20 = v9;
      }
      id v12 = v20;
      if (v14)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          ((void (**)(id, id))v14)[2](v14, v12);
        }
        else
        {
          uint64_t block = MEMORY[0x263EF8330];
          uint64_t v25 = 3221225472;
          uint64_t v26 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
          uint64_t v27 = &unk_264767628;
          id v29 = v14;
          id v28 = v12;
          dispatch_async(MEMORY[0x263EF83A0], &block);
        }
      }

      goto LABEL_22;
    }
  }
  id v15 = +[STUILog persistence];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke_cold_1();
  }

  id v16 = (void *)MEMORY[0x263F087E8];
  uint64_t v17 = *MEMORY[0x263F67300];
  uint64_t v30 = *MEMORY[0x263F08320];
  v31[0] = @"user could not be found";
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  double v19 = [v16 errorWithDomain:v17 code:11 userInfo:v18];

  id v6 = (void (**)(id, id))*(id *)(a1 + 48);
  id v12 = v19;
  if (v6)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v6[2](v6, v12);
    }
    else
    {
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      uint64_t v27 = &unk_264767628;
      id v29 = v6;
      id v28 = v12;
      dispatch_async(MEMORY[0x263EF83A0], &block);
    }
  }

LABEL_23:
}

- (void)saveAllAllowancesEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(STTimeAllowancesViewModelCoordinator *)self viewModel];
  [v7 setAllAllowancesEnabled:v4];

  uint64_t v8 = [(STTimeAllowancesViewModelCoordinator *)self userObjectID];
  id v9 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__STTimeAllowancesViewModelCoordinator_saveAllAllowancesEnabled_completionHandler___block_invoke;
  v12[3] = &unk_264768758;
  id v14 = self;
  id v15 = v6;
  BOOL v16 = v4;
  id v13 = v8;
  id v10 = v6;
  id v11 = v8;
  [v9 performBackgroundTask:v12];
}

void __83__STTimeAllowancesViewModelCoordinator_saveAllAllowancesEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v29[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = v3;
  if (*(void *)(a1 + 32)
    && (objc_msgSend(v3, "objectWithID:"), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    id v7 = [v5 unmodeledManagingOrganizationSettings];
    [v7 setAllLimitsEnabled:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v8 = [v6 familySettings];
    if (v7 == v8) {
      [v7 setIsDirty:1];
    }
    id v9 = [*(id *)(a1 + 40) persistenceController];
    id v21 = 0;
    char v10 = [v9 saveContext:v4 error:&v21];
    id v11 = v21;

    if (v10)
    {
      id v12 = (void (**)(id, void))*(id *)(a1 + 48);
      if (v12)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          v12[2](v12, 0);
        }
        else
        {
          uint64_t block = MEMORY[0x263EF8330];
          uint64_t v23 = 3221225472;
          id v24 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
          uint64_t v25 = &unk_264767628;
          id v20 = v12;
          id v26 = 0;
          uint64_t v27 = v20;
          dispatch_async(MEMORY[0x263EF83A0], &block);
        }
      }
    }
    else
    {
      uint64_t v18 = +[STUILog persistence];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_cold_2();
      }

      id v12 = (void (**)(id, void))*(id *)(a1 + 48);
      id v19 = v11;
      if (v12)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          ((void (**)(id, id))v12)[2](v12, v19);
        }
        else
        {
          uint64_t block = MEMORY[0x263EF8330];
          uint64_t v23 = 3221225472;
          id v24 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
          uint64_t v25 = &unk_264767628;
          uint64_t v27 = v12;
          id v26 = v19;
          dispatch_async(MEMORY[0x263EF83A0], &block);
        }
      }
    }
  }
  else
  {
    id v13 = +[STUILog persistence];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke_cold_1();
    }

    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F67300];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29[0] = @"user could not be found";
    BOOL v16 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v17 = [v14 errorWithDomain:v15 code:11 userInfo:v16];

    id v6 = *(id *)(a1 + 48);
    id v11 = v17;
    if (v6)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        (*((void (**)(id, id))v6 + 2))(v6, v11);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v23 = 3221225472;
        id v24 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        uint64_t v25 = &unk_264767628;
        uint64_t v27 = (void (**)(id, void))v6;
        id v26 = v11;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
}

- (void)saveAlwaysAllowList:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFFA08];
  id v8 = a3;
  id v9 = [(STTimeAllowancesViewModelCoordinator *)self viewModel];
  char v10 = [v9 alwaysAllowList];
  id v11 = [v10 allowedBundleIDs];
  id v12 = [v7 setWithArray:v11];

  id v13 = [v8 allowedBundleIDs];

  id v14 = [MEMORY[0x263EFFA08] setWithArray:v13];
  if ([v12 isEqualToSet:v14])
  {
    uint64_t v15 = (void (**)(id, void))v6;
    if (v15)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v15[2](v15, 0);
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        block[3] = &unk_264767628;
        id v27 = 0;
        uint64_t v28 = v15;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  else
  {
    BOOL v16 = [(STTimeAllowancesViewModelCoordinator *)self userDSID];
    uint64_t v17 = [(STTimeAllowancesViewModelCoordinator *)self userObjectID];
    uint64_t v18 = [(STTimeAllowancesViewModelCoordinator *)self persistenceController];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __78__STTimeAllowancesViewModelCoordinator_saveAlwaysAllowList_completionHandler___block_invoke;
    v21[3] = &unk_264768780;
    id v22 = v17;
    id v23 = v16;
    id v25 = v6;
    id v24 = v13;
    id v19 = v16;
    id v20 = v17;
    [v18 performBackgroundTask:v21];
  }
}

void __78__STTimeAllowancesViewModelCoordinator_saveAlwaysAllowList_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v34[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "objectWithID:");
    uint64_t v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
    id v6 = 0;
    if (!v5) {
      goto LABEL_23;
    }
LABEL_6:
    uint64_t v8 = *(void *)(a1 + 48);
    id v25 = v6;
    int v9 = [MEMORY[0x263F67108] saveAlwaysAllowListForUser:v5 withBundleIDs:v8 error:&v25];
    id v10 = v25;

    if (v9)
    {
      id v11 = [MEMORY[0x263F67088] sharedController];
      id v24 = v10;
      char v12 = [v11 saveContext:v4 error:&v24];
      id v13 = v24;

      id v14 = *(void **)(a1 + 56);
      if (v12)
      {
        uint64_t v15 = v14;
        if (v15)
        {
          if ([MEMORY[0x263F08B88] isMainThread])
          {
            v15[2](v15, 0);
          }
          else
          {
            uint64_t block = MEMORY[0x263EF8330];
            uint64_t v28 = 3221225472;
            id v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
            uint64_t v30 = &unk_264767628;
            id v23 = v15;
            id v31 = 0;
            id v32 = v23;
            dispatch_async(MEMORY[0x263EF83A0], &block);
          }
        }
LABEL_19:

        goto LABEL_30;
      }
      uint64_t v15 = v14;
      id v16 = v13;
    }
    else
    {
      uint64_t v15 = (void (**)(id, void))*(id *)(a1 + 56);
      id v16 = v10;
    }
    id v13 = v16;
    if (v15)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        ((void (**)(id, id))v15)[2](v15, v13);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        id v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
        uint64_t v30 = &unk_264767628;
        id v32 = v15;
        id v31 = v13;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }

    goto LABEL_19;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v26 = 0;
    uint64_t v5 = [MEMORY[0x263F67168] fetchUserWithDSID:v7 inContext:v3 error:&v26];
    id v6 = v26;
    if (!v5)
    {
      uint64_t v17 = +[STUILog persistence];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_2();
      }

      goto LABEL_23;
    }
    goto LABEL_6;
  }
  id v6 = 0;
LABEL_23:
  uint64_t v18 = +[STUILog persistence];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
    __78__STTimeAllowancesViewModelCoordinator_saveAlwaysAllowList_completionHandler___block_invoke_cold_1();
  }

  id v19 = (void *)MEMORY[0x263F087E8];
  uint64_t v20 = *MEMORY[0x263F67300];
  uint64_t v33 = *MEMORY[0x263F08320];
  v34[0] = @"user could not be found";
  id v21 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
  id v22 = [v19 errorWithDomain:v20 code:11 userInfo:v21];

  uint64_t v5 = (void (**)(id, id))*(id *)(a1 + 56);
  id v13 = v22;
  if (v5)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v5[2](v5, v13);
    }
    else
    {
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      id v29 = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      uint64_t v30 = &unk_264767628;
      id v32 = v5;
      id v31 = v13;
      dispatch_async(MEMORY[0x263EF83A0], &block);
    }
  }

LABEL_30:
}

- (void)respondToAskForTime:(id)a3 withApproval:(BOOL)a4 timeApproved:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(STTimeAllowancesViewModelCoordinator *)self askForTimeClient];
  id v14 = objc_alloc(MEMORY[0x263F08C38]);
  uint64_t v15 = [v12 identifier];

  id v16 = (void *)[v14 initWithUUIDString:v15];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __104__STTimeAllowancesViewModelCoordinator_respondToAskForTime_withApproval_timeApproved_completionHandler___block_invoke;
  v18[3] = &unk_264767768;
  id v19 = v10;
  id v17 = v10;
  [v13 handleAnswer:!v7 requestIdentifier:v16 timeApproved:v11 completionHandler:v18];
}

void __104__STTimeAllowancesViewModelCoordinator_respondToAskForTime_withApproval_timeApproved_completionHandler___block_invoke(uint64_t a1)
{
  v1 = (void (**)(id, void))*(id *)(a1 + 32);
  if (v1)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v1[2](v1, 0);
    }
    else
    {
      v2[0] = MEMORY[0x263EF8330];
      v2[1] = 3221225472;
      v2[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_2;
      v2[3] = &unk_264767628;
      id v3 = 0;
      BOOL v4 = v1;
      dispatch_async(MEMORY[0x263EF83A0], v2);
    }
  }
}

- (STTimeAllowancesViewModel)viewModel
{
  return (STTimeAllowancesViewModel *)objc_getProperty(self, a2, 8, 1);
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

- (STAskForTimeClient)askForTimeClient
{
  return self->_askForTimeClient;
}

- (STGroupFetchedResultsController)groupFetchResultsController
{
  return self->_groupFetchResultsController;
}

- (NSManagedObjectID)userObjectID
{
  return self->_userObjectID;
}

- (void)setUserObjectID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userObjectID, 0);
  objc_storeStrong((id *)&self->_groupFetchResultsController, 0);
  objc_storeStrong((id *)&self->_askForTimeClient, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "user with DSID could not be found: %{public}@", v2, v3, v4, v5, v6);
}

void __88__STTimeAllowancesViewModelCoordinator_saveDefaultAlwaysAllowListWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2(&dword_225B06000, v0, v1, "failed to fetch user with DSID %{public}@: %{public}@");
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "user with DSID could not be found: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Error fetching existing ask for time request responses: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "failed to fetch bedtime blueprint: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "failed to fetch usage limit blueprints: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "failed to fetch always allow blueprints: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_8(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  BOOL v7 = [a2 identifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_225B06000, a4, OS_LOG_TYPE_ERROR, "Deleting usage limit blueprint with missing configurations: %{public}@", a1, 0xCu);
}

void __75__STTimeAllowancesViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch categories for always allowed apps: %{public}@", v2, v3, v4, v5, v6);
}

void __76__STTimeAllowancesViewModelCoordinator_toggleDowntimeWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "user with objectID could not be found: %{public}@", v2, v3, v4, v5, v6);
}

void __78__STTimeAllowancesViewModelCoordinator_saveAlwaysAllowList_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2(*MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = v1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *(void *)(v0 + 40);
  OUTLINED_FUNCTION_2_2(&dword_225B06000, v0, v2, "user with objectID / DSID could not be found: %{public}@ / %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

@end