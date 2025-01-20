@interface NMCUICloudNotificationAccountDataSource
+ (BOOL)accountHasCredentials:(id)a3;
+ (BOOL)accountSupportsNotifications:(id)a3;
+ (BOOL)accountSupportsNotifications:(id)a3 forceEnabled:(BOOL)a4;
- (BOOL)accountIsPending:(id)a3;
- (BOOL)accountShowsAlerts:(id)a3;
- (BOOL)cloudNotificationsEnabled;
- (BOOL)deviceSupportsCloudNotifications;
- (BOOL)shouldPromptToEnableNotifications:(id)a3;
- (BOOL)showsAlerts;
- (NMCUIAccountDataSource)accountDataSource;
- (NMCUICloudNotificationAccountDataSource)initWithAccountDataSource:(id)a3;
- (NPSDomainAccessor)domainAccessor;
- (NPSManager)syncManager;
- (NSArray)notificationSubsections;
- (NSMutableSet)pendingAccountIds;
- (NSNumber)deviceSupportsPCC;
- (id)_emailAddressFromJWTToken:(id)a3 error:(id *)a4;
- (id)_ensureValidBase64String:(id)a3;
- (id)_getValueForKey:(id)a3;
- (id)accounts;
- (id)accountsRequiringCredentials;
- (void)_displayFailedToSaveAlertShouldDismiss:(BOOL)a3 viewController:(id)a4;
- (void)_handleDidUnpair;
- (void)_handlePairedDeviceChanged;
- (void)_setValue:(id)a3 forKey:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)handleAccountAuthenication:(id)a3 viewController:(id)a4 stateUpdateHandler:(id)a5;
- (void)removeObserver:(id)a3;
- (void)saveCredential:(id)a3 emailAddress:(id)a4 forAccount:(id)a5 completion:(id)a6;
- (void)savePCCCredentialForAccount:(id)a3 identity:(id)a4 viewController:(id)a5 stateUpdateHandler:(id)a6;
- (void)setAccountDataSource:(id)a3;
- (void)setCloudNotificationsEnabled:(BOOL)a3;
- (void)setDeviceSupportsPCC:(id)a3;
- (void)setDomainAccessor:(id)a3;
- (void)setNotificationSubsections:(id)a3;
- (void)setPendingAccountIds:(id)a3;
- (void)setShowsAlerts:(BOOL)a3;
- (void)setSyncManager:(id)a3;
@end

@implementation NMCUICloudNotificationAccountDataSource

- (NMCUICloudNotificationAccountDataSource)initWithAccountDataSource:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMCUICloudNotificationAccountDataSource;
  v5 = [(NMCUICloudNotificationAccountDataSource *)&v11 init];
  if (v5)
  {
    nnmk_setupLoggingSubsystems();
    [(NMCUICloudNotificationAccountDataSource *)v5 setAccountDataSource:v4];
    v6 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:3];
    [(NMCUICloudNotificationAccountDataSource *)v5 setPendingAccountIds:v6];

    id v7 = objc_alloc_init(MEMORY[0x263F57528]);
    [(NMCUICloudNotificationAccountDataSource *)v5 setSyncManager:v7];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v5 selector:sel__handleDidUnpair name:*MEMORY[0x263F576B8] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v5 selector:sel__handlePairedDeviceChanged name:*MEMORY[0x263F57688] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F576B8] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F57688] object:0];

  v5.receiver = self;
  v5.super_class = (Class)NMCUICloudNotificationAccountDataSource;
  [(NMCUICloudNotificationAccountDataSource *)&v5 dealloc];
}

- (BOOL)deviceSupportsCloudNotifications
{
  deviceSupportsPCC = self->_deviceSupportsPCC;
  if (!deviceSupportsPCC)
  {
    id v4 = [MEMORY[0x263F57730] sharedInstance];
    objc_super v5 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
    v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
    id v7 = [v6 firstObject];

    v8 = NSNumber;
    v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"62A0825B-34DD-490E-9DB9-D13AE37F601B"];
    objc_msgSend(v8, "numberWithBool:", objc_msgSend(v7, "supportsCapability:", v9));
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    objc_super v11 = self->_deviceSupportsPCC;
    self->_deviceSupportsPCC = v10;

    deviceSupportsPCC = self->_deviceSupportsPCC;
  }

  return [(NSNumber *)deviceSupportsPCC BOOLValue];
}

+ (BOOL)accountSupportsNotifications:(id)a3
{
  return [a1 accountSupportsNotifications:a3 forceEnabled:0];
}

+ (BOOL)accountSupportsNotifications:(id)a3 forceEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 accountTypeIdentifier];
  if ([v6 isEqualToString:*MEMORY[0x263EFAEE8]])
  {
    int v7 = [v5 enabled] | v4;
  }
  else
  {
    v8 = [v5 accountTypeIdentifier];
    if ([v8 isEqualToString:*MEMORY[0x263EFAEF8]]) {
      int v7 = [v5 enabled] | v4;
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

+ (BOOL)accountHasCredentials:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 acAccount];

  if (v4)
  {
    id v5 = [v3 acAccount];
    v6 = [v5 accountType];
    int v7 = [v6 identifier];
    if (![v7 isEqualToString:*MEMORY[0x263EFAEE8]])
    {
      BOOL v12 = 1;
      goto LABEL_9;
    }
    v8 = [v3 acAccount];
    v9 = getNNMKEmailAddressTokenKey();
    v10 = [v8 accountPropertyForKey:v9];
  }
  else
  {
    objc_super v11 = [v3 nnmkAccount];

    if (!v11)
    {
      BOOL v12 = 0;
      goto LABEL_11;
    }
    id v5 = [v3 nnmkAccount];
    v6 = [v5 typeIdentifier];
    if (![v6 isEqualToString:*MEMORY[0x263EFAEE8]])
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
    int v7 = [v3 nnmkAccount];
    v8 = [v7 emailAddressToken];
    v10 = v8;
  }
  BOOL v12 = v10 != 0;

LABEL_9:
LABEL_10:

LABEL_11:
  return v12;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NMCUICloudNotificationAccountDataSource *)self accountDataSource];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NMCUICloudNotificationAccountDataSource *)self accountDataSource];
  [v5 removeObserver:v4];
}

- (BOOL)accountIsPending:(id)a3
{
  pendingAccountIds = self->_pendingAccountIds;
  id v4 = [a3 identifier];
  LOBYTE(pendingAccountIds) = [(NSMutableSet *)pendingAccountIds containsObject:v4];

  return (char)pendingAccountIds;
}

- (id)accounts
{
  return (id)[(NMCUIAccountDataSource *)self->_accountDataSource accounts];
}

- (id)accountsRequiringCredentials
{
  id v3 = [(NMCUIAccountDataSource *)self->_accountDataSource accounts];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__NMCUICloudNotificationAccountDataSource_accountsRequiringCredentials__block_invoke;
  v6[3] = &unk_264B98F38;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "ac_filter:", v6);

  return v4;
}

uint64_t __71__NMCUICloudNotificationAccountDataSource_accountsRequiringCredentials__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [(id)objc_opt_class() accountHasCredentials:v2];

  return v3 ^ 1u;
}

- (BOOL)cloudNotificationsEnabled
{
  int v3 = getNanoMailCloudNotificationsEnabledKey();
  id v4 = [(NMCUICloudNotificationAccountDataSource *)self _getValueForKey:v3];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setCloudNotificationsEnabled:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = getNanoMailCloudNotificationsEnabledKey();
  [(NMCUICloudNotificationAccountDataSource *)self _setValue:v5 forKey:v4];
}

- (BOOL)shouldPromptToEnableNotifications:(id)a3
{
  id v4 = a3;
  if ([(NMCUICloudNotificationAccountDataSource *)self deviceSupportsCloudNotifications])
  {
    id v5 = [v4 nnmkAccount];
    if (+[NMCUICloudNotificationAccountDataSource accountSupportsNotifications:v4 forceEnabled:v5 != 0])
    {
      if ([(NMCUICloudNotificationAccountDataSource *)self cloudNotificationsEnabled]) {
        BOOL v6 = !+[NMCUICloudNotificationAccountDataSource accountHasCredentials:v4];
      }
      else {
        LOBYTE(v6) = 1;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)accountShowsAlerts:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NMCUICloudNotificationAccountDataSource *)self showsAlerts])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [(NMCUICloudNotificationAccountDataSource *)self notificationSubsections];
    uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v36 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v24;
      v21 = &v29;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v32 = 0;
          v33 = &v32;
          uint64_t v34 = 0x2020000000;
          v9 = (void *)getBPSNanoBulletinSubsectionIdSymbolLoc_ptr;
          uint64_t v35 = getBPSNanoBulletinSubsectionIdSymbolLoc_ptr;
          if (!getBPSNanoBulletinSubsectionIdSymbolLoc_ptr)
          {
            uint64_t v27 = MEMORY[0x263EF8330];
            uint64_t v28 = 3221225472;
            v29 = __getBPSNanoBulletinSubsectionIdSymbolLoc_block_invoke;
            v30 = &unk_264B98ED0;
            v31 = &v32;
            v10 = (void *)BridgePreferencesLibrary_0();
            objc_super v11 = dlsym(v10, "BPSNanoBulletinSubsectionId");
            *(void *)(v31[1] + 24) = v11;
            getBPSNanoBulletinSubsectionIdSymbolLoc_ptr = *(void *)(v31[1] + 24);
            v9 = (void *)v33[3];
          }
          _Block_object_dispose(&v32, 8);
          if (!v9) {
            goto LABEL_21;
          }
          BOOL v12 = objc_msgSend(v8, "objectForKeyedSubscript:", *v9, v21);
          v13 = [v4 identifier];
          int v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            uint64_t v32 = 0;
            v33 = &v32;
            uint64_t v34 = 0x2020000000;
            v16 = (void *)getBPSNanoBulletinShowsAlertsSymbolLoc_ptr;
            uint64_t v35 = getBPSNanoBulletinShowsAlertsSymbolLoc_ptr;
            if (!getBPSNanoBulletinShowsAlertsSymbolLoc_ptr)
            {
              uint64_t v27 = MEMORY[0x263EF8330];
              uint64_t v28 = 3221225472;
              v29 = __getBPSNanoBulletinShowsAlertsSymbolLoc_block_invoke;
              v30 = &unk_264B98ED0;
              v31 = &v32;
              v17 = (void *)BridgePreferencesLibrary_0();
              v18 = dlsym(v17, "BPSNanoBulletinShowsAlerts");
              *(void *)(v31[1] + 24) = v18;
              getBPSNanoBulletinShowsAlertsSymbolLoc_ptr = *(void *)(v31[1] + 24);
              v16 = (void *)v33[3];
            }
            _Block_object_dispose(&v32, 8);
            if (!v16)
            {
LABEL_21:
              soft_BPSCellHightlightColor_cold_1();
              __break(1u);
            }
            v19 = [v8 objectForKeyedSubscript:*v16];
            char v15 = [v19 BOOLValue];

            goto LABEL_19;
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v36 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    char v15 = 1;
LABEL_19:
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (void)saveCredential:(id)a3 emailAddress:(id)a4 forAccount:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [v12 acAccount];

  if (v14)
  {
    char v15 = [v12 acAccount];
    v16 = getNNMKEmailAddressTokenKey();
    [v15 setAccountProperty:v10 forKey:v16];

    v17 = [v12 acAccount];
    uint64_t v23 = 0;
    long long v24 = &v23;
    uint64_t v25 = 0x2020000000;
    v18 = (void *)getNNMKPCCEmailAddressKeySymbolLoc_ptr;
    uint64_t v26 = getNNMKPCCEmailAddressKeySymbolLoc_ptr;
    if (!getNNMKPCCEmailAddressKeySymbolLoc_ptr)
    {
      v19 = (void *)NanoMailKitServerLibrary();
      v24[3] = (uint64_t)dlsym(v19, "NNMKPCCEmailAddressKey");
      getNNMKPCCEmailAddressKeySymbolLoc_ptr = v24[3];
      v18 = (void *)v24[3];
    }
    _Block_object_dispose(&v23, 8);
    if (!v18)
    {
      v22 = (_Unwind_Exception *)soft_BPSCellHightlightColor_cold_1();
      _Block_object_dispose(&v23, 8);
      _Unwind_Resume(v22);
    }
    [v17 setAccountProperty:v11 forKey:*v18];
    goto LABEL_8;
  }
  v20 = [v12 nnmkAccount];

  if (v20)
  {
    v21 = [v12 nnmkAccount];
    [v21 setEmailAddressToken:v10];

    v17 = [v12 nnmkAccount];
    [v17 setPccEmailAddress:v11];
LABEL_8:
  }
  [(NMCUIAccountDataSource *)self->_accountDataSource saveAccount:v12 completion:v13];
}

- (void)handleAccountAuthenication:(id)a3 viewController:(id)a4 stateUpdateHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 accountTypeIdentifier];
  int v12 = [v11 isEqualToString:*MEMORY[0x263EFAEE8]];

  if (v12)
  {
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2050000000;
    id v13 = (void *)getSLGoogleAuthControllerClass_softClass;
    uint64_t v29 = getSLGoogleAuthControllerClass_softClass;
    if (!getSLGoogleAuthControllerClass_softClass)
    {
      location[0] = (id)MEMORY[0x263EF8330];
      location[1] = (id)3221225472;
      location[2] = __getSLGoogleAuthControllerClass_block_invoke;
      location[3] = &unk_264B98ED0;
      location[4] = &v26;
      __getSLGoogleAuthControllerClass_block_invoke((uint64_t)location);
      id v13 = (void *)v27[3];
    }
    int v14 = v13;
    _Block_object_dispose(&v26, 8);
    id v15 = [v14 alloc];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke;
    v23[3] = &unk_264B98F60;
    id v16 = v9;
    id v24 = v16;
    v17 = (void *)[v15 initWithEmailOnlyScope:1 presentationBlock:v23];
    objc_initWeak(location, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke_2;
    v18[3] = &unk_264B98FB0;
    id v19 = v8;
    objc_copyWeak(&v22, location);
    id v20 = v16;
    id v21 = v10;
    [v17 setCompletion:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }
}

uint64_t __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentViewController:a2 animated:1 completion:0];
}

void __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke_3;
  v9[3] = &unk_264B98F88;
  id v10 = v5;
  id v11 = v6;
  id v12 = a1[4];
  id v7 = v6;
  id v8 = v5;
  objc_copyWeak(&v15, a1 + 7);
  id v13 = a1[5];
  id v14 = a1[6];
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v15);
}

void __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2 && !*(void *)(a1 + 40))
  {
    id v10 = [v2 username];
    id v11 = [*(id *)(a1 + 48) username];
    uint64_t v12 = [v10 compare:v11 options:1];

    if (v12)
    {
      id v13 = qword_26870A260;
      if (os_log_type_enabled((os_log_t)qword_26870A260, OS_LOG_TYPE_ERROR)) {
        __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke_3_cold_2(v13);
      }
      id v14 = (void *)MEMORY[0x263F1C3F8];
      id v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
      id v16 = [v15 localizedStringForKey:@"AUTHENTICATION_FAILURE_ALERT_TITLE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
      v17 = NSString;
      v18 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
      id v19 = [v18 localizedStringForKey:@"AUTHENTICATION_FAILURE_INCORRECT_ACCOUNT_ALERT_DETAILS_FORMAT %@" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
      id v20 = [*(id *)(a1 + 48) username];
      id v21 = objc_msgSend(v17, "stringWithFormat:", v19, v20);
      id v22 = [v14 alertControllerWithTitle:v16 message:v21 preferredStyle:1];

      uint64_t v23 = (void *)MEMORY[0x263F1C3F0];
      id v24 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
      uint64_t v25 = [v24 localizedStringForKey:@"CANCEL_ALERT_BUTTON" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
      uint64_t v26 = [v23 actionWithTitle:v25 style:1 handler:0];

      [v22 addAction:v26];
      [*(id *)(a1 + 56) presentViewController:v22 animated:1 completion:0];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      uint64_t v28 = qword_26870A260;
      if (os_log_type_enabled((os_log_t)qword_26870A260, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2309EA000, v28, OS_LOG_TYPE_DEFAULT, "Cloud Notifications: Google authentication succeeded. Getting token.", buf, 2u);
      }
      [WeakRetained savePCCCredentialForAccount:*(void *)(a1 + 48) identity:*(void *)(a1 + 32) viewController:*(void *)(a1 + 56) stateUpdateHandler:*(void *)(a1 + 64)];
    }
  }
  else
  {
    int v3 = qword_26870A260;
    if (os_log_type_enabled((os_log_t)qword_26870A260, OS_LOG_TYPE_ERROR)) {
      __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke_3_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)savePCCCredentialForAccount:(id)a3 identity:(id)a4 viewController:(id)a5 stateUpdateHandler:(id)a6
{
  v41[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v31 = a5;
  uint64_t v12 = (void (**)(void))a6;
  id v13 = [(NMCUICloudNotificationAccountDataSource *)self pendingAccountIds];
  id v14 = [v10 identifier];
  [v13 addObject:v14];

  v12[2](v12);
  id v15 = [v11 idToken];
  id v39 = 0;
  id v16 = [(NMCUICloudNotificationAccountDataSource *)self _emailAddressFromJWTToken:v15 error:&v39];
  id v17 = v39;

  if (v16)
  {
    objc_initWeak(&location, self);
    id NNMKURLRequestClass = getNNMKURLRequestClass();
    id v19 = [getNNMKURLRequestClass() mailNotificationURL];
    v40 = @"idToken";
    id v20 = [v11 idToken];
    v41[0] = v20;
    id v21 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __114__NMCUICloudNotificationAccountDataSource_savePCCCredentialForAccount_identity_viewController_stateUpdateHandler___block_invoke;
    v32[3] = &unk_264B99028;
    objc_copyWeak(&v37, &location);
    id v33 = v31;
    id v34 = v10;
    v36 = v12;
    id v35 = v16;
    [NNMKURLRequestClass postRequestWithBaseURLString:v19 path:@"/gmail/authenticateEmail" body:v21 token:0 needsBAA:1 completion:v32];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    id v22 = qword_26870A260;
    if (os_log_type_enabled((os_log_t)qword_26870A260, OS_LOG_TYPE_ERROR)) {
      -[NMCUICloudNotificationAccountDataSource savePCCCredentialForAccount:identity:viewController:stateUpdateHandler:]((uint64_t)v17, v22, v23, v24, v25, v26, v27, v28);
    }
    uint64_t v29 = [(NMCUICloudNotificationAccountDataSource *)self pendingAccountIds];
    v30 = [v10 identifier];
    [v29 removeObject:v30];

    v12[2](v12);
  }
}

void __114__NMCUICloudNotificationAccountDataSource_savePCCCredentialForAccount_identity_viewController_stateUpdateHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v8 = [v5 objectForKeyedSubscript:@"emailAuthToken"];
  uint64_t v9 = (void *)v8;
  if (v6 || !v8)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __114__NMCUICloudNotificationAccountDataSource_savePCCCredentialForAccount_identity_viewController_stateUpdateHandler___block_invoke_2;
    block[3] = &unk_264B98FD8;
    id v16 = v6;
    id v17 = *(id *)(a1 + 32);
    id v18 = WeakRetained;
    id v19 = *(id *)(a1 + 40);
    id v20 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __114__NMCUICloudNotificationAccountDataSource_savePCCCredentialForAccount_identity_viewController_stateUpdateHandler___block_invoke_67;
    v12[3] = &unk_264B99000;
    objc_copyWeak(&v14, (id *)(a1 + 64));
    id v13 = *(id *)(a1 + 40);
    [WeakRetained saveCredential:v9 emailAddress:v10 forAccount:v11 completion:v12];

    objc_destroyWeak(&v14);
  }
}

void __114__NMCUICloudNotificationAccountDataSource_savePCCCredentialForAccount_identity_viewController_stateUpdateHandler___block_invoke_2(uint64_t a1)
{
  id v2 = qword_26870A260;
  if (os_log_type_enabled((os_log_t)qword_26870A260, OS_LOG_TYPE_ERROR)) {
    __114__NMCUICloudNotificationAccountDataSource_savePCCCredentialForAccount_identity_viewController_stateUpdateHandler___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  uint64_t v9 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  uint64_t v11 = [v10 localizedStringForKey:@"AUTHENTICATION_FAILURE_ALERT_TITLE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  uint64_t v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  id v13 = [v12 localizedStringForKey:@"AUTHENTICATION_SERVER__FAILURE_ALERT_DETAILS" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  id v14 = [v9 alertControllerWithTitle:v11 message:v13 preferredStyle:1];

  id v15 = (void *)MEMORY[0x263F1C3F0];
  id v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  id v17 = [v16 localizedStringForKey:@"CANCEL_ALERT_BUTTON" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  id v18 = [v15 actionWithTitle:v17 style:1 handler:0];

  [v14 addAction:v18];
  [*(id *)(a1 + 40) presentViewController:v14 animated:1 completion:0];
  id v19 = [*(id *)(a1 + 48) pendingAccountIds];
  id v20 = [*(id *)(a1 + 56) identifier];
  [v19 removeObject:v20];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __114__NMCUICloudNotificationAccountDataSource_savePCCCredentialForAccount_identity_viewController_stateUpdateHandler___block_invoke_67(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained pendingAccountIds];
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v7 = (void **)(a1 + 32);
  uint64_t v9 = [v8 identifier];
  [v6 removeObject:v9];

  if (v4)
  {
    uint64_t v10 = (void *)qword_26870A260;
    if (os_log_type_enabled((os_log_t)qword_26870A260, OS_LOG_TYPE_ERROR)) {
      __114__NMCUICloudNotificationAccountDataSource_savePCCCredentialForAccount_identity_viewController_stateUpdateHandler___block_invoke_67_cold_1((uint64_t)v4, v7, v10);
    }
  }
}

- (void)_displayFailedToSaveAlertShouldDismiss:(BOOL)a3 viewController:(id)a4
{
  id v4 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  uint64_t v7 = [v5 bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  uint64_t v8 = [v7 localizedStringForKey:@"FAILED_TO_SAVE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  uint64_t v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  uint64_t v10 = [v9 localizedStringForKey:@"PLEASE_TRY_AGAIN" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  id v15 = [v4 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  uint64_t v11 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  id v13 = [v12 localizedStringForKey:@"OK_ALERT_BUTTON" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  id v14 = [v11 actionWithTitle:v13 style:1 handler:0];
  [v15 addAction:v14];

  [v6 presentViewController:v15 animated:1 completion:0];
}

- (id)_emailAddressFromJWTToken:(id)a3 error:(id *)a4
{
  id v6 = [a3 componentsSeparatedByString:@"."];
  if ([v6 count] == 3)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v8 = [v6 objectAtIndexedSubscript:1];
    uint64_t v9 = [(NMCUICloudNotificationAccountDataSource *)self _ensureValidBase64String:v8];
    uint64_t v10 = (void *)[v7 initWithBase64EncodedString:v9 options:1];

    if (v10
      && ([MEMORY[0x263F08900] JSONObjectWithData:v10 options:0 error:a4],
          (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = v11;
      id v13 = [v11 objectForKeyedSubscript:@"email"];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_ensureValidBase64String:(id)a3
{
  id v3 = a3;
  if (([v3 length] & 3) != 0)
  {
    objc_msgSend(v3, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v3, "length") - (objc_msgSend(v3, "length") & 3) + 4, @"=", 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)_handleDidUnpair
{
  self->_domainAccessor = 0;
  MEMORY[0x270F9A758]();
}

- (void)_handlePairedDeviceChanged
{
  self->_domainAccessor = 0;
  MEMORY[0x270F9A758]();
}

- (NPSDomainAccessor)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    id v4 = (NPSDomainAccessor *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.NanoMail"];
    uint64_t v5 = self->_domainAccessor;
    self->_domainAccessor = v4;

    domainAccessor = self->_domainAccessor;
  }

  return domainAccessor;
}

- (id)_getValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NMCUICloudNotificationAccountDataSource *)self domainAccessor];
  id v6 = (id)[v5 synchronize];

  id v7 = [(NMCUICloudNotificationAccountDataSource *)self domainAccessor];
  uint64_t v8 = [v7 objectForKey:v4];

  return v8;
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(NMCUICloudNotificationAccountDataSource *)self domainAccessor];
  uint64_t v8 = [v7 objectForKey:v6];

  if (([v8 isEqual:v14] & 1) == 0)
  {
    uint64_t v9 = [(NMCUICloudNotificationAccountDataSource *)self domainAccessor];
    [v9 setObject:v14 forKey:v6];

    uint64_t v10 = [(NMCUICloudNotificationAccountDataSource *)self domainAccessor];
    id v11 = (id)[v10 synchronize];

    syncManager = self->_syncManager;
    id v13 = [MEMORY[0x263EFFA08] setWithObject:v6];
    [(NPSManager *)syncManager synchronizeNanoDomain:@"com.apple.NanoMail" keys:v13];
  }
}

- (BOOL)showsAlerts
{
  return self->_showsAlerts;
}

- (void)setShowsAlerts:(BOOL)a3
{
  self->_showsAlerts = a3;
}

- (NSArray)notificationSubsections
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNotificationSubsections:(id)a3
{
}

- (NMCUIAccountDataSource)accountDataSource
{
  return self->_accountDataSource;
}

- (void)setAccountDataSource:(id)a3
{
}

- (NSMutableSet)pendingAccountIds
{
  return self->_pendingAccountIds;
}

- (void)setPendingAccountIds:(id)a3
{
}

- (void)setDomainAccessor:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (NSNumber)deviceSupportsPCC
{
  return self->_deviceSupportsPCC;
}

- (void)setDeviceSupportsPCC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSupportsPCC, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_pendingAccountIds, 0);
  objc_storeStrong((id *)&self->_accountDataSource, 0);

  objc_storeStrong((id *)&self->_notificationSubsections, 0);
}

void __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __104__NMCUICloudNotificationAccountDataSource_handleAccountAuthenication_viewController_stateUpdateHandler___block_invoke_3_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2309EA000, log, OS_LOG_TYPE_ERROR, "Cloud Notifications: Authenticated on wrong account. Ignoring it.", v1, 2u);
}

- (void)savePCCCredentialForAccount:(uint64_t)a3 identity:(uint64_t)a4 viewController:(uint64_t)a5 stateUpdateHandler:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __114__NMCUICloudNotificationAccountDataSource_savePCCCredentialForAccount_identity_viewController_stateUpdateHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __114__NMCUICloudNotificationAccountDataSource_savePCCCredentialForAccount_identity_viewController_stateUpdateHandler___block_invoke_67_cold_1(uint64_t a1, void **a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = *a2;
  uint64_t v5 = a3;
  id v6 = [v4 identifier];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_2309EA000, v5, OS_LOG_TYPE_ERROR, "Failed to update account to device, Error: %{public}@, Account: %@", (uint8_t *)&v7, 0x16u);
}

@end