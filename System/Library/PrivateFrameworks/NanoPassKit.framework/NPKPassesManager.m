@interface NPKPassesManager
- (BOOL)shouldAllowMovingItemAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (NPKPassesManager)init;
- (NPKPassesManager)initWithOptions:(unint64_t)a3;
- (NPKStandaloneFirstUnlockCoordinator)firstUnlockCoordinator;
- (NSArray)currentExpiredPasses;
- (NSArray)currentPasses;
- (NSArray)currentPaymentPasses;
- (NSArray)currentSecureElementPasses;
- (NSDictionary)currentPassDynamicStates;
- (NSHashTable)observers;
- (PKGroupsController)groupsController;
- (id)defaultPaymentPass;
- (id)dynamicStateForPass:(id)a3;
- (id)passForUniqueID:(id)a3;
- (int)notifyToken;
- (unint64_t)options;
- (void)_didFinishLoadPasses;
- (void)_handleObjectSettingsChanged:(id)a3;
- (void)_loadContentAndImageSetsForPass:(id)a3 completion:(id)a4;
- (void)_loadImageSetFromPasses:(id)a3;
- (void)_loadPasses;
- (void)_notifyObservers:(id)a3;
- (void)_registerGroupControllerGroupObserver;
- (void)_reloadPasses;
- (void)_reloadPassesWithCompletion:(id)a3;
- (void)_updateCurrentPasses;
- (void)dealloc;
- (void)enableRemoteUpdates;
- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6;
- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5;
- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6;
- (void)group:(id)a3 didUpdatePassState:(id)a4 forPass:(id)a5 atIndex:(unint64_t)a6;
- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5;
- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5;
- (void)movePassAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)registerObserver:(id)a3;
- (void)reloadPassesWithCompletion:(id)a3;
- (void)removePass:(id)a3;
- (void)setCurrentExpiredPasses:(id)a3;
- (void)setCurrentPassDynamicStates:(id)a3;
- (void)setCurrentPasses:(id)a3;
- (void)setCurrentPaymentPasses:(id)a3;
- (void)setCurrentSecureElementPasses:(id)a3;
- (void)setDefaultPaymentPass:(id)a3;
- (void)setFirstUnlockCoordinator:(id)a3;
- (void)setGroupsController:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setObservers:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)suppressRemoteUpdates;
- (void)unarchivePass:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation NPKPassesManager

- (NPKPassesManager)init
{
  return [(NPKPassesManager *)self initWithOptions:0];
}

- (NPKPassesManager)initWithOptions:(unint64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)NPKPassesManager;
  v4 = [(NPKPassesManager *)&v23 init];
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    uint64_t v6 = objc_msgSend(MEMORY[0x263F088B0], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    v8 = [NPKStandaloneFirstUnlockCoordinator alloc];
    uint64_t v9 = [(NPKStandaloneFirstUnlockCoordinator *)v8 initWithQueue:MEMORY[0x263EF83A0]];
    firstUnlockCoordinator = v5->_firstUnlockCoordinator;
    v5->_firstUnlockCoordinator = (NPKStandaloneFirstUnlockCoordinator *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.nanoPassKit.NPKPassesManager.imageProcessing", 0);
    loadImageQueue = v5->_loadImageQueue;
    v5->_loadImageQueue = (OS_dispatch_queue *)v11;

    objc_initWeak(&location, v5);
    v13 = v5->_firstUnlockCoordinator;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __36__NPKPassesManager_initWithOptions___block_invoke;
    v19[3] = &unk_2644D2BB8;
    objc_copyWeak(&v21, &location);
    v14 = v5;
    v20 = v14;
    [(NPKStandaloneFirstUnlockCoordinator *)v13 performSubjectToFirstUnlock:v19];
    v14[4] = -1;
    v15 = (const char *)[(id)*MEMORY[0x263F5C528] UTF8String];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __36__NPKPassesManager_initWithOptions___block_invoke_53;
    v17[3] = &unk_2644D2870;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch(v15, v14 + 4, MEMORY[0x263EF83A0], v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __36__NPKPassesManager_initWithOptions___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __36__NPKPassesManager_initWithOptions___block_invoke_2;
  v2[3] = &unk_2644D2BB8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v4);
}

void __36__NPKPassesManager_initWithOptions___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKObservePassSettingsChanged();
    id v2 = objc_alloc_init(MEMORY[0x263F5BF80]);
    id v3 = (void *)[objc_alloc(MEMORY[0x263F5BEA8]) initWithPassLibrary:v2];
    [v3 setDelegate:WeakRetained];
    id v4 = (void *)WeakRetained[4];
    WeakRetained[4] = v3;

    v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Passes manager: Loading passes following first unlock", v8, 2u);
      }
    }
    [WeakRetained _loadPasses];
  }
}

void __36__NPKPassesManager_initWithOptions___block_invoke_53(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Passes manager: Reloading passes because default payment pass is changed", v5, 2u);
      }
    }
    [WeakRetained _reloadPasses];
  }
}

- (void)dealloc
{
  PKUnregisterPassSettingsChangedObserver();
  if (notify_is_valid_token(self->_notifyToken)) {
    notify_cancel(self->_notifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)NPKPassesManager;
  [(NPKPassesManager *)&v3 dealloc];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v6;
    if (!v5)
    {
      [(NSHashTable *)self->_observers addObject:v6];
      id v4 = v6;
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v6;
    if (v5)
    {
      [(NSHashTable *)self->_observers removeObject:v6];
      id v4 = v6;
    }
  }
}

- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v7;
      __int16 v16 = 2048;
      unint64_t v17 = a5;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Groups controller inserted group %@ at index %lu", buf, 0x16u);
    }
  }
  [v7 addGroupObserver:self];
  [(NPKPassesManager *)self _updateCurrentPasses];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__NPKPassesManager_groupsController_didInsertGroup_atIndex___block_invoke;
  v12[3] = &unk_2644D2BE0;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [(NPKPassesManager *)self _notifyObservers:v12];
}

void __60__NPKPassesManager_groupsController_didInsertGroup_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 passes];
  [v4 passesDataSource:v2 didAddPasses:v5];
}

- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a4;
  v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v9;
      __int16 v16 = 2048;
      unint64_t v17 = a5;
      __int16 v18 = 2048;
      unint64_t v19 = a6;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Groups controller moved group %@ from index %lu to index %lu", buf, 0x20u);
    }
  }
  [(NPKPassesManager *)self _updateCurrentPasses];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__NPKPassesManager_groupsController_didMoveGroup_fromIndex_toIndex___block_invoke;
  v13[3] = &unk_2644D2C08;
  v13[4] = self;
  [(NPKPassesManager *)self _notifyObservers:v13];
}

uint64_t __68__NPKPassesManager_groupsController_didMoveGroup_fromIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 passesDataSourceDidReorderPasses:*(void *)(a1 + 32)];
}

- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v7;
      __int16 v16 = 2048;
      unint64_t v17 = a5;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Groups controller removed group %@ at index %lu", buf, 0x16u);
    }
  }
  [(NPKPassesManager *)self _updateCurrentPasses];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__NPKPassesManager_groupsController_didRemoveGroup_atIndex___block_invoke;
  v12[3] = &unk_2644D2BE0;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [(NPKPassesManager *)self _notifyObservers:v12];
}

void __60__NPKPassesManager_groupsController_didRemoveGroup_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 passes];
  [v4 passesDataSource:v2 didRemovePasses:v5];
}

- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = pk_General_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = pk_General_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [v11 uniqueID];
      unint64_t v17 = [v11 localizedDescription];
      *(_DWORD *)buf = 138413314;
      id v23 = v10;
      __int16 v24 = 2112;
      v25 = v16;
      __int16 v26 = 2112;
      v27 = v17;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2048;
      unint64_t v31 = a6;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Group %@ inserted pass %@ (%@) with state (%@) at index %lu", buf, 0x34u);
    }
  }
  [(NPKPassesManager *)self _updateCurrentPasses];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __58__NPKPassesManager_group_didInsertPass_withState_atIndex___block_invoke;
  v20[3] = &unk_2644D2BE0;
  v20[4] = self;
  id v21 = v11;
  id v18 = v11;
  [(NPKPassesManager *)self _notifyObservers:v20];
  uint64_t v19 = NPKIsTruthOnCard(v18);
  NPKTrackTruthOnCard(v19);
}

void __58__NPKPassesManager_group_didInsertPass_withState_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  objc_super v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "passesDataSource:didAddPasses:", v2, v5, v6, v7);
}

- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = pk_General_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_General_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = v8;
      __int16 v15 = 2048;
      unint64_t v16 = a4;
      __int16 v17 = 2048;
      unint64_t v18 = a5;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Group %@ moved pass from index %lu to index %lu", buf, 0x20u);
    }
  }
  [(NPKPassesManager *)self _updateCurrentPasses];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__NPKPassesManager_group_didMovePassFromIndex_toIndex___block_invoke;
  v12[3] = &unk_2644D2C08;
  v12[4] = self;
  [(NPKPassesManager *)self _notifyObservers:v12];
}

uint64_t __55__NPKPassesManager_group_didMovePassFromIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 passesDataSourceDidReorderPasses:*(void *)(a1 + 32)];
}

- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v9 uniqueID];
      id v14 = [v9 localizedDescription];
      *(_DWORD *)buf = 138413058;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v13;
      __int16 v22 = 2112;
      id v23 = v14;
      __int16 v24 = 2048;
      unint64_t v25 = a5;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Group %@ removed pass %@ (%@) at index %lu", buf, 0x2Au);
    }
  }
  [(NPKPassesManager *)self _updateCurrentPasses];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__NPKPassesManager_group_didRemovePass_atIndex___block_invoke;
  v16[3] = &unk_2644D2BE0;
  v16[4] = self;
  id v17 = v9;
  id v15 = v9;
  [(NPKPassesManager *)self _notifyObservers:v16];
}

void __48__NPKPassesManager_group_didRemovePass_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  objc_super v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "passesDataSource:didRemovePasses:", v2, v5, v6, v7);
}

- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = pk_General_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = pk_General_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = [v11 uniqueID];
      id v17 = [v11 localizedDescription];
      *(_DWORD *)buf = 138413314;
      id v23 = v10;
      __int16 v24 = 2112;
      unint64_t v25 = v16;
      __int16 v26 = 2112;
      v27 = v17;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2048;
      unint64_t v31 = a6;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Group %@ updated pass %@ (%@) with state (%@) at index %lu", buf, 0x34u);
    }
  }
  [(NPKPassesManager *)self _updateCurrentPasses];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__NPKPassesManager_group_didUpdatePass_withState_atIndex___block_invoke;
  v19[3] = &unk_2644D2BE0;
  id v20 = v11;
  id v21 = self;
  id v18 = v11;
  [(NPKPassesManager *)self _notifyObservers:v19];
}

void __58__NPKPassesManager_group_didUpdatePass_withState_atIndex___block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v5[0] = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  [v3 passesDataSource:*(void *)(a1 + 40) didUpdatePasses:v4];
}

- (void)group:(id)a3 didUpdatePassState:(id)a4 forPass:(id)a5 atIndex:(unint64_t)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = pk_General_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = pk_General_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = [v12 uniqueID];
      id v17 = [v12 localizedDescription];
      *(_DWORD *)buf = 138413314;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      unint64_t v31 = v17;
      __int16 v32 = 2048;
      unint64_t v33 = a6;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Group %@ updated state (%@) for pass %@ (%@) at index %lu", buf, 0x34u);
    }
  }
  [(NPKPassesManager *)self _updateCurrentPasses];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61__NPKPassesManager_group_didUpdatePassState_forPass_atIndex___block_invoke;
  v20[3] = &unk_2644D2C30;
  id v21 = v12;
  id v22 = v11;
  id v23 = self;
  id v18 = v11;
  id v19 = v12;
  [(NPKPassesManager *)self _notifyObservers:v20];
}

void __61__NPKPassesManager_group_didUpdatePassState_forPass_atIndex___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    if (*(void *)(a1 + 32))
    {
      v11[0] = *(void *)(a1 + 32);
      id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    }
    else
    {
      id v4 = (void *)MEMORY[0x263EFFA68];
    }
    id v5 = [*(id *)(a1 + 32) uniqueID];
    if (v5 && *(void *)(a1 + 40))
    {
      uint64_t v6 = [*(id *)(a1 + 32) uniqueID];
      uint64_t v7 = *(void *)(a1 + 40);
      id v9 = v6;
      uint64_t v10 = v7;
      id v8 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    }
    else
    {
      id v8 = (void *)MEMORY[0x263EFFA78];
    }

    [v3 passesDataSource:*(void *)(a1 + 48) didUpdateStates:v8 forPasses:v4];
  }
}

- (id)passForUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  unint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v5 = [(NPKPassesManager *)self passes];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__NPKPassesManager_passForUniqueID___block_invoke;
  v9[3] = &unk_2644D2C58;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __36__NPKPassesManager_passForUniqueID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 uniqueID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)shouldAllowMovingItemAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v7 = [(NPKPassesManager *)self passes];
  if ([v7 count] <= a3 || objc_msgSend(v7, "count") <= a4)
  {
    BOOL v16 = 0;
  }
  else
  {
    int v8 = [v7 objectAtIndex:a3];
    id v9 = [v7 objectAtIndex:a4];
    groupsController = self->_groupsController;
    id v11 = [v8 uniqueID];
    uint64_t v12 = [(PKGroupsController *)groupsController groupIndexForPassUniqueID:v11];
    id v13 = self->_groupsController;
    uint64_t v14 = [v9 uniqueID];
    uint64_t v15 = [(PKGroupsController *)v13 groupIndexForPassUniqueID:v14];

    if (v12 == v15) {
      goto LABEL_4;
    }
    id v17 = self->_groupsController;
    id v18 = [v9 uniqueID];
    uint64_t v19 = [(PKGroupsController *)v17 groupIndexForPassUniqueID:v18];

    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v20 = [(PKGroupsController *)self->_groupsController groupAtIndex:v19];
      unint64_t v33 = [v20 passAtIndex:0];
      id v21 = objc_msgSend(v20, "passAtIndex:", objc_msgSend(v20, "passCount") - 1);
      id v22 = [v33 uniqueID];
      id v23 = [v9 uniqueID];
      int v32 = [v22 isEqualToString:v23];

      __int16 v24 = [v21 uniqueID];
      id v25 = [v9 uniqueID];
      int v26 = [v24 isEqualToString:v25];

      int v27 = a4 <= a3 ? v32 : v26;
      if (v27 != 1) {
        goto LABEL_4;
      }
    }
    if ([v8 passType] == 1
      && [v9 passType] == 1
      && [v8 style] != 7
      && [v9 style] == 7)
    {
LABEL_4:
      BOOL v16 = 0;
    }
    else
    {
      uint64_t v28 = [v8 passType];
      if ((a4 > a3 || v28 != 1) && ((uint64_t v29 = [v8 passType], a4 <= a3) || v29 == 1))
      {
        uint64_t v30 = [v9 passType];
        BOOL v16 = v30 == [v8 passType];
      }
      else
      {
        BOOL v16 = 1;
      }
    }
  }
  return v16;
}

- (void)movePassAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = [(NPKPassesManager *)self passes];
  int v8 = [v7 objectAtIndexedSubscript:a3];

  id v9 = [(NPKPassesManager *)self passes];
  id v10 = [v9 objectAtIndexedSubscript:a4];

  id v11 = [(NPKPassesManager *)self groupsController];
  uint64_t v12 = [v8 uniqueID];
  uint64_t v13 = [v11 groupIndexForPassUniqueID:v12];

  uint64_t v14 = [(NPKPassesManager *)self groupsController];
  uint64_t v15 = [v10 uniqueID];
  uint64_t v16 = [v14 groupIndexForPassUniqueID:v15];

  id v17 = pk_Payment_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v16 == 0x7FFFFFFFFFFFFFFFLL || v13 == v16)
  {
    if (v18)
    {
      id v22 = pk_Payment_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [v8 uniqueID];
        *(_DWORD *)buf = 138413314;
        int v26 = v23;
        __int16 v27 = 2048;
        unint64_t v28 = a3;
        __int16 v29 = 2048;
        unint64_t v30 = a4;
        __int16 v31 = 2048;
        uint64_t v32 = v13;
        __int16 v33 = 2048;
        uint64_t v34 = v16;
        _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Warning: Not supported pass move. Pass %@ at index %lu to %lu (from group index %lu, to group index %lu)", buf, 0x34u);
      }
    }
  }
  else
  {
    if (v18)
    {
      uint64_t v19 = pk_Payment_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v8 uniqueID];
        *(_DWORD *)buf = 138413314;
        int v26 = v20;
        __int16 v27 = 2048;
        unint64_t v28 = a3;
        __int16 v29 = 2048;
        unint64_t v30 = a4;
        __int16 v31 = 2048;
        uint64_t v32 = v13;
        __int16 v33 = 2048;
        uint64_t v34 = v16;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Warning: Moving pass %@ at index %lu to %lu (from group index %lu, to group index %lu)", buf, 0x34u);
      }
    }
    id v21 = [(NPKPassesManager *)self groupsController];
    [v21 moveGroupAtIndex:v13 toIndex:v16];

    [(NPKPassesManager *)self _updateCurrentPasses];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __44__NPKPassesManager_movePassAtIndex_toIndex___block_invoke;
    v24[3] = &unk_2644D2C08;
    v24[4] = self;
    [(NPKPassesManager *)self _notifyObservers:v24];
  }
}

uint64_t __44__NPKPassesManager_movePassAtIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 passesDataSourceDidReorderPasses:*(void *)(a1 + 32)];
}

- (void)unarchivePass:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x263F5BF80] sharedInstance];
  id v6 = [v4 uniqueID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__NPKPassesManager_unarchivePass___block_invoke;
  v8[3] = &unk_2644D2C80;
  id v7 = v4;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [v5 setSortingState:2 forObjectWithUniqueID:v6 withCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __34__NPKPassesManager_unarchivePass___block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (a2)
  {
    if (v5)
    {
      id v6 = pk_General_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [*(id *)(a1 + 32) uniqueID];
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Pass with unique id:%@ was manually recovered successfully", (uint8_t *)&v10, 0xCu);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _reloadPasses];
  }
  else
  {
    if (!v5) {
      return;
    }
    id WeakRetained = pk_General_log();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) uniqueID];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_21E92F000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Warning: Pass with unique id:%@ failed to be manually recovered", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)removePass:(id)a3
{
  id v4 = a3;
  id v6 = [(NPKPassesManager *)self groupsController];
  BOOL v5 = [v4 uniqueID];

  [v6 handleUserPassDelete:v5];
}

- (void)setDefaultPaymentPass:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F5C0A8];
  id v4 = a3;
  id v6 = objc_alloc_init(v3);
  BOOL v5 = [v4 uniqueID];

  [v6 setDefaultPaymentPassUniqueIdentifier:v5];
}

- (id)defaultPaymentPass
{
  uint64_t v2 = [(NPKPassesManager *)self currentPasses];
  id v3 = [v2 firstObject];
  id v4 = [v3 secureElementPass];

  if (v4 && [v4 npkIsDefaultPassEligible]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)enableRemoteUpdates
{
}

- (void)suppressRemoteUpdates
{
}

- (void)reloadPassesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__NPKPassesManager_reloadPassesWithCompletion___block_invoke;
  v6[3] = &unk_2644D2CA8;
  id v7 = v4;
  id v5 = v4;
  [(NPKPassesManager *)self _reloadPassesWithCompletion:v6];
}

uint64_t __47__NPKPassesManager_reloadPassesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)dynamicStateForPass:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKPassesManager *)self passDynamicStates];
  id v6 = [v4 uniqueID];

  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (void)_updateCurrentPasses
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  [(NPKPassesManager *)self setCurrentPasses:0];
  [(NPKPassesManager *)self setCurrentPaymentPasses:0];
  [(NPKPassesManager *)self setCurrentSecureElementPasses:0];
  [(NPKPassesManager *)self setCurrentExpiredPasses:0];
  [(NPKPassesManager *)self setCurrentPassDynamicStates:0];
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (NPKIsRunningInStoreDemoMode()) {
    BOOL v8 = NPKIsPaymentSetupSupportedInRegion() != 2;
  }
  else {
    BOOL v8 = 1;
  }
  id v9 = [(NPKPassesManager *)self groupsController];
  int v10 = [v9 groups];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __40__NPKPassesManager__updateCurrentPasses__block_invoke;
  v34[3] = &unk_2644D2D20;
  BOOL v40 = v8;
  id v11 = v5;
  id v35 = v11;
  id v12 = v4;
  id v36 = v12;
  id v13 = v3;
  id v37 = v13;
  id v14 = v7;
  id v38 = v14;
  id v15 = v6;
  id v39 = v15;
  [v10 enumerateObjectsUsingBlock:v34];

  uint64_t v16 = [v12 arrayByAddingObjectsFromArray:v13];
  id v17 = [v16 arrayByAddingObjectsFromArray:v15];
  [(NPKPassesManager *)self setCurrentPasses:v17];

  BOOL v18 = (void *)[v12 copy];
  [(NPKPassesManager *)self setCurrentPaymentPasses:v18];

  uint64_t v19 = (void *)[v11 copy];
  [(NPKPassesManager *)self setCurrentSecureElementPasses:v19];

  id v20 = [(NPKPassesManager *)self groupsController];
  id v21 = [v20 expiredSectionPasses];
  id v22 = [v21 sortedArrayUsingComparator:&__block_literal_global_0];
  [(NPKPassesManager *)self setCurrentExpiredPasses:v22];

  id v23 = (void *)[v14 copy];
  [(NPKPassesManager *)self setCurrentPassDynamicStates:v23];

  __int16 v24 = pk_General_log();
  LODWORD(v21) = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    id v25 = pk_General_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v33 = [(NPKPassesManager *)self currentPasses];
      uint64_t v31 = [v33 count];
      uint64_t v32 = [(NPKPassesManager *)self currentPaymentPasses];
      uint64_t v26 = [v32 count];
      __int16 v27 = [(NPKPassesManager *)self currentSecureElementPasses];
      uint64_t v28 = [v27 count];
      __int16 v29 = [(NPKPassesManager *)self currentExpiredPasses];
      uint64_t v30 = [v29 count];
      *(_DWORD *)buf = 134218752;
      uint64_t v42 = v31;
      __int16 v43 = 2048;
      uint64_t v44 = v26;
      __int16 v45 = 2048;
      uint64_t v46 = v28;
      __int16 v47 = 2048;
      uint64_t v48 = v30;
      _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Updated passes with %lu passes, %lu payment styled passes, %lu se passes and %lu expired passes.", buf, 0x2Au);
    }
  }
}

void __40__NPKPassesManager__updateCurrentPasses__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 passes];
  id v5 = [v4 firstObject];

  BOOL v6 = [v5 style] == 6 && *(unsigned char *)(a1 + 72) != 0;
  id v7 = [v5 secureElementPass];

  if (v6 || v7)
  {
    BOOL v13 = v7 != 0;
    id v14 = [v3 passes];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __40__NPKPassesManager__updateCurrentPasses__block_invoke_2;
    v20[3] = &unk_2644D2CD0;
    id v9 = &v21;
    id v21 = v3;
    BOOL v26 = v13;
    int v10 = &v22;
    id v22 = *(id *)(a1 + 32);
    BOOL v27 = v6;
    id v11 = &v23;
    id v23 = *(id *)(a1 + 40);
    id v24 = *(id *)(a1 + 48);
    id v25 = *(id *)(a1 + 56);
    id v15 = v3;
    [v14 enumerateObjectsWithOptions:2 usingBlock:v20];

    BOOL v8 = v24;
  }
  else
  {
    BOOL v8 = [v3 passes];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __40__NPKPassesManager__updateCurrentPasses__block_invoke_3;
    v16[3] = &unk_2644D2CF8;
    id v9 = &v17;
    id v17 = v3;
    int v10 = &v18;
    id v18 = *(id *)(a1 + 64);
    id v11 = &v19;
    id v19 = *(id *)(a1 + 56);
    id v12 = v3;
    [v8 enumerateObjectsUsingBlock:v16];
  }
}

void __40__NPKPassesManager__updateCurrentPasses__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "passAtIndex:");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 40) insertObject:v15 atIndex:0];
    id v5 = [v15 secureElementPass];
    BOOL v6 = v5;
    if (v5 && [v5 npkIsBankConnectEligible])
    {
      id v7 = [*(id *)(a1 + 32) stateAtIndex:a3];
      BOOL v8 = v7;
      if (v7)
      {
        id v9 = [v7 liveRender];
        if (v9)
        {
          int v10 = [v8 liveRender];
          uint64_t v11 = [v10 enabled];
        }
        else
        {
          uint64_t v11 = 0;
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      [v6 npkSetLiveRenderEnabled:v11];
    }
  }
  if (!*(unsigned char *)(a1 + 73) || ([*(id *)(a1 + 48) insertObject:v15 atIndex:0], !*(unsigned char *)(a1 + 73)))
  {
    if (*(unsigned char *)(a1 + 72)) {
      [*(id *)(a1 + 56) insertObject:v15 atIndex:0];
    }
  }
  id v12 = [*(id *)(a1 + 32) stateAtIndex:a3];
  BOOL v13 = *(void **)(a1 + 64);
  id v14 = [v15 uniqueID];
  [v13 setObject:v12 forKeyedSubscript:v14];
}

void __40__NPKPassesManager__updateCurrentPasses__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "passAtIndex:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) safelyAddObject:v8];
  id v5 = [*(id *)(a1 + 32) stateAtIndex:a3];
  BOOL v6 = *(void **)(a1 + 48);
  id v7 = [v8 uniqueID];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

uint64_t __40__NPKPassesManager__updateCurrentPasses__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 comparePassDatesToPass:a2 searchOption:3];
}

- (void)_registerGroupControllerGroupObserver
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(NPKPassesManager *)self groupsController];
  id v4 = [v3 groups];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "addGroupObserver:", self, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_loadPasses
{
  groupsController = self->_groupsController;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __31__NPKPassesManager__loadPasses__block_invoke;
  v3[3] = &unk_2644D2910;
  v3[4] = self;
  [(PKGroupsController *)groupsController loadGroupsWithCompletion:v3];
}

uint64_t __31__NPKPassesManager__loadPasses__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[88])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    void v5[2] = __31__NPKPassesManager__loadPasses__block_invoke_2;
    v5[3] = &unk_2644D2910;
    v5[4] = v2;
    [v2 _loadImageSetFromPasses:v5];
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __31__NPKPassesManager__loadPasses__block_invoke_3;
    v4[3] = &unk_2644D2910;
    v4[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
  return [*(id *)(a1 + 32) _registerGroupControllerGroupObserver];
}

uint64_t __31__NPKPassesManager__loadPasses__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishLoadPasses];
}

uint64_t __31__NPKPassesManager__loadPasses__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishLoadPasses];
}

- (void)_loadImageSetFromPasses:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  int v6 = (LOBYTE(self->_options) >> 2) & 1;
  uint64_t v7 = [(PKGroupsController *)self->_groupsController groups];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__NPKPassesManager__loadImageSetFromPasses___block_invoke;
  v12[3] = &unk_2644D2D90;
  char v15 = v6;
  dispatch_group_t v13 = v5;
  id v14 = self;
  uint64_t v8 = v5;
  [v7 enumerateObjectsUsingBlock:v12];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_4;
  v10[3] = &unk_2644D2B10;
  id v11 = v4;
  id v9 = v4;
  dispatch_group_notify(v8, MEMORY[0x263EF83A0], v10);
}

void __44__NPKPassesManager__loadImageSetFromPasses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 passes];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_2;
  v6[3] = &unk_2644D2D68;
  char v9 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 enumerateObjectsUsingBlock:v6];
}

void __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(unsigned char *)(a1 + 48);
  if (v4)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    char v4 = *(unsigned char *)(a1 + 48);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_3;
  v6[3] = &unk_2644D2938;
  char v8 = v4;
  uint64_t v5 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [v5 _loadContentAndImageSetsForPass:v3 completion:v6];
}

void __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

uint64_t __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_didFinishLoadPasses
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Passes manager: All passes loaded.", buf, 2u);
    }
  }
  [(NPKPassesManager *)self _updateCurrentPasses];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__NPKPassesManager__didFinishLoadPasses__block_invoke;
  v6[3] = &unk_2644D2C08;
  void v6[4] = self;
  [(NPKPassesManager *)self _notifyObservers:v6];
}

uint64_t __40__NPKPassesManager__didFinishLoadPasses__block_invoke(uint64_t a1, void *a2)
{
  return [a2 passesDataSourceDidReloadPasses:*(void *)(a1 + 32)];
}

- (void)_reloadPasses
{
}

- (void)_reloadPassesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  groupsController = self->_groupsController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__NPKPassesManager__reloadPassesWithCompletion___block_invoke;
  v7[3] = &unk_2644D2DB8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(PKGroupsController *)groupsController reloadGroupsWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__NPKPassesManager__reloadPassesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _updateCurrentPasses];
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v4 = [v5 currentPasses];
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
    }
    [v5 _registerGroupControllerGroupObserver];
    id WeakRetained = v5;
  }
}

- (void)_loadContentAndImageSetsForPass:(id)a3 completion:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v35 = a4;
  id v38 = [v5 uniqueID];
  id v6 = [MEMORY[0x263EFF980] array];
  if ([v5 style] == 6
    || ([v5 displayProfile],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 hasBackgroundImage],
        v7,
        v8))
  {
    [v6 addObject:&unk_26D0437A8];
  }
  if ([v5 style] != 6) {
    [v6 addObject:&unk_26D0437C0];
  }
  id v9 = dispatch_group_create();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        id v14 = v5;
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(obj);
        }
        char v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v16 = [v15 integerValue];
        id v17 = pk_Payment_log();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

        if (v18)
        {
          id v19 = pk_Payment_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v57 = v16;
            __int16 v58 = 2112;
            id v59 = v38;
            _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Loading image set type %ld for pass with unique ID %@", buf, 0x16u);
          }
        }
        dispatch_group_enter(v9);
        uint64_t v20 = [v15 integerValue];
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke;
        v47[3] = &unk_2644D2DE0;
        v47[4] = self;
        id v5 = v14;
        id v21 = v14;
        id v48 = v21;
        uint64_t v51 = v16;
        id v49 = v38;
        v50 = v9;
        [v21 loadImageSetAsync:v20 preheat:1 withCompletion:v47];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v11);
  }

  if (NPKIsValidVASPass(v5))
  {
    id v22 = pk_Payment_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      id v24 = pk_Payment_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = (uint64_t)v38;
        _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_DEFAULT, "Notice: Loading preview image set for pass with unique ID %@", buf, 0xCu);
      }
    }
    dispatch_group_enter(v9);
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_74;
    v44[3] = &unk_2644D2E08;
    id v45 = v38;
    uint64_t v46 = v9;
    [v5 loadImageSetAsync:1 preheat:1 withCompletion:v44];
  }
  id v25 = pk_Payment_log();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

  if (v26)
  {
    BOOL v27 = pk_Payment_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v57 = (uint64_t)v38;
      _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Loading content for pass with unique ID %@", buf, 0xCu);
    }
  }
  dispatch_group_enter(v9);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_75;
  v41[3] = &unk_2644D2E08;
  id v28 = v38;
  id v42 = v28;
  __int16 v29 = v9;
  __int16 v43 = v29;
  [v5 loadContentAsyncWithCompletion:v41];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v30 = [v5 colorProfile];
    uint64_t v31 = pk_General_log();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

    if (v32)
    {
      __int16 v33 = pk_General_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v57 = (uint64_t)v30;
        __int16 v58 = 2112;
        id v59 = v28;
        _os_log_impl(&dword_21E92F000, v33, OS_LOG_TYPE_DEFAULT, "Notice: Loaded color profile %@ for pass with unique ID %@", buf, 0x16u);
      }
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_78;
  block[3] = &unk_2644D2B10;
  id v40 = v35;
  id v34 = v35;
  dispatch_group_notify(v29, MEMORY[0x263EF83A0], block);
}

void __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_2;
  block[3] = &unk_2644D2DE0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v8 = v3;
  uint64_t v12 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = *(id *)(a1 + 56);
  dispatch_async(v2, block);
}

void __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) isImageSetLoaded:*(void *)(a1 + 64)];
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v2)
  {
    if (v4)
    {
      id v5 = pk_Payment_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 64);
        uint64_t v7 = *(void *)(a1 + 40);
        int v22 = 134218242;
        uint64_t v23 = v6;
        __int16 v24 = 2112;
        uint64_t v25 = v7;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Finished loading image set %ld for pass with unique ID %@", (uint8_t *)&v22, 0x16u);
      }
    }
    if ((*(unsigned char *)(*(void *)(a1 + 48) + 88) & 2) != 0)
    {
      uint64_t v8 = *(void *)(a1 + 64);
      if (!v8)
      {
        BOOL v18 = pk_Payment_log();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (v19)
        {
          uint64_t v20 = pk_Payment_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = *(void *)(a1 + 40);
            int v22 = 138412290;
            uint64_t v23 = v21;
            _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Memory-mapping front face image set for pass with unique ID %@", (uint8_t *)&v22, 0xCu);
          }
        }
        dispatch_group_t v13 = *(void **)(a1 + 32);
        uint64_t v14 = 0;
        goto LABEL_22;
      }
      if (v8 == 4)
      {
        id v9 = pk_Payment_log();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

        if (v10)
        {
          id v11 = pk_Payment_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = *(void *)(a1 + 40);
            int v22 = 138412290;
            uint64_t v23 = v12;
            _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Memory-mapping logo image set for pass with unique ID %@", (uint8_t *)&v22, 0xCu);
          }
        }
        dispatch_group_t v13 = *(void **)(a1 + 32);
        uint64_t v14 = 4;
LABEL_22:
        char v15 = [v13 imageSetLoadedIfNeeded:v14];
        [v15 memoryMapImageData];
LABEL_23:
      }
    }
  }
  else if (v4)
  {
    char v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 64);
      uint64_t v17 = *(void *)(a1 + 40);
      int v22 = 134218242;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Warning: Attempt to load image set %ld for pass with unique ID %@ was unsuccessful!", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_23;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_74(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Finished loading preview image set for pass with unique ID %@", (uint8_t *)&v6, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_75(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Finished loading content for pass with unique ID %@", (uint8_t *)&v6, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_78(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_notifyObservers:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_handleObjectSettingsChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__NPKPassesManager__handleObjectSettingsChanged___block_invoke;
  v6[3] = &unk_2644D2E08;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __49__NPKPassesManager__handleObjectSettingsChanged___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) userInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F5C698]];
  id v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F5C690]];
  uint64_t v5 = [v4 unsignedIntegerValue];

  uint64_t v6 = [*(id *)(a1 + 40) passForUniqueID:v3];
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      int v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      BOOL v18 = v3;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Got object settings changed to %u for pass (%@) with unique ID %@", buf, 0x1Cu);
    }
  }
  if (v6)
  {
    [v6 setSettingsWithoutUpdatingDataAccessor:v5];
    long long v10 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __49__NPKPassesManager__handleObjectSettingsChanged___block_invoke_79;
    v11[3] = &unk_2644D2BE0;
    v11[4] = v10;
    id v12 = v6;
    [v10 _notifyObservers:v11];
  }
}

void __49__NPKPassesManager__handleObjectSettingsChanged___block_invoke_79(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 passesDataSource:*(void *)(a1 + 32) didUpdateSettingsForPass:*(void *)(a1 + 40)];
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (PKGroupsController)groupsController
{
  return self->_groupsController;
}

- (void)setGroupsController:(id)a3
{
}

- (NSArray)currentPasses
{
  return self->_currentPasses;
}

- (void)setCurrentPasses:(id)a3
{
}

- (NSArray)currentPaymentPasses
{
  return self->_currentPaymentPasses;
}

- (void)setCurrentPaymentPasses:(id)a3
{
}

- (NSArray)currentSecureElementPasses
{
  return self->_currentSecureElementPasses;
}

- (void)setCurrentSecureElementPasses:(id)a3
{
}

- (NSArray)currentExpiredPasses
{
  return self->_currentExpiredPasses;
}

- (void)setCurrentExpiredPasses:(id)a3
{
}

- (NSDictionary)currentPassDynamicStates
{
  return self->_currentPassDynamicStates;
}

- (void)setCurrentPassDynamicStates:(id)a3
{
}

- (NPKStandaloneFirstUnlockCoordinator)firstUnlockCoordinator
{
  return self->_firstUnlockCoordinator;
}

- (void)setFirstUnlockCoordinator:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUnlockCoordinator, 0);
  objc_storeStrong((id *)&self->_currentPassDynamicStates, 0);
  objc_storeStrong((id *)&self->_currentExpiredPasses, 0);
  objc_storeStrong((id *)&self->_currentSecureElementPasses, 0);
  objc_storeStrong((id *)&self->_currentPaymentPasses, 0);
  objc_storeStrong((id *)&self->_currentPasses, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_loadImageQueue, 0);
}

@end