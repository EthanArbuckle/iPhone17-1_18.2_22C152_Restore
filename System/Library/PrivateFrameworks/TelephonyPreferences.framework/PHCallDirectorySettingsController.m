@interface PHCallDirectorySettingsController
- (BOOL)canEditExtensions;
- (BOOL)hasExtensions;
- (CXCallDirectoryExtensionManager)extensionManager;
- (NSMutableArray)extensions;
- (PHCallDirectorySettingsController)initWithParent:(id)a3;
- (PSListController)parent;
- (id)_localizedExtensionTitleForExtension:(id)a3;
- (id)callDirectoryExtensionForSpecifier:(id)a3;
- (id)createExtensionsGroupSpecifiers;
- (id)readPreferenceValue:(id)a3;
- (id)specifiers;
- (void)_updateExtensions;
- (void)extensionsChangedForCallDirectoryExtensionManager:(id)a3;
- (void)presentError:(id)a3 fromSettingEnabled:(BOOL)a4 forExtension:(id)a5;
- (void)refreshView;
- (void)setExtensions:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
@end

@implementation PHCallDirectorySettingsController

- (PHCallDirectorySettingsController)initWithParent:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHCallDirectorySettingsController;
  v6 = [(PHCallDirectorySettingsController *)&v10 init];
  if (v6)
  {
    v7 = (CXCallDirectoryExtensionManager *)objc_alloc_init(MEMORY[0x1E4F19188]);
    extensionManager = v6->_extensionManager;
    v6->_extensionManager = v7;

    [(CXCallDirectoryExtensionManager *)v6->_extensionManager setDelegate:v6 queue:0];
    [(CXCallDirectoryExtensionManager *)v6->_extensionManager beginObservingExtensions];
    objc_storeStrong((id *)&v6->_parent, a3);
    [(PHCallDirectorySettingsController *)v6 _updateExtensions];
  }

  return v6;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 section];
  if (v9 == [v8 section])
  {
    objc_super v10 = [(PHCallDirectorySettingsController *)self extensions];
    v11 = (void *)[v10 mutableCopy];

    v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    objc_msgSend(v11, "removeObjectAtIndex:", objc_msgSend(v7, "row"));
    objc_msgSend(v11, "insertObject:atIndex:", v12, objc_msgSend(v8, "row"));
    [(PHCallDirectorySettingsController *)self setExtensions:v11];
    v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v24 + 1) + 8 * v18) identifier];
          [v13 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }

    v20 = [(PHCallDirectorySettingsController *)self extensionManager];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __78__PHCallDirectorySettingsController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke;
    v22[3] = &unk_1E6EB2340;
    id v23 = v13;
    id v21 = v13;
    [v20 setPrioritizedExtensionIdentifiers:v21 completionHandler:v22];
  }
}

void __78__PHCallDirectorySettingsController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = TPSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__PHCallDirectorySettingsController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PHCallDirectorySettingsController *)self extensions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(PHCallDirectorySettingsController *)self createExtensionsGroupSpecifiers];
    [v3 addObjectsFromArray:v6];
  }
  return v3;
}

- (id)readPreferenceValue:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(PHCallDirectorySettingsController *)self callDirectoryExtensionForSpecifier:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 state];
    v6 = TPSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = @"DISABLED";
      if (v5 == 4) {
        id v7 = @"ENABLED";
      }
      int v10 = 138412546;
      v11 = v4;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1E4DD4000, v6, OS_LOG_TYPE_DEFAULT, "Getting extension enabled (%@) as %@", (uint8_t *)&v10, 0x16u);
    }

    id v8 = [NSNumber numberWithBool:v5 == 4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PHCallDirectorySettingsController *)self callDirectoryExtensionForSpecifier:v7];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = [v6 BOOLValue];
    }
    else {
      uint64_t v9 = 0;
    }
    int v10 = TPSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = @"DISABLED";
      if (v9) {
        v11 = @"ENABLED";
      }
      *(_DWORD *)buf = 138412546;
      v28 = v8;
      __int16 v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_1E4DD4000, v10, OS_LOG_TYPE_DEFAULT, "Setting call directory extension (%@) to %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    __int16 v12 = [(PHCallDirectorySettingsController *)self extensionManager];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __66__PHCallDirectorySettingsController_setPreferenceValue_specifier___block_invoke;
    v22 = &unk_1E6EB2318;
    objc_copyWeak(&v25, (id *)buf);
    char v26 = v9;
    id v13 = v8;
    id v23 = v13;
    id v14 = v7;
    id v24 = v14;
    [v12 setEnabled:v9 forExtension:v13 completion:&v19];

    uint64_t v15 = objc_msgSend(v13, "state", v19, v20, v21, v22);
    uint64_t v16 = [v13 state];
    if (v16 == 4) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 4;
    }
    if (v15 == 1 && v16 != 4) {
      [v14 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F930E8]];
    }
    [v13 setState:v17];
    uint64_t v18 = [(PHCallDirectorySettingsController *)self parent];
    [v18 reloadSpecifier:v14 animated:1];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __66__PHCallDirectorySettingsController_setPreferenceValue_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PHCallDirectorySettingsController_setPreferenceValue_specifier___block_invoke_2;
  block[3] = &unk_1E6EB22F0;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v6 = v3;
  char v10 = *(unsigned char *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __66__PHCallDirectorySettingsController_setPreferenceValue_specifier___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(a1 + 32))
  {
    id v4 = TPSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__PHCallDirectorySettingsController_setPreferenceValue_specifier___block_invoke_2_cold_1(a1, (uint64_t *)(a1 + 32), v4);
    }

    id v5 = objc_loadWeakRetained(v2);
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 parent];
      [v7 reloadSpecifier:*(void *)(a1 + 48)];

      [v6 presentError:*(void *)(a1 + 32) fromSettingEnabled:*(unsigned __int8 *)(a1 + 64) forExtension:*(void *)(a1 + 40)];
    }
  }
}

- (id)callDirectoryExtensionForSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 propertyForKey:v5];

  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)extensionsChangedForCallDirectoryExtensionManager:(id)a3
{
  id v4 = TPSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v4, OS_LOG_TYPE_DEFAULT, "Call Directory Extension Manager extensions changed, getting the latest extensions now", v5, 2u);
  }

  [(PHCallDirectorySettingsController *)self _updateExtensions];
}

- (void)_updateExtensions
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(PHCallDirectorySettingsController *)self extensionManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PHCallDirectorySettingsController__updateExtensions__block_invoke;
  v4[3] = &unk_1E6EB21A8;
  v4[4] = self;
  [v3 extensionsWithCompletionHandler:v4];
}

void __54__PHCallDirectorySettingsController__updateExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PHCallDirectorySettingsController__updateExtensions__block_invoke_2;
  block[3] = &unk_1E6EB2180;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __54__PHCallDirectorySettingsController__updateExtensions__block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = TPSLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v5;
      _os_log_impl(&dword_1E4DD4000, v4, OS_LOG_TYPE_DEFAULT, "Received call directory extensions %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __76__PHCallBlockingAndIdentificationSettingsBundleController__updateExtensions__block_invoke_2_cold_1(a1, v4);
  }

  id v6 = *(void **)(a1 + 32);
  if (!v6
    || ([*(id *)(a1 + 48) extensions],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isEqualToArray:v7],
        v7,
        (v8 & 1) == 0))
  {
    id v9 = [*(id *)(a1 + 48) parent];
    char v10 = [v9 isEditing];

    if ((v10 & 1) == 0)
    {
      id v11 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 48) setExtensions:v11];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ((unint64_t)(objc_msgSend(v17, "state", (void)v19) - 1) <= 3)
            {
              uint64_t v18 = [*(id *)(a1 + 48) extensions];
              [v18 addObject:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v14);
      }

      [*(id *)(a1 + 48) refreshView];
    }
  }
}

- (id)createExtensionsGroupSpecifiers
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = (void *)MEMORY[0x1E4F92E70];
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"CALL_DIRECTORY_EXTENSIONS_LIST_HEADER" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
  id v7 = [v4 groupSpecifierWithID:@"CallDirectorySettingsGroup" name:v6];

  char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CALL_DIRECTORY_EXTENSIONS_LIST_FOOTER" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
  [v7 setProperty:v9 forKey:*MEMORY[0x1E4F93170]];

  [v3 insertObject:v7 atIndex:0];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(PHCallDirectorySettingsController *)self extensions];
  uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v28 = *(void *)v30;
    uint64_t v27 = *MEMORY[0x1E4F93190];
    uint64_t v26 = *MEMORY[0x1E4F930E8];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v14 = [(PHCallDirectorySettingsController *)self _localizedExtensionTitleForExtension:v13];
        uint64_t v15 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v14 target:self set:sel_setPreferenceValue_specifier_ get:sel_readPreferenceValue_ detail:0 cell:6 edit:0];
        uint64_t v16 = (void *)MEMORY[0x1E4FB1818];
        uint64_t v17 = [v13 plugInKitProxy];
        uint64_t v18 = [v16 _iconForResourceProxy:v17 format:0];

        [v15 setProperty:v18 forKey:v27];
        BOOL v19 = [v13 state] == 3;
        long long v20 = [NSNumber numberWithBool:v19];
        [v15 setProperty:v20 forKey:v26];

        long long v21 = (objc_class *)objc_opt_class();
        long long v22 = NSStringFromClass(v21);
        [v15 setProperty:v13 forKey:v22];

        [v3 addObject:v15];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  id v23 = (void *)[v3 copy];
  return v23;
}

- (id)_localizedExtensionTitleForExtension:(id)a3
{
  id v3 = a3;
  if ([v3 isOnlyExtensionInContainingApp])
  {
    id v4 = [v3 localizedContainingAppName];
  }
  else
  {
    uint64_t v5 = NSString;
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"CALL_DIRECTORY_APP_%@_EXTENSION_%@" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    char v8 = [v3 localizedContainingAppName];
    id v9 = [v3 localizedName];
    id v4 = objc_msgSend(v5, "stringWithFormat:", v7, v8, v9);
  }
  return v4;
}

- (BOOL)hasExtensions
{
  uint64_t v2 = [(PHCallDirectorySettingsController *)self extensions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)canEditExtensions
{
  uint64_t v2 = [(PHCallDirectorySettingsController *)self extensions];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)refreshView
{
  BOOL v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "Call Directory refreshView", v5, 2u);
  }

  id v4 = [(PHCallDirectorySettingsController *)self parent];
  [v4 reloadSpecifiers];
}

- (void)presentError:(id)a3 fromSettingEnabled:(BOOL)a4 forExtension:(id)a5
{
  BOOL v6 = a4;
  id v31 = a3;
  id v8 = a5;
  id v9 = [v31 domain];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F19178]];

  if (!v10) {
    goto LABEL_6;
  }
  uint64_t v11 = [v31 code];
  if ((unint64_t)(v11 - 3) < 3)
  {
    id v12 = @"CALL_DIRECTORY_ENABLE_EXTENSION_ALERT_DATA_INVALID_%@";
LABEL_9:
    long long v30 = v12;
    uint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v15 = v14;
    if (v6) {
      uint64_t v16 = @"CALL_DIRECTORY_ENABLE_EXTENSION_ALERT_TITLE";
    }
    else {
      uint64_t v16 = @"CALL_DIRECTORY_DISABLE_EXTENSION_ALERT_TITLE";
    }
    uint64_t v17 = [v14 localizedStringForKey:v16 value:&stru_1F40BEF98 table:@"CallDirectorySettings"];

    uint64_t v18 = NSString;
    BOOL v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v20 = [v19 localizedStringForKey:v12 value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    [(PHCallDirectorySettingsController *)self _localizedExtensionTitleForExtension:v8];
    v22 = id v21 = v8;
    id v23 = objc_msgSend(v18, "stringWithFormat:", v20, v22);

    id v24 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v17 message:v23 preferredStyle:1];
    uint64_t v25 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v27 = [v26 localizedStringForKey:@"OK" value:&stru_1F40BEF98 table:@"CallDirectorySettings"];
    uint64_t v28 = [v25 actionWithTitle:v27 style:0 handler:0];

    id v8 = v21;
    [v24 addAction:v28];
    long long v29 = [(PHCallDirectorySettingsController *)self parent];
    [v29 presentViewController:v24 animated:1 completion:0];

    goto LABEL_13;
  }
  if (v11 == 2)
  {
    id v12 = @"CALL_DIRECTORY_ENABLE_EXTENSION_ALERT_CONNECTION_INTERRUPTED_%@";
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_6:
    uint64_t v13 = @"CALL_DIRECTORY_DISABLE_EXTENSION_ALERT_UNKNOWN_%@";
    if (v6) {
      uint64_t v13 = @"CALL_DIRECTORY_ENABLE_EXTENSION_ALERT_UNKNOWN_%@";
    }
    id v12 = v13;
    goto LABEL_9;
  }
LABEL_13:
}

- (CXCallDirectoryExtensionManager)extensionManager
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

- (PSListController)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
}

void __78__PHCallDirectorySettingsController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E4DD4000, log, OS_LOG_TYPE_ERROR, "Error setting prioritized extension identifiers to %@: %@", (uint8_t *)&v4, 0x16u);
}

void __66__PHCallDirectorySettingsController_setPreferenceValue_specifier___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *a2;
  v6[0] = 67109634;
  v6[1] = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  _os_log_error_impl(&dword_1E4DD4000, log, OS_LOG_TYPE_ERROR, "Error setting enabled to %d for call directory extension %@: %@", (uint8_t *)v6, 0x1Cu);
}

@end