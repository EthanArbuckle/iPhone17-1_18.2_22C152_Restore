@interface TUIDevicesWithIssuesSpecifierProvider
- (AADeviceList)deviceList;
- (AAUISpecifierProviderDelegate)delegate;
- (AIDAAccountManager)accountManager;
- (NSArray)specifiers;
- (NSMutableArray)devicesWithIssues;
- (NSMutableArray)devicesWithIssuesIdentifiers;
- (NSMutableArray)unknownDevices;
- (TUIDevicesWithIssuesSpecifierProvider)initWithAccountManager:(id)a3;
- (TUIDevicesWithIssuesSpecifierProvider)initWithAccountManager:(id)a3 devicesWithIssuesIdentifiers:(id)a4;
- (TUIIDMSDeviceSource)idms;
- (id)_deviceList;
- (id)_iconURLForDevice:(id)a3;
- (id)_specifierForDevice:(id)a3;
- (id)_specifierForError;
- (id)_specifierForSpinner;
- (id)_specifierForUnknownDevice:(id)a3;
- (id)_specifiersForDeviceList:(id)a3;
- (id)_spinnerSpecifierGroup;
- (unint64_t)devicesWithIssuesCount;
- (void)_deviceList;
- (void)_updateDevicesWithIssuesList:(id)a3;
- (void)deviceListModified:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceList:(id)a3;
- (void)setDevicesWithIssues:(id)a3;
- (void)setDevicesWithIssuesCount:(unint64_t)a3;
- (void)setDevicesWithIssuesIdentifiers:(id)a3;
- (void)setIdms:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setUnknownDevices:(id)a3;
@end

@implementation TUIDevicesWithIssuesSpecifierProvider

- (TUIDevicesWithIssuesSpecifierProvider)initWithAccountManager:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_0);
  }
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR)) {
    -[TUIDevicesWithIssuesSpecifierProvider initWithAccountManager:]((uint64_t)self, v5);
  }

  return 0;
}

uint64_t __64__TUIDevicesWithIssuesSpecifierProvider_initWithAccountManager___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (TUIDevicesWithIssuesSpecifierProvider)initWithAccountManager:(id)a3 devicesWithIssuesIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TUIDevicesWithIssuesSpecifierProvider;
  v9 = [(TUIDevicesWithIssuesSpecifierProvider *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_devicesWithIssuesIdentifiers, a4);
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    devicesWithIssues = v10->_devicesWithIssues;
    v10->_devicesWithIssues = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    unknownDevices = v10->_unknownDevices;
    v10->_unknownDevices = (NSMutableArray *)v13;

    v15 = [[TUIIDMSDeviceSource alloc] initWithIdmsDeviceProtocol:0];
    idms = v10->_idms;
    v10->_idms = v15;

    id v17 = [(TUIDevicesWithIssuesSpecifierProvider *)v10 _deviceList];
  }

  return v10;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    v5 = [(TUIDevicesWithIssuesSpecifierProvider *)self _deviceList];
    v6 = [(TUIDevicesWithIssuesSpecifierProvider *)self _specifiersForDeviceList:v5];
    [v4 addObjectsFromArray:v6];

    id v7 = (NSArray *)[v4 copy];
    id v8 = self->_specifiers;
    self->_specifiers = v7;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (id)_specifiersForDeviceList:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_devicesWithIssuesCount = 0;
  v5 = [v4 loadError];

  if (v5)
  {
    v6 = [(TUIDevicesWithIssuesSpecifierProvider *)self _specifierForError];
    v39[0] = v6;
    id v7 = (void *)MEMORY[0x263EFF8C0];
    id v8 = (void **)v39;
    goto LABEL_3;
  }
  v10 = [v4 devices];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    if ([(NSMutableArray *)self->_devicesWithIssues count]
      || [(NSMutableArray *)self->_unknownDevices count])
    {
      v6 = [MEMORY[0x263EFF980] array];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v12 = self->_devicesWithIssues;
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = [(TUIDevicesWithIssuesSpecifierProvider *)self _specifierForDevice:*(void *)(*((void *)&v31 + 1) + 8 * i)];
            [v6 addObject:v17];

            ++self->_devicesWithIssuesCount;
          }
          uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v14);
      }

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v18 = self->_unknownDevices;
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = -[TUIDevicesWithIssuesSpecifierProvider _specifierForUnknownDevice:](self, "_specifierForUnknownDevice:", *(void *)(*((void *)&v27 + 1) + 8 * j), (void)v27);
            [v6 addObject:v23];

            ++self->_devicesWithIssuesCount;
          }
          uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v20);
      }

      uint64_t v9 = [v6 copy];
      goto LABEL_22;
    }
    v6 = [(TUIDevicesWithIssuesSpecifierProvider *)self _spinnerSpecifierGroup];
    v37 = v6;
    id v7 = (void *)MEMORY[0x263EFF8C0];
    id v8 = &v37;
LABEL_3:
    uint64_t v9 = [v7 arrayWithObjects:v8 count:1];
LABEL_22:
    v24 = (void *)v9;
    goto LABEL_23;
  }
  v6 = [(TUIDevicesWithIssuesSpecifierProvider *)self _spinnerSpecifierGroup];
  v38[0] = v6;
  v26 = [(TUIDevicesWithIssuesSpecifierProvider *)self _specifierForSpinner];
  v38[1] = v26;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];

LABEL_23:
  return v24;
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
  v2 = (void *)MEMORY[0x263F5FC40];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"TRANSPARENCY_PANE_DEVICE_LOADING_ERROR" value:&stru_270C3F140 table:@"Localizable"];
  v5 = [v2 preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

  [v5 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  return v5;
}

- (id)_specifierForDevice:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  v6 = [v5 name];
  id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  id v8 = [v5 name];
  [v7 setProperty:v8 forKey:*MEMORY[0x263F602D0]];

  uint64_t v9 = [NSNumber numberWithDouble:*MEMORY[0x263F1D600]];
  [v7 setProperty:v9 forKey:*MEMORY[0x263F602A8]];

  v10 = [v5 osVersion];
  [v7 setProperty:v10 forKey:*MEMORY[0x263F602C8]];

  uint64_t v11 = MEMORY[0x263EFFA88];
  [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
  v12 = [(TUIDevicesWithIssuesSpecifierProvider *)self _iconURLForDevice:v5];

  [v7 setProperty:v12 forKey:*MEMORY[0x263F601B0]];
  [v7 setProperty:v11 forKey:*MEMORY[0x263F600A8]];
  return v7;
}

- (id)_specifierForUnknownDevice:(id)a3
{
  id v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v4 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"UNKNOWN_DEVICE" value:&stru_270C3F140 table:@"Localizable"];
  [v4 setProperty:v6 forKey:*MEMORY[0x263F602D0]];

  id v7 = [NSNumber numberWithDouble:*MEMORY[0x263F1D600]];
  [v4 setProperty:v7 forKey:*MEMORY[0x263F602A8]];

  [v4 setProperty:&stru_270C3F140 forKey:*MEMORY[0x263F602C8]];
  uint64_t v8 = MEMORY[0x263EFFA88];
  [v4 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
  uint64_t v9 = [(TUIDevicesWithIssuesSpecifierProvider *)self _iconURLForDevice:0];
  [v4 setProperty:v9 forKey:*MEMORY[0x263F601B0]];

  [v4 setProperty:v8 forKey:*MEMORY[0x263F600A8]];
  return v4;
}

- (id)_iconURLForDevice:(id)a3
{
  if (a3)
  {
    v3 = [a3 modelSmallPhotoURL3x];
  }
  else
  {
    v3 = @"https://appleid.cdn-apple.com/static/bin/cb2625518626/images/deviceLoading@3x.png";
  }
  id v4 = v3;
  id v5 = [NSURL URLWithString:v3];

  return v5;
}

- (void)_updateDevicesWithIssuesList:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMutableArray *)self->_devicesWithIssues removeAllObjects];
  [(NSMutableArray *)self->_unknownDevices removeAllObjects];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = self->_devicesWithIssuesIdentifiers;
  uint64_t v41 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v50;
    *(void *)&long long v5 = 138543874;
    long long v37 = v5;
    id v40 = v4;
    v43 = self;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v50 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v6;
        id v7 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * v6), "kt_hexString", v37);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v8 = v4;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v59 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v46;
          while (2)
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v46 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v45 + 1) + 8 * v12);
              uint64_t v14 = [v13 pushToken];
              if (v14
                && (uint64_t v15 = (void *)v14,
                    [v13 pushToken],
                    v16 = objc_claimAutoreleasedReturnValue(),
                    int v17 = [v16 isEqualToString:&stru_270C3F140],
                    v16,
                    v15,
                    !v17))
              {
                uint64_t v21 = [v13 pushToken];
                int v22 = [v21 isEqualToString:v7];

                if (v22)
                {
                  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1) {
                    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_48);
                  }
                  id v4 = v40;
                  self = v43;
                  v26 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
                  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_DEBUG))
                  {
                    long long v28 = v26;
                    long long v29 = [v13 pushToken];
                    long long v30 = [v13 name];
                    *(_DWORD *)buf = v37;
                    v54 = v43;
                    __int16 v55 = 2114;
                    v56 = v29;
                    __int16 v57 = 2114;
                    v58 = v30;
                    _os_log_debug_impl(&dword_260338000, v28, OS_LOG_TYPE_DEBUG, "%{public}@ device with issue found (%{public}@, %{public}@)", buf, 0x20u);
                  }
                  [(NSMutableArray *)v43->_devicesWithIssues addObject:v13];

                  goto LABEL_36;
                }
              }
              else
              {
                if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1) {
                  dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_45);
                }
                v18 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
                if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = [v13 name];
                  *(_DWORD *)buf = 138543618;
                  v54 = v43;
                  __int16 v55 = 2114;
                  v56 = v20;
                  _os_log_debug_impl(&dword_260338000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ device %{public}@ ignored", buf, 0x16u);
                }
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v59 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        self = v43;
        v23 = [(TUIDevicesWithIssuesSpecifierProvider *)v43 idms];
        v24 = [v23 mapDeviceWithMissing:v7 aaDevices:v8];

        if (v24)
        {
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1) {
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_51);
          }
          v25 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
          id v4 = v40;
          if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_DEBUG))
          {
            long long v31 = v25;
            long long v32 = [v24 pushToken];
            long long v33 = [v24 name];
            *(_DWORD *)buf = v37;
            v54 = v43;
            __int16 v55 = 2114;
            v56 = v32;
            __int16 v57 = 2114;
            v58 = v33;
            _os_log_debug_impl(&dword_260338000, v31, OS_LOG_TYPE_DEBUG, "%{public}@ device with issues found via fallback (%{public}@, %{public}@)", buf, 0x20u);
          }
          [(NSMutableArray *)v43->_devicesWithIssues addObject:v24];
        }
        else
        {
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1) {
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_54);
          }
          long long v27 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
          id v4 = v40;
          if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v54 = v43;
            __int16 v55 = 2114;
            v56 = v7;
            _os_log_error_impl(&dword_260338000, v27, OS_LOG_TYPE_ERROR, "%{public}@ device with issue not found => adding unknown device (%{public}@)", buf, 0x16u);
          }
          [(NSMutableArray *)v43->_unknownDevices addObject:v7];
        }
LABEL_36:

        uint64_t v6 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [(NSMutableArray *)obj countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v41);
  }

  if ([(NSMutableArray *)self->_unknownDevices count])
  {
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_55;
    v44[3] = &unk_265552FC0;
    v44[4] = self;
    [v4 enumerateObjectsUsingBlock:v44];
  }
  specifiers = self->_specifiers;
  self->_specifiers = 0;
  v35 = specifiers;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v35 animated:1];
}

uint64_t __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_46()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_49()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_52()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_55(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_57);
  }
  uint64_t v6 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = v6;
    uint64_t v9 = [v5 pushToken];
    uint64_t v10 = [v5 name];
    uint64_t v11 = [v5 deviceID];
    int v12 = 138544642;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = a3;
    __int16 v16 = 2114;
    int v17 = v9;
    __int16 v18 = 2160;
    uint64_t v19 = 1752392040;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    v23 = v11;
    _os_log_error_impl(&dword_260338000, v8, OS_LOG_TYPE_ERROR, "%{public}@ IdMS device %ld: %{public}@ %{mask.hash}@ %{public}@", (uint8_t *)&v12, 0x3Eu);
  }
}

uint64_t __70__TUIDevicesWithIssuesSpecifierProvider__updateDevicesWithIssuesList___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_deviceList
{
  deviceList = self->_deviceList;
  if (!deviceList)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_60);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_DEBUG)) {
      [(TUIDevicesWithIssuesSpecifierProvider *)(uint64_t)self _deviceList];
    }
    id v5 = (AADeviceList *)[objc_alloc(MEMORY[0x263F25828]) initWithAccountManager:self->_accountManager];
    uint64_t v6 = self->_deviceList;
    self->_deviceList = v5;

    [(AADeviceList *)self->_deviceList setDelegate:self];
    deviceList = self->_deviceList;
  }
  return deviceList;
}

uint64_t __52__TUIDevicesWithIssuesSpecifierProvider__deviceList__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)deviceListModified:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_63);
  }
  id v5 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_DEBUG)) {
    [(TUIDevicesWithIssuesSpecifierProvider *)v5 deviceListModified:(uint64_t)self];
  }
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__TUIDevicesWithIssuesSpecifierProvider_deviceListModified___block_invoke_64;
  block[3] = &unk_265552FE8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __60__TUIDevicesWithIssuesSpecifierProvider_deviceListModified___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __60__TUIDevicesWithIssuesSpecifierProvider_deviceListModified___block_invoke_64(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateDevicesWithIssuesList:*(void *)(a1 + 32)];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_0, &__block_literal_global_66);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[TUIDevicesWithIssuesSpecifierProvider deviceListModified:]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __60__TUIDevicesWithIssuesSpecifierProvider_deviceListModified___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (unint64_t)devicesWithIssuesCount
{
  return self->_devicesWithIssuesCount;
}

- (void)setDevicesWithIssuesCount:(unint64_t)a3
{
  self->_devicesWithIssuesCount = a3;
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (AADeviceList)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
}

- (NSMutableArray)devicesWithIssuesIdentifiers
{
  return self->_devicesWithIssuesIdentifiers;
}

- (void)setDevicesWithIssuesIdentifiers:(id)a3
{
}

- (NSMutableArray)devicesWithIssues
{
  return self->_devicesWithIssues;
}

- (void)setDevicesWithIssues:(id)a3
{
}

- (NSMutableArray)unknownDevices
{
  return self->_unknownDevices;
}

- (void)setUnknownDevices:(id)a3
{
}

- (TUIIDMSDeviceSource)idms
{
  return self->_idms;
}

- (void)setIdms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idms, 0);
  objc_storeStrong((id *)&self->_unknownDevices, 0);
  objc_storeStrong((id *)&self->_devicesWithIssues, 0);
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, 0);
  objc_storeStrong((id *)&self->_deviceList, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithAccountManager:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[TUIDevicesWithIssuesSpecifierProvider initWithAccountManager:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_260338000, a2, OS_LOG_TYPE_ERROR, "%s not supported on %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)_deviceList
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_260338000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ getting device list...", (uint8_t *)&v2, 0xCu);
}

- (void)deviceListModified:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  int v6 = 136315650;
  uint64_t v7 = "-[TUIDevicesWithIssuesSpecifierProvider deviceListModified:]";
  __int16 v8 = 1024;
  int v9 = [a2 count];
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  _os_log_debug_impl(&dword_260338000, v5, OS_LOG_TYPE_DEBUG, "%s devices count = %d on %{public}@", (uint8_t *)&v6, 0x1Cu);
}

@end