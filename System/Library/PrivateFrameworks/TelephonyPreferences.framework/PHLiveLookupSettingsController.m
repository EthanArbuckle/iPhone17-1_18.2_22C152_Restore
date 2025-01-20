@interface PHLiveLookupSettingsController
- (BOOL)_isUniqueExtension:(id)a3;
- (BOOL)canEditExtensions;
- (BOOL)hasExtensions;
- (LiveLookupManagerProxy)extensionManager;
- (NSMutableArray)extensions;
- (OS_dispatch_queue)queue;
- (PHLiveLookupSettingsController)initWithParent:(id)a3;
- (PSListController)parent;
- (id)_extensionFrom:(id)a3;
- (id)_localizedExtensionTitleForExtension:(id)a3 unique:(BOOL)a4;
- (id)createExtensionsGroupSpecifiers;
- (id)extensionForSpecifier:(id)a3;
- (id)readPreferenceValue:(id)a3;
- (id)specifiers;
- (void)_updateExtensions;
- (void)dealloc;
- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3;
- (void)presentError:(id)a3 fromSettingEnabled:(BOOL)a4 forExtension:(id)a5;
- (void)refreshView;
- (void)setExtensions:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
@end

@implementation PHLiveLookupSettingsController

- (PHLiveLookupSettingsController)initWithParent:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHLiveLookupSettingsController;
  v6 = [(PHLiveLookupSettingsController *)&v15 init];
  if (v6)
  {
    v7 = objc_alloc_init(LiveLookupManagerProxy);
    extensionManager = v6->_extensionManager;
    v6->_extensionManager = v7;

    objc_storeStrong((id *)&v6->_parent, a3);
    [(PHLiveLookupSettingsController *)v6 _updateExtensions];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_handleLLExtensionsChangedNotification, (CFStringRef)+[LiveLookupManagerProxy LLExtensionsChangedNotification], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel_handleUIApplicationWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB2730] object:0];

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v12 = dispatch_queue_create("PHLiveLookupSettingsControllerQueue", v11);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;
  }
  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PHLiveLookupSettingsController;
  [(PHLiveLookupSettingsController *)&v5 dealloc];
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 section];
  if (v9 == [v8 section])
  {
    v10 = [(PHLiveLookupSettingsController *)self extensions];
    v11 = (void *)[v10 mutableCopy];

    dispatch_queue_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    objc_msgSend(v11, "removeObjectAtIndex:", objc_msgSend(v7, "row"));
    objc_msgSend(v11, "insertObject:atIndex:", v12, objc_msgSend(v8, "row"));
    [(PHLiveLookupSettingsController *)self setExtensions:v11];
    v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "identifier", (void)v21);
          [v13 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    v20 = [(PHLiveLookupSettingsController *)self extensionManager];
    [v20 setWithPrioritizedExtensionIdentifiers:v13];
  }
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PHLiveLookupSettingsController *)self extensions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(PHLiveLookupSettingsController *)self createExtensionsGroupSpecifiers];
    [v3 addObjectsFromArray:v6];
  }
  return v3;
}

- (id)readPreferenceValue:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = [(PHLiveLookupSettingsController *)self extensionForSpecifier:a3];
  if (v4)
  {
    uint64_t v5 = [(PHLiveLookupSettingsController *)self extensionManager];
    uint64_t v6 = [v5 extensionEnabled:v4];

    id v7 = TPSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"DISABLED";
      if (v6) {
        id v8 = @"ENABLED";
      }
      int v11 = 138412546;
      dispatch_queue_t v12 = v4;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_1E4DD4000, v7, OS_LOG_TYPE_DEFAULT, "Getting extension enabled (%@) as %@", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v9 = [NSNumber numberWithBool:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PHLiveLookupSettingsController *)self extensionForSpecifier:v7];
  if (v8)
  {
    uint64_t v9 = [(PHLiveLookupSettingsController *)self extensionManager];
    int v10 = [v9 extensionEnabled:v8];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = [v6 BOOLValue];
    }
    else {
      uint64_t v11 = 0;
    }
    dispatch_queue_t v12 = TPSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = @"DISABLED";
      if (v11) {
        __int16 v13 = @"ENABLED";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v8;
      __int16 v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_1E4DD4000, v12, OS_LOG_TYPE_DEFAULT, "Setting live lookup extension (%@) to %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    id v14 = [(PHLiveLookupSettingsController *)self extensionManager];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __63__PHLiveLookupSettingsController_setPreferenceValue_specifier___block_invoke;
    v20 = &unk_1E6EB2318;
    objc_copyWeak(&v23, (id *)buf);
    id v15 = v7;
    id v21 = v15;
    char v24 = v11;
    id v22 = v8;
    [v14 setEnabled:v11 forExtension:v22 completion:&v17];

    if (v10 != v11) {
      objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F930E8], v17, v18, v19, v20, v21);
    }
    uint64_t v16 = [(PHLiveLookupSettingsController *)self parent];
    [v16 reloadSpecifier:v15 animated:1];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

void __63__PHLiveLookupSettingsController_setPreferenceValue_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PHLiveLookupSettingsController_setPreferenceValue_specifier___block_invoke_2;
  block[3] = &unk_1E6EB22F0;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  char v10 = *(unsigned char *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __63__PHLiveLookupSettingsController_setPreferenceValue_specifier___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F930E8]];
    [WeakRetained refreshView];
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = TPSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__PHLiveLookupSettingsController_setPreferenceValue_specifier___block_invoke_2_cold_1(a1, (uint64_t *)(a1 + 40), v4);
    }

    id v5 = objc_loadWeakRetained(v2);
    id v6 = v5;
    if (v5)
    {
      [v5 presentError:*(void *)(a1 + 40) fromSettingEnabled:*(unsigned __int8 *)(a1 + 64) forExtension:*(void *)(a1 + 48)];
      id v7 = [v6 parent];
      [v7 reloadSpecifier:*(void *)(a1 + 32) animated:1];
    }
  }
}

- (id)extensionForSpecifier:(id)a3
{
  id v3 = [a3 propertyForKey:@"LiveLookupDBExtension"];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v9 = 138412546;
    char v10 = v6;
    __int16 v11 = 2112;
    dispatch_queue_t v12 = v8;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v9, 0x16u);
  }
  [(PHLiveLookupSettingsController *)self _updateExtensions];
}

- (void)_updateExtensions
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "live lookup _updateExtensions", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PHLiveLookupSettingsController__updateExtensions__block_invoke;
  block[3] = &unk_1E6EB2258;
  void block[4] = self;
  id v4 = (void *)MEMORY[0x1E4F14428];
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__PHLiveLookupSettingsController__updateExtensions__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) extensionManager];
  id v3 = [v2 extensions];

  if (v3)
  {
    id v4 = TPSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v3;
      _os_log_impl(&dword_1E4DD4000, v4, OS_LOG_TYPE_DEFAULT, "Received live lookup extensions %@", buf, 0xCu);
    }
  }
  id v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v3;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "live lookup _updateExtensions: %@", buf, 0xCu);
  }

  if (!v3
    || ([*(id *)(a1 + 32) extensions],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v3 isEqualToArray:v6],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = [*(id *)(a1 + 32) parent];
    char v9 = [v8 isEditing];

    if ((v9 & 1) == 0)
    {
      char v10 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setExtensions:v10];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v19 = v3;
      id v11 = v3;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v17 = TPSLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v26 = v16;
              _os_log_impl(&dword_1E4DD4000, v17, OS_LOG_TYPE_DEFAULT, "live lookup extension: %@", buf, 0xCu);
            }

            uint64_t v18 = [*(id *)(a1 + 32) extensions];
            [v18 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v13);
      }

      [*(id *)(a1 + 32) refreshView];
      id v3 = v19;
    }
  }
}

- (id)_extensionFrom:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28C70];
  id v5 = a3;
  id v6 = [(PHLiveLookupSettingsController *)self extensionManager];
  char v7 = [v6 extensionName:v5];

  id v8 = [v4 extensionWithIdentifier:v7 error:0];

  return v8;
}

- (BOOL)_isUniqueExtension:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v19 = self;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(PHLiveLookupSettingsController *)self extensions];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        char v9 = [(PHLiveLookupSettingsController *)v19 _extensionFrom:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        char v10 = v9;
        if (v9)
        {
          id v11 = [v9 containingAppURL];
          uint64_t v12 = [v11 absoluteString];
          uint64_t v13 = [v18 containingAppURL];
          uint64_t v14 = [v13 absoluteString];
          int v15 = [v12 isEqualToString:v14];

          if (v15)
          {
            if (v6 >= 1)
            {

              ++v6;
              goto LABEL_15;
            }
            ++v6;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v6 = 0;
  }
LABEL_15:

  return v6 == 1;
}

- (id)createExtensionsGroupSpecifiers
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "live lookup createExtensionsGroupSpecifiers", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = (void *)MEMORY[0x1E4F92E70];
  int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"LIVE_LOOKUP_EXTENSIONS_LIST_HEADER" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
  id v8 = [v5 groupSpecifierWithID:@"LiveLookupSettingsGroup" name:v7];

  char v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v10 = [v9 localizedStringForKey:@"LIVE_LOOKUP_EXTENSIONS_LIST_FOOTER" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
  [v8 setProperty:v10 forKey:*MEMORY[0x1E4F93170]];

  v42 = v4;
  v38 = v8;
  [v4 insertObject:v8 atIndex:0];
  id v11 = TPSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(PHLiveLookupSettingsController *)self extensions];
    *(_DWORD *)buf = 138412290;
    v54 = v12;
    _os_log_impl(&dword_1E4DD4000, v11, OS_LOG_TYPE_DEFAULT, "live lookup extensions=%@", buf, 0xCu);
  }
  id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = [(PHLiveLookupSettingsController *)self extensions];
  v41 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  int v15 = [(PHLiveLookupSettingsController *)self extensions];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        long long v21 = (void *)MEMORY[0x1E4F28C70];
        long long v22 = [(PHLiveLookupSettingsController *)self extensionManager];
        long long v23 = [v22 extensionName:v20];
        char v24 = [v21 extensionWithIdentifier:v23 error:0];

        if (v24) {
          [v41 addObject:v24];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v17);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(PHLiveLookupSettingsController *)self extensions];
  uint64_t v25 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v44;
    uint64_t v40 = *MEMORY[0x1E4F93190];
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        v30 = [(PHLiveLookupSettingsController *)self _extensionFrom:v29];
        if (v30)
        {
          v31 = [(PHLiveLookupSettingsController *)self _localizedExtensionTitleForExtension:v30 unique:[(PHLiveLookupSettingsController *)self _isUniqueExtension:v30]];
          v32 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v31 target:self set:sel_setPreferenceValue_specifier_ get:sel_readPreferenceValue_ detail:0 cell:6 edit:0];
          v33 = (void *)MEMORY[0x1E4FB1818];
          v34 = [v30 plugInKitProxy];
          v35 = [v33 _iconForResourceProxy:v34 format:0];

          [v32 setProperty:v35 forKey:v40];
          [v32 setProperty:v29 forKey:@"LiveLookupDBExtension"];
          [v42 addObject:v32];
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v26);
  }

  v36 = (void *)[v42 copy];
  return v36;
}

- (id)_localizedExtensionTitleForExtension:(id)a3 unique:(BOOL)a4
{
  if (a4)
  {
    id v4 = a3;
    uint64_t v5 = [v4 localizedName];
  }
  else
  {
    int v6 = NSString;
    uint64_t v7 = (void *)MEMORY[0x1E4F28B50];
    id v8 = a3;
    id v4 = [v7 bundleForClass:objc_opt_class()];
    char v9 = [v4 localizedStringForKey:@"CALL_DIRECTORY_APP_%@_EXTENSION_%@" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    char v10 = [v8 localizedContainingAppName];
    id v11 = [v8 localizedName];

    uint64_t v5 = objc_msgSend(v6, "stringWithFormat:", v9, v10, v11);
  }
  return v5;
}

- (BOOL)hasExtensions
{
  v2 = [(PHLiveLookupSettingsController *)self extensions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)canEditExtensions
{
  v2 = [(PHLiveLookupSettingsController *)self extensions];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)refreshView
{
  BOOL v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "live lookup refreshView", v5, 2u);
  }

  id v4 = [(PHLiveLookupSettingsController *)self parent];
  [v4 reloadSpecifiers];
}

- (void)presentError:(id)a3 fromSettingEnabled:(BOOL)a4 forExtension:(id)a5
{
  uint64_t v7 = @"CALL_DIRECTORY_DISABLE_EXTENSION_ALERT_UNKNOWN_%@";
  if (a4) {
    uint64_t v7 = @"CALL_DIRECTORY_ENABLE_EXTENSION_ALERT_UNKNOWN_%@";
  }
  id v8 = (void *)MEMORY[0x1E4F28B50];
  if (a4) {
    char v9 = @"CALL_DIRECTORY_ENABLE_EXTENSION_ALERT_TITLE";
  }
  else {
    char v9 = @"CALL_DIRECTORY_DISABLE_EXTENSION_ALERT_TITLE";
  }
  char v10 = v7;
  id v11 = a5;
  uint64_t v12 = [v8 bundleForClass:objc_opt_class()];
  id v25 = [v12 localizedStringForKey:v9 value:&stru_1F40BEF98 table:@"CallDirectorySettings"];

  id v13 = [(PHLiveLookupSettingsController *)self _extensionFrom:v11];

  uint64_t v14 = NSString;
  int v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:v10 value:&stru_1F40BEF98 table:@"CallDirectorySettings"];

  uint64_t v17 = [(PHLiveLookupSettingsController *)self _localizedExtensionTitleForExtension:v13 unique:[(PHLiveLookupSettingsController *)self _isUniqueExtension:v13]];
  uint64_t v18 = objc_msgSend(v14, "stringWithFormat:", v16, v17);

  v19 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v25 message:v18 preferredStyle:1];
  uint64_t v20 = (void *)MEMORY[0x1E4FB1410];
  long long v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v22 = [v21 localizedStringForKey:@"OK" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
  long long v23 = [v20 actionWithTitle:v22 style:0 handler:0];

  [v19 addAction:v23];
  char v24 = [(PHLiveLookupSettingsController *)self parent];
  [v24 presentViewController:v19 animated:1 completion:0];
}

- (LiveLookupManagerProxy)extensionManager
{
  return self->_extensionManager;
}

- (NSMutableArray)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PSListController)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
}

void __63__PHLiveLookupSettingsController_setPreferenceValue_specifier___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *a2;
  v6[0] = 67109634;
  v6[1] = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  _os_log_error_impl(&dword_1E4DD4000, log, OS_LOG_TYPE_ERROR, "Error setting enabled to %d for live lookup extension %@: %@", (uint8_t *)v6, 0x1Cu);
}

@end