@interface _UIApplicationInfoParser
+ (id)mainBundleInfoParser;
- (BOOL)_isLinkedOnOrAfterYukon;
- (BOOL)canChangeBackgroundStyle;
- (BOOL)disableLayoutAwareShortcuts;
- (BOOL)fakingRequiresHighResolution;
- (BOOL)focusEnabledInLimitedControls;
- (BOOL)focusSystemEnabled;
- (BOOL)forcesDefaultFocusAppearance;
- (BOOL)hasSupportsIndirectInputEventsKey;
- (BOOL)isExitsOnSuspend;
- (BOOL)observationTrackingEnabled;
- (BOOL)optOutOfRTL;
- (BOOL)requiresGameControllerBasedFocus;
- (BOOL)requiresHighResolution;
- (BOOL)statusBarHidden;
- (BOOL)statusBarHiddenWhenVerticallyCompact;
- (BOOL)supportedOnLockScreen;
- (BOOL)supportsAlwaysOnDisplay;
- (BOOL)supportsBacklightEnvironment;
- (BOOL)supportsIndirectInputEvents;
- (BOOL)supportsMultiwindow;
- (BOOL)supportsPrintCommand;
- (BOOL)supportsSceneItemProviders;
- (BOOL)systemWindowsSecure;
- (NSArray)canvasDefinitions;
- (NSArray)deviceFamilies;
- (NSArray)editorRoleDocumentUTTypes;
- (NSArray)viewerRoleDocumentUTTypes;
- (NSDictionary)sceneConfigurations;
- (NSDictionary)utTypeToDocumentClassMap;
- (NSString)keyColorAssetName;
- (NSString)launchImageFile;
- (NSString)preferredDefaultSceneSessionRole;
- (_UIApplicationInfoParser)initWithApplicationProxy:(id)a3;
- (id)_initWithApplicationPlistData:(id)a3;
- (id)_initWithBundle:(id)a3;
- (int64_t)backgroundStyle;
- (int64_t)interfaceOrientation;
- (int64_t)launchingInterfaceOrientationForSpringBoard;
- (int64_t)requestedStatusBarStyle;
- (int64_t)supportedUserInterfaceStyle;
- (int64_t)whitePointAdaptivityStyle;
- (unint64_t)ignoredOverrides;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)viewControllerBasedStatusBarAppearance;
- (void)_computeSupportedInterfaceOrientationsWithInfo:(id)a3;
- (void)_computeSupportedUserInterfaceStyleFromInfo:(id)a3;
@end

@implementation _UIApplicationInfoParser

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

+ (id)mainBundleInfoParser
{
  if (qword_1EB260860 != -1) {
    dispatch_once(&qword_1EB260860, &__block_literal_global_233);
  }
  v2 = (void *)_MergedGlobals_1058;
  return v2;
}

- (BOOL)requiresGameControllerBasedFocus
{
  return self->_requiresGameControllerBasedFocus;
}

- (BOOL)supportsAlwaysOnDisplay
{
  return self->_supportsAlwaysOnDisplay;
}

- (BOOL)supportsBacklightEnvironment
{
  return self->_supportsBacklightEnvironment;
}

- (BOOL)supportsPrintCommand
{
  return self->_supportsPrintCommand;
}

- (BOOL)fakingRequiresHighResolution
{
  return self->_fakingRequiresHighResolution;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (id)_initWithBundle:(id)a3
{
  v4 = [a3 infoDictionary];
  id v5 = [(_UIApplicationInfoParser *)self _initWithApplicationPlistData:v4];

  return v5;
}

- (void)_computeSupportedInterfaceOrientationsWithInfo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "bs_safeArrayForKey:", @"UISupportedInterfaceOrientations");
  objc_msgSend(v5, "bs_objectsOfClass:", objc_opt_class());
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (_UIDeviceNativeUserInterfaceIdiomIgnoringClassic()) {
    int v7 = 1;
  }
  else {
    int v7 = !+[UIDevice _hasHomeButton];
  }
  if ([v6 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v6;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v6);
          }
          v10 |= 1 << +[UIApplication interfaceOrientationForString:](UIApplication, "interfaceOrientationForString:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v9);

      if (v10 == 4) {
        int v13 = v7;
      }
      else {
        int v13 = 0;
      }
      if (v13 == 1)
      {
        v24 = @"UIInterfaceOrientationPortrait";
        int64_t v14 = 1;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];

        unint64_t v10 = 2;
        id v6 = (id)v15;
LABEL_31:
        v19 = objc_msgSend(v6, "objectAtIndex:", 0, (void)v20);
        int64_t v18 = +[UIApplication interfaceOrientationForString:v19];

        goto LABEL_32;
      }
      if ((v10 & 2) != 0)
      {
        int64_t v14 = 1;
        goto LABEL_31;
      }
      if ((v10 & 0x10) != 0)
      {
        int64_t v14 = 4;
        goto LABEL_31;
      }
      if ((v10 & 8) != 0)
      {
        int64_t v14 = 3;
        goto LABEL_31;
      }
    }
    else
    {

      unint64_t v10 = 0;
    }
    if ((v10 & 4) != 0) {
      int64_t v14 = 2;
    }
    else {
      int64_t v14 = 1;
    }
    goto LABEL_31;
  }
  v16 = objc_msgSend(v4, "bs_safeStringForKey:", @"UIInterfaceOrientation");
  int64_t v17 = +[UIApplication interfaceOrientationForString:v16];
  if ((v7 & (v17 == 2)) != 0) {
    int64_t v18 = 1;
  }
  else {
    int64_t v18 = v17;
  }

  unint64_t v10 = 0;
  int64_t v14 = v18;
LABEL_32:
  self->_launchingInterfaceOrientationForSpringBoard = v18;
  self->_supportedInterfaceOrientations = v10;
  self->_interfaceOrientation = v14;
}

- (id)_initWithApplicationPlistData:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v113.receiver = self;
  v113.super_class = (Class)_UIApplicationInfoParser;
  id v5 = [(_UIApplicationInfoParser *)&v113 init];
  if (!v5) {
    goto LABEL_66;
  }
  id v6 = objc_msgSend(v4, "bs_safeStringForKey:", @"UIStatusBarStyle");
  int64_t v7 = +[UIApplication statusBarStyleForString:v6];

  if (v7 == -1) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = v7;
  }
  v5->_requestedStatusBarStyle = v8;
  uint64_t v9 = objc_msgSend(v4, "bs_safeStringForKey:", @"UIBackgroundStyle");
  v91 = (void *)v9;
  if (v9)
  {
    int64_t v10 = +[UIApplication _backgroundStyleForString:v9];
  }
  else
  {
    uint64_t v11 = objc_msgSend(v4, "bs_safeNumberForKey:", @"UIApplicationIsOpaque");
    v12 = v11;
    if (v11) {
      int64_t v10 = [v11 BOOLValue] ^ 1;
    }
    else {
      int64_t v10 = 0;
    }
  }
  v5->_backgroundStyle = v10;
  v5->_canChangeBackgroundStyle = 0;
  int v13 = objc_msgSend(v4, "bs_safeNumberForKey:", @"UIStatusBarHidden");
  v5->_statusBarHidden = [v13 BOOLValue];

  v5->_statusBarHiddenWhenVerticallyCompact = 1;
  int64_t v14 = objc_msgSend(v4, "bs_safeNumberForKey:", @"UIStatusBarHiddenWhenVerticallyCompact");
  uint64_t v15 = v14;
  if (v14 && ([v14 BOOLValue] & 1) == 0) {
    v5->_statusBarHiddenWhenVerticallyCompact = 0;
  }
  v90 = v15;
  v16 = objc_msgSend(v4, "bs_safeStringForKey:", @"UIWhitePointAdaptivityStyleKey");
  if (v16
    || (objc_msgSend(v4, "bs_safeStringForKey:", @"_UIWhitePointAdaptivityStyle"),
        (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5->_whitePointAdaptivityStyle = _UIWhitePointAdaptivityStyleFromString(v16);
  }
  else
  {
    v5->_whitePointAdaptivityStyle = 0;
  }
  int64_t v17 = [v4 allKeys];
  int v18 = [v17 containsObject:@"UIViewControllerBasedStatusBarAppearance"];

  if (v18)
  {
    int v19 = objc_msgSend(v4, "bs_BOOLForKey:", @"UIViewControllerBasedStatusBarAppearance");
    uint64_t v20 = 1;
    if (!v19) {
      uint64_t v20 = 2;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  v5->_viewControllerBasedStatusBarAppearance = v20;
  v89 = [v4 objectForKey:@"Capabilities"];
  long long v21 = objc_msgSend(v4, "bs_safeArrayForKey:", @"Capabilities");
  uint64_t v22 = *MEMORY[0x1E4F64CE8];
  if ([v21 containsObject:*MEMORY[0x1E4F64CE8]])
  {

LABEL_25:
    v5->_requiresHighResolution = 1;
    goto LABEL_26;
  }
  long long v23 = objc_msgSend(v4, "bs_safeDictionaryForKey:", @"Capabilities");
  v24 = [v23 objectForKey:v22];
  int v25 = [v24 BOOLValue];

  if (v25) {
    goto LABEL_25;
  }
LABEL_26:
  v5->_fakingRequiresHighResolution = 0;
  uint64_t v26 = objc_msgSend(v4, "bs_safeArrayForKey:", @"UIStatusBarStyleIgnoredOverrides");
  v5->_ignoredOverrides = +[UIApplication _statusBarStyleOverridesForArray:v26];

  v5->_systemWindowsSecure = objc_msgSend(v4, "bs_BOOLForKey:", @"UIApplicationSystemWindowsSecureKey");
  v5->_optOutOfRTL = objc_msgSend(v4, "bs_BOOLForKey:", @"UIOptOutOfRTL");
  v5->_disableLayoutAwareShortcuts = objc_msgSend(v4, "bs_BOOLForKey:", @"NSDisableKeyboardLayoutAdjustedShortcuts");
  v27 = objc_msgSend(v4, "bs_safeNumberForKey:", @"UIApplicationExitsOnSuspend");
  v5->_isExitsOnSuspend = [v27 BOOLValue];

  uint64_t v28 = objc_msgSend(v4, "bs_safeStringForKey:", @"UILaunchImageFile");
  launchImageFile = v5->_launchImageFile;
  v5->_launchImageFile = (NSString *)v28;

  uint64_t v30 = objc_msgSend(v4, "bs_safeStringForKey:", @"NSAccentColorName");
  keyColorAssetName = v5->_keyColorAssetName;
  v5->_keyColorAssetName = (NSString *)v30;

  v5->_supportedOnLockScreen = objc_msgSend(v4, "bs_BOOLForKey:", @"UIApplicationShowsViewsWhileLocked");
  v32 = objc_msgSend(v4, "bs_safeDictionaryForKey:", @"UIApplicationInterfaceManifest");
  v5->_supportsMultiwindow = objc_msgSend(v32, "bs_BOOLForKey:", @"UIApplicationSupportsMultiwindow");
  v88 = v32;
  uint64_t v33 = objc_msgSend(v32, "bs_safeArrayForKey:", @"UICanvasDefinitions");
  canvasDefinitions = v5->_canvasDefinitions;
  v5->_canvasDefinitions = (NSArray *)v33;

  v35 = objc_msgSend(v4, "bs_safeDictionaryForKey:", @"UIApplicationSceneManifest");
  uint64_t v36 = objc_msgSend(v35, "bs_safeDictionaryForKey:", @"UISceneConfigurations");
  sceneConfigurations = v5->_sceneConfigurations;
  v5->_sceneConfigurations = (NSDictionary *)v36;

  if (v5->_supportsMultiwindow) {
    char v38 = 1;
  }
  else {
    char v38 = objc_msgSend(v35, "bs_BOOLForKey:", @"UIApplicationSupportsMultipleScenes");
  }
  v5->_supportsMultiwindow = v38;
  uint64_t v39 = objc_msgSend(v35, "bs_safeStringForKey:", @"UIApplicationPreferredDefaultSceneSessionRole");
  preferredDefaultSceneSessionRole = v5->_preferredDefaultSceneSessionRole;
  v5->_preferredDefaultSceneSessionRole = (NSString *)v39;

  v87 = v35;
  v5->_supportsSceneItemProviders = objc_msgSend(v35, "bs_BOOLForKey:", @"UIApplicationSupportsSceneItemProviders");
  v41 = [v4 objectForKey:@"com.apple.uikit.feature-a"];
  v5->_hasSupportsIndirectInputEventsKey = v41 != 0;

  v42 = [v4 objectForKey:@"UIApplicationSupportsIndirectInputEvents"];
  v5->_hasSupportsIndirectInputEventsKey |= v42 != 0;

  v5->_supportsIndirectInputEvents = objc_msgSend(v4, "bs_BOOLForKey:", @"com.apple.uikit.feature-a");
  v5->_supportsIndirectInputEvents |= objc_msgSend(v4, "bs_BOOLForKey:", @"UIApplicationSupportsIndirectInputEvents");
  v43 = objc_msgSend(v4, "bs_safeArrayForKey:", @"UIDeviceFamily");
  v44 = self;
  uint64_t v45 = objc_msgSend(v43, "bs_objectsOfClass:", v44);
  deviceFamilies = v5->_deviceFamilies;
  v5->_deviceFamilies = (NSArray *)v45;

  v5->_supportsPrintCommand = objc_msgSend(v4, "bs_BOOLForKey:", @"UIApplicationSupportsPrintCommand");
  v5->_supportsAlwaysOnDisplay = objc_msgSend(v4, "bs_BOOLForKey:", 0x1ED15C160);
  v5->_supportsBacklightEnvironment = objc_msgSend(v4, "bs_BOOLForKey:", 0x1ED15C180);
  [(_UIApplicationInfoParser *)v5 _computeSupportedInterfaceOrientationsWithInfo:v4];
  [(_UIApplicationInfoParser *)v5 _computeSupportedUserInterfaceStyleFromInfo:v4];
  v5->_requiresGameControllerBasedFocus = objc_msgSend(v4, "bs_BOOLForKey:", @"_UIRequiresGameControllerBasedFocus");
  v5->_focusEnabledInLimitedControls = objc_msgSend(v4, "bs_BOOLForKey:", @"_UIFocusLimitedControlsEnabled");
  v5->_forcesDefaultFocusAppearance = objc_msgSend(v4, "bs_BOOLForKey:", @"_UIFocusDefaultAppearanceEnabled");
  v47 = objc_msgSend(v4, "bs_safeNumberForKey:", @"UIFocusSystemEnabled");
  v85 = v47;
  if (v47) {
    char v48 = objc_msgSend(v47, "BOOLValue", v47);
  }
  else {
    char v48 = 1;
  }
  v5->_focusSystemEnabled = v48;
  v92 = v5;
  v5->_observationTrackingEnabled = objc_msgSend(v4, "bs_BOOLForKey:", @"UIObservationTrackingEnabled", v85);
  v49 = objc_opt_new();
  v94 = objc_opt_new();
  v93 = objc_opt_new();
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  objc_msgSend(v4, "bs_safeArrayForKey:", @"CFBundleDocumentTypes");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = [obj countByEnumeratingWithState:&v109 objects:v118 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v110;
    uint64_t v95 = *(void *)v110;
    do
    {
      uint64_t v53 = 0;
      uint64_t v96 = v51;
      do
      {
        if (*(void *)v110 != v52) {
          objc_enumerationMutation(obj);
        }
        v54 = *(void **)(*((void *)&v109 + 1) + 8 * v53);
        v55 = [v54 objectForKeyedSubscript:@"UIDocumentClass"];
        v56 = v55;
        if (v55)
        {
          Class v57 = NSClassFromString(v55);
          if (v57)
          {
            Class v58 = v57;
            uint64_t v59 = [v54 objectForKeyedSubscript:@"LSItemContentTypes"];
            v60 = (void *)MEMORY[0x1E4F442D8];
            v100 = (void *)v59;
            v61 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
            v62 = [v60 _typesWithIdentifiers:v61];

            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            v99 = v62;
            v63 = [v62 allValues];
            uint64_t v64 = [v63 countByEnumeratingWithState:&v105 objects:v115 count:16];
            if (v64)
            {
              uint64_t v65 = v64;
              uint64_t v66 = *(void *)v106;
              do
              {
                for (uint64_t i = 0; i != v65; ++i)
                {
                  if (*(void *)v106 != v66) {
                    objc_enumerationMutation(v63);
                  }
                  [v49 setObject:v58 forKey:*(void *)(*((void *)&v105 + 1) + 8 * i)];
                }
                uint64_t v65 = [v63 countByEnumeratingWithState:&v105 objects:v115 count:16];
              }
              while (v65);
            }

            v68 = [v54 objectForKeyedSubscript:@"CFBundleTypeRole"];
            int v69 = [v68 isEqualToString:@"Viewer"];
            if ((v69 & 1) != 0 || [v68 isEqualToString:@"Editor"])
            {
              v98 = v68;
              long long v103 = 0u;
              long long v104 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              id v70 = v100;
              uint64_t v71 = [v70 countByEnumeratingWithState:&v101 objects:v114 count:16];
              if (v71)
              {
                uint64_t v72 = v71;
                uint64_t v73 = *(void *)v102;
                if (v69) {
                  v74 = v94;
                }
                else {
                  v74 = v93;
                }
                do
                {
                  for (uint64_t j = 0; j != v72; ++j)
                  {
                    if (*(void *)v102 != v73) {
                      objc_enumerationMutation(v70);
                    }
                    v76 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v101 + 1) + 8 * j)];
                    if (v76) {
                      [v74 addObject:v76];
                    }
                  }
                  uint64_t v72 = [v70 countByEnumeratingWithState:&v101 objects:v114 count:16];
                }
                while (v72);
              }

              v68 = v98;
            }

            uint64_t v52 = v95;
            uint64_t v51 = v96;
          }
          else
          {
            v77 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDocument", &_initWithApplicationPlistData____s_category)+ 8);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v117 = v56;
              _os_log_impl(&dword_1853B0000, v77, OS_LOG_TYPE_ERROR, "Unable to find class %@ which is specified to handle documents in the application's info.plist", buf, 0xCu);
            }
          }
        }

        ++v53;
      }
      while (v53 != v51);
      uint64_t v51 = [obj countByEnumeratingWithState:&v109 objects:v118 count:16];
    }
    while (v51);
  }

  uint64_t v78 = [v49 copy];
  id v5 = v92;
  utTypeToDocumentClassMap = v92->_utTypeToDocumentClassMap;
  v92->_utTypeToDocumentClassMap = (NSDictionary *)v78;

  uint64_t v80 = [v94 array];
  viewerRoleDocumentUTTypes = v92->_viewerRoleDocumentUTTypes;
  v92->_viewerRoleDocumentUTTypes = (NSArray *)v80;

  uint64_t v82 = [v93 array];
  editorRoleDocumentUTTypes = v92->_editorRoleDocumentUTTypes;
  v92->_editorRoleDocumentUTTypes = (NSArray *)v82;

LABEL_66:
  return v5;
}

- (void)_computeSupportedUserInterfaceStyleFromInfo:(id)a3
{
  objc_msgSend(a3, "bs_safeStringForKey:", @"UIUserInterfaceStyle");
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (self->_isYukonLinked) {
      id v5 = @"Automatic";
    }
    else {
      id v5 = @"Light";
    }
    id v4 = v5;
  }
  int64_t v7 = v4;
  if ([(__CFString *)v4 isEqualToString:@"Automatic"])
  {
    self->_supportedUserInterfaceStyle = 0;
  }
  else
  {
    if ([(__CFString *)v7 isEqualToString:@"Dark"]) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 1;
    }
    self->_supportedUserInterfaceStyle = v6;
  }
}

- (NSString)keyColorAssetName
{
  return self->_keyColorAssetName;
}

- (BOOL)supportsMultiwindow
{
  return self->_supportsMultiwindow;
}

- (BOOL)supportedOnLockScreen
{
  return self->_supportedOnLockScreen;
}

- (BOOL)observationTrackingEnabled
{
  return self->_observationTrackingEnabled;
}

- (BOOL)supportsIndirectInputEvents
{
  return self->_supportsIndirectInputEvents;
}

- (BOOL)hasSupportsIndirectInputEventsKey
{
  return self->_hasSupportsIndirectInputEventsKey;
}

- (unint64_t)viewControllerBasedStatusBarAppearance
{
  return self->_viewControllerBasedStatusBarAppearance;
}

- (BOOL)systemWindowsSecure
{
  return self->_systemWindowsSecure;
}

- (BOOL)statusBarHidden
{
  return self->_statusBarHidden;
}

- (BOOL)statusBarHiddenWhenVerticallyCompact
{
  return self->_statusBarHiddenWhenVerticallyCompact;
}

- (int64_t)requestedStatusBarStyle
{
  return self->_requestedStatusBarStyle;
}

- (BOOL)optOutOfRTL
{
  return self->_optOutOfRTL;
}

- (BOOL)isExitsOnSuspend
{
  return self->_isExitsOnSuspend;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (NSDictionary)sceneConfigurations
{
  return self->_sceneConfigurations;
}

- (NSArray)canvasDefinitions
{
  return self->_canvasDefinitions;
}

- (_UIApplicationInfoParser)initWithApplicationProxy:(id)a3
{
  id v4 = a3;
  if (qword_1EB260870 != -1) {
    dispatch_once(&qword_1EB260870, &__block_literal_global_4_7);
  }
  id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v6 = [v4 sdkVersion];
  int64_t v7 = (void *)v6;
  if (v6) {
    LOBYTE(v6) = [v5 isVersion:v6 greaterThanOrEqualToVersion:@"13.0"];
  }
  self->_isYukonLinked = v6;
  int64_t v8 = [v4 objectsForInfoDictionaryKeys:qword_1EB260868];
  uint64_t v9 = [v8 rawValues];
  int64_t v10 = [(_UIApplicationInfoParser *)self _initWithApplicationPlistData:v9];

  return v10;
}

- (BOOL)_isLinkedOnOrAfterYukon
{
  return self->_isYukonLinked;
}

- (int64_t)launchingInterfaceOrientationForSpringBoard
{
  return self->_launchingInterfaceOrientationForSpringBoard;
}

- (unint64_t)ignoredOverrides
{
  return self->_ignoredOverrides;
}

- (NSString)launchImageFile
{
  return self->_launchImageFile;
}

- (BOOL)canChangeBackgroundStyle
{
  return self->_canChangeBackgroundStyle;
}

- (BOOL)disableLayoutAwareShortcuts
{
  return self->_disableLayoutAwareShortcuts;
}

- (BOOL)requiresHighResolution
{
  return self->_requiresHighResolution;
}

- (BOOL)supportsSceneItemProviders
{
  return self->_supportsSceneItemProviders;
}

- (NSString)preferredDefaultSceneSessionRole
{
  return self->_preferredDefaultSceneSessionRole;
}

- (int64_t)supportedUserInterfaceStyle
{
  return self->_supportedUserInterfaceStyle;
}

- (NSArray)deviceFamilies
{
  return self->_deviceFamilies;
}

- (BOOL)focusEnabledInLimitedControls
{
  return self->_focusEnabledInLimitedControls;
}

- (BOOL)forcesDefaultFocusAppearance
{
  return self->_forcesDefaultFocusAppearance;
}

- (BOOL)focusSystemEnabled
{
  return self->_focusSystemEnabled;
}

- (NSDictionary)utTypeToDocumentClassMap
{
  return self->_utTypeToDocumentClassMap;
}

- (NSArray)viewerRoleDocumentUTTypes
{
  return self->_viewerRoleDocumentUTTypes;
}

- (NSArray)editorRoleDocumentUTTypes
{
  return self->_editorRoleDocumentUTTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorRoleDocumentUTTypes, 0);
  objc_storeStrong((id *)&self->_viewerRoleDocumentUTTypes, 0);
  objc_storeStrong((id *)&self->_utTypeToDocumentClassMap, 0);
  objc_storeStrong((id *)&self->_deviceFamilies, 0);
  objc_storeStrong((id *)&self->_sceneConfigurations, 0);
  objc_storeStrong((id *)&self->_preferredDefaultSceneSessionRole, 0);
  objc_storeStrong((id *)&self->_canvasDefinitions, 0);
  objc_storeStrong((id *)&self->_keyColorAssetName, 0);
  objc_storeStrong((id *)&self->_launchImageFile, 0);
}

@end