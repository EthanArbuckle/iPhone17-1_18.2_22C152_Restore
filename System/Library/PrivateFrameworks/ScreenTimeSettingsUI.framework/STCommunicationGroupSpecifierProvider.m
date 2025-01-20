@interface STCommunicationGroupSpecifierProvider
- (BOOL)showDemoModeAlertIfNeeded;
- (PSSpecifier)communicationLimitsSpecifier;
- (PSSpecifier)communicationSafetySpecifier;
- (STCommunicationGroupSpecifierProvider)init;
- (id)_communicationLimitsDetailText;
- (id)_communicationSafetyDetailText;
- (void)_communicationLimitsDidChangeFrom:(id)a3 to:(id)a4;
- (void)_communicationSafetyDetailText;
- (void)_communicationSafetyDidChange;
- (void)_isRemoteUserDidChangeFrom:(BOOL)a3 to:(BOOL)a4;
- (void)_resetCommunicationLimitsDetailText;
- (void)_showCommunicationLimitsViewController:(id)a3;
- (void)_userTypeDidChange:(unint64_t)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setCommunicationLimitsSpecifier:(id)a3;
- (void)setCommunicationSafetySpecifier:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)showCommunicationSafetyViewController:(id)a3;
@end

@implementation STCommunicationGroupSpecifierProvider

- (STCommunicationGroupSpecifierProvider)init
{
  v25.receiver = self;
  v25.super_class = (Class)STCommunicationGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v25 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle bundle];
    v22 = [(STGroupSpecifierProvider *)v2 mutableSpecifiers];
    v4 = (void *)MEMORY[0x263F5FC40];
    v5 = [v3 localizedStringForKey:@"CommunicationGroupSpecifierName" value:&stru_26D9391A8 table:0];
    v6 = [v4 groupSpecifierWithName:v5];
    [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v6];

    v24 = [v3 localizedStringForKey:@"CommunicationLimitsSpecifierName" value:&stru_26D9391A8 table:0];
    v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v24 target:v2 set:0 get:0 detail:0 cell:2 edit:0];
    [v7 setIdentifier:@"COMMUNICATION_LIMITS"];
    uint64_t v23 = *MEMORY[0x263F602D0];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24);
    v8 = [(STCommunicationGroupSpecifierProvider *)v2 _communicationLimitsDetailText];
    uint64_t v9 = *MEMORY[0x263F602C8];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F602C8]];

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *MEMORY[0x263F5FFE0];
    [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    v12 = [MEMORY[0x263F827E8] imageNamed:@"Communication" inBundle:v3];
    v13 = [v12 _applicationIconImageForFormat:0 precomposed:1];
    uint64_t v14 = *MEMORY[0x263F60140];
    [v7 setObject:v13 forKeyedSubscript:*MEMORY[0x263F60140]];

    [v7 setControllerLoadAction:sel__showCommunicationLimitsViewController_];
    [(STCommunicationGroupSpecifierProvider *)v2 setCommunicationLimitsSpecifier:v7];
    [v22 addObject:v7];
    v15 = [v3 localizedStringForKey:@"CommunicationSafetyTitle" value:&stru_26D9391A8 table:0];
    v16 = [(STCommunicationGroupSpecifierProvider *)v2 _communicationSafetyDetailText];
    v17 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:v2 set:0 get:0 detail:0 cell:2 edit:0];
    [v17 setIdentifier:@"COMMUNICATION_SAFETY"];
    [v17 setObject:v15 forKeyedSubscript:v23];
    [v17 setObject:v16 forKeyedSubscript:v9];
    [v17 setObject:@"COMMUNICATION_SAFETY" forKeyedSubscript:*MEMORY[0x263F60138]];
    [v17 setObject:objc_opt_class() forKeyedSubscript:v11];
    v18 = [MEMORY[0x263F827E8] imageNamed:@"CommunicationSafety" inBundle:v3];
    v19 = [v18 _applicationIconImageForFormat:0 precomposed:1];
    [v17 setObject:v19 forKeyedSubscript:v14];

    [v17 setControllerLoadAction:sel_showCommunicationSafetyViewController_];
    [(STCommunicationGroupSpecifierProvider *)v2 setCommunicationSafetySpecifier:v17];
    [v22 addObject:v17];
    v20 = [MEMORY[0x263F53C50] sharedConnection];
    [v20 registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v5.receiver = self;
  v5.super_class = (Class)STCommunicationGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v5 invalidate];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STCommunicationGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  if (_os_feature_enabled_impl()) {
    v6 = @"viewModel.isLocalOrRemotelyManagedUser";
  }
  else {
    v6 = @"viewModel.screenTimeEnabled";
  }
  [v5 removeObserver:self forKeyPath:v6 context:"STCommunicationGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"viewModel.me.isRemoteUser"];
  [v5 removeObserver:self forKeyPath:@"viewModel.me.type"];
  [v5 removeObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits"];
  [v5 removeObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted"];
  [v5 removeObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted"];
  [v5 removeObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyNotificationEnabled"];
  [v5 removeObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled"];
  v14.receiver = self;
  v14.super_class = (Class)STCommunicationGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v14 setCoordinator:v4];
  v7 = [v5 contentPrivacyCoordinator];
  v8 = [v7 viewModel];
  uint64_t v9 = [v8 communicationLimits];
  uint64_t v10 = [v4 contentPrivacyCoordinator];
  uint64_t v11 = [v10 viewModel];
  v12 = [v11 communicationLimits];
  [(STCommunicationGroupSpecifierProvider *)self _communicationLimitsDidChangeFrom:v9 to:v12];

  [(STCommunicationGroupSpecifierProvider *)self _communicationSafetyDidChange];
  if (_os_feature_enabled_impl()) {
    v13 = @"viewModel.isLocalOrRemotelyManagedUser";
  }
  else {
    v13 = @"viewModel.screenTimeEnabled";
  }
  [v4 addObserver:self forKeyPath:v13 options:4 context:"STCommunicationGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"viewModel.me.isRemoteUser" options:7 context:"STCommunicationGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"viewModel.me.type" options:5 context:"STCommunicationGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits" options:3 context:"STCommunicationGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted" options:5 context:"STCommunicationGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted" options:5 context:"STCommunicationGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyNotificationEnabled" options:5 context:"STCommunicationGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled" options:5 context:"STCommunicationGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "STCommunicationGroupSpecifierProviderObservationContext")
  {
    v12 = [MEMORY[0x263F53C50] sharedConnection];
    int v13 = [v12 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    objc_super v14 = [(STRootGroupSpecifierProvider *)self coordinator];
    if (_os_feature_enabled_impl()
      && [v10 isEqualToString:@"viewModel.isLocalOrRemotelyManagedUser"])
    {
      v15 = [(STRootGroupSpecifierProvider *)self coordinator];
      v16 = [v15 viewModel];
      if ([v16 isLocalOrRemotelyManagedUser])
      {
        v17 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
        if ([v17 count]) {
          BOOL v18 = v13 == 2;
        }
        else {
          BOOL v18 = 1;
        }
        uint64_t v19 = v18;
        [(STGroupSpecifierProvider *)self setIsHidden:v19];
      }
      else
      {
        [(STGroupSpecifierProvider *)self setIsHidden:1];
      }
    }
    else if ((_os_feature_enabled_impl() & 1) != 0 {
           || ![v10 isEqualToString:@"viewModel.screenTimeEnabled"])
    }
    {
      if ([v10 isEqualToString:@"viewModel.me.type"])
      {
        v22 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        uint64_t v23 = [MEMORY[0x263EFF9D0] null];

        if (v22 == v23)
        {

          v22 = 0;
        }
        -[STCommunicationGroupSpecifierProvider _userTypeDidChange:](self, "_userTypeDidChange:", [v22 unsignedIntegerValue]);
      }
      else
      {
        if ([v10 isEqualToString:@"viewModel.me.isRemoteUser"])
        {
          v22 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
          v24 = [MEMORY[0x263EFF9D0] null];

          if (v22 == v24)
          {

            v22 = 0;
          }
          objc_super v25 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          v26 = [MEMORY[0x263EFF9D0] null];

          if (v25 == v26)
          {

            objc_super v25 = 0;
          }
          -[STCommunicationGroupSpecifierProvider _isRemoteUserDidChangeFrom:to:](self, "_isRemoteUserDidChangeFrom:to:", [v22 BOOLValue], objc_msgSend(v25, "BOOLValue"));
        }
        else
        {
          if (![v10 isEqualToString:@"contentPrivacyCoordinator.viewModel.communicationLimits"])
          {
            if (([v10 isEqualToString:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted"] & 1) != 0|| (objc_msgSend(v10, "isEqualToString:", @"communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted") & 1) != 0|| (objc_msgSend(v10, "isEqualToString:", @"communicationSafetyCoordinator.viewModel.isCommunicationSafetyNotificationEnabled") & 1) != 0|| objc_msgSend(v10, "isEqualToString:", @"communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled"))
            {
              [(STCommunicationGroupSpecifierProvider *)self _communicationSafetyDidChange];
            }
            goto LABEL_41;
          }
          v22 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
          v27 = [MEMORY[0x263EFF9D0] null];

          if (v22 == v27)
          {

            v22 = 0;
          }
          objc_super v25 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          v28 = [MEMORY[0x263EFF9D0] null];

          if (v25 == v28)
          {

            objc_super v25 = 0;
          }
          [(STCommunicationGroupSpecifierProvider *)self _communicationLimitsDidChangeFrom:v22 to:v25];
        }
      }
    }
    else
    {
      v20 = [v14 viewModel];
      int v21 = [v20 isScreenTimeEnabled];

      [(STGroupSpecifierProvider *)self setIsHidden:v21 ^ 1u];
    }
LABEL_41:

    goto LABEL_42;
  }
  v29.receiver = self;
  v29.super_class = (Class)STCommunicationGroupSpecifierProvider;
  [(STCommunicationGroupSpecifierProvider *)&v29 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_42:
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    objc_super v5 = [MEMORY[0x263F53C50] sharedConnection];
    int v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    id v11 = [(STRootGroupSpecifierProvider *)self coordinator];
    v7 = [v11 viewModel];
    if ([v7 isLocalOrRemotelyManagedUser])
    {
      v8 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
      if ([v8 count]) {
        BOOL v9 = v6 == 2;
      }
      else {
        BOOL v9 = 1;
      }
      uint64_t v10 = v9;
      [(STGroupSpecifierProvider *)self setIsHidden:v10];
    }
    else
    {
      [(STGroupSpecifierProvider *)self setIsHidden:1];
    }
  }
}

- (void)_userTypeDidChange:(unint64_t)a3
{
  if (!a3)
  {
    objc_super v5 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
    int v6 = [(STCommunicationGroupSpecifierProvider *)self communicationLimitsSpecifier];
    [v5 removeObject:v6];

    if (_os_feature_enabled_impl())
    {
      v7 = [MEMORY[0x263F53C50] sharedConnection];
      int v8 = [v7 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

      id v17 = [(STRootGroupSpecifierProvider *)self coordinator];
      BOOL v9 = [v17 viewModel];
      if ([v9 isLocalOrRemotelyManagedUser])
      {
        uint64_t v10 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
        if ([v10 count]) {
          BOOL v11 = v8 == 2;
        }
        else {
          BOOL v11 = 1;
        }
        uint64_t v12 = v11;
        [(STGroupSpecifierProvider *)self setIsHidden:v12];
      }
      else
      {
        [(STGroupSpecifierProvider *)self setIsHidden:1];
      }
    }
    else
    {
      int v13 = [(STRootGroupSpecifierProvider *)self coordinator];
      objc_super v14 = [v13 viewModel];
      int v15 = [v14 isScreenTimeEnabled];

      id v17 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
      if ([v17 count]) {
        uint64_t v16 = v15 ^ 1u;
      }
      else {
        uint64_t v16 = 1;
      }
      [(STGroupSpecifierProvider *)self setIsHidden:v16];
    }
  }
}

- (void)_isRemoteUserDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 != a4) {
    [(STCommunicationGroupSpecifierProvider *)self _resetCommunicationLimitsDetailText];
  }
}

- (void)_communicationLimitsDidChangeFrom:(id)a3 to:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7 != v6 && ([v7 isEqual:v6] & 1) == 0) {
    [(STCommunicationGroupSpecifierProvider *)self _resetCommunicationLimitsDetailText];
  }
}

- (void)_resetCommunicationLimitsDetailText
{
  id v4 = [(STCommunicationGroupSpecifierProvider *)self communicationLimitsSpecifier];
  uint64_t v3 = [(STCommunicationGroupSpecifierProvider *)self _communicationLimitsDetailText];
  [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x263F602C8]];

  [(STGroupSpecifierProvider *)self reloadSpecifier:v4 animated:0];
}

- (id)_communicationLimitsDetailText
{
  v2 = [(STRootGroupSpecifierProvider *)self coordinator];
  uint64_t v3 = [v2 contentPrivacyCoordinator];
  id v4 = [v3 viewModel];
  objc_super v5 = [v4 communicationLimits];

  if ([v5 screenTimeCommunicationLimit] || objc_msgSend(v5, "downtimeCommunicationLimit"))
  {
    id v6 = +[STScreenTimeSettingsUIBundle bundle];
    id v7 = v6;
    int v8 = @"CommunicationLimitsOnDetailText";
  }
  else if ([v5 contactManagementState] || !objc_msgSend(v5, "contactsEditable"))
  {
    uint64_t v11 = [v5 contactManagementState];
    id v6 = +[STScreenTimeSettingsUIBundle bundle];
    id v7 = v6;
    if (v11) {
      int v8 = @"CommunicationLimitsManagingContactsDetailText";
    }
    else {
      int v8 = @"CommunicationLimitsContactEditingDetailText";
    }
  }
  else
  {
    id v6 = +[STScreenTimeSettingsUIBundle bundle];
    id v7 = v6;
    int v8 = @"AADC_CommunicationLimitsDetailText";
  }
  BOOL v9 = [v6 localizedStringForKey:v8 value:&stru_26D9391A8 table:0];

  return v9;
}

- (void)_showCommunicationLimitsViewController:(id)a3
{
  id v11 = a3;
  if (![(STCommunicationGroupSpecifierProvider *)self showDemoModeAlertIfNeeded])
  {
    id v4 = [(STRootGroupSpecifierProvider *)self coordinator];
    objc_super v5 = [[STCommunicationLimitsListController alloc] initWithRootViewModelCoordinator:v4];
    id v6 = [v4 viewModel];
    id v7 = [v6 me];
    int v8 = [v7 isRemoteUser];

    if (v8) {
      [MEMORY[0x263EFE9D0] requestAccountSyncWithOptions:1];
    }
    BOOL v9 = [(STGroupSpecifierProvider *)self delegate];
    [(STCommunicationLimitsListController *)v5 setParentController:v9];
    uint64_t v10 = [v9 rootController];
    [(STCommunicationLimitsListController *)v5 setRootController:v10];

    [(STCommunicationLimitsListController *)v5 setSpecifier:v11];
    [(STGroupSpecifierProvider *)self showController:v5 animated:1];
  }
}

- (void)showCommunicationSafetyViewController:(id)a3
{
  id v8 = a3;
  if (![(STCommunicationGroupSpecifierProvider *)self showDemoModeAlertIfNeeded])
  {
    id v4 = objc_opt_new();
    objc_super v5 = [(STRootGroupSpecifierProvider *)self coordinator];
    [v4 setCoordinator:v5];

    id v6 = [(STGroupSpecifierProvider *)self delegate];
    [v4 setParentController:v6];
    id v7 = [v6 rootController];
    [v4 setRootController:v7];

    [v4 setSpecifier:v8];
    [(STGroupSpecifierProvider *)self showController:v4 animated:1];
  }
}

- (void)_communicationSafetyDidChange
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_225B06000, log, OS_LOG_TYPE_DEBUG, "Reloading Communication Safety specifier", v1, 2u);
}

- (id)_communicationSafetyDetailText
{
  v2 = [(STRootGroupSpecifierProvider *)self coordinator];
  uint64_t v3 = [v2 communicationSafetyCoordinator];
  id v4 = [v3 viewModel];
  int v5 = [v4 isCommunicationSafetySendingRestricted];

  id v6 = +[STUILog communicationSafety];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(STCommunicationGroupSpecifierProvider *)v5 _communicationSafetyDetailText];
  }

  id v7 = +[STScreenTimeSettingsUIBundle bundle];
  id v8 = v7;
  if (v5) {
    BOOL v9 = @"CommunicationSafetyOnSubtitle";
  }
  else {
    BOOL v9 = @"CommunicationSafetyOffSubtitle";
  }
  uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_26D9391A8 table:0];

  return v10;
}

- (BOOL)showDemoModeAlertIfNeeded
{
  int v3 = [MEMORY[0x263F82438] isRunningInStoreDemoMode];
  if (v3) {
    [(STGroupSpecifierProvider *)self showStoreDemoAlert];
  }
  return v3;
}

- (PSSpecifier)communicationLimitsSpecifier
{
  return self->_communicationLimitsSpecifier;
}

- (void)setCommunicationLimitsSpecifier:(id)a3
{
}

- (PSSpecifier)communicationSafetySpecifier
{
  return self->_communicationSafetySpecifier;
}

- (void)setCommunicationSafetySpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationSafetySpecifier, 0);

  objc_storeStrong((id *)&self->_communicationLimitsSpecifier, 0);
}

- (void)_communicationSafetyDetailText
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [NSNumber numberWithBool:a1 & 1];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_debug_impl(&dword_225B06000, a2, OS_LOG_TYPE_DEBUG, "Top-level specifier fetching 'communication safety sending restricted' flag from viewmodel: %@", (uint8_t *)&v4, 0xCu);
}

@end