@interface SBLeafIcon
+ (id)formattedBadgeNumberOrString:(id)a3;
+ (id)iconImageForDataSource:(id)a3 ofIcon:(id)a4 info:(SBIconImageInfo *)a5;
+ (id)iconLayerForDataSource:(id)a3 ofIcon:(id)a4 info:(SBIconImageInfo *)a5 traitCollection:(id)a6 options:(unint64_t)a7;
- (BOOL)canGenerateIconsInBackground;
- (BOOL)canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (BOOL)canTightenLabel;
- (BOOL)canTruncateLabel;
- (BOOL)hasIconDataSource:(id)a3;
- (BOOL)hasObserver:(id)a3;
- (BOOL)isLaunchDisabledForObscuredReason;
- (BOOL)isLaunchEnabled;
- (BOOL)isLeafIcon;
- (BOOL)isProgressPaused;
- (BOOL)isTimedOut;
- (BOOL)isUninstallSupported;
- (BOOL)leafIdentifierAndApplicationBundleIDMatches;
- (BOOL)performLaunchFromLocation:(id)a3 context:(id)a4;
- (BOOL)supportsRasterization;
- (NSArray)iconDataSources;
- (NSString)applicationBundleID;
- (NSString)sbh_iconLibraryItemIdentifier;
- (SBLeafIcon)init;
- (SBLeafIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4;
- (SBLeafIcon)initWithUniqueLeafIdentifier;
- (SBLeafIconDataSource)_bestDataSource;
- (SBLeafIconDataSource)_fallbackBestDataSource;
- (SBLeafIconDataSource)activeDataSource;
- (SBLeafIconDataSource)firstIconDataSource;
- (SBLeafIconDataSource)lastIconDataSource;
- (double)progressPercent;
- (id)accessoryTextForLocation:(id)a3;
- (id)badgeNumberOrString;
- (id)copyWithLeafIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayNameForLocation:(id)a3;
- (id)displayNameForObscuredDisabledLaunchForLocation:(id)a3;
- (id)firstIconDataSourceOfClass:(Class)a3;
- (id)firstIconDataSourcePassingTest:(id)a3;
- (id)firstIconDataSourceWithUniqueIdentifier:(id)a3;
- (id)folderFallbackTitle;
- (id)folderTitleOptions;
- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3;
- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3;
- (id)iTunesCategoriesOrderedByRelevancy;
- (id)iconDataSourcesOfClass:(Class)a3;
- (id)leafIdentifier;
- (id)makeIconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (id)statusDescriptionForLocation:(id)a3;
- (id)supportedGridSizeClasses;
- (id)tags;
- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3;
- (int64_t)accessoryTypeForLocation:(id)a3;
- (int64_t)labelAccessoryType;
- (int64_t)progressState;
- (unint64_t)iconDataSourceCount;
- (unint64_t)indexOfActiveDataSource;
- (void)_noteActiveDataSourceDidChangeAndReloadIcon:(BOOL)a3;
- (void)_noteActiveDataSourceDidChangeNotification:(id)a3;
- (void)_noteActiveDataSourceDidGenerateImageNotification:(id)a3;
- (void)_noteDataSourceDidInvalidateNotification:(id)a3;
- (void)_setPropertiesFromIcon:(id)a3;
- (void)_updateActiveDataSource;
- (void)addIconDataSource:(id)a3;
- (void)addIconDataSources:(id)a3;
- (void)addObserver:(id)a3;
- (void)completeUninstall;
- (void)dealloc;
- (void)didChangeActiveDataSource:(id)a3;
- (void)didReplaceIconDataSource:(id)a3 withIconDataSource:(id)a4;
- (void)enumerateObserversUsingBlock:(id)a3;
- (void)insertIconDataSource:(id)a3 beforeIconDataSource:(id)a4;
- (void)insertIconDataSources:(id)a3 atIndexes:(id)a4;
- (void)notifyObserversOfAddedIconDataSource:(id)a3;
- (void)notifyObserversOfRemovedIconDataSource:(id)a3;
- (void)performCoalescedDataSourceUpdate:(id)a3;
- (void)prepareToMakeLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (void)removeAllIconDataSources;
- (void)removeIconDataSource:(id)a3;
- (void)removeIconDataSourcesOfClass:(Class)a3;
- (void)removeIconDataSourcesPassingTest:(id)a3;
- (void)removeObserver:(id)a3;
- (void)replaceIconDataSource:(id)a3 withIconDataSource:(id)a4;
- (void)selectNextActiveDataSource;
- (void)setActiveDataSource:(id)a3;
- (void)setUninstalled;
@end

@implementation SBLeafIcon

- (int64_t)labelAccessoryType
{
  v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (id)[v3 labelAccessoryTypeForIcon:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    id v4 = [(SBIcon *)&v7 labelAccessoryType];
  }
  int64_t v5 = (int64_t)v4;

  return v5;
}

- (int64_t)accessoryTypeForLocation:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    id v6 = (id)[v5 accessoryTypeForIcon:self];
  }
  else
  {
    if ([(SBLeafIcon *)self isTimedOut])
    {
      int64_t v7 = 0;
      goto LABEL_8;
    }
    v8 = [(SBLeafIcon *)self badgeNumberOrString];

    if (v8)
    {
      int64_t v7 = 1;
      goto LABEL_8;
    }
    v10.receiver = self;
    v10.super_class = (Class)SBLeafIcon;
    id v6 = [(SBIcon *)&v10 accessoryTypeForLocation:v4];
  }
  int64_t v7 = (int64_t)v6;
LABEL_8:

  return v7;
}

- (id)badgeNumberOrString
{
  v3 = [(SBLeafIcon *)self activeDataSource];
  id v4 = [(SBIcon *)self overrideBadgeNumberOrString];

  if (v4)
  {
    uint64_t v5 = [(SBIcon *)self overrideBadgeNumberOrString];
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v3 badgeNumberOrStringForIcon:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLeafIcon;
    uint64_t v5 = [(SBIcon *)&v8 badgeNumberOrString];
  }
  id v6 = (void *)v5;
  if ([(SBLeafIcon *)self isTimedOut]) {
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 integerValue]) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 isEqualToString:&stru_1F2FA0300])
  {
LABEL_12:

    id v6 = 0;
  }
LABEL_13:

  return v6;
}

- (BOOL)isTimedOut
{
  v3 = [(SBLeafIcon *)self activeDataSource];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(SBLeafIcon *)self activeDataSource];
  char v6 = [v5 isTimedOutForIcon:self];

  return v6;
}

- (SBLeafIconDataSource)activeDataSource
{
  return self->_activeDataSource;
}

- (id)accessoryTextForLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBLeafIcon *)self badgeNumberOrString];
  if (!v5
    || (char v6 = objc_opt_class(),
        [(SBIcon *)self overrideBadgeNumberOrString],
        int64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v6 formattedBadgeNumberOrString:v7],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v9 = [(SBLeafIcon *)self activeDataSource];
    if (objc_opt_respondsToSelector())
    {
      objc_super v8 = [v9 formattedAccessoryStringForIcon:self];

      if (v8) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    v11.receiver = self;
    v11.super_class = (Class)SBLeafIcon;
    objc_super v8 = [(SBIcon *)&v11 accessoryTextForLocation:v4];
  }
LABEL_8:

  return v8;
}

+ (id)formattedBadgeNumberOrString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 integerValue] >= 1)
  {
    if (formattedBadgeNumberOrString__onceToken != -1) {
      dispatch_once(&formattedBadgeNumberOrString__onceToken, &__block_literal_global_53);
    }
    id v4 = [(id)formattedBadgeNumberOrString__decimalFormatter stringFromNumber:v3];
  }
  else
  {
    id v4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;

    id v4 = v5;
  }
  if (![v4 length] || objc_msgSend(v4, "isEqualToString:", @"*"))
  {

    id v4 = 0;
  }

  return v4;
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBLeafIcon;
  [(SBIcon *)&v3 removeObserver:a3];
}

- (BOOL)isLaunchEnabled
{
  objc_super v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 iconAllowsLaunch:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (int64_t)progressState
{
  objc_super v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (id)[v3 progressStateForIcon:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    id v4 = [(SBIcon *)&v7 progressState];
  }
  int64_t v5 = (int64_t)v4;

  return v5;
}

- (double)progressPercent
{
  objc_super v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    [v3 progressPercentForIcon:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    [(SBIcon *)&v7 progressPercent];
  }
  double v5 = v4;

  return v5;
}

- (BOOL)isProgressPaused
{
  objc_super v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v4 = [v3 isProgressPausedForIcon:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    unsigned __int8 v4 = [(SBIcon *)&v7 isProgressPaused];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)isLaunchDisabledForObscuredReason
{
  objc_super v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 iconDisallowsLaunchForObscuredReason:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)displayNameForLocation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBLeafIcon *)self activeDataSource];
  char v6 = [v5 icon:self displayNameForLocation:v4];

  return v6;
}

- (id)statusDescriptionForLocation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 icon:self statusDescriptionForLocation:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBLeafIcon;
    uint64_t v6 = [(SBIcon *)&v9 statusDescriptionForLocation:v4];
  }
  objc_super v7 = (void *)v6;

  return v7;
}

- (BOOL)canTruncateLabel
{
  objc_super v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v4 = [v3 iconCanTruncateLabel:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    unsigned __int8 v4 = [(SBIcon *)&v7 canTruncateLabel];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)canTightenLabel
{
  objc_super v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v4 = [v3 iconCanTightenLabel:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    unsigned __int8 v4 = [(SBIcon *)&v7 canTightenLabel];
  }
  BOOL v5 = v4;

  return v5;
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBLeafIcon;
  [(SBIcon *)&v3 addObserver:a3];
}

- (id)leafIdentifier
{
  return self->_leafIdentifier;
}

- (void)_noteActiveDataSourceDidChangeAndReloadIcon:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBIcon *)self _notifyAccessoriesDidUpdate];
  [(SBIcon *)self _notifyLaunchEnabledDidChange];
  if (v3)
  {
    [(SBIcon *)self reloadIconImage];
  }
}

- (void)_noteActiveDataSourceDidChangeNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v4 = [a3 object];
  BOOL v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    objc_super v7 = NSStringFromClass(v6);
    objc_super v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    int v10 = 134218754;
    objc_super v11 = self;
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2112;
    v15 = v4;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@ Data source did change: %@ (%{public}@)", (uint8_t *)&v10, 0x2Au);
  }
  [(SBLeafIcon *)self _noteActiveDataSourceDidChangeAndReloadIcon:0];
}

- (BOOL)isLeafIcon
{
  return 1;
}

- (id)tags
{
  BOOL v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 tagsForIcon:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    uint64_t v4 = [(SBIcon *)&v7 tags];
  }
  BOOL v5 = (void *)v4;

  return v5;
}

- (BOOL)leafIdentifierAndApplicationBundleIDMatches
{
  leafIdentifier = self->_leafIdentifier;
  return leafIdentifier
      && self->_applicationBundleID
      && -[NSString isEqualToString:](leafIdentifier, "isEqualToString:");
}

- (BOOL)performLaunchFromLocation:(id)a3 context:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(SBLeafIcon *)self activeDataSource];
  objc_super v9 = SBLogIcon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "SBLeafIcon launchFromLocation:%@ context:%@ activeDataSource:%@", (uint8_t *)&v12, 0x20u);
  }

  if (objc_opt_respondsToSelector()) {
    char v10 = [v8 icon:self launchFromLocation:v6 context:v7];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (SBLeafIcon)init
{
  return 0;
}

- (SBLeafIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBLeafIcon;
  objc_super v8 = [(SBIcon *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    leafIdentifier = v8->_leafIdentifier;
    v8->_leafIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    applicationBundleID = v8->_applicationBundleID;
    v8->_applicationBundleID = (NSString *)v11;

    id v13 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    dataSources = v8->_dataSources;
    v8->_dataSources = v13;
  }
  return v8;
}

- (SBLeafIcon)initWithUniqueLeafIdentifier
{
  BOOL v3 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v4 = [v3 UUIDString];
  BOOL v5 = [(SBLeafIcon *)self initWithLeafIdentifier:v4 applicationBundleID:0];

  return v5;
}

- (void)dealloc
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
  [v3 removeObserver:self name:@"SBLeafIconDataSourceDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"SBLeafIconDataSourceDidGenerateImageNotification" object:0];
  [v3 removeObserver:self name:@"SBLeafIconDataSourceDidInvalidateNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBLeafIcon;
  [(SBLeafIcon *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(SBLeafIcon *)self copyWithLeafIdentifier:self->_leafIdentifier];
}

- (id)copyWithLeafIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLeafIdentifier:v4 applicationBundleID:self->_applicationBundleID];
  [v5 _setPropertiesFromIcon:self];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_dataSources;
  uint64_t v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addIconDataSource:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_setPropertiesFromIcon:(id)a3
{
  id v4 = (id *)a3;
  v7.receiver = self;
  v7.super_class = (Class)SBLeafIcon;
  [(SBIcon *)&v7 _setPropertiesFromIcon:v4];
  BOOL v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    objc_storeStrong((id *)&self->_dataSourceAtUninstallation, v4[13]);
  }
}

- (BOOL)hasObserver:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBLeafIcon;
  return [(SBIcon *)&v4 hasObserver:a3];
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__SBLeafIcon_enumerateObserversUsingBlock___block_invoke;
    v7[3] = &unk_1E6AB2510;
    id v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)SBLeafIcon;
    [(SBIcon *)&v6 enumerateObserversUsingBlock:v7];
  }
}

uint64_t __43__SBLeafIcon_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SBLeafIconDataSource)_bestDataSource
{
  manuallySetDataSource = self->_manuallySetDataSource;
  if (manuallySetDataSource)
  {
    BOOL v3 = manuallySetDataSource;
  }
  else
  {
    BOOL v3 = [(SBLeafIcon *)self _fallbackBestDataSource];
  }
  return v3;
}

- (SBLeafIconDataSource)_fallbackBestDataSource
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = self->_dataSources;
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    objc_super v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v6)
        {
          unint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "priorityForIcon:", self, (void)v13);
          if (v10 <= [v6 priorityForIcon:self]) {
            continue;
          }
        }
        id v11 = v9;

        objc_super v6 = v11;
      }
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    objc_super v6 = 0;
  }

  return (SBLeafIconDataSource *)v6;
}

- (void)performCoalescedDataSourceUpdate:(id)a3
{
  ++self->_coalescedDataSourceUpdates;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  unint64_t v4 = self->_coalescedDataSourceUpdates - 1;
  self->_coalescedDataSourceUpdates = v4;
  if (!v4)
  {
    [(SBLeafIcon *)self _updateActiveDataSource];
  }
}

- (void)_updateActiveDataSource
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_coalescedDataSourceUpdates)
  {
    BOOL v3 = [(SBLeafIcon *)self _bestDataSource];
    p_activeDataSource = &self->_activeDataSource;
    if (v3 != self->_activeDataSource)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
      objc_super v6 = *p_activeDataSource;
      if (*p_activeDataSource)
      {
        objc_msgSend(v5, "removeObserver:name:object:", self, @"SBLeafIconDataSourceDidChangeNotification");
        [v5 removeObserver:self name:@"SBLeafIconDataSourceDidGenerateImageNotification" object:*p_activeDataSource];
        uint64_t v7 = *p_activeDataSource;
        *p_activeDataSource = 0;
      }
      if (v3)
      {
        id v8 = SBLogIcon();
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

        unint64_t v10 = SBLogIcon();
        id v11 = v10;
        if (v9)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            long long v12 = *p_activeDataSource;
            int v15 = 138412802;
            long long v16 = (SBLeafIcon *)v12;
            __int16 v17 = 2112;
            uint64_t v18 = v3;
            __int16 v19 = 2112;
            v20 = self;
            _os_log_debug_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEBUG, "Changing active data source from %@ to %@: %@", (uint8_t *)&v15, 0x20u);
          }
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 138412290;
            long long v16 = self;
            _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Changing active data source: %@", (uint8_t *)&v15, 0xCu);
          }

          id v11 = SBLogIcon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            SBHUniqueIdentifierOfDataSource(v6);
            long long v13 = (SBLeafIcon *)objc_claimAutoreleasedReturnValue();
            SBHUniqueIdentifierOfDataSource(v3);
            long long v14 = (SBLeafIconDataSource *)objc_claimAutoreleasedReturnValue();
            int v15 = 138543618;
            long long v16 = v13;
            __int16 v17 = 2114;
            uint64_t v18 = v14;
            _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Changing from data souce: %{public}@ to data source:%{public}@.", (uint8_t *)&v15, 0x16u);
          }
        }

        objc_storeStrong((id *)&self->_activeDataSource, v3);
        [v5 addObserver:self selector:sel__noteActiveDataSourceDidChangeNotification_ name:@"SBLeafIconDataSourceDidChangeNotification" object:*p_activeDataSource];
        [v5 addObserver:self selector:sel__noteActiveDataSourceDidGenerateImageNotification_ name:@"SBLeafIconDataSourceDidGenerateImageNotification" object:*p_activeDataSource];
      }
      [(SBLeafIcon *)self didChangeActiveDataSource:v6];
      [(SBLeafIcon *)self _noteActiveDataSourceDidChangeAndReloadIcon:1];
    }
  }
}

- (void)didChangeActiveDataSource:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SBLeafIcon_didChangeActiveDataSource___block_invoke;
  v6[3] = &unk_1E6AB2538;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBLeafIcon *)self enumerateObserversUsingBlock:v6];
}

void __40__SBLeafIcon_didChangeActiveDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 leafIcon:*(void *)(a1 + 32) didChangeActiveDataSource:*(void *)(a1 + 40)];
  }
}

- (void)setActiveDataSource:(id)a3
{
  id v4 = (SBLeafIconDataSource *)a3;
  if (v4 && ([(NSMutableOrderedSet *)self->_dataSources containsObject:v4] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't set an active data source with a data source that isn't in the list" userInfo:0];
    objc_exception_throw(v6);
  }
  manuallySetDataSource = self->_manuallySetDataSource;
  self->_manuallySetDataSource = v4;

  [(SBLeafIcon *)self _updateActiveDataSource];
}

- (void)selectNextActiveDataSource
{
  id v6 = [(SBLeafIcon *)self iconDataSources];
  id v3 = [(SBLeafIcon *)self activeDataSource];
  unint64_t v4 = [v6 indexOfObject:v3] + 1;
  if (v4 >= [v6 count]) {
    [v6 firstObject];
  }
  else {
  id v5 = [v6 objectAtIndex:v4];
  }
  [(SBLeafIcon *)self setActiveDataSource:v5];
}

- (unint64_t)indexOfActiveDataSource
{
  id v3 = [(SBLeafIcon *)self activeDataSource];
  if (v3) {
    unint64_t v4 = [(NSMutableOrderedSet *)self->_dataSources indexOfObject:v3];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (void)addIconDataSource:(id)a3
{
  id v5 = a3;
  if (v5 && ([(NSMutableOrderedSet *)self->_dataSources containsObject:v5] & 1) == 0)
  {
    [(NSMutableOrderedSet *)self->_dataSources addObject:v5];
    [(SBLeafIcon *)self didAddIconDataSource:v5];
    unint64_t v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
    [v4 addObserver:self selector:sel__noteDataSourceDidInvalidateNotification_ name:@"SBLeafIconDataSourceDidInvalidateNotification" object:v5];
  }
  [(SBLeafIcon *)self _updateActiveDataSource];
}

- (void)addIconDataSources:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (v9
          && ([(NSMutableOrderedSet *)self->_dataSources containsObject:*(void *)(*((void *)&v11 + 1) + 8 * i)] & 1) == 0)
        {
          [(NSMutableOrderedSet *)self->_dataSources addObject:v9];
          [(SBLeafIcon *)self didAddIconDataSource:v9];
          unint64_t v10 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
          [v10 addObserver:self selector:sel__noteDataSourceDidInvalidateNotification_ name:@"SBLeafIconDataSourceDidInvalidateNotification" object:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(SBLeafIcon *)self _updateActiveDataSource];
}

- (void)insertIconDataSource:(id)a3 beforeIconDataSource:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9 && ([(NSMutableOrderedSet *)self->_dataSources containsObject:v9] & 1) == 0)
  {
    if (!v6
      || (uint64_t v7 = [(NSMutableOrderedSet *)self->_dataSources indexOfObject:v6],
          v7 == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v7 = 0;
    }
    [(NSMutableOrderedSet *)self->_dataSources insertObject:v9 atIndex:v7];
    [(SBLeafIcon *)self didAddIconDataSource:v9];
    id v8 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
    [v8 addObserver:self selector:sel__noteDataSourceDidInvalidateNotification_ name:@"SBLeafIconDataSourceDidInvalidateNotification" object:v9];
  }
  [(SBLeafIcon *)self _updateActiveDataSource];
}

- (void)insertIconDataSources:(id)a3 atIndexes:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[(NSMutableOrderedSet *)self->_dataSources copy];
  uint64_t v16 = v7;
  [(NSMutableOrderedSet *)self->_dataSources insertObjects:v6 atIndexes:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (([v8 containsObject:v14] & 1) == 0)
        {
          [(SBLeafIcon *)self didAddIconDataSource:v14];
          int v15 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
          [v15 addObserver:self selector:sel__noteDataSourceDidInvalidateNotification_ name:@"SBLeafIconDataSourceDidInvalidateNotification" object:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(SBLeafIcon *)self _updateActiveDataSource];
}

- (void)removeIconDataSource:(id)a3
{
  id v7 = (SBLeafIconDataSource *)a3;
  if ([(NSMutableOrderedSet *)self->_dataSources containsObject:v7])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
    [v4 removeObserver:self name:@"SBLeafIconDataSourceDidInvalidateNotification" object:v7];
    [(NSMutableOrderedSet *)self->_dataSources removeObject:v7];
    uint64_t v5 = v7;
    if (self->_activeDataSource == v7)
    {
      [v4 removeObserver:self name:@"SBLeafIconDataSourceDidChangeNotification" object:v7];
      [v4 removeObserver:self name:@"SBLeafIconDataSourceDidGenerateImageNotification" object:self->_activeDataSource];
      activeDataSource = self->_activeDataSource;
      self->_activeDataSource = 0;

      uint64_t v5 = v7;
    }
    if (self->_manuallySetDataSource == v5)
    {
      self->_manuallySetDataSource = 0;

      uint64_t v5 = v7;
    }
    [(SBLeafIcon *)self didRemoveIconDataSource:v5];
  }
  if (!self->_activeDataSource) {
    [(SBLeafIcon *)self _updateActiveDataSource];
  }
}

- (void)removeIconDataSourcesOfClass:(Class)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (void *)[(NSMutableOrderedSet *)self->_dataSources copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_isKindOfClass()) {
          [(SBLeafIcon *)self removeIconDataSource:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)removeIconDataSourcesPassingTest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = (void *)[(NSMutableOrderedSet *)self->_dataSources copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v10)) {
          [(SBLeafIcon *)self removeIconDataSource:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)removeAllIconDataSources
{
  for (uint64_t i = self; [(SBLeafIcon *)self iconDataSourceCount]; self = i)
  {
    uint64_t v3 = [(SBLeafIcon *)i firstIconDataSource];
    if (!v3) {
      break;
    }
    id v4 = (void *)v3;
    [(SBLeafIcon *)i removeIconDataSource:v3];
  }
}

- (void)replaceIconDataSource:(id)a3 withIconDataSource:(id)a4
{
  uint64_t v6 = (SBLeafIconDataSource *)a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6
    && v7
    && ([(NSMutableOrderedSet *)self->_dataSources containsObject:v7] & 1) == 0
    && [(NSMutableOrderedSet *)self->_dataSources containsObject:v6])
  {
    uint64_t v9 = [(SBLeafIcon *)self activeDataSource];

    uint64_t v10 = [(NSMutableOrderedSet *)self->_dataSources indexOfObject:v6];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v10;
    }
    [(NSMutableOrderedSet *)self->_dataSources insertObject:v8 atIndex:v11];
    long long v12 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
    [v12 addObserver:self selector:sel__noteDataSourceDidInvalidateNotification_ name:@"SBLeafIconDataSourceDidInvalidateNotification" object:v8];
    [v12 removeObserver:self name:@"SBLeafIconDataSourceDidInvalidateNotification" object:v6];
    [(NSMutableOrderedSet *)self->_dataSources removeObject:v6];
    if (self->_activeDataSource == v6)
    {
      [v12 removeObserver:self name:@"SBLeafIconDataSourceDidChangeNotification" object:v6];
      [v12 removeObserver:self name:@"SBLeafIconDataSourceDidGenerateImageNotification" object:self->_activeDataSource];
      activeDataSource = self->_activeDataSource;
      self->_activeDataSource = 0;
    }
    if (self->_manuallySetDataSource == v6)
    {
      self->_manuallySetDataSource = 0;
    }
    [(SBLeafIcon *)self didReplaceIconDataSource:v6 withIconDataSource:v8];
    if (v9 == v6)
    {
      long long v14 = SBLogIcon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "Activating data source due to icon replacement", v15, 2u);
      }

      [(SBLeafIcon *)self setActiveDataSource:v8];
    }
  }
  if (!self->_activeDataSource) {
    [(SBLeafIcon *)self _updateActiveDataSource];
  }
}

- (void)notifyObserversOfAddedIconDataSource:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBLeafIcon_notifyObserversOfAddedIconDataSource___block_invoke;
  v6[3] = &unk_1E6AB2538;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBLeafIcon *)self enumerateObserversUsingBlock:v6];
}

void __51__SBLeafIcon_notifyObserversOfAddedIconDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 leafIcon:*(void *)(a1 + 32) didAddIconDataSource:*(void *)(a1 + 40)];
  }
}

- (void)notifyObserversOfRemovedIconDataSource:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SBLeafIcon_notifyObserversOfRemovedIconDataSource___block_invoke;
  v6[3] = &unk_1E6AB2538;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBLeafIcon *)self enumerateObserversUsingBlock:v6];
}

void __53__SBLeafIcon_notifyObserversOfRemovedIconDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 leafIcon:*(void *)(a1 + 32) didRemoveIconDataSource:*(void *)(a1 + 40)];
  }
}

- (void)didReplaceIconDataSource:(id)a3 withIconDataSource:(id)a4
{
  id v6 = a4;
  [(SBLeafIcon *)self notifyObserversOfRemovedIconDataSource:a3];
  [(SBLeafIcon *)self notifyObserversOfAddedIconDataSource:v6];
}

- (NSArray)iconDataSources
{
  return (NSArray *)[(NSMutableOrderedSet *)self->_dataSources array];
}

- (SBLeafIconDataSource)firstIconDataSource
{
  return (SBLeafIconDataSource *)[(NSMutableOrderedSet *)self->_dataSources firstObject];
}

- (SBLeafIconDataSource)lastIconDataSource
{
  return (SBLeafIconDataSource *)[(NSMutableOrderedSet *)self->_dataSources lastObject];
}

- (unint64_t)iconDataSourceCount
{
  return [(NSMutableOrderedSet *)self->_dataSources count];
}

- (BOOL)hasIconDataSource:(id)a3
{
  return [(NSMutableOrderedSet *)self->_dataSources containsObject:a3];
}

- (id)iconDataSourcesOfClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_dataSources;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v4, "addObject:", v10, (void)v12);
        }
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)firstIconDataSourceOfClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_dataSources;
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)firstIconDataSourceWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SBLeafIcon_firstIconDataSourceWithUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E6AB2560;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(SBLeafIcon *)self firstIconDataSourcePassingTest:v8];

  return v6;
}

uint64_t __54__SBLeafIcon_firstIconDataSourceWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 uniqueIdentifier];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)firstIconDataSourcePassingTest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_dataSources;
  id v6 = (id)[(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_noteActiveDataSourceDidGenerateImageNotification:(id)a3
{
  id v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SBLeafIcon _noteActiveDataSourceDidGenerateImageNotification:]();
  }

  [(SBIcon *)self reloadIconImage];
}

- (void)_noteDataSourceDidInvalidateNotification:(id)a3
{
  id v4 = [a3 object];
  [(SBLeafIcon *)self removeIconDataSource:v4];
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  long long v12 = [(SBLeafIcon *)self activeDataSource];
  if (!v12)
  {
    long long v13 = SBLogIcon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SBLeafIcon generateIconImageWithInfo:]();
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v12, "icon:imageWithInfo:", self, v10, v9, v8, v7),
        (long long v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v16.receiver = self;
    v16.super_class = (Class)SBLeafIcon;
    long long v14 = -[SBIcon generateIconImageWithInfo:](&v16, sel_generateIconImageWithInfo_, v10, v9, v8, v7);
  }

  return v14;
}

- (id)makeIconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  long long v15 = a3;
  objc_super v16 = [(SBLeafIcon *)self activeDataSource];
  if (!v16)
  {
    uint64_t v17 = SBLogIcon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[SBLeafIcon makeIconImageWithInfo:traitCollection:options:]();
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = objc_msgSend(v16, "icon:imageWithInfo:traitCollection:options:", self, v15, a4, v13, v12, v11, v10);
    goto LABEL_7;
  }
  if (a4)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v18 = objc_msgSend(v16, "icon:imageWithInfo:", self, v13, v12, v11, v10);
LABEL_7:
      long long v19 = (void *)v18;
      if (v18) {
        goto LABEL_15;
      }
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = objc_msgSend(v16, "icon:unmaskedImageWithInfo:", self, v13, v12, v11, v10);
    goto LABEL_7;
  }
  v21.receiver = self;
  v21.super_class = (Class)SBLeafIcon;
  long long v19 = -[SBIcon makeIconImageWithInfo:traitCollection:options:](&v21, sel_makeIconImageWithInfo_traitCollection_options_, v15, a4, v13, v12, v11, v10);
LABEL_15:

  return v19;
}

- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  long long v15 = a3;
  objc_super v16 = [(SBLeafIcon *)self activeDataSource];
  if (!v16)
  {
    uint64_t v17 = SBLogIcon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[SBLeafIcon makeIconImageWithInfo:traitCollection:options:]();
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v16, "icon:layerWithInfo:traitCollection:options:", self, v15, a4, v13, v12, v11, v10),
        (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v20.receiver = self;
    v20.super_class = (Class)SBLeafIcon;
    uint64_t v18 = -[SBIcon makeIconLayerWithInfo:traitCollection:options:](&v20, sel_makeIconLayerWithInfo_traitCollection_options_, v15, a4, v13, v12, v11, v10);
  }

  return v18;
}

- (BOOL)canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  long long v15 = a3;
  objc_super v16 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v17 = objc_msgSend(v16, "icon:canMakeIconLayerQuicklyWithInfo:traitCollection:options:", self, v15, a4, v13, v12, v11, v10);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBLeafIcon;
    unsigned __int8 v17 = -[SBIcon canMakeIconLayerQuicklyWithInfo:traitCollection:options:](&v20, sel_canMakeIconLayerQuicklyWithInfo_traitCollection_options_, v15, a4, v13, v12, v11, v10);
  }
  BOOL v18 = v17;

  return v18;
}

- (void)prepareToMakeLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  long long v15 = a3;
  objc_super v16 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v16, "icon:prepareToMakeLayerWithInfo:traitCollection:options:", self, v15, a4, v13, v12, v11, v10);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBLeafIcon;
    -[SBIcon prepareToMakeLayerWithInfo:traitCollection:options:](&v17, sel_prepareToMakeLayerWithInfo_traitCollection_options_, v15, a4, v13, v12, v11, v10);
  }
}

- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  double v12 = [(SBLeafIcon *)self activeDataSource];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v12, "icon:defaultImageWithInfo:", self, v10, v9, v8, v7),
        (double v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBLeafIcon;
    double v13 = -[SBIcon genericIconImageWithInfo:](&v15, sel_genericIconImageWithInfo_, v10, v9, v8, v7);
  }

  return v13;
}

- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  double v12 = [(SBLeafIcon *)self activeDataSource];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v12, "icon:unmaskedImageWithInfo:", self, v10, v9, v8, v7),
        (double v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBLeafIcon;
    double v13 = -[SBIcon unmaskedIconImageWithInfo:](&v15, sel_unmaskedIconImageWithInfo_, v10, v9, v8, v7);
  }

  return v13;
}

- (BOOL)canGenerateIconsInBackground
{
  double v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v4 = [v3 canGenerateIconsInBackgroundForIcon:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    unsigned __int8 v4 = [(SBIcon *)&v7 canGenerateIconsInBackground];
  }
  BOOL v5 = v4;

  return v5;
}

- (id)supportedGridSizeClasses
{
  double v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 supportedGridSizeClassesForIcon:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    uint64_t v4 = [(SBIcon *)&v7 supportedGridSizeClasses];
  }
  BOOL v5 = (void *)v4;

  return v5;
}

- (id)folderTitleOptions
{
  double v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 folderTitleOptionsForIcon:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    uint64_t v4 = [(SBIcon *)&v7 folderTitleOptions];
  }
  BOOL v5 = (void *)v4;

  return v5;
}

- (id)folderFallbackTitle
{
  double v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 folderFallbackTitleForIcon:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    uint64_t v4 = [(SBIcon *)&v7 folderFallbackTitle];
  }
  BOOL v5 = (void *)v4;

  return v5;
}

- (id)iTunesCategoriesOrderedByRelevancy
{
  double v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 iTunesCategoriesOrderedByRelevancyForIcon:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    uint64_t v4 = [(SBIcon *)&v7 iTunesCategoriesOrderedByRelevancy];
  }
  BOOL v5 = (void *)v4;

  return v5;
}

- (BOOL)isUninstallSupported
{
  double v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 iconSupportsUninstall:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setUninstalled
{
  v5.receiver = self;
  v5.super_class = (Class)SBLeafIcon;
  [(SBIcon *)&v5 setUninstalled];
  double v3 = [(SBLeafIcon *)self activeDataSource];
  dataSourceAtUninstallation = self->_dataSourceAtUninstallation;
  self->_dataSourceAtUninstallation = v3;
}

- (void)completeUninstall
{
  v4.receiver = self;
  v4.super_class = (Class)SBLeafIcon;
  [(SBIcon *)&v4 completeUninstall];
  if (objc_opt_respondsToSelector()) {
    [(SBLeafIconDataSource *)self->_dataSourceAtUninstallation iconCompleteUninstall:self];
  }
  dataSourceAtUninstallation = self->_dataSourceAtUninstallation;
  self->_dataSourceAtUninstallation = 0;
}

- (id)displayNameForObscuredDisabledLaunchForLocation:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 icon:self displayNameForObscuredDisabledLaunchForLocation:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBLeafIcon;
    uint64_t v6 = [(SBIcon *)&v9 displayNameForObscuredDisabledLaunchForLocation:v4];
  }
  objc_super v7 = (void *)v6;

  return v7;
}

- (BOOL)supportsRasterization
{
  double v3 = [(SBLeafIcon *)self activeDataSource];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v4 = [v3 iconSupportsRasterization:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    unsigned __int8 v4 = [(SBIcon *)&v7 supportsRasterization];
  }
  BOOL v5 = v4;

  return v5;
}

+ (id)iconImageForDataSource:(id)a3 ofIcon:(id)a4 info:(SBIconImageInfo *)a5
{
  double v9 = v8;
  double v10 = v7;
  double v11 = v6;
  double v12 = v5;
  id v15 = a3;
  id v16 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v15, "icon:imageWithInfo:", v16, v12, v11, v10, v9),
        (objc_super v17 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_opt_respondsToSelector())
    {
      BOOL v18 = objc_msgSend(v15, "icon:unmaskedImageWithInfo:", v16, v12, v11, v10, v9);
      if (v18)
      {
        objc_super v17 = objc_msgSend(a1, "iconImageFromUnmaskedImage:info:", v18, v12, v11, v10, v9);
      }
      else
      {
        objc_super v17 = 0;
      }
    }
    else
    {
      objc_super v17 = 0;
    }
  }

  return v17;
}

+ (id)iconLayerForDataSource:(id)a3 ofIcon:(id)a4 info:(SBIconImageInfo *)a5 traitCollection:(id)a6 options:(unint64_t)a7
{
  double v13 = v10;
  double v14 = v9;
  double v15 = v8;
  double v16 = v7;
  id v18 = a3;
  id v19 = a4;
  objc_super v20 = a5;
  if (objc_opt_respondsToSelector())
  {
    objc_super v21 = objc_msgSend(v18, "icon:layerWithInfo:traitCollection:options:", v19, v20, a6, v16, v15, v14, v13);
  }
  else
  {
    objc_super v21 = 0;
  }

  return v21;
}

uint64_t __43__SBLeafIcon_formattedBadgeNumberOrString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)formattedBadgeNumberOrString__decimalFormatter;
  formattedBadgeNumberOrString__decimalFormatter = (uint64_t)v0;

  v2 = (void *)formattedBadgeNumberOrString__decimalFormatter;
  double v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  unsigned __int8 v4 = (void *)formattedBadgeNumberOrString__decimalFormatter;
  return [v4 setNumberStyle:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceAtUninstallation, 0);
  objc_storeStrong((id *)&self->_manuallySetDataSource, 0);
  objc_storeStrong((id *)&self->_activeDataSource, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_leafIdentifier, 0);
}

- (NSString)sbh_iconLibraryItemIdentifier
{
  v2 = [(SBLeafIcon *)self leafIdentifier];
  unint64_t v3 = [v2 length];
  unsigned __int8 v4 = (void *)*MEMORY[0x1E4FB30E0];
  if (v3 > [(id)*MEMORY[0x1E4FB30E0] length] && objc_msgSend(v2, "hasPrefix:", v4))
  {
    uint64_t v5 = objc_msgSend(v2, "substringFromIndex:", objc_msgSend(v4, "length"));

    v2 = (void *)v5;
  }
  return (NSString *)v2;
}

- (void)_noteActiveDataSourceDidGenerateImageNotification:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "Data source did generate icon: %@", v2, v3, v4, v5, v6);
}

- (void)generateIconImageWithInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "No active data source when trying to generate image for icon: %@", v2, v3, v4, v5, v6);
}

- (void)makeIconImageWithInfo:traitCollection:options:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "No active data source when trying to generate layer for icon: %@", v2, v3, v4, v5, v6);
}

@end