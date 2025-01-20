@interface SHSheetFactory
+ (id)_createPlatformViewControllerWithSession:(id)a3;
+ (id)createAirdropViewControllerWithNoContentView:(BOOL)a3 delegate:(id)a4;
+ (id)createCollaborationOptionsViewControllerWithCollaborationOptions:(id)a3 bundleIdentifier:(id)a4 updateHandler:(id)a5;
+ (id)createCollaborationParticipantsViewControllerWithContext:(id)a3 request:(id)a4 delegate:(id)a5;
+ (id)createContentViewControllerWithSession:(id)a3 presenter:(id)a4;
+ (id)createMainPresenterWithContext:(id)a3;
+ (id)createOptionsViewControllerWithContext:(id)a3 delegate:(id)a4;
+ (id)createScreenTimeAlertViewController;
+ (id)createUserDefaultsViewControllerWithContext:(id)a3 delegate:(id)a4;
@end

@implementation SHSheetFactory

+ (id)createMainPresenterWithContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Create main presenter for context:%@", (uint8_t *)&v11, 0xCu);
  }

  v5 = [SHSheetRouter alloc];
  v6 = [v3 activityViewController];
  v7 = [(SHSheetRouter *)v5 initWithRootViewController:v6 supportsModalPresentations:1];

  v8 = [[SHSheetInteractor alloc] initWithContext:v3];
  v9 = [[SHSheetPresenter alloc] initWithRouter:v7 interactor:v8];

  return v9;
}

+ (id)createContentViewControllerWithSession:(id)a3 presenter:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Create main view for session:%@", (uint8_t *)&v10, 0xCu);
  }

  v8 = +[SHSheetFactory _createPlatformViewControllerWithSession:v5];
  [v8 setPresenter:v6];

  return v8;
}

+ (id)createScreenTimeAlertViewController
{
  v2 = _ShareSheetBundle();
  id v3 = [v2 localizedStringForKey:@"RESTRICTED_ALERT_SCREEN_TIME_TITLE" value:@"Time Limit" table:@"Localizable"];

  v4 = _ShareSheetBundle();
  id v5 = [v4 localizedStringForKey:@"RESTRICTED_ALERT_SCREEN_TIME_MESSAGE" value:@"You've reached your limit for this app." table:@"Localizable"];

  id v6 = _ShareSheetBundle();
  v7 = [v6 localizedStringForKey:@"RESTRICTED_ALERT_SCREEN_TIME_DISMISS_BUTTON_TITLE" value:@"Dismiss" table:@"Localizable"];

  v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v3 message:v5 preferredStyle:1];
  v9 = [MEMORY[0x1E4FB1410] actionWithTitle:v7 style:1 handler:0];
  [v8 addAction:v9];

  return v8;
}

+ (id)_createPlatformViewControllerWithSession:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 useRemoteUIService])
  {
    int v4 = _ShareSheetPrefersModernRemoteScene();
    id v5 = off_1E5A20BA8;
    if (!v4) {
      id v5 = off_1E5A20BE0;
    }
    id v6 = (UIActivityContentViewController *)[objc_alloc(*v5) initWithSession:v3];
    v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      int v10 = v6;
      _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Created remote scene view controller:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v7 = [v3 createContentContext];
    id v6 = [[UIActivityContentViewController alloc] initWithContext:v7];
  }

  return v6;
}

+ (id)createAirdropViewControllerWithNoContentView:(BOOL)a3 delegate:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromBOOL();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "Create airdrop view with no content view:%@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v8 = (void *)getSFAirDropViewControllerClass_softClass;
  uint64_t v16 = getSFAirDropViewControllerClass_softClass;
  if (!getSFAirDropViewControllerClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v18 = __getSFAirDropViewControllerClass_block_invoke;
    v19 = &unk_1E5A216E8;
    v20 = &v13;
    __getSFAirDropViewControllerClass_block_invoke((uint64_t)&buf);
    v8 = (void *)v14[3];
  }
  int v9 = v8;
  _Block_object_dispose(&v13, 8);
  id v10 = [v9 alloc];
  uint64_t v11 = objc_msgSend(v10, "initWithNoContentView:", v4, v13);
  [v11 setDelegate:v5];

  return v11;
}

+ (id)createUserDefaultsViewControllerWithContext:(id)a3 delegate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v5;
    _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Create user defaults view with context:%@", buf, 0xCu);
  }

  v8 = [_UIActivityUserDefaultsViewController alloc];
  int v9 = [v5 favoritesProxies];
  id v10 = [v5 suggestionProxies];
  uint64_t v11 = [v5 activitiesByUUID];
  uint64_t v12 = [v5 applicationActivityTypes];
  uint64_t v13 = [v5 orderedUUIDs];
  v14 = [v5 excludedActivityTypes];
  uint64_t v15 = [v5 category];
  LOBYTE(v18) = [v5 isPresentedModally];
  uint64_t v16 = [(_UIActivityUserDefaultsViewController *)v8 initWithFavoritesProxies:v9 suggestionProxies:v10 activitiesByUUID:v11 applicationActivityTypes:v12 orderedUUIDs:v13 excludedActivityTypes:v14 activityCategory:v15 isPresentedModally:v18];

  [(_UIActivityUserDefaultsViewController *)v16 setUserDefaultsDelegate:v6];
  return v16;
}

+ (id)createOptionsViewControllerWithContext:(id)a3 delegate:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Create options view with context:%@", (uint8_t *)&v16, 0xCu);
  }

  v8 = [ObjectManipulationViewController alloc];
  int v9 = [v5 customizationGroups];
  id v10 = [(ObjectManipulationViewController *)v8 initWithCustomizationGroups:v9];

  [(ObjectManipulationViewController *)v10 setRefreshDelegate:v6];
  uint64_t v11 = [v5 itemPreviewViewController];
  [(ObjectManipulationViewController *)v10 setItemPreviewViewController:v11];

  uint64_t v12 = _ShareSheetBundle();
  uint64_t v13 = [v12 localizedStringForKey:@"Options" value:@"Options" table:@"Localizable"];
  [(ObjectManipulationViewController *)v10 setTitle:v13];

  v14 = v10;
  return v14;
}

+ (id)createCollaborationOptionsViewControllerWithCollaborationOptions:(id)a3 bundleIdentifier:(id)a4 updateHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  id v10 = (void *)getCSSharingOptionsViewControllerClass_softClass;
  uint64_t v33 = getCSSharingOptionsViewControllerClass_softClass;
  if (!getCSSharingOptionsViewControllerClass_softClass)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __getCSSharingOptionsViewControllerClass_block_invoke;
    v29[3] = &unk_1E5A216E8;
    v29[4] = &v30;
    __getCSSharingOptionsViewControllerClass_block_invoke((uint64_t)v29);
    id v10 = (void *)v31[3];
  }
  uint64_t v11 = v10;
  _Block_object_dispose(&v30, 8);
  id v12 = [v11 alloc];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __114__SHSheetFactory_createCollaborationOptionsViewControllerWithCollaborationOptions_bundleIdentifier_updateHandler___block_invoke;
  v27 = &unk_1E5A228A0;
  id v28 = v9;
  id v13 = v9;
  v14 = (void *)[v12 initWithCollaborationSharingOptionsView:v7 userDidChangeOption:&v24];
  uint64_t v15 = objc_msgSend(v14, "navigationItem", v24, v25, v26, v27);
  [v15 _setManualScrollEdgeAppearanceEnabled:1];

  id v16 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v16 configureWithTransparentBackground];
  id v17 = [MEMORY[0x1E4FB1618] separatorColor];
  [v16 setShadowColor:v17];

  uint64_t v18 = [v14 navigationItem];
  [v18 setScrollEdgeAppearance:v16];

  id v19 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v19 configureWithDefaultBackground];
  id v20 = [MEMORY[0x1E4FB1618] separatorColor];
  [v19 setShadowColor:v20];

  uint64_t v21 = [v14 navigationItem];
  [v21 setStandardAppearance:v19];

  v22 = [v14 navigationItem];
  [v22 _setManualScrollEdgeAppearanceProgress:1.0];

  [v14 setHostBundleID:v8];
  return v14;
}

uint64_t __114__SHSheetFactory_createCollaborationOptionsViewControllerWithCollaborationOptions_bundleIdentifier_updateHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)createCollaborationParticipantsViewControllerWithContext:(id)a3 request:(id)a4 delegate:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 fileOrFolderURL];
    id v12 = [v7 confirmButtonText];
    id v13 = [v8 options];
    v14 = [v8 setupInfo];
    uint64_t v15 = [v8 share];
    *(_DWORD *)long long buf = 138413314;
    uint64_t v30 = v11;
    __int16 v31 = 2112;
    uint64_t v32 = v12;
    __int16 v33 = 2112;
    v34 = v13;
    __int16 v35 = 2112;
    v36 = v14;
    __int16 v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "Showing add participants view with file URL %@, primary button text %@, options %@, container setup info %@ and share %@", buf, 0x34u);
  }
  if ([getCSAddParticipantsViewControllerClass() instancesRespondToSelector:sel_initWithCKShare_containerSetupInfo_fileURL_collaborationOptionsGroups_headerImageData_headerTitle_loadingText_supplementaryText_primaryButtonText_secondaryButtonText_])
  {
    id v28 = objc_alloc((Class)getCSAddParticipantsViewControllerClass());
    v27 = [v8 share];
    id v16 = [v8 setupInfo];
    id v17 = [v8 fileOrFolderURL];
    uint64_t v18 = [v8 options];
    id v19 = [v7 headerTitle];
    id v20 = [v7 loadingText];
    [v7 confirmButtonText];
    id v21 = v7;
    v23 = id v22 = v9;
    uint64_t v24 = (void *)[v28 initWithCKShare:v27 containerSetupInfo:v16 fileURL:v17 collaborationOptionsGroups:v18 headerImageData:0 headerTitle:v19 loadingText:v20 supplementaryText:0 primaryButtonText:v23 secondaryButtonText:0];

    id v9 = v22;
    id v7 = v21;

    [v24 setDelegate:v9];
  }
  else
  {
    uint64_t v25 = share_sheet_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[SHSheetFactory createCollaborationParticipantsViewControllerWithContext:request:delegate:](v25);
    }

    uint64_t v24 = 0;
  }

  return v24;
}

+ (void)createCollaborationParticipantsViewControllerWithContext:(os_log_t)log request:delegate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "API for CSAddParticipantsViewController is outdated", v1, 2u);
}

@end