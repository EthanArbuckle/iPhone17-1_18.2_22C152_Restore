@interface SBHAddWidgetSheetConfigurationManager
+ (unint64_t)_galleryVariantForAddWidgetSheetLocation:(unint64_t)a3;
- (BOOL)_isContainerBundleIdentifierUnprotected:(id)a3;
- (BOOL)_isDescriptorAllowed:(id)a3;
- (BOOL)_isDescriptorContainerUnprotected:(id)a3;
- (BOOL)_isDescriptorSupported:(id)a3;
- (BOOL)_isDescriptorSupportedByDelegate:(id)a3;
- (BOOL)_isDescriptorUpdatedForSDKRequirements:(id)a3;
- (BOOL)_isDescriptorVisibleByDefault:(id)a3;
- (BOOL)_isVisibilityWidgetDefined:(int64_t)a3;
- (BOOL)_shouldAddSpecialAvocadoOfType:(unint64_t)a3;
- (BOOL)allowsFakeWidgets;
- (CHSWidgetExtensionProvider)widgetExtensionProvider;
- (NSArray)editingSuggestedWidgetItems;
- (NSArray)stackConfigurationSuggestedWidgetItems;
- (SBHAddWidgetSheetConfigurationManager)initWithWidgetExtensionProvider:(id)a3;
- (SBHAddWidgetSheetConfigurationManagerDelegate)configurationManagerDelegate;
- (SBHIconGridSizeClassDomain)gridSizeClassDomain;
- (SBHIconModel)iconModel;
- (SBHWidgetDragHandling)widgetDragHandlerDelegate;
- (SBIconListLayoutProvider)listLayoutProvider;
- (id)_widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4;
- (id)_widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4;
- (id)applicationControlCollections;
- (id)applicationWidgetCollectionsForEditingViewController:(id)a3 withAllowedSizeClasses:(id *)a4 allowingNonStackableItems:(BOOL)a5;
- (id)effectiveGridSizeClassDomain;
- (id)homeScreenDefaults;
- (id)vendorNameForAppWithBundleIdentifier:(id)a3;
- (unint64_t)_defaultEditingSuggestedWidgetItemsFamilyMask;
- (unint64_t)_stackConfigurationGridSize;
- (unint64_t)addWidgetSheetLocation;
- (unint64_t)addWidgetSheetStyle;
- (unint64_t)allowedWidgetFamilies;
- (unint64_t)minimumRequiredSDKVersion;
- (void)_addCustomApplicationWidgetCollectionsToApplicationWidgetCollections:(id)a3;
- (void)_addFakeWidgetsToApplicationWidgetCollectionsIfAllowed:(id)a3;
- (void)_addFilesSpecialAvocadosToApplicationWidgetCollections:(id)a3;
- (void)_addShortcutsSpecialAvocadoToApplicationWidgetCollections:(id)a3;
- (void)_addSiriSuggestionsSpecialAvocadosToApplicationWidgetCollections:(id)a3;
- (void)_fetchGalleryContentForGridSize:(unint64_t)a3 withFamilyMask:(unint64_t)a4 completion:(id)a5;
- (void)_insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections:(id)a3;
- (void)_sortApplicationWidgetCollections:(id)a3;
- (void)fetchGalleryContentForHomeScreenEditingWithGridSize:(unint64_t)a3 addWidgetSheetViewController:(id)a4;
- (void)fetchGalleryContentForStackConfigurationViewController:(id)a3 addWidgetSheetViewController:(id)a4;
- (void)setAddWidgetSheetLocation:(unint64_t)a3;
- (void)setAddWidgetSheetStyle:(unint64_t)a3;
- (void)setAllowedWidgetFamilies:(unint64_t)a3;
- (void)setAllowsFakeWidgets:(BOOL)a3;
- (void)setConfigurationManagerDelegate:(id)a3;
- (void)setEditingSuggestedWidgetItems:(id)a3;
- (void)setGridSizeClassDomain:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setMinimumRequiredSDKVersion:(unint64_t)a3;
- (void)setStackConfigurationSuggestedWidgetItems:(id)a3;
- (void)setWidgetDragHandlerDelegate:(id)a3;
- (void)updatePresentedWidgetEditingViewController:(id)a3;
@end

@implementation SBHAddWidgetSheetConfigurationManager

- (SBHAddWidgetSheetConfigurationManager)initWithWidgetExtensionProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHAddWidgetSheetConfigurationManager;
  v6 = [(SBHAddWidgetSheetConfigurationManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_widgetExtensionProvider, a3);
    v7->_allowedWidgetFamilies = 94;
    [(SBHAddWidgetSheetConfigurationManager *)v7 setAllowsFakeWidgets:1];
    [(SBHAddWidgetSheetConfigurationManager *)v7 setMinimumRequiredSDKVersion:0];
  }

  return v7;
}

- (void)fetchGalleryContentForStackConfigurationViewController:(id)a3 addWidgetSheetViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 sourceStackIconView];
  if (v8)
  {
    unint64_t v9 = [(SBHAddWidgetSheetConfigurationManager *)self _stackConfigurationGridSize];
    v10 = [v8 icon];
    v11 = [v10 gridSizeClass];

    v12 = [[SBHIconGridSizeClassSet alloc] initWithGridSizeClass:v11];
    uint64_t v13 = [(SBHIconGridSizeClassSet *)v12 chsWidgetFamilyMask];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __125__SBHAddWidgetSheetConfigurationManager_fetchGalleryContentForStackConfigurationViewController_addWidgetSheetViewController___block_invoke;
    v14[3] = &unk_1E6AB4D08;
    id v15 = v6;
    id v16 = v8;
    v17 = self;
    id v18 = v7;
    unint64_t v19 = v9;
    [(SBHAddWidgetSheetConfigurationManager *)self _fetchGalleryContentForGridSize:v9 withFamilyMask:v13 completion:v14];
  }
}

uint64_t __125__SBHAddWidgetSheetConfigurationManager_fetchGalleryContentForStackConfigurationViewController_addWidgetSheetViewController___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [*(id *)(a1 + 32) sourceStackIconView];
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    [*(id *)(a1 + 48) setStackConfigurationSuggestedWidgetItems:v8];
    id v5 = [*(id *)(a1 + 56) presenter];
    id v6 = v5;
    if (v5 && [v5 presenterType] == 2) {
      [*(id *)(a1 + 56) setSuggestedItems:v8 forGalleryLayoutSize:*(void *)(a1 + 64)];
    }
  }
  return MEMORY[0x1F4181820]();
}

- (void)fetchGalleryContentForHomeScreenEditingWithGridSize:(unint64_t)a3 addWidgetSheetViewController:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(SBHAddWidgetSheetConfigurationManager *)self _defaultEditingSuggestedWidgetItemsFamilyMask];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __122__SBHAddWidgetSheetConfigurationManager_fetchGalleryContentForHomeScreenEditingWithGridSize_addWidgetSheetViewController___block_invoke;
  v9[3] = &unk_1E6AB4D30;
  v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(SBHAddWidgetSheetConfigurationManager *)self _fetchGalleryContentForGridSize:a3 withFamilyMask:v7 completion:v9];
}

void __122__SBHAddWidgetSheetConfigurationManager_fetchGalleryContentForHomeScreenEditingWithGridSize_addWidgetSheetViewController___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setEditingSuggestedWidgetItems:");
  v3 = [*(id *)(a1 + 40) presenter];
  v4 = v3;
  if (v3 && [v3 presenterType] != 2) {
    [*(id *)(a1 + 40) setSuggestedItems:v5 forGalleryLayoutSize:*(void *)(a1 + 48)];
  }
}

- (void)_fetchGalleryContentForGridSize:(unint64_t)a3 withFamilyMask:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [MEMORY[0x1E4F4AF88] sharedInstance];
  unint64_t v10 = +[SBHAddWidgetSheetConfigurationManager _galleryVariantForAddWidgetSheetLocation:[(SBHAddWidgetSheetConfigurationManager *)self addWidgetSheetLocation]];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke;
  v12[3] = &unk_1E6AB4D58;
  id v13 = v8;
  unint64_t v14 = a4;
  id v11 = v8;
  [v9 fetchGalleryItemsForVariant:v10 gridSize:a3 supportedFamilies:a4 completionHandler:v12];
}

void __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = CHSWidgetFamilyMaskDescription();
  id v8 = SBLogWidgets();
  unint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_cold_1((uint64_t)v7, v6, v9);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_10;
    block[3] = &unk_1E6AAD4C8;
    unint64_t v10 = &v15;
    id v15 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "Found suggested widget items [of families: %@]: %@", buf, 0x16u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_12;
    v11[3] = &unk_1E6AAD7E0;
    unint64_t v10 = &v13;
    id v13 = *(id *)(a1 + 32);
    id v12 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

uint64_t __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (unint64_t)_galleryVariantForAddWidgetSheetLocation:(unint64_t)a3
{
  return a3 == 2;
}

- (unint64_t)_stackConfigurationGridSize
{
  return 2 * ([(SBHAddWidgetSheetConfigurationManager *)self addWidgetSheetStyle] == 1);
}

- (unint64_t)_defaultEditingSuggestedWidgetItemsFamilyMask
{
  if ([(SBHAddWidgetSheetConfigurationManager *)self addWidgetSheetStyle] == 1) {
    return 30;
  }
  else {
    return 14;
  }
}

- (id)applicationWidgetCollectionsForEditingViewController:(id)a3 withAllowedSizeClasses:(id *)a4 allowingNonStackableItems:(BOOL)a5
{
  BOOL v45 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v49 = *a4;
  uint64_t v48 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(CHSWidgetExtensionProvider *)self->_widgetExtensionProvider sbh_descriptorsByExtensionIdentifier];
  v52 = objc_opt_new();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  v51 = self;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v62 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        id v12 = SBHContainingBundleIdentifierForWidgetWithBundleIdentifier(v11);
        id v13 = [obj objectForKeyedSubscript:v11];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __143__SBHAddWidgetSheetConfigurationManager_applicationWidgetCollectionsForEditingViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke;
        v60[3] = &unk_1E6AB4270;
        v60[4] = self;
        unint64_t v14 = objc_msgSend(v13, "bs_filter:", v60);

        if (v12 && [v14 count])
        {
          id v15 = [v52 objectForKey:v12];
          if (!v15)
          {
            id v15 = objc_opt_new();
            [v52 setValue:v15 forKey:v12];
          }
          [v15 addObjectsFromArray:v14];

          self = v51;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v8);
  }

  id v16 = (void *)v48;
  [(SBHAddWidgetSheetConfigurationManager *)self _addFakeWidgetsToApplicationWidgetCollectionsIfAllowed:v48];
  uint64_t v17 = [v47 presenterType];
  uint64_t v18 = v17;
  if (v17)
  {
    if (v17 != 1)
    {
      v21 = 0;
      uint64_t v20 = v49;
      goto LABEL_20;
    }
    id v19 = SBIconLocationTodayView;
  }
  else
  {
    id v19 = SBIconLocationRoot;
  }
  uint64_t v20 = v49;
  v21 = *v19;
  if (v21)
  {
    v22 = [(SBHAddWidgetSheetConfigurationManager *)self listLayoutProvider];
    v23 = [v22 layoutForIconLocation:v21];

    uint64_t v24 = SBHIconListLayoutSupportedIconGridSizeClasses(v23);

    uint64_t v20 = (void *)v24;
  }
LABEL_20:
  v25 = [(SBHAddWidgetSheetConfigurationManager *)self configurationManagerDelegate];
  char v26 = objc_opt_respondsToSelector();
  if (v18 == 1 && (v26 & 1) != 0)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v27 = [v25 rootFolderForAddWidgetSheetConfigurationManager:self];
    v28 = [v27 todayList];
    v29 = [v28 icons];

    uint64_t v30 = [v29 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      v44 = v21;
      v50 = v20;
      uint64_t v32 = *(void *)v57;
      while (2)
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v57 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          if ([v34 isWidgetIcon])
          {
            v35 = [v34 gridSizeClass];
            if (v35 == @"SBHIconGridSizeClassNewsLargeTall")
            {

              self = v51;
LABEL_34:
              uint64_t v20 = [v50 gridSizeClassSetByRemovingGridSizeClass:@"SBHIconGridSizeClassNewsLargeTall"];

              goto LABEL_35;
            }
            v36 = v35;
            v37 = [v34 gridSizeClass];
            int v38 = [v37 isEqualToString:@"SBHIconGridSizeClassNewsLargeTall"];

            self = v51;
            if (v38) {
              goto LABEL_34;
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v56 objects:v65 count:16];
        if (v31) {
          continue;
        }
        break;
      }
      uint64_t v20 = v50;
LABEL_35:
      id v16 = (void *)v48;
      v21 = v44;
    }
  }
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __143__SBHAddWidgetSheetConfigurationManager_applicationWidgetCollectionsForEditingViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_2;
  v54[3] = &unk_1E6AB4D80;
  v54[4] = self;
  id v39 = v16;
  id v55 = v39;
  [v52 enumerateKeysAndObjectsUsingBlock:v54];
  [(SBHAddWidgetSheetConfigurationManager *)self _sortApplicationWidgetCollections:v39];
  if (v45) {
    [(SBHAddWidgetSheetConfigurationManager *)self _insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections:v39];
  }
  id v40 = v20;
  *a4 = v40;
  v41 = v55;
  id v42 = v39;

  return v42;
}

uint64_t __143__SBHAddWidgetSheetConfigurationManager_applicationWidgetCollectionsForEditingViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _isDescriptorAllowed:v3]
    && [*(id *)(a1 + 32) _isDescriptorSupported:v3]
    && [*(id *)(a1 + 32) _isDescriptorUpdatedForSDKRequirements:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) _isDescriptorContainerUnprotected:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __143__SBHAddWidgetSheetConfigurationManager_applicationWidgetCollectionsForEditingViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) iconModel];
  uint64_t v7 = [v6 applicationIconForBundleIdentifier:v16];

  uint64_t v8 = [*(id *)(a1 + 32) vendorNameForAppWithBundleIdentifier:v16];
  uint64_t v9 = [[SBHApplicationWidgetCollection alloc] initWithIcon:v7 galleryItems:v5 vendorName:v8];
  if (!v7)
  {
    unint64_t v10 = [v5 firstObject];
    id v11 = [v10 extensionIdentity];
    id v12 = [v11 extensionBundleIdentifier];
    id v13 = SBHContainingBundleRecordForWidgetWithBundleIdentifier(v12);

    unint64_t v14 = [v13 localizedName];
    if (v14)
    {
      [(SBHApplicationWidgetCollection *)v9 setContainerName:v14];
    }
    else
    {
      id v15 = [v13 localizedShortName];
      [(SBHApplicationWidgetCollection *)v9 setContainerName:v15];
    }
    [(SBHApplicationWidgetCollection *)v9 setIconImageApplicationBundleIdentifier:v16];
  }
  [*(id *)(a1 + 40) addObject:v9];
}

- (id)applicationControlCollections
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = [(CHSWidgetExtensionProvider *)self->_widgetExtensionProvider containers];
  uint64_t v38 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v55;
    v37 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v55 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v4;
        id v5 = *(void **)(*((void *)&v54 + 1) + 8 * v4);
        uint64_t v6 = [v5 containerBundleIdentifier];
        uint64_t v7 = [SBLeafIcon alloc];
        uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v9 = [v8 UUIDString];
        uint64_t v43 = [(SBLeafIcon *)v7 initWithLeafIdentifier:v9 applicationBundleID:v6];

        id v40 = (void *)v6;
        uint64_t v42 = [(SBHAddWidgetSheetConfigurationManager *)self vendorNameForAppWithBundleIdentifier:v6];
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v39 = v5;
        id v45 = [v5 allExtensions];
        uint64_t v11 = [v45 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v51;
          uint64_t v44 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v51 != v13) {
                objc_enumerationMutation(v45);
              }
              id v15 = [*(id *)(*((void *)&v50 + 1) + 8 * i) orderedControlDescriptors];
              if ([v15 count])
              {
                id v16 = [v15 firstObject];
                BOOL v17 = [(SBHAddWidgetSheetConfigurationManager *)self _isDescriptorContainerUnprotected:v16];

                if (v17)
                {
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v46 = 0u;
                  long long v47 = 0u;
                  id v18 = v15;
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v58 count:16];
                  if (v19)
                  {
                    uint64_t v20 = v19;
                    uint64_t v21 = *(void *)v47;
                    do
                    {
                      for (uint64_t j = 0; j != v20; ++j)
                      {
                        if (*(void *)v47 != v21) {
                          objc_enumerationMutation(v18);
                        }
                        uint64_t v23 = *(void *)(*((void *)&v46 + 1) + 8 * j);
                        if ([(SBHAddWidgetSheetConfigurationManager *)self _isDescriptorSupportedByDelegate:v23])
                        {
                          [v10 addObject:v23];
                        }
                      }
                      uint64_t v20 = [v18 countByEnumeratingWithState:&v46 objects:v58 count:16];
                    }
                    while (v20);
                  }

                  uint64_t v13 = v44;
                }
              }
            }
            uint64_t v12 = [v45 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }
          while (v12);
        }

        v25 = (void *)v42;
        uint64_t v24 = (void *)v43;
        char v26 = [[SBHApplicationWidgetCollection alloc] initWithIcon:v43 galleryItems:v10 vendorName:v42];
        v27 = [v39 localizedContainerDisplayName];
        [(SBHApplicationWidgetCollection *)v26 setContainerName:v27];

        if (!v43)
        {
          v28 = [v10 firstObject];
          v29 = [v28 extensionIdentity];
          uint64_t v30 = [v29 extensionBundleIdentifier];
          uint64_t v31 = SBHContainingBundleRecordForWidgetWithBundleIdentifier(v30);

          uint64_t v32 = [v31 localizedName];
          if (v32)
          {
            [(SBHApplicationWidgetCollection *)v26 setContainerName:v32];
          }
          else
          {
            v33 = [v31 localizedShortName];
            [(SBHApplicationWidgetCollection *)v26 setContainerName:v33];
          }
          [(SBHApplicationWidgetCollection *)v26 setIconImageApplicationBundleIdentifier:v40];

          v25 = (void *)v42;
          uint64_t v24 = 0;
        }
        id v3 = v37;
        [v37 addObject:v26];

        uint64_t v4 = v41 + 1;
      }
      while (v41 + 1 != v38);
      uint64_t v38 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v38);
  }

  [(SBHAddWidgetSheetConfigurationManager *)self _addCustomApplicationWidgetCollectionsToApplicationWidgetCollections:v3];
  [(SBHAddWidgetSheetConfigurationManager *)self _sortApplicationWidgetCollections:v3];
  return v3;
}

- (id)vendorNameForAppWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHAddWidgetSheetConfigurationManager *)self configurationManagerDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 addWidgetSheetConfigurationManager:self vendorNameForAppWithBundleIdentifier:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_isDescriptorSupported:(id)a3
{
  uint64_t v4 = [a3 supportedFamilies];
  return ([(SBHAddWidgetSheetConfigurationManager *)self allowedWidgetFamilies] & v4) != 0;
}

- (BOOL)_isDescriptorAllowed:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FA5E60] sharedInstance];
  if ([v5 showInternalWidgets])
  {
    LOBYTE(v6) = 1;
  }
  else if (-[SBHAddWidgetSheetConfigurationManager _isVisibilityWidgetDefined:](self, "_isVisibilityWidgetDefined:", [v4 widgetVisibility]))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v8 = [v4 extensionBundleIdentifier];
    uint64_t v9 = (void *)[v7 initWithSuiteName:v8];

    uint64_t v10 = *MEMORY[0x1E4F58C10];
    uint64_t v11 = [v9 objectForKey:*MEMORY[0x1E4F58C10]];

    if (v11) {
      char v12 = [v9 BOOLForKey:v10];
    }
    else {
      char v12 = [(SBHAddWidgetSheetConfigurationManager *)self _isDescriptorVisibleByDefault:v4];
    }
    LOBYTE(v6) = v12;
  }
  else
  {
    int v6 = [v4 isInternal] ^ 1;
  }

  return v6;
}

- (BOOL)_isDescriptorUpdatedForSDKRequirements:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHAddWidgetSheetConfigurationManager *)self homeScreenDefaults];
  if ([v5 shouldIgnoreMinimumRequiredSDKVersionForWidgets]) {
    char v6 = 1;
  }
  else {
    char v6 = objc_msgSend(v4, "sbh_isLinkedOnOrAfter:", -[SBHAddWidgetSheetConfigurationManager minimumRequiredSDKVersion](self, "minimumRequiredSDKVersion"));
  }

  return v6;
}

- (BOOL)_isDescriptorContainerUnprotected:(id)a3
{
  id v4 = a3;
  id v5 = [v4 extensionIdentity];
  char v6 = [v5 containerBundleIdentifier];
  id v7 = [(SBHAddWidgetSheetConfigurationManager *)self configurationManagerDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v7 addWidgetSheetConfigurationManager:self containerBundleIdentiferForDescriptor:v4];

    char v6 = (void *)v8;
  }
  if (v6) {
    BOOL v9 = [(SBHAddWidgetSheetConfigurationManager *)self _isContainerBundleIdentifierUnprotected:v6];
  }
  else {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_isContainerBundleIdentifierUnprotected:(id)a3
{
  id v3 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:a3];
  char v4 = [v3 isHidden];
  char v5 = (v4 | [v3 isLocked]) ^ 1;

  return v5;
}

- (BOOL)_isDescriptorSupportedByDelegate:(id)a3
{
  id v4 = a3;
  char v5 = [(SBHAddWidgetSheetConfigurationManager *)self configurationManagerDelegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 addWidgetSheetConfigurationManager:self isDescriptorSupported:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)_isVisibilityWidgetDefined:(int64_t)a3
{
  return (unint64_t)a3 > 1;
}

- (BOOL)_isDescriptorVisibleByDefault:(id)a3
{
  return (([a3 widgetVisibility] - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (void)_sortApplicationWidgetCollections:(id)a3
{
  id v3 = a3;
  [v3 sortUsingComparator:&__block_literal_global_68];
  objc_msgSend(v3, "bs_filter:", &__block_literal_global_35);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 removeObjectsInArray:v4];
  [v3 addObjectsFromArray:v4];
}

uint64_t __75__SBHAddWidgetSheetConfigurationManager__sortApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  char v5 = [a2 displayName];
  char v6 = [v4 displayName];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

uint64_t __75__SBHAddWidgetSheetConfigurationManager__sortApplicationWidgetCollections___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 displayName];
  id v3 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  id v4 = [v3 invertedSet];

  if ([v2 rangeOfCharacterFromSet:v4]) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  uint64_t v7 = !v6;

  return v7;
}

- (void)_addCustomApplicationWidgetCollectionsToApplicationWidgetCollections:(id)a3
{
  id v6 = a3;
  id v4 = [(SBHAddWidgetSheetConfigurationManager *)self configurationManagerDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 customApplicationWidgetCollectionsForAddWidgetSheetConfigurationManager:self];
    [v6 addObjectsFromArray:v5];
  }
}

- (void)updatePresentedWidgetEditingViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 presenter];
  id v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = v4;
    uint64_t v9 = [v8 allowedWidgets];
    char v11 = v10;
    char v12 = [SBHIconGridSizeClassSet alloc];
    uint64_t v13 = [(SBHAddWidgetSheetConfigurationManager *)self effectiveGridSizeClassDomain];
    unint64_t v14 = [(SBHIconGridSizeClassSet *)v12 initWithCHSWidgetFamilyMask:v9 inDomain:v13];

    BOOL v17 = v14;
    id v15 = [(SBHAddWidgetSheetConfigurationManager *)self applicationWidgetCollectionsForEditingViewController:v5 withAllowedSizeClasses:&v17 allowingNonStackableItems:v11 & 1];
    id v16 = v17;

    [v8 setApplicationWidgetCollections:v15];
  }
}

- (id)homeScreenDefaults
{
  homeScreenDefaults = self->_homeScreenDefaults;
  if (!homeScreenDefaults)
  {
    id v4 = [(SBHAddWidgetSheetConfigurationManager *)self configurationManagerDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = [v4 homeScreenDefaultsForAddWidgetSheetConfigurationManager:self];
    }
    else
    {
      uint64_t v5 = (SBHomeScreenDefaults *)objc_alloc_init(MEMORY[0x1E4FA60A0]);
    }
    id v6 = self->_homeScreenDefaults;
    self->_homeScreenDefaults = v5;

    homeScreenDefaults = self->_homeScreenDefaults;
  }
  return homeScreenDefaults;
}

- (id)effectiveGridSizeClassDomain
{
  v2 = [(SBHAddWidgetSheetConfigurationManager *)self gridSizeClassDomain];
  if (!v2)
  {
    v2 = +[SBHIconGridSizeClassDomain globalDomain];
  }
  return v2;
}

- (void)_addFakeWidgetsToApplicationWidgetCollectionsIfAllowed:(id)a3
{
  if (self->_allowsFakeWidgets)
  {
    id v4 = a3;
    [(SBHAddWidgetSheetConfigurationManager *)self _addShortcutsSpecialAvocadoToApplicationWidgetCollections:v4];
    [(SBHAddWidgetSheetConfigurationManager *)self _addSiriSuggestionsSpecialAvocadosToApplicationWidgetCollections:v4];
    [(SBHAddWidgetSheetConfigurationManager *)self _addFilesSpecialAvocadosToApplicationWidgetCollections:v4];
  }
}

- (void)_addShortcutsSpecialAvocadoToApplicationWidgetCollections:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBHAddWidgetSheetConfigurationManager *)self _shouldAddSpecialAvocadoOfType:2]|| [(SBHAddWidgetSheetConfigurationManager *)self _shouldAddSpecialAvocadoOfType:6])
  {
    uint64_t v5 = [(SBHAddWidgetSheetConfigurationManager *)self iconModel];
    id v6 = [v5 applicationIconForBundleIdentifier:@"com.apple.shortcuts"];

    if (v6)
    {
      uint64_t v7 = [SBHApplicationWidgetCollection alloc];
      id v8 = [[SBHSpecialWidgetDescriptor alloc] initWithType:6];
      v14[0] = v8;
      uint64_t v9 = [[SBHSpecialWidgetDescriptor alloc] initWithType:2];
      v14[1] = v9;
      char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
      char v11 = SBHBundle();
      char v12 = [v11 localizedStringForKey:@"APPLE_WIDGET_COLLECTION_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      uint64_t v13 = [(SBHApplicationWidgetCollection *)v7 initWithIcon:v6 galleryItems:v10 vendorName:v12];

      [v4 addObject:v13];
    }
  }
}

- (void)_addSiriSuggestionsSpecialAvocadosToApplicationWidgetCollections:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBHAddWidgetSheetConfigurationManager *)self _shouldAddSpecialAvocadoOfType:1])
  {
    uint64_t v5 = [[SBHSpecialWidgetDescriptor alloc] initWithType:1];
    id v6 = [[SBHSpecialWidgetDescriptor alloc] initWithType:4];
    uint64_t v7 = [(SBHAddWidgetSheetConfigurationManager *)self _widgetIconForDescriptor:v5 sizeClass:2];
    id v8 = [SBHApplicationWidgetCollection alloc];
    v15[0] = v6;
    v15[1] = v5;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    char v10 = SBHBundle();
    char v11 = [v10 localizedStringForKey:@"APPLE_WIDGET_COLLECTION_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    char v12 = [(SBHApplicationWidgetCollection *)v8 initWithIcon:v7 galleryItems:v9 vendorName:v11];

    uint64_t v13 = SBHBundle();
    unint64_t v14 = [v13 localizedStringForKey:@"PROACTIVE_SUGGESTIONS_WIDGET_COLLECTION_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [(SBHApplicationWidgetCollection *)v12 setContainerName:v14];

    [v4 addObject:v12];
  }
}

- (void)_addFilesSpecialAvocadosToApplicationWidgetCollections:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBHAddWidgetSheetConfigurationManager *)self _shouldAddSpecialAvocadoOfType:3]&& [(SBHAddWidgetSheetConfigurationManager *)self _isContainerBundleIdentifierUnprotected:@"com.apple.DocumentsApp"])
  {
    uint64_t v5 = [(SBHAddWidgetSheetConfigurationManager *)self iconModel];
    id v6 = [v5 applicationIconForBundleIdentifier:@"com.apple.DocumentsApp"];

    if (v6)
    {
      uint64_t v7 = [SBHApplicationWidgetCollection alloc];
      id v8 = [[SBHSpecialWidgetDescriptor alloc] initWithType:3];
      v13[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      char v10 = SBHBundle();
      char v11 = [v10 localizedStringForKey:@"APPLE_WIDGET_COLLECTION_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      char v12 = [(SBHApplicationWidgetCollection *)v7 initWithIcon:v6 galleryItems:v9 vendorName:v11];

      [v4 addObject:v12];
    }
    else
    {
      char v12 = SBLogWidgets();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SBHAddWidgetSheetConfigurationManager _addFilesSpecialAvocadosToApplicationWidgetCollections:](v12);
      }
    }
  }
}

- (void)_insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBHAddWidgetSheetConfigurationManager *)self _shouldAddSpecialAvocadoOfType:5])
  {
    uint64_t v5 = [[SBHSpecialWidgetDescriptor alloc] initWithType:5];
    v18[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v7 = [(SBHAddWidgetSheetConfigurationManager *)self _widgetIconForDescriptors:v6 sizeClass:2];

    id v8 = [SBHApplicationWidgetCollection alloc];
    uint64_t v9 = SBHBundle();
    char v10 = [v9 localizedStringForKey:@"APPLE_WIDGET_COLLECTION_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    char v11 = [(SBHApplicationWidgetCollection *)v8 initWithIcon:v7 galleryItems:MEMORY[0x1E4F1CBF0] vendorName:v10];

    [v4 insertObject:v11 atIndex:0];
    char v12 = [MEMORY[0x1E4F4AF88] sharedInstance];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke;
    void v14[3] = &unk_1E6AB4DE8;
    id v15 = v11;
    id v16 = self;
    id v17 = v4;
    uint64_t v13 = v11;
    [v12 fetchSmartStackOfVariant:0 completionHandler:v14];
  }
}

void __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = SBLogWidgets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke_cold_1(v5, v6);
    }
  }
  else
  {
    uint64_t v7 = [a2 firstObject];
    id v8 = SBLogWidgets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "Found suggested default widget stack: %@", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke_64;
    v12[3] = &unk_1E6AADD48;
    id v13 = v7;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    char v11 = *(void **)(a1 + 48);
    id v14 = v9;
    uint64_t v15 = v10;
    id v16 = v11;
    id v6 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
}

void __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke_64(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v3 = [*(id *)(a1 + 32) smallDefaultStack];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v53;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v53 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v52 + 1) + 8 * v7) avocadoDescriptor];
        id v9 = [v8 sanitizedDescriptor];

        if (v9) {
          [v2 addObject:v9];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v5);
  }

  uint64_t v10 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  char v11 = [*(id *)(a1 + 32) mediumDefaultStack];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v49;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v48 + 1) + 8 * v15) avocadoDescriptor];
        id v17 = [v16 sanitizedDescriptor];

        if (v17) {
          [v10 addObject:v17];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v13);
  }

  id v18 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v19 = [*(id *)(a1 + 32) largeDefaultStack];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v45;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = [*(id *)(*((void *)&v44 + 1) + 8 * v23) avocadoDescriptor];
        v25 = [v24 sanitizedDescriptor];

        if (v25) {
          [v18 addObject:v25];
        }

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v58 count:16];
    }
    while (v21);
  }

  char v26 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v39 = a1;
  v27 = [*(id *)(a1 + 32) extraLargeDefaultStack];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v57 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v41;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = [*(id *)(*((void *)&v40 + 1) + 8 * v31) avocadoDescriptor];
        v33 = [v32 sanitizedDescriptor];

        if (v33) {
          [v26 addObject:v33];
        }

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v57 count:16];
    }
    while (v29);
  }

  v34 = [[SBHWidgetStackDescriptor alloc] initWithSmallStackDescriptors:v2 mediumStackDescriptors:v10 largeStackDescriptors:v18 extraLargeStackDescriptors:v26];
  v35 = *(void **)(v39 + 40);
  long long v56 = v34;
  uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  [v35 setWidgetDescriptors:v36];

  v37 = [*(id *)(v39 + 48) configurationManagerDelegate];
  uint64_t v38 = [v37 addWidgetSheetViewControllerForAddWidgetSheetConfigurationManager:*(void *)(v39 + 48)];
  [v38 setApplicationWidgetCollections:*(void *)(v39 + 56)];
}

- (BOOL)_shouldAddSpecialAvocadoOfType:(unint64_t)a3
{
  if (!self->_allowsFakeWidgets) {
    return 0;
  }
  id v3 = @"com.apple.shortcuts";
  if (a3 != 2 && a3 != 6)
  {
    if (a3 != 3) {
      return 1;
    }
    id v3 = @"com.apple.DocumentsApp";
  }
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBHAddWidgetSheetConfigurationManager *)self widgetDragHandlerDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 widgetIconForDescriptor:v6 sizeClass:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBHAddWidgetSheetConfigurationManager *)self widgetDragHandlerDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 widgetIconForDescriptors:v6 sizeClass:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSArray)stackConfigurationSuggestedWidgetItems
{
  return self->_stackConfigurationSuggestedWidgetItems;
}

- (void)setStackConfigurationSuggestedWidgetItems:(id)a3
{
}

- (NSArray)editingSuggestedWidgetItems
{
  return self->_editingSuggestedWidgetItems;
}

- (void)setEditingSuggestedWidgetItems:(id)a3
{
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  self->_addWidgetSheetStyle = a3;
}

- (unint64_t)addWidgetSheetLocation
{
  return self->_addWidgetSheetLocation;
}

- (void)setAddWidgetSheetLocation:(unint64_t)a3
{
  self->_addWidgetSheetLocation = a3;
}

- (unint64_t)allowedWidgetFamilies
{
  return self->_allowedWidgetFamilies;
}

- (void)setAllowedWidgetFamilies:(unint64_t)a3
{
  self->_allowedWidgetFamilies = a3;
}

- (unint64_t)minimumRequiredSDKVersion
{
  return self->_minimumRequiredSDKVersion;
}

- (void)setMinimumRequiredSDKVersion:(unint64_t)a3
{
  self->_minimumRequiredSDKVersion = a3;
}

- (CHSWidgetExtensionProvider)widgetExtensionProvider
{
  return self->_widgetExtensionProvider;
}

- (SBHIconModel)iconModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconModel);
  return (SBHIconModel *)WeakRetained;
}

- (void)setIconModel:(id)a3
{
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listLayoutProvider);
  return (SBIconListLayoutProvider *)WeakRetained;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (SBHWidgetDragHandling)widgetDragHandlerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDragHandlerDelegate);
  return (SBHWidgetDragHandling *)WeakRetained;
}

- (void)setWidgetDragHandlerDelegate:(id)a3
{
}

- (SBHAddWidgetSheetConfigurationManagerDelegate)configurationManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationManagerDelegate);
  return (SBHAddWidgetSheetConfigurationManagerDelegate *)WeakRetained;
}

- (void)setConfigurationManagerDelegate:(id)a3
{
}

- (BOOL)allowsFakeWidgets
{
  return self->_allowsFakeWidgets;
}

- (void)setAllowsFakeWidgets:(BOOL)a3
{
  self->_allowsFakeWidgets = a3;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return self->_gridSizeClassDomain;
}

- (void)setGridSizeClassDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
  objc_destroyWeak((id *)&self->_configurationManagerDelegate);
  objc_destroyWeak((id *)&self->_widgetDragHandlerDelegate);
  objc_destroyWeak((id *)&self->_listLayoutProvider);
  objc_destroyWeak((id *)&self->_iconModel);
  objc_storeStrong((id *)&self->_widgetExtensionProvider, 0);
  objc_storeStrong((id *)&self->_editingSuggestedWidgetItems, 0);
  objc_storeStrong((id *)&self->_stackConfigurationSuggestedWidgetItems, 0);
  objc_storeStrong((id *)&self->_homeScreenDefaults, 0);
}

void __99__SBHAddWidgetSheetConfigurationManager__fetchGalleryContentForGridSize_withFamilyMask_completion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1D7F0A000, a3, OS_LOG_TYPE_ERROR, "Couldn't fetch suggested widget items [of families: %@] with error: %@", (uint8_t *)&v6, 0x16u);
}

- (void)_addFilesSpecialAvocadosToApplicationWidgetCollections:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Error adding Files applicationWidgetCollection: nil icon", v1, 2u);
}

void __112__SBHAddWidgetSheetConfigurationManager__insertSmartStackSpecialAvocadosAtTheTopOfApplicationWidgetCollections___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Couldn't fetch default widget stack with error: %@", (uint8_t *)&v4, 0xCu);
}

@end