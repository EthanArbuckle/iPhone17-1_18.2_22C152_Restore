@interface SBIconModel
+ (Class)applicationIconClass;
+ (Class)bookmarkClass;
+ (Class)bookmarkIconClass;
+ (id)currentLocaleDidChangeNotificationName;
+ (id)migratedIdentifierForLeafIdentifier:(id)a3;
- (BOOL)importState:(id)a3;
- (BOOL)isIconVisible:(id)a3;
- (BOOL)shouldAvoidCreatingIconForApplication:(id)a3;
- (BOOL)shouldAvoidPlacingIconOnFirstPage:(id)a3;
- (NSOrderedSet)cachedFlattenedForecastedDesiredIconState;
- (id)addApplication:(id)a3;
- (id)addBookmarkIconForWebClip:(id)a3;
- (id)applicationIconForBundleIdentifier:(id)a3;
- (id)applicationWithBundleIdentifier:(id)a3;
- (id)bookmarkIconForWebClipIdentifier:(id)a3;
- (id)exportFlattenedState:(BOOL)a3 includeMissingIcons:(BOOL)a4;
- (id)exportPendingState:(BOOL)a3 includeMissingIcons:(BOOL)a4;
- (id)exportState:(BOOL)a3;
- (id)forecastedLayoutForIconState:(id)a3 includeMissingIcons:(BOOL)a4;
- (id)indexPathForIconInPlatformState:(id)a3;
- (id)modernizeRootArchive:(id)a3;
- (void)_replaceAppIconsWithDownloadingIcons;
- (void)_replaceAppIconsWithDownloadingIcons:(id)a3;
- (void)adjustIconsToShow:(id)a3 iconsToHide:(id)a4 afterChangeToVisibleIconTags:(id)a5 hiddenIconTags:(id)a6;
- (void)clearDesiredIconStateWithOptions:(unint64_t)a3;
- (void)loadAllIcons;
- (void)setCachedFlattenedForecastedDesiredIconState:(id)a3;
- (void)willLayout;
@end

@implementation SBIconModel

- (BOOL)isIconVisible:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBIconModel;
    if ([(SBHIconModel *)&v10 isIconVisible:v4])
    {
      if (![v4 isBookmarkIcon]
        || ([(SBHIconModel *)self hiddenIconTags],
            v5 = objc_claimAutoreleasedReturnValue(),
            int v6 = [v5 containsObject:@"com.apple.webapp"],
            v5,
            !v6))
      {
        BOOL v8 = 1;
        goto LABEL_10;
      }
      v7 = SBLogIcon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v4;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Icon is not visible: %{public}@ / WebAppBundle", buf, 0xCu);
      }
    }
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (id)applicationIconForBundleIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconModel;
  v3 = [(SBHIconModel *)&v5 applicationIconForBundleIdentifier:a3];
  return v3;
}

- (void)adjustIconsToShow:(id)a3 iconsToHide:(id)a4 afterChangeToVisibleIconTags:(id)a5 hiddenIconTags:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)SBIconModel;
  [(SBHIconModel *)&v28 adjustIconsToShow:v10 iconsToHide:v11 afterChangeToVisibleIconTags:v12 hiddenIconTags:v13];
  if (!self->_createsIconsForInternalApps
    && [v12 containsObject:@"SBInternalAppTag"])
  {
    id v23 = v11;
    self->_createsIconsForInternalApps = 1;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v14 = [(SBHIconModel *)self applicationDataSource];
    v15 = [v14 allApplicationsForIconModel:self];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
          v21 = (void *)MEMORY[0x1D948C4D0]();
          if ([v20 isInternalApplication])
          {
            v22 = [(SBIconModel *)self addApplication:v20];
            if ([(SBIconModel *)self isIconVisible:v22]) {
              [v10 addObject:v22];
            }
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v17);
    }

    id v11 = v23;
  }
}

- (id)bookmarkIconForWebClipIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconModel;
  v3 = [(SBHIconModel *)&v5 bookmarkIconForWebClipIdentifier:a3];
  return v3;
}

+ (Class)bookmarkIconClass
{
  return (Class)self;
}

+ (Class)bookmarkClass
{
  return (Class)self;
}

- (id)addBookmarkIconForWebClip:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconModel;
  v3 = [(SBHIconModel *)&v5 addBookmarkIconForWebClip:a3];
  return v3;
}

+ (Class)applicationIconClass
{
  return (Class)self;
}

- (id)addApplication:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconModel;
  v3 = [(SBHIconModel *)&v5 addApplication:a3];
  return v3;
}

- (BOOL)shouldAvoidCreatingIconForApplication:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBIconModel;
  unsigned __int8 v5 = [(SBHIconModel *)&v12 shouldAvoidCreatingIconForApplication:v4];
  int v6 = self;
  if (objc_opt_isKindOfClass())
  {
    v7 = [v4 info];
  }
  else
  {
    v7 = 0;
  }

  if (v5) {
    goto LABEL_5;
  }
  if (self->_createsIconsForInternalApps) {
    goto LABEL_11;
  }
  v9 = [v7 tags];
  if (([v9 containsObject:@"SBInternalAppTag"] & 1) == 0)
  {

    goto LABEL_11;
  }
  uint64_t v10 = [v7 visibilityOverride];

  if (v10)
  {
LABEL_11:
    char v8 = [v7 hasHiddenTag];
    goto LABEL_12;
  }
LABEL_5:
  char v8 = 1;
LABEL_12:

  return v8;
}

- (void)loadAllIcons
{
  v3.receiver = self;
  v3.super_class = (Class)SBIconModel;
  [(SBHIconModel *)&v3 loadAllIcons];
  self->_iconsHaveBeenLoadedOnce = 1;
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SBHIconModel *)self applicationDataSource];
  int v6 = [v5 iconModel:self applicationWithBundleIdentifier:v4];

  return v6;
}

- (id)indexPathForIconInPlatformState:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 application];
  if [v5 isSystemApplication] && (objc_msgSend(v5, "isRestoringIcon"))
  {
    int v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconModel;
    int v6 = [(SBHIconModel *)&v8 indexPathForIconInPlatformState:v4];
  }

  return v6;
}

- (BOOL)shouldAvoidPlacingIconOnFirstPage:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 application];
  if ([v5 isRestoringIcon])
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconModel;
    BOOL v6 = [(SBHIconModel *)&v8 shouldAvoidPlacingIconOnFirstPage:v4];
  }

  return v6;
}

- (void)_replaceAppIconsWithDownloadingIcons
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(SBHIconModel *)self rootFolder];
  unsigned __int8 v5 = [v4 leafIcons];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 leafIdentifier];
        objc_super v12 = [(SBHIconModel *)self leafIconForIdentifier:v11];

        if (!v12
          && [v10 isApplicationIcon]
          && [v10 hasApplication])
        {
          id v13 = [v10 application];
          v14 = [v13 bundleIdentifier];
          [v3 setObject:v10 forKey:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v3 count]) {
    [(SBIconModel *)self _replaceAppIconsWithDownloadingIcons:v3];
  }
}

- (void)_replaceAppIconsWithDownloadingIcons:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unsigned __int8 v5 = [(SBHIconModel *)self applicationDataSource];
  uint64_t v6 = [v5 allApplicationPlaceholdersForIconModel:self];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v16 = self;
    char v17 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_super v12 = objc_msgSend(v11, "applicationBundleID", v16);
        if (v12)
        {
          id v13 = [v4 objectForKey:v12];
          if ([v13 isApplicationIcon]
            && ([v13 hasApplicationPlaceholder] & 1) == 0)
          {
            v14 = (void *)MEMORY[0x1E4F78060];
            long long v15 = [NSString stringWithFormat:@"Added placeholder icon to icon list."];
            char v17 = 1;
            [v14 logStep:3 byParty:10 phase:3 success:1 forBundleID:v12 description:v15];

            [v13 replaceIconDataSourcesWithApplicationPlaceholder:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);

    if (v17) {
      [(SBHIconModel *)v16 saveIconStateIfNeeded];
    }
  }
  else
  {
  }
}

- (void)willLayout
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconModel;
  [(SBHIconModel *)&v7 willLayout];
  objc_super v3 = [(SBHIconModel *)self rootFolder];
  if ([v3 isEmpty])
  {
  }
  else
  {
    id v4 = [(SBHIconModel *)self applicationDataSource];
    unsigned __int8 v5 = [v4 allApplicationPlaceholdersForIconModel:self];
    uint64_t v6 = [v5 count];

    if (v6) {
      [(SBIconModel *)self _replaceAppIconsWithDownloadingIcons];
    }
  }
}

+ (id)currentLocaleDidChangeNotificationName
{
  return @"SBCurrentLocaleDidChangeNotification";
}

- (void)clearDesiredIconStateWithOptions:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBIconModel;
  [(SBHIconModel *)&v4 clearDesiredIconStateWithOptions:a3];
  [(SBIconModel *)self setCachedFlattenedForecastedDesiredIconState:0];
}

- (id)forecastedLayoutForIconState:(id)a3 includeMissingIcons:(BOOL)a4
{
  id v6 = a3;
  if (self->_iconsHaveBeenLoadedOnce)
  {
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4FA6418]) initWithCurrentState:v6 desiredState:v6];
    uint64_t v8 = [SBIconModel alloc];
    uint64_t v9 = [(SBHIconModel *)self applicationDataSource];
    uint64_t v10 = [(SBHIconModel *)v8 initWithStore:v7 applicationDataSource:v9];

    id v11 = [(SBHIconModel *)self delegate];
    [(SBHIconModel *)v10 setDelegate:v11];

    if (a4)
    {
      objc_super v12 = +[SBIconStateArchiver leafIdentifiersFromArchive:v6];
      [(SBHIconModel *)self setForecastedLeavesOnIconModel:v10 includingMissingIcons:v12];
    }
    else
    {
      [(SBHIconModel *)self setForecastedLeavesOnIconModel:v10 includingMissingIcons:0];
    }
    long long v15 = [(SBHIconModel *)self visibleIconTags];
    long long v16 = [(SBHIconModel *)self hiddenIconTags];
    [(SBHIconModel *)v10 setVisibilityOfIconsWithVisibleTags:v15 hiddenTags:v16];

    [(SBHIconModel *)v10 layout];
    char v17 = [(SBHIconModel *)self iconModelMetadata];
    id v14 = +[SBIconStateArchiver archiveRootFolderInModel:v10 metadata:v17];
  }
  else
  {
    id v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBIconModel forecastedLayoutForIconState:includeMissingIcons:](v13);
    }

    id v14 = v6;
  }

  return v14;
}

- (id)exportState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v5 = [(SBHIconModel *)self iconModelMetadata];
  id v6 = +[SBIconStateArchiver archiveRootFolderInModel:self metadata:v5];
  objc_super v7 = +[SBIconStateArchiver iTunesRepresentationFromRootArchive:v6 preApex:!v3 pending:0 iconSource:self];

  uint64_t v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "%@: exported state: %@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (id)exportPendingState:(BOOL)a3 includeMissingIcons:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v7 = [(SBHIconModel *)self desiredIconState];
  if (v7)
  {
    uint64_t v8 = [(SBIconModel *)self forecastedLayoutForIconState:v7 includeMissingIcons:v4];
  }
  else
  {
    uint64_t v9 = [(SBHIconModel *)self iconModelMetadata];
    uint64_t v8 = +[SBIconStateArchiver archiveRootFolderInModel:self metadata:v9];
  }
  int v10 = +[SBIconStateArchiver iTunesRepresentationFromRootArchive:v8 preApex:!v5 pending:v7 != 0 iconSource:self];
  id v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    long long v16 = v10;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "%@: exported pending state: %@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (id)exportFlattenedState:(BOOL)a3 includeMissingIcons:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_8;
  }
  BOOL v5 = a4;
  if (![(SBHIconModel *)self hasDesiredIconState]) {
    goto LABEL_8;
  }
  id v6 = [(SBIconModel *)self cachedFlattenedForecastedDesiredIconState];
  if (!v6)
  {
    objc_super v7 = [(SBHIconModel *)self desiredIconState];
    uint64_t v8 = [(SBIconModel *)self forecastedLayoutForIconState:v7 includeMissingIcons:v5];

    if (v8)
    {
      id v6 = +[SBIconStateArchiver leafIdentifiersFromArchive:v8];
    }
    else
    {
      id v6 = 0;
    }
    [(SBIconModel *)self setCachedFlattenedForecastedDesiredIconState:v6];

    if (!v6)
    {
LABEL_8:
      uint64_t v9 = [(SBHIconModel *)self iconModelMetadata];
      int v10 = +[SBIconStateArchiver archiveRootFolderInModel:self metadata:v9];
      id v6 = +[SBIconStateArchiver leafIdentifiersFromArchive:v10];
    }
  }
  id v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    __int16 v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "%@: exported flattened icon state: %@", (uint8_t *)&v14, 0x16u);
  }

  __int16 v12 = [v6 array];

  return v12;
}

- (BOOL)importState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = +[SBIconStateArchiver rootArchiveFromITunesRepresentation:v4];
    id v6 = +[SBIconStateArchiver modernizeRootArchive:v5];

    if (!v6)
    {
LABEL_9:
      BOOL v13 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_super v7 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
    id v6 = v4;
    if (!v6) {
      goto LABEL_9;
    }
  }
  uint64_t v9 = [(SBHIconModel *)self iconState];
  int v10 = [MEMORY[0x1E4FA62C8] iconStateByReplacingTodayListsInIconState:v6 withTodayListsFromIconState:v9];
  [(SBHIconModel *)self importIconState:v10];
  id v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = [(SBHIconModel *)self desiredIconState];
    int v15 = 138412546;
    __int16 v16 = self;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "%@: icon state imported: %@", (uint8_t *)&v15, 0x16u);
  }
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (id)modernizeRootArchive:(id)a3
{
  return +[SBIconStateArchiver modernizeRootArchive:a3];
}

+ (id)migratedIdentifierForLeafIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)migratedIdentifierForLeafIdentifier____bundleIDChanges;
  if (!migratedIdentifierForLeafIdentifier____bundleIDChanges)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"com.apple.camera", @"com.apple.mobileslideshow-Camera", @"com.apple.mobileslideshow", @"com.apple.mobileslideshow-Photos", @"com.apple.tv", @"com.apple.mobileipod-VideoPlayer", @"com.apple.Music", @"com.apple.mobileipod-MediaPlayer", @"com.apple.Music", @"com.apple.mobileipod-AudioPlayer", @"com.apple.Music", @"com.apple.mobileipod", @"com.apple.Passbook", @"com.apple.Shoebox", @"com.apple.tv", @"com.apple.videos", @"com.apple.shortcuts",
           @"is.workflow.my.app",
           @"com.apple.findmy",
           @"com.apple.mobileme.fmip1",
           0);
    id v6 = (void *)migratedIdentifierForLeafIdentifier____bundleIDChanges;
    migratedIdentifierForLeafIdentifier____bundleIDChanges = v5;

    id v4 = (void *)migratedIdentifierForLeafIdentifier____bundleIDChanges;
  }
  objc_super v7 = [v4 objectForKey:v3];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:v3];
    id v11 = (void *)v10;
    if (v10) {
      __int16 v12 = (void *)v10;
    }
    else {
      __int16 v12 = v3;
    }
    id v9 = v12;
  }
  return v9;
}

- (NSOrderedSet)cachedFlattenedForecastedDesiredIconState
{
  return self->_cachedFlattenedForecastedDesiredIconState;
}

- (void)setCachedFlattenedForecastedDesiredIconState:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)forecastedLayoutForIconState:(os_log_t)log includeMissingIcons:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Icons are not loaded (no _leafIconsByIdentifier) when calling forecastedLayoutForIconState!", v1, 2u);
}

@end