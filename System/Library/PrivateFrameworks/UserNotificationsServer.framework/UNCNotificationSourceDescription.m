@interface UNCNotificationSourceDescription
@end

@implementation UNCNotificationSourceDescription

id __78__UNCNotificationSourceDescription_Factory__setDefaultTopicsFromArray_bundle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNTopicIdentifier", objc_opt_class());
  v5 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNTopicDisplayName", objc_opt_class());
  v6 = [*(id *)(a1 + 32) localizedInfoDictionary];
  v7 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", v5, objc_opt_class());
  v8 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNTopicDefaultSettings", objc_opt_class());

  v9 = [MEMORY[0x263F84280] notificationSourceSettingsDescriptionFromDictionary:v8];
  id v10 = objc_alloc_init(MEMORY[0x263F84290]);
  [v10 setIdentifier:v4];
  [v10 setDisplayName:v7];
  objc_msgSend(v10, "setSupportsAlerts:", objc_msgSend(v9, "supportsAlerts"));
  objc_msgSend(v10, "setSupportsBadges:", objc_msgSend(v9, "supportsBadges"));
  objc_msgSend(v10, "setSupportsSounds:", objc_msgSend(v9, "supportsSounds"));
  objc_msgSend(v10, "setSupportsLockScreen:", objc_msgSend(v9, "supportsLockScreen"));
  objc_msgSend(v10, "setSupportsNotificationCenter:", objc_msgSend(v9, "supportsNotificationCenter"));
  objc_msgSend(v10, "setSupportsCarPlay:", objc_msgSend(v9, "supportsCarPlay"));
  objc_msgSend(v10, "setEnablesAlerts:", objc_msgSend(v9, "supportsAlerts"));
  objc_msgSend(v10, "setEnablesBadges:", objc_msgSend(v9, "supportsBadges"));
  objc_msgSend(v10, "setEnablesSounds:", objc_msgSend(v9, "supportsSounds"));
  objc_msgSend(v10, "setEnablesLockScreen:", objc_msgSend(v9, "supportsLockScreen"));
  objc_msgSend(v10, "setEnablesNotificationCenter:", objc_msgSend(v9, "supportsNotificationCenter"));
  objc_msgSend(v10, "setEnablesCarPlay:", objc_msgSend(v9, "supportsCarPlay"));
  objc_msgSend(v10, "setModalAlertStyle:", objc_msgSend(v9, "modalAlertStyle"));
  objc_msgSend(v10, "setSupportsTimeSensitive:", objc_msgSend(v9, "supportsTimeSensitive"));

  return v10;
}

id __70__UNCNotificationSourceDescription_Factory__systemSourceDirectoryURLs__block_invoke(uint64_t a1, void *a2)
{
  v8[4] = *MEMORY[0x263EF8340];
  v2 = NSURL;
  id v3 = a2;
  v4 = BSSystemRootDirectory();
  v8[0] = v4;
  v8[1] = v3;
  v8[2] = @"UserNotifications";
  v8[3] = @"Bundles";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];
  v6 = [v2 fileURLWithPathComponents:v5];

  return v6;
}

id __82__UNCNotificationSourceDescription_Factory__setDefaultCategoriesFromArray_bundle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v64 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNCategoryIdentifier", objc_opt_class());
  v4 = [*(id *)(a1 + 32) localizedInfoDictionary];
  v61 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNCategoryHiddenPreviewsBodyPlaceholder", objc_opt_class());
  v60 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v61, objc_opt_class());
  v59 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNCategorySummaryFormat", objc_opt_class());
  v58 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v59, objc_opt_class());
  v57 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNCategoryBackgroundStyle", objc_opt_class());
  v56 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNCategoryListPriority", objc_opt_class());
  v55 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNCategoryIntentIdentifiers", objc_opt_class());
  v62 = v3;
  v5 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNCategoryActions", objc_opt_class());
  v72 = [MEMORY[0x263EFF980] array];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id obj = v5;
  v73 = v4;
  uint64_t v74 = [obj countByEnumeratingWithState:&v96 objects:v106 count:16];
  if (v74)
  {
    uint64_t v68 = *MEMORY[0x263F84378];
    uint64_t v70 = *(void *)v97;
    uint64_t v66 = *MEMORY[0x263F84370];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v97 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v78 = v6;
        v7 = *(void **)(*((void *)&v96 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionIdentifier", objc_opt_class());
        uint64_t v9 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionTitle", objc_opt_class());
        uint64_t v10 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v9, objc_opt_class());
        v11 = (void *)v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 0;
        }
        if (v12)
        {
          v13 = *MEMORY[0x263F1E000];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E000], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v101 = v64;
            __int16 v102 = 2114;
            uint64_t v103 = v8;
            __int16 v104 = 2114;
            uint64_t v105 = v9;
            _os_log_error_impl(&dword_22289A000, v13, OS_LOG_TYPE_ERROR, "Error: Category (%{public}@) has an action (%{public}@) whose title key (%{public}@) is mapped to a missing localized string.", buf, 0x20u);
          }
        }
        v90 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionTextInputButtonTitle", objc_opt_class());
        v88 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v90, objc_opt_class());
        v86 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionTextInputPlaceholder", objc_opt_class());
        v14 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v86, objc_opt_class());
        uint64_t v15 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionSystemIconName", objc_opt_class());
        v82 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionTemplateIconName", objc_opt_class());
        uint64_t v16 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionURL", objc_opt_class());
        v92 = (void *)v9;
        v94 = (void *)v8;
        v84 = (void *)v15;
        v80 = (void *)v16;
        if (v16)
        {
          v17 = [NSURL URLWithString:v16];
        }
        else
        {
          v17 = 0;
        }
        v18 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionAuthenticationRequired", objc_opt_class());
        uint64_t v19 = objc_msgSend(v18, "un_safeBoolValue");

        v20 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionDestructive", objc_opt_class());
        unsigned int v76 = objc_msgSend(v20, "un_safeBoolValue");

        v21 = [v7 objectForKey:@"UNActionForeground"];
        if (v21)
        {
          v22 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionForeground", objc_opt_class());
          uint64_t v23 = objc_msgSend(v22, "un_safeBoolValue");
        }
        else
        {
          uint64_t v23 = v17 != 0;
        }

        v24 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionPreventNotificationDismissal", objc_opt_class());
        uint64_t v25 = objc_msgSend(v24, "un_safeBoolValue");

        v26 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNActionTextInput", objc_opt_class());
        LODWORD(v24) = objc_msgSend(v26, "un_safeBoolValue");

        id v27 = objc_alloc_init(MEMORY[0x263F84230]);
        [v27 setIdentifier:v94];
        [v27 setTitle:v11];
        [v27 setTextInputButtonTitle:v88];
        [v27 setTextInputPlaceholder:v14];
        [v27 setUrl:v17];
        [v27 setAuthenticationRequired:v19];
        [v27 setDestructive:v76];
        [v27 setForeground:v23];
        [v27 setShouldPreventNotificationDismiss:v25];
        if (v24) {
          uint64_t v28 = v68;
        }
        else {
          uint64_t v28 = v66;
        }
        [v27 setActionType:v28];
        if (v84) {
          v29 = v84;
        }
        else {
          v29 = v82;
        }
        [v27 setHasSystemIcon:v84 != 0];
        [v27 setIconImageName:v29];
        [v72 addObject:v27];

        uint64_t v6 = v78 + 1;
        v4 = v73;
      }
      while (v74 != v78 + 1);
      uint64_t v74 = [obj countByEnumeratingWithState:&v96 objects:v106 count:16];
    }
    while (v74);
  }

  v30 = [v62 objectForKey:@"UNCategoryAllowInCarPlay"];
  unsigned int v95 = objc_msgSend(v30, "un_safeBoolValue");

  v31 = [v62 objectForKey:@"UNCategoryCustomDismissAction"];
  unsigned int v93 = objc_msgSend(v31, "un_safeBoolValue");

  v32 = [v62 objectForKey:@"UNCategoryFollowActivityAction"];
  unsigned int v91 = objc_msgSend(v32, "un_safeBoolValue");

  v33 = [v62 objectForKey:@"UNCategoryCustomSilenceAction"];
  unsigned int v89 = objc_msgSend(v33, "un_safeBoolValue");

  v34 = [v62 objectForKey:@"UNCategoryHiddenPreviewsShowSubtitle"];
  unsigned int v87 = objc_msgSend(v34, "un_safeBoolValue");

  v35 = [v62 objectForKey:@"UNCategoryHiddenPreviewsShowTitle"];
  unsigned int v85 = objc_msgSend(v35, "un_safeBoolValue");

  v36 = [v62 objectForKey:@"UNCategoryPresentFullScreenAlertOverList"];
  unsigned int v83 = objc_msgSend(v36, "un_safeBoolValue");

  v37 = [v62 objectForKey:@"UNCategoryPreventAutomaticLock"];
  unsigned int v81 = objc_msgSend(v37, "un_safeBoolValue");

  v38 = [v62 objectForKey:@"UNCategoryPreventAutomaticRemovalFromRecents"];
  unsigned int v79 = objc_msgSend(v38, "un_safeBoolValue");

  v39 = [v62 objectForKey:@"UNCategoryPreventDismissWhenClosed"];
  unsigned int v77 = objc_msgSend(v39, "un_safeBoolValue");

  v40 = [v62 objectForKey:@"UNCategoryRevealAdditionalContentWhenPresented"];
  unsigned int v75 = objc_msgSend(v40, "un_safeBoolValue");

  v41 = [v62 objectForKey:@"UNCategoryAllowActionsInCarPlay"];
  unsigned int v71 = objc_msgSend(v41, "un_safeBoolValue");

  v42 = [v62 objectForKey:@"UNCategoryAllowPersistentBannersInCarPlay"];
  unsigned int v69 = objc_msgSend(v42, "un_safeBoolValue");

  v43 = [v62 objectForKey:@"UNCategoryPlayMediaWhenRaised"];
  unsigned int v67 = objc_msgSend(v43, "un_safeBoolValue");

  v44 = [v62 objectForKey:@"UNCategoryPreventClearFromList"];
  unsigned int v63 = objc_msgSend(v44, "un_safeBoolValue");

  v45 = [v62 objectForKey:@"UNCategoryAlwaysDisplayNotificationsIndicator"];
  unsigned int v54 = objc_msgSend(v45, "un_safeBoolValue");

  v46 = [v62 objectForKey:@"UNCategorySuppressDelayForForwardedNotifications"];
  unsigned int v53 = objc_msgSend(v46, "un_safeBoolValue");

  v47 = [v62 objectForKey:@"UNCategorySuppressDismissActionInCarPlay"];
  unsigned int v52 = objc_msgSend(v47, "un_safeBoolValue");

  v48 = [v62 objectForKey:@"UNCategorySuppressPresentationInAmbient"];
  uint64_t v49 = objc_msgSend(v48, "un_safeBoolValue");

  id v50 = objc_alloc_init(MEMORY[0x263F84238]);
  [v50 setIdentifier:v64];
  [v50 setPrivateBody:v60];
  [v50 setSummaryFormat:v58];
  [v50 setBackgroundStyle:v57];
  [v50 setListPriority:v56];
  [v50 setActions:v72];
  [v50 setShouldAllowInCarPlay:v95];
  [v50 setHasCustomDismissAction:v93];
  [v50 setHasFollowActivityAction:v91];
  [v50 setHasCustomSilenceAction:v89];
  [v50 setIntentIdentifiers:v55];
  [v50 setPrivacyOptionShowSubtitle:v87];
  [v50 setPrivacyOptionShowTitle:v85];
  [v50 setPresentFullScreenAlertOverList:v83];
  [v50 setPreventAutomaticLock:v81];
  [v50 setPreventAutomaticRemovalFromRecent:v79];
  [v50 setPreventDismissWhenClosed:v77];
  [v50 setRevealAdditionalContentWhenPresented:v75];
  [v50 setShouldAllowActionsInCarPlay:v71];
  [v50 setShouldAllowPersistentBannersInCarPlay:v69];
  [v50 setPlayMediaWhenRaised:v67];
  [v50 setPreventClearFromList:v63];
  [v50 setAlwaysDisplayNotificationsIndicator:v54];
  [v50 setSuppressDelayForForwardedNotifications:v53];
  [v50 setSuppressDismissActionInCarPlay:v52];
  [v50 setSuppressPresentationInAmbient:v49];

  return v50;
}

@end