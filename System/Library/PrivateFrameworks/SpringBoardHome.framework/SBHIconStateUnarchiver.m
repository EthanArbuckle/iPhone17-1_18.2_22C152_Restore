@interface SBHIconStateUnarchiver
+ (void)_getFolderDisplayName:(id *)a3 defaultDisplayName:(id *)a4 uniqueIdentifier:(id *)a5 forRepresentation:(id)a6 iconSource:(id)a7;
- (BOOL)_canAddIconDataSource:(id)a3 toIcon:(id)a4 withGridSizeClass:(id)a5;
- (BOOL)_listsAllowRotatedLayoutForFolderClass:(Class)a3;
- (BOOL)postNewsWidgetMigration;
- (BOOL)removesEmptyFolders;
- (Class)_folderClassForFolderType:(id)a3 context:(id)a4;
- (SBHIconGridSize)_listGridSizeForFavoriteTodayList;
- (SBHIconGridSize)_listGridSizeForFolderClass:(Class)a3;
- (SBHIconGridSize)_listGridSizeForTodayList;
- (SBHIconGridSize)_listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a3;
- (SBHIconModel)iconModel;
- (SBHIconStateUnarchiver)init;
- (SBHIconStateUnarchiver)initWithArchive:(id)a3;
- (SBHIconStateUnarchiver)initWithArchive:(id)a3 iconModel:(id)a4;
- (SBHIconStateUnarchiverDelegate)delegate;
- (SBHIconStateUnarchiverIconSource)iconSource;
- (id)_allowedGridSizeClassesForDock;
- (id)_allowedGridSizeClassesForFolderClass:(Class)a3;
- (id)_allowedGridSizeClassesForTodayList;
- (id)_applicationIconFromRepresentation:(id)a3 context:(id)a4;
- (id)_batteryElementWithIdentifier:(id)a3;
- (id)_customIconElementFromRepresentation:(id)a3 context:(id)a4;
- (id)_folderFromRepresentation:(id)a3 withContext:(id)a4;
- (id)_gridSizeClassSizes;
- (id)_iconFromRepresentation:(id)a3 withContext:(id)a4;
- (id)_listFromRepresentation:(id)a3 properties:(id)a4 identifier:(id)a5 context:(id)a6 overflow:(id)a7;
- (id)_listRotatedLayoutClusterGridSizeClass;
- (id)_listWithIcons:(id)a3 properties:(id)a4 identifier:(id)a5 folder:(id)a6 overflow:(id)a7;
- (id)_newFolderIconForFolder:(id)a3;
- (id)_nodeFromRepresentation:(id)a3 context:(id)a4;
- (id)_rotatedGridSizeClassSizes;
- (id)_sanitizedFixedIconLocationsFromDictionary:(id)a3;
- (id)_widgetIconFromRepresentation:(id)a3 context:(id)a4;
- (id)archive;
- (id)customGridSizeClassDomain;
- (id)dockListProperties;
- (id)effectiveDelegate;
- (id)effectiveGridSizeClassDomain;
- (id)favoriteTodayListProperties;
- (id)gridSizeClassForString:(id)a3;
- (id)ignoredListProperties;
- (id)propertiesForFolderClass:(Class)a3;
- (id)supportedGridSizeClassesForWidgetWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5;
- (id)todayListProperties;
- (id)unarchive;
- (int64_t)_listsFixedIconLocationBehaviorForFolderClass:(Class)a3;
- (int64_t)_suggestionSourceFromRepresentation:(id)a3;
- (unint64_t)_listsIconLayoutBehaviorForFolderClass:(Class)a3;
- (unint64_t)_maxIconCountForDock;
- (unint64_t)_maxListCountForFolders;
- (void)_getFolderDisplayName:(id *)a3 defaultDisplayName:(id *)a4 uniqueIdentifier:(id *)a5 forRepresentation:(id)a6;
- (void)applyProperties:(id)a3 asDefaultPropertiesToFolder:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setIconSource:(id)a3;
- (void)setRemovesEmptyFolders:(BOOL)a3;
@end

@implementation SBHIconStateUnarchiver

- (SBHIconStateUnarchiver)initWithArchive:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconStateUnarchiver;
  v6 = [(SBHIconStateUnarchiver *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_archive, a3);
    v7->_removesEmptyFolders = 1;
  }

  return v7;
}

- (SBHIconStateUnarchiver)initWithArchive:(id)a3 iconModel:(id)a4
{
  id v7 = a4;
  v8 = [(SBHIconStateUnarchiver *)self initWithArchive:a3];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_iconModel, a4);
    objc_storeStrong((id *)&v9->_iconSource, a4);
  }

  return v9;
}

- (SBHIconStateUnarchiver)init
{
  return [(SBHIconStateUnarchiver *)self initWithArchive:MEMORY[0x1E4F1CC08]];
}

- (id)effectiveDelegate
{
  v3 = [(SBHIconStateUnarchiver *)self delegate];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SBHIconStateUnarchiver *)self iconModel];
  }
  v6 = v5;

  return v6;
}

- (id)unarchive
{
  v3 = objc_alloc_init(SBIconStateUnarchiveResult);
  v4 = [(SBHIconStateUnarchiver *)self archive];
  id v5 = [(SBHIconStateUnarchiver *)self iconModel];
  v6 = (void *)MEMORY[0x1D9484600]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v4 objectForKeyedSubscript:@"metadata"];
    [(SBIconStateUnarchiveResult *)v3 _setMetadata:v7];

    v8 = [v5 delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_super v9 = [(SBIconStateUnarchiveResult *)v3 metadata];
      [v8 willUnarchiveIconModel:v5 withMetadata:v9];
    }
  }
  v10 = [(SBHIconStateUnarchiver *)self _nodeFromRepresentation:v4 context:v3];
  [(SBIconStateUnarchiveResult *)v3 setRootNode:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SBIconStateUnarchiveResult *)v3 _setRootFolder:v10];
  }
  if (objc_opt_respondsToSelector())
  {
    v11 = [(SBHIconStateUnarchiver *)self customGridSizeClassDomain];
    [v10 setGridSizeClassDomain:v11];
  }

  return v3;
}

- (id)_nodeFromRepresentation:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 objectForKeyedSubscript:@"widgetVersion"];
    self->_postNewsWidgetMigration = [v8 unsignedIntegerValue] != 0;

    uint64_t v9 = [(SBHIconStateUnarchiver *)self _folderFromRepresentation:v6 withContext:v7];
LABEL_7:
    v13 = (void *)v9;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v7 _currentFolder];
    uint64_t v11 = objc_opt_class();

    v12 = [(SBHIconStateUnarchiver *)self propertiesForFolderClass:v11];
    v13 = [(SBHIconStateUnarchiver *)self _listFromRepresentation:v6 properties:v12 identifier:0 context:v7 overflow:0];

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SBHIconStateUnarchiver *)self _iconFromRepresentation:v6 withContext:v7];
    goto LABEL_7;
  }
  v15 = SBLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[SBHIconStateUnarchiver _nodeFromRepresentation:context:]();
  }

  [v7 _noteRepresentationIsCorrupted];
  v13 = 0;
LABEL_8:

  return v13;
}

- (id)_newFolderIconForFolder:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = [[SBFolderIcon alloc] initWithFolder:v3];

  return v4;
}

- (id)_iconFromRepresentation:(id)a3 withContext:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(SBHIconStateUnarchiver *)self iconSource];
  uint64_t v9 = [(SBHIconStateUnarchiver *)self iconModel];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = SBLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.7();
      }

      goto LABEL_26;
    }
    uint64_t v11 = [v6 objectForKey:@"iconType"];
    if ([v11 isEqual:@"custom"])
    {
      uint64_t v13 = [(SBHIconStateUnarchiver *)self _widgetIconFromRepresentation:v6 context:v7];
      if (!v13)
      {
        v14 = SBLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.4();
        }
LABEL_47:

        [v7 _noteSignificantDeviation];
        goto LABEL_48;
      }
      goto LABEL_34;
    }
    if ([v11 isEqual:@"app"])
    {
      uint64_t v13 = [(SBHIconStateUnarchiver *)self _applicationIconFromRepresentation:v6 context:v7];
      if (!v13)
      {
        v14 = SBLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.5();
        }
        goto LABEL_47;
      }
LABEL_34:
      id v18 = (id)v13;
      goto LABEL_22;
    }
    if (v11)
    {
LABEL_48:
      id v18 = 0;
      goto LABEL_22;
    }
    v25 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
    v26 = [v6 objectForKey:@"iconLists"];
    if (v26)
    {
    }
    else if (objc_opt_respondsToSelector())
    {
      id v18 = [v25 iconStateUnarchiver:self iconForRepresentation:v6];
      if (v18) {
        goto LABEL_61;
      }
    }
    [v7 _noteEnteredNode];
    v27 = [(SBHIconStateUnarchiver *)self _folderFromRepresentation:v6 withContext:v7];
    v28 = v27;
    if (!v27
      || [v27 isEmpty]
      && [(SBHIconStateUnarchiver *)self removesEmptyFolders]
      && [v28 shouldRemoveWhenEmpty])
    {
      [v7 _noteExitedNode];
    }
    else
    {
      id v18 = [(SBHIconStateUnarchiver *)self _newFolderIconForFolder:v28];
      [v7 _noteExitedNode];
      if (v18)
      {
LABEL_60:

LABEL_61:
        goto LABEL_22;
      }
    }
    v29 = SBLogCommon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.6();
    }

    id v18 = 0;
    goto LABEL_60;
  }
  id v10 = v6;
  uint64_t v11 = v10;
  if (v9)
  {
    id v12 = [(id)objc_opt_class() migratedIdentifierForLeafIdentifier:v10];
  }
  else
  {
    id v12 = v10;
  }
  v16 = v12;
  if (([v12 isEqualToString:v11] & 1) == 0)
  {
    v17 = SBLogIcon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v30 = 138412546;
      id v31 = v11;
      __int16 v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_INFO, "Migrated identifier for %@ to %@", (uint8_t *)&v30, 0x16u);
    }

    [v7 _noteSignificantDeviation];
  }
  id v18 = [v8 leafIconForIdentifier:v16];
  if (!v18)
  {
    v19 = SBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:]();
    }
  }
LABEL_22:

  if (v18)
  {
    v20 = [v18 nodeIdentifier];
    if ([v7 _isNodeIdentifierAlreadyUnarchived:v20])
    {
      v21 = SBLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:]();
      }
    }
    else
    {
      if (!v9 || [v9 isIconVisible:v18])
      {
        [v7 _noteNodeIdentifierWasUnarchived:v20];
        id v23 = v18;
LABEL_38:

        goto LABEL_39;
      }
      v21 = SBLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:]();
      }
    }

    [v7 _noteSignificantDeviation];
    id v23 = 0;
    goto LABEL_38;
  }
LABEL_26:
  v22 = SBLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    int v30 = 138412290;
    id v31 = v6;
    _os_log_impl(&dword_1D7F0A000, v22, OS_LOG_TYPE_INFO, "could not find icon for representation=%@", (uint8_t *)&v30, 0xCu);
  }

  [v7 _noteSignificantDeviation];
  id v23 = 0;
LABEL_39:

  return v23;
}

- (Class)_folderClassForFolderType:(id)a3 context:(id)a4
{
  id v5 = a4;
  if (([a3 isEqualToString:@"folder"] & 1) == 0) {
    [v5 _currentParseDepth];
  }
  id v6 = objc_opt_class();

  return (Class)v6;
}

+ (void)_getFolderDisplayName:(id *)a3 defaultDisplayName:(id *)a4 uniqueIdentifier:(id *)a5 forRepresentation:(id)a6 iconSource:(id)a7
{
  id v19 = a6;
  id v11 = a7;
  id v12 = [v19 objectForKey:@"defaultDisplayName"];
  if ([v12 isEqualToString:&stru_1F2FA0300])
  {

    goto LABEL_6;
  }
  if (!v12)
  {
LABEL_6:
    uint64_t v13 = [v19 objectForKey:@"displayName"];
    id v12 = 0;
    if (v13) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v13 = [v11 localizedFolderNameForDefaultDisplayName:v12];
  if (v13) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v13 = [v11 localizedDefaultFolderName];
  uint64_t v14 = [v11 unlocalizedDefaultFolderName];

  id v12 = (void *)v14;
LABEL_8:
  if (a3) {
    *a3 = v13;
  }
  if (a4) {
    *a4 = v12;
  }
  if (a5)
  {
    v15 = [v19 objectForKey:@"uniqueIdentifier"];
    v16 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {

      v15 = 0;
    }
    id v18 = v15;
    *a5 = v18;
  }
}

- (void)_getFolderDisplayName:(id *)a3 defaultDisplayName:(id *)a4 uniqueIdentifier:(id *)a5 forRepresentation:(id)a6
{
  id v10 = a6;
  id v11 = objc_opt_class();
  id v12 = [(SBHIconStateUnarchiver *)self iconModel];
  [v11 _getFolderDisplayName:a3 defaultDisplayName:a4 uniqueIdentifier:a5 forRepresentation:v10 iconSource:v12];
}

- (SBHIconGridSize)_listGridSizeForFolderClass:(Class)a3
{
  id v5 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v5 iconStateUnarchiver:self listGridSizeForFolderClass:a3];
    unsigned int v7 = v6 & 0xFFFF0000;
    int v8 = (unsigned __int16)v6;
  }
  else
  {
    unsigned int v7 = 196608;
    int v8 = 3;
  }

  return (SBHIconGridSize)(v7 | v8);
}

- (SBHIconGridSize)_listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a3
{
  id v5 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    SBHIconGridSize v6 = (SBHIconGridSize)[v5 iconStateUnarchiver:self listWithNonDefaultSizedIconsGridSizeForFolderClass:a3];
  }
  else {
    SBHIconGridSize v6 = 0;
  }

  return v6;
}

- (SBHIconGridSize)_listGridSizeForTodayList
{
  v2 = [(SBHIconStateUnarchiver *)self iconModel];
  id v3 = v2;
  if (v2) {
    SBHIconGridSize v4 = (SBHIconGridSize)([v2 maxColumnCountForTodayList] | 0xFFFF0000);
  }
  else {
    SBHIconGridSize v4 = (SBHIconGridSize)-65532;
  }

  return v4;
}

- (SBHIconGridSize)_listGridSizeForFavoriteTodayList
{
  id v3 = [(SBHIconStateUnarchiver *)self iconModel];
  SBHIconGridSize v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 maxRowCountForFavoriteTodayList] << 16;
  }
  else {
    unsigned int v5 = 0x40000;
  }
  unsigned __int16 v6 = (unsigned __int16)[(SBHIconStateUnarchiver *)self _listGridSizeForTodayList];

  return (SBHIconGridSize)(v6 | v5);
}

- (unint64_t)_maxListCountForFolders
{
  id v3 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 maxListCountForFoldersForIconStateUnarchiver:self];
  }
  else {
    unint64_t v4 = 10;
  }

  return v4;
}

- (unint64_t)_maxIconCountForDock
{
  id v3 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 maxIconCountForDockForIconStateUnarchiver:self];
  }
  else {
    unint64_t v4 = 10;
  }

  return v4;
}

- (id)_gridSizeClassSizes
{
  id v3 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 gridSizeClassSizesForIconStateUnarchiver:self];
  }
  else
  {
    unint64_t v4 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  }
  unsigned int v5 = v4;

  return v5;
}

- (id)_rotatedGridSizeClassSizes
{
  id v3 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 rotatedGridSizeClassSizesForIconStateUnarchiver:self];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_listRotatedLayoutClusterGridSizeClass
{
  id v3 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 listRotatedLayoutClusterGridSizeClassForIconStateUnarchiver:self];
  }
  else
  {
    unint64_t v4 = @"SBHIconGridSizeClassDefault";
  }
  unsigned int v5 = v4;

  return v5;
}

- (BOOL)_listsAllowRotatedLayoutForFolderClass:(Class)a3
{
  unsigned int v5 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconStateUnarchiver:self listsAllowRotatedLayoutForFolderClass:a3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)_allowedGridSizeClassesForFolderClass:(Class)a3
{
  unsigned int v5 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconStateUnarchiver:self allowedGridSizeClassesForFolderClass:a3];
  }
  else {
  char v6 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
  }

  return v6;
}

- (id)_allowedGridSizeClassesForDock
{
  id v3 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 allowedGridSizeClassesForDockForIconStateUnarchiver:self];
  }
  else {
  unint64_t v4 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
  }

  return v4;
}

- (id)_allowedGridSizeClassesForTodayList
{
  id v3 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 allowedGridSizeClassesForTodayListForIconStateUnarchiver:self];
  }
  else
  {
    unsigned int v5 = [SBHIconGridSizeClassSet alloc];
    char v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", 0);
    unint64_t v4 = [(SBHIconGridSizeClassSet *)v5 initWithGridSizeClasses:v6];
  }
  return v4;
}

- (int64_t)_listsFixedIconLocationBehaviorForFolderClass:(Class)a3
{
  unsigned int v5 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    int64_t v6 = [v5 iconStateUnarchiver:self listsFixedIconLocationBehaviorForFolderClass:a3];
  }
  else {
    int64_t v6 = 1;
  }

  return v6;
}

- (unint64_t)_listsIconLayoutBehaviorForFolderClass:(Class)a3
{
  unsigned int v5 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v6 = [v5 iconStateUnarchiver:self listsIconLayoutBehaviorForFolderClass:a3];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)customGridSizeClassDomain
{
  id v3 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 iconGridSizeClassDomainForIconStateUnarchiver:self];
  }
  else {
  unint64_t v4 = +[SBHIconGridSizeClassDomain globalDomain];
  }

  return v4;
}

- (id)effectiveGridSizeClassDomain
{
  v2 = [(SBHIconStateUnarchiver *)self customGridSizeClassDomain];
  if (!v2)
  {
    v2 = +[SBHIconGridSizeClassDomain globalDomain];
  }
  return v2;
}

- (id)propertiesForFolderClass:(Class)a3
{
  unsigned int v5 = objc_alloc_init(SBHIconStateArchiverListProperties);
  unint64_t v6 = [(SBHIconStateUnarchiver *)self _gridSizeClassSizes];
  int v8 = v6;
  if (v5)
  {
    objc_setProperty_nonatomic_copy(v5, v7, v6, 24);

    v5->_listGridSize = [(SBHIconStateUnarchiver *)self _listGridSizeForFolderClass:a3];
    v5->_listWithNonDefaultSizedIconsGridSize = [(SBHIconStateUnarchiver *)self _listWithNonDefaultSizedIconsGridSizeForFolderClass:a3];
    uint64_t v9 = [(SBHIconStateUnarchiver *)self _listRotatedLayoutClusterGridSizeClass];
    objc_setProperty_nonatomic_copy(v5, v10, v9, 56);
  }
  else
  {

    [(SBHIconStateUnarchiver *)self _listGridSizeForFolderClass:a3];
    [(SBHIconStateUnarchiver *)self _listWithNonDefaultSizedIconsGridSizeForFolderClass:a3];
    uint64_t v9 = [(SBHIconStateUnarchiver *)self _listRotatedLayoutClusterGridSizeClass];
  }

  id v12 = [(SBHIconStateUnarchiver *)self _allowedGridSizeClassesForFolderClass:a3];
  if (v5) {
    objc_setProperty_nonatomic_copy(v5, v11, v12, 40);
  }

  uint64_t v13 = [(SBHIconStateUnarchiver *)self customGridSizeClassDomain];
  -[SBHIconStateArchiverListProperties setGridSizeClassDomain:]((uint64_t)v5, v13);

  BOOL v14 = [(SBHIconStateUnarchiver *)self _listsAllowRotatedLayoutForFolderClass:a3];
  if (v5)
  {
    v5->_allowRotatedLayout = v14;
    v5->_fixedIconLocationBehavior = [(SBHIconStateUnarchiver *)self _listsFixedIconLocationBehaviorForFolderClass:a3];
    v5->_iconLayoutBehavior = [(SBHIconStateUnarchiver *)self _listsIconLayoutBehaviorForFolderClass:a3];
    v15 = [(SBHIconStateUnarchiver *)self _rotatedGridSizeClassSizes];
    objc_setProperty_nonatomic_copy(v5, v16, v15, 32);
  }
  else
  {
    [(SBHIconStateUnarchiver *)self _listsFixedIconLocationBehaviorForFolderClass:a3];
    [(SBHIconStateUnarchiver *)self _listsIconLayoutBehaviorForFolderClass:a3];
    v15 = [(SBHIconStateUnarchiver *)self _rotatedGridSizeClassSizes];
  }

  return v5;
}

- (void)applyProperties:(id)a3 asDefaultPropertiesToFolder:(id)a4
{
  uint64_t v9 = (unsigned __int8 *)a3;
  id v5 = a4;
  unint64_t v6 = v5;
  if (v9)
  {
    [v5 setListRotatedLayoutClusterGridSizeClass:*((void *)v9 + 7)];
    uint64_t v7 = *((void *)v9 + 5);
  }
  else
  {
    [v5 setListRotatedLayoutClusterGridSizeClass:0];
    uint64_t v7 = 0;
  }
  [v6 setListAllowedGridSizeClasses:v7];
  if (v9)
  {
    [v6 setGridSizeClassDomain:*((void *)v9 + 6)];
    [v6 setListsAllowRotatedLayout:v9[8]];
    [v6 setListWithNonDefaultSizedIconsGridSize:*(unsigned int *)(v9 + 14)];
    [v6 setListsFixedIconLocationBehavior:*((void *)v9 + 8)];
    [v6 setListsIconLayoutBehavior:*((void *)v9 + 9)];
    uint64_t v8 = *((void *)v9 + 4);
  }
  else
  {
    [v6 setGridSizeClassDomain:0];
    [v6 setListsAllowRotatedLayout:0];
    [v6 setListWithNonDefaultSizedIconsGridSize:0];
    [v6 setListsFixedIconLocationBehavior:0];
    [v6 setListsIconLayoutBehavior:0];
    uint64_t v8 = 0;
  }
  [v6 setRotatedIconGridSizeClassSizes:v8];
}

- (id)dockListProperties
{
  id v3 = objc_alloc_init(SBHIconStateArchiverListProperties);
  unint64_t v4 = [(SBHIconStateUnarchiver *)self _gridSizeClassSizes];
  unint64_t v6 = v4;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v5, v4, 24);

    v3->_listGridSize = (SBHIconGridSize)((unsigned __int16)[(SBHIconStateUnarchiver *)self _maxIconCountForDock] | 0x10000);
    v3->_listWithNonDefaultSizedIconsGridSize = 0;
    uint64_t v7 = [(SBHIconStateUnarchiver *)self _listRotatedLayoutClusterGridSizeClass];
    objc_setProperty_nonatomic_copy(v3, v8, v7, 56);
  }
  else
  {

    [(SBHIconStateUnarchiver *)self _maxIconCountForDock];
    uint64_t v7 = [(SBHIconStateUnarchiver *)self _listRotatedLayoutClusterGridSizeClass];
  }

  uint64_t v9 = [(SBHIconStateUnarchiver *)self _allowedGridSizeClassesForDock];
  id v11 = v9;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v10, v9, 40);

    id v12 = [(SBHIconStateUnarchiver *)self customGridSizeClassDomain];
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:]((uint64_t)v3, v12);

    v3->_allowRotatedLayout = 0;
    v3->_fixedIconLocationBehavior = 0;
    v3->_iconLayoutBehavior = 0;
  }
  else
  {

    BOOL v14 = [(SBHIconStateUnarchiver *)self customGridSizeClassDomain];
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:](0, v14);
  }
  return v3;
}

- (id)todayListProperties
{
  id v3 = objc_alloc_init(SBHIconStateArchiverListProperties);
  unint64_t v4 = [(SBHIconStateUnarchiver *)self _gridSizeClassSizes];
  unint64_t v6 = v4;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v5, v4, 24);

    v3->_listGridSize = [(SBHIconStateUnarchiver *)self _listGridSizeForTodayList];
    v3->_listWithNonDefaultSizedIconsGridSize = 0;
    uint64_t v7 = [(SBHIconStateUnarchiver *)self _listRotatedLayoutClusterGridSizeClass];
    objc_setProperty_nonatomic_copy(v3, v8, v7, 56);
  }
  else
  {

    [(SBHIconStateUnarchiver *)self _listGridSizeForTodayList];
    uint64_t v7 = [(SBHIconStateUnarchiver *)self _listRotatedLayoutClusterGridSizeClass];
  }

  uint64_t v9 = [(SBHIconStateUnarchiver *)self _allowedGridSizeClassesForTodayList];
  id v11 = v9;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v10, v9, 40);

    id v12 = [(SBHIconStateUnarchiver *)self customGridSizeClassDomain];
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:]((uint64_t)v3, v12);

    v3->_allowRotatedLayout = 0;
    *(_OWORD *)&v3->_fixedIconLocationBehavior = xmmword_1D81E4F70;
  }
  else
  {

    BOOL v14 = [(SBHIconStateUnarchiver *)self customGridSizeClassDomain];
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:](0, v14);
  }
  return v3;
}

- (id)favoriteTodayListProperties
{
  uint64_t v3 = [(SBHIconStateUnarchiver *)self todayListProperties];
  SBHIconGridSize v4 = (SBHIconGridSize)[(SBHIconStateUnarchiver *)self _listGridSizeForFavoriteTodayList];
  if (v3) {
    *(SBHIconGridSize *)(v3 + 10) = v4;
  }
  return (id)v3;
}

- (id)ignoredListProperties
{
  uint64_t v3 = objc_alloc_init(SBHIconStateArchiverListProperties);
  SBHIconGridSize v4 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  unint64_t v6 = v4;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v5, v4, 24);

    v3->_listGridSize = (SBHIconGridSize)-65535;
    v3->_listWithNonDefaultSizedIconsGridSize = 0;
    objc_setProperty_nonatomic_copy(v3, v7, @"SBHIconGridSizeClassDefault", 56);
  }
  else
  {
  }
  SEL v8 = +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses];
  SEL v10 = v8;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v9, v8, 40);

    id v11 = [(SBHIconStateUnarchiver *)self customGridSizeClassDomain];
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:]((uint64_t)v3, v11);

    v3->_allowRotatedLayout = 0;
    *(_OWORD *)&v3->_fixedIconLocationBehavior = xmmword_1D81E4F70;
    v3->_listAddOptions = 0x100000;
  }
  else
  {

    uint64_t v13 = [(SBHIconStateUnarchiver *)self customGridSizeClassDomain];
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:](0, v13);
  }
  return v3;
}

- (id)_folderFromRepresentation:(id)a3 withContext:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  SEL v8 = [v6 objectForKey:@"listType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  SEL v10 = [(SBHIconStateUnarchiver *)self _folderClassForFolderType:v9 context:v7];
  if (v10)
  {
    id v11 = v10;
    SBHIconGridSize v12 = (SBHIconGridSize)[(SBHIconStateUnarchiver *)self _listGridSizeForFolderClass:v10];
    unint64_t v13 = [(SBHIconStateUnarchiver *)self _maxListCountForFolders];
    uint64_t v14 = [(SBHIconStateUnarchiver *)self _gridSizeClassSizes];
    id v75 = 0;
    id v76 = 0;
    id v74 = 0;
    v65 = v6;
    [(SBHIconStateUnarchiver *)self _getFolderDisplayName:&v76 defaultDisplayName:&v75 uniqueIdentifier:&v74 forRepresentation:v6];
    id v15 = v76;
    id v16 = v75;
    id v60 = v74;
    v61 = v15;
    v62 = (void *)v14;
    v17 = (void *)[[v11 alloc] initWithUniqueIdentifier:v60 displayName:v15 maxListCount:v13 listGridSize:*(unsigned int *)&v12 iconGridSizeClassSizes:v14];
    id v18 = v17;
    if (v16) {
      [v17 setDefaultDisplayName:v16];
    }
    id v19 = [(SBHIconStateUnarchiver *)self propertiesForFolderClass:v11];
    -[SBHIconStateUnarchiver applyProperties:asDefaultPropertiesToFolder:](self, "applyProperties:asDefaultPropertiesToFolder:");
    v59 = [v18 startCoalescingContentChangesForReason:@"SBResettingIconsCoalesceID"];
    [v7 _pushFolder:v18];
    id v6 = v65;
    v20 = [v65 objectForKey:@"iconLists"];
    id v63 = v16;
    v64 = v20;
    if (v20)
    {
      v21 = [v65 objectForKey:@"listUniqueIdentifiers"];
      v22 = [v65 objectForKey:@"listMetadata"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (!v21
         || (self,
             id v23 = objc_claimAutoreleasedReturnValue(),
             char isKindOfClass = objc_opt_isKindOfClass(),
             v23,
             (isKindOfClass & 1) != 0)))
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v64, "count"));
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke;
        v66[3] = &unk_1E6AAE490;
        id v67 = v21;
        id v68 = v25;
        id v26 = v18;
        id v69 = v26;
        v70 = self;
        id v71 = v19;
        id v72 = v7;
        id v73 = v22;
        id v27 = v25;
        [v64 enumerateObjectsUsingBlock:v66];
        [v26 _setLists:v27];
      }
      else
      {
        v29 = SBLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:].cold.6();
        }

        [v7 _noteRepresentationIsCorrupted];
      }

      id v16 = v63;
      v20 = v64;
      id v6 = v65;
    }
    else
    {
      int v30 = SBLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:].cold.5();
      }

      [v7 _noteRepresentationIsCorrupted];
    }
    if ([v18 isRootFolder])
    {
      uint64_t v31 = [v6 objectForKey:@"buttonBar"];
      if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v34 = SBLogCommon();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:].cold.4();
        }

        [v7 _noteRepresentationIsCorrupted];
      }
      else
      {
        __int16 v32 = [(SBHIconStateUnarchiver *)self dockListProperties];
        v33 = [(SBHIconStateUnarchiver *)self _listFromRepresentation:v31 properties:v32 identifier:0 context:v7 overflow:0];
        [v18 _setDock:v33];
      }
      v35 = [v6 objectForKey:@"today"];
      if (v35
        && (self,
            v36 = objc_claimAutoreleasedReturnValue(),
            char v37 = objc_opt_isKindOfClass(),
            v36,
            (v37 & 1) == 0))
      {
        v40 = SBLogCommon();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:]();
        }

        [v7 _noteRepresentationIsCorrupted];
      }
      else
      {
        v38 = [(SBHIconStateUnarchiver *)self todayListProperties];
        v39 = [(SBHIconStateUnarchiver *)self _listFromRepresentation:v35 properties:v38 identifier:0 context:v7 overflow:0];
        [v18 _setTodayList:v39];
      }
      v41 = [v6 objectForKey:@"favoriteToday"];
      v57 = v19;
      if (v41
        && (self,
            v42 = objc_claimAutoreleasedReturnValue(),
            char v43 = objc_opt_isKindOfClass(),
            v42,
            (v43 & 1) == 0))
      {
        v47 = SBLogCommon();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:]();
        }
        v44 = (void *)v31;

        [v7 _noteRepresentationIsCorrupted];
      }
      else
      {
        v44 = (void *)v31;
        v45 = [(SBHIconStateUnarchiver *)self todayListProperties];
        v46 = [(SBHIconStateUnarchiver *)self _listFromRepresentation:v41 properties:v45 identifier:0 context:v7 overflow:0];
        [v18 _setFavoriteTodayList:v46];
      }
      v48 = objc_msgSend(v65, "objectForKey:", @"ignored", v57);
      if (v48
        && (self,
            v49 = objc_claimAutoreleasedReturnValue(),
            char v50 = objc_opt_isKindOfClass(),
            v49,
            (v50 & 1) == 0))
      {
        v53 = SBLogCommon();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:]();
        }

        [v7 _noteRepresentationIsCorrupted];
      }
      else
      {
        v51 = [(SBHIconStateUnarchiver *)self ignoredListProperties];
        v52 = [(SBHIconStateUnarchiver *)self _listFromRepresentation:v48 properties:v51 identifier:0 context:v7 overflow:0];
        [v18 _setIgnoredList:v52];
      }
      id v16 = v63;
      v20 = v64;
      id v6 = v65;
      id v19 = v58;
    }
    [v18 compactLists];
    if (![v18 visibleListCount])
    {
      v54 = [v18 firstList];
      [v54 setHidden:0];
    }
    id v55 = (id)[v7 _popFolder];
    [v59 invalidate];
    [v18 markIconStateClean];
  }
  else
  {
    v28 = SBLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v78 = v6;
      _os_log_impl(&dword_1D7F0A000, v28, OS_LOG_TYPE_INFO, "could not construct folder for representation=%@", buf, 0xCu);
    }

    [v7 _noteSignificantDeviation];
    id v18 = 0;
  }

  return v18;
}

void __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!v6
     || (self,
         id v7 = objc_claimAutoreleasedReturnValue(),
         char v8 = objc_opt_isKindOfClass(),
         v7,
         (v8 & 1) != 0)))
  {
    unint64_t v9 = [*(id *)(a1 + 40) count];
    if (v9 < [*(id *)(a1 + 48) maxListCount])
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v11 = [*(id *)(a1 + 56) _listFromRepresentation:v5 properties:*(void *)(a1 + 64) identifier:v6 context:*(void *)(a1 + 72) overflow:v10];
      if (v11) {
        [*(id *)(a1 + 40) addObject:v11];
      }
      if (!v6) {
        goto LABEL_47;
      }
      SBHIconGridSize v12 = [*(id *)(a1 + 80) objectForKey:v6];
      if (!v12) {
        goto LABEL_47;
      }
      unint64_t v13 = v12;
      uint64_t v14 = [v12 objectForKey:@"hiddenDate"];
      v61 = (void *)v14;
      if (v14)
      {
        uint64_t v15 = v14;
        id v16 = v11;
        uint64_t v17 = 1;
        uint64_t v18 = v15;
      }
      else
      {
        id v16 = v11;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
      }
      [v16 setHidden:v17 byUser:1 hiddenDate:v18];
      id v60 = [v13 objectForKey:@"focusModeIdentifiers"];
      v59 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
      objc_msgSend(v11, "setFocusModeIdentifiers:");
      v21 = [v13 objectForKey:@"overflowSlotCount"];
      v22 = v13;
      uint64_t v23 = [v21 unsignedIntegerValue];

      [v11 setOverflowSlotCount:v23];
      v62 = v22;
      uint64_t v24 = [v22 objectForKey:@"rotatedOrder"];
      v25 = self;
      id v63 = (void *)v24;
      LOBYTE(v24) = objc_opt_isKindOfClass();

      if (v24)
      {
        id v68 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v63, "count"));
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id obj = v63;
        uint64_t v26 = [obj countByEnumeratingWithState:&v70 objects:v82 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v66 = *(void *)v71;
LABEL_24:
          uint64_t v28 = 0;
          while (1)
          {
            if (*(void *)v71 != v66) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = *(void *)(*((void *)&v70 + 1) + 8 * v28);
            int v30 = self;
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0) {
              break;
            }
            uint64_t v32 = [v11 directlyContainedIconWithIdentifier:v29];
            if (!v32) {
              break;
            }
            v33 = (void *)v32;
            [v68 addObject:v32];

            if (v27 == ++v28)
            {
              uint64_t v27 = [obj countByEnumeratingWithState:&v70 objects:v82 count:16];
              if (v27) {
                goto LABEL_24;
              }
              break;
            }
          }
        }

        uint64_t v34 = [v68 count];
        if (v34 == [v11 numberOfIcons]) {
          [v11 _setRotatedIcons:v68 clearRotatedFixedIconLocations:1];
        }
      }
      v35 = v62;
      v36 = [v62 objectForKey:@"fixedLocations"];
      char v37 = [v62 objectForKey:@"fixedLocationsGridColumns"];
      uint64_t v38 = [v62 objectForKey:@"fixedLocationsGridRows"];
      v39 = (void *)v38;
      uint64_t v40 = *(void *)(a1 + 64);
      if (v40 && *(void *)(v40 + 64))
      {
        id v69 = (void *)v38;
        uint64_t v41 = self;
        v42 = v36;
        char v43 = v41;
        id v67 = v42;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_45:

          v36 = v67;
          v39 = v69;
          goto LABEL_46;
        }
        v44 = self;
        id obja = v37;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v35 = v62;
LABEL_44:
          char v37 = obja;
          goto LABEL_45;
        }
        v45 = self;
        v39 = v69;
        char v46 = objc_opt_isKindOfClass();

        v35 = v62;
        char v37 = obja;
        v36 = v67;
        if (v46)
        {
          unsigned __int16 v47 = [obja unsignedIntegerValue];
          int v48 = [v69 unsignedIntegerValue];
          unsigned int v58 = [v11 gridSize];
          if (!SBHIconGridSizeEqualToIconGridSize((v48 << 16) | v47, v58))
          {
            char v43 = SBLogCommon();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218752;
              uint64_t v75 = v47;
              __int16 v76 = 2048;
              uint64_t v77 = (unsigned __int16)v48;
              __int16 v78 = 2048;
              uint64_t v79 = (unsigned __int16)v58;
              __int16 v80 = 2048;
              uint64_t v81 = HIWORD(v58);
              _os_log_impl(&dword_1D7F0A000, v43, OS_LOG_TYPE_DEFAULT, "Discarding fixed icon positions because archived grid size (%lu×%lu) does not match actual list size (%lu×%lu)", buf, 0x2Au);
            }
            goto LABEL_45;
          }
          char v43 = [*(id *)(a1 + 56) _sanitizedFixedIconLocationsFromDictionary:v67];
          [v11 setFixedIconLocations:v43];
          [v11 removeFixedIconLocationsIfPossibleWithGridCellInfoOptions:0];
          v49 = [v62 objectForKey:@"rotatedFixedLocations"];
          char v50 = self;
          char v51 = objc_opt_isKindOfClass();

          if (v51)
          {
            v52 = [*(id *)(a1 + 56) _sanitizedFixedIconLocationsFromDictionary:v49];
            [v11 setRotatedFixedIconLocations:v52];
            [v11 removeFixedIconLocationsIfPossibleWithGridCellInfoOptions:2];
          }
          goto LABEL_44;
        }
      }
LABEL_46:

      do
      {
LABEL_47:
        v53 = v11;
        if (![v10 count]) {
          break;
        }
        unint64_t v54 = [*(id *)(a1 + 40) count];
        if (v54 >= [*(id *)(a1 + 48) maxListCount]) {
          break;
        }
        id v55 = (void *)[v10 copy];
        [v10 removeAllObjects];
        id v11 = [*(id *)(a1 + 56) _listWithIcons:v55 properties:*(void *)(a1 + 64) identifier:0 folder:*(void *)(a1 + 48) overflow:v10];

        if (v11 && ([v11 isEmpty] & 1) == 0) {
          [*(id *)(a1 + 40) addObject:v11];
        }
        int v56 = [v55 isEqualToArray:v10];
      }
      while (!v56);
      if ([v10 count])
      {
        v57 = SBLogCommon();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_1();
        }
      }
      goto LABEL_58;
    }
    v20 = SBLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_2();
    }
  }
  else
  {
    id v19 = SBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_3();
    }

    [*(id *)(a1 + 72) _noteRepresentationIsCorrupted];
  }
LABEL_58:
}

- (id)_listFromRepresentation:(id)a3 properties:(id)a4 identifier:(id)a5 context:(id)a6 overflow:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v29 = a4;
  id v28 = a5;
  id v13 = a6;
  id v27 = a7;
  [v13 _noteEnteredNode];
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1D9484600]();
        v22 = [(SBHIconStateUnarchiver *)self _iconFromRepresentation:v20 withContext:v13];
        if (v22)
        {
          [v14 addObject:v22];
        }
        else
        {
          uint64_t v23 = SBLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v35 = v15;
            _os_log_error_impl(&dword_1D7F0A000, v23, OS_LOG_TYPE_ERROR, "could not make icon from representation: %@", buf, 0xCu);
          }

          [v13 _noteSignificantDeviation];
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v17);
  }

  uint64_t v24 = [v13 _currentFolder];
  v25 = [(SBHIconStateUnarchiver *)self _listWithIcons:v14 properties:v29 identifier:v28 folder:v24 overflow:v27];
  if ([v27 count]) {
    [v13 _noteSignificantDeviation];
  }
  [v13 _noteExitedNode];

  return v25;
}

- (id)_listWithIcons:(id)a3 properties:(id)a4 identifier:(id)a5 folder:(id)a6 overflow:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = (char *)a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12) {
    uint64_t v16 = *(unsigned int *)(v12 + 10);
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = objc_alloc((Class)[v14 listModelClass]);
  if (v12) {
    uint64_t v18 = *((void *)v12 + 3);
  }
  else {
    uint64_t v18 = 0;
  }
  v36 = v13;
  uint64_t v19 = (void *)[v17 initWithUniqueIdentifier:v13 folder:v14 gridSize:v16 gridSizeClassSizes:v18];
  uint64_t v20 = v19;
  if (v12)
  {
    [v19 setAllowedGridSizeClasses:*((void *)v12 + 5)];
    uint64_t v21 = *((void *)v12 + 6);
  }
  else
  {
    [v19 setAllowedGridSizeClasses:0];
    uint64_t v21 = 0;
  }
  [v20 setGridSizeClassDomain:v21];
  if (v12)
  {
    [v20 setAllowsRotatedLayout:v12[8]];
    uint64_t v22 = *((void *)v12 + 7);
  }
  else
  {
    [v20 setAllowsRotatedLayout:0];
    uint64_t v22 = 0;
  }
  [v20 setRotatedLayoutClusterGridSizeClass:v22];
  if (v12)
  {
    [v20 setFixedIconLocationBehavior:*((void *)v12 + 8)];
    [v20 setIconLayoutBehavior:*((void *)v12 + 9)];
    [v20 setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:*(unsigned int *)(v12 + 14)];
    uint64_t v23 = *((void *)v12 + 4);
  }
  else
  {
    [v20 setFixedIconLocationBehavior:0];
    [v20 setIconLayoutBehavior:0];
    [v20 setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:0];
    uint64_t v23 = 0;
  }
  [v20 setRotatedIconGridSizeClassSizes:v23];
  uint64_t v37 = v12;
  id v35 = v14;
  if (v12) {
    uint64_t v24 = *((void *)v12 + 10);
  }
  else {
    uint64_t v24 = 0;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v25 = v11;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        unint64_t v31 = [v20 numberOfIcons];
        if (v31 >= [v20 maxNumberOfIcons])
        {
          long long v33 = SBLogCommon();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v43 = v30;
            __int16 v44 = 2112;
            v45 = v20;
            _os_log_impl(&dword_1D7F0A000, v33, OS_LOG_TYPE_DEFAULT, "list is too small to add icon -> icon=%@ list=%@", buf, 0x16u);
          }

          [v15 addObject:v30];
        }
        else if (([v20 addIcon:v30 options:v24] & 1) == 0)
        {
          long long v32 = SBLogCommon();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v43 = v30;
            __int16 v44 = 2112;
            v45 = v20;
            _os_log_error_impl(&dword_1D7F0A000, v32, OS_LOG_TYPE_ERROR, "could not add icon to list -> icon=%@ list=%@", buf, 0x16u);
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v27);
  }

  [v20 markIconStateClean];
  return v20;
}

- (id)_applicationIconFromRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKey:@"displayIdentifier"];
  id v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v9 = [v5 objectForKey:@"bundleIdentifier"];
    id v10 = self;
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      id v12 = [(SBHIconStateUnarchiver *)self iconSource];
      id v13 = [v12 applicationIconForBundleIdentifier:v9];
      id v14 = [(SBHIconStateUnarchiver *)self iconModel];
      id v15 = v14;
      if (v14)
      {
        uint64_t v16 = (void *)[v14 iconClassForApplicationWithBundleIdentifier:v9];
      }
      else
      {
        uint64_t v16 = self;
      }
      id v17 = (void *)[objc_alloc((Class)v16) initWithLeafIdentifier:v6 applicationBundleID:v9];
      uint64_t v18 = [v13 iconDataSources];
      [v17 addIconDataSources:v18];
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_widgetIconFromRepresentation:(id)a3 context:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 objectForKey:@"displayIdentifier"];
  unint64_t v9 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    char v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = [v11 UUIDString];

    char v8 = (void *)v12;
  }
  id v13 = [[SBWidgetIcon alloc] initWithLeafIdentifier:v8 applicationBundleID:0];
  id v14 = [v6 objectForKey:@"gridSize"];
  id v15 = self;
  char v16 = objc_opt_isKindOfClass();

  id v17 = 0;
  if (v16)
  {
    id v17 = [(SBHIconStateUnarchiver *)self gridSizeClassForString:v14];
    uint64_t v18 = [v6 objectForKey:@"bundleIdentifier"];
    if ([v18 isEqualToString:@"com.apple.news.widget"])
    {
      [v6 objectForKey:@"widgetIdentifier"];
      v20 = uint64_t v19 = v17;
      int v21 = [v20 isEqualToString:@"today"];

      id v17 = v19;
    }
    else
    {
      int v21 = 0;
    }

    BOOL v22 = [(SBHIconStateUnarchiver *)self postNewsWidgetMigration];
    if (v17 == @"SBHIconGridSizeClassExtraLarge") {
      int v23 = v21 ^ 1;
    }
    else {
      int v23 = -[__CFString isEqualToString:](v17, "isEqualToString:") & v21 ^ 1;
    }
    if (((v23 | v22) & 1) == 0)
    {
      uint64_t v24 = @"SBHIconGridSizeClassNewsLargeTall";

      id v17 = v24;
    }
    [(SBIcon *)v13 setGridSizeClass:v17];
  }
  uint64_t v25 = [(SBHIconStateUnarchiver *)self _customIconElementFromRepresentation:v6 context:v7];
  v64 = v14;
  v65 = (void *)v25;
  if (!v25)
  {
    id v67 = v17;
    uint64_t v30 = [v6 objectForKey:@"elements"];
    unint64_t v31 = self;
    char v32 = objc_opt_isKindOfClass();

    if ((v32 & 1) == 0)
    {

      int v48 = 0;
      id v17 = v67;
      goto LABEL_78;
    }
    id v63 = v8;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v28 = v30;
    uint64_t v33 = [v28 countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (!v33)
    {

LABEL_61:
      id v17 = v67;
      goto LABEL_62;
    }
    uint64_t v34 = v33;
    id v68 = v13;
    uint64_t v35 = *(void *)v70;
    uint64_t v66 = v7;
LABEL_22:
    uint64_t v36 = 0;
    while (1)
    {
      if (*(void *)v70 != v35) {
        objc_enumerationMutation(v28);
      }
      uint64_t v37 = *(void *)(*((void *)&v69 + 1) + 8 * v36);
      long long v38 = self;
      char v39 = objc_opt_isKindOfClass();

      if ((v39 & 1) == 0) {
        goto LABEL_45;
      }
      long long v40 = [(SBHIconStateUnarchiver *)self _customIconElementFromRepresentation:v37 context:v7];
      if (v40) {
        break;
      }
LABEL_44:

LABEL_45:
      if (v34 == ++v36)
      {
        uint64_t v46 = [v28 countByEnumeratingWithState:&v69 objects:v77 count:16];
        uint64_t v34 = v46;
        if (!v46)
        {

          id v13 = v68;
          goto LABEL_61;
        }
        goto LABEL_22;
      }
    }
    long long v41 = self;
    if (objc_opt_isKindOfClass())
    {
      v42 = [v40 uniqueIdentifier];

      if (v42)
      {
        if ([v7 _isWidgetUniqueIdentifierAlreadyUnarchived:v42])
        {
          uint64_t v43 = SBLogCommon();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v74 = v40;
            __int16 v75 = 2112;
            __int16 v76 = v68;
            _os_log_error_impl(&dword_1D7F0A000, v43, OS_LOG_TYPE_ERROR, "detected duplicate widget '%@' to icon '%@'", buf, 0x16u);
          }

          goto LABEL_41;
        }
        char v44 = 0;
LABEL_35:
        if ([(SBHIconStateUnarchiver *)self _canAddIconDataSource:v40 toIcon:v68 withGridSizeClass:v67])
        {
          [(SBLeafIcon *)v68 addIconDataSource:v40];
          id v7 = v66;
          if ((v44 & 1) == 0) {
            [v66 _noteWidgetUniqueIdentifierWasUnarchived:v42];
          }
          goto LABEL_43;
        }
        v45 = SBLogCommon();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v74 = v40;
          __int16 v75 = 2112;
          __int16 v76 = v68;
          _os_log_error_impl(&dword_1D7F0A000, v45, OS_LOG_TYPE_ERROR, "can't add widget '%@' to icon '%@'", buf, 0x16u);
        }

        id v7 = v66;
LABEL_41:
        [v7 _noteSignificantDeviation];
LABEL_43:

        goto LABEL_44;
      }
    }
    else
    {

      v42 = 0;
    }
    char v44 = 1;
    goto LABEL_35;
  }
  uint64_t v26 = (void *)v25;
  id v63 = v8;
  uint64_t v27 = self;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v28 = 0;
    goto LABEL_51;
  }
  id v28 = [v26 uniqueIdentifier];

  if (!v28)
  {
LABEL_51:
    char v47 = 1;
    goto LABEL_52;
  }
  if ([v7 _isWidgetUniqueIdentifierAlreadyUnarchived:v28])
  {
    id v29 = SBLogCommon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[SBHIconStateUnarchiver _widgetIconFromRepresentation:context:]();
    }
    goto LABEL_57;
  }
  char v47 = 0;
LABEL_52:
  if ([(SBHIconStateUnarchiver *)self _canAddIconDataSource:v26 toIcon:v13 withGridSizeClass:v17])
  {
    [(SBLeafIcon *)v13 addIconDataSource:v26];
    if ((v47 & 1) == 0) {
      [v7 _noteWidgetUniqueIdentifierWasUnarchived:v28];
    }
    goto LABEL_62;
  }
  id v29 = SBLogCommon();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[SBHIconStateUnarchiver _widgetIconFromRepresentation:context:]();
  }
LABEL_57:

  [v7 _noteSignificantDeviation];
LABEL_62:

  v49 = [v6 objectForKey:@"userSelectedElementIdentifier"];
  if (v49)
  {
    char v50 = [(SBLeafIcon *)v13 firstIconDataSourceWithUniqueIdentifier:v49];
    char v51 = SBLogIcon();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      [(SBIcon *)v13 uniqueIdentifier];
      v52 = v17;
      v53 = (SBWidgetIcon *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v74 = v50;
      __int16 v75 = 2112;
      __int16 v76 = v53;
      _os_log_impl(&dword_1D7F0A000, v51, OS_LOG_TYPE_DEFAULT, "Setting last user selected data source after unarchiving: %@ for: %@", buf, 0x16u);

      id v17 = v52;
    }

    [(SBWidgetIcon *)v13 setLastUserSelectedDataSource:v50];
  }
  unint64_t v54 = [v6 objectForKey:@"allowsSuggestions"];
  if (objc_opt_respondsToSelector()) {
    -[SBWidgetIcon setAllowsSuggestions:](v13, "setAllowsSuggestions:", [v54 BOOLValue]);
  }
  id v55 = [v6 objectForKey:@"allowsExternalSuggestions"];
  if (objc_opt_respondsToSelector()) {
    -[SBWidgetIcon setAllowsExternalSuggestions:](v13, "setAllowsExternalSuggestions:", [v55 BOOLValue]);
  }
  int v56 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector())
  {
    v57 = [v56 iconStateUnarchiver:self didUnarchiveWidgetIcon:v13];
    unsigned int v58 = v57;
    if (v57)
    {
      v59 = v17;
      id v60 = v57;

      id v13 = v60;
      id v17 = v59;
    }
  }
  if ([(SBLeafIcon *)v13 iconDataSourceCount]) {
    v61 = v13;
  }
  else {
    v61 = 0;
  }
  int v48 = v61;

  char v8 = v63;
  id v14 = v64;
LABEL_78:

  return v48;
}

- (BOOL)_canAddIconDataSource:(id)a3 toIcon:(id)a4 withGridSizeClass:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v8 gridSizeClass];
  }
  uint64_t v12 = v11;
  if (objc_opt_respondsToSelector()) {
    [v7 supportedGridSizeClassesForIcon:v8];
  }
  else {
  id v13 = +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses];
  }
  char v14 = [v13 containsGridSizeClass:v12];

  return v14;
}

- (id)_customIconElementFromRepresentation:(id)a3 context:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:@"uniqueIdentifier"];
  id v9 = [v6 objectForKey:@"elementType"];
  id v10 = [v6 objectForKey:@"widgetSuggestionSource"];
  id v11 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];

    id v8 = (void *)v14;
  }
  if (v9)
  {
    id v15 = self;
    char v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0)
    {
      uint64_t v26 = 0;
      goto LABEL_37;
    }
  }
  if ([v9 isEqualToString:@"widget"])
  {
    id v17 = [v6 objectForKey:@"widgetIdentifier"];
    uint64_t v18 = self;
    char v19 = objc_opt_isKindOfClass();

    uint64_t v43 = self;
    if ((v19 & 1) == 0)
    {

      id v17 = 0;
    }
    uint64_t v20 = [v6 objectForKey:@"bundleIdentifier"];
    int v21 = self;
    char v22 = objc_opt_isKindOfClass();

    char v44 = v7;
    if ((v22 & 1) == 0)
    {

      uint64_t v20 = 0;
    }
    int v23 = [v6 objectForKey:@"containerBundleIdentifier"];
    uint64_t v24 = self;
    char v25 = objc_opt_isKindOfClass();

    if ((v25 & 1) == 0)
    {
      [v44 _noteSignificantDeviation];

      int v23 = 0;
    }
    uint64_t v26 = 0;
    if (v8 && v17)
    {
      if ([v20 isEqualToString:*MEMORY[0x1E4F4FA00]])
      {
        uint64_t v26 = [(SBHIconStateUnarchiver *)v43 _batteryElementWithIdentifier:v8];
      }
      else
      {
        id v28 = [(SBHIconStateUnarchiver *)v43 supportedGridSizeClassesForWidgetWithKind:v17 extensionBundleIdentifier:v20 containerBundleIdentifier:v23];
        uint64_t v26 = [[SBHWidget alloc] initWithUniqueIdentifier:v8 kind:v17 extensionBundleIdentifier:v20 containerBundleIdentifier:v23 supportedGridSizeClasses:v28];
        id v29 = SBLogWidgets();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          long long v41 = [(SBHWidget *)v26 extensionBundleIdentifier];
          v42 = v28;
          [(SBHWidget *)v26 uniqueIdentifier];
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = v41;
          v48 = __int16 v47 = 2114;
          uint64_t v30 = (void *)v48;
          _os_log_impl(&dword_1D7F0A000, v29, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created from arhive.", buf, 0x16u);

          id v28 = v42;
        }
      }
    }

    self = v43;
    id v7 = v44;
    if (!v10) {
      goto LABEL_37;
    }
LABEL_34:
    int64_t v32 = [(SBHIconStateUnarchiver *)self _suggestionSourceFromRepresentation:v10];
    uint64_t v33 = self;
    char v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) != 0
      || (self,
          uint64_t v35 = objc_claimAutoreleasedReturnValue(),
          char v36 = objc_opt_isKindOfClass(),
          v35,
          (v36 & 1) != 0))
    {
      uint64_t v37 = [(SBHWidget *)v26 copyWithSuggestionSource:v32];

      uint64_t v26 = (SBHWidget *)v37;
    }
    goto LABEL_37;
  }
  if ([v9 isEqualToString:@"siriSuggestions"])
  {
    uint64_t v27 = SBHSiriSuggestionsElement;
LABEL_32:
    uint64_t v31 = [[v27 alloc] initWithUniqueIdentifier:v8];
    goto LABEL_33;
  }
  if ([v9 isEqualToString:@"shortcuts"])
  {
    uint64_t v27 = SBHShortcutsFolderElement;
    goto LABEL_32;
  }
  if ([v9 isEqualToString:@"shortcutsSingle"])
  {
    uint64_t v27 = SBHShortcutsSingleElement;
    goto LABEL_32;
  }
  if ([v9 isEqualToString:@"files"])
  {
    uint64_t v27 = SBHFilesElement;
    goto LABEL_32;
  }
  if ([v9 isEqualToString:@"appPredictions"])
  {
    uint64_t v27 = SBHAppPredictionsElement;
    goto LABEL_32;
  }
  if ([v9 isEqualToString:@"batteries"])
  {
    uint64_t v31 = [(SBHIconStateUnarchiver *)self _batteryElementWithIdentifier:v8];
LABEL_33:
    uint64_t v26 = (SBHWidget *)v31;
    if (!v10) {
      goto LABEL_37;
    }
    goto LABEL_34;
  }
  char v39 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v26 = [v39 iconStateUnarchiver:self iconDataSourceForRepresentation:v6];
  }
  else
  {
    uint64_t v26 = 0;
  }
  if (v9 && !v26)
  {
    long long v40 = SBLogCommon();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[SBHIconStateUnarchiver _customIconElementFromRepresentation:context:]();
    }

    [v7 _noteSignificantDeviation];
  }

  if (v10) {
    goto LABEL_34;
  }
LABEL_37:

  return v26;
}

- (id)_batteryElementWithIdentifier:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F4FA08];
  uint64_t v5 = *MEMORY[0x1E4F4FA00];
  uint64_t v6 = *MEMORY[0x1E4F4F9F8];
  id v7 = a3;
  id v8 = [(SBHIconStateUnarchiver *)self supportedGridSizeClassesForWidgetWithKind:v4 extensionBundleIdentifier:v5 containerBundleIdentifier:v6];
  id v9 = [[SBHWidget alloc] initWithUniqueIdentifier:v7 kind:v4 extensionBundleIdentifier:v5 containerBundleIdentifier:v6 supportedGridSizeClasses:v8];

  return v9;
}

- (int64_t)_suggestionSourceFromRepresentation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"onboarding"]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = [v3 isEqualToString:@"NPlus1"];
  }

  return v4;
}

- (id)_sanitizedFixedIconLocationsFromDictionary:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__SBHIconStateUnarchiver__sanitizedFixedIconLocationsFromDictionary___block_invoke;
  v8[3] = &unk_1E6AAE4B8;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __69__SBHIconStateUnarchiver__sanitizedFixedIconLocationsFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = self;
  if (objc_opt_isKindOfClass())
  {
    id v7 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [*(id *)(a1 + 32) setObject:v5 forKey:v9];
    }
  }
  else
  {
  }
}

- (id)supportedGridSizeClassesForWidgetWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBHIconStateUnarchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector()) {
    [v11 iconStateUnarchiver:self supportedGridSizeClassesForWidgetWithKind:v8 extensionBundleIdentifier:v9 containerBundleIdentifier:v10];
  }
  else {
  uint64_t v12 = +[SBHIconGridSizeClassSet gridSizeClassSetForAllNonDefaultGridSizeClasses];
  }

  return v12;
}

- (id)gridSizeClassForString:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconStateUnarchiver *)self effectiveGridSizeClassDomain];
  id v6 = [v5 gridSizeClassForArchiveValue:v4];

  if (!v6) {
    id v6 = @"SBHIconGridSizeClassSmall";
  }

  return v6;
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
}

- (SBHIconStateUnarchiverIconSource)iconSource
{
  return self->_iconSource;
}

- (void)setIconSource:(id)a3
{
}

- (SBHIconStateUnarchiverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)removesEmptyFolders
{
  return self->_removesEmptyFolders;
}

- (void)setRemovesEmptyFolders:(BOOL)a3
{
  self->_removesEmptyFolders = a3;
}

- (id)archive
{
  return self->_archive;
}

- (BOOL)postNewsWidgetMigration
{
  return self->_postNewsWidgetMigration;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_archive, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_iconSource, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

- (void)_nodeFromRepresentation:context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "the node representation is in an unknown format -> %{public}@", v2, v3, v4, v5, v6);
}

- (void)_iconFromRepresentation:withContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "throwing out icon because its nodeIdentifier has already been unarchived : node=%@", v2, v3, v4, v5, v6);
}

- (void)_iconFromRepresentation:withContext:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "throwing out icon because it isn't visible in the model : node=%@", v2, v3, v4, v5, v6);
}

- (void)_iconFromRepresentation:withContext:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "could not find icon for representation -> %@", v2, v3, v4, v5, v6);
}

- (void)_iconFromRepresentation:withContext:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "could not generate widget icon for representation -> %@", v2, v3, v4, v5, v6);
}

- (void)_iconFromRepresentation:withContext:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "could not generate additional application icon for representation -> %@", v2, v3, v4, v5, v6);
}

- (void)_iconFromRepresentation:withContext:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "could not generate folderIcon for representation -> %@", v2, v3, v4, v5, v6);
}

- (void)_iconFromRepresentation:withContext:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "throwing out unknown icon representation -> %@", v2, v3, v4, v5, v6);
}

- (void)_folderFromRepresentation:withContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Representation of ignored page list should be an array: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_folderFromRepresentation:withContext:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Representation of favorite today page list should be an array: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_folderFromRepresentation:withContext:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Representation of today page list should be an array: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_folderFromRepresentation:withContext:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Representation of dock should be an array: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_folderFromRepresentation:withContext:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Representation of folder should contain lists: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_folderFromRepresentation:withContext:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Representation of lists should be an array: %{public}@", v2, v3, v4, v5, v6);
}

void __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "overflow list exceeds the maxListCount of the folder -> folder=%{public}@ overflowListRepresentation=%{public}@");
}

void __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "list representation exceeds the maxListCount of the folder -> folder=%{public}@ listRepresentation=%{public}@");
}

void __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Representation of list should be an array: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_widgetIconFromRepresentation:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "can't add widget '%@' to icon '%@'");
}

- (void)_widgetIconFromRepresentation:context:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "detected duplicate widget '%@' to icon '%@'");
}

- (void)_customIconElementFromRepresentation:context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "unknown custom icon element type: %{public}@", v2, v3, v4, v5, v6);
}

@end