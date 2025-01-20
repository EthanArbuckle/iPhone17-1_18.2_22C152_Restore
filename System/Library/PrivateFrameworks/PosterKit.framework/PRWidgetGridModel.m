@interface PRWidgetGridModel
+ (id)effectiveContainerBundleIdentifierForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4;
- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription;
- (BOOL)canAddComplicationDescriptor:(id)a3;
- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)isConfiguringFixedPositions;
- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4;
- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4;
- (NSArray)complicationDescriptors;
- (NSDictionary)iconLayout;
- (NSDictionary)intentsByDescriptorIdentifier;
- (NSMutableDictionary)complicationDescriptorsByUniqueIdentifier;
- (PRWidgetGridModel)initWithComplicationDescriptors:(id)a3 iconLayout:(id)a4 type:(unint64_t)a5;
- (PRWidgetGridModelDelegate)delegate;
- (PRWidgetGridModelPresenting)presenter;
- (SBHIconGridSize)gridSize;
- (SBHIconModel)iconModel;
- (SBIconListModel)listModel;
- (SBRootFolder)rootFolder;
- (id)_makeWidgetIconForComplicationDescriptor:(id)a3;
- (id)_removeIconForDescriptor:(id)a3 animated:(BOOL)a4;
- (id)complicationDescriptorForIdentifier:(id)a3;
- (id)gridSizeClassDomainForIconModel:(id)a3;
- (id)gridSizeClassSizesForIconModel:(id)a3;
- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4;
- (id)iconModel:(id)a3 customInsertionIndexPathForIcon:(id)a4 inRootFolder:(id)a5;
- (id)iconModel:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4;
- (id)loadDesiredIconState:(id *)a3;
- (id)removeComplicationDescriptor:(id)a3;
- (unint64_t)iconModel:(id)a3 listsIconLayoutBehaviorForFolderClass:(Class)a4;
- (unint64_t)iconModel:(id)a3 maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4;
- (unint64_t)iconModel:(id)a3 maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4;
- (unint64_t)layoutInsetsMode;
- (unint64_t)maxIconCountForDockForIconModel:(id)a3;
- (unint64_t)maxListCountForFoldersForIconModel:(id)a3;
- (unint64_t)type;
- (void)_addIconForDescriptor:(id)a3 withGridIndex:(id)a4 animated:(BOOL)a5;
- (void)_iconModelDidLayoutIconState:(id)a3;
- (void)_iconModelWillLayoutIconState:(id)a3;
- (void)_populateIntentsByDescriptorIdentifier;
- (void)_setupFixedPositionsForRowLayout;
- (void)_updateLayoutInsetsMode;
- (void)addComplicationDescriptor:(id)a3;
- (void)addComplicationDescriptor:(id)a3 withGridIndex:(id)a4;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
- (void)iconList:(id)a3 didAddIcon:(id)a4;
- (void)iconList:(id)a3 didMoveIcon:(id)a4;
- (void)iconList:(id)a3 didRemoveIcon:(id)a4;
- (void)iconModel:(id)a3 didAddIcon:(id)a4;
- (void)iconModel:(id)a3 launchIcon:(id)a4 fromLocation:(id)a5 context:(id)a6;
- (void)invalidate;
- (void)saveIconStateIfNeeded;
- (void)setAppProtectionSubjectMonitorSubscription:(id)a3;
- (void)setComplicationDescriptors:(id)a3;
- (void)setComplicationDescriptors:(id)a3 iconLayout:(id)a4;
- (void)setComplicationDescriptorsByUniqueIdentifier:(id)a3;
- (void)setConfiguringFixedPositions:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setIntentsByDescriptorIdentifier:(id)a3;
- (void)setLayoutInsetsMode:(unint64_t)a3;
- (void)setPresenter:(id)a3;
- (void)updateIntent:(id)a3 forWidgetWithIdentifier:(id)a4;
- (void)validateIconsForAvailableWidgets;
@end

@implementation PRWidgetGridModel

- (PRWidgetGridModel)initWithComplicationDescriptors:(id)a3 iconLayout:(id)a4 type:(unint64_t)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v45.receiver = self;
  v45.super_class = (Class)PRWidgetGridModel;
  v11 = [(PRWidgetGridModel *)&v45 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_24;
  }
  objc_storeStrong((id *)&v11->_complicationDescriptors, a3);
  objc_storeStrong((id *)&v12->_iconLayout, a4);
  v12->_type = a5;
  if (a5 == 1)
  {
    __int16 v13 = [MEMORY[0x1E4F5E4A8] sidebarGridHeight];
    v12->_gridSize.columns = 2;
    goto LABEL_6;
  }
  if (!a5)
  {
    v12->_gridSize.columns = 4;
    __int16 v13 = 1;
LABEL_6:
    v12->_gridSize.rows = v13;
  }
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4FA62B8]) initWithStore:v12];
  iconModel = v12->_iconModel;
  v12->_iconModel = (SBHIconModel *)v14;

  [(SBHIconModel *)v12->_iconModel setDelegate:v12];
  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  complicationDescriptorsByUniqueIdentifier = v12->_complicationDescriptorsByUniqueIdentifier;
  v12->_complicationDescriptorsByUniqueIdentifier = v16;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v24 = v12->_complicationDescriptorsByUniqueIdentifier;
        v25 = [v23 uniqueIdentifier];
        [(NSMutableDictionary *)v24 setObject:v23 forKey:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v20);
  }

  v12->_layoutInsetsMode = 0;
  v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v26 addObserver:v12 selector:sel__iconModelWillLayoutIconState_ name:*MEMORY[0x1E4FA6700] object:v12->_iconModel];

  v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v27 addObserver:v12 selector:sel__iconModelDidLayoutIconState_ name:*MEMORY[0x1E4FA66F0] object:v12->_iconModel];

  [(SBHIconModel *)v12->_iconModel layoutIfNeeded];
  v28 = PRSharedWidgetExtensionProvider();
  [v28 registerObserver:v12];

  [(PRWidgetGridModel *)v12 _populateIntentsByDescriptorIdentifier];
  [(PRWidgetGridModel *)v12 _updateLayoutInsetsMode];
  if (!v10)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v29 = v18;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v38 != v32) {
            objc_enumerationMutation(v29);
          }
          -[PRWidgetGridModel _addIconForDescriptor:withGridIndex:animated:](v12, "_addIconForDescriptor:withGridIndex:animated:", *(void *)(*((void *)&v37 + 1) + 8 * j), 0, 0, (void)v37);
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v31);
    }
  }
  v34 = objc_msgSend(MEMORY[0x1E4F4B800], "subjectMonitorRegistry", (void)v37);
  v35 = [v34 addMonitor:v12 subjectMask:1 subscriptionOptions:1];
  objc_storeWeak((id *)&v12->_appProtectionSubjectMonitorSubscription, v35);

LABEL_24:
  return v12;
}

- (void)dealloc
{
  v3 = PRSharedWidgetExtensionProvider();
  [v3 unregisterObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  [WeakRetained invalidate];

  v5.receiver = self;
  v5.super_class = (Class)PRWidgetGridModel;
  [(PRWidgetGridModel *)&v5 dealloc];
}

- (void)_populateIntentsByDescriptorIdentifier
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = self->_complicationDescriptors;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "widget", (void)v15);
        v11 = [v10 intentReference];
        v12 = [v11 intent];
        __int16 v13 = [v9 uniqueIdentifier];
        [v3 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v14 = (void *)[v3 copy];
  [(PRWidgetGridModel *)self setIntentsByDescriptorIdentifier:v14];
}

- (id)complicationDescriptorForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_complicationDescriptorsByUniqueIdentifier objectForKeyedSubscript:a3];
}

- (BOOL)canAddComplicationDescriptor:(id)a3
{
  v4 = [a3 widget];
  uint64_t v5 = PRIconGridSizeClassForWidgetFamily([v4 family]);

  uint64_t v6 = [(PRWidgetGridModel *)self listModel];
  LOBYTE(v4) = [v6 firstFreeGridCellIndexOfRangeOfSizeClass:v5 gridCellInfoOptions:0] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)v4;
}

- (void)addComplicationDescriptor:(id)a3
{
}

- (void)addComplicationDescriptor:(id)a3 withGridIndex:(id)a4
{
}

- (id)removeComplicationDescriptor:(id)a3
{
  return [(PRWidgetGridModel *)self _removeIconForDescriptor:a3 animated:1];
}

- (void)updateIntent:(id)a3 forWidgetWithIdentifier:(id)a4
{
  id v14 = a3;
  uint64_t v6 = [(PRWidgetGridModel *)self complicationDescriptorForIdentifier:a4];
  NSUInteger v7 = [(NSArray *)self->_complicationDescriptors indexOfObject:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v8 = v7;
    id v9 = [v6 widget];
    id v10 = [v9 widgetByReplacingIntent:v14];

    v11 = (void *)[v6 copy];
    [v11 setWidget:v10];
    v12 = (void *)[(NSArray *)self->_complicationDescriptors mutableCopy];
    [v12 replaceObjectAtIndex:v8 withObject:v11];
    __int16 v13 = (void *)[v12 copy];
    [(PRWidgetGridModel *)self setComplicationDescriptors:v13];
  }
}

- (void)saveIconStateIfNeeded
{
  id v2 = [(PRWidgetGridModel *)self iconModel];
  [v2 saveIconStateIfNeeded];
}

- (SBIconListModel)listModel
{
  id v2 = [(PRWidgetGridModel *)self rootFolder];
  id v3 = [v2 firstList];

  return (SBIconListModel *)v3;
}

- (SBRootFolder)rootFolder
{
  id v2 = [(PRWidgetGridModel *)self iconModel];
  id v3 = [v2 rootFolder];

  return (SBRootFolder *)v3;
}

- (void)setComplicationDescriptors:(id)a3 iconLayout:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PRWidgetGridModel *)self setComplicationDescriptors:v6];
  NSUInteger v8 = [(PRWidgetGridModel *)self iconModel];
  [v8 importIconState:v7];

  if (!v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          -[PRWidgetGridModel _addIconForDescriptor:withGridIndex:animated:](self, "_addIconForDescriptor:withGridIndex:animated:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), 0, 0, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)setComplicationDescriptors:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_complicationDescriptors, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          complicationDescriptorsByUniqueIdentifier = self->_complicationDescriptorsByUniqueIdentifier;
          uint64_t v13 = objc_msgSend(v11, "uniqueIdentifier", (void)v15);
          [(NSMutableDictionary *)complicationDescriptorsByUniqueIdentifier setObject:v11 forKey:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    [(PRWidgetGridModel *)self _populateIntentsByDescriptorIdentifier];
    [(PRWidgetGridModel *)self _updateLayoutInsetsMode];
    long long v14 = [(PRWidgetGridModel *)self delegate];
    [v14 widgetGridModelDidUpdateContent:self];
  }
}

- (void)_updateLayoutInsetsMode
{
  if (!self->_type)
  {
    id v3 = [(PRWidgetGridModel *)self complicationDescriptors];
    int v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", &__block_literal_global_34);

    [(PRWidgetGridModel *)self setLayoutInsetsMode:v4 ^ 1u];
  }
}

BOOL __44__PRWidgetGridModel__updateLayoutInsetsMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 widget];
  BOOL v3 = [v2 family] != 10;

  return v3;
}

- (void)_setupFixedPositionsForRowLayout
{
  if (![(PRWidgetGridModel *)self type])
  {
    [(PRWidgetGridModel *)self setConfiguringFixedPositions:1];
    BOOL v3 = [(PRWidgetGridModel *)self iconModel];
    int v4 = [v3 rootFolder];
    id v13 = [v4 firstList];

    [v13 removeAllFixedIconLocations];
    id v5 = [v13 icons];
    id v6 = objc_msgSend(v5, "bs_filter:", &__block_literal_global_13_1);

    uint64_t v7 = [v13 icons];
    uint64_t v8 = objc_msgSend(v7, "bs_filter:", &__block_literal_global_16_0);

    if ([v6 count] == 1 && objc_msgSend(v8, "count") == 1)
    {
      uint64_t v9 = (unsigned __int16)[v13 gridSize] - 1;
      uint64_t v10 = [v8 firstObject];
      id v11 = (id)[v13 moveContainedIcon:v10 toGridCellIndex:v9 gridCellInfoOptions:0 mutationOptions:128];
    }
    if ([v6 count] == 1 && objc_msgSend(v8, "count") == 2)
    {
      uint64_t v12 = [v6 firstObject];
      [v13 moveContainedIcon:v12 toIndex:0 options:0];
    }
    [(PRWidgetGridModel *)self setConfiguringFixedPositions:0];
  }
}

BOOL __53__PRWidgetGridModel__setupFixedPositionsForRowLayout__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 gridSizeClass];

  uint64_t v8 = PRWidgetFamilyForIconGridSizeClass(v7);
  return v8 == 11;
}

BOOL __53__PRWidgetGridModel__setupFixedPositionsForRowLayout__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 gridSizeClass];

  uint64_t v8 = PRWidgetFamilyForIconGridSizeClass(v7);
  return v8 == 10;
}

- (void)_iconModelWillLayoutIconState:(id)a3
{
}

- (void)_iconModelDidLayoutIconState:(id)a3
{
  id v6 = [(PRWidgetGridModel *)self listModel];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PRIconGridSizeClassCircular", @"PRIconGridSizeClassRectangular", @"PRIconGridSizeClassSystemSmall", 0);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FA6288]) initWithGridSizeClasses:v4];
  [v6 setAllowedGridSizeClasses:v5];
  [v6 setIconLayoutBehavior:3];
  [v6 setFixedIconLocationBehavior:1];
  [v6 addListObserver:self];
  [(PRWidgetGridModel *)self validateIconsForAvailableWidgets];
  [(PRWidgetGridModel *)self didChangeValueForKey:@"listModel"];
}

- (void)validateIconsForAvailableWidgets
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = [(PRWidgetGridModel *)self iconModel];
  uint64_t v3 = [v2 rootFolder];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v33 = v3;
  obuint64_t j = [v3 icons];
  uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v35;
    unint64_t v8 = 0x1E4F22000uLL;
    *(void *)&long long v5 = 138412290;
    long long v29 = v5;
    do
    {
      uint64_t v9 = 0;
      uint64_t v30 = v6;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
        complicationDescriptorsByUniqueIdentifier = self->_complicationDescriptorsByUniqueIdentifier;
        uint64_t v12 = objc_msgSend(v10, "leafIdentifier", v29);
        id v13 = [(NSMutableDictionary *)complicationDescriptorsByUniqueIdentifier objectForKeyedSubscript:v12];

        if (([v13 hasMatchingDescriptor] & 1) == 0)
        {
          long long v14 = [v33 firstList];
          [v14 removeIcon:v10];
        }
        long long v15 = [v13 PRSWidget];
        id v16 = objc_alloc(*(Class *)(v8 + 968));
        long long v17 = [v15 containerBundleIdentifier];
        long long v18 = (void *)[v16 initWithBundleIdentifier:v17 allowPlaceholder:0 error:0];

        uint64_t v19 = [v18 applicationState];
        LODWORD(v17) = [v19 isRestricted];

        if (v17)
        {
          uint64_t v20 = PRLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = [v15 containerBundleIdentifier];
            *(_DWORD *)buf = v29;
            long long v39 = v21;
            _os_log_impl(&dword_18C1C4000, v20, OS_LOG_TYPE_DEFAULT, "%@ is restricted. Removing widget icon.", buf, 0xCu);
          }
          v22 = [v33 firstList];
          [v22 removeIcon:v10];
        }
        else
        {
          unint64_t v23 = v8;
          uint64_t v24 = v7;
          v25 = [v15 containerBundleIdentifier];
          v26 = [v15 extensionBundleIdentifier];
          v22 = +[PRWidgetGridModel effectiveContainerBundleIdentifierForContainerBundleIdentifier:v25 extensionBundleIdentifier:v26];

          v27 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v22];
          if (([v27 isLocked] & 1) != 0 || objc_msgSend(v27, "isHidden"))
          {
            v28 = [v33 firstList];
            [v28 removeIcon:v10];
          }
          uint64_t v7 = v24;
          unint64_t v8 = v23;
          uint64_t v6 = v30;
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v6);
  }
}

+ (id)effectiveContainerBundleIdentifierForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4
{
  long long v5 = (__CFString *)a3;
  id v6 = a4;
  if ([(__CFString *)v5 isEqualToString:@"com.apple.Health.Sleep"]
    && [v6 isEqualToString:@"com.apple.Health.Sleep.SleepWidgetExtension"])
  {

    long long v5 = @"com.apple.Health";
  }

  return v5;
}

- (void)_addIconForDescriptor:(id)a3 withGridIndex:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(PRWidgetGridModel *)self iconModel];
  id v11 = [v8 uniqueIdentifier];
  uint64_t v12 = [v10 leafIconForIdentifier:v11];

  if (!v12)
  {
    id v13 = [v8 widget];
    char v14 = PRWidgetGridSupportsFamily([v13 family]);

    if (v14)
    {
      long long v15 = (void *)[(NSArray *)self->_complicationDescriptors mutableCopy];
      [v15 addObject:v8];
      long long v29 = v15;
      id v16 = (void *)[v15 copy];
      [(PRWidgetGridModel *)self setComplicationDescriptors:v16];

      long long v17 = [(PRWidgetGridModel *)self _makeWidgetIconForComplicationDescriptor:v8];
      uint64_t v18 = [v9 unsignedLongValue];
      uint64_t v19 = [(PRWidgetGridModel *)self iconModel];
      uint64_t v20 = [v19 rootFolder];
      uint64_t v21 = [v20 firstList];
      char v22 = [v21 isValidGridCellIndex:v18 options:4];

      unint64_t v23 = [(PRWidgetGridModel *)self listModel];
      uint64_t v24 = v23;
      if (v9 && (v22 & 1) != 0) {
        id v25 = (id)[v23 insertIcon:v17 atGridCellIndex:v18 gridCellInfoOptions:4 mutationOptions:8];
      }
      else {
        [v23 addIcon:v17];
      }

      if (v5)
      {
        v27 = [(PRWidgetGridModel *)self presenter];
        [v27 performAnimatedInsertionForIcon:v17];
      }
      [(PRWidgetGridModel *)self _setupFixedPositionsForRowLayout];
      v28 = [(PRWidgetGridModel *)self iconModel];
      [v28 saveIconStateIfNeeded];
    }
    else
    {
      v26 = PRLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[PRWidgetGridModel _addIconForDescriptor:withGridIndex:animated:](v8, v26);
      }
    }
  }
}

- (id)_removeIconForDescriptor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(PRWidgetGridModel *)self iconModel];
  id v8 = [v6 uniqueIdentifier];

  id v9 = [v7 leafIconForIdentifier:v8];

  if (v9)
  {
    uint64_t v10 = [(PRWidgetGridModel *)self iconModel];
    id v11 = [v10 rootFolder];
    uint64_t v12 = [v11 firstList];

    id v13 = [v12 gridCellInfoWithOptions:0];
    uint64_t v14 = [v12 gridCellIndexForIcon:v9 gridCellInfo:v13];
    long long v15 = [(PRWidgetGridModel *)self iconModel];
    [v15 removeIcon:v9];

    if (v4)
    {
      id v16 = [(PRWidgetGridModel *)self presenter];
      [v16 performAnimatedRemovalForIcon:v9];
    }
    [(PRWidgetGridModel *)self _setupFixedPositionsForRowLayout];
    long long v17 = [(PRWidgetGridModel *)self iconModel];
    [v17 saveIconStateIfNeeded];

    uint64_t v18 = [NSNumber numberWithUnsignedLong:v14];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)_makeWidgetIconForComplicationDescriptor:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4FA6388];
  id v4 = a3;
  id v21 = [v3 alloc];
  BOOL v5 = [v4 uniqueIdentifier];
  id v6 = [v4 widget];
  uint64_t v7 = [v6 kind];
  id v8 = [v4 widget];
  id v9 = [v8 extensionIdentity];
  uint64_t v10 = [v9 extensionBundleIdentifier];
  id v11 = [v4 widget];
  uint64_t v12 = [v11 extensionIdentity];
  id v13 = [v12 containerBundleIdentifier];
  char v22 = (void *)[v21 initWithUniqueIdentifier:v5 kind:v7 extensionBundleIdentifier:v10 containerBundleIdentifier:v13];

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4FA6488]) initWithWidget:v22];
  long long v15 = [v4 uniqueIdentifier];
  id v16 = (void *)[v14 copyWithLeafIdentifier:v15];

  long long v17 = [v4 widget];

  uint64_t v18 = [v17 family];
  uint64_t v19 = PRIconGridSizeClassForWidgetFamily(v18);
  [v16 setGridSizeClass:v19];

  return v16;
}

- (void)invalidate
{
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  if (![(PRWidgetGridModel *)self isConfiguringFixedPositions]) {
    [(PRWidgetGridModel *)self _setupFixedPositionsForRowLayout];
  }
  id v5 = [(PRWidgetGridModel *)self iconModel];
  [v5 saveIconStateIfNeeded];
}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  if (![(PRWidgetGridModel *)self isConfiguringFixedPositions]) {
    [(PRWidgetGridModel *)self _setupFixedPositionsForRowLayout];
  }
  id v5 = [(PRWidgetGridModel *)self iconModel];
  [v5 saveIconStateIfNeeded];
}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v5 = a4;
  complicationDescriptorsByUniqueIdentifier = self->_complicationDescriptorsByUniqueIdentifier;
  id v15 = v5;
  uint64_t v7 = [v5 leafIdentifier];
  id v8 = [(NSMutableDictionary *)complicationDescriptorsByUniqueIdentifier objectForKeyedSubscript:v7];

  NSUInteger v9 = [(NSArray *)self->_complicationDescriptors indexOfObject:v8];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v10 = v9;
    id v11 = (void *)[(NSArray *)self->_complicationDescriptors mutableCopy];
    [v11 removeObjectAtIndex:v10];
    uint64_t v12 = (void *)[v11 copy];
    [(PRWidgetGridModel *)self setComplicationDescriptors:v12];
  }
  id v13 = self->_complicationDescriptorsByUniqueIdentifier;
  uint64_t v14 = [v15 leafIdentifier];
  [(NSMutableDictionary *)v13 removeObjectForKey:v14];
}

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  objc_storeStrong((id *)&self->_iconLayout, a3);
  id v5 = [(PRWidgetGridModel *)self delegate];
  [v5 widgetGridModelDidUpdateContent:self];

  return 1;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  iconLayout = self->_iconLayout;
  self->_iconLayout = 0;

  id v6 = [(PRWidgetGridModel *)self delegate];
  [v6 widgetGridModelDidUpdateContent:self];

  return 1;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (id)loadDesiredIconState:(id *)a3
{
  return 0;
}

- (unint64_t)maxListCountForFoldersForIconModel:(id)a3
{
  return 1;
}

- (unint64_t)maxIconCountForDockForIconModel:(id)a3
{
  return 4;
}

- (unint64_t)iconModel:(id)a3 maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4
{
  return [(PRWidgetGridModel *)self gridSize] >> 16;
}

- (unint64_t)iconModel:(id)a3 maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4
{
  return (unsigned __int16)[(PRWidgetGridModel *)self gridSize];
}

- (id)gridSizeClassSizesForIconModel:(id)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6290]), "initWithGridSizeClassesAndGridSizes:", @"PRIconGridSizeClassCircular", 65537, @"PRIconGridSizeClassRectangular", 65538, @"PRIconGridSizeClassSystemSmall", 131074, 0);
  return v3;
}

- (id)gridSizeClassDomainForIconModel:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FA6280], "pr_widgetDomain", a3);
}

- (id)iconModel:(id)a3 customInsertionIndexPathForIcon:(id)a4 inRootFolder:(id)a5
{
  return 0;
}

- (id)iconModel:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  return &stru_1ED9A3120;
}

- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PRIconGridSizeClassCircular", a4, @"PRIconGridSizeClassRectangular", @"PRIconGridSizeClassSystemSmall", 0);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FA6288]) initWithGridSizeClasses:v4];

  return v5;
}

- (unint64_t)iconModel:(id)a3 listsIconLayoutBehaviorForFolderClass:(Class)a4
{
  return 3;
}

- (void)iconModel:(id)a3 didAddIcon:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_complicationDescriptorsByUniqueIdentifier allKeys];
  id v8 = [v6 leafIdentifier];
  char v9 = [v7 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v6;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    uint64_t v14 = [v13 activeWidget];
    id v15 = [v11 gridSizeClass];
    uint64_t v16 = PRWidgetFamilyForIconGridSizeClass(v15);
    id v17 = objc_alloc(MEMORY[0x1E4F58CC0]);
    uint64_t v18 = [v14 extensionBundleIdentifier];
    uint64_t v19 = [v14 containerBundleIdentifier];
    uint64_t v20 = (void *)[v17 initWithExtensionBundleIdentifier:v18 containerBundleIdentifier:v19 deviceIdentifier:0];

    id v21 = objc_alloc(MEMORY[0x1E4F58DD8]);
    char v22 = [v14 kind];
    unint64_t v23 = (void *)[v21 initWithExtensionIdentity:v20 kind:v22 family:v16 intent:0 activityIdentifier:0];

    uint64_t v24 = [PRComplicationDescriptor alloc];
    id v25 = [v11 leafIdentifier];
    v26 = [(PRComplicationDescriptor *)v24 initWithUniqueIdentifier:v25 widget:v23];

    complicationDescriptorsByUniqueIdentifier = self->_complicationDescriptorsByUniqueIdentifier;
    v28 = [v11 leafIdentifier];

    [(NSMutableDictionary *)complicationDescriptorsByUniqueIdentifier setObject:v26 forKey:v28];
    long long v29 = (void *)[(NSArray *)self->_complicationDescriptors mutableCopy];
    [v29 addObject:v26];
    uint64_t v30 = (void *)[v29 copy];
    [(PRWidgetGridModel *)self setComplicationDescriptors:v30];

    [v31 saveIconStateIfNeeded];
  }
}

- (void)iconModel:(id)a3 launchIcon:(id)a4 fromLocation:(id)a5 context:(id)a6
{
  id v7 = a4;
  id v8 = [(PRWidgetGridModel *)self presenter];
  [v8 handleLaunchRequestForIcon:v7];
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
}

void __61__PRWidgetGridModel_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) iconModel];
  id v2 = [*(id *)(a1 + 32) iconLayout];
  [v3 importIconState:v2];
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PRWidgetGridModel_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_1E54DAA08;
  id v8 = v5;
  char v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __66__PRWidgetGridModel_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) appProtectionSubjectMonitorSubscription];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    id v5 = [*(id *)(a1 + 40) iconModel];
    id v4 = [*(id *)(a1 + 40) iconLayout];
    [v5 importIconState:v4];
  }
}

- (NSArray)complicationDescriptors
{
  return self->_complicationDescriptors;
}

- (NSDictionary)iconLayout
{
  return self->_iconLayout;
}

- (unint64_t)type
{
  return self->_type;
}

- (PRWidgetGridModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRWidgetGridModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)layoutInsetsMode
{
  return self->_layoutInsetsMode;
}

- (void)setLayoutInsetsMode:(unint64_t)a3
{
  self->_layoutInsetsMode = a3;
}

- (NSDictionary)intentsByDescriptorIdentifier
{
  return self->_intentsByDescriptorIdentifier;
}

- (void)setIntentsByDescriptorIdentifier:(id)a3
{
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  return (APSubjectMonitorSubscription *)WeakRetained;
}

- (void)setAppProtectionSubjectMonitorSubscription:(id)a3
{
}

- (BOOL)isConfiguringFixedPositions
{
  return self->_configuringFixedPositions;
}

- (void)setConfiguringFixedPositions:(BOOL)a3
{
  self->_configuringFixedPositions = a3;
}

- (NSMutableDictionary)complicationDescriptorsByUniqueIdentifier
{
  return self->_complicationDescriptorsByUniqueIdentifier;
}

- (void)setComplicationDescriptorsByUniqueIdentifier:(id)a3
{
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

- (PRWidgetGridModelPresenting)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (PRWidgetGridModelPresenting *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_complicationDescriptorsByUniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_intentsByDescriptorIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconLayout, 0);
  objc_storeStrong((id *)&self->_complicationDescriptors, 0);
}

- (void)_addIconForDescriptor:(void *)a1 withGridIndex:(NSObject *)a2 animated:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 widget];
  int v5 = 134218242;
  uint64_t v6 = [v4 family];
  __int16 v7 = 2112;
  id v8 = a1;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "Unable to add widget grid icon: unsupported family %ld for descriptor %@", (uint8_t *)&v5, 0x16u);
}

@end