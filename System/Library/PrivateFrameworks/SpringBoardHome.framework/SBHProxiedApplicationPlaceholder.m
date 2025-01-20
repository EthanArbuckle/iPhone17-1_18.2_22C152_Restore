@interface SBHProxiedApplicationPlaceholder
- (BOOL)canBeShared;
- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3;
- (BOOL)cancel;
- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5;
- (BOOL)iconCanTightenLabel:(id)a3;
- (BOOL)iconCanTruncateLabel:(id)a3;
- (BOOL)iconCompleteUninstall:(id)a3;
- (BOOL)iconSupportsUninstall:(id)a3;
- (BOOL)isActive;
- (BOOL)isAppClip;
- (BOOL)isCancelable;
- (BOOL)isCloudDemoted;
- (BOOL)isDone;
- (BOOL)isDownloading;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFailed;
- (BOOL)isInstalling;
- (BOOL)isNewAppInstallFromStore;
- (BOOL)isPausable;
- (BOOL)isPaused;
- (BOOL)isPrioritizable;
- (BOOL)isStoreDownload;
- (BOOL)isWaiting;
- (BOOL)pause;
- (BOOL)prioritize;
- (BOOL)resume;
- (FBSApplicationPlaceholder)placeholderProxy;
- (NSNumber)applicationItemID;
- (NSString)applicationBundleID;
- (NSString)applicationBundleIdentifier;
- (NSString)applicationDisplayName;
- (NSString)description;
- (SBHProxiedApplicationPlaceholder)initWithPlaceholderProxy:(id)a3;
- (SBHProxiedApplicationPlaceholderDelegate)delegate;
- (double)progressPercentForIcon:(id)a3;
- (id)badgeNumberOrStringForIcon:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)formattedAccessoryStringForIcon:(id)a3;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6;
- (id)icon:(id)a3 statusDescriptionForLocation:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)accessoryTypeForIcon:(id)a3;
- (int64_t)labelAccessoryTypeForIcon:(id)a3;
- (int64_t)progressStateForIcon:(id)a3;
- (unint64_t)_expectedFinalInstallPhase;
- (unint64_t)installType;
- (unint64_t)priorityForIcon:(id)a3;
- (void)_progressChanged;
- (void)_reloadThumbnailImage;
- (void)dealloc;
- (void)invalidate;
- (void)placeholderDidChangeSignificantly:(id)a3;
- (void)placeholderProgressDidUpdate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBHProxiedApplicationPlaceholder

- (BOOL)canBeShared
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  v4 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
  v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  if (v5)
  {
    v6 = [v5 typeForInstallMachinery];
    v7 = [v5 iTunesMetadata];
    uint64_t v8 = [v7 storeItemIdentifier];

    if ([v6 isEqualToString:*MEMORY[0x1E4F22390]]) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      LOBYTE(v10) = 0;
    }
    else {
      int v10 = [v5 isBeta] ^ 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (SBHProxiedApplicationPlaceholder)initWithPlaceholderProxy:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBHProxiedApplicationPlaceholder;
  v6 = [(SBHProxiedApplicationPlaceholder *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placeholderProxy, a3);
    [(FBSApplicationPlaceholder *)v7->_placeholderProxy addObserver:v7];
    id v8 = objc_alloc(MEMORY[0x1E4F223C8]);
    BOOL v9 = [v5 bundleIdentifier];
    int v10 = (void *)[v8 initWithBundleIdentifier:v9 allowPlaceholder:1 error:0];

    if (v10)
    {
      v11 = [v10 iTunesMetadata];
      uint64_t v12 = [v11 storeItemIdentifier];

      if (v12)
      {
        uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v12];
        applicationItemID = v7->_applicationItemID;
        v7->_applicationItemID = (NSNumber *)v13;
      }
      v15 = [v10 appClipMetadata];
      v7->_appClip = v15 != 0;
    }
    [(SBHProxiedApplicationPlaceholder *)v7 placeholderDidChangeSignificantly:v5];
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SBHProxiedApplicationPlaceholder;
  [(SBHProxiedApplicationPlaceholder *)&v2 dealloc];
}

- (NSString)applicationBundleID
{
  return (NSString *)[(FBSApplicationPlaceholder *)self->_placeholderProxy bundleIdentifier];
}

- (NSString)applicationBundleIdentifier
{
  return (NSString *)[(FBSApplicationPlaceholder *)self->_placeholderProxy bundleIdentifier];
}

- (NSString)applicationDisplayName
{
  return (NSString *)[(FBSApplicationPlaceholder *)self->_placeholderProxy displayName];
}

- (unint64_t)installType
{
  return [(FBSApplicationPlaceholder *)self->_placeholderProxy installType];
}

- (unint64_t)_expectedFinalInstallPhase
{
  return [(FBSApplicationPlaceholder *)self->_placeholderProxy expectedFinalInstallPhase];
}

- (BOOL)isDone
{
  objc_super v2 = [(FBSApplicationPlaceholder *)self->_placeholderProxy progress];
  BOOL v3 = [v2 state] == 6;

  return v3;
}

- (BOOL)isActive
{
  objc_super v2 = [(FBSApplicationPlaceholder *)self->_placeholderProxy progress];
  BOOL v3 = [v2 state] != 0;

  return v3;
}

- (BOOL)isWaiting
{
  objc_super v2 = [(FBSApplicationPlaceholder *)self->_placeholderProxy progress];
  BOOL v3 = [v2 state] == 3;

  return v3;
}

- (BOOL)isPaused
{
  objc_super v2 = [(FBSApplicationPlaceholder *)self->_placeholderProxy progress];
  BOOL v3 = [v2 state] == 2;

  return v3;
}

- (BOOL)isFailed
{
  objc_super v2 = [(FBSApplicationPlaceholder *)self->_placeholderProxy progress];
  BOOL v3 = [v2 state] == 1;

  return v3;
}

- (BOOL)isDownloading
{
  objc_super v2 = [(FBSApplicationPlaceholder *)self->_placeholderProxy progress];
  BOOL v3 = [v2 state] == 4;

  return v3;
}

- (BOOL)isInstalling
{
  objc_super v2 = [(FBSApplicationPlaceholder *)self->_placeholderProxy progress];
  BOOL v3 = [v2 state] == 5;

  return v3;
}

- (BOOL)isPrioritizable
{
  return [(FBSApplicationPlaceholder *)self->_placeholderProxy isPrioritizable];
}

- (BOOL)isPausable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained && ![WeakRetained placeholderShouldAllowPausing:self]) {
    char v5 = 0;
  }
  else {
    char v5 = [(FBSApplicationPlaceholder *)self->_placeholderProxy isPausable];
  }

  return v5;
}

- (BOOL)isCancelable
{
  return [(FBSApplicationPlaceholder *)self->_placeholderProxy isCancellable];
}

- (BOOL)isCloudDemoted
{
  [(SBHProxiedApplicationPlaceholder *)self installType];
  return FBSInstallTypeIsCloudDemoted();
}

- (BOOL)isStoreDownload
{
  return [(SBHProxiedApplicationPlaceholder *)self installType] == 1;
}

- (BOOL)isNewAppInstallFromStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained) {
    char v5 = [WeakRetained placeholderRepresentsNewAppInstallFromStore:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)prioritize
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogAppPlaceholder();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "PRIORITIZE: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return [(FBSApplicationPlaceholder *)self->_placeholderProxy prioritizeWithResult:0];
}

- (BOOL)cancel
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogAppPlaceholder();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "CANCEL: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return [(FBSApplicationPlaceholder *)self->_placeholderProxy cancelWithResult:0];
}

- (BOOL)pause
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogAppPlaceholder();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "PAUSE: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return [(FBSApplicationPlaceholder *)self->_placeholderProxy pauseWithResult:0];
}

- (BOOL)resume
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogAppPlaceholder();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "RESUME: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return [(FBSApplicationPlaceholder *)self->_placeholderProxy resumeWithResult:0];
}

- (void)_progressChanged
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogAppPlaceholder();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Updated progress: %@", (uint8_t *)&v5, 0xCu);
  }

  v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
  [v4 postNotificationName:@"SBLeafIconDataSourceDidChangeNotification" object:self userInfo:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [(SBHProxiedApplicationPlaceholder *)self placeholderProxy];
    int v6 = [v4 placeholderProxy];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)[(SBHProxiedApplicationPlaceholder *)self descriptionWithMultilinePrefix:@"\t"];
}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(FBSApplicationPlaceholder *)self->_placeholderProxy removeObserver:self];
    objc_storeWeak((id *)&self->_delegate, 0);
    objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 postNotificationName:@"SBLeafIconDataSourceDidInvalidateNotification" object:self];
  }
}

- (void)placeholderProgressDidUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBHProxiedApplicationPlaceholder_placeholderProgressDidUpdate___block_invoke;
  v6[3] = &unk_1E6AACA90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __65__SBHProxiedApplicationPlaceholder_placeholderProgressDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 8) && *(void *)(result + 16) == *(void *)(a1 + 40)) {
    return [(id)result _progressChanged];
  }
  return result;
}

- (void)placeholderDidChangeSignificantly:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__SBHProxiedApplicationPlaceholder_placeholderDidChangeSignificantly___block_invoke;
  v6[3] = &unk_1E6AACA90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __70__SBHProxiedApplicationPlaceholder_placeholderDidChangeSignificantly___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 8) && *(void *)(result + 16) == *(void *)(a1 + 40))
  {
    [(id)result _progressChanged];
    id v3 = *(void **)(a1 + 32);
    return [v3 _reloadThumbnailImage];
  }
  return result;
}

- (void)_reloadThumbnailImage
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
  id v4 = SBLogAppPlaceholder();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_INFO, "Reloading thumbnail image for placeholder: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
  [v5 postNotificationName:@"SBLeafIconDataSourceDidGenerateImageNotification" object:self];
}

- (id)icon:(id)a3 statusDescriptionForLocation:(id)a4
{
  if (![(SBHProxiedApplicationPlaceholder *)self isActive]
    || [(SBHProxiedApplicationPlaceholder *)self isFailed]
    || [(SBHProxiedApplicationPlaceholder *)self isDone])
  {
    id v5 = 0;
  }
  else
  {
    if ([(SBHProxiedApplicationPlaceholder *)self isPaused])
    {
      id v7 = SBHBundle();
      uint64_t v8 = v7;
      BOOL v9 = @"PAUSED_ICON_LABEL";
    }
    else if ([(SBHProxiedApplicationPlaceholder *)self isWaiting])
    {
      id v7 = SBHBundle();
      uint64_t v8 = v7;
      BOOL v9 = @"WAITING_ICON_LABEL";
    }
    else if ([(SBHProxiedApplicationPlaceholder *)self isInstalling] {
           && [(SBHProxiedApplicationPlaceholder *)self _expectedFinalInstallPhase] != 4)
    }
    {
      id v7 = SBHBundle();
      uint64_t v8 = v7;
      BOOL v9 = @"INSTALLING_ICON_LABEL";
    }
    else
    {
      id v7 = SBHBundle();
      uint64_t v8 = v7;
      BOOL v9 = @"DOWNLOADING_ICON_LABEL";
    }
    id v5 = [v7 localizedStringForKey:v9 value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  }
  return v5;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 2;
}

- (BOOL)canGenerateIconsInBackgroundForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  int v9 = (int)a5;
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  v14 = a4;
  LOBYTE(v9) = SBHIconServicesOptionsForImageOptions(v9);
  v15 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
  v16 = SBHGetApplicationIconImageWithTraitCollection(v15, (uint64_t)v14, v9, v12, v11, v10);

  return v16;
}

- (BOOL)iconCanTruncateLabel:(id)a3
{
  return 1;
}

- (BOOL)iconCanTightenLabel:(id)a3
{
  return 1;
}

- (int64_t)progressStateForIcon:(id)a3
{
  int64_t v4 = [(SBHProxiedApplicationPlaceholder *)self isCloudDemoted] ^ 1;
  if (![(SBHProxiedApplicationPlaceholder *)self isFailed])
  {
    if ([(SBHProxiedApplicationPlaceholder *)self isActive])
    {
      id v5 = [(FBSApplicationPlaceholder *)self->_placeholderProxy progress];
      [v5 percentComplete];
      double v7 = v6;

      if (v7 > 2.22044605e-16) {
        return 2;
      }
    }
  }
  return v4;
}

- (double)progressPercentForIcon:(id)a3
{
  id v3 = [(FBSApplicationPlaceholder *)self->_placeholderProxy progress];
  [v3 percentComplete];
  double v5 = v4;

  return v5;
}

- (int64_t)accessoryTypeForIcon:(id)a3
{
  return 0;
}

- (id)badgeNumberOrStringForIcon:(id)a3
{
  return 0;
}

- (id)formattedAccessoryStringForIcon:(id)a3
{
  return 0;
}

- (int64_t)labelAccessoryTypeForIcon:(id)a3
{
  if ([(SBHProxiedApplicationPlaceholder *)self isCloudDemoted]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (BOOL)iconSupportsUninstall:(id)a3
{
  if ([(SBHProxiedApplicationPlaceholder *)self isDone]) {
    return 0;
  }
  return [(SBHProxiedApplicationPlaceholder *)self isCancelable];
}

- (BOOL)iconCompleteUninstall:(id)a3
{
  id v4 = a3;
  if ([v4 isApplicationIcon] && objc_msgSend(v4, "isUninstalledByUser"))
  {
    double v5 = [(SBHProxiedApplicationPlaceholder *)self delegate];
    [v5 placeholderWantsUninstall:self];
  }
  return 1;
}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  if ([(SBHProxiedApplicationPlaceholder *)self isPaused])
  {
    if ([(SBHProxiedApplicationPlaceholder *)self resume]) {
      return 1;
    }
  }
  else if ([(SBHProxiedApplicationPlaceholder *)self isPausable] {
         && [(SBHProxiedApplicationPlaceholder *)self pause])
  }
  {
    return 1;
  }
  if ([(SBHProxiedApplicationPlaceholder *)self prioritize]) {
    return 1;
  }
  double v7 = SBLogAppPlaceholder();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[SBHProxiedApplicationPlaceholder icon:launchFromLocation:context:](self, v7);
  }

  return 0;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBHProxiedApplicationPlaceholder *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  double v5 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleIdentifier];
  id v6 = (id)[v4 appendObject:v5 withName:@"bundleIdentifier"];

  double v7 = [(SBHProxiedApplicationPlaceholder *)self applicationDisplayName];
  id v8 = (id)[v4 appendObject:v7 withName:@"displayName"];

  int v9 = [(FBSApplicationPlaceholder *)self->_placeholderProxy progress];
  double v10 = v9;
  if (v9)
  {
    double v11 = NSString;
    [v9 percentComplete];
    uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", @"%.0f%%", v12 * 100.0);
    id v14 = (id)[v4 appendObject:v13 withName:@"progress"];

    [v10 state];
    v15 = NSStringFromFBSApplicationPlaceholderProgressState();
    id v16 = (id)[v4 appendObject:v15 withName:@"state"];
  }
  id v17 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHProxiedApplicationPlaceholder isPausable](self, "isPausable"), @"canPause?", 1);
  id v18 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHProxiedApplicationPlaceholder isPrioritizable](self, "isPrioritizable"), @"canPromote?", 1);
  id v19 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHProxiedApplicationPlaceholder isCancelable](self, "isCancelable"), @"canCancel?", 1);

  return v4;
}

- (id)succinctDescription
{
  objc_super v2 = [(SBHProxiedApplicationPlaceholder *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (FBSApplicationPlaceholder)placeholderProxy
{
  return self->_placeholderProxy;
}

- (SBHProxiedApplicationPlaceholderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHProxiedApplicationPlaceholderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)applicationItemID
{
  return self->_applicationItemID;
}

- (BOOL)isAppClip
{
  return self->_appClip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationItemID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderProxy, 0);
}

- (void)icon:(void *)a1 launchFromLocation:(NSObject *)a2 context:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 applicationBundleID];
  int v4 = 138543362;
  double v5 = v3;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "All action attempts failed for placeholder: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end