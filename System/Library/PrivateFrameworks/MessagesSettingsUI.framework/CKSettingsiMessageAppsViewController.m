@interface CKSettingsiMessageAppsViewController
- (BOOL)_canDeleteAppAtIndexPath:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CKSettingsiMessageAppManager)appManager;
- (CKSettingsiMessageAppsViewController)initWithAppManager:(id)a3;
- (id)_appsWithiMessageAppsSpecifiers;
- (id)_generateiMessageAppSpecifiers;
- (id)_iMessageOnlyAppsSpecifiers;
- (id)_specifierForApp:(id)a3;
- (id)getIsMessagesAppShownInSendMenuForSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_deleteApp:(id)a3;
- (void)installediMessageAppsDidChange:(id)a3;
- (void)setAppManager:(id)a3;
- (void)setIsMessagesAppShownInSendMenu:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation CKSettingsiMessageAppsViewController

- (CKSettingsiMessageAppsViewController)initWithAppManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKSettingsiMessageAppsViewController;
  v6 = [(CKSettingsiMessageAppsViewController *)&v9 init];
  if (v6)
  {
    v7 = MessagesSettingsLocalizedString(@"IMESSAGE_APPS_PAGE_TITLE");
    [(CKSettingsiMessageAppsViewController *)v6 setTitle:v7];
    objc_storeStrong((id *)&v6->_appManager, a3);
  }
  return v6;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CKSettingsiMessageAppsViewController;
  [(CKSettingsiMessageAppsViewController *)&v4 viewDidLoad];
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) setEditing:1 animated:0];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_installediMessageAppsDidChange_ name:@"CKSettingsiMessageAppManagerInstalledAppsDidChange" object:0];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [(CKSettingsiMessageAppsViewController *)self _generateiMessageAppSpecifiers];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_generateiMessageAppSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v4 = [(CKSettingsiMessageAppsViewController *)self _iMessageOnlyAppsSpecifiers];
  [v3 addObjectsFromArray:v4];
  id v5 = [(CKSettingsiMessageAppsViewController *)self _appsWithiMessageAppsSpecifiers];
  [v3 addObjectsFromArray:v5];
  v6 = (void *)[v3 copy];

  return v6;
}

- (id)_specifierForApp:(id)a3
{
  id v4 = a3;
  if ([v4 isiMessageAppOnly])
  {
    id v5 = [v4 extensionBundleID];
    v6 = [v4 extensionDisplayName];

    uint64_t v7 = 4;
    v8 = (void *)[objc_alloc(MEMORY[0x263F5FC40]) initWithName:v6 target:0 set:0 get:0 detail:0 cell:4 edit:0];
  }
  else
  {
    id v5 = [v4 appBundleID];
    v6 = [v4 appDisplayName];

    v8 = (void *)[objc_alloc(MEMORY[0x263F5FC40]) initWithName:v6 target:self set:sel_setIsMessagesAppShownInSendMenu_specifier_ get:sel_getIsMessagesAppShownInSendMenuForSpecifier_ detail:0 cell:6 edit:0];
    uint64_t v7 = 0;
  }

  [v8 setIdentifier:v5];
  [v8 setProperty:v5 forKey:*MEMORY[0x263F60188]];
  [v8 setProperty:@"YES" forKey:*MEMORY[0x263F601A8]];
  objc_super v9 = [NSNumber numberWithUnsignedInteger:v7];
  [v8 setProperty:v9 forKey:*MEMORY[0x263F60150]];

  return v8;
}

- (id)_iMessageOnlyAppsSpecifiers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(CKSettingsiMessageAppManager *)self->_appManager deletableiMessageOnlyApps];
  if ([v4 count])
  {
    id v5 = MessagesSettingsLocalizedString(@"IMESSAGE_ONLY_APPS_SECTION_HEADER");
    v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"IMESSAGE_ONLY_APPS" name:v5];
    [v3 addObject:v6];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = -[CKSettingsiMessageAppsViewController _specifierForApp:](self, "_specifierForApp:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          [v3 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  v13 = objc_msgSend(v3, "copy", (void)v15);

  return v13;
}

- (id)_appsWithiMessageAppsSpecifiers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(CKSettingsiMessageAppManager *)self->_appManager deletableAppsWithiMessageApp];
  if ([v4 count])
  {
    uint64_t v5 = MessagesSettingsLocalizedString(@"APPS_WITH_IMESSAGE_APPS_SECTION_HEADER");
    v6 = MessagesSettingsLocalizedString(@"APPS_WITH_IMESSAGE_APPS_SECTION_FOOTER");
    long long v16 = (void *)v5;
    id v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"APPS_WITH_IMESSAGE_APPS" name:v5];
    [v7 setProperty:v6 forKey:*MEMORY[0x263F600F8]];
    [v3 addObject:v7];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [(CKSettingsiMessageAppsViewController *)self _specifierForApp:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          [v3 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  v14 = (void *)[v3 copy];

  return v14;
}

- (void)_deleteApp:(id)a3
{
  id v3 = [a3 appBundleID];
  id v4 = (void *)MEMORY[0x25A2A32D0](@"IXAppInstallCoordinator", @"InstallCoordination");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CKSettingsiMessageAppsViewController__deleteApp___block_invoke;
  v6[3] = &unk_2653F52F8;
  id v7 = v3;
  id v5 = v3;
  [v4 uninstallAppWithBundleID:v5 requestUserConfirmation:1 completion:v6];
}

void __51__CKSettingsiMessageAppsViewController__deleteApp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v8 = 138412546;
        uint64_t v9 = v6;
        __int16 v10 = 2112;
        id v11 = v3;
        _os_log_impl(&dword_2561DD000, v5, OS_LOG_TYPE_INFO, "Error uninstalling app: %@. Error: %@", (uint8_t *)&v8, 0x16u);
      }
LABEL_9:
    }
  }
  else if (v4)
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_2561DD000, v5, OS_LOG_TYPE_INFO, "Uninstalled app with bundleID: %@", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_9;
  }
}

- (void)installediMessageAppsDidChange:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2561DD000, v5, OS_LOG_TYPE_INFO, "iMessage Apps view controller notified of installed apps change", buf, 2u);
    }
  }
  uint64_t v6 = [(CKSettingsiMessageAppsViewController *)self appManager];
  if ([v6 haveDeletableApps])
  {
    uint64_t v7 = [(CKSettingsiMessageAppsViewController *)self _generateiMessageAppSpecifiers];
    [(CKSettingsiMessageAppsViewController *)self updateSpecifiers:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) withSpecifiers:v7];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v10 = 0;
        _os_log_impl(&dword_2561DD000, v8, OS_LOG_TYPE_INFO, "There are no deletable apps remaining, popping the user back to Messages settings.", v10, 2u);
      }
    }
    uint64_t v7 = [(CKSettingsiMessageAppsViewController *)self navigationController];
    id v9 = (id)[v7 popViewControllerAnimated:1];
  }
}

- (void)setIsMessagesAppShownInSendMenu:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v8 = [a4 identifier];
  uint64_t v7 = [(CKSettingsiMessageAppManager *)self->_appManager appWithBundleID:v8];
  LODWORD(self) = [v6 BOOLValue];

  [v7 setHiddenInSendMenuByUserPreference:self ^ 1];
}

- (id)getIsMessagesAppShownInSendMenuForSpecifier:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [(CKSettingsiMessageAppManager *)self->_appManager appWithBundleID:v4];
  int v6 = [v5 isHiddenInSendMenuByUserPreference];
  uint64_t v7 = [NSNumber numberWithBool:v6 ^ 1u];

  return v7;
}

- (BOOL)_canDeleteAppAtIndexPath:(id)a3
{
  id v4 = [(CKSettingsiMessageAppsViewController *)self specifierAtIndexPath:a3];
  id v5 = [v4 identifier];
  int v6 = [(CKSettingsiMessageAppManager *)self->_appManager appWithBundleID:v5];
  char v7 = [v6 isiMessageAppOnly];

  return v7;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return [(CKSettingsiMessageAppsViewController *)self _canDeleteAppAtIndexPath:a4];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    __int16 v10 = [(CKSettingsiMessageAppsViewController *)self specifierAtIndexPath:v9];
    id v11 = [v10 identifier];
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        long long v15 = v11;
        _os_log_impl(&dword_2561DD000, v12, OS_LOG_TYPE_INFO, "User requested uninstall of app with bundleID: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    v13 = [(CKSettingsiMessageAppManager *)self->_appManager appWithBundleID:v11];
    [(CKSettingsiMessageAppsViewController *)self _deleteApp:v13];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(CKSettingsiMessageAppsViewController *)self _canDeleteAppAtIndexPath:a4];
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return MessagesSettingsLocalizedString(@"IMESSAGE_APP_DELETE_CONFIRMATION_BUTTON_TITLE");
}

- (CKSettingsiMessageAppManager)appManager
{
  return self->_appManager;
}

- (void)setAppManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end