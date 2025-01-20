@interface _UIApplicationInfo
+ (id)_genreNameForID:(int64_t)a3;
+ (id)_localizedFolderNameForName:(id)a3;
- (BOOL)canChangeBackgroundStyle;
- (BOOL)fakingRequiresHighResolution;
- (BOOL)optOutOfRTL;
- (BOOL)requiresHighResolution;
- (BOOL)statusBarForcedHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4;
- (BOOL)statusBarForcedHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4 withUserInterfaceIdiom:(int64_t)a5;
- (BOOL)statusBarHidden;
- (BOOL)statusBarHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4;
- (BOOL)statusBarHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4 withUserInterfaceIdiom:(int64_t)a5;
- (BOOL)statusBarHiddenWhenVerticallyCompact;
- (BOOL)systemWindowsSecure;
- (NSArray)folderNames;
- (NSString)fallbackFolderName;
- (NSString)keyColorAssetName;
- (NSString)launchImageFile;
- (int64_t)_launchingInterfaceOrientation;
- (int64_t)backgroundStyle;
- (int64_t)requestedStatusBarStyle;
- (int64_t)supportedUserInterfaceStyle;
- (int64_t)whitePointAdaptivityStyle;
- (unint64_t)ignoredOverrides;
- (unint64_t)viewControllerBasedStatusBarAppearance;
- (void)_loadFromProxy:(id)a3;
- (void)_lock_loadFolderNamesIfNecessary;
@end

@implementation _UIApplicationInfo

- (int64_t)_launchingInterfaceOrientation
{
  return self->_launchingInterfaceOrientation;
}

- (BOOL)statusBarHiddenWhenVerticallyCompact
{
  return self->_statusBarHiddenWhenVerticallyCompact;
}

- (BOOL)statusBarForcedHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4
{
  id v6 = a4;
  v7 = +[UIDevice currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  v9 = +[UIDevice currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && ![(_UIApplicationInfo *)self supportsDeviceFamily:2])
  {
    uint64_t v8 = 0;
  }
  BOOL v11 = [(_UIApplicationInfo *)self statusBarForcedHiddenForInterfaceOrientation:a3 onDisplay:v6 withUserInterfaceIdiom:v8];

  return v11;
}

- (BOOL)statusBarHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4
{
  id v6 = a4;
  v7 = +[UIDevice currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  v9 = +[UIDevice currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && ![(_UIApplicationInfo *)self supportsDeviceFamily:2])
  {
    uint64_t v8 = 0;
  }
  BOOL v11 = [(_UIApplicationInfo *)self statusBarHiddenForInterfaceOrientation:a3 onDisplay:v6 withUserInterfaceIdiom:v8];

  return v11;
}

- (BOOL)statusBarHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4 withUserInterfaceIdiom:(int64_t)a5
{
  id v8 = a4;
  if ([v8 isMainDisplay]) {
    BOOL v9 = [(_UIApplicationInfo *)self statusBarHidden]
  }
      || [(_UIApplicationInfo *)self statusBarForcedHiddenForInterfaceOrientation:a3 onDisplay:v8 withUserInterfaceIdiom:a5];
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)statusBarForcedHiddenForInterfaceOrientation:(int64_t)a3 onDisplay:(id)a4 withUserInterfaceIdiom:(int64_t)a5
{
  id v8 = a4;
  if ([v8 isMainDisplay]
    && [(_UIApplicationInfo *)self statusBarHiddenWhenVerticallyCompact]
    && ([v8 bounds], !a5))
  {
    if ((unint64_t)(a3 - 3) >= 2) {
      double v13 = v10;
    }
    else {
      double v13 = v9;
    }
    _UIScreenReferenceBoundsSizeForType(1uLL);
    BOOL v11 = v14 > v13;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)statusBarHidden
{
  return self->_statusBarHidden;
}

- (int64_t)supportedUserInterfaceStyle
{
  return self->_supportedUserInterfaceStyle;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)_loadFromProxy:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C108260]();
  v16.receiver = self;
  v16.super_class = (Class)_UIApplicationInfo;
  [(_UIApplicationInfo *)&v16 _loadFromProxy:v4];
  id v6 = [[_UIApplicationInfoParser alloc] initWithApplicationProxy:v4];
  plistParser = self->_plistParser;
  self->_plistParser = v6;

  id v8 = [(_UIApplicationInfoParser *)self->_plistParser launchImageFile];
  launchImageFile = self->_launchImageFile;
  self->_launchImageFile = v8;

  double v10 = [(_UIApplicationInfoParser *)self->_plistParser keyColorAssetName];
  keyColorAssetName = self->_keyColorAssetName;
  self->_keyColorAssetName = v10;

  self->_canChangeBackgroundStyle = [(_UIApplicationInfoParser *)self->_plistParser canChangeBackgroundStyle];
  self->_backgroundStyle = [(_UIApplicationInfoParser *)self->_plistParser backgroundStyle];
  self->_statusBarHidden = [(_UIApplicationInfoParser *)self->_plistParser statusBarHidden];
  self->_requestedStatusBarStyle = [(_UIApplicationInfoParser *)self->_plistParser requestedStatusBarStyle];
  self->_statusBarHiddenWhenVerticallyCompact = [(_UIApplicationInfoParser *)self->_plistParser statusBarHiddenWhenVerticallyCompact];
  self->_ignoredOverrides = [(_UIApplicationInfoParser *)self->_plistParser ignoredOverrides];
  self->_viewControllerBasedStatusBarAppearance = [(_UIApplicationInfoParser *)self->_plistParser viewControllerBasedStatusBarAppearance];
  self->_systemWindowsSecure = [(_UIApplicationInfoParser *)self->_plistParser systemWindowsSecure];
  self->_optOutOfRTL = [(_UIApplicationInfoParser *)self->_plistParser optOutOfRTL];
  int64_t v12 = [(_UIApplicationInfoParser *)self->_plistParser interfaceOrientation];
  v15.receiver = self;
  v15.super_class = (Class)_UIApplicationInfo;
  [(_UIApplicationInfo *)&v15 setInterfaceOrientation:v12];
  unint64_t v13 = [(_UIApplicationInfoParser *)self->_plistParser supportedInterfaceOrientations];
  v14.receiver = self;
  v14.super_class = (Class)_UIApplicationInfo;
  [(_UIApplicationInfo *)&v14 setSupportedInterfaceOrientations:v13];
  self->_launchingInterfaceOrientation = [(_UIApplicationInfoParser *)self->_plistParser launchingInterfaceOrientationForSpringBoard];
  self->_supportedUserInterfaceStyle = [(_UIApplicationInfoParser *)self->_plistParser supportedUserInterfaceStyle];
}

+ (id)_localizedFolderNameForName:(id)a3
{
  id v3 = a3;
  if (qword_1EB25CE10 != -1) {
    dispatch_once(&qword_1EB25CE10, &__block_literal_global_234_1);
  }
  id v4 = [(id)_MergedGlobals_3_12 objectForKeyedSubscript:v3];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:v4 allowUndeclared:1];
    [v5 localizedDescription];
  }
  else
  {
    v5 = _UIKitBundle();
    [v5 localizedStringForKey:v3 value:v3 table:0];
  id v6 = };

  return v6;
}

- (NSArray)folderNames
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33___UIApplicationInfo_folderNames__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(_UIApplicationInfo *)self _synchronize:v4];
  return self->_lazy_folderNames;
}

- (NSString)fallbackFolderName
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40___UIApplicationInfo_fallbackFolderName__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(_UIApplicationInfo *)self _synchronize:v4];
  return self->_lazy_fallbackFolderName;
}

+ (id)_genreNameForID:(int64_t)a3
{
  id result = 0;
  switch(a3)
  {
    case 6000:
      id result = @"Business";
      break;
    case 6001:
      id result = @"Weather";
      break;
    case 6002:
      id result = @"Utilities";
      break;
    case 6003:
      id result = @"Travel";
      break;
    case 6004:
      id result = @"Sports";
      break;
    case 6005:
      id result = @"Social Networking";
      break;
    case 6006:
      id result = @"Reference";
      break;
    case 6007:
      id result = @"Productivity";
      break;
    case 6008:
      id result = @"Photo & Video";
      break;
    case 6009:
      id result = @"News";
      break;
    case 6010:
      id result = @"Navigation";
      break;
    case 6011:
      id result = @"Music";
      break;
    case 6012:
      id result = @"Lifestyle";
      break;
    case 6013:
      id result = @"Healthcare & Fitness";
      break;
    case 6014:
      id result = @"Games";
      break;
    case 6015:
      id result = @"Finance";
      break;
    case 6016:
      id result = @"Entertainment";
      break;
    case 6017:
      id result = @"Education";
      break;
    case 6018:
      id result = @"Books";
      break;
    case 6019:
      return result;
    case 6020:
      id result = @"Medical";
      break;
    default:
      switch(a3)
      {
        case 7001:
          id result = @"Action Games";
          break;
        case 7002:
          id result = @"Adventure Games";
          break;
        case 7003:
          id result = @"Arcade Games";
          break;
        case 7004:
          id result = @"Board Games";
          break;
        case 7005:
          id result = @"Card Games";
          break;
        case 7006:
          id result = @"Casino Games";
          break;
        case 7007:
          id result = @"Dice Games";
          break;
        case 7008:
          id result = @"Educational Games";
          break;
        case 7009:
          id result = @"Family Games";
          break;
        case 7010:
          id result = @"Kids Games";
          break;
        case 7011:
          id result = @"Music Games";
          break;
        case 7012:
          id result = @"Puzzle Games";
          break;
        case 7013:
          id result = @"Racing Games";
          break;
        case 7014:
          id result = @"Role Playing Games";
          break;
        case 7015:
          id result = @"Simulation Games";
          break;
        case 7016:
          id result = @"Sports Games";
          break;
        case 7017:
          id result = @"Strategy Games";
          break;
        case 7018:
          id result = @"Trivia Games";
          break;
        case 7019:
          id result = @"Word Games";
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

- (void)_lock_loadFolderNamesIfNecessary
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!self->_lazy_folderNames)
  {
    v2 = self;
    id v3 = (void *)MEMORY[0x18C108260]();
    id v4 = (void *)MEMORY[0x1E4F223B8];
    v5 = [(_UIApplicationInfo *)v2 bundleIdentifier];
    id v6 = [v4 applicationProxyForIdentifier:v5];

    if (v6)
    {
      v7 = [MEMORY[0x1E4F1CA48] array];
      if ((unint64_t)[(_UIApplicationInfo *)v2 type] > 1)
      {
        v35 = v3;
        v38 = v2;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __54___UIApplicationInfo__lock_loadFolderNamesIfNecessary__block_invoke_2;
        aBlock[3] = &unk_1E52EF420;
        v45 = &__block_literal_global_232;
        v17 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        v36 = v6;
        v18 = [v6 subgenres];
        v19 = objc_msgSend(v18, "bs_objectsOfClass:", objc_opt_class());

        id obj = v19;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v41 != v22) {
                objc_enumerationMutation(obj);
              }
              v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              v25 = objc_msgSend(v24, "bs_safeNumberForKey:", @"genreId");
              v26 = objc_msgSend(v24, "bs_safeStringForKey:", @"genre");
              v27 = v17[2](v17, v25, v26);

              if ([v27 length]) {
                [v7 addObject:v27];
              }
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
          }
          while (v21);
        }

        id v6 = v36;
        v28 = [v36 genreID];
        v29 = [v36 genre];
        v30 = v17[2](v17, v28, v29);

        if ([v30 length])
        {
          [v7 addObject:v30];
          id v12 = v30;
        }
        else
        {
          id v12 = 0;
        }
        id v3 = v35;

        double v9 = v45;
        v2 = v38;
      }
      else
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v8 = objc_opt_class();
        double v9 = [v6 objectForInfoDictionaryKey:@"SBMatchingApplicationGenres" ofClass:v8 valuesOfClass:objc_opt_class()];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          v37 = v2;
          id v12 = 0;
          uint64_t v13 = *(void *)v47;
          do
          {
            uint64_t v14 = 0;
            objc_super v15 = v12;
            do
            {
              if (*(void *)v47 != v13) {
                objc_enumerationMutation(v9);
              }
              objc_super v16 = +[_UIApplicationInfo _localizedFolderNameForName:*(void *)(*((void *)&v46 + 1) + 8 * v14)];
              if (v16) {
                [v7 addObject:v16];
              }
              id v12 = [v7 firstObject];

              ++v14;
              objc_super v15 = v12;
            }
            while (v11 != v14);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
          }
          while (v11);
          v2 = v37;
        }
        else
        {
          id v12 = 0;
        }
      }

      if ([v7 count]) {
        uint64_t v31 = [v7 copy];
      }
      else {
        uint64_t v31 = MEMORY[0x1E4F1CBF0];
      }
      lazy_folderNames = v2->_lazy_folderNames;
      v2->_lazy_folderNames = (NSArray *)v31;

      uint64_t v33 = [v12 copy];
      lazy_fallbackFolderName = v2->_lazy_fallbackFolderName;
      v2->_lazy_fallbackFolderName = (NSString *)v33;
    }
  }
}

- (int64_t)requestedStatusBarStyle
{
  return self->_requestedStatusBarStyle;
}

- (BOOL)canChangeBackgroundStyle
{
  return self->_canChangeBackgroundStyle;
}

- (NSString)launchImageFile
{
  return self->_launchImageFile;
}

- (NSString)keyColorAssetName
{
  return self->_keyColorAssetName;
}

- (unint64_t)ignoredOverrides
{
  return self->_ignoredOverrides;
}

- (unint64_t)viewControllerBasedStatusBarAppearance
{
  return self->_viewControllerBasedStatusBarAppearance;
}

- (BOOL)systemWindowsSecure
{
  return self->_systemWindowsSecure;
}

- (BOOL)optOutOfRTL
{
  return self->_optOutOfRTL;
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (BOOL)requiresHighResolution
{
  return self->_requiresHighResolution;
}

- (BOOL)fakingRequiresHighResolution
{
  return self->_fakingRequiresHighResolution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyColorAssetName, 0);
  objc_storeStrong((id *)&self->_launchImageFile, 0);
  objc_storeStrong((id *)&self->_lazy_fallbackFolderName, 0);
  objc_storeStrong((id *)&self->_lazy_folderNames, 0);
  objc_storeStrong((id *)&self->_plistParser, 0);
}

@end