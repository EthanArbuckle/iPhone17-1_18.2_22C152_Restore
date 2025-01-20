@interface WFHomeManager
+ (id)cachedHomeSceneNames;
+ (id)sharedManager;
- (BOOL)hasLoadedHomes;
- (BOOL)isLoading;
- (HMHomeManager)homeManager;
- (NSArray)homes;
- (NSArray)homesToWhichWeCanAddHomeAutomations;
- (NSArray)homesToWhichWeHaveAdminAccess;
- (NSHashTable)eventObservers;
- (OS_dispatch_group)loadHomesGroup;
- (WFHomeManager)init;
- (id)homeNamed:(id)a3;
- (id)homeWithIdentifier:(id)a3;
- (id)primaryHome;
- (id)sceneNamed:(id)a3 inHome:(id)a4;
- (id)serviceWithIdentifier:(id)a3 inHome:(id)a4;
- (unint64_t)status;
- (void)_setHomes:(id)a3;
- (void)addEventObserver:(id)a3;
- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4;
- (void)cacheHomeSceneNames;
- (void)dealloc;
- (void)ensureHomesAreLoadedWithCompletionHandler:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)reloadData;
- (void)removeEventObserver:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setLoadHomesGroup:(id)a3;
- (void)setLoading:(BOOL)a3;
@end

@implementation WFHomeManager

void __30__WFHomeManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WFHomeManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;
}

- (WFHomeManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)WFHomeManager;
  v2 = [(WFHomeManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    homes = v2->_homes;
    v2->_homes = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    eventObservers = v3->_eventObservers;
    v3->_eventObservers = (NSHashTable *)v5;

    dispatch_group_t v7 = dispatch_group_create();
    loadHomesGroup = v3->_loadHomesGroup;
    v3->_loadHomesGroup = (OS_dispatch_group *)v7;

    v9 = [MEMORY[0x1E4F5A7A0] sharedContext];
    [v9 addApplicationStateObserver:v3 forEvent:3];

    v10 = v3;
  }

  return v3;
}

- (void)reloadData
{
  if (!self->_loading)
  {
    v3 = objc_opt_new();
    uint64_t v4 = [v3 status];

    if (v4 == 4)
    {
      if (!self->_homeManager)
      {
        uint64_t v5 = (HMHomeManager *)[objc_alloc((Class)getHMHomeManagerClass[0]()) initWithOptions:1025];
        homeManager = self->_homeManager;
        self->_homeManager = v5;
      }
      self->_loading = 1;
      dispatch_group_enter((dispatch_group_t)self->_loadHomesGroup);
      [(HMHomeManager *)self->_homeManager setDelegate:0];
      dispatch_group_t v7 = self->_homeManager;
      [(HMHomeManager *)v7 setDelegate:self];
    }
  }
}

- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4
{
  if (a4 == 3) {
    [(WFHomeManager *)self reloadData];
  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_1613 != -1) {
    dispatch_once(&sharedManager_onceToken_1613, &__block_literal_global_1614);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

- (void)addEventObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHomeManager *)self eventObservers];
  [v5 addObject:v4];
}

- (NSHashTable)eventObservers
{
  return self->_eventObservers;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  *(_WORD *)&self->_hasLoadedHomes = 1;
  id v4 = [a3 homes];
  [(WFHomeManager *)self _setHomes:v4];

  loadHomesGroup = self->_loadHomesGroup;
  dispatch_group_leave(loadHomesGroup);
}

- (void)_setHomes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqualToArray:self->_homes] & 1) == 0)
  {
    id v5 = (NSArray *)[v4 copy];
    homes = self->_homes;
    self->_homes = v5;

    [(WFHomeManager *)self cacheHomeSceneNames];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    dispatch_group_t v7 = [(WFHomeManager *)self eventObservers];
    v8 = [v7 allObjects];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector()) {
            [v13 homeManagerDidUpdateHomes:self];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadHomesGroup, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_homes, 0);
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoadHomesGroup:(id)a3
{
}

- (OS_dispatch_group)loadHomesGroup
{
  return self->_loadHomesGroup;
}

- (void)setHomeManager:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (BOOL)hasLoadedHomes
{
  return self->_hasLoadedHomes;
}

- (NSArray)homes
{
  return self->_homes;
}

- (void)cacheHomeSceneNames
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(WFHomeManager *)self homes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v10 = objc_msgSend(v9, "actionSets", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = [*(id *)(*((void *)&v17 + 1) + 8 * v14) name];
              [v3 addObject:v15];

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  long long v16 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  [v16 setObject:v3 forKey:@"WFKnownHomeSceneNames"];
}

- (id)serviceWithIdentifier:(id)a3 inHome:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v6 = [(WFHomeManager *)self homes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v42;
    v31 = v6;
    uint64_t v28 = *(void *)v42;
    do
    {
      uint64_t v9 = 0;
      uint64_t v27 = v7;
      do
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v41 + 1) + 8 * v9);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v11 = [v10 serviceGroups];
        uint64_t v30 = [v11 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v30)
        {
          uint64_t v12 = *(void *)v38;
          uint64_t v26 = v9;
          v32 = v11;
          uint64_t v29 = *(void *)v38;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v38 != v12) {
                objc_enumerationMutation(v11);
              }
              uint64_t v14 = *(void **)(*((void *)&v37 + 1) + 8 * v13);
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v15 = [v14 services];
              uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v34;
                while (2)
                {
                  for (uint64_t i = 0; i != v17; ++i)
                  {
                    if (*(void *)v34 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    long long v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                    long long v21 = [v20 uniqueIdentifier];
                    long long v22 = [v21 UUIDString];
                    char v23 = [v22 isEqualToString:v5];

                    if (v23)
                    {
                      id v24 = v20;

                      uint64_t v6 = v31;
                      goto LABEL_26;
                    }
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
                  if (v17) {
                    continue;
                  }
                  break;
                }
              }

              ++v13;
              uint64_t v6 = v31;
              uint64_t v11 = v32;
              uint64_t v12 = v29;
            }
            while (v13 != v30);
            uint64_t v9 = v26;
            uint64_t v30 = [v32 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v30);
        }

        ++v9;
        uint64_t v8 = v28;
      }
      while (v9 != v27);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
      uint64_t v8 = v28;
      id v24 = 0;
    }
    while (v7);
  }
  else
  {
    id v24 = 0;
  }
LABEL_26:

  return v24;
}

- (id)sceneNamed:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 actionSets];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__WFHomeManager_sceneNamed_inHome___block_invoke;
  v11[3] = &unk_1E654CE10;
  id v12 = v5;
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v6, "if_objectsPassingTest:", v11);
  uint64_t v9 = [v8 firstObject];

  return v9;
}

BOOL __35__WFHomeManager_sceneNamed_inHome___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  BOOL v4 = [v3 localizedStandardCompare:*(void *)(a1 + 32)] == 0;

  return v4;
}

- (id)primaryHome
{
  v2 = [(WFHomeManager *)self homes];
  v3 = objc_msgSend(v2, "if_objectsPassingTest:", &__block_literal_global_179);
  BOOL v4 = [v3 firstObject];

  return v4;
}

uint64_t __28__WFHomeManager_primaryHome__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPrimary];
}

- (id)homeWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHomeManager *)self homes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__WFHomeManager_homeWithIdentifier___block_invoke;
  v10[3] = &unk_1E654CDE8;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "if_objectsPassingTest:", v10);
  uint64_t v8 = [v7 firstObject];

  return v8;
}

uint64_t __36__WFHomeManager_homeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = WFSerializableHomeIdentifier(a2);
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)homeNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHomeManager *)self homes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__WFHomeManager_homeNamed___block_invoke;
  v10[3] = &unk_1E654CDE8;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "if_objectsPassingTest:", v10);
  uint64_t v8 = [v7 firstObject];

  return v8;
}

BOOL __27__WFHomeManager_homeNamed___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  BOOL v4 = [v3 localizedStandardCompare:*(void *)(a1 + 32)] == 0;

  return v4;
}

- (NSArray)homesToWhichWeCanAddHomeAutomations
{
  v2 = [(WFHomeManager *)self homesToWhichWeHaveAdminAccess];
  v3 = objc_msgSend(v2, "if_objectsPassingTest:", &__block_literal_global_177);

  return (NSArray *)v3;
}

BOOL __52__WFHomeManager_homesToWhichWeCanAddHomeAutomations__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 residentDevices];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)homesToWhichWeHaveAdminAccess
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = [(WFHomeManager *)self homes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 currentUser];
        id v11 = [v9 homeAccessControlForUser:v10];

        if ([v11 isAdministrator]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unint64_t)status
{
  v2 = [(WFHomeManager *)self homeManager];
  char v3 = [v2 status];

  return (v3 & 0x31) != 0;
}

- (void)removeEventObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHomeManager *)self eventObservers];
  [v5 removeObject:v4];
}

- (void)ensureHomesAreLoadedWithCompletionHandler:(id)a3
{
  block = (void (**)(void))a3;
  if ([(WFHomeManager *)self hasLoadedHomes])
  {
    block[2]();
  }
  else
  {
    [(WFHomeManager *)self reloadData];
    dispatch_group_notify((dispatch_group_t)self->_loadHomesGroup, MEMORY[0x1E4F14428], block);
  }
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F5A7A0] sharedContext];
  [v3 removeApplicationStateObserver:self forEvent:3];

  v4.receiver = self;
  v4.super_class = (Class)WFHomeManager;
  [(WFHomeManager *)&v4 dealloc];
}

+ (id)cachedHomeSceneNames
{
  v2 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  char v3 = [v2 arrayForKey:@"WFKnownHomeSceneNames"];

  return v3;
}

@end