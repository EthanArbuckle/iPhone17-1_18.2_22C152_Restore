@interface SBHIconApplicationShortcutListComposer
+ (BOOL)sbh_isDestructiveShortcutItem:(id)a3;
+ (BOOL)sbh_isShortcutItemDeleteOrRemove:(id)a3;
+ (BOOL)sbh_isShortcutItemSpringBoardOnly:(id)a3;
+ (BOOL)supportsMultiwindowShortcut;
+ (BOOL)supportsProtectedAppsShortcuts;
+ (id)composedShortcutsForApplicationWithBundleIdentifier:(id)a3 iconDisplayName:(id)a4 staticItems:(id)a5 dynamicItems:(id)a6 applicationItemID:(unint64_t)a7 numberOfDisplayItemsInSwitcher:(int64_t)a8 supportsMultipleWindows:(BOOL)a9 isSystemApplication:(BOOL)a10 isInternalApplication:(BOOL)a11 isApplicationInBeta:(BOOL)a12 isApplicationHidden:(BOOL)a13 iconManagerAllowsEditing:(BOOL)a14 removeStyle:(int64_t)a15;
+ (id)composedShortcutsForBookmarkIcon:(id)a3 withDisplayName:(id)a4 iconManagerAllowsEditing:(BOOL)a5 removeStyle:(int64_t)a6;
+ (id)composedShortcutsForDownloadingApplicationWithBundleIdentifier:(id)a3 iconDisplayName:(id)a4 applicationItemID:(unint64_t)a5 canModifyDownloadState:(BOOL)a6 prioritizationIsAvailable:(BOOL)a7 downloadingInformationAgent:(id)a8 iconManagerAllowsEditing:(BOOL)a9 removeStyle:(int64_t)a10 canShare:(BOOL)a11;
+ (id)composedShortcutsForFolderIcon:(id)a3 iconImageCache:(id)a4 iconManagerAllowsEditing:(BOOL)a5 removeStyle:(int64_t)a6 badgeViewGenerator:(id)a7;
+ (id)composedShortcutsForWidgetIcon:(id)a3 additionalApplicationShortcutItems:(id)a4 widgetIconSupportsConfiguration:(BOOL)a5 iconManagerAllowsEditing:(BOOL)a6 widgetSettings:(id)a7;
+ (id)filteredApplicationShortcutItemsWithStaticApplicationShortcutItems:(id)a3 dynamicApplicationShortcutItems:(id)a4;
+ (id)homeScreenDefaults;
+ (unint64_t)sbh_shortcutSectionForItem:(id)a3;
@end

@implementation SBHIconApplicationShortcutListComposer

+ (BOOL)sbh_isShortcutItemSpringBoardOnly:(id)a3
{
  uint64_t v3 = sbh_isShortcutItemSpringBoardOnly__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&sbh_isShortcutItemSpringBoardOnly__onceToken, &__block_literal_global_264);
  }
  v5 = [v4 type];

  char v6 = [(id)sbh_isShortcutItemSpringBoardOnly__springBoardOnlyShortcutTypes containsObject:v5];
  return v6;
}

+ (id)homeScreenDefaults
{
  if (homeScreenDefaults_onceToken != -1) {
    dispatch_once(&homeScreenDefaults_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)homeScreenDefaults_homeScreenDefaults;
  return v2;
}

void __60__SBHIconApplicationShortcutListComposer_homeScreenDefaults__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FA60A0]);
  v1 = (void *)homeScreenDefaults_homeScreenDefaults;
  homeScreenDefaults_homeScreenDefaults = (uint64_t)v0;
}

+ (id)filteredApplicationShortcutItemsWithStaticApplicationShortcutItems:(id)a3 dynamicApplicationShortcutItems:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    v5 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v6 = a4;
    id v7 = a3;
    id v8 = objc_alloc_init(v5);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __141__SBHIconApplicationShortcutListComposer_filteredApplicationShortcutItemsWithStaticApplicationShortcutItems_dynamicApplicationShortcutItems___block_invoke;
    aBlock[3] = &unk_1E6AAE1D8;
    id v9 = v8;
    id v14 = v9;
    v10 = (void (**)(void *, id))_Block_copy(aBlock);
    v10[2](v10, v7);

    v10[2](v10, v6);
    if ([v9 count])
    {
      v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v9];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

void __141__SBHIconApplicationShortcutListComposer_filteredApplicationShortcutItemsWithStaticApplicationShortcutItems_dynamicApplicationShortcutItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] <= 3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "localizedTitle", (void)v12);
        uint64_t v11 = [v10 length];

        if (v11) {
          [*(id *)(a1 + 32) addObject:v9];
        }
        if ([*(id *)(a1 + 32) count] == 4) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

+ (BOOL)supportsMultiwindowShortcut
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

+ (BOOL)supportsProtectedAppsShortcuts
{
  char v2 = _os_feature_enabled_impl();
  uint64_t v3 = [MEMORY[0x1E4F4F6A8] tokenForCurrentProcess];
  int v4 = [v3 hasEntitlement:@"com.apple.appprotectiond.read.access"];
  if (v4)
  {
    int v4 = [v3 hasEntitlement:@"com.apple.appprotectiond.write.access"];
    if (v4) {
      LOBYTE(v4) = [v3 hasEntitlement:@"com.apple.appprotectiond.guard.access"];
    }
  }
  char v5 = v2 & v4;

  return v5;
}

+ (id)composedShortcutsForApplicationWithBundleIdentifier:(id)a3 iconDisplayName:(id)a4 staticItems:(id)a5 dynamicItems:(id)a6 applicationItemID:(unint64_t)a7 numberOfDisplayItemsInSwitcher:(int64_t)a8 supportsMultipleWindows:(BOOL)a9 isSystemApplication:(BOOL)a10 isInternalApplication:(BOOL)a11 isApplicationInBeta:(BOOL)a12 isApplicationHidden:(BOOL)a13 iconManagerAllowsEditing:(BOOL)a14 removeStyle:(int64_t)a15
{
  BOOL v20 = a11;
  BOOL v21 = a10;
  v64[1] = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v61 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v60 = v22;
  v25 = [(id)objc_opt_class() filteredApplicationShortcutItemsWithStaticApplicationShortcutItems:v22 dynamicApplicationShortcutItems:v23];
  [v24 addObjectsFromArray:v25];

  if (a14)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
    [v26 setType:@"com.apple.springboardhome.application-shortcut-item.change-widget-size"];
    [v24 addObject:v26];
  }
  if (!os_variant_has_internal_content()) {
    goto LABEL_12;
  }
  if (composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle__onceToken != -1) {
    dispatch_once(&composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle__onceToken, &__block_literal_global_135);
  }
  if ([(id)composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle__homeScreenDefaults shouldFudgeShortcutsToCauseMaximumPain])
  {
    if (!a7) {
      a7 = 10000;
    }
    if ((unint64_t)[v24 count] <= 3)
    {
      do
      {
        id v27 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
        v28 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithType:18];
        [v27 setIcon:v28];

        [v27 setLocalizedTitle:@"QA TEST"];
        [v27 setType:@"com.apple.springboardhome.application-shortcut-item.cancel-download"];
        [v24 addObject:v27];
      }
      while ((unint64_t)[v24 count] < 4);
    }
    BOOL v21 = 0;
    BOOL v20 = 0;
    a12 = 0;
  }
  else
  {
LABEL_12:
    if (!a9) {
      goto LABEL_16;
    }
  }
  int v29 = [(id)objc_opt_class() supportsMultiwindowShortcut];
  if (a8 >= 1 && v29)
  {
    v30 = SBHBundle();
    v31 = [v30 localizedStringForKey:@"SHOW_ALL_WINDOWS_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    id v32 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
    v33 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"rectangle.grid.2x2"];
    [v32 setIcon:v33];

    [v32 setLocalizedTitle:v31];
    [v32 setType:@"com.apple.springboardhome.application-shortcut-item.show-all-windows"];
    [v24 addObject:v32];
  }
LABEL_16:
  if (a14)
  {
    v34 = SBHBundle();
    v35 = [v34 localizedStringForKey:@"REARRANGE_ICONS_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    v36 = _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(v35);
    [v24 addObject:v36];
  }
  if (a13)
  {
    id v37 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
    v38 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"plus.app"];
    [v37 setIcon:v38];

    v39 = SBHBundle();
    v40 = [v39 localizedStringForKey:@"ADD_TO_HOMESCREEN_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [v37 setLocalizedTitle:v40];

    [v37 setType:@"com.apple.springboardhome.application-shortcut-item.add-to-home-screen"];
    [v24 addObject:v37];
  }
  if (a7) {
    int v41 = v20;
  }
  else {
    int v41 = 1;
  }
  if (((v21 | v41) & 1) == 0)
  {
    if (a12)
    {
      id v42 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
      [v42 setActivationMode:0];
      [v42 setBundleIdentifierToLaunch:@"com.apple.TestFlight"];
      v43 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"square.and.pencil"];
      [v42 setIcon:v43];

      v44 = SBHBundle();
      v45 = [v44 localizedStringForKey:@"SEND_BETA_FEEDBACK_APPLICATION_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      [v42 setLocalizedTitle:v45];

      [v42 setType:*MEMORY[0x1E4FA7700]];
      uint64_t v63 = *MEMORY[0x1E4FA7708];
      v46 = [NSNumber numberWithUnsignedInteger:a7];
      v64[0] = v46;
      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
      [v42 setUserInfo:v47];

      [v24 addObject:v42];
    }
    else
    {
      v48 = NSString;
      SBHBundle();
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      v49 = [v42 localizedStringForKey:@"SHARE_APPLICATION_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      v50 = objc_msgSend(v48, "localizedStringWithFormat:", v49, v61);
      v51 = [NSNumber numberWithUnsignedInteger:a7];
      v52 = _SBCreateShareApplicationShortcutItemWithLocalizedTitle(v50, v51);
      [v24 addObject:v52];
    }
  }
  if ([(id)objc_opt_class() supportsProtectedAppsShortcuts])
  {
    v53 = _SBCreateAppProtectionApplicationShortcutItemForBundleIdentifier((uint64_t)v62);
    if (v53) {
      [v24 addObject:v53];
    }
  }
  switch(a15)
  {
    case 1:
      v54 = SBHBundle();
      v55 = [v54 localizedStringForKey:@"HIDE_APP_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      uint64_t v56 = _SBCreateHideAppSuggestionApplicationShortcutItemWithLocalizedTitle(v55);
      break;
    case 2:
      v54 = SBHBundle();
      v55 = [v54 localizedStringForKey:@"REMOVE_APP_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      uint64_t v56 = _SBCreateRemoveAppApplicationShortcutItemWithLocalizedTitle(v55);
      break;
    case 3:
      v54 = SBHBundle();
      v55 = [v54 localizedStringForKey:@"DELETE_APP_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      uint64_t v56 = _SBCreateDeleteAppApplicationShortcutItemWithLocalizedTitle(v55);
      break;
    default:
      goto LABEL_39;
  }
  v57 = (void *)v56;
  [v24 addObject:v56];

LABEL_39:
  return v24;
}

void __327__SBHIconApplicationShortcutListComposer_composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FA60A0]);
  v1 = (void *)composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle__homeScreenDefaults;
  composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle__homeScreenDefaults = (uint64_t)v0;
}

+ (id)composedShortcutsForBookmarkIcon:(id)a3 withDisplayName:(id)a4 iconManagerAllowsEditing:(BOOL)a5 removeStyle:(int64_t)a6
{
  BOOL v7 = a5;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    v10 = SBHBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"REARRANGE_ICONS_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    long long v12 = _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(v11);
    [v9 addObject:v12];
  }
  if ([v8 displaysShareBookmarkShortcutItem])
  {
    int v13 = [v8 isAppClipIcon];
    long long v14 = SBHBundle();
    long long v15 = v14;
    if (v13)
    {
      v16 = @"SHARE_APPCLIP_APPLICATION_SHORTCUT_ITEM_TITLE";
      uint64_t v17 = @"SpringBoardHome-AppClips";
    }
    else
    {
      v16 = @"SHARE_BOOKMARK_APPLICATION_SHORTCUT_ITEM_TITLE";
      uint64_t v17 = @"SpringBoardHome";
    }
    v18 = [v14 localizedStringForKey:v16 value:&stru_1F2FA0300 table:v17];

    v19 = _SBCreateShareApplicationShortcutItemWithLocalizedTitle(v18, 0);
    [v9 addObject:v19];
  }
  if ([v8 displaysAppStoreURLShortcutItem])
  {
    BOOL v20 = [v8 appClip];
    BOOL v21 = [v20 fullAppStoreURL];

    if (v21)
    {
      id v22 = SBHBundle();
      id v23 = [v22 localizedStringForKey:@"APPSTORE_URL_APPCLIP" value:&stru_1F2FA0300 table:@"SpringBoardHome-AppClips"];

      id v24 = (objc_class *)MEMORY[0x1E4FA69D0];
      id v25 = v23;
      id v26 = v21;
      id v27 = objc_alloc_init(v24);
      v28 = (void *)[objc_alloc(MEMORY[0x1E4FA69F0]) initWithSystemImageName:@"appstore"];
      [v27 setIcon:v28];

      [v27 setType:@"com.apple.springboardhome.application-shortcut-item.appStoreLink"];
      [v27 setLocalizedTitle:v25];

      v52 = kSBHIconAppStoreURLUserInfoKey;
      int v29 = [v26 absoluteString];

      v53[0] = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
      [v27 setUserInfo:v30];

      [v9 addObject:v27];
    }
  }
  if (a6 == 1)
  {
    v36 = [v8 webClip];
    int v37 = [v36 isAppClip];

    v38 = SBHBundle();
    v39 = v38;
    if (v37)
    {
      v40 = @"HIDE_APPCLIP_SHORTCUT_ITEM_TITLE";
      int v41 = @"SpringBoardHome-AppClips";
    }
    else
    {
      v40 = @"HIDE_BOOKMARK_SHORTCUT_ITEM_TITLE";
      int v41 = @"SpringBoardHome";
    }
    v33 = [v38 localizedStringForKey:v40 value:&stru_1F2FA0300 table:v41];

    uint64_t v48 = _SBCreateHideAppSuggestionApplicationShortcutItemWithLocalizedTitle(v33);
    goto LABEL_24;
  }
  if (a6 == 2)
  {
    id v42 = [v8 webClip];
    int v43 = [v42 isAppClip];

    v44 = SBHBundle();
    v45 = v44;
    if (v43)
    {
      v46 = @"HIDE_APPCLIP_SHORTCUT_ITEM_TITLE";
      v47 = @"SpringBoardHome-AppClips";
    }
    else
    {
      v46 = @"REMOVE_BOOKMARK_SHORTCUT_ITEM_TITLE";
      v47 = @"SpringBoardHome";
    }
    v33 = [v44 localizedStringForKey:v46 value:&stru_1F2FA0300 table:v47];

    uint64_t v48 = _SBCreateRemoveAppApplicationShortcutItemWithLocalizedTitle(v33);
LABEL_24:
    v49 = (void *)v48;
    [v9 addObject:v48];
    goto LABEL_27;
  }
  if (a6 != 3) {
    goto LABEL_28;
  }
  int v31 = [v8 isAppClipIcon];
  id v32 = SBHBundle();
  v33 = v32;
  if (v31)
  {
    v34 = @"DELETE_APPCLIP_SHORTCUT_ITEM_TITLE";
    v35 = @"SpringBoardHome-AppClips";
  }
  else
  {
    v34 = @"DELETE_BOOKMARK_SHORTCUT_ITEM_TITLE";
    v35 = @"SpringBoardHome";
  }
  v49 = [v32 localizedStringForKey:v34 value:&stru_1F2FA0300 table:v35];
  v50 = _SBCreateDeleteAppApplicationShortcutItemWithLocalizedTitle(v49);
  [v9 addObject:v50];

LABEL_27:
LABEL_28:

  return v9;
}

+ (id)composedShortcutsForDownloadingApplicationWithBundleIdentifier:(id)a3 iconDisplayName:(id)a4 applicationItemID:(unint64_t)a5 canModifyDownloadState:(BOOL)a6 prioritizationIsAvailable:(BOOL)a7 downloadingInformationAgent:(id)a8 iconManagerAllowsEditing:(BOOL)a9 removeStyle:(int64_t)a10 canShare:(BOOL)a11
{
  BOOL v12 = a7;
  BOOL v13 = a6;
  int64_t v15 = a10;
  BOOL v16 = a9;
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v13 && ((objc_opt_respondsToSelector() & 1) == 0 || ([v19 isCloudDemoted] & 1) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v19 isPrioritizable] && v12)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
      id v22 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithType:33];
      [v21 setIcon:v22];

      id v23 = SBHBundle();
      id v24 = [v23 localizedStringForKey:@"PRIORITIZE_DOWNLOAD_APPLICATION_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      [v21 setLocalizedTitle:v24];

      int64_t v15 = a10;
      [v21 setType:@"com.apple.springboardhome.application-shortcut-item.prioritize-download"];
      [v20 addObject:v21];
    }
    if (objc_opt_respondsToSelector()) {
      int v25 = [v19 isPausable] ^ 1;
    }
    else {
      int v25 = 1;
    }
    if (objc_opt_respondsToSelector()) {
      int v26 = [v19 isPaused];
    }
    else {
      int v26 = 0;
    }
    if (((v25 | v26) & 1) == 0)
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
      id v28 = objc_alloc(MEMORY[0x1E4FA69C8]);
      [MEMORY[0x1E4FB1818] imageNamed:@"PauseDownloadApplicationShortcutItemIcon"];
      id v29 = v18;
      id v30 = v17;
      int v31 = (UIImage *)objc_claimAutoreleasedReturnValue();
      id v32 = UIImagePNGRepresentation(v31);
      v33 = (void *)[v28 initWithImageData:v32 dataType:0 isTemplate:1];
      [v27 setIcon:v33];

      id v17 = v30;
      id v18 = v29;
      v34 = SBHBundle();
      v35 = [v34 localizedStringForKey:@"PAUSE_DOWNLOAD_APPLICATION_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      [v27 setLocalizedTitle:v35];

      int64_t v15 = a10;
      BOOL v16 = a9;
      [v27 setType:@"com.apple.springboardhome.application-shortcut-item.pause-download"];
      [v20 addObject:v27];
    }
    if (((v25 | v26 ^ 1) & 1) == 0)
    {
      id v36 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
      BOOL v37 = v16;
      id v38 = objc_alloc(MEMORY[0x1E4FA69C8]);
      v39 = [MEMORY[0x1E4FB1818] imageNamed:@"ResumeDownloadApplicationShortcutItemIcon"];
      v40 = UIImagePNGRepresentation(v39);
      int v41 = (void *)[v38 initWithImageData:v40 dataType:0 isTemplate:1];
      [v36 setIcon:v41];

      int64_t v15 = a10;
      id v42 = SBHBundle();
      int v43 = [v42 localizedStringForKey:@"RESUME_DOWNLOAD_APPLICATION_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      [v36 setLocalizedTitle:v43];

      BOOL v16 = v37;
      [v36 setType:@"com.apple.springboardhome.application-shortcut-item.resume-download"];
      [v20 addObject:v36];
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v19 isCancelable])
    {
      id v44 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
      BOOL v66 = v16;
      id v45 = objc_alloc(MEMORY[0x1E4FA69C8]);
      v46 = [MEMORY[0x1E4FB1818] imageNamed:@"CancelDownloadApplicationShortcutItemIcon"];
      v47 = UIImagePNGRepresentation(v46);
      uint64_t v48 = (void *)[v45 initWithImageData:v47 dataType:0 isTemplate:1];
      [v44 setIcon:v48];

      int64_t v15 = a10;
      v49 = SBHBundle();
      v50 = [v49 localizedStringForKey:@"CANCEL_DOWNLOAD_APPLICATION_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      [v44 setLocalizedTitle:v50];

      BOOL v16 = v66;
      [v44 setType:@"com.apple.springboardhome.application-shortcut-item.cancel-download"];
      [v20 addObject:v44];
    }
  }
  if (v16)
  {
    v51 = SBHBundle();
    v52 = [v51 localizedStringForKey:@"REARRANGE_ICONS_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    v53 = _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(v52);
    [v20 addObject:v53];
  }
  if (a5 && a11)
  {
    v54 = NSString;
    v55 = SBHBundle();
    uint64_t v56 = [v55 localizedStringForKey:@"SHARE_APPLICATION_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    v57 = objc_msgSend(v54, "localizedStringWithFormat:", v56, v18);

    v58 = [NSNumber numberWithUnsignedInteger:a5];
    v59 = _SBCreateShareApplicationShortcutItemWithLocalizedTitle(v57, v58);
    [v20 addObject:v59];
  }
  if ([(id)objc_opt_class() supportsProtectedAppsShortcuts])
  {
    v60 = _SBCreateAppProtectionApplicationShortcutItemForBundleIdentifier((uint64_t)v17);
    if (v60) {
      [v20 addObject:v60];
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v19 isCloudDemoted])
  {
    if (v15 == 2)
    {
      id v61 = SBHBundle();
      id v62 = [v61 localizedStringForKey:@"REMOVE_APP_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      uint64_t v63 = _SBCreateRemoveAppApplicationShortcutItemWithLocalizedTitle(v62);
    }
    else
    {
      if (v15 != 3) {
        goto LABEL_37;
      }
      id v61 = SBHBundle();
      id v62 = [v61 localizedStringForKey:@"DELETE_APP_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      uint64_t v63 = _SBCreateDeleteAppApplicationShortcutItemWithLocalizedTitle(v62);
    }
    v64 = (void *)v63;
    [v20 addObject:v63];
  }
LABEL_37:

  return v20;
}

+ (id)composedShortcutsForFolderIcon:(id)a3 iconImageCache:(id)a4 iconManagerAllowsEditing:(BOOL)a5 removeStyle:(int64_t)a6 badgeViewGenerator:(id)a7
{
  BOOL v43 = a5;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v48 = (void (**)(id, void *))a7;
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  double v11 = v10;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v44 = v8;
  BOOL v12 = [v8 leafIconsWithBadgesSortedByImportance];
  BOOL v13 = [v12 reverseObjectEnumerator];

  id obj = v13;
  uint64_t v47 = [v13 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v57;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v57 != v46) {
        objc_enumerationMutation(obj);
      }
      int64_t v15 = *(void **)(*((void *)&v56 + 1) + 8 * v14);
      BOOL v16 = objc_msgSend(v15, "iconImageWithInfo:", v11 * 29.0 / v11, v11 * 29.0 / v11, v11, 0.0);
      id v17 = v48[2](v48, v15);
      id v18 = [(id)objc_opt_class() badgeBackgroundColor];
      id v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v11 * 29.0, v11 * 29.0);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __144__SBHIconApplicationShortcutListComposer_composedShortcutsForFolderIcon_iconImageCache_iconManagerAllowsEditing_removeStyle_badgeViewGenerator___block_invoke;
      v50[3] = &unk_1E6AAE200;
      double v53 = v11 * 29.0;
      double v54 = v11 * 6.0;
      id v51 = v16;
      id v52 = v18;
      double v55 = v11 * 10.0;
      id v20 = v18;
      id v21 = v16;
      id v22 = [v19 imageWithActions:v50];
      id v23 = objc_alloc(MEMORY[0x1E4FA69C8]);
      id v24 = UIImagePNGRepresentation(v22);
      int v25 = (void *)[v23 initWithImageData:v24 dataType:0 isTemplate:0];

      id v26 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
      [v26 setBadgeView:v17];
      id v27 = [v15 applicationBundleID];
      [v26 setBundleIdentifierToLaunch:v27];

      [v26 setIcon:v25];
      id v28 = [v15 displayName];
      [v26 setLocalizedTitle:v28];

      [v26 setType:@"com.apple.springboardhome.application-shortcut-item.unread-notifications"];
      [v49 addObject:v26];
      uint64_t v29 = [v49 count];

      if (v29 == 4) {
        break;
      }
      if (v47 == ++v14)
      {
        uint64_t v47 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (v47) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v43)
  {
    id v30 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
    int v31 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"pencil"];
    [v30 setIcon:v31];

    id v32 = SBHBundle();
    v33 = [v32 localizedStringForKey:@"RENAME_FOLDER_APPLICATION_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [v30 setLocalizedTitle:v33];

    [v30 setType:@"com.apple.springboardhome.application-shortcut-item.rename-folder"];
    [v49 addObject:v30];

    v34 = SBHBundle();
    v35 = [v34 localizedStringForKey:@"REARRANGE_ICONS_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    id v36 = _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(v35);
    [v49 addObject:v36];

    if (a6 == 2)
    {
      id v37 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
      id v38 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"minus.circle"];
      [v37 setIcon:v38];

      v39 = SBHBundle();
      v40 = [v39 localizedStringForKey:@"REMOVE_FOLDER_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      [v37 setLocalizedTitle:v40];

      [v37 setType:@"com.apple.springboardhome.application-shortcut-item.hide-folder"];
      [v49 addObject:v37];
    }
  }

  return v49;
}

void __144__SBHIconApplicationShortcutListComposer_composedShortcutsForFolderIcon_iconImageCache_iconManagerAllowsEditing_removeStyle_badgeViewGenerator___block_invoke(uint64_t a1)
{
  v8.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v8.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  double v2 = *(double *)(a1 + 48);
  v8.size.width = v2;
  v8.size.height = v2;
  CGRect v9 = CGRectInset(v8, *(double *)(a1 + 56) * 0.5, *(double *)(a1 + 56) * 0.5);
  CGRect v10 = CGRectIntegral(v9);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  [*(id *)(a1 + 40) set];
  double v3 = *(double *)(a1 + 64);
  uint64_t v4 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  double v5 = v2 - v3;
  if (v4 == 1) {
    double v5 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v5, 0.0, v3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 fill];
}

+ (id)composedShortcutsForWidgetIcon:(id)a3 additionalApplicationShortcutItems:(id)a4 widgetIconSupportsConfiguration:(BOOL)a5 iconManagerAllowsEditing:(BOOL)a6 widgetSettings:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v8) {
    goto LABEL_28;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
  [v16 setType:@"com.apple.springboardhome.application-shortcut-item.change-widget-size"];
  [v15 addObject:v16];

  if ([v12 isWidgetStackIcon])
  {
    id v17 = [v12 activeDataSource];
    objc_opt_class();
    id v56 = a1;
    if (objc_opt_isKindOfClass())
    {
      if ([v17 suggestionSource] != 1)
      {
LABEL_14:
        if (!v9) {
          goto LABEL_17;
        }
        id v36 = NSString;
        id v37 = SBHBundle();
        id v30 = [v37 localizedStringForKey:@"CONFIGURE_WIDGET_WITH_NAME_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
        int v31 = [v12 displayName];
        id v38 = v36;
        v35 = v37;
        id v32 = objc_msgSend(v38, "stringWithFormat:", v30, v31);
        _SBCreateConfigureWidgetApplicationShortcutItemWithLocalizedTitle(v32);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
        [v15 addObject:v33];

LABEL_17:
        v39 = SBHBundle();
        v40 = [v39 localizedStringForKey:@"EDIT_STACK_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
        int v41 = _SBCreateConfigureStackApplicationShortcutItemWithLocalizedTitle(v40);
        [v15 addObject:v41];

        if (!os_variant_has_internal_content()) {
          goto LABEL_21;
        }
        id v42 = [v56 homeScreenDefaults];
        char v43 = [v42 shouldHideReportWidgetStackRotationQuickAction];

        if (v43) {
          goto LABEL_21;
        }
        id v18 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
        id v44 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"ant.fill"];
        [v18 setIcon:v44];

        [v18 setLocalizedTitle:@"Report Rotation Issue"];
        [v18 setLocalizedSubtitle:@"[Internal]"];
        [v18 setType:@"com.apple.springboardhome.application-shortcut-item.debug-feedback-stack"];
        [v15 addObject:v18];
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      uint64_t v20 = [v17 suggestionSource];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (v20 != 1) {
        goto LABEL_14;
      }
      if (isKindOfClass)
      {
LABEL_12:
        unint64_t v28 = [v12 iconDataSourceCount];
        if (v28 >= [v14 maximumWidgetsInAStack]) {
          goto LABEL_17;
        }
        uint64_t v29 = NSString;
        double v55 = SBHBundle();
        id v30 = [v55 localizedStringForKey:@"ADD_TO_STACK_WITH_NAME_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
        int v31 = [v12 displayName];
        id v32 = objc_msgSend(v29, "stringWithFormat:", v30, v31);
        id v33 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
        v34 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"rectangle.stack.badge.plus"];
        [v33 setIcon:v34];

        v35 = v55;
        [v33 setLocalizedTitle:v32];
        [v33 setType:@"com.apple.springboardhome.application-shortcut-item.add-to-stack"];
        goto LABEL_16;
      }
    }
    id v22 = NSString;
    id v23 = SBHBundle();
    double v54 = [v23 localizedStringForKey:@"HIDE_STACK_SUGGESTION_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    id v24 = [v12 displayName];
    int v25 = objc_msgSend(v22, "stringWithFormat:", v54, v24);
    id v26 = objc_alloc_init(MEMORY[0x1E4FA69D0]);
    id v27 = (void *)[objc_alloc(MEMORY[0x1E4FA69E8]) initWithSystemImageName:@"hand.thumbsdown"];
    [v26 setIcon:v27];

    [v26 setLocalizedTitle:v25];
    [v26 setType:@"com.apple.springboardhome.application-shortcut-item.hide-stack-suggestion"];
    [v15 addObject:v26];

    goto LABEL_12;
  }
  if (v9)
  {
    id v17 = SBHBundle();
    id v18 = [v17 localizedStringForKey:@"CONFIGURE_WIDGET_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    id v19 = _SBCreateConfigureWidgetApplicationShortcutItemWithLocalizedTitle(v18);
    [v15 addObject:v19];

    goto LABEL_20;
  }
LABEL_22:
  if (v13) {
    [v15 addObjectsFromArray:v13];
  }
  id v45 = SBHBundle();
  uint64_t v46 = [v45 localizedStringForKey:@"REARRANGE_ICONS_SHORTCUT_ITEM_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  uint64_t v47 = _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(v46);
  [v15 addObject:v47];

  LODWORD(v45) = [v12 isWidgetStackIcon];
  uint64_t v48 = SBHBundle();
  id v49 = v48;
  if (v45) {
    v50 = @"REMOVE_STACK_SHORTCUT_ITEM_TITLE";
  }
  else {
    v50 = @"REMOVE_WIDGET_SHORTCUT_ITEM_TITLE";
  }
  id v51 = [v48 localizedStringForKey:v50 value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  id v52 = _SBCreateRemoveWidgetApplicationShortcutItemWithLocalizedTitle(v51);
  [v15 addObject:v52];

LABEL_28:
  return v15;
}

+ (unint64_t)sbh_shortcutSectionForItem:(id)a3
{
  id v3 = a3;
  if (sbh_shortcutSectionForItem__systemActionTypesOnceToken != -1) {
    dispatch_once(&sbh_shortcutSectionForItem__systemActionTypesOnceToken, &__block_literal_global_257);
  }
  if (sbh_shortcutSectionForItem__widgetActionTypesOnceToken != -1) {
    dispatch_once(&sbh_shortcutSectionForItem__widgetActionTypesOnceToken, &__block_literal_global_260);
  }
  if (sbh_shortcutSectionForItem__widgetResizeActionTypesOnceToken != -1) {
    dispatch_once(&sbh_shortcutSectionForItem__widgetResizeActionTypesOnceToken, &__block_literal_global_262);
  }
  uint64_t v4 = [v3 type];
  if ([(id)sbh_shortcutSectionForItem__systemActionTypes containsObject:v4])
  {
    unint64_t v5 = 2;
  }
  else if ([(id)sbh_shortcutSectionForItem__widgetActionTypes containsObject:v4])
  {
    unint64_t v5 = 1;
  }
  else if ([(id)sbh_shortcutSectionForItem__widgetResizeActionTypes containsObject:v4])
  {
    unint64_t v5 = 3;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

void __69__SBHIconApplicationShortcutListComposer_sbh_shortcutSectionForItem___block_invoke()
{
  v4[12] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.springboardhome.application-shortcut-item.share";
  v4[1] = @"com.apple.springboardhome.application-shortcut-item.show-all-windows";
  v4[2] = @"com.apple.springboardhome.application-shortcut-item.rearrange-icons";
  v4[3] = @"com.apple.springboardhome.application-shortcut-item.rename-folder";
  v4[4] = @"com.apple.springboardhome.application-shortcut-item.hide-folder";
  v4[5] = @"com.apple.springboardhome.application-shortcut-item.delete-app";
  v4[6] = @"com.apple.springboardhome.application-shortcut-item.remove-app";
  v4[7] = @"com.apple.springboardhome.application-shortcut-item.remove-widget";
  v4[8] = @"com.apple.springboardhome.application-shortcut-item.hide-app-suggestion";
  v4[9] = @"com.apple.springboardhome.application-shortcut-item.add-to-home-screen";
  v4[10] = @"com.apple.springboardhome.application-shortcut-item.appStoreLink";
  v4[11] = @"com.apple.springboardhome.application-shortcut-item.app-protection";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:12];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)sbh_shortcutSectionForItem__systemActionTypes;
  sbh_shortcutSectionForItem__systemActionTypes = v2;
}

void __69__SBHIconApplicationShortcutListComposer_sbh_shortcutSectionForItem___block_invoke_2()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.springboardhome.application-shortcut-item.configure-widget";
  v4[1] = @"com.apple.springboardhome.application-shortcut-item.hide-stack-suggestion";
  v4[2] = @"com.apple.springboardhome.application-shortcut-item.hide-siri-suggestions-item";
  v4[3] = @"com.apple.springboardhome.application-shortcut-item.configure-stack";
  v4[4] = @"com.apple.springboardhome.application-shortcut-item.add-to-stack";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)sbh_shortcutSectionForItem__widgetActionTypes;
  sbh_shortcutSectionForItem__widgetActionTypes = v2;
}

void __69__SBHIconApplicationShortcutListComposer_sbh_shortcutSectionForItem___block_invoke_3()
{
  v4[7] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.springboardhome.application-shortcut-item.change-widget-size";
  v4[1] = @"com.apple.springboardhome.application-shortcut-item.change-widget-size-small";
  v4[2] = @"com.apple.springboardhome.application-shortcut-item.change-widget-size-medium";
  v4[3] = @"com.apple.springboardhome.application-shortcut-item.change-widget-size-large";
  v4[4] = @"com.apple.springboardhome.application-shortcut-item.change-widget-size-extralarge";
  v4[5] = @"com.apple.springboardhome.application-shortcut-item.change-widget-size-newsLargeTall";
  void v4[6] = @"com.apple.springboardhome.application-shortcut-item.change-widget-to-app-icon";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)sbh_shortcutSectionForItem__widgetResizeActionTypes;
  sbh_shortcutSectionForItem__widgetResizeActionTypes = v2;
}

void __76__SBHIconApplicationShortcutListComposer_sbh_isShortcutItemSpringBoardOnly___block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.rearrange-icons"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.hide-app-suggestion"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.delete-app"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.remove-app"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.remove-widget"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.configure-widget"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.configure-stack"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.hide-stack-suggestion"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.hide-siri-suggestions-item"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.add-to-stack"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.change-widget-size"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.change-widget-size-small"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.change-widget-size-medium"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.change-widget-size-large"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.change-widget-size-newsLargeTall"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.change-widget-size-extralarge"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.change-widget-to-app-icon"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)sbh_isShortcutItemSpringBoardOnly__springBoardOnlyShortcutTypes;
  sbh_isShortcutItemSpringBoardOnly__springBoardOnlyShortcutTypes = v0;
}

+ (BOOL)sbh_isDestructiveShortcutItem:(id)a3
{
  uint64_t v3 = sbh_isDestructiveShortcutItem__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&sbh_isDestructiveShortcutItem__onceToken, &__block_literal_global_267);
  }
  unint64_t v5 = [v4 type];

  char v6 = [(id)sbh_isDestructiveShortcutItem__isDestructive containsObject:v5];
  return v6;
}

void __72__SBHIconApplicationShortcutListComposer_sbh_isDestructiveShortcutItem___block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.delete-app"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.remove-app"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.remove-widget"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.hide-folder"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)sbh_isDestructiveShortcutItem__isDestructive;
  sbh_isDestructiveShortcutItem__isDestructive = v0;
}

+ (BOOL)sbh_isShortcutItemDeleteOrRemove:(id)a3
{
  uint64_t v3 = sbh_isShortcutItemDeleteOrRemove__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&sbh_isShortcutItemDeleteOrRemove__onceToken, &__block_literal_global_269);
  }
  unint64_t v5 = [v4 type];

  char v6 = [(id)sbh_isShortcutItemDeleteOrRemove__springBoardOnlyShortcutTypes containsObject:v5];
  return v6;
}

void __75__SBHIconApplicationShortcutListComposer_sbh_isShortcutItemDeleteOrRemove___block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.delete-app"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.remove-app"];
  [v2 addObject:@"com.apple.springboardhome.application-shortcut-item.remove-widget"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)sbh_isShortcutItemDeleteOrRemove__springBoardOnlyShortcutTypes;
  sbh_isShortcutItemDeleteOrRemove__springBoardOnlyShortcutTypes = v0;
}

@end