@interface TUIDeviceSpecifierProvider
- (AADeviceList)deviceList;
- (AIDAAccountManager)accountManager;
- (NSArray)specifiers;
- (NSMutableArray)devicesWithErrors;
- (TUIDeviceSpecifierProvider)initWithAccountManager:(id)a3;
- (TUIDeviceSpecifierProvider)initWithAccountManager:(id)a3 stateManager:(id)a4;
- (TUIDeviceSpecifierProviderDelegate)delegate;
- (TUIKTStateManager)stateManager;
- (id)_deviceErrorSpecifierGroup;
- (id)_deviceList;
- (id)_iconURLForDevice:(id)a3;
- (id)_removeDeviceSpecifier:(id)a3;
- (id)_specifierForDevice:(id)a3;
- (id)_specifierForError;
- (id)_specifierForSpinner;
- (id)_specifiersForDevicesWithError;
- (id)_spinnerSpecifierGroup;
- (void)_deviceSpecifierWasTapped:(id)a3;
- (void)deviceListModified:(id)a3;
- (void)refreshDeviceList;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceList:(id)a3;
- (void)setDevicesWithErrors:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setStateManager:(id)a3;
@end

@implementation TUIDeviceSpecifierProvider

- (TUIDeviceSpecifierProvider)initWithAccountManager:(id)a3 stateManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TUIDeviceSpecifierProvider;
  v9 = [(TUIDeviceSpecifierProvider *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_stateManager, a4);
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    devicesWithErrors = v10->_devicesWithErrors;
    v10->_devicesWithErrors = (NSMutableArray *)v11;

    id v13 = [(TUIDeviceSpecifierProvider *)v10 _deviceList];
  }

  return v10;
}

- (TUIDeviceSpecifierProvider)initWithAccountManager:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_15);
  }
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR)) {
    -[TUIDeviceSpecifierProvider initWithAccountManager:]((uint64_t)self, v5);
  }

  return 0;
}

uint64_t __53__TUIDeviceSpecifierProvider_initWithAccountManager___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    v5 = [(TUIDeviceSpecifierProvider *)self _specifiersForDevicesWithError];
    [v4 addObjectsFromArray:v5];

    v6 = (NSArray *)[v4 copy];
    id v7 = self->_specifiers;
    self->_specifiers = v6;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (id)_specifiersForDevicesWithError
{
  v28[1] = *MEMORY[0x263EF8340];
  v3 = [(TUIDeviceSpecifierProvider *)self _deviceList];
  id v4 = [v3 loadError];

  if (v4)
  {
    v5 = [(TUIDeviceSpecifierProvider *)self _specifierForError];
    v28[0] = v5;
    v6 = (void *)MEMORY[0x263EFF8C0];
    id v7 = (void **)v28;
    goto LABEL_3;
  }
  uint64_t v11 = [v3 devices];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    if ([(NSMutableArray *)self->_devicesWithErrors count])
    {
      v5 = [MEMORY[0x263EFF980] array];
      id v13 = [(TUIDeviceSpecifierProvider *)self _deviceErrorSpecifierGroup];
      [v5 addObject:v13];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v14 = self->_devicesWithErrors;
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = -[TUIDeviceSpecifierProvider _specifierForDevice:](self, "_specifierForDevice:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
            [v5 addObject:v19];
          }
          uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v16);
      }

      uint64_t v8 = [v5 copy];
      goto LABEL_4;
    }
    v5 = [(TUIDeviceSpecifierProvider *)self _spinnerSpecifierGroup];
    v26 = v5;
    v6 = (void *)MEMORY[0x263EFF8C0];
    id v7 = &v26;
LABEL_3:
    uint64_t v8 = [v6 arrayWithObjects:v7 count:1];
LABEL_4:
    v9 = (void *)v8;
    goto LABEL_5;
  }
  v5 = [(TUIDeviceSpecifierProvider *)self _spinnerSpecifierGroup];
  v27[0] = v5;
  v20 = [(TUIDeviceSpecifierProvider *)self _specifierForSpinner];
  v27[1] = v20;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];

LABEL_5:
  return v9;
}

- (void)refreshDeviceList
{
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  deviceList = self->_deviceList;
  [(AADeviceList *)deviceList refreshDeviceList];
}

- (id)_deviceErrorSpecifierGroup
{
  unint64_t v2 = [(NSMutableArray *)self->_devicesWithErrors count];
  v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = v4;
  if (v2 > 1)
  {
    uint64_t v11 = [v4 localizedStringForKey:@"TRANSPARENCY_PANE_DEVICES_ERROR_GROUP_HEADER" value:&stru_270C3F140 table:@"Localizable"];
    id v7 = [v3 groupSpecifierWithID:@"TUI_PANE_DEVICE_ERROR_GROUP" name:v11];

    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = v8;
    v10 = @"TRANSPARENCY_PANE_DEVICES_ERROR_GROUP_FOOTER";
  }
  else
  {
    v6 = [v4 localizedStringForKey:@"TRANSPARENCY_PANE_DEVICE_ERROR_GROUP_HEADER" value:&stru_270C3F140 table:@"Localizable"];
    id v7 = [v3 groupSpecifierWithID:@"TUI_PANE_DEVICE_ERROR_GROUP" name:v6];

    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = v8;
    v10 = @"TRANSPARENCY_PANE_DEVICE_ERROR_GROUP_FOOTER";
  }
  uint64_t v12 = [v8 localizedStringForKey:v10 value:&stru_270C3F140 table:@"Localizable"];
  [v7 setProperty:v12 forKey:*MEMORY[0x263F600F8]];

  return v7;
}

- (id)_spinnerSpecifierGroup
{
  return (id)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"SPINNER_GROUP"];
}

- (id)_specifierForSpinner
{
  return (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
}

- (id)_specifierForError
{
  unint64_t v2 = (void *)MEMORY[0x263F5FC40];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"TRANSPARENCY_PANE_DEVICE_LOADING_ERROR" value:&stru_270C3F140 table:@"Localizable"];
  v5 = [v2 preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

  [v5 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  return v5;
}

- (id)_specifierForDevice:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  v6 = [v5 name];
  id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:1 edit:0];

  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  uint64_t v8 = [v5 name];
  [v7 setProperty:v8 forKey:*MEMORY[0x263F602D0]];

  v9 = [NSNumber numberWithDouble:*MEMORY[0x263F1D600]];
  [v7 setProperty:v9 forKey:*MEMORY[0x263F602A8]];

  v10 = [v5 modelDisplayName];
  [v7 setProperty:v10 forKey:*MEMORY[0x263F602C8]];

  uint64_t v11 = MEMORY[0x263EFFA88];
  [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
  uint64_t v12 = [(TUIDeviceSpecifierProvider *)self _iconURLForDevice:v5];
  [v7 setProperty:v12 forKey:*MEMORY[0x263F601B0]];

  [v7 setControllerLoadAction:sel__deviceSpecifierWasTapped_];
  [v7 setUserInfo:v5];

  [v7 setProperty:v11 forKey:*MEMORY[0x263F600A8]];
  return v7;
}

- (id)_removeDeviceSpecifier:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"REMOVE_FROM_ACCOUNT" value:&stru_270C3F140 table:@"Localizable"];
  id v7 = [v4 deleteButtonSpecifierWithName:v6 target:self action:sel__removeTappedForDevice_];

  [v7 setProperty:&unk_270C4C148 forKey:*MEMORY[0x263F5FEF0]];
  return v7;
}

- (void)_deviceSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = NSURL;
    id v7 = [v5 deviceDetailUri];
    uint64_t v8 = [v6 URLWithString:v7];

    if (v8)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) initWithURL:v8];
      v10 = [v5 deviceDetailHttpMethod];
      [v9 setHTTPMethod:v10];

      uint64_t v11 = [(TUIDeviceSpecifierProvider *)self delegate];
      [v11 specifierProvider:self loadRequest:v9 withIdentifier:@"_AAUIRemotePageIdentifierTrustedDevice" specifier:v4];
    }
    else
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_68_1);
      }
      id v13 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_260338000, v13, OS_LOG_TYPE_DEBUG, "Unable to load trusted-devices remote UI. We're missing the URL from the device info!", v14, 2u);
      }
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_64_0);
    }
    uint64_t v12 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_260338000, v12, OS_LOG_TYPE_DEBUG, "Unable to load trusted-devices remote UI. We're missing the device info!", buf, 2u);
    }
  }
}

uint64_t __56__TUIDeviceSpecifierProvider__deviceSpecifierWasTapped___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __56__TUIDeviceSpecifierProvider__deviceSpecifierWasTapped___block_invoke_66()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_iconURLForDevice:(id)a3
{
  v3 = [a3 modelSmallPhotoURL3x];
  id v4 = [NSURL URLWithString:v3];

  return v4;
}

- (id)_deviceList
{
  deviceList = self->_deviceList;
  if (!deviceList)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_74_0);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG)) {
      [(TUIDevicesWithIssuesSpecifierProvider *)(uint64_t)self _deviceList];
    }
    id v5 = (AADeviceList *)[objc_alloc(MEMORY[0x263F25828]) initWithAccountManager:self->_accountManager];
    v6 = self->_deviceList;
    self->_deviceList = v5;

    [(AADeviceList *)self->_deviceList setDelegate:self];
    deviceList = self->_deviceList;
  }
  return deviceList;
}

uint64_t __41__TUIDeviceSpecifierProvider__deviceList__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)deviceListModified:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_77);
  }
  id v4 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG)) {
    [(TUIDeviceSpecifierProvider *)v4 deviceListModified:(uint64_t)self];
  }
  [(NSMutableArray *)self->_devicesWithErrors removeAllObjects];
  long long v24 = [MEMORY[0x263EFF980] array];
  id v5 = dispatch_group_create();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy_;
  v40[4] = __Block_byref_object_dispose_;
  id v41 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v37;
    uint64_t v23 = *MEMORY[0x263F80D78];
    *(void *)&long long v7 = 138543618;
    long long v22 = v7;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v10, "pushToken", v22);
        if (v11
          && ([v10 pushToken],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              int v13 = [v12 isEqualToString:&stru_270C3F140],
              v12,
              v11,
              !v13))
        {
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_83);
          }
          uint64_t v16 = (id)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v17 = [v10 pushToken];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v17;
            _os_log_impl(&dword_260338000, v16, OS_LOG_TYPE_DEBUG, "checking device %@ for errors", buf, 0xCu);
          }
          v18 = (void *)MEMORY[0x263EFF8F8];
          id v19 = [v10 pushToken];
          v14 = objc_msgSend(v18, "kt_dataWithHexString:", objc_msgSend(v19, "UTF8String"));

          *(void *)buf = 0;
          objc_initWeak((id *)buf, self);
          dispatch_group_enter(v5);
          v20 = (void *)MEMORY[0x263F80D20];
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_86;
          v31[3] = &unk_265553888;
          objc_copyWeak(&v35, (id *)buf);
          v31[4] = v10;
          id v32 = v24;
          v34 = v40;
          v33 = v5;
          [v20 loggableDataForDeviceID:v14 application:v23 completionBlock:v31];

          objc_destroyWeak(&v35);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_80);
          }
          v14 = (id)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v15 = [v10 name];
            *(_DWORD *)buf = v22;
            *(void *)&buf[4] = self;
            __int16 v43 = 2114;
            v44 = v15;
            _os_log_debug_impl(&dword_260338000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ device %{public}@ ignored", buf, 0x16u);
          }
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v6);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_103;
  block[3] = &unk_2655538B0;
  objc_copyWeak(&v30, (id *)buf);
  id v28 = v24;
  v29 = v40;
  id v21 = v24;
  dispatch_group_notify(v5, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(v40, 8);
}

uint64_t __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_78()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_81()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_91_0);
    }
    uint64_t v8 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
    {
      long long v24 = *(void **)(a1 + 32);
      v25 = v8;
      v26 = [v24 pushToken];
      *(_DWORD *)buf = 136316162;
      long long v38 = "-[TUIDeviceSpecifierProvider deviceListModified:]_block_invoke_2";
      __int16 v39 = 2114;
      v40 = v26;
      __int16 v41 = 2114;
      id v42 = v5;
      __int16 v43 = 2114;
      id v44 = v6;
      __int16 v45 = 2114;
      id v46 = WeakRetained;
      _os_log_debug_impl(&dword_260338000, v25, OS_LOG_TYPE_DEBUG, "%s device %{public}@: loggableData = %{public}@, error = %{public}@ on %{public}@", buf, 0x34u);

      if (!v5) {
        goto LABEL_31;
      }
    }
    else if (!v5)
    {
      goto LABEL_31;
    }
    if ([v5 result]) {
      goto LABEL_31;
    }
    if ([v5 marked])
    {
      uint64_t v9 = [v5 markExpiryDate];
      if (!v9
        || (v10 = (void *)v9,
            [v5 markExpiryDate],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            BOOL v12 = +[TUIUtils isDateExpired:v11],
            v11,
            v10,
            !v12))
      {
        if ([*(id *)(a1 + 40) count]) {
          goto LABEL_31;
        }
        uint64_t v22 = [v5 markExpiryDate];
        if (!v22) {
          goto LABEL_31;
        }
        id v21 = (void *)v22;
        uint64_t v23 = [v5 markExpiryDate];
        if (+[TUIUtils isDateExpired:v23])
        {
        }
        else
        {
          v27 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          if (v27)
          {
            long long v36 = [v5 markExpiryDate];
            id v28 = [v27 laterDate:v36];
            v29 = [v5 markExpiryDate];

            if (v28 != v29) {
              goto LABEL_31;
            }
          }
          else
          {
          }
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_101_0);
          }
          id v30 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
          if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
          {
            v31 = v30;
            id v32 = [v5 markExpiryDate];
            v33 = [*(id *)(a1 + 32) pushToken];
            *(_DWORD *)buf = 138543618;
            long long v38 = v32;
            __int16 v39 = 2114;
            v40 = v33;
            _os_log_impl(&dword_260338000, v31, OS_LOG_TYPE_DEBUG, "found new max expiry date (%{public}@) on device %{public}@ ", buf, 0x16u);
          }
          uint64_t v34 = [v5 markExpiryDate];
          uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
          id v21 = *(void **)(v35 + 40);
          *(void *)(v35 + 40) = v34;
        }
        goto LABEL_25;
      }
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_98_0);
      }
      int v13 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
      if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_23;
      }
      v14 = v13;
      uint64_t v15 = [v5 markExpiryDate];
      uint64_t v16 = [*(id *)(a1 + 32) pushToken];
      *(_DWORD *)buf = 138543618;
      long long v38 = v15;
      __int16 v39 = 2114;
      v40 = v16;
      _os_log_impl(&dword_260338000, v14, OS_LOG_TYPE_DEBUG, "found deleted expired device (%{public}@) to display %{public}@", buf, 0x16u);
    }
    else
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_94_0);
      }
      v18 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
      if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG))
      {
LABEL_23:
        [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
        uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
        id v21 = *(void **)(v20 + 40);
        if (v21)
        {
          *(void *)(v20 + 40) = 0;
LABEL_25:
        }
LABEL_31:
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
        goto LABEL_32;
      }
      id v19 = *(void **)(a1 + 32);
      v14 = v18;
      uint64_t v15 = [v19 pushToken];
      *(_DWORD *)buf = 138543362;
      long long v38 = v15;
      _os_log_impl(&dword_260338000, v14, OS_LOG_TYPE_DEBUG, "found failed device to display %{public}@", buf, 0xCu);
    }

    goto LABEL_23;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_88_0);
  }
  uint64_t v17 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    long long v38 = "-[TUIDeviceSpecifierProvider deviceListModified:]_block_invoke";
    _os_log_impl(&dword_260338000, v17, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
  }
LABEL_32:
}

uint64_t __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_89()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_92()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_96()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_99()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_103(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_109);
    }
    id v3 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_DEBUG)) {
      __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_103_cold_1((uint64_t)WeakRetained, a1, v3);
    }
    id v4 = [WeakRetained stateManager];
    [v4 setExpectedResolutionDays:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    [WeakRetained setDevicesWithErrors:*(void *)(a1 + 32)];
    id v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    id v6 = v5;

    long long v7 = [WeakRetained delegate];
    [v7 reloadSpecifiersForProvider:WeakRetained oldSpecifiers:v6 animated:1];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_15, &__block_literal_global_106);
    }
    uint64_t v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "-[TUIDeviceSpecifierProvider deviceListModified:]_block_invoke";
      _os_log_impl(&dword_260338000, v8, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v9, 0xCu);
    }
  }
}

uint64_t __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_2_104()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_107()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (TUIDeviceSpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIDeviceSpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (NSMutableArray)devicesWithErrors
{
  return self->_devicesWithErrors;
}

- (void)setDevicesWithErrors:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (TUIKTStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (AADeviceList)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceList, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_devicesWithErrors, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithAccountManager:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[TUIDeviceSpecifierProvider initWithAccountManager:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_260338000, a2, OS_LOG_TYPE_ERROR, "%s not supported on %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)deviceListModified:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  int v6 = 136315650;
  long long v7 = "-[TUIDeviceSpecifierProvider deviceListModified:]";
  __int16 v8 = 1024;
  int v9 = [a2 count];
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  _os_log_debug_impl(&dword_260338000, v5, OS_LOG_TYPE_DEBUG, "%s devices count = %d on %{public}@", (uint8_t *)&v6, 0x1Cu);
}

void __49__TUIDeviceSpecifierProvider_deviceListModified___block_invoke_103_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void **)(a2 + 32);
  int v6 = a3;
  int v7 = [v5 count];
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a2 + 40) + 8) + 40);
  int v9 = 138543874;
  uint64_t v10 = a1;
  __int16 v11 = 1024;
  int v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_260338000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ devices with errors count = %d, deleted devices expire date = %{public}@", (uint8_t *)&v9, 0x1Cu);
}

@end