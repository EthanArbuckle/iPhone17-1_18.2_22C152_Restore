@interface SBHIconModel
+ (Class)applicationIconClass;
+ (Class)bookmarkClass;
+ (Class)bookmarkIconClass;
+ (Class)iconClassForApplicationWithBundleIdentifier:(id)a3;
+ (id)allWebClips;
+ (id)currentLocaleDidChangeNotificationName;
+ (id)defaultApplicationDataSource;
+ (id)migratedIdentifierForLeafIdentifier:(id)a3;
- (BOOL)_saveIconState:(id)a3 error:(id *)a4;
- (BOOL)_saveIconStateWithError:(id *)a3;
- (BOOL)_shouldSkipAddingIcon:(id)a3 toRootFolder:(id)a4;
- (BOOL)addIcon:(id)a3 toDesignatedLocationBasedOnOtherRootFolder:(id)a4 toRootFolder:(id)a5 options:(unint64_t)a6 listGridCellInfoOptions:(unint64_t)a7;
- (BOOL)addIcon:(id)a3 toDesignatedLocationInRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6;
- (BOOL)addIcon:(id)a3 toIgnoredListIfNecessaryBasedOnOtherRootFolder:(id)a4 toRootFolder:(id)a5 options:(unint64_t)a6 listGridCellInfoOptions:(unint64_t)a7;
- (BOOL)addIconToDesignatedLocation:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5;
- (BOOL)addIconToDesignatedLocationBasedOnDefaultIconState:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6;
- (BOOL)addIconToDesignatedLocationBasedOnDelegate:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6;
- (BOOL)addIconToDesignatedLocationBasedOnDesiredIconState:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6;
- (BOOL)addIconToIgnoredListBasedOnDefaultIconState:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6;
- (BOOL)automaticallyAddsApplicationPlaceholders;
- (BOOL)automaticallyAddsApplications;
- (BOOL)automaticallyAddsWebClips;
- (BOOL)deleteIconState;
- (BOOL)deleteIconStateWithOptions:(unint64_t)a3;
- (BOOL)hasAnyDirtyModelObjects;
- (BOOL)hasDesiredIconState;
- (BOOL)iconStateUnarchiver:(id)a3 listsAllowRotatedLayoutForFolderClass:(Class)a4;
- (BOOL)ignoresIconsNotInIconState;
- (BOOL)isCheckingModelConsistency;
- (BOOL)isIconStateDirty;
- (BOOL)isIconVisible:(id)a3;
- (BOOL)isLayingOut;
- (BOOL)isRestoring;
- (BOOL)isTrackingIcon:(id)a3;
- (BOOL)listsAllowRotatedLayoutForFolderClass:(Class)a3;
- (BOOL)postsDidAddIconNotification;
- (BOOL)saveIconStateIfNeeded;
- (BOOL)shouldAvoidCreatingIconForApplication:(id)a3;
- (BOOL)shouldAvoidPlacingIconOnFirstPage:(id)a3;
- (BOOL)shouldPlaceIconOnIgnoredList:(id)a3;
- (BOOL)sortsIconsAlphabetically;
- (BSInvalidatable)installedWebClipsObservation;
- (Class)iconClassForApplicationWithBundleIdentifier:(id)a3;
- (NSDictionary)defaultIconState;
- (NSDictionary)desiredIconState;
- (NSOrderedSet)desiredIconStateFlattened;
- (NSSet)archivedLeafIdentifiers;
- (NSSet)hiddenIconTags;
- (NSSet)leafIconIdentifiers;
- (NSSet)leafIcons;
- (NSSet)leafIconsUniquedByApplicationBundleIdentifier;
- (NSSet)missingDesiredIconIdentifiers;
- (NSSet)visibleIconIdentifiers;
- (NSSet)visibleIconTags;
- (NSSet)visibleLeafIcons;
- (NSString)description;
- (NSString)listRotatedLayoutClusterGridSizeClass;
- (NSString)localizedDefaultFolderName;
- (NSString)unlocalizedDefaultFolderName;
- (NSTimer)autosaveTimer;
- (SBHIconGridSize)iconStateUnarchiver:(id)a3 listGridSizeForFolderClass:(Class)a4;
- (SBHIconGridSize)iconStateUnarchiver:(id)a3 listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a4;
- (SBHIconGridSize)listGridSizeForFolderClass:(Class)a3;
- (SBHIconGridSize)listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a3;
- (SBHIconGridSizeClassDomain)gridSizeClassDomain;
- (SBHIconGridSizeClassSet)rootFolderAllowedGridSizeClasses;
- (SBHIconGridSizeClassSizeMap)gridSizeClassSizes;
- (SBHIconModel)init;
- (SBHIconModel)initWithStore:(id)a3;
- (SBHIconModel)initWithStore:(id)a3 applicationDataSource:(id)a4;
- (SBHIconModelApplicationDataSource)applicationDataSource;
- (SBHIconModelDelegate)delegate;
- (SBIcon)rootFolderIcon;
- (SBIconModelStore)store;
- (SBIconModelStore)todayListsStore;
- (SBRootFolder)cachedDefaultRootFolder;
- (SBRootFolder)cachedDesiredRootFolder;
- (SBRootFolder)rootFolder;
- (SBSHomeScreenService)homeScreenService;
- (id)_adjustedDesiredIndexPathInRootFolder:(id)a3 forIconWithIdentifier:(id)a4;
- (id)_adjustedIndexPathInRootFolder:(id)a3 withinIconState:(id)a4 forIconWithIdentifier:(id)a5;
- (id)_adjustedPlatformIndexPathInRootFolder:(id)a3 forIcon:(id)a4;
- (id)_unarchiveRootFolderWithLayoutStatus:(int64_t *)a3;
- (id)addAdditionalIconMatchingIcon:(id)a3;
- (id)addApplication:(id)a3;
- (id)addApplication:(id)a3 force:(BOOL)a4;
- (id)addApplicationPlaceholder:(id)a3;
- (id)addBookmarkIconForWebClip:(id)a3;
- (id)allowedGridSizeClassesForDock;
- (id)allowedGridSizeClassesForFolderClass:(Class)a3;
- (id)allowedGridSizeClassesForTodayList;
- (id)applicationIconForBundleIdentifier:(id)a3;
- (id)applicationIconsForBundleIdentifier:(id)a3;
- (id)applicationWithBundleIdentifier:(id)a3;
- (id)archiver:(id)a3 representationForIcon:(id)a4;
- (id)archiver:(id)a3 representationForIconDataSource:(id)a4;
- (id)bookmarkIconForWebClipIdentifier:(id)a3;
- (id)bookmarkIconForWebClipPlaceholderBundleIdentifier:(id)a3;
- (id)customGridSizeClassDomain;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)desiredIndexPathForIconWithIdentifier:(id)a3;
- (id)disableIconStateAutosaveForReason:(id)a3;
- (id)expectedIconForDisplayIdentifier:(id)a3;
- (id)expectedIconForDisplayIdentifier:(id)a3 createIfNecessary:(BOOL)a4;
- (id)iconModelMetadata;
- (id)iconState;
- (id)iconStateUnarchiver:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4;
- (id)iconStateUnarchiver:(id)a3 didUnarchiveWidgetIcon:(id)a4;
- (id)iconStateUnarchiver:(id)a3 iconDataSourceForRepresentation:(id)a4;
- (id)iconStateUnarchiver:(id)a3 iconForRepresentation:(id)a4;
- (id)iconStateUnarchiver:(id)a3 supportedGridSizeClassesForWidgetWithKind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6;
- (id)iconsOfClass:(Class)a3;
- (id)indexPathForIconInPlatformState:(id)a3;
- (id)indexPathForNewIcon:(id)a3 isDesignatedLocation:(BOOL *)a4 replaceExistingIconAtIndexPath:(id *)a5;
- (id)indexPathInRootFolder:(id)a3 forNewIcon:(id)a4 isDesignatedLocation:(BOOL *)a5 replaceExistingIconAtIndexPath:(id *)a6;
- (id)leafIconContainingDataSourceWithIdentifier:(id)a3;
- (id)leafIconForIdentifier:(id)a3;
- (id)leafIconsForIdentifiers:(id)a3;
- (id)leafIconsForIdentifiers:(id)a3 notFoundMarker:(id)a4;
- (id)localizedFolderNameForDefaultDisplayName:(id)a3;
- (id)makeFolderWithDisplayName:(id)a3;
- (id)makeFolderWithDisplayName:(id)a3 uniqueIdentifier:(id)a4;
- (id)modernizeRootArchive:(id)a3;
- (id)removeApplication:(id)a3;
- (id)removeApplication:(id)a3 pruneEmptyIcons:(BOOL)a4;
- (id)removeApplicationPlaceholder:(id)a3;
- (id)removeApplicationWithBundleIdentifier:(id)a3;
- (id)removeApplicationWithBundleIdentifier:(id)a3 pruneEmptyIcons:(BOOL)a4;
- (id)rotatedGridSizeClassSizes;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)supportedGridSizeClassesForWidgetWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5;
- (id)unarchivedRootFolderForAddingIconFromOtherIconState:(id)a3;
- (id)versionForIconStateArchiver:(id)a3;
- (id)widgetIconForLeafIdentifier:(id)a3;
- (id)widgetIcons;
- (id)widgetIconsContainingWidgetsMatchingExtensionBundleIdentifier:(id)a3 kind:(id)a4 sizeClass:(int64_t)a5;
- (id)widgetIconsContainingWidgetsMatchingUniqueIdentifier:(id)a3;
- (int64_t)_getLoadedIconState:(id *)a3 error:(id *)a4;
- (int64_t)iconStateUnarchiver:(id)a3 listsFixedIconLocationBehaviorForFolderClass:(Class)a4;
- (int64_t)lastLayoutStatus;
- (int64_t)listsFixedIconLocationBehaviorForFolderClass:(Class)a3;
- (unint64_t)iconStateUnarchiver:(id)a3 listsIconLayoutBehaviorForFolderClass:(Class)a4;
- (unint64_t)listsIconLayoutBehaviorForFolderClass:(Class)a3;
- (unint64_t)maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a3;
- (unint64_t)maxColumnCountForTodayList;
- (unint64_t)maxIconCountForDock;
- (unint64_t)maxListCountForFolders;
- (unint64_t)maxRowCountForFavoriteTodayList;
- (unint64_t)maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a3;
- (void)_addHiddenAppsToIgnoredListForRootFolder:(id)a3;
- (void)_checkRemovedIcons;
- (void)_noteApplicationIconImageChanged:(id)a3;
- (void)_noteRemovedIcons:(id)a3;
- (void)_removeIconStateAutosaveDisableAssertion:(id)a3;
- (void)_rootFolder:(id)a3 moveIconsToFirstPage:(id)a4 placeBumpedIconsSomewhereNice:(id)a5;
- (void)_saveIconState;
- (void)_setUpIconRunLoopObserver;
- (void)_tearDownDiscardCachedOtherRootFoldersRunloopObserverIfNeeded;
- (void)_tearDownIconRunloopObserverIfNeeded;
- (void)addIcon:(id)a3;
- (void)addIconsOfClass:(Class)a3 toSet:(id)a4;
- (void)checkModelConsistency;
- (void)checkModelConsistencyInRootFolder:(id)a3 listGridCellInfoOptions:(unint64_t)a4;
- (void)checkModelConsistencyWithListGridCellInfoOptions:(unint64_t)a3;
- (void)clearDesiredIconState;
- (void)clearDesiredIconStateIfPossible;
- (void)clearDesiredIconStateWithOptions:(unint64_t)a3;
- (void)dealloc;
- (void)discardCachedOtherRootFolders;
- (void)enumerateApplicationIconsForBundleIdentifier:(id)a3 usingBlock:(id)a4;
- (void)enumerateLeafIconsUsingBlock:(id)a3;
- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5;
- (void)folder:(id)a3 didAddList:(id)a4;
- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)folder:(id)a3 willAddIcon:(id)a4;
- (void)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5;
- (void)iconModelApplicationDataSource:(id)a3 applicationPlaceholdersAdded:(id)a4;
- (void)iconModelApplicationDataSource:(id)a3 applicationPlaceholdersRemoved:(id)a4;
- (void)iconModelApplicationDataSource:(id)a3 applicationsAdded:(id)a4;
- (void)iconModelApplicationDataSource:(id)a3 applicationsRemoved:(id)a4;
- (void)iconModelApplicationDataSource:(id)a3 applicationsUpdated:(id)a4;
- (void)iconWantsUninstall:(id)a3;
- (void)importDesiredIconState:(id)a3;
- (void)importIconState:(id)a3;
- (void)installedWebClipsDidChange;
- (void)layout;
- (void)layoutIfNeeded;
- (void)loadAllIcons;
- (void)loadDesiredIconState;
- (void)localeChanged;
- (void)markIconStateClean;
- (void)markIconStateDirty;
- (void)reloadIcons;
- (void)removeAllIcons;
- (void)removeApplicationIconsForBundleIdentifier:(id)a3;
- (void)removeIcon:(id)a3;
- (void)removeIcon:(id)a3 shouldRemoveFromRootFolder:(BOOL)a4;
- (void)removeIconForIdentifier:(id)a3;
- (void)removeIcons:(id)a3;
- (void)saveDesiredIconState;
- (void)saveIconStateIfNeeded;
- (void)scheduleDiscardOfCachedOtherRootFolders;
- (void)scheduleIconStateAutosave;
- (void)setArchivedLeafIdentifiers:(id)a3;
- (void)setAutomaticallyAddsApplicationPlaceholders:(BOOL)a3;
- (void)setAutomaticallyAddsApplications:(BOOL)a3;
- (void)setAutomaticallyAddsWebClips:(BOOL)a3;
- (void)setAutosaveTimer:(id)a3;
- (void)setCachedDefaultRootFolder:(id)a3;
- (void)setCachedDesiredRootFolder:(id)a3;
- (void)setCheckingModelConsistency:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredIconState:(id)a3;
- (void)setDesiredIconStateFlattened:(id)a3;
- (void)setForecastedLeavesOnIconModel:(id)a3 includingMissingIcons:(id)a4;
- (void)setIconStateDirty:(BOOL)a3;
- (void)setIgnoresIconsNotInIconState:(BOOL)a3;
- (void)setInstalledWebClipsObservation:(id)a3;
- (void)setLastLayoutStatus:(int64_t)a3;
- (void)setLayingOut:(BOOL)a3;
- (void)setLeafIconsByIdentifier:(id)a3;
- (void)setPostsDidAddIconNotification:(BOOL)a3;
- (void)setRestoring:(BOOL)a3;
- (void)setRootFolderAllowedGridSizeClasses:(id)a3;
- (void)setRootFolderIcon:(id)a3;
- (void)setSortsIconsAlphabetically:(BOOL)a3;
- (void)setStore:(id)a3;
- (void)setTodayListsStore:(id)a3;
- (void)setVisibilityOfIconsWithVisibleTags:(id)a3 hiddenTags:(id)a4;
- (void)updateExistingBookmarkIcon:(id)a3 forUpdatedWebClip:(id)a4;
@end

@implementation SBHIconModel

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (id)expectedIconForDisplayIdentifier:(id)a3
{
  return [(SBHIconModel *)self expectedIconForDisplayIdentifier:a3 createIfNecessary:0];
}

- (id)expectedIconForDisplayIdentifier:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(SBHIconModel *)self leafIconForIdentifier:v6];
  if (!v7 && v4)
  {
    v8 = [(SBHIconModel *)self applicationDataSource];
    v9 = [v8 iconModel:self applicationWithBundleIdentifier:v6];

    if (v9)
    {
      v7 = [(SBHIconModel *)self addApplication:v9 force:1];
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (id)leafIconForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_leafIconsByIdentifier objectForKey:v4];
    if (!v5)
    {
      v5 = [(NSMutableDictionary *)self->_widgetIconsByIdentifier objectForKey:v4];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __51__SBHIconModel_applicationIconForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 leafIdentifierAndApplicationBundleIDMatches];
}

- (id)applicationIconForBundleIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_applicationIconsByBundleIdentifier objectForKey:a3];
  id v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_127);
    if (v6) {
      goto LABEL_8;
    }
    id v7 = [v3 anyObject];
    goto LABEL_6;
  }
  if (v3)
  {
    id v7 = v3;
LABEL_6:
    id v6 = v7;
    goto LABEL_8;
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)isIconVisible:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = objc_msgSend(v4, "tags", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if ([(NSSet *)self->_hiddenIconTags containsObject:v10]
          || ![(NSSet *)self->_visibleIconTags containsObject:v10])
        {
          v11 = SBLogIcon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v26 = v4;
            __int16 v27 = 2114;
            uint64_t v28 = v10;
            _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_INFO, "Icon is not visible due to tag: %{public}@/%{public}@", buf, 0x16u);
          }
          goto LABEL_18;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (![v4 isApplicationIcon])
  {
    BOOL v16 = 1;
    goto LABEL_20;
  }
  v5 = [v4 applicationBundleID];
  v11 = [v4 application];
  v12 = [(SBHIconModel *)self hiddenIconTags];
  int v13 = [v12 containsObject:v5];

  if (v13)
  {
    v14 = SBLogIcon();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412290;
    id v26 = v5;
    v15 = "Icon is not visible because bundle identifier is in hidden tags: %@ / app icon";
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v11 hasHiddenTag])
  {
    v14 = SBLogIcon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      v15 = "Icon is not visible due to hidden tag: %@";
LABEL_14:
      _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (objc_opt_respondsToSelector())
  {
    v18 = [v11 tags];
    int v19 = [v18 containsObject:@"hidden"];

    if (v19)
    {
      v14 = SBLogIcon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v5;
        v15 = "Icon is not visible due to hidden tag: %@";
        goto LABEL_14;
      }
LABEL_15:

LABEL_18:
      BOOL v16 = 0;
      goto LABEL_19;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v11 isAppClip])
  {
    v14 = SBLogIcon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      v15 = "App clip icon is not visible: %@ / app clip icon";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v14 = [v4 applicationPlaceholder];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v14 isAppClip])
  {
    v20 = SBLogIcon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_INFO, "Downloading icon for app clip is not visible: %@", buf, 0xCu);
    }

    goto LABEL_15;
  }

  BOOL v16 = 1;
LABEL_19:

LABEL_20:
  return v16;
}

- (NSSet)hiddenIconTags
{
  return self->_hiddenIconTags;
}

- (NSSet)leafIcons
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(NSMutableDictionary *)self->_leafIconsByIdentifier allValues];
  v5 = [v3 setWithArray:v4];

  uint64_t v6 = [(NSMutableDictionary *)self->_widgetIconsByIdentifier allValues];
  [v5 addObjectsFromArray:v6];

  return (NSSet *)v5;
}

- (SBHIconModel)initWithStore:(id)a3 applicationDataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SBHIconModel;
  v9 = [(SBHIconModel *)&v31 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_applicationDataSource, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    leafIconsByIdentifier = v10->_leafIconsByIdentifier;
    v10->_leafIconsByIdentifier = v11;

    int v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    widgetIconsByIdentifier = v10->_widgetIconsByIdentifier;
    v10->_widgetIconsByIdentifier = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    applicationIconsByBundleIdentifier = v10->_applicationIconsByBundleIdentifier;
    v10->_applicationIconsByBundleIdentifier = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    additionalApplicationIconIdentifiers = v10->_additionalApplicationIconIdentifiers;
    v10->_additionalApplicationIconIdentifiers = v17;

    uint64_t v19 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    folders = v10->_folders;
    v10->_folders = (NSHashTable *)v19;

    *(_WORD *)&v10->_automaticallyAddsApplications = 257;
    v10->_automaticallyAddsApplicationPlaceholders = 1;
    uint64_t v21 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
    rootFolderAllowedGridSizeClasses = v10->_rootFolderAllowedGridSizeClasses;
    v10->_rootFolderAllowedGridSizeClasses = (SBHIconGridSizeClassSet *)v21;

    v10->_postsDidAddIconNotification = 1;
    if (objc_opt_respondsToSelector()) {
      [v8 addIconModelApplicationDataSourceObserver:v10];
    }
    if ((__sb__runningInSpringBoard() & 1) == 0)
    {
      long long v23 = (SBSHomeScreenService *)objc_alloc_init(MEMORY[0x1E4FA6AC8]);
      homeScreenService = v10->_homeScreenService;
      v10->_homeScreenService = v23;

      uint64_t v25 = [(SBSHomeScreenService *)v10->_homeScreenService addInstalledWebClipsObserver:v10];
      installedWebClipsObservation = v10->_installedWebClipsObservation;
      v10->_installedWebClipsObservation = (BSInvalidatable *)v25;
    }
    __int16 v27 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v27 addObserver:v10 selector:sel__noteApplicationIconImageChanged_ name:@"com.apple.LaunchServices.applicationIconChanged" object:0];

    uint64_t v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v29 = [(id)objc_opt_class() currentLocaleDidChangeNotificationName];
    [v28 addObserver:v10 selector:sel_localeChanged name:v29 object:0];
  }
  return v10;
}

- (SBHIconModel)initWithStore:(id)a3
{
  return [(SBHIconModel *)self initWithStore:a3 applicationDataSource:0];
}

- (SBHIconModel)init
{
  v3 = [(id)objc_opt_class() defaultApplicationDataSource];
  id v4 = [(SBHIconModel *)self initWithStore:0 applicationDataSource:v3];

  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v5 = [(id)objc_opt_class() currentLocaleDidChangeNotificationName];
  [v4 removeObserver:self name:v5 object:0];

  [(BSInvalidatable *)self->_installedWebClipsObservation invalidate];
  [(SBHIconModel *)self _tearDownIconRunloopObserverIfNeeded];
  [(SBHIconModel *)self _tearDownDiscardCachedOtherRootFoldersRunloopObserverIfNeeded];
  v6.receiver = self;
  v6.super_class = (Class)SBHIconModel;
  [(SBHIconModel *)&v6 dealloc];
}

+ (id)defaultApplicationDataSource
{
  v2 = objc_alloc_init(SBHApplicationDataSource);
  return v2;
}

- (void)reloadIcons
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBIconModelWillReloadIconsNotification" object:self userInfo:0];

  [(SBHIconModel *)self removeAllIcons];
  [(SBHIconModel *)self loadAllIcons];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"SBIconModelDidReloadIconsNotification" object:self userInfo:0];
}

- (void)loadAllIcons
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([(SBHIconModel *)self automaticallyAddsWebClips])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v3 = [(id)objc_opt_class() allWebClips];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v36;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v36 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v35 + 1) + 8 * v7);
          v9 = (void *)MEMORY[0x1D9484600]();
          id v10 = [(SBHIconModel *)self addBookmarkIconForWebClip:v8];
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v5);
    }
  }
  if ([(SBHIconModel *)self automaticallyAddsApplications])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v11 = [(SBHIconModelApplicationDataSource *)self->_applicationDataSource allApplicationsForIconModel:self];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * v15);
          v17 = (void *)MEMORY[0x1D9484600]();
          id v18 = [(SBHIconModel *)self addApplication:v16];
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v13);
    }
  }
  if ([(SBHIconModel *)self automaticallyAddsApplicationPlaceholders])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v19 = -[SBHIconModelApplicationDataSource allApplicationPlaceholdersForIconModel:](self->_applicationDataSource, "allApplicationPlaceholdersForIconModel:", self, 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * v23);
          uint64_t v25 = (void *)MEMORY[0x1D9484600]();
          id v26 = [(SBHIconModel *)self addApplicationPlaceholder:v24];
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v21);
    }
  }
}

+ (Class)applicationIconClass
{
  return (Class)self;
}

+ (Class)iconClassForApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.mobiletimer"]
    || [v4 isEqualToString:@"com.apple.mobilecal"])
  {
    id v5 = self;
  }
  else
  {
    id v5 = (id)[a1 applicationIconClass];
  }
  uint64_t v6 = (objc_class *)v5;

  return v6;
}

- (Class)iconClassForApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(id)objc_opt_class() iconClassForApplicationWithBundleIdentifier:v4];
  uint64_t v6 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    id v5 = (void *)[v6 iconModel:self iconClassForApplicationWithBundleIdentifier:v4 proposedClass:v5];
  }
  uint64_t v7 = v5;

  return v7;
}

- (id)addApplication:(id)a3
{
  return [(SBHIconModel *)self addApplication:a3 force:0];
}

- (id)addApplication:(id)a3 force:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4 && [(SBHIconModel *)self shouldAvoidCreatingIconForApplication:v6])
  {
    uint64_t v7 = 0;
    goto LABEL_23;
  }
  uint64_t v8 = [v6 bundleIdentifier];
  v9 = [(SBHIconModel *)self applicationIconsForBundleIdentifier:v8];
  if ([v9 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "replaceIconDataSourcesWithApplication:", v6, (void)v21);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }
    v9 = v10;
    goto LABEL_22;
  }
  uint64_t v15 = [(SBHIconModel *)self iconClassForApplicationWithBundleIdentifier:v8];
  if (objc_opt_respondsToSelector())
  {
    id v16 = [v6 iconIdentifier];
  }
  else
  {
    id v16 = v8;
  }
  id v10 = v16;
  if (!v16)
  {
    id v18 = 0;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v17 = [[v15 alloc] initWithLeafIdentifier:v16 application:v6];
  id v18 = (void *)v17;
  if (!v8 || !v17) {
    goto LABEL_21;
  }
  [(SBHIconModel *)self addIcon:v17];
  uint64_t v25 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];

  v9 = (void *)v19;
LABEL_22:

  uint64_t v7 = [v9 firstObject];

LABEL_23:
  return v7;
}

- (BOOL)shouldAvoidCreatingIconForApplication:(id)a3
{
  return 0;
}

- (id)removeApplication:(id)a3
{
  id v4 = [a3 bundleIdentifier];
  id v5 = [(SBHIconModel *)self removeApplicationWithBundleIdentifier:v4];

  return v5;
}

- (id)removeApplication:(id)a3 pruneEmptyIcons:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 bundleIdentifier];
  uint64_t v7 = [(SBHIconModel *)self removeApplicationWithBundleIdentifier:v6 pruneEmptyIcons:v4];

  return v7;
}

- (id)removeApplicationWithBundleIdentifier:(id)a3
{
  return [(SBHIconModel *)self removeApplicationWithBundleIdentifier:a3 pruneEmptyIcons:0];
}

- (id)removeApplicationWithBundleIdentifier:(id)a3 pruneEmptyIcons:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = [(SBHIconModel *)self applicationIconsForBundleIdentifier:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v11 removeApplicationDataSources];
        if (v4 && ![v11 iconDataSourceCount]) {
          [(SBHIconModel *)self removeIcon:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  uint64_t v12 = [v6 firstObject];

  return v12;
}

- (void)_noteApplicationIconImageChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 userInfo];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"CFBundleIdentifier", objc_opt_class());
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = SBLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        uint64_t v9 = v6;
        _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "Reloading icon image for %@", (uint8_t *)&v8, 0xCu);
      }

      [(SBHIconModel *)self enumerateApplicationIconsForBundleIdentifier:v6 usingBlock:&__block_literal_global_3];
    }
  }
}

uint64_t __49__SBHIconModel__noteApplicationIconImageChanged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadIconImage];
}

+ (id)allWebClips
{
  return (id)[MEMORY[0x1E4FB1F10] clipsIncludingWebClips:1 includingAppClips:1];
}

+ (Class)bookmarkIconClass
{
  return (Class)self;
}

+ (Class)bookmarkClass
{
  return (Class)self;
}

- (id)bookmarkIconForWebClipIdentifier:(id)a3
{
  v3 = [(SBHIconModel *)self leafIconForIdentifier:a3];
  if ([v3 isBookmarkIcon]) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)bookmarkIconForWebClipPlaceholderBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__0;
  long long v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__SBHIconModel_bookmarkIconForWebClipPlaceholderBundleIdentifier___block_invoke;
  v8[3] = &unk_1E6AAD198;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(SBHIconModel *)self enumerateLeafIconsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __66__SBHIconModel_bookmarkIconForWebClipPlaceholderBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  int v7 = [v12 isBookmarkIcon];
  int v8 = v12;
  if (v7)
  {
    id v9 = v12;
    uint64_t v10 = [v9 bookmark];
    uint64_t v11 = [v10 placeholderBundleIdentifier];
    if ([v11 isEqualToString:*(void *)(a1 + 32)])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }

    int v8 = v12;
  }
}

- (id)addBookmarkIconForWebClip:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(SBHIconModel *)self bookmarkIconForWebClipIdentifier:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    int v8 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "bookmarkClass")), "initWithWebClip:", v4);
    id v7 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "bookmarkIconClass")), "initWithBookmark:", v8);
    [(SBHIconModel *)self addIcon:v7];
  }
  return v7;
}

- (void)updateExistingBookmarkIcon:(id)a3 forUpdatedWebClip:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "bookmarkClass")), "initWithWebClip:", v5);

  [v6 setBookmark:v7];
}

- (void)addIcon:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_1D7F0A000, "addIcon", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  [v4 setDelegate:self];
  [v4 addObserver:self];
  if ([v4 isLeafIcon])
  {
    id v6 = [v4 leafIdentifier];
    if (!v6)
    {
LABEL_27:

      goto LABEL_28;
    }
    if ([v4 isWidgetIcon])
    {
      id v7 = [(NSMutableDictionary *)self->_widgetIconsByIdentifier objectForKey:v6];
      [(NSMutableDictionary *)self->_widgetIconsByIdentifier setObject:v4 forKey:v6];
    }
    else
    {
      id v7 = [(NSMutableDictionary *)self->_leafIconsByIdentifier objectForKey:v6];
      [(NSMutableDictionary *)self->_leafIconsByIdentifier setObject:v4 forKey:v6];
    }
    if ([v4 isApplicationIcon])
    {
      int v8 = [v4 applicationBundleID];
      if (v8)
      {
        id v9 = [(NSMutableDictionary *)self->_applicationIconsByBundleIdentifier objectForKey:v8];
        uint64_t v10 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          [v9 addObject:v4];
        }
        else if (v9)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [v12 addObject:v9];
          [v12 addObject:v4];
          [(NSMutableDictionary *)self->_applicationIconsByBundleIdentifier setObject:v12 forKey:v8];
        }
        else
        {
          [(NSMutableDictionary *)self->_applicationIconsByBundleIdentifier setObject:v4 forKey:v8];
        }
        if (([v4 leafIdentifierAndApplicationBundleIDMatches] & 1) == 0)
        {
          additionalApplicationIconIdentifiers = self->_additionalApplicationIconIdentifiers;
          long long v14 = [v4 leafIdentifier];
          [(NSMutableSet *)additionalApplicationIconIdentifiers addObject:v14];
        }
      }
    }
    if (v7)
    {
      if (v7 == v4)
      {
LABEL_26:
        [(SBHIconModel *)self didAddIcon:v4];

        goto LABEL_27;
      }
      long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"icon"];
      [v15 postNotificationName:@"SBIconModelDidReplaceIconNotification" object:self userInfo:v16];
    }
    else
    {
      long long v15 = [(SBHIconModel *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v15 iconModel:self didAddIcon:v4];
      }
      if (![(SBHIconModel *)self postsDidAddIconNotification]) {
        goto LABEL_25;
      }
      id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"icon"];
      [v16 postNotificationName:@"SBIconModelDidAddIconNotification" object:self userInfo:v17];
    }
LABEL_25:

    goto LABEL_26;
  }
LABEL_28:
  if ([v4 isFolderIcon])
  {
    id v18 = [v4 folder];
    [v18 addFolderObserver:self];
    [(NSHashTable *)self->_folders addObject:v18];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __24__SBHIconModel_addIcon___block_invoke;
    v19[3] = &unk_1E6AAD1C0;
    v19[4] = self;
    [v18 enumerateAllIconsUsingBlock:v19];
  }
  os_activity_scope_leave(&state);
}

uint64_t __24__SBHIconModel_addIcon___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIcon:a2];
}

- (void)removeIcon:(id)a3
{
}

- (void)removeIcon:(id)a3 shouldRemoveFromRootFolder:(BOOL)a4
{
  BOOL v4 = a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v7 = _os_activity_create(&dword_1D7F0A000, "removeIcon", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  int v8 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 iconModel:self willRemoveIcon:v6];
  }
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v24 = @"icon";
  v25[0] = v6;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  [v9 postNotificationName:@"SBIconModelWillRemoveIconNotification" object:self userInfo:v10];

  uint64_t v11 = [v6 leafIdentifier];
  if (v4)
  {
    id v12 = [(SBHIconModel *)self rootFolder];
    [v12 removeIcon:v6 options:3145728];
  }
  if ([v6 isFolderIcon])
  {
    uint64_t v13 = [v6 folder];
    [v13 removeFolderObserver:self];
    [(NSHashTable *)self->_folders removeObject:v13];
  }
  long long v14 = [v6 delegate];
  BOOL v15 = v14 == self;

  if (v15) {
    [v6 setDelegate:0];
  }
  if (v11)
  {
    [(NSMutableDictionary *)self->_leafIconsByIdentifier removeObjectForKey:v11];
    [(NSMutableDictionary *)self->_widgetIconsByIdentifier removeObjectForKey:v11];
  }
  id v16 = [v6 applicationBundleID];
  if (v16)
  {
    long long v17 = [(NSMutableDictionary *)self->_applicationIconsByBundleIdentifier objectForKey:v16];
    id v18 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [v17 removeObject:v6];
      uint64_t v20 = [v17 count];
      if (v20)
      {
        if (v20 == 1)
        {
          applicationIconsByBundleIdentifier = self->_applicationIconsByBundleIdentifier;
          long long v22 = [v17 anyObject];
          [(NSMutableDictionary *)applicationIconsByBundleIdentifier setObject:v22 forKey:v16];
        }
        goto LABEL_18;
      }
    }
    else if (!v17)
    {
LABEL_18:

      goto LABEL_19;
    }
    [(NSMutableDictionary *)self->_applicationIconsByBundleIdentifier removeObjectForKey:v16];
    goto LABEL_18;
  }
LABEL_19:
  if (v11) {
    [(NSMutableSet *)self->_additionalApplicationIconIdentifiers removeObject:v11];
  }

  os_activity_scope_leave(&state);
}

- (void)removeIcons:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBHIconModel *)self removeIcon:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeIconForIdentifier:(id)a3
{
  id v4 = [(SBHIconModel *)self leafIconForIdentifier:a3];
  if (v4)
  {
    uint64_t v5 = v4;
    [(SBHIconModel *)self removeIcon:v4];
    id v4 = v5;
  }
}

- (void)removeAllIcons
{
  [(NSMutableDictionary *)self->_leafIconsByIdentifier removeAllObjects];
  [(NSMutableDictionary *)self->_widgetIconsByIdentifier removeAllObjects];
  [(NSMutableDictionary *)self->_applicationIconsByBundleIdentifier removeAllObjects];
  additionalApplicationIconIdentifiers = self->_additionalApplicationIconIdentifiers;
  [(NSMutableSet *)additionalApplicationIconIdentifiers removeAllObjects];
}

- (id)addAdditionalIconMatchingIcon:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Icon model preparing to add additional icon matching icon: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v6 = [v4 application];
  if (v6 && [(SBHIconModel *)self shouldAvoidCreatingIconForApplication:v6])
  {
    uint64_t v7 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = [v4 applicationBundleID];
  if (!v8)
  {
    uint64_t v7 = 0;
    goto LABEL_16;
  }
  long long v9 = [(SBHIconModel *)self rootFolder];
  if (![v4 isApplicationIcon]) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SBHIconModel *)self leafIconForIdentifier:v8];
  if (!v7
    || ([v9 ignoredList],
        long long v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 directlyContainsIcon:v7],
        v10,
        (v11 & 1) == 0))
  {

LABEL_11:
    long long v12 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v13 = [v12 UUIDString];

    uint64_t v7 = (void *)[v4 copyWithLeafIdentifier:v13];
    if (v7) {
      [(SBHIconModel *)self addIcon:v7];
    }
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    [(SBHIconModel *)self _noteRemovedIcons:v14];
  }
LABEL_16:

LABEL_17:
  return v7;
}

- (BOOL)isTrackingIcon:(id)a3
{
  id v4 = a3;
  if ([v4 isLeafIcon])
  {
    uint64_t v5 = [v4 leafIdentifier];
    uint64_t v6 = [(SBHIconModel *)self leafIconForIdentifier:v5];

    if (v6) {
      goto LABEL_5;
    }
  }
  if ([v4 isFolderIcon]
    && (folders = self->_folders,
        [v4 folder],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(folders) = [(NSHashTable *)folders containsObject:v8],
        v8,
        (folders & 1) != 0))
  {
LABEL_5:
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_checkRemovedIcons
{
  v3 = [(SBHIconModel *)self rootFolder];
  id v4 = [(SBHIconModel *)self delegate];
  char v5 = objc_opt_respondsToSelector();
  removedIcons = self->_removedIcons;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __34__SBHIconModel__checkRemovedIcons__block_invoke;
  BOOL v15 = &unk_1E6AAD1E8;
  int v16 = self;
  id v17 = v3;
  char v19 = v5 & 1;
  id v18 = v4;
  id v7 = v4;
  id v8 = v3;
  BOOL v9 = [(NSMutableSet *)removedIcons objectsPassingTest:&v12];
  long long v10 = objc_msgSend(v9, "allObjects", v12, v13, v14, v15, v16);
  [(SBHIconModel *)self removeIcons:v10];

  char v11 = self->_removedIcons;
  self->_removedIcons = 0;

  [(SBHIconModel *)self _tearDownIconRunloopObserverIfNeeded];
}

uint64_t __34__SBHIconModel__checkRemovedIcons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isTrackingIcon:v3]
    && ([*(id *)(a1 + 40) indexPathForIcon:v3 includingPlaceholders:1],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4)
    && [*(id *)(a1 + 32) isIconVisible:v3])
  {
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v5 = [*(id *)(a1 + 48) iconModel:*(void *)(a1 + 32) shouldRemoveIcon:v3];
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_noteRemovedIcons:(id)a3
{
  id v4 = a3;
  removedIcons = self->_removedIcons;
  id v8 = v4;
  if (!removedIcons)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_removedIcons;
    self->_removedIcons = v6;

    id v4 = v8;
    removedIcons = self->_removedIcons;
  }
  [(NSMutableSet *)removedIcons unionSet:v4];
  [(SBHIconModel *)self _setUpIconRunLoopObserver];
}

- (void)_setUpIconRunLoopObserver
{
  if (!self->_iconRunLoopObserver)
  {
    objc_initWeak(&location, self);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__SBHIconModel__setUpIconRunLoopObserver__block_invoke;
    v5[3] = &unk_1E6AAD210;
    objc_copyWeak(&v6, &location);
    self->_iconRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 1999900, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_iconRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __41__SBHIconModel__setUpIconRunLoopObserver__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkRemovedIcons];
}

- (void)_tearDownIconRunloopObserverIfNeeded
{
  iconRunLoopObserver = self->_iconRunLoopObserver;
  if (iconRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(iconRunLoopObserver);
    CFRelease(self->_iconRunLoopObserver);
    self->_iconRunLoopObserver = 0;
  }
}

- (unint64_t)maxListCountForFolders
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 maxListCountForFoldersForIconModel:self];
  }
  else {
    unint64_t v5 = 15;
  }

  return v5;
}

- (SBHIconGridSize)listGridSizeForFolderClass:(Class)a3
{
  unint64_t v5 = [(SBHIconModel *)self delegate];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 iconModel:self listGridSizeForFolderClass:a3];
    unsigned int v8 = v7 & 0xFFFF0000;
    int v9 = (unsigned __int16)v7;
  }
  else
  {
    unsigned int v8 = 196608;
    int v9 = 3;
  }

  return (SBHIconGridSize)(v8 | v9);
}

- (SBHIconGridSize)listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a3
{
  unint64_t v5 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v5 iconModel:self listWithNonDefaultSizedIconsGridSizeForFolderClass:a3];
    unsigned int v7 = v6 & 0xFFFF0000;
    int v8 = (unsigned __int16)v6;
  }
  else
  {
    int v8 = 0;
    unsigned int v7 = 0;
  }

  return (SBHIconGridSize)(v7 | v8);
}

- (unint64_t)maxIconCountForDock
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 maxIconCountForDockForIconModel:self];
  }
  else {
    unint64_t v4 = 4;
  }

  return v4;
}

- (unint64_t)maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a3
{
  unint64_t v5 = [(SBHIconModel *)self delegate];
  int v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 iconModel:self maxRowCountForListInRootFolderWithInterfaceOrientation:a3];
  }
  else {
    unint64_t v7 = 6;
  }

  return v7;
}

- (unint64_t)maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a3
{
  unint64_t v5 = [(SBHIconModel *)self delegate];
  int v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 iconModel:self maxColumnCountForListInRootFolderWithInterfaceOrientation:a3];
  }
  else {
    unint64_t v7 = 6;
  }

  return v7;
}

- (unint64_t)maxRowCountForFavoriteTodayList
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 maxRowCountForFavoriteTodayListForIconModel:self];
  }
  else {
    unint64_t v4 = 4;
  }

  return v4;
}

- (unint64_t)maxColumnCountForTodayList
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 maxColumnCountForTodayListForIconModel:self];
  }
  else {
    unint64_t v4 = 4;
  }

  return v4;
}

- (SBHIconGridSizeClassSizeMap)gridSizeClassSizes
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  unint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 gridSizeClassSizesForIconModel:self];
  }
  else
  {
    unint64_t v5 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  }
  int v6 = v5;

  return v6;
}

- (id)rotatedGridSizeClassSizes
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 rotatedGridSizeClassSizesForIconModel:self];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (NSString)listRotatedLayoutClusterGridSizeClass
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 listRotatedLayoutClusterGridSizeClassForIconModel:self];
  }
  else
  {
    unint64_t v4 = @"SBHIconGridSizeClassDefault";
  }
  unint64_t v5 = v4;

  return (NSString *)v5;
}

- (BOOL)listsAllowRotatedLayoutForFolderClass:(Class)a3
{
  unint64_t v5 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconModel:self listsAllowRotatedLayoutForFolderClass:a3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)allowedGridSizeClassesForFolderClass:(Class)a3
{
  unint64_t v5 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconModel:self allowedGridSizeClassesForFolderClass:a3];
  }
  else {
  char v6 = [(SBHIconModel *)self rootFolderAllowedGridSizeClasses];
  }

  return v6;
}

- (id)allowedGridSizeClassesForDock
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 allowedGridSizeClassesForDockForIconModel:self];
  }
  else {
  unint64_t v4 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
  }

  return v4;
}

- (id)allowedGridSizeClassesForTodayList
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 allowedGridSizeClassesForTodayListForIconModel:self];
  }
  else
  {
    unint64_t v5 = [SBHIconGridSizeClassSet alloc];
    char v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", 0);
    unint64_t v4 = [(SBHIconGridSizeClassSet *)v5 initWithGridSizeClasses:v6];
  }
  return v4;
}

- (id)supportedGridSizeClassesForWidgetWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 iconModel:self supportedGridSizeClassesForWidgetWithKind:v8 extensionBundleIdentifier:v9 containerBundleIdentifier:v10];
  }
  else {
  uint64_t v12 = +[SBHIconGridSizeClassSet gridSizeClassSetForAllNonDefaultGridSizeClasses];
  }

  return v12;
}

- (int64_t)listsFixedIconLocationBehaviorForFolderClass:(Class)a3
{
  unint64_t v5 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int64_t v6 = [v5 iconModel:self listsFixedIconLocationBehaviorForFolderClass:a3];
  }
  else {
    int64_t v6 = 1;
  }

  return v6;
}

- (unint64_t)listsIconLayoutBehaviorForFolderClass:(Class)a3
{
  unint64_t v5 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v6 = [v5 iconModel:self listsIconLayoutBehaviorForFolderClass:a3];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)customGridSizeClassDomain
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 gridSizeClassDomainForIconModel:self];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  v2 = [(SBHIconModel *)self customGridSizeClassDomain];
  if (!v2)
  {
    v2 = +[SBHIconGridSizeClassDomain globalDomain];
  }
  return (SBHIconGridSizeClassDomain *)v2;
}

- (void)enumerateLeafIconsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  leafIconsByIdentifier = self->_leafIconsByIdentifier;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__SBHIconModel_enumerateLeafIconsUsingBlock___block_invoke;
  v10[3] = &unk_1E6AAD238;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = &v13;
  [(NSMutableDictionary *)leafIconsByIdentifier enumerateKeysAndObjectsUsingBlock:v10];
  if (!*((unsigned char *)v14 + 24))
  {
    widgetIconsByIdentifier = self->_widgetIconsByIdentifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__SBHIconModel_enumerateLeafIconsUsingBlock___block_invoke_2;
    v8[3] = &unk_1E6AAD260;
    id v9 = v6;
    [(NSMutableDictionary *)widgetIconsByIdentifier enumerateKeysAndObjectsUsingBlock:v8];
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __45__SBHIconModel_enumerateLeafIconsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a4;
  return result;
}

uint64_t __45__SBHIconModel_enumerateLeafIconsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSSet)visibleLeafIcons
{
  CFAllocatorRef v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __32__SBHIconModel_visibleLeafIcons__block_invoke;
  id v11 = &unk_1E6AAD288;
  uint64_t v12 = self;
  id v4 = v3;
  id v13 = v4;
  unint64_t v5 = _Block_copy(&v8);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_leafIconsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v5, v8, v9, v10, v11, v12);
  [(NSMutableDictionary *)self->_widgetIconsByIdentifier enumerateKeysAndObjectsUsingBlock:v5];
  id v6 = (NSSet *)v4;

  return v6;
}

void __32__SBHIconModel_visibleLeafIcons__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconVisible:")) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (NSSet)leafIconsUniquedByApplicationBundleIdentifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  leafIconsByIdentifier = self->_leafIconsByIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SBHIconModel_leafIconsUniquedByApplicationBundleIdentifier__block_invoke;
  v7[3] = &unk_1E6AAD2B0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)leafIconsByIdentifier enumerateKeysAndObjectsUsingBlock:v7];

  return (NSSet *)v5;
}

void __61__SBHIconModel_leafIconsUniquedByApplicationBundleIdentifier__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v4 = [v7 applicationBundleID];
  if (!v4
    || (v5 = (void *)v4, int v6 = [v7 leafIdentifierAndApplicationBundleIDMatches], v5, v6))
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (id)leafIconsForIdentifiers:(id)a3
{
  return [(SBHIconModel *)self leafIconsForIdentifiers:a3 notFoundMarker:0];
}

- (id)leafIconsForIdentifiers:(id)a3 notFoundMarker:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = -[SBHIconModel leafIconForIdentifier:](self, "leafIconForIdentifier:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        uint64_t v15 = (void *)v14;
        if (v14 | v7)
        {
          if (v14) {
            uint64_t v16 = v14;
          }
          else {
            uint64_t v16 = v7;
          }
          [v8 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)applicationIconsForBundleIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMutableDictionary *)self->_applicationIconsByBundleIdentifier objectForKey:a3];
  uint64_t v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v3 allObjects];
LABEL_5:
    unint64_t v7 = (void *)v6;
    goto LABEL_6;
  }
  if (v3)
  {
    v9[0] = v3;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    goto LABEL_5;
  }
  unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_6:

  return v7;
}

- (void)enumerateApplicationIconsForBundleIdentifier:(id)a3 usingBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, uint64_t, char *))a4;
  unint64_t v7 = [(NSMutableDictionary *)self->_applicationIconsByBundleIdentifier objectForKey:a3];
  id v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
        char v16 = 0;
        v6[2](v6, v15, &v16);
        if (v16) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else if (v7)
  {
    char v16 = 0;
    v6[2](v6, (uint64_t)v7, &v16);
  }
}

- (void)removeApplicationIconsForBundleIdentifier:(id)a3
{
  id v4 = [(SBHIconModel *)self applicationIconsForBundleIdentifier:a3];
  [(SBHIconModel *)self removeIcons:v4];
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconModel *)self applicationDataSource];
  uint64_t v6 = [v5 iconModel:self applicationWithBundleIdentifier:v4];

  return v6;
}

- (id)widgetIcons
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(NSMutableDictionary *)self->_widgetIconsByIdentifier allValues];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)widgetIconForLeafIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_widgetIconsByIdentifier objectForKey:a3];
}

- (id)widgetIconsContainingWidgetsMatchingExtensionBundleIdentifier:(id)a3 kind:(id)a4 sizeClass:(int64_t)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v26 = (id)objc_opt_new();
  long long v31 = [(SBHIconModel *)self gridSizeClassDomain];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v28 = self;
  obj = self->_widgetIconsByIdentifier;
  uint64_t v29 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v39;
    id v32 = v9;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v11;
        uint64_t v12 = [(NSMutableDictionary *)v28->_widgetIconsByIdentifier objectForKey:*(void *)(*((void *)&v38 + 1) + 8 * v11)];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v33 = v12;
        uint64_t v13 = [v12 widgets];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (!v14) {
          goto LABEL_29;
        }
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            long long v19 = [v18 extensionBundleIdentifier];
            if (![v19 isEqualToString:v9]) {
              goto LABEL_23;
            }
            if (v10)
            {
              id v5 = [v18 kind];
              if (([v5 isEqualToString:v10] & 1) == 0)
              {

LABEL_23:
                continue;
              }
              if (!a5)
              {

LABEL_27:
                id v9 = v32;
LABEL_28:
                [v26 addObject:v33];
                goto LABEL_29;
              }
            }
            else if (!a5)
            {
              goto LABEL_27;
            }
            int64_t v20 = a5;
            long long v21 = [v33 gridSizeClass];
            uint64_t v22 = [v31 chsWidgetFamilyForIconGridSizeClass:v21];

            if (v10) {
            a5 = v20;
            }
            BOOL v23 = v22 == v20;
            id v9 = v32;
            if (v23) {
              goto LABEL_28;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v15) {
            continue;
          }
          break;
        }
LABEL_29:

        uint64_t v11 = v30 + 1;
      }
      while (v30 + 1 != v29);
      uint64_t v29 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v29);
  }

  return v26;
}

- (id)widgetIconsContainingWidgetsMatchingUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  widgetIconsByIdentifier = self->_widgetIconsByIdentifier;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__SBHIconModel_widgetIconsContainingWidgetsMatchingUniqueIdentifier___block_invoke;
  v12[3] = &unk_1E6AAD2F8;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(NSMutableDictionary *)widgetIconsByIdentifier enumerateKeysAndObjectsUsingBlock:v12];
  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __69__SBHIconModel_widgetIconsContainingWidgetsMatchingUniqueIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v4, "iconDataSources", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v10 uniqueIdentifier];
          int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

          if (v12)
          {
            [*(id *)(a1 + 40) addObject:v4];
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)leafIconContainingDataSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__0;
  long long v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SBHIconModel_leafIconContainingDataSourceWithIdentifier___block_invoke;
  v8[3] = &unk_1E6AAD198;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(SBHIconModel *)self enumerateLeafIconsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__SBHIconModel_leafIconContainingDataSourceWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v7 = [v8 firstIconDataSourceWithUniqueIdentifier:*(void *)(a1 + 32)];
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)addIconsOfClass:(Class)a3 toSet:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = [(NSMutableDictionary *)self->_leafIconsByIdentifier allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
        if (objc_opt_isKindOfClass()) {
          [v5 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v12 = [(NSMutableDictionary *)self->_widgetIconsByIdentifier allValues];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * v16);
        if (objc_opt_isKindOfClass()) {
          [v5 addObject:v17];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (id)iconsOfClass:(Class)a3
{
  id v5 = objc_opt_new();
  [(SBHIconModel *)self addIconsOfClass:a3 toSet:v5];
  return v5;
}

- (NSSet)leafIconIdentifiers
{
  uint64_t v3 = [(NSMutableDictionary *)self->_widgetIconsByIdentifier count];
  leafIconsByIdentifier = self->_leafIconsByIdentifier;
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1E4F1CA80];
    id v6 = [(NSMutableDictionary *)leafIconsByIdentifier allKeys];
    uint64_t v7 = [v5 setWithArray:v6];

    uint64_t v8 = [(NSMutableDictionary *)self->_widgetIconsByIdentifier allKeys];
    [v7 addObjectsFromArray:v8];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = [(NSMutableDictionary *)leafIconsByIdentifier allKeys];
    uint64_t v7 = [v9 setWithArray:v8];
  }

  return (NSSet *)v7;
}

- (BOOL)addIconToDesignatedLocation:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(SBHIconModel *)self rootFolder];
  LOBYTE(a5) = [(SBHIconModel *)self addIcon:v8 toDesignatedLocationInRootFolder:v9 options:a4 listGridCellInfoOptions:a5];

  return a5;
}

- (BOOL)addIcon:(id)a3 toDesignatedLocationInRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  int v12 = SBLogIcon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v39 = v10;
    _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "Icon model preparing to add icon: %{public}@", buf, 0xCu);
  }

  char v13 = [v11 containsIcon:v10];
  BOOL v14 = (v13 & 1) == 0
     && [v10 isLeafIcon]
     && [(SBHIconModel *)self shouldPlaceIconOnIgnoredList:v10];
  if ([v10 isLeafIcon]) {
    BOOL v15 = [(SBHIconModel *)self _shouldSkipAddingIcon:v10 toRootFolder:v11];
  }
  else {
    BOOL v15 = 0;
  }
  uint64_t v16 = [v11 ignoredList];
  char v17 = [v16 directlyContainsIcon:v10];

  if ((a5 & 4) != 0) {
    char v18 = 0;
  }
  else {
    char v18 = v13;
  }
  char v19 = v17 ^ 1;
  if ((a5 & 2) == 0) {
    char v19 = 1;
  }
  char v20 = v18 & v19;
  if ((v20 & 1) == 0 && !v15)
  {
    if ((a5 & 4) != 0) {
      char v19 = 0;
    }
    if ((v19 & 1) == 0) {
      [v11 removeIcon:v10 options:0];
    }
    if ([(SBHIconModel *)self addIconToDesignatedLocationBasedOnDelegate:v10 toRootFolder:v11 options:a5 listGridCellInfoOptions:a6])
    {
      long long v21 = SBLogIcon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v22 = "Added icon based on delegate";
LABEL_35:
        _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    if ([(SBHIconModel *)self addIconToDesignatedLocationBasedOnDesiredIconState:v10 toRootFolder:v11 options:a5 listGridCellInfoOptions:a6])
    {
      long long v21 = SBLogIcon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v22 = "Added icon based on desired icon state";
        goto LABEL_35;
      }
LABEL_36:

      goto LABEL_37;
    }
    if ([(SBHIconModel *)self addIconToIgnoredListBasedOnDefaultIconState:v10 toRootFolder:v11 options:a5 listGridCellInfoOptions:a6])
    {
      long long v21 = SBLogIcon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v22 = "Added icon to ignored list based on default icon state";
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    if (v14)
    {
      long long v24 = [v11 ignoredList];
      [v24 addIcon:v10];

      long long v21 = SBLogIcon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v22 = "Added icon to ignored list";
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    if ([v10 isApplicationIcon]
      && [v10 leafIdentifierAndApplicationBundleIDMatches])
    {
      id v26 = [v10 applicationBundleID];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __89__SBHIconModel_addIcon_toDesignatedLocationInRootFolder_options_listGridCellInfoOptions___block_invoke;
      v36[3] = &unk_1E6AAD320;
      long long v21 = v26;
      long long v37 = v21;
      uint64_t v27 = [v11 indexPathForIconPassingTest:v36];
      if (v27)
      {
        uint64_t v28 = [v11 iconAtIndexPath:v27];
        int v29 = [v11 replaceIcon:v28 withIcon:v10 options:0];

        if (v29)
        {
          uint64_t v30 = SBLogIcon();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D7F0A000, v30, OS_LOG_TYPE_DEFAULT, "Added icon replacing another icon", buf, 2u);
          }

          goto LABEL_36;
        }
      }
    }
    long long v21 = [v10 gridSizeClass];
    long long v31 = [v11 gridPathForFirstFreeSlotOfRangeOfSizeClass:v21 avoidingFirstList:1 listGridCellInfoOptions:a6];
    if (v31
      || (v32 = (id)[v11 addEmptyListRemovingLeastRecentlyHiddenListIfNecessary], objc_msgSend(v11, "gridPathForFirstFreeSlotOfRangeOfSizeClass:avoidingFirstList:listGridCellInfoOptions:", v21, 1, a6), (long long v31 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      long long v33 = [v11 insertIcon:v10 atGridPath:v31 options:16];
      char v34 = [v33 containsObject:v10];

      if ((v34 & 1) == 0)
      {
        long long v35 = SBLogIcon();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D7F0A000, v35, OS_LOG_TYPE_DEFAULT, "Added icon to the first free slot available", buf, 2u);
        }

        goto LABEL_36;
      }
    }

LABEL_25:
    BOOL v23 = 0;
    goto LABEL_40;
  }
  if ((v20 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_37:
  [(SBHIconModel *)self addIcon:v10];
  if (a5) {
    [(SBHIconModel *)self saveIconStateIfNeeded];
  }
  BOOL v23 = 1;
LABEL_40:

  return v23;
}

uint64_t __89__SBHIconModel_addIcon_toDesignatedLocationInRootFolder_options_listGridCellInfoOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isApplicationIcon]
    && ([v3 leafIdentifierAndApplicationBundleIDMatches] & 1) == 0)
  {
    id v5 = [v3 applicationBundleID];
    uint64_t v4 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)addIconToDesignatedLocationBasedOnDelegate:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v11 = [v10 iconModel:self customInsertionGridPathForIcon:v8 inRootFolder:v9];
    if (v11) {
      goto LABEL_6;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:
    LOBYTE(v12) = 0;
    goto LABEL_8;
  }
  int v12 = [v10 iconModel:self customInsertionRelativePathForIcon:v8 inRootFolder:v9];
  if (v12)
  {
    id v11 = [v9 gridPathForRelativePath:v12];

    if (v11)
    {
LABEL_6:
      id v13 = (id)[v9 insertIcon:v8 atGridPath:v11 options:0];

      LOBYTE(v12) = 1;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:

  return (char)v12;
}

- (id)unarchivedRootFolderForAddingIconFromOtherIconState:(id)a3
{
  id v4 = a3;
  id v5 = [[SBHIconStateUnarchiver alloc] initWithArchive:v4];

  id v6 = objc_alloc_init(SBHIconStateUnarchivingSlugIconSource);
  [(SBHIconStateUnarchiver *)v5 setIconSource:v6];
  [(SBHIconStateUnarchiver *)v5 setIconModel:self];
  uint64_t v7 = objc_alloc_init(SBHIconModelDesiredIconStateUnarchiverDelegate);
  [(SBHIconStateUnarchiver *)v5 setDelegate:v7];
  id v8 = [(SBHIconStateUnarchiver *)v5 unarchive];
  id v9 = [v8 rootFolder];

  return v9;
}

- (BOOL)addIcon:(id)a3 toDesignatedLocationBasedOnOtherRootFolder:(id)a4 toRootFolder:(id)a5 options:(unint64_t)a6 listGridCellInfoOptions:(unint64_t)a7
{
  char v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ((v8 & 2) == 0
    || ([v13 ignoredList],
        BOOL v15 = objc_claimAutoreleasedReturnValue(),
        [v12 nodeIdentifier],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v15 directlyContainsIconWithIdentifier:v16],
        v16,
        v15,
        (v17 & 1) == 0))
  {
    char v19 = [v12 uniqueIdentifier];
    char v20 = [v13 relativePathForIcon:v12 listGridCellInfoOptions:a7];
    long long v21 = [v13 indexPathForIconWithIdentifier:v19];
    long long v22 = v21;
    LOBYTE(v18) = 0;
    if (!v20 || !v21) {
      goto LABEL_29;
    }
    objc_msgSend(v21, "sb_indexPathByRemovingLastIconIndex");
    BOOL v23 = (SBFolderIcon *)objc_claimAutoreleasedReturnValue();
    v85 = v20;
    if ([v14 isValidIndexPath:v23]) {
      goto LABEL_20;
    }
    v78 = self;
    id v24 = [v13 folderContainingIndexPath:v22 relativeIndexPath:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __112__SBHIconModel_addIcon_toDesignatedLocationBasedOnOtherRootFolder_toRootFolder_options_listGridCellInfoOptions___block_invoke;
    aBlock[3] = &unk_1E6AAD348;
    id v25 = v14;
    id v87 = v25;
    v82 = v23;
    v88 = v82;
    id v26 = (void (**)(void))_Block_copy(aBlock);
    v80 = v26;
    v81 = v24;
    if (v24 == v13)
    {
      id v32 = [v20 listIdentifier];
      long long v33 = [v25 addEmptyListWithIdentifier:v32];
      BOOL v23 = [v25 indexPathForList:v33];
      long long v31 = v25;
      char v34 = v82;
LABEL_17:

LABEL_18:
      int v53 = [v31 isValidIndexPath:v23];

      if (!v53)
      {
        LOBYTE(v18) = 0;
        char v20 = v85;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      char v20 = v85;
LABEL_20:
      v54 = [v14 listAtIndexPath:v23];
      v55 = v54;
      if (v54)
      {
        v84 = v19;
        [v54 folder];
        v57 = v56 = v20;
        v58 = [v57 uniqueIdentifier];

        v59 = [v55 uniqueIdentifier];
        v60 = [v56 iconRelativePathWithFolderIdentifier:v58 listIdentifier:v59];
        uint64_t v61 = [v14 gridPathForRelativePath:v60];
        if (v61)
        {
          char v18 = (void *)v61;
          id v62 = (id)[v14 insertIcon:v12 atGridPath:v61 options:0];

          LOBYTE(v18) = 1;
        }
        else
        {

          v60 = objc_msgSend(v14, "addIcon:toListAtIndex:options:", v12, -[SBFolderIcon sbListIndex](v23, "sbListIndex"), 0);
          LODWORD(v18) = [v60 containsObject:v12] ^ 1;
        }

        char v19 = v84;
        char v20 = v85;
      }
      else
      {
        LOBYTE(v18) = 0;
      }

      goto LABEL_28;
    }
    uint64_t v27 = v26;
    v83 = v19;
    uint64_t v28 = [v24 uniqueIdentifier];
    int v29 = [v25 firstFolderWithUniqueIdentifier:v28];
    if (v29)
    {
      ((void (*)(void (**)(void), void *))v27[2])(v27, v29);
      BOOL v23 = (SBFolderIcon *)objc_claimAutoreleasedReturnValue();

      char v30 = [v25 isValidIndexPath:v23];
      v82 = v23;
      char v19 = v83;
      long long v31 = v25;
      if (v30) {
        goto LABEL_18;
      }
    }
    else
    {

      char v19 = v83;
      long long v31 = v25;
    }
    uint64_t v77 = [v81 icon];
    uint64_t v76 = objc_msgSend(v13, "relativePathForIcon:listGridCellInfoOptions:");
    uint64_t v35 = objc_msgSend(v31, "gridPathForRelativePath:");
    long long v36 = v78;
    if (v35) {
      goto LABEL_14;
    }
    v64 = [v13 indexPathForIcon:v77];
    if (([v31 isValidIndexPath:v64 forInsertion:1] & 1) == 0
      && objc_msgSend(v64, "sb_iconPathCount") == 1)
    {
      v65 = v31;
      uint64_t v66 = [v64 sbListIndex];
      if (v66 == [v65 listCount])
      {
        v67 = [0 listIdentifier];
        id v68 = (id)[v65 addEmptyListWithIdentifier:v67];

        uint64_t v69 = objc_msgSend(v64, "sb_indexPathByReplacingLastIconIndex:", 0);

        v64 = (void *)v69;
      }
      long long v31 = v65;
      long long v36 = v78;
    }
    if ([v31 isValidIndexPath:v64 forInsertion:1])
    {
      uint64_t v70 = [v31 gridPathForIndexPath:v64 listGridCellInfoOptions:a7];
      if (v70)
      {
        uint64_t v71 = v70;

        uint64_t v35 = v71;
LABEL_14:
        long long v37 = v36;
        uint64_t v38 = v35;
        [v81 displayName];
        v40 = id v39 = v31;
        long long v41 = [v81 uniqueIdentifier];
        uint64_t v42 = [(SBHIconModel *)v37 makeFolderWithDisplayName:v40 uniqueIdentifier:v41];

        v43 = [v81 defaultDisplayName];
        [v42 setDefaultDisplayName:v43];

        uint64_t v44 = [v85 listIdentifier];
        uint64_t v45 = [v42 firstList];
        uint64_t v75 = v44;
        id v46 = (id)[v42 addEmptyListWithIdentifier:v44];
        v74 = (void *)v45;
        [v42 removeList:v45];
        v47 = [[SBFolderIcon alloc] initWithFolder:v42];
        v79 = (SBFolderIcon *)v38;
        id v48 = (id)[v39 insertIcon:v47 atGridPath:v38 options:0];
        v49 = [v42 firstList];
        long long v31 = v39;
        BOOL v23 = [v39 indexPathForList:v49];

        v50 = v47;
        char v19 = v83;
        goto LABEL_15;
      }
      uint64_t v73 = [v31 gridPathWithListAtIndexPath:v64 gridCellIndex:0 listGridCellInfoOptions:a7];

      uint64_t v35 = v73;
      if (v73) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v72 = [v81 displayName];
    uint64_t v42 = [v81 defaultDisplayName];
    uint64_t v75 = [v81 uniqueIdentifier];
    v79 = (SBFolderIcon *)v72;
    v51 = objc_msgSend(v31, "firstFolderWithUniqueIdentifier:displayName:defaultDisplayName:");
    if (!v51)
    {
      BOOL v23 = v82;
      id v32 = (void *)v77;
      v52 = (void *)v75;
      goto LABEL_16;
    }
    v74 = v51;
    v80[2]();
    BOOL v23 = (SBFolderIcon *)objc_claimAutoreleasedReturnValue();
    v50 = v82;
LABEL_15:

    id v32 = (void *)v77;
    v51 = v74;
    v52 = (void *)v75;
LABEL_16:

    char v34 = v79;
    long long v33 = (void *)v76;
    goto LABEL_17;
  }
  LOBYTE(v18) = 0;
LABEL_30:

  return (char)v18;
}

id __112__SBHIconModel_addIcon_toDesignatedLocationBasedOnOtherRootFolder_toRootFolder_options_listGridCellInfoOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 indexPathForFolder:v4];
  id v6 = objc_msgSend(*(id *)(a1 + 40), "sb_indexPathByRemovingFirstIconPathComponent");
  uint64_t v7 = [v6 sbListIndex];

  LODWORD(v6) = [v4 isValidListIndex:v7];
  if (v6) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [v5 indexPathByAddingIndex:v8];

  return v9;
}

- (BOOL)addIcon:(id)a3 toIgnoredListIfNecessaryBasedOnOtherRootFolder:(id)a4 toRootFolder:(id)a5 options:(unint64_t)a6 listGridCellInfoOptions:(unint64_t)a7
{
  id v9 = a3;
  id v10 = a5;
  int v11 = [a4 isIconInIgnoredList:v9];
  if (v11)
  {
    id v12 = [v10 ignoredList];
    [v12 addIcon:v9];

    id v13 = SBLogIcon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v15 = 0;
      _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "Added icon to ignored list based on other root folder", v15, 2u);
    }
  }
  return v11;
}

- (BOOL)addIconToDesignatedLocationBasedOnDesiredIconState:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(SBHIconModel *)self desiredIconState];
  if (v12
    && (([(SBHIconModel *)self cachedDesiredRootFolder],
         (id v13 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([(SBHIconModel *)self unarchivedRootFolderForAddingIconFromOtherIconState:v12], id v13 = objc_claimAutoreleasedReturnValue(), [(SBHIconModel *)self setCachedDesiredRootFolder:v13], [(SBHIconModel *)self scheduleDiscardOfCachedOtherRootFolders], v13)))
  {
    BOOL v14 = [(SBHIconModel *)self addIcon:v10 toDesignatedLocationBasedOnOtherRootFolder:v13 toRootFolder:v11 options:a5 listGridCellInfoOptions:a6];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)addIconToDesignatedLocationBasedOnDefaultIconState:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(SBHIconModel *)self defaultIconState];
  if (v12
    && (([(SBHIconModel *)self cachedDefaultRootFolder],
         (id v13 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([(SBHIconModel *)self unarchivedRootFolderForAddingIconFromOtherIconState:v12], id v13 = objc_claimAutoreleasedReturnValue(), [(SBHIconModel *)self setCachedDefaultRootFolder:v13], [(SBHIconModel *)self scheduleDiscardOfCachedOtherRootFolders], v13)))
  {
    BOOL v14 = [(SBHIconModel *)self addIcon:v10 toDesignatedLocationBasedOnOtherRootFolder:v13 toRootFolder:v11 options:a5 listGridCellInfoOptions:a6];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)addIconToIgnoredListBasedOnDefaultIconState:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(SBHIconModel *)self defaultIconState];
  if (v12
    && (([(SBHIconModel *)self cachedDefaultRootFolder],
         (id v13 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([(SBHIconModel *)self unarchivedRootFolderForAddingIconFromOtherIconState:v12], id v13 = objc_claimAutoreleasedReturnValue(), [(SBHIconModel *)self setCachedDefaultRootFolder:v13], [(SBHIconModel *)self scheduleDiscardOfCachedOtherRootFolders], v13)))
  {
    BOOL v14 = [(SBHIconModel *)self addIcon:v10 toIgnoredListIfNecessaryBasedOnOtherRootFolder:v13 toRootFolder:v11 options:a5 listGridCellInfoOptions:a6];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_addHiddenAppsToIgnoredListForRootFolder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 model];
  uint64_t v16 = v3;
  id v5 = [v3 ignoredList];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [MEMORY[0x1E4F4B7E0] hiddenApplications];
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v22 + 1) + 8 * v9) bundleIdentifier];
        id v11 = [v4 applicationIconsForBundleIdentifier:v10];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              [v5 addIcon:*(void *)(*((void *)&v18 + 1) + 8 * v15++)];
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }
}

- (void)scheduleDiscardOfCachedOtherRootFolders
{
  if (!self->_discardCachedOtherRootFoldersRunLoopObserver)
  {
    objc_initWeak(&location, self);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__SBHIconModel_scheduleDiscardOfCachedOtherRootFolders__block_invoke;
    v5[3] = &unk_1E6AAD210;
    objc_copyWeak(&v6, &location);
    self->_discardCachedOtherRootFoldersRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 1999900, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_discardCachedOtherRootFoldersRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __55__SBHIconModel_scheduleDiscardOfCachedOtherRootFolders__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained discardCachedOtherRootFolders];
}

- (void)_tearDownDiscardCachedOtherRootFoldersRunloopObserverIfNeeded
{
  discardCachedOtherRootFoldersRunLoopObserver = self->_discardCachedOtherRootFoldersRunLoopObserver;
  if (discardCachedOtherRootFoldersRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(discardCachedOtherRootFoldersRunLoopObserver);
    CFRelease(self->_discardCachedOtherRootFoldersRunLoopObserver);
    self->_discardCachedOtherRootFoldersRunLoopObserver = 0;
  }
}

- (void)discardCachedOtherRootFolders
{
  [(SBHIconModel *)self _tearDownDiscardCachedOtherRootFoldersRunloopObserverIfNeeded];
  [(SBHIconModel *)self setCachedDesiredRootFolder:0];
  [(SBHIconModel *)self setCachedDefaultRootFolder:0];
}

- (id)indexPathForIconInPlatformState:(id)a3
{
  id v4 = [a3 leafIdentifier];
  if (v4)
  {
    id v5 = [(SBHIconModel *)self defaultIconState];
    id v6 = +[SBHIconStateArchiver indexPathForLeafIdentifier:v4 inArchive:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)indexPathForNewIcon:(id)a3 isDesignatedLocation:(BOOL *)a4 replaceExistingIconAtIndexPath:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(SBHIconModel *)self rootFolder];
  id v10 = [(SBHIconModel *)self indexPathInRootFolder:v9 forNewIcon:v8 isDesignatedLocation:a4 replaceExistingIconAtIndexPath:a5];

  return v10;
}

- (id)indexPathInRootFolder:(id)a3 forNewIcon:(id)a4 isDesignatedLocation:(BOOL *)a5 replaceExistingIconAtIndexPath:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v11 leafIdentifier];
  BOOL v13 = [(SBHIconModel *)self shouldPlaceIconOnIgnoredList:v11];
  uint64_t v14 = [(SBHIconModel *)self delegate];
  uint64_t v15 = [v10 indexPathForIconWithIdentifier:v12];
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = v15;
LABEL_8:
    long long v18 = v17;
    goto LABEL_9;
  }
  if (v13)
  {
    id v17 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:0 listIndex:30000];
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v14 iconModel:self customInsertionIndexPathForIcon:v11 inRootFolder:v10],
        (long long v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v17 = [(SBHIconModel *)self _adjustedDesiredIndexPathInRootFolder:v10 forIconWithIdentifier:v12];
    goto LABEL_8;
  }
LABEL_9:
  if ([(SBHIconModel *)self _shouldSkipAddingIcon:v11 toRootFolder:v10])
  {

    long long v18 = 0;
LABEL_18:
    BOOL v22 = 1;
    goto LABEL_19;
  }
  if (v18 && !v16)
  {
    uint64_t v19 = SBFolderRelativeListIndex(v18);
    if (![v10 isValidListIndex:v19]
      || ([v10 listAtIndex:v19], (long long v20 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIconIndex:listIndex:", 0, objc_msgSend(v10, "listCount"));

      long long v20 = 0;
      long long v18 = (void *)v21;
    }
  }
  if (v18) {
    goto LABEL_18;
  }
  if ([(SBHIconModel *)self sortsIconsAlphabetically])
  {
    long long v25 = [v10 icons];
    unint64_t v26 = objc_msgSend(v25, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, objc_msgSend(v25, "count"), 1024, &__block_literal_global_147);
    if (v26 >= [v25 count])
    {
      long long v18 = [v10 indexPathForFirstFreeSlotAvoidingFirstList:0];
    }
    else
    {
      uint64_t v27 = [v25 objectAtIndex:v26];
      long long v18 = [v10 indexPathForIcon:v27 includingPlaceholders:1];
    }
    goto LABEL_33;
  }
  if (![(SBHIconModel *)self ignoresIconsNotInIconState]) {
    goto LABEL_30;
  }
  uint64_t v28 = [(SBHIconModel *)self archivedLeafIdentifiers];
  if (!v28) {
    goto LABEL_30;
  }
  int v29 = (void *)v28;
  char v30 = [(SBHIconModel *)self archivedLeafIdentifiers];
  long long v31 = [v11 leafIdentifier];
  int v32 = [v30 containsObject:v31];

  BOOL v22 = v32;
  if (v32)
  {
LABEL_30:
    long long v18 = [v10 indexPathForFirstFreeSlotAvoidingFirstList:1];
LABEL_33:
    BOOL v22 = 0;
    goto LABEL_19;
  }
  long long v18 = 0;
LABEL_19:
  if (a5) {
    *a5 = v22;
  }
  if (a6) {
    *a6 = v16;
  }
  id v23 = v18;

  return v23;
}

uint64_t __101__SBHIconModel_indexPathInRootFolder_forNewIcon_isDesignatedLocation_replaceExistingIconAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompareDisplayNames:");
}

- (id)_adjustedDesiredIndexPathInRootFolder:(id)a3 forIconWithIdentifier:(id)a4
{
  return [(SBHIconModel *)self _adjustedIndexPathInRootFolder:a3 withinIconState:self->_desiredIconState forIconWithIdentifier:a4];
}

- (id)_adjustedPlatformIndexPathInRootFolder:(id)a3 forIcon:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 leafIdentifier];
  if (v7)
  {
    id v8 = [(SBHIconModel *)self defaultIconState];
    uint64_t v9 = [(SBHIconModel *)self _adjustedIndexPathInRootFolder:v6 withinIconState:v8 forIconWithIdentifier:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_adjustedIndexPathInRootFolder:(id)a3 withinIconState:(id)a4 forIconWithIdentifier:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = +[SBHIconStateArchiver indexPathForLeafIdentifier:v8 inArchive:v7];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
    id v12 = v39;
    long long v37 = objc_msgSend(v11, "sb_lastIconPathComponent");
    id v38 = v12;
    id v13 = v11;
    if ((unint64_t)objc_msgSend(v11, "sb_iconPathCount") < 2) {
      goto LABEL_8;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v47 = __Block_byref_object_copy__0;
    *(void *)&long long v48 = __Block_byref_object_dispose__0;
    id v14 = v12;
    *((void *)&v48 + 1) = v14;
    uint64_t v15 = +[SBHIconStateArchiver folderPathForLeafIdentifier:v8 inArchive:v7 iconSource:self];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __85__SBHIconModel__adjustedIndexPathInRootFolder_withinIconState_forIconWithIdentifier___block_invoke;
    v40[3] = &unk_1E6AAD390;
    id v41 = v14;
    uint64_t v45 = buf;
    id v16 = v41;
    id v42 = v16;
    v43 = self;
    id v44 = v8;
    [v15 enumerateFoldersUsingBlock:v40];
    id v17 = *(id *)(*(void *)&buf[8] + 40);
    if (v17 == v16)
    {
      id v38 = v16;
      id v13 = v11;
    }
    else
    {
      id v38 = v17;

      long long v18 = [v16 indexPathForFolder:v38];
      objc_msgSend(v18, "sb_indexPathByAddingIndexPath:", v37);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(buf, 8);

    if (v17 == v16)
    {
      uint64_t v19 = 0;
    }
    else
    {
LABEL_8:
      uint64_t v20 = SBFolderRelativeListIndex(v37);
      if ([v38 isValidListIndex:v20])
      {
        uint64_t v21 = [v38 listAtIndex:v20];
      }
      else
      {
        uint64_t v21 = 0;
      }
      if ([v21 isFull]
        && ([v12 isIconAtIndexPathInDock:v11 includingDockFolders:1] & 1) != 0
        || ([v21 isHidden] & 1) != 0)
      {
        uint64_t v19 = 0;
      }
      else
      {
        BOOL v22 = [v21 icons];
        uint64_t v35 = objc_msgSend(v22, "bs_map:", &__block_literal_global_152);

        id v23 = [v11 indexPathByRemovingLastIndex];
        long long v24 = +[SBHIconStateArchiver leafIdentifiersInListAtIndexPath:v23 inArchive:v7];

        unint64_t v25 = SBFolderRelativeIconIndex(v37);
        unint64_t v26 = [v24 count];
        if (v25 >= v26)
        {
          long long v31 = SBLogCommon();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2112;
            v47 = (uint64_t (*)(uint64_t, uint64_t))v8;
            LOWORD(v48) = 2048;
            *(void *)((char *)&v48 + 2) = v26;
            _os_log_error_impl(&dword_1D7F0A000, v31, OS_LOG_TYPE_ERROR, "%@: desired icon index %lu for '%@' is somehow beyond the end of the list that we expected it to be in (%lu)", buf, 0x2Au);
          }
        }
        else
        {
          if (v25)
          {
            uint64_t v27 = [v24 objectAtIndex:v25 - 1];
            uint64_t v28 = [v35 indexOfObject:v27];
            if (v28 == 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v29 = v25 - 2;
              while (v29 != -1)
              {

                uint64_t v27 = [v24 objectAtIndex:v29];
                uint64_t v28 = [v35 indexOfObject:v27];
                --v29;
                if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
                  goto LABEL_21;
                }
              }
              unint64_t v30 = 0;
            }
            else
            {
LABEL_21:
              unint64_t v30 = v28 + 1;
            }
          }
          else
          {
            unint64_t v30 = 0;
          }
          unint64_t v32 = objc_msgSend(v21, "numberOfIcons", v35);
          if (v30 >= v32) {
            unint64_t v33 = v32;
          }
          else {
            unint64_t v33 = v30;
          }
          long long v31 = [v13 indexPathByRemovingLastIndex];

          id v13 = [v31 indexPathByAddingIndex:v33];
        }

        id v13 = v13;
        uint64_t v19 = v13;
      }
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

void __85__SBHIconModel__adjustedIndexPathInRootFolder_withinIconState_forIconWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([*(id *)(a1 + 32) isValidIndexPath:v12])
  {
    id v13 = [*(id *)(a1 + 32) iconAtIndexPath:v12];
  }
  else
  {
    id v13 = 0;
  }
  if ([v13 isFolderIcon])
  {
    id v14 = [v13 folder];
    uint64_t v15 = [v14 defaultDisplayName];
    if ([v15 isEqualToString:v9])
    {
LABEL_8:

LABEL_9:
      uint64_t v18 = [v13 folder];
      uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      goto LABEL_17;
    }
    id v16 = [v13 folder];
    id v17 = [v16 displayName];
    if ([v17 isEqualToString:v9])
    {

      goto LABEL_8;
    }
    long long v24 = [v13 folder];
    [v24 uniqueIdentifier];
    uint64_t v21 = v25 = v16;
    char v26 = [v21 isEqualToString:v11];

    if (v26) {
      goto LABEL_9;
    }
  }
  BOOL v22 = [*(id *)(a1 + 40) firstFolderWithUniqueIdentifier:v11 displayName:v9 defaultDisplayName:v10];
  if (v22)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v22);
  }
  else
  {
    id v23 = SBLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __85__SBHIconModel__adjustedIndexPathInRootFolder_withinIconState_forIconWithIdentifier___block_invoke_cold_1(a1);
    }
  }
LABEL_17:
}

uint64_t __85__SBHIconModel__adjustedIndexPathInRootFolder_withinIconState_forIconWithIdentifier___block_invoke_149(uint64_t a1, void *a2)
{
  return [a2 leafIdentifier];
}

- (BOOL)_shouldSkipAddingIcon:(id)a3 toRootFolder:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isApplicationIcon])
  {
    id v5 = [v4 application];
    id v6 = [v4 applicationPlaceholder];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 isAppClip])
    {
      id v7 = SBLogIcon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [v4 applicationBundleID];
        int v14 = 138543362;
        uint64_t v15 = v8;
        id v9 = "Application icon for app clip should not be added to folder: %{public}@";
LABEL_14:
        _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || ![v6 isAppClip])
      {
        LOBYTE(v7) = 0;
        goto LABEL_17;
      }
      id v7 = SBLogIcon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [v4 applicationBundleID];
        int v14 = 138543362;
        uint64_t v15 = v8;
        id v9 = "Downloading icon for app clip should not be added to folder: %{public}@";
        goto LABEL_14;
      }
    }

    LOBYTE(v7) = 1;
LABEL_17:

    goto LABEL_18;
  }
  if (![v4 isBookmarkIcon])
  {
    LOBYTE(v7) = 0;
    goto LABEL_20;
  }
  id v5 = v4;
  id v10 = [v5 webClip];
  LODWORD(v7) = [v10 isAppClip];

  if (v7)
  {
    id v6 = SBLogIcon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v11 = [v5 webClip];
      id v12 = [v11 identifier];
      int v14 = 138543362;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "Web clip icon for app clip should not be added to folder: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_17;
  }
LABEL_18:

LABEL_20:
  return (char)v7;
}

- (id)desiredIndexPathForIconWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(SBHIconModel *)self hasDesiredIconState])
  {
    id v5 = +[SBHIconStateArchiver indexPathForLeafIdentifier:v4 inArchive:self->_desiredIconState];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)hasDesiredIconState
{
  return self->_desiredIconState != 0;
}

- (NSSet)missingDesiredIconIdentifiers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_desiredIconState)
  {
    CFAllocatorRef v3 = +[SBHIconStateArchiver leafIdentifiersFromArchive:](SBHIconStateArchiver, "leafIdentifiersFromArchive:");
    id v4 = [(SBHIconModel *)self currentLeafIdentifiers];
    id v5 = [MEMORY[0x1E4F1CA80] set];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v4, "containsObject:", v11, (void)v13) & 1) == 0) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v5;
}

- (void)clearDesiredIconState
{
}

- (void)clearDesiredIconStateWithOptions:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_1D7F0A000, "clearDesiredIconStateWithOptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  if (self->_desiredIconState)
  {
    id v6 = [(SBHIconModel *)self store];
    id v11 = 0;
    int v7 = [v6 deleteDesiredIconStateWithOptions:a3 error:&v11];
    id v8 = v11;
    if (v7)
    {
      uint64_t v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v14 = self;
        _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "%@: deleted desired icon state", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138412802;
        long long v14 = self;
        __int16 v15 = 2114;
        id v16 = v8;
        __int16 v17 = 2114;
        uint64_t v18 = v10;
        _os_log_error_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_ERROR, "%@: unable to delete desired icon state: %{public}@: \n%{public}@", buf, 0x20u);
      }
    }

    [(SBHIconModel *)self setDesiredIconState:0];
    [(SBHIconModel *)self setDesiredIconStateFlattened:0];
  }
  os_activity_scope_leave(&state);
}

- (void)clearDesiredIconStateIfPossible
{
  if (self->_desiredIconState)
  {
    if (!self->_desiredIconStateFlattened)
    {
      CFAllocatorRef v3 = +[SBHIconStateArchiver leafIdentifiersFromArchive:](SBHIconStateArchiver, "leafIdentifiersFromArchive:");
      [(SBHIconModel *)self setDesiredIconStateFlattened:v3];
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = [(SBHIconModel *)self rootFolder];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__SBHIconModel_clearDesiredIconStateIfPossible__block_invoke;
    v8[3] = &unk_1E6AAD1C0;
    id v6 = v4;
    id v9 = v6;
    [v5 enumerateAllIconsWithOptions:1 usingBlock:v8];

    unint64_t v7 = [(NSOrderedSet *)self->_desiredIconStateFlattened count];
    if (v7 <= [v6 count])
    {
      if ([(NSOrderedSet *)self->_desiredIconStateFlattened isSubsetOfSet:v6]) {
        [(SBHIconModel *)self clearDesiredIconState];
      }
    }
  }
}

void __47__SBHIconModel_clearDesiredIconStateIfPossible__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isLeafIcon])
  {
    CFAllocatorRef v3 = [v4 leafIdentifier];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)iconState
{
  id v4 = 0;
  id v5 = 0;
  [(SBHIconModel *)self _getLoadedIconState:&v5 error:&v4];
  id v2 = v5;

  return v2;
}

- (int64_t)_getLoadedIconState:(id *)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(SBHIconModel *)self store];
  id v26 = 0;
  id v8 = [v7 loadCurrentIconState:&v26];
  id v9 = v26;
  id v10 = v9;
  if (v8 || !v9)
  {
    if (v8)
    {
      id v12 = [(SBHIconModel *)self modernizeRootArchive:v8];

      if (v12)
      {
        int64_t v13 = 1;
        goto LABEL_15;
      }
    }
  }
  else if ([v9 code] != 2)
  {
    id v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = self;
      __int16 v29 = 2112;
      unint64_t v30 = v10;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_INFO, "%@: unable to read icon state: %@", buf, 0x16u);
    }
  }
  long long v14 = SBLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    unint64_t v30 = v10;
    _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_INFO, "%@: unable to read current icon state: %@. Defaulting to platform state.", buf, 0x16u);
  }

  id v12 = [(SBHIconModel *)self defaultIconState];
  __int16 v15 = SBLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = self;
    _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_INFO, "%@: using default platform state", buf, 0xCu);
  }

  int64_t v13 = 2;
LABEL_15:
  id v16 = [(SBHIconModel *)self todayListsStore];
  __int16 v17 = v16;
  if (v16 && v12)
  {
    long long v24 = v7;
    id v25 = 0;
    uint64_t v18 = a3;
    uint64_t v19 = a4;
    uint64_t v20 = [v16 loadCurrentIconState:&v25];
    id v21 = v25;
    if (v20)
    {
      +[SBHIconStateBuilder iconStateByReplacingTodayListsInIconState:v12 withTodayListsFromIconState:v20];
      v12 = BOOL v22 = v12;
    }
    else
    {
      BOOL v22 = SBLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SBHIconModel _getLoadedIconState:error:]();
      }
    }

    a4 = v19;
    a3 = v18;
    unint64_t v7 = v24;
  }
  if (!v12)
  {
    if (a4) {
      *a4 = v10;
    }
    int64_t v13 = 3;
  }
  if (a3) {
    *a3 = v12;
  }

  return v13;
}

- (void)loadDesiredIconState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = [(SBHIconModel *)self store];
  id v8 = 0;
  id v4 = [v3 loadDesiredIconState:&v8];
  id v5 = v8;
  id v6 = v5;
  if (v4)
  {
    unint64_t v7 = [(SBHIconModel *)self modernizeRootArchive:v4];

    [(SBHIconModel *)self setDesiredIconState:v7];
LABEL_3:

    goto LABEL_4;
  }
  if (v5 && [v5 code] != 2)
  {
    unint64_t v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "%@: unable to read desired icon state: %@", buf, 0x16u);
    }
    goto LABEL_3;
  }
LABEL_4:
}

- (NSDictionary)defaultIconState
{
  CFAllocatorRef v3 = [(SBHIconModel *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 defaultIconStateForIconModel:self],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = &unk_1F300F288;
  }

  return (NSDictionary *)v4;
}

- (BOOL)shouldAvoidPlacingIconOnFirstPage:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconModel:self shouldAvoidPlacingIconOnFirstPage:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)shouldPlaceIconOnIgnoredList:(id)a3
{
  id v4 = a3;
  if ([(SBHIconModel *)self isCheckingModelConsistency])
  {
    char v5 = 0;
  }
  else
  {
    char v6 = [(SBHIconModel *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v5 = [v6 iconModel:self shouldPlaceIconOnIgnoredList:v4];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (id)_unarchiveRootFolderWithLayoutStatus:(int64_t *)a3
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  char v5 = _os_activity_create(&dword_1D7F0A000, "_unarchiveRootFolder", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  id v32 = 0;
  id v33 = 0;
  int64_t v6 = [(SBHIconModel *)self _getLoadedIconState:&v33 error:&v32];
  id v7 = v33;
  id v29 = v32;
  id v8 = [(SBHIconModel *)self delegate];
  BOOL v30 = [(SBHIconModel *)self sortsIconsAlphabetically];
  if (v6 == 1)
  {
    id v9 = [(SBHIconModel *)self desiredIconState];

    if (!v9)
    {
      [(SBHIconModel *)self loadDesiredIconState];
      id v10 = [(SBHIconModel *)self desiredIconState];

      if (!v10) {
        [(SBHIconModel *)self setDesiredIconState:v7];
      }
    }
  }
  __int16 v11 = [[SBHIconStateUnarchiver alloc] initWithArchive:v7 iconModel:self];
  [(SBHIconStateUnarchiver *)v11 setRemovesEmptyFolders:[(SBHIconModel *)self isRestoring] ^ 1];
  id v12 = [(SBHIconStateUnarchiver *)v11 unarchive];
  if ([v12 isValid]
    && ([v12 rootFolder], uint64_t v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    uint64_t v31 = v7;
  }
  else
  {
    long long v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBHIconModel _unarchiveRootFolderWithLayoutStatus:]((uint64_t)self, v14);
    }

    [(SBHIconModel *)self clearDesiredIconState];
    [(SBHIconModel *)self deleteIconState];
    uint64_t v31 = [(SBHIconModel *)self defaultIconState];

    uint64_t v15 = +[SBHIconStateArchiver unarchiveRootFolderFromArchive:v31 withIconSource:self];

    int64_t v6 = 2;
    id v12 = (void *)v15;
  }
  id v16 = [v12 metadata];
  [(SBHIconModel *)self didUnarchiveMetadata:v16];

  if ([v12 isValid]
    && ([v12 rootFolder], __int16 v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    uint64_t v18 = [v12 rootFolder];
  }
  else
  {
    uint64_t v28 = a3;
    uint64_t v19 = (objc_class *)self;
    uint64_t v20 = [v8 maxListCountForFoldersForIconModel:self];
    unsigned int v21 = [v8 iconModel:self listGridSizeForFolderClass:v19];
    BOOL v22 = [v8 gridSizeClassSizesForIconModel:self];
    uint64_t v18 = (void *)[[v19 alloc] initWithDisplayName:&stru_1F2FA0300 maxListCount:v20 listGridSize:v21 iconGridSizeClassSizes:v22];
    id v23 = [(SBHIconModel *)self listRotatedLayoutClusterGridSizeClass];
    [v18 setListRotatedLayoutClusterGridSizeClass:v23];
    long long v24 = [(SBHIconModel *)self allowedGridSizeClassesForFolderClass:v19];
    [v18 setListAllowedGridSizeClasses:v24];
    id v25 = [(SBHIconModel *)self customGridSizeClassDomain];
    [v18 setGridSizeClassDomain:v25];
    objc_msgSend(v18, "setListsAllowRotatedLayout:", -[SBHIconModel listsAllowRotatedLayoutForFolderClass:](self, "listsAllowRotatedLayoutForFolderClass:", v19));
    objc_msgSend(v18, "setListWithNonDefaultSizedIconsGridSize:", -[SBHIconModel listWithNonDefaultSizedIconsGridSizeForFolderClass:](self, "listWithNonDefaultSizedIconsGridSizeForFolderClass:", v19));
    objc_msgSend(v18, "setListsFixedIconLocationBehavior:", -[SBHIconModel listsFixedIconLocationBehaviorForFolderClass:](self, "listsFixedIconLocationBehaviorForFolderClass:", v19));
    objc_msgSend(v18, "setListsIconLayoutBehavior:", -[SBHIconModel listsIconLayoutBehaviorForFolderClass:](self, "listsIconLayoutBehaviorForFolderClass:", v19));
    id v26 = [(SBHIconModel *)self rotatedGridSizeClassSizes];
    [v18 setRotatedIconGridSizeClassSizes:v26];

    int64_t v6 = 3;
    a3 = v28;
  }
  if (v30) {
    [v18 sort];
  }
  objc_msgSend(v18, "compactLists", v28);
  if (a3) {
    *a3 = v6;
  }

  os_activity_scope_leave(&state);
  return v18;
}

- (BOOL)deleteIconState
{
  return [(SBHIconModel *)self deleteIconStateWithOptions:0];
}

- (BOOL)deleteIconStateWithOptions:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(SBHIconModel *)self markIconStateClean];
  char v5 = [(SBHIconModel *)self store];
  id v11 = 0;
  int v6 = [v5 deleteCurrentIconStateWithOptions:a3 error:&v11];
  id v7 = v11;
  id v8 = SBLogCommon();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = self;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "%@: deleted current icon state", buf, 0xCu);
    }

    id v9 = [(SBHIconModel *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v9 didDeleteIconState:self];
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[SBHIconModel deleteIconStateWithOptions:]((uint64_t)self);
  }

  return v6;
}

- (void)saveDesiredIconState
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v1, v2, "%@: unable to save desired icon state: %@", (void)v3, DWORD2(v3));
}

- (void)_saveIconState
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Please move to _saveIconStateWithError:", v1, 2u);
}

- (BOOL)_saveIconStateWithError:(id *)a3
{
  char v5 = _os_activity_create(&dword_1D7F0A000, "saveIconState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  int v6 = [(SBHIconModel *)self iconModelMetadata];
  id v7 = +[SBHIconStateArchiver archiveRootFolderInModel:self metadata:v6];
  LOBYTE(a3) = [(SBHIconModel *)self _saveIconState:v7 error:a3];

  os_activity_scope_leave(&v9);
  return (char)a3;
}

- (BOOL)_saveIconState:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SBHIconModel *)self autosaveTimer];
  [v7 invalidate];

  [(SBHIconModel *)self setAutosaveTimer:0];
  id v8 = [(SBHIconModel *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v8 canSaveIconState:self])
  {
    BOOL v25 = 0;
    id v11 = 0;
    if (!a4) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  os_activity_scope_state_s v9 = [(SBHIconModel *)self store];
  id v32 = 0;
  int v10 = [v9 saveCurrentIconState:v6 error:&v32];
  id v11 = v32;
  id v12 = SBLogCommon();
  uint64_t v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      char v34 = self;
      _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_INFO, "%@: current icon state saved", buf, 0xCu);
    }

    [(SBHIconModel *)self markIconStateClean];
    if (objc_opt_respondsToSelector()) {
      [v8 didSaveIconState:self];
    }
    int v14 = 1;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBHIconModel _saveIconState:error:]();
    }

    int v14 = 0;
  }
  uint64_t v15 = [(SBHIconModel *)self todayListsStore];
  id v16 = v15;
  if (v15) {
    int v17 = v10;
  }
  else {
    int v17 = 0;
  }
  if (v17 == 1)
  {
    id v29 = a4;
    id v31 = 0;
    uint64_t v18 = [v15 loadCurrentIconState:&v31];
    id v19 = v31;
    uint64_t v20 = v19;
    if (v18)
    {
      id v28 = v19;
      unsigned int v21 = +[SBHIconStateBuilder iconStateByReplacingTodayListsInIconState:v18 withTodayListsFromIconState:v6];
      id v30 = 0;
      char v22 = [v16 saveCurrentIconState:v21 error:&v30];
      id v23 = v30;
      if ((v22 & 1) == 0)
      {
        id v27 = v23;
        long long v24 = SBLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[SBHIconModel _saveIconState:error:]();
        }

        int v14 = 0;
        id v23 = v27;
      }

      uint64_t v20 = v28;
    }
    else
    {
      unsigned int v21 = SBLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SBHIconModel _getLoadedIconState:error:]();
      }
      int v14 = 0;
    }

    a4 = v29;
  }

  BOOL v25 = v14 != 0;
  if (a4)
  {
LABEL_29:
    if (!v25) {
      *a4 = v11;
    }
  }
LABEL_31:

  return v25;
}

- (BOOL)saveIconStateIfNeeded
{
  long long v3 = [(SBHIconModel *)self autosaveTimer];
  [v3 invalidate];

  [(SBHIconModel *)self setAutosaveTimer:0];
  if ([(SBHIconModel *)self isIconStateDirty]) {
    return [(SBHIconModel *)self _saveIconStateWithError:0];
  }
  if ([(SBHIconModel *)self hasAnyDirtyModelObjects])
  {
    id v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SBHIconModel saveIconStateIfNeeded](v4);
    }

    return [(SBHIconModel *)self _saveIconStateWithError:0];
  }
  return 1;
}

- (void)importIconState:(id)a3
{
  id v4 = a3;
  [(SBHIconModel *)self clearDesiredIconState];
  id v8 = 0;
  BOOL v5 = [(SBHIconModel *)self _saveIconState:v4 error:&v8];

  id v6 = v8;
  if (v5)
  {
    [(SBHIconModel *)self layout];
  }
  else
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBHIconModel importIconState:]();
    }
  }
}

- (void)importDesiredIconState:(id)a3
{
  id v4 = [(SBHIconModel *)self modernizeRootArchive:a3];
  [(SBHIconModel *)self setDesiredIconState:v4];

  if (self->_desiredIconState)
  {
    [(SBHIconModel *)self saveDesiredIconState];
  }
}

- (void)markIconStateDirty
{
  if (![(SBHIconModel *)self isIconStateDirty])
  {
    [(SBHIconModel *)self setIconStateDirty:1];
    [(SBHIconModel *)self scheduleIconStateAutosave];
  }
}

- (void)markIconStateClean
{
  if ([(SBHIconModel *)self isIconStateDirty])
  {
    [(SBHIconModel *)self setIconStateDirty:0];
    id v3 = [(SBHIconModel *)self rootFolder];
    [v3 markIconStateClean];
  }
}

- (BOOL)hasAnyDirtyModelObjects
{
  os_log_t v2 = [(SBHIconModel *)self rootFolder];
  if ([v2 isIconStateDirty])
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__SBHIconModel_hasAnyDirtyModelObjects__block_invoke;
    v5[3] = &unk_1E6AAD3D8;
    void v5[4] = &v6;
    [v2 enumerateListsWithOptions:1 usingBlock:v5];
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
    _Block_object_dispose(&v6, 8);
  }

  return v3;
}

uint64_t __39__SBHIconModel_hasAnyDirtyModelObjects__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isIconStateDirty];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)disableIconStateAutosaveForReason:(id)a3
{
  id v4 = a3;
  if (!self->_autosaveDisableAssertions)
  {
    BOOL v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    autosaveDisableAssertions = self->_autosaveDisableAssertions;
    self->_autosaveDisableAssertions = v5;
  }
  id v7 = [[SBHIconModelDisableAutosaveAssertion alloc] initWithIconModel:self reason:v4];
  [(NSHashTable *)self->_autosaveDisableAssertions addObject:v7];
  uint64_t v8 = [(SBHIconModel *)self autosaveTimer];
  [v8 invalidate];

  [(SBHIconModel *)self setAutosaveTimer:0];
  return v7;
}

- (void)_removeIconStateAutosaveDisableAssertion:(id)a3
{
  [(NSHashTable *)self->_autosaveDisableAssertions removeObject:a3];
  if (![(NSHashTable *)self->_autosaveDisableAssertions count])
  {
    [(SBHIconModel *)self saveIconStateIfNeeded];
  }
}

- (void)scheduleIconStateAutosave
{
  BOOL v3 = [(SBHIconModel *)self autosaveTimer];
  if (!v3)
  {
    if ([(NSHashTable *)self->_autosaveDisableAssertions count]) {
      return;
    }
    uint64_t v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_autosaveTimerDidFire_ selector:0 userInfo:0 repeats:5.0];
    [(SBHIconModel *)self setAutosaveTimer:v4];
    BOOL v3 = (void *)v4;
  }
}

- (id)modernizeRootArchive:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)migratedIdentifierForLeafIdentifier:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)checkModelConsistency
{
  id v3 = [(SBHIconModel *)self rootFolder];
  [(SBHIconModel *)self checkModelConsistencyInRootFolder:v3 listGridCellInfoOptions:0];
}

- (void)checkModelConsistencyWithListGridCellInfoOptions:(unint64_t)a3
{
  id v5 = [(SBHIconModel *)self rootFolder];
  [(SBHIconModel *)self checkModelConsistencyInRootFolder:v5 listGridCellInfoOptions:a3];
}

- (void)checkModelConsistencyInRootFolder:(id)a3 listGridCellInfoOptions:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v7 = _os_activity_create(&dword_1D7F0A000, "checkModelConsistencyInRootFolder", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  [(SBHIconModel *)self setCheckingModelConsistency:1];
  if ([(SBHIconModel *)self ignoresIconsNotInIconState]) {
    [MEMORY[0x1E4F1CAD0] set];
  }
  else {
  uint64_t v24 = [(SBHIconModel *)self leafIcons];
  }
  id v26 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:", v24, v24);
  uint64_t v8 = [v6 leafIcons];
  [v26 minusSet:v8];

  char v9 = [v26 allObjects];
  int v10 = [v9 sortedArrayUsingSelector:sel_localizedCompareDisplayNames_];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if ([(SBHIconModel *)self isIconVisible:v15]) {
          [(SBHIconModel *)self addIcon:v15 toDesignatedLocationInRootFolder:v6 options:0 listGridCellInfoOptions:a4];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v12);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = [v6 folderIcons];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        unsigned int v21 = [v6 indexPathForIcon:v20];
        id v22 = [v6 folderContainingIndexPath:v21 relativeIndexPath:0];
        if (v22 != v6) {
          id v23 = (id)[v6 addIcon:v20];
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v17);
  }

  if ([(SBHIconModel *)self sortsIconsAlphabetically]) {
    [v6 sort];
  }
  [(SBHIconModel *)self setCheckingModelConsistency:0];

  os_activity_scope_leave(&state);
}

- (void)_rootFolder:(id)a3 moveIconsToFirstPage:(id)a4 placeBumpedIconsSomewhereNice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v11 = _os_activity_create(&dword_1D7F0A000, "_rootFolder:moveIconsToFirstPage:placeBumpedIconsSomewhereNice:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);

  if ([v9 count] || objc_msgSend(v10, "count"))
  {
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x3032000000;
    long long v29 = __Block_byref_object_copy__0;
    long long v30 = __Block_byref_object_dispose__0;
    id v31 = 0;
    uint64_t v12 = [v8 firstList];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __79__SBHIconModel__rootFolder_moveIconsToFirstPage_placeBumpedIconsSomewhereNice___block_invoke;
    unsigned int v21 = &unk_1E6AAD400;
    id v13 = v12;
    id v22 = v13;
    id v23 = v8;
    BOOL v25 = &v26;
    unint64_t v14 = (unint64_t)v10;
    id v24 = (id)v14;
    [v9 enumerateObjectsWithOptions:2 usingBlock:&v18];
    uint64_t v15 = v27[5];
    if (v14 | v15)
    {
      if (v15) {
        unint64_t v16 = v27[5];
      }
      else {
        unint64_t v16 = v14;
      }
      id v17 = -[SBFolder addIcons:](self->_rootFolder, "addIcons:", v16, v18, v19, v20, v21, v22, v23);
    }

    _Block_object_dispose(&v26, 8);
  }
  os_activity_scope_leave(&state);
}

void __79__SBHIconModel__rootFolder_moveIconsToFirstPage_placeBumpedIconsSomewhereNice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 numberOfIcons];
  unsigned int v6 = [*(id *)(a1 + 32) isFull];
  if (v5) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:v5 - v7 listIndex:0];
  id v9 = *(void **)(a1 + 40);
  id v20 = v8;
  id v10 = [v9 insertIcon:v4 atIndexPath:&v20 options:10];

  id v11 = v20;
  if (v10)
  {
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v12)
    {
      uint64_t v13 = [*(id *)(a1 + 48) mutableCopy];
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (!v12)
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

        uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      }
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v10, "count"));
    [v12 insertObjects:v10 atIndexes:v19];
  }
}

- (void)setVisibilityOfIconsWithVisibleTags:(id)a3 hiddenTags:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v8 = _os_activity_create(&dword_1D7F0A000, "setVisibilityOfIconsWithVisibleTags:hiddenTags:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  uint64_t v9 = [v7 count];
  if (v9 != [(NSSet *)self->_hiddenIconTags count]
    || (uint64_t v10 = [v6 count], v10 != -[NSSet count](self->_visibleIconTags, "count"))
    || ![v7 isEqualToSet:self->_hiddenIconTags]
    || ![v6 isEqualToSet:self->_visibleIconTags]
    || !self->_tagsHaveBeenSet)
  {
    id v11 = [(SBHIconModel *)self visibleIconIdentifiers];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v14 = (NSSet *)[v6 copy];
    visibleIconTags = self->_visibleIconTags;
    self->_visibleIconTags = v14;

    id v16 = (NSSet *)[v7 copy];
    hiddenIconTags = self->_hiddenIconTags;
    self->_hiddenIconTags = v16;

    uint64_t v18 = SBLogIcon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = self->_hiddenIconTags;
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v19;
      _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEFAULT, "Hidden Icon Tags: %{public}@", buf, 0xCu);
    }

    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    long long v30 = __63__SBHIconModel_setVisibilityOfIconsWithVisibleTags_hiddenTags___block_invoke;
    id v31 = &unk_1E6AAD428;
    id v20 = v11;
    id v32 = v20;
    long long v33 = self;
    id v21 = v13;
    id v34 = v21;
    id v22 = v12;
    id v35 = v22;
    [(SBHIconModel *)self enumerateLeafIconsUsingBlock:&v28];
    -[SBHIconModel adjustIconsToShow:iconsToHide:afterChangeToVisibleIconTags:hiddenIconTags:](self, "adjustIconsToShow:iconsToHide:afterChangeToVisibleIconTags:hiddenIconTags:", v22, v21, self->_visibleIconTags, self->_hiddenIconTags, v28, v29, v30, v31);
    uint64_t v23 = [v22 count];
    uint64_t v24 = [v21 count];
    if (v23 | v24 || !self->_tagsHaveBeenSet)
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v26 = v25;
      if (v23) {
        [v25 setObject:v22 forKey:@"SBIconModelIconsToShowKey"];
      }
      if (v24) {
        [v26 setObject:v21 forKey:@"SBIconModelIconsToHideKey"];
      }
      long long v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v27 postNotificationName:@"SBIconModelVisibilityDidChangeNotification" object:self userInfo:v26];

      self->_tagsHaveBeenSet = 1;
    }
  }
  os_activity_scope_leave(&state);
}

void __63__SBHIconModel_setVisibilityOfIconsWithVisibleTags_hiddenTags___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  LODWORD(a3) = [a1[4] containsObject:a3];
  int v5 = [a1[5] isIconVisible:v7];
  if (a3)
  {
    if (v5) {
      goto LABEL_7;
    }
    id v6 = a1 + 6;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    id v6 = a1 + 7;
  }
  [*v6 addObject:v7];
LABEL_7:
}

- (NSSet)visibleIconIdentifiers
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SBHIconModel_visibleIconIdentifiers__block_invoke;
  v8[3] = &unk_1E6AAD450;
  void v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(SBHIconModel *)self enumerateLeafIconsUsingBlock:v8];
  int v5 = v9;
  id v6 = (NSSet *)v4;

  return v6;
}

void __38__SBHIconModel_visibleIconIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) isIconVisible:a2]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void)setStore:(id)a3
{
  id v5 = (SBIconModelStore *)a3;
  if (self->_store != v5)
  {
    id v6 = v5;
    [(SBHIconModel *)self saveIconStateIfNeeded];
    objc_storeStrong((id *)&self->_store, a3);
    [(SBHIconModel *)self setDesiredIconState:0];
    [(SBHIconModel *)self setDesiredIconStateFlattened:0];
    [(SBHIconModel *)self layout];
    id v5 = v6;
  }
}

- (void)setTodayListsStore:(id)a3
{
  id v5 = (SBIconModelStore *)a3;
  if (self->_todayListsStore != v5)
  {
    objc_storeStrong((id *)&self->_todayListsStore, a3);
    if (self->_rootFolder) {
      [(SBHIconModel *)self layout];
    }
  }
}

- (void)layout
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v3 = _os_activity_create(&dword_1D7F0A000, "layout icon model", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  [(SBHIconModel *)self saveIconStateIfNeeded];
  [(SBHIconModel *)self setLayingOut:1];
  desiredIconState = self->_desiredIconState;
  [(SBHIconModel *)self willLayout];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"SBIconModelWillLayoutIconStateNotification" object:self userInfo:0];

  context = (void *)MEMORY[0x1D9484600]();
  uint64_t v38 = 0;
  id v6 = [(SBHIconModel *)self _unarchiveRootFolderWithLayoutStatus:&v38];
  if (v6)
  {
    p_rootFolder = &self->_rootFolder;
    [(SBRootFolder *)self->_rootFolder setModel:0];
    [(SBFolder *)self->_rootFolder removeFolderObserver:self];
    id v8 = (void *)[(NSMutableDictionary *)self->_widgetIconsByIdentifier copy];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __22__SBHIconModel_layout__block_invoke;
    v37[3] = &unk_1E6AAD478;
    v37[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v37];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = (void *)[(NSMutableSet *)self->_additionalApplicationIconIdentifiers copy];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = [(SBHIconModel *)self leafIconForIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          [(SBHIconModel *)self removeIcon:v13 shouldRemoveFromRootFolder:0];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_rootFolder, v6);
    [(SBRootFolder *)self->_rootFolder setModel:self];
    [(SBRootFolder *)*p_rootFolder checkIgnoredListConsistency];
    [(SBFolder *)*p_rootFolder markIconStateClean];
    rootFolder = self->_rootFolder;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __22__SBHIconModel_layout__block_invoke_2;
    v32[3] = &unk_1E6AAD1C0;
    v32[4] = self;
    [(SBFolder *)rootFolder enumerateAllIconsUsingBlock:v32];
    [(SBFolder *)self->_rootFolder addFolderObserver:self];
    uint64_t v15 = self->_rootFolder;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __22__SBHIconModel_layout__block_invoke_3;
    v31[3] = &unk_1E6AAD1C0;
    v31[4] = self;
    [(SBFolder *)v15 enumerateAllIconsWithOptions:1 usingBlock:v31];
    [(SBHIconModel *)self _addHiddenAppsToIgnoredListForRootFolder:v6];
    [(SBHIconModel *)self checkModelConsistencyInRootFolder:self->_rootFolder listGridCellInfoOptions:0];
    if ([(SBFolder *)*p_rootFolder isIconStateDirty]) {
      [(SBHIconModel *)self markIconStateDirty];
    }
    else {
      [(SBHIconModel *)self markIconStateClean];
    }
    id v16 = *p_rootFolder;
    if (*p_rootFolder) {
      uint64_t v17 = [[SBFolderIcon alloc] initWithFolder:*p_rootFolder];
    }
    else {
      uint64_t v17 = 0;
    }
    [(SBHIconModel *)self setRootFolderIcon:v17];
    if (v16) {

    }
    if (desiredIconState) {
      [(SBHIconModel *)self _saveIconStateWithError:0];
    }
    else {
      [(SBHIconModel *)self saveIconStateIfNeeded];
    }
    if ([(SBHIconModel *)self ignoresIconsNotInIconState])
    {
      uint64_t v18 = [(SBFolder *)*p_rootFolder leafIcons];
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v20 = v18;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v40 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v28 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = [*(id *)(*((void *)&v27 + 1) + 8 * j) leafIdentifier];
            [v19 addObject:v24];
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v40 count:16];
        }
        while (v21);
      }

      [(SBHIconModel *)self setArchivedLeafIdentifiers:v19];
    }
  }
  [(SBHIconModel *)self setLastLayoutStatus:v38];

  id v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 postNotificationName:@"SBIconModelDidLayoutIconStateNotification" object:self userInfo:0];

  [(SBHIconModel *)self clearDesiredIconStateIfPossible];
  if (!desiredIconState && self->_desiredIconState) {
    [(SBHIconModel *)self saveDesiredIconState];
  }
  [(SBHIconModel *)self setLayingOut:0];
  os_activity_scope_leave(&state);
}

uint64_t __22__SBHIconModel_layout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) removeIcon:a3 shouldRemoveFromRootFolder:0];
}

void __22__SBHIconModel_layout__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isWidgetIcon] & 1) != 0
    || [v3 isApplicationIcon]
    && ([v3 leafIdentifierAndApplicationBundleIDMatches] & 1) == 0)
  {
    [*(id *)(a1 + 32) addIcon:v3];
  }
}

void __22__SBHIconModel_layout__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isFolderIcon] & 1) != 0 || objc_msgSend(v3, "isWidgetIcon")) {
    [*(id *)(a1 + 32) addIcon:v3];
  }
}

- (void)layoutIfNeeded
{
  id v3 = [(SBHIconModel *)self rootFolder];

  if (!v3)
  {
    [(SBHIconModel *)self layout];
  }
}

- (id)iconModelMetadata
{
  return 0;
}

- (id)makeFolderWithDisplayName:(id)a3
{
  return [(SBHIconModel *)self makeFolderWithDisplayName:a3 uniqueIdentifier:0];
}

- (id)makeFolderWithDisplayName:(id)a3 uniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(SBHIconModel *)self maxListCountForFolders];
  id v9 = self;
  SBHIconGridSize v10 = (SBHIconGridSize)[(SBHIconModel *)self listGridSizeForFolderClass:v9];

  uint64_t v11 = [(SBHIconModel *)self gridSizeClassSizes];
  id v12 = [[SBFolder alloc] initWithUniqueIdentifier:v6 displayName:v7 maxListCount:v8 listGridSize:*(unsigned int *)&v10 iconGridSizeClassSizes:v11];

  id v13 = [(SBHIconModel *)self allowedGridSizeClassesForFolderClass:objc_opt_class()];
  [(SBFolder *)v12 setListAllowedGridSizeClasses:v13];
  uint64_t v14 = [(SBHIconModel *)self customGridSizeClassDomain];
  [(SBFolder *)v12 setGridSizeClassDomain:v14];

  return v12;
}

- (id)localizedFolderNameForDefaultDisplayName:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconModel *)self delegate];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 iconModel:self localizedFolderNameForDefaultDisplayName:v4];
  }
  else
  {
    id v7 = v4;
  }
  unint64_t v8 = v7;

  return v8;
}

- (NSString)localizedDefaultFolderName
{
  id v3 = [(SBHIconModel *)self unlocalizedDefaultFolderName];
  id v4 = [(SBHIconModel *)self localizedFolderNameForDefaultDisplayName:v3];

  return (NSString *)v4;
}

- (NSString)unlocalizedDefaultFolderName
{
  return (NSString *)@"Folder";
}

+ (id)currentLocaleDidChangeNotificationName
{
  return (id)*MEMORY[0x1E4F1C370];
}

- (void)localeChanged
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v4 = [(SBHIconModel *)self leafIcons];
  id v5 = (void *)[v3 initWithSet:v4];

  id v6 = [(SBHIconModel *)self rootFolder];
  id v7 = [v6 allIcons];
  [v5 unionSet:v7];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "localeChanged", (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)addApplicationPlaceholder:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_1D7F0A000, "addApplicationPlaceholder", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  id v6 = [v4 applicationBundleIdentifier];
  id v7 = [(SBHIconModel *)self applicationIconsForBundleIdentifier:v6];
  if (![v7 count])
  {
    id v8 = objc_msgSend(objc_alloc(-[SBHIconModel iconClassForApplicationWithBundleIdentifier:](self, "iconClassForApplicationWithBundleIdentifier:", v6)), "initWithLeafIdentifier:applicationBundleID:", v6, v6);
    [(SBHIconModel *)self addIcon:v8];
    v22[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];

    id v7 = (void *)v9;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "addIconDataSource:", v4, (void)v16);
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v11);
  }

  long long v14 = [v10 firstObject];

  os_activity_scope_leave(&state);
  return v14;
}

- (id)removeApplicationPlaceholder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_1D7F0A000, "removeApplicationPlaceholder", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  id v6 = [v4 applicationBundleIdentifier];
  [(SBHIconModel *)self applicationIconsForBundleIdentifier:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "removeIconDataSource:", v4, (void)v13);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [v7 firstObject];

  os_activity_scope_leave(&state);
  return v11;
}

- (void)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SBHIconModel *)self delegate];
  uint64_t v12 = SBLogIcon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138413058;
    long long v14 = self;
    __int16 v15 = 2114;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "SBHModel %@ launchFromLocation:%{public}@ context:%@ delegate:%@", (uint8_t *)&v13, 0x2Au);
  }

  if (objc_opt_respondsToSelector()) {
    [v11 iconModel:self launchIcon:v8 fromLocation:v9 context:v10];
  }
}

- (void)iconWantsUninstall:(id)a3
{
  id v4 = a3;
  id v7 = [(SBHIconModel *)self applicationDataSource];
  id v5 = [v4 applicationBundleID];
  int v6 = [v4 isApplicationIcon];

  if (v6 && v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 uninstallApplicationWithBundleIdentifier:v5 completion:0];
  }
}

- (void)folder:(id)a3 willAddIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  id v8 = _os_activity_create(&dword_1D7F0A000, "folder will add icon", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &v9);

  if (!-[SBHIconModel isTrackingIcon:](self, "isTrackingIcon:", v7, v9.opaque[0], v9.opaque[1])) {
    [(SBHIconModel *)self addIcon:v7];
  }
  os_activity_scope_leave(&v9);
}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v11 = _os_activity_create(&dword_1D7F0A000, "folder didAddIcons:removedIcons:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (!-[SBHIconModel isTrackingIcon:](self, "isTrackingIcon:", v16, (void)v17)) {
          [(SBHIconModel *)self addIcon:v16];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v13);
  }

  [(SBHIconModel *)self _noteRemovedIcons:v10];
  os_activity_scope_leave(&state);
}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  uint64_t v11 = _os_activity_create(&dword_1D7F0A000, "folder didReplaceIcon:withIcon:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &v13);

  if (!-[SBHIconModel isTrackingIcon:](self, "isTrackingIcon:", v10, v13.opaque[0], v13.opaque[1])) {
    [(SBHIconModel *)self addIcon:v10];
  }
  if (v9)
  {
    id v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    [(SBHIconModel *)self _noteRemovedIcons:v12];
  }
  os_activity_scope_leave(&v13);
}

- (void)folder:(id)a3 didAddList:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
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
        if (![(SBHIconModel *)self isTrackingIcon:v10]) {
          [(SBHIconModel *)self addIcon:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (SBHIconGridSize)iconStateUnarchiver:(id)a3 listGridSizeForFolderClass:(Class)a4
{
  return (SBHIconGridSize)[(SBHIconModel *)self listGridSizeForFolderClass:a4];
}

- (SBHIconGridSize)iconStateUnarchiver:(id)a3 listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a4
{
  return (SBHIconGridSize)[(SBHIconModel *)self listWithNonDefaultSizedIconsGridSizeForFolderClass:a4];
}

- (BOOL)iconStateUnarchiver:(id)a3 listsAllowRotatedLayoutForFolderClass:(Class)a4
{
  return [(SBHIconModel *)self listsAllowRotatedLayoutForFolderClass:a4];
}

- (id)iconStateUnarchiver:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4
{
  return [(SBHIconModel *)self allowedGridSizeClassesForFolderClass:a4];
}

- (id)iconStateUnarchiver:(id)a3 didUnarchiveWidgetIcon:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 leafIdentifier];
  uint64_t v7 = [(SBHIconModel *)self widgetIconForLeafIdentifier:v6];

  if (v7 && ([v5 matchesWidgetIcon:v7] & 1) == 0)
  {

    uint64_t v7 = 0;
  }
  uint64_t v8 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = v5;
    }
    id v10 = v9;
    uint64_t v11 = [v8 iconModel:self validatedWidgetIconForWidgetIcon:v10];

    uint64_t v7 = (void *)v11;
  }

  return v7;
}

- (id)iconStateUnarchiver:(id)a3 supportedGridSizeClassesForWidgetWithKind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6
{
  return [(SBHIconModel *)self supportedGridSizeClassesForWidgetWithKind:a4 extensionBundleIdentifier:a5 containerBundleIdentifier:a6];
}

- (int64_t)iconStateUnarchiver:(id)a3 listsFixedIconLocationBehaviorForFolderClass:(Class)a4
{
  return [(SBHIconModel *)self listsFixedIconLocationBehaviorForFolderClass:a4];
}

- (unint64_t)iconStateUnarchiver:(id)a3 listsIconLayoutBehaviorForFolderClass:(Class)a4
{
  return [(SBHIconModel *)self listsIconLayoutBehaviorForFolderClass:a4];
}

- (id)iconStateUnarchiver:(id)a3 iconForRepresentation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 iconModel:self iconForArchiveRepresentation:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)iconStateUnarchiver:(id)a3 iconDataSourceForRepresentation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 iconModel:self iconDataSourceForArchiveRepresentation:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)archiver:(id)a3 representationForIcon:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 iconModel:self archiveRepresentationForIcon:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)archiver:(id)a3 representationForIconDataSource:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 iconModel:self archiveRepresentationForIconDataSource:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)versionForIconStateArchiver:(id)a3
{
  id v4 = [(SBHIconModel *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 archiveVersionForIconModel:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)iconModelApplicationDataSource:(id)a3 applicationsAdded:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(SBHIconModel *)self addApplication:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)iconModelApplicationDataSource:(id)a3 applicationsUpdated:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(SBHIconModel *)self addApplication:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)iconModelApplicationDataSource:(id)a3 applicationsRemoved:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(SBHIconModel *)self removeApplication:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
        long long v11 = v10;
        if (v10 && ![v10 iconDataSourceCount]) {
          [(SBHIconModel *)self removeIcon:v11];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)iconModelApplicationDataSource:(id)a3 applicationPlaceholdersAdded:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(SBHIconModel *)self addApplicationPlaceholder:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)iconModelApplicationDataSource:(id)a3 applicationPlaceholdersRemoved:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(SBHIconModel *)self removeApplicationPlaceholder:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)installedWebClipsDidChange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(SBHIconModel *)self automaticallyAddsWebClips])
  {
    id v3 = [(id)objc_opt_class() allWebClips];
    id v4 = -[SBHIconModel iconsOfClass:](self, "iconsOfClass:", [(id)objc_opt_class() bookmarkIconClass]);
    id v5 = (void *)[v4 mutableCopy];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v12 = objc_msgSend(v11, "identifier", (void)v16);
          long long v13 = [(SBHIconModel *)self bookmarkIconForWebClipIdentifier:v12];
          if (v13) {
            [v5 removeObject:v13];
          }
          else {
            id v14 = [(SBHIconModel *)self addBookmarkIconForWebClip:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    long long v15 = [v5 allObjects];
    [(SBHIconModel *)self removeIcons:v15];
  }
}

- (NSString)description
{
  return (NSString *)[(SBHIconModel *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  os_log_t v2 = [(SBHIconModel *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBHIconModel *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBHIconModel *)self succinctDescriptionBuilder];
  id v5 = [(SBHIconModel *)self store];
  id v6 = (id)[v4 appendObject:v5 withName:@"store"];

  uint64_t v7 = [(SBHIconModel *)self applicationDataSource];
  id v8 = (id)[v4 appendPointer:v7 withName:@"applicationDataSource"];

  uint64_t v9 = [(SBHIconModel *)self rootFolder];
  id v10 = (id)[v4 appendObject:v9 withName:@"rootFolder"];

  id v11 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconModel hasDesiredIconState](self, "hasDesiredIconState"), @"hasDesiredIconState", 1);
  id v12 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconModel ignoresIconsNotInIconState](self, "ignoresIconsNotInIconState"), @"ignoresIconsNotInIconState", 1);
  id v13 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconModel sortsIconsAlphabetically](self, "sortsIconsAlphabetically"), @"sortsIconsAlphabetically", 1);
  id v14 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconModel automaticallyAddsApplications](self, "automaticallyAddsApplications"), @"automaticallyAddsApplications", 0);
  id v15 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconModel automaticallyAddsWebClips](self, "automaticallyAddsWebClips"), @"automaticallyAddsWebClips", 0);
  return v4;
}

- (SBIconModelStore)store
{
  return self->_store;
}

- (SBHIconModelApplicationDataSource)applicationDataSource
{
  return self->_applicationDataSource;
}

- (SBHIconModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHIconModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)visibleIconTags
{
  return self->_visibleIconTags;
}

- (BOOL)automaticallyAddsApplications
{
  return self->_automaticallyAddsApplications;
}

- (void)setAutomaticallyAddsApplications:(BOOL)a3
{
  self->_automaticallyAddsApplications = a3;
}

- (BOOL)automaticallyAddsWebClips
{
  return self->_automaticallyAddsWebClips;
}

- (void)setAutomaticallyAddsWebClips:(BOOL)a3
{
  self->_automaticallyAddsWebClips = a3;
}

- (BOOL)ignoresIconsNotInIconState
{
  return self->_ignoresIconsNotInIconState;
}

- (void)setIgnoresIconsNotInIconState:(BOOL)a3
{
  self->_ignoresIconsNotInIconState = a3;
}

- (BOOL)sortsIconsAlphabetically
{
  return self->_sortsIconsAlphabetically;
}

- (void)setSortsIconsAlphabetically:(BOOL)a3
{
  self->_sortsIconsAlphabetically = a3;
}

- (NSDictionary)desiredIconState
{
  return self->_desiredIconState;
}

- (void)setDesiredIconState:(id)a3
{
}

- (BOOL)isIconStateDirty
{
  return self->_iconStateDirty;
}

- (void)setIconStateDirty:(BOOL)a3
{
  self->_iconStateDirty = a3;
}

- (BOOL)isLayingOut
{
  return self->_layingOut;
}

- (void)setLayingOut:(BOOL)a3
{
  self->_layingOut = a3;
}

- (int64_t)lastLayoutStatus
{
  return self->_lastLayoutStatus;
}

- (void)setLastLayoutStatus:(int64_t)a3
{
  self->_lastLayoutStatus = a3;
}

- (BOOL)isRestoring
{
  return self->_restoring;
}

- (void)setRestoring:(BOOL)a3
{
  self->_restoring = a3;
}

- (BOOL)automaticallyAddsApplicationPlaceholders
{
  return self->_automaticallyAddsApplicationPlaceholders;
}

- (void)setAutomaticallyAddsApplicationPlaceholders:(BOOL)a3
{
  self->_automaticallyAddsApplicationPlaceholders = a3;
}

- (SBIconModelStore)todayListsStore
{
  return self->_todayListsStore;
}

- (BOOL)postsDidAddIconNotification
{
  return self->_postsDidAddIconNotification;
}

- (void)setPostsDidAddIconNotification:(BOOL)a3
{
  self->_postsDidAddIconNotification = a3;
}

- (NSSet)archivedLeafIdentifiers
{
  return self->_archivedLeafIdentifiers;
}

- (void)setArchivedLeafIdentifiers:(id)a3
{
}

- (NSOrderedSet)desiredIconStateFlattened
{
  return self->_desiredIconStateFlattened;
}

- (void)setDesiredIconStateFlattened:(id)a3
{
}

- (SBRootFolder)cachedDesiredRootFolder
{
  return self->_cachedDesiredRootFolder;
}

- (void)setCachedDesiredRootFolder:(id)a3
{
}

- (SBRootFolder)cachedDefaultRootFolder
{
  return self->_cachedDefaultRootFolder;
}

- (void)setCachedDefaultRootFolder:(id)a3
{
}

- (BOOL)isCheckingModelConsistency
{
  return self->_checkingModelConsistency;
}

- (void)setCheckingModelConsistency:(BOOL)a3
{
  self->_checkingModelConsistency = a3;
}

- (SBIcon)rootFolderIcon
{
  return self->_rootFolderIcon;
}

- (void)setRootFolderIcon:(id)a3
{
}

- (NSTimer)autosaveTimer
{
  return self->_autosaveTimer;
}

- (void)setAutosaveTimer:(id)a3
{
}

- (SBSHomeScreenService)homeScreenService
{
  return self->_homeScreenService;
}

- (BSInvalidatable)installedWebClipsObservation
{
  return self->_installedWebClipsObservation;
}

- (void)setInstalledWebClipsObservation:(id)a3
{
}

- (SBHIconGridSizeClassSet)rootFolderAllowedGridSizeClasses
{
  return self->_rootFolderAllowedGridSizeClasses;
}

- (void)setRootFolderAllowedGridSizeClasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFolderAllowedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_installedWebClipsObservation, 0);
  objc_storeStrong((id *)&self->_homeScreenService, 0);
  objc_storeStrong((id *)&self->_autosaveTimer, 0);
  objc_storeStrong((id *)&self->_rootFolderIcon, 0);
  objc_storeStrong((id *)&self->_cachedDefaultRootFolder, 0);
  objc_storeStrong((id *)&self->_cachedDesiredRootFolder, 0);
  objc_storeStrong((id *)&self->_desiredIconStateFlattened, 0);
  objc_storeStrong((id *)&self->_archivedLeafIdentifiers, 0);
  objc_storeStrong((id *)&self->_todayListsStore, 0);
  objc_storeStrong((id *)&self->_desiredIconState, 0);
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationDataSource, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_visibleIconTags, 0);
  objc_storeStrong((id *)&self->_hiddenIconTags, 0);
  objc_storeStrong((id *)&self->_removedIcons, 0);
  objc_storeStrong((id *)&self->_autosaveDisableAssertions, 0);
  objc_storeStrong((id *)&self->_folders, 0);
  objc_storeStrong((id *)&self->_additionalApplicationIconIdentifiers, 0);
  objc_storeStrong((id *)&self->_applicationIconsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetIconsByIdentifier, 0);
  objc_storeStrong((id *)&self->_leafIconsByIdentifier, 0);
}

- (void)setLeafIconsByIdentifier:(id)a3
{
  id v4 = (NSMutableDictionary *)[a3 mutableCopy];
  leafIconsByIdentifier = self->_leafIconsByIdentifier;
  self->_leafIconsByIdentifier = v4;
}

- (void)setForecastedLeavesOnIconModel:(id)a3 includingMissingIcons:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_leafIconsByIdentifier copyItems:1];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
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
        id v15 = objc_msgSend(v8, "objectForKey:", v14, (void)v17);

        if (!v15)
        {
          long long v16 = [[SBLeafIcon alloc] initWithLeafIdentifier:v14 applicationBundleID:v14];
          [v8 setObject:v16 forKey:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [v6 setLeafIconsByIdentifier:v8];
}

void __85__SBHIconModel__adjustedIndexPathInRootFolder_withinIconState_forIconWithIdentifier___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 48);
  int v5 = 138412802;
  uint64_t v6 = v1;
  OUTLINED_FUNCTION_2_0();
  __int16 v7 = v2;
  uint64_t v8 = v3;
  _os_log_error_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_ERROR, "%@: missing expected folder with name '%@' for inserting icon with identifier '%@'", (uint8_t *)&v5, 0x20u);
}

- (void)_getLoadedIconState:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "%@: unable to load layout from the today lists store: %{public}@");
}

- (void)_unarchiveRootFolderWithLayoutStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "%@: icon state was corrupt; reverting to the default platform state",
    (uint8_t *)&v2,
    0xCu);
}

- (void)deleteIconStateWithOptions:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v1, v2, "%@: unable to delete current icon state: %@", (void)v3, DWORD2(v3));
}

- (void)_saveIconState:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "%@: unable to save layout to the today lists store: %{public}@");
}

- (void)_saveIconState:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "%@: unable to save current icon state: %{public}@");
}

- (void)saveIconStateIfNeeded
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Icon model is not marked dirty but has dirty model objects", v1, 2u);
}

- (void)importIconState:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "%@: error saving imported icon state: %{public}@");
}

@end