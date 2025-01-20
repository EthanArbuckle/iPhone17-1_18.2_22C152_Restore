@interface SBHApplicationIcon
- (BOOL)cancelDownload;
- (BOOL)isApplicationIcon;
- (BOOL)isUninstalledByUser;
- (BOOL)pauseDownload;
- (BOOL)prioritizeDownload;
- (BOOL)resumeDownload;
- (NSString)applicationDisplayName;
- (SBHApplicationIcon)initWithApplication:(id)a3;
- (SBHApplicationIcon)initWithApplicationPlaceholder:(id)a3;
- (SBHApplicationIcon)initWithApplicationWithBundleIdentifier:(id)a3;
- (SBHApplicationIcon)initWithLeafIdentifier:(id)a3 application:(id)a4;
- (SBHApplicationIcon)initWithLeafIdentifier:(id)a3 applicationPlaceholder:(id)a4;
- (id)application;
- (id)applicationPlaceholder;
- (id)automationID;
- (id)copyWithLeafIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)iconImageCacheIdentifier;
- (void)changeEnablement:(unint64_t)a3 ofFeature:(unint64_t)a4;
- (void)changeHiddenStatusToHidden:(BOOL)a3;
- (void)changeLockedStatusToLocked:(BOOL)a3;
- (void)noteExternalApplicationPlaceholderStateChange;
- (void)possibleUserTapBeganWithAbsoluteTime:(unint64_t)a3 andContinuousTime:(unint64_t)a4;
- (void)possibleUserTapDidCancel;
- (void)removeApplicationDataSources;
- (void)removeApplicationPlaceholderDataSources;
- (void)replaceIconDataSourcesWithApplication:(id)a3;
- (void)replaceIconDataSourcesWithApplicationPlaceholder:(id)a3;
- (void)setBadge:(id)a3;
- (void)setUninstalledByUser:(BOOL)a3;
@end

@implementation SBHApplicationIcon

- (id)iconImageCacheIdentifier
{
  v3 = [(SBLeafIcon *)self applicationBundleID];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHApplicationIcon;
    id v5 = [(SBIcon *)&v8 iconImageCacheIdentifier];
  }
  v6 = v5;

  return v6;
}

- (BOOL)isApplicationIcon
{
  return 1;
}

- (void)possibleUserTapDidCancel
{
  v4.receiver = self;
  v4.super_class = (Class)SBHApplicationIcon;
  [(SBIcon *)&v4 possibleUserTapDidCancel];
  v3 = [(SBHApplicationIcon *)self application];
  if (objc_opt_respondsToSelector()) {
    [v3 possibleUserTapDidCancel];
  }
}

- (void)possibleUserTapBeganWithAbsoluteTime:(unint64_t)a3 andContinuousTime:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBHApplicationIcon;
  -[SBIcon possibleUserTapBeganWithAbsoluteTime:andContinuousTime:](&v8, sel_possibleUserTapBeganWithAbsoluteTime_andContinuousTime_);
  v7 = [(SBHApplicationIcon *)self application];
  if (objc_opt_respondsToSelector()) {
    [v7 possibleUserTapBeganWithAbsoluteTime:a3 andContinuousTime:a4];
  }
}

- (id)applicationPlaceholder
{
  v2 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)application
{
  v2 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (SBHApplicationIcon)initWithLeafIdentifier:(id)a3 application:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v6 bundleIdentifier];
  v9 = [(SBLeafIcon *)self initWithLeafIdentifier:v7 applicationBundleID:v8];

  if (v9) {
    [(SBLeafIcon *)v9 addIconDataSource:v6];
  }

  return v9;
}

- (SBHApplicationIcon)initWithApplication:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  if (objc_opt_respondsToSelector()) {
    [v4 iconIdentifier];
  }
  else {
  id v6 = [v4 bundleIdentifier];
  }
  if (v6)
  {
    id v7 = [(SBLeafIcon *)self initWithLeafIdentifier:v6 applicationBundleID:v5];
    objc_super v8 = v7;
    if (v7) {
      [(SBLeafIcon *)v7 addIconDataSource:v4];
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SBHApplicationIcon)initWithApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (__sb__runningInSpringBoard())
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [[SBHSimpleApplication alloc] initWithBundleIdentifier:v4];
    if (v6)
    {
      self = [(SBHApplicationIcon *)self initWithApplication:v6];
      id v5 = self;
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (SBHApplicationIcon)initWithLeafIdentifier:(id)a3 applicationPlaceholder:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v6 applicationBundleIdentifier];
  v9 = [(SBLeafIcon *)self initWithLeafIdentifier:v7 applicationBundleID:v8];

  if (v9) {
    [(SBLeafIcon *)v9 addIconDataSource:v6];
  }

  return v9;
}

- (SBHApplicationIcon)initWithApplicationPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 applicationBundleIdentifier];
  id v6 = [(SBLeafIcon *)self initWithLeafIdentifier:v5 applicationBundleID:v5];
  id v7 = v6;
  if (v6) {
    [(SBLeafIcon *)v6 addIconDataSource:v4];
  }

  return v7;
}

- (void)removeApplicationDataSources
{
}

uint64_t __50__SBHApplicationIcon_removeApplicationDataSources__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_respondsToSelector() & (v2 != 0);

  return v3;
}

- (void)removeApplicationPlaceholderDataSources
{
}

uint64_t __61__SBHApplicationIcon_removeApplicationPlaceholderDataSources__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_respondsToSelector() & (v2 != 0);

  return v3;
}

- (void)replaceIconDataSourcesWithApplication:(id)a3
{
  id v4 = a3;
  [(SBLeafIcon *)self removeAllIconDataSources];
  [(SBHApplicationIcon *)self addApplicationDataSource:v4];
}

- (void)replaceIconDataSourcesWithApplicationPlaceholder:(id)a3
{
  id v4 = a3;
  [(SBLeafIcon *)self removeAllIconDataSources];
  [(SBLeafIcon *)self addIconDataSource:v4];
}

- (BOOL)prioritizeDownload
{
  id v2 = [(SBHApplicationIcon *)self applicationPlaceholder];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 prioritize];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)pauseDownload
{
  id v2 = [(SBHApplicationIcon *)self applicationPlaceholder];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 pause];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)resumeDownload
{
  id v2 = [(SBHApplicationIcon *)self applicationPlaceholder];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 resume];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)cancelDownload
{
  id v2 = [(SBHApplicationIcon *)self applicationPlaceholder];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 cancel];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)changeLockedStatusToLocked:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(SBHApplicationIcon *)self changeEnablement:v3 ofFeature:1];
}

- (void)changeHiddenStatusToHidden:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(SBHApplicationIcon *)self changeEnablement:v3 ofFeature:2];
}

- (void)changeEnablement:(unint64_t)a3 ofFeature:(unint64_t)a4
{
  id v6 = [(SBLeafIcon *)self applicationBundleID];
  id v7 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v6];
  if (v7)
  {
    objc_super v8 = (void *)MEMORY[0x1E4F4B828];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__SBHApplicationIcon_changeEnablement_ofFeature___block_invoke;
    v9[3] = &unk_1E6AB0A20;
    id v10 = v6;
    unint64_t v11 = a4;
    unint64_t v12 = a3;
    [v8 oneshotBeginFlowToSetEnablement:a3 ofFeature:a4 forSubject:v7 completion:v9];
  }
}

void __49__SBHApplicationIcon_changeEnablement_ofFeature___block_invoke(void *a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = SBLogProtectedApps();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __49__SBHApplicationIcon_changeEnablement_ofFeature___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (NSString)applicationDisplayName
{
  uint64_t v3 = [(SBHApplicationIcon *)self applicationPlaceholder];
  id v4 = v3;
  if (v3) {
    [v3 applicationDisplayName];
  }
  else {
  id v5 = [(SBIcon *)self displayName];
  }

  return (NSString *)v5;
}

- (void)noteExternalApplicationPlaceholderStateChange
{
}

- (void)setBadge:(id)a3
{
  id v5 = a3;
  id v4 = [(SBHApplicationIcon *)self application];
  if (objc_opt_respondsToSelector()) {
    [v4 setBadgeValue:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHApplicationIcon;
  id v4 = [(SBLeafIcon *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setUninstalledByUser:", -[SBHApplicationIcon isUninstalledByUser](self, "isUninstalledByUser"));
  return v4;
}

- (id)copyWithLeafIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHApplicationIcon;
  id v4 = [(SBLeafIcon *)&v6 copyWithLeafIdentifier:a3];
  objc_msgSend(v4, "setUninstalledByUser:", -[SBHApplicationIcon isUninstalledByUser](self, "isUninstalledByUser"));
  return v4;
}

- (id)automationID
{
  id v2 = [(SBLeafIcon *)self applicationBundleID];
  uint64_t v3 = [@"BTN " stringByAppendingString:v2];

  return v3;
}

- (BOOL)isUninstalledByUser
{
  return self->_uninstalledByUser;
}

- (void)setUninstalledByUser:(BOOL)a3
{
  self->_uninstalledByUser = a3;
}

void __49__SBHApplicationIcon_changeEnablement_ofFeature___block_invoke_cold_1(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  int v6 = 138413058;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  __int16 v12 = 2114;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Failed to change enablement status of application: %@ feature %llu to %llu with error: %{public}@", (uint8_t *)&v6, 0x2Au);
}

@end