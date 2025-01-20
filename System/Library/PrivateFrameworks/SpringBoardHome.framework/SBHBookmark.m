@interface SBHBookmark
- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3;
- (BOOL)iconCompleteUninstall:(id)a3;
- (BOOL)iconSupportsUninstall:(id)a3;
- (BOOL)isAppClip;
- (BOOL)isShortcutsWebClip;
- (BOOL)isSingleStepShortcutWebClip;
- (BOOL)isUninstallSupported;
- (CPSWebClip)appClip;
- (NSString)identifier;
- (NSString)placeholderBundleIdentifier;
- (NSURL)launchURL;
- (SBHBookmark)initWithWebClip:(id)a3;
- (UIWebClip)webClip;
- (id)folderFallbackTitleForIcon:(id)a3;
- (id)folderTitleOptionsForIcon:(id)a3;
- (id)iTunesCategoriesOrderedByRelevancyForIcon:(id)a3;
- (id)icon:(id)a3 displayNameForLocation:(id)a4;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4;
- (id)supportedGridSizeClassesForIcon:(id)a3;
- (unint64_t)priorityForIcon:(id)a3;
- (void)_cleanupAppClipIfNecessary;
- (void)_deviceUnlockedForFirstTime:(id)a3;
- (void)dealloc;
- (void)setPlaceholderBundleIdentifier:(id)a3;
@end

@implementation SBHBookmark

- (SBHBookmark)initWithWebClip:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHBookmark;
  v6 = [(SBHBookmark *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webClip, a3);
    uint64_t v8 = [v5 placeholderBundleIdentifier];
    placeholderBundleIdentifier = v7->_placeholderBundleIdentifier;
    v7->_placeholderBundleIdentifier = (NSString *)v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__deviceUnlockedForFirstTime_ name:*MEMORY[0x1E4FA6118] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA6118] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHBookmark;
  [(SBHBookmark *)&v4 dealloc];
}

- (NSString)identifier
{
  v2 = [(SBHBookmark *)self webClip];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSURL)launchURL
{
  v2 = [(SBHBookmark *)self webClip];
  v3 = [v2 applicationLaunchURL];

  return (NSURL *)v3;
}

- (BOOL)isShortcutsWebClip
{
  v2 = [(SBHBookmark *)self webClip];
  v3 = [v2 shortcutIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isSingleStepShortcutWebClip
{
  if (![(SBHBookmark *)self isShortcutsWebClip]) {
    return 0;
  }
  v3 = [(SBHBookmark *)self webClip];
  BOOL v4 = [v3 pageURL];
  BOOL v5 = v4 == 0;

  return v5;
}

- (CPSWebClip)appClip
{
  if (!self->_appClip && [(SBHBookmark *)self isAppClip])
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v3 = (void *)getCPSWebClipStoreClass_softClass;
    uint64_t v15 = getCPSWebClipStoreClass_softClass;
    if (!getCPSWebClipStoreClass_softClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getCPSWebClipStoreClass_block_invoke;
      v11[3] = &unk_1E6AAD648;
      v11[4] = &v12;
      __getCPSWebClipStoreClass_block_invoke((uint64_t)v11);
      v3 = (void *)v13[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v12, 8);
    BOOL v5 = [v4 sharedStore];
    v6 = [(UIWebClip *)self->_webClip identifier];
    v7 = [v5 synchronouslyGetAppClipWithIdentifier:v6];
    appClip = self->_appClip;
    self->_appClip = v7;
  }
  v9 = self->_appClip;
  return v9;
}

- (BOOL)isAppClip
{
  if (self->_appClip) {
    return 1;
  }
  v3 = [(SBHBookmark *)self webClip];
  char v4 = [v3 isAppClip];

  return v4;
}

- (void)_deviceUnlockedForFirstTime:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"SBLeafIconDataSourceDidChangeNotification" object:self];
}

- (BOOL)isUninstallSupported
{
  v2 = [(SBHBookmark *)self webClip];
  char v3 = [v2 removalDisallowed] ^ 1;

  return v3;
}

- (id)icon:(id)a3 displayNameForLocation:(id)a4
{
  id v4 = [(SBHBookmark *)self webClip];
  BOOL v5 = [v4 title];

  return v5;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 0;
}

- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1D9484600]();
  v7 = [(SBHBookmark *)self webClip];
  uint64_t v8 = [v7 iconImage];

  return v8;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  if ([(SBHBookmark *)self isAppClip])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F6F248]);
    uint64_t v12 = [(SBHBookmark *)self webClip];
    v13 = [v12 applicationBundleIdentifier];
    uint64_t v14 = (void *)[v11 initWithBundleIdentifier:v13];

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v9, v8, v7);
    v16 = [v14 prepareImageForDescriptor:v15];
    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x1E4FB1818]);
      uint64_t v18 = [v16 CGImage];
      [v16 scale];
      v19 = objc_msgSend(v17, "initWithCGImage:scale:orientation:", v18, 0);
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  int v9 = (int)a5;
  double v11 = v8;
  double v12 = v7;
  double v13 = v6;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  v16 = a4;
  id v17 = (void *)MEMORY[0x1D9484600]();
  uint64_t v18 = [(SBHBookmark *)self webClip];
  char v19 = SBHIconServicesOptionsForImageOptions(v9);
  if ([(SBHBookmark *)self isAppClip])
  {
    id v20 = objc_alloc(MEMORY[0x1E4F6F248]);
    v21 = [v18 applicationBundleIdentifier];
    v22 = (void *)[v20 initWithBundleIdentifier:v21];

    goto LABEL_11;
  }
  v23 = [(SBIconImageInfo *)v16 sbh_iconImageAppearance];
  uint64_t v24 = [v23 appearanceType];
  if ((unint64_t)(v24 - 2) < 2)
  {
    uint64_t v25 = [v18 tintableIconImage];
  }
  else if (v24 == 1)
  {
    uint64_t v25 = [v18 darkIconImage];
  }
  else
  {
    if (v24)
    {
      v26 = 0;
      goto LABEL_10;
    }
    uint64_t v25 = [v18 iconImage];
  }
  v26 = (void *)v25;
LABEL_10:
  id v27 = objc_alloc(MEMORY[0x1E4F6F1E8]);
  id v28 = v26;
  uint64_t v29 = [v28 CGImage];
  [v28 scale];
  v30 = objc_msgSend(v27, "initWithCGImage:scale:", v29);
  id v31 = objc_alloc(MEMORY[0x1E4F6F248]);
  v40[0] = v30;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  v22 = (void *)[v31 initWithImages:v32];

LABEL_11:
  v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v13, v12, v11);
  SBHModifyImageDescriptorWithTraitCollection(v33, (uint64_t)v16, v19);
  v34 = [v22 prepareImageForDescriptor:v33];
  if (v34)
  {
    id v35 = objc_alloc(MEMORY[0x1E4FB1818]);
    uint64_t v36 = [v34 CGImage];
    [v34 scale];
    v37 = objc_msgSend(v35, "initWithCGImage:scale:orientation:", v36, 0);
  }
  else
  {
    v37 = 0;
  }
  v38 = SBHIconServicesAddDebugImageOverlayWithTraitCollection(v37);

  return v38;
}

- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3
{
  return 1;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  return +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
}

- (BOOL)iconSupportsUninstall:(id)a3
{
  char v3 = [(SBHBookmark *)self webClip];
  char v4 = [v3 removalDisallowed] ^ 1;

  return v4;
}

- (BOOL)iconCompleteUninstall:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 postNotificationName:@"SBWebBookmarkWasUninstalledNotification" object:self];

  if ([(SBHBookmark *)self isAppClip]) {
    id v5 = [(SBHBookmark *)self appClip];
  }
  double v6 = [(SBHBookmark *)self webClip];
  char v7 = [v6 removeFromDisk];

  [(SBHBookmark *)self _cleanupAppClipIfNecessary];
  return v7;
}

- (id)folderTitleOptionsForIcon:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  char v3 = SBHBundle();
  char v4 = [v3 localizedStringForKey:@"BOOKMARK_FOLDER_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (id)folderFallbackTitleForIcon:(id)a3
{
  return 0;
}

- (id)iTunesCategoriesOrderedByRelevancyForIcon:(id)a3
{
  return &unk_1F300F1E0;
}

- (void)_cleanupAppClipIfNecessary
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(SBHBookmark *)self isAppClip])
  {
    char v3 = [(SBHBookmark *)self appClip];
    char v4 = [v3 applicationBundleIdentifier];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
    double v6 = [v5 appClipMetadata];

    if (v6)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      char v7 = [MEMORY[0x1E4FB1F10] webClips];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v20;
        while (2)
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v7);
            }
            double v11 = [*(id *)(*((void *)&v19 + 1) + 8 * v10) applicationBundleIdentifier];
            int v12 = [v11 isEqualToString:v4];

            if (v12)
            {
              v16 = SBLogCommon();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v4;
                _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "Bailing on cleanup of app clip '%@'; appclip in use by other UIWebClip",
                  (uint8_t *)&buf,
                  0xCu);
              }

              goto LABEL_21;
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      double v13 = SBLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "Starting cleanup of app clip '%@'", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v23 = 0;
      uint64_t v24 = &v23;
      uint64_t v25 = 0x2050000000;
      uint64_t v14 = (void *)getIXAppInstallCoordinatorClass_softClass;
      uint64_t v26 = getIXAppInstallCoordinatorClass_softClass;
      if (!getIXAppInstallCoordinatorClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v29 = __getIXAppInstallCoordinatorClass_block_invoke;
        v30 = &unk_1E6AAD648;
        id v31 = &v23;
        __getIXAppInstallCoordinatorClass_block_invoke((uint64_t)&buf);
        uint64_t v14 = (void *)v24[3];
      }
      id v15 = v14;
      _Block_object_dispose(&v23, 8);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __41__SBHBookmark__cleanupAppClipIfNecessary__block_invoke;
      v17[3] = &unk_1E6AB0058;
      uint64_t v18 = v4;
      [v15 uninstallAppWithBundleID:v18 requestUserConfirmation:0 completion:v17];
      char v7 = v18;
    }
    else
    {
      char v7 = SBLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "Bailing on cleanup of app clip '%@': Appclips were removed from install of the real app.", (uint8_t *)&buf, 0xCu);
      }
    }
LABEL_21:
  }
}

void __41__SBHBookmark__cleanupAppClipIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __41__SBHBookmark__cleanupAppClipIfNecessary__block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (NSString)placeholderBundleIdentifier
{
  return self->_placeholderBundleIdentifier;
}

- (void)setPlaceholderBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appClip, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
}

void __41__SBHBookmark__cleanupAppClipIfNecessary__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Error uninstalling bundle identifier %@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end