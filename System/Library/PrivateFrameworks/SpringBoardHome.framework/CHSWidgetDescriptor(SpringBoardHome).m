@interface CHSWidgetDescriptor(SpringBoardHome)
- (SBHWidget)sbh_iconDataSourceInDomain:()SpringBoardHome;
- (id)accentColor;
- (id)backgroundColor;
- (id)mostInterestingColor;
- (id)sbh_appName;
- (id)sbh_galleryItemIdentifier;
- (id)sbh_iconDataSource;
- (uint64_t)_widgetLocationStyleForAddWidgetSheetLocation:()SpringBoardHome;
- (uint64_t)sbh_canBeAddedToStack;
- (uint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome;
- (uint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome;
- (uint64_t)sbh_isLinkedOnOrAfter:()SpringBoardHome;
- (uint64_t)sbh_supportsRemovableBackgroundOrAccessoryFamilies;
- (void)_loadColorsBackgroundColor:()SpringBoardHome accentColor:;
- (void)_loadColorsFromExtensionForBundleIdentifier:()SpringBoardHome backgroundColor:accentColor:;
- (void)_loadColorsFromShortcutsForBundleIdentifier:()SpringBoardHome backgroundColor:accentColor:;
@end

@implementation CHSWidgetDescriptor(SpringBoardHome)

- (id)sbh_appName
{
  v2 = [a1 extensionBundleIdentifier];
  v3 = SBHContainingBundleRecordForWidgetWithBundleIdentifier(v2);

  v4 = [v3 localizedName];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [v3 localizedShortName];
    v8 = v7;
    if (v7)
    {
      id v6 = v7;
    }
    else
    {
      v9 = objc_msgSend(a1, "sbh_iconDataSource");
      uint64_t v10 = objc_opt_class();
      id v11 = v9;
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      id v13 = v12;

      id v6 = [v13 displayName];
    }
  }

  return v6;
}

- (uint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome
{
  uint64_t v5 = objc_msgSend(a1, "sbh_supportedSizeClasses");
  return v5 & ~objc_msgSend(a1, "sbh_disfavoredSizeClassesForAddWidgetSheetLocation:", a3);
}

- (uint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome
{
  uint64_t v2 = objc_msgSend(a1, "_widgetLocationStyleForAddWidgetSheetLocation:");
  return [a1 disfavoredFamiliesForLocation:v2];
}

- (uint64_t)_widgetLocationStyleForAddWidgetSheetLocation:()SpringBoardHome
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (uint64_t)sbh_canBeAddedToStack
{
  return 1;
}

- (uint64_t)sbh_supportsRemovableBackgroundOrAccessoryFamilies
{
  if (([a1 supportedFamilies] & 0x1C00) != 0) {
    return 1;
  }
  return objc_msgSend(a1, "sbh_supportsRemovableBackground");
}

- (id)sbh_iconDataSource
{
  uint64_t v2 = +[SBHIconGridSizeClassDomain globalDomain];
  v3 = objc_msgSend(a1, "sbh_iconDataSourceInDomain:", v2);

  return v3;
}

- (SBHWidget)sbh_iconDataSourceInDomain:()SpringBoardHome
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = objc_opt_class();
    id v6 = a1;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v18 = v7;

    uint64_t v19 = [v18 type];
    switch(v19)
    {
      case 1:
        v20 = SBHSiriSuggestionsElement;
        break;
      case 2:
        v20 = SBHShortcutsFolderElement;
        break;
      case 3:
        v20 = SBHFilesElement;
        break;
      case 4:
        v20 = SBHAppPredictionsElement;
        break;
      case 5:
        v20 = SBHSmartStackElement;
        break;
      case 6:
        v20 = SBHShortcutsSingleElement;
        break;
      default:
        id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Somehow got to SBHSpecialWidgetDescriptorTypeNone with a SBHSpecialWidgetDescriptor" userInfo:0];
        objc_exception_throw(v22);
    }
    v14 = (SBHWidget *)objc_alloc_init(v20);
  }
  else
  {
    v8 = [a1 extensionIdentity];
    v9 = -[SBHIconGridSizeClassSet initWithCHSWidgetFamilyMask:inDomain:]([SBHIconGridSizeClassSet alloc], "initWithCHSWidgetFamilyMask:inDomain:", [a1 supportedFamilies], v4);
    uint64_t v10 = [SBHWidget alloc];
    id v11 = [a1 kind];
    v12 = [v8 extensionBundleIdentifier];
    id v13 = [v8 containerBundleIdentifier];
    v14 = [(SBHWidget *)v10 initWithKind:v11 extensionBundleIdentifier:v12 containerBundleIdentifier:v13 supportedGridSizeClasses:v9];

    v15 = SBLogWidgets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(SBHWidget *)v14 extensionBundleIdentifier];
      v17 = [(SBHWidget *)v14 uniqueIdentifier];
      int v23 = 138543618;
      v24 = v16;
      __int16 v25 = 2114;
      v26 = v17;
      _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created from CHS widget descriptor.", (uint8_t *)&v23, 0x16u);
    }
  }

  return v14;
}

- (id)sbh_galleryItemIdentifier
{
  uint64_t v2 = objc_getAssociatedObject(a1, &SBHAvocadoDescriptorGalleryItemIdentifierKey);
  if (!v2)
  {
    v3 = [a1 extensionIdentity];
    v15 = NSString;
    uint64_t v4 = [v3 extensionBundleIdentifier];
    uint64_t v5 = [a1 kind];
    id v6 = [v3 containerBundleIdentifier];
    uint64_t v7 = objc_msgSend(a1, "sbh_supportedSizeClasses");
    uint64_t v8 = [a1 supportedFamilies];
    v9 = [a1 displayName];
    uint64_t v10 = [a1 widgetDescription];
    id v11 = [a1 intentType];
    uint64_t v14 = v7;
    v12 = (void *)v4;
    uint64_t v2 = [v15 stringWithFormat:@"AVO_DESCRIPTOR:%@-%@-%@-%lu-%lu-%@-%@-%@", v4, v5, v6, v14, v8, v9, v10, v11];

    objc_setAssociatedObject(a1, &SBHAvocadoDescriptorGalleryItemIdentifierKey, v2, (void *)1);
  }
  return v2;
}

- (uint64_t)sbh_isLinkedOnOrAfter:()SpringBoardHome
{
  if (a3 == 1) {
    return [a1 isLinkedOnOrAfter:0];
  }
  else {
    return a3 == 0;
  }
}

- (id)backgroundColor
{
  objc_getAssociatedObject(a1, &SBHAvocadoDescriptorBackgroundColorKey);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    id v4 = 0;
    [a1 _loadColorsBackgroundColor:&v4 accentColor:0];
    id v2 = v4;
  }
  return v2;
}

- (id)accentColor
{
  objc_getAssociatedObject(a1, &SBHAvocadoDescriptorAccentColorKey);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    id v4 = 0;
    [a1 _loadColorsBackgroundColor:0 accentColor:&v4];
    id v2 = v4;
  }
  return v2;
}

- (id)mostInterestingColor
{
  uint64_t v2 = [a1 accentColor];
  uint64_t v3 = [a1 backgroundColor];
  id v4 = (void *)v3;
  if (v3 | v2)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB1618];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__CHSWidgetDescriptor_SpringBoardHome__mostInterestingColor__block_invoke;
    v8[3] = &unk_1E6AAE508;
    id v9 = (id)v3;
    id v10 = (id)v2;
    id v6 = [v5 colorWithDynamicProvider:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_loadColorsBackgroundColor:()SpringBoardHome accentColor:
{
  uint64_t v7 = [a1 extensionBundleIdentifier];
  id v14 = 0;
  id v15 = 0;
  [a1 _loadColorsFromExtensionForBundleIdentifier:v7 backgroundColor:&v15 accentColor:&v14];
  id v8 = v15;
  id v9 = v14;
  id v12 = v9;
  id v13 = v8;
  [a1 _loadColorsFromShortcutsForBundleIdentifier:v7 backgroundColor:&v13 accentColor:&v12];
  id v10 = v13;

  id v11 = v12;
  objc_setAssociatedObject(a1, &SBHAvocadoDescriptorBackgroundColorKey, v10, (void *)1);
  objc_setAssociatedObject(a1, &SBHAvocadoDescriptorAccentColorKey, v11, (void *)1);
  if (a3 && !*a3)
  {
    *a3 = v10;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else if (!a4)
  {
    goto LABEL_7;
  }
  if (!*a4) {
    *a4 = v11;
  }
LABEL_7:
}

- (void)_loadColorsFromExtensionForBundleIdentifier:()SpringBoardHome backgroundColor:accentColor:
{
  id v7 = a3;
  if (!*a4 || !*a5)
  {
    __int16 v25 = a5;
    id v26 = v7;
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v7 error:0];
    id v9 = [v8 compatibilityObject];
    id v10 = [v9 bundleURL];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F4F6D0]) initWithURL:v10];
    id v12 = [v11 infoDictionary];
    id v13 = [v12 objectForKey:@"NSWidgetBackgroundColorName"];
    id v14 = [v12 objectForKey:@"NSAccentColorName"];
    id v15 = objc_alloc(MEMORY[0x1E4FB1FD8]);
    v16 = [MEMORY[0x1E4FB16C8] currentDevice];
    id v27 = 0;
    v17 = objc_msgSend(v15, "initWithURL:idiom:error:", v10, objc_msgSend(v16, "userInterfaceIdiom"), &v27);
    id v18 = v27;

    if (v18)
    {
      uint64_t v19 = SBLogWidgets();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CHSWidgetDescriptor(SpringBoardHome) _loadColorsFromExtensionForBundleIdentifier:backgroundColor:accentColor:](v18, v19);
      }
    }
    else
    {
      int v23 = v11;
      v24 = v8;
      v20 = objc_opt_new();
      uint64_t v19 = [v17 colorNamed:v13 withTraitCollection:v20];

      v21 = objc_opt_new();
      id v22 = [v17 colorNamed:v14 withTraitCollection:v21];

      if (v19 && !*a4) {
        *a4 = v19;
      }
      if (v25 && v22 && !*v25) {
        *__int16 v25 = v22;
      }

      id v11 = v23;
      id v8 = v24;
    }

    id v7 = v26;
  }
}

- (void)_loadColorsFromShortcutsForBundleIdentifier:()SpringBoardHome backgroundColor:accentColor:
{
  id v7 = a3;
  if (!*a4 || !*a5)
  {
    WFWidgetGetDefaultColors();
    id v8 = 0;
    id v9 = 0;
    if (v8 && !*a4) {
      *a4 = v8;
    }
    if (v9 && !*a5) {
      *a5 = v9;
    }
  }
}

- (void)_loadColorsFromExtensionForBundleIdentifier:()SpringBoardHome backgroundColor:accentColor:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Error creating asset manager: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end