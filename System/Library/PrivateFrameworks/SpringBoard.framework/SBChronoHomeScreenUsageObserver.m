@interface SBChronoHomeScreenUsageObserver
- (CHSWidgetHost)widgetHost;
- (SBChronoHomeScreenUsageObserver)init;
- (SBChronoHomeScreenUsageObserver)initWithIconManager:(id)a3;
- (SBHIconManager)iconManager;
- (id)_containerDescriptorForWidgetIcon:(id)a3 atLocation:(int64_t)a4 page:(unint64_t)a5;
- (id)_descriptionForArray:(id)a3 name:(id)a4;
- (unint64_t)_supportedFamilies;
- (unint64_t)widgetDataGeneration;
- (void)_rebuildAndTransmitConfiguredWidgetData:(id)a3;
- (void)homeScreenUsageAggregator:(id)a3 didNoteCurrentPageIndexChanged:(unint64_t)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserAddedWidgetIconStackSuggestion:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedWidgetIconStackSuggestion:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5;
- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconAdded:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconRemoved:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4;
- (void)homeScreenUsageAggregatorAddWidgetSheetWillPresent:(id)a3;
- (void)homeScreenUsageAggregatorDidNoteListLayoutProviderChanged:(id)a3;
- (void)setWidgetDataGeneration:(unint64_t)a3;
@end

@implementation SBChronoHomeScreenUsageObserver

- (void)homeScreenUsageAggregator:(id)a3 didNoteCurrentPageIndexChanged:(unint64_t)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = SBLogChrono();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Current home screen page changed to: %lu", (uint8_t *)&v6, 0xCu);
  }
}

- (SBChronoHomeScreenUsageObserver)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBChronoHomeScreenUsageObserver.m" lineNumber:45 description:@"use -initWithSBHIconManager:"];

  return 0;
}

- (SBChronoHomeScreenUsageObserver)initWithIconManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBChronoHomeScreenUsageObserver;
  int v6 = [(SBChronoHomeScreenUsageObserver *)&v12 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconManager, a3);
    [(SBHIconManager *)v7->_iconManager setUsageMonitoringEnabled:1];
    uint64_t v8 = [(SBHIconManager *)v7->_iconManager usageMonitor];
    [v8 addObserver:v7];

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F58E60]) initWithIdentifier:@"SpringBoard-Homescreen"];
    widgetHost = v7->_widgetHost;
    v7->_widgetHost = (CHSWidgetHost *)v9;

    [(SBChronoHomeScreenUsageObserver *)v7 _rebuildAndTransmitConfiguredWidgetData:v7->_iconManager];
  }

  return v7;
}

- (void)homeScreenUsageAggregatorDidNoteListLayoutProviderChanged:(id)a3
{
  id v4 = a3;
  id v5 = SBLogChrono();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "List layout provider changed", v7, 2u);
  }

  int v6 = [v4 iconManager];

  [(SBChronoHomeScreenUsageObserver *)self _rebuildAndTransmitConfiguredWidgetData:v6];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconAdded:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = SBLogChrono();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 widgets];
    int v11 = 138412290;
    objc_super v12 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon added: %@", (uint8_t *)&v11, 0xCu);
  }
  v10 = [v7 iconManager];

  [(SBChronoHomeScreenUsageObserver *)self _rebuildAndTransmitConfiguredWidgetData:v10];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconRemoved:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = SBLogChrono();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 widgets];
    int v11 = 138412290;
    objc_super v12 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon removed: %@", (uint8_t *)&v11, 0xCu);
  }
  v10 = [v7 iconManager];

  [(SBChronoHomeScreenUsageObserver *)self _rebuildAndTransmitConfiguredWidgetData:v10];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = SBLogChrono();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 activeDataSource];
    v10 = [v6 widgets];
    int v12 = 138412546;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon stack changed active widget: %@ all widgets: %@", (uint8_t *)&v12, 0x16u);
  }
  int v11 = [v7 iconManager];

  [(SBChronoHomeScreenUsageObserver *)self _rebuildAndTransmitConfiguredWidgetData:v11];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserAddedWidgetIconStackSuggestion:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = SBLogChrono();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 widgets];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted user added suggestion: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedWidgetIconStackSuggestion:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = SBLogChrono();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 widgets];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted user dislike of suggestion: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = SBLogChrono();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 widgets];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted dislike of Siri Suggestion on suggestion: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = SBLogChrono();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 widgets];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Widget icon tapped: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)homeScreenUsageAggregatorAddWidgetSheetWillPresent:(id)a3
{
  id v4 = SBLogChrono();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Add Widget sheet will present", v8, 2u);
  }

  id v5 = objc_alloc_init(MEMORY[0x1E4F58D08]);
  id v6 = [(SBChronoHomeScreenUsageObserver *)self widgetHost];
  int v7 = [v6 identifier];
  [v5 userEnteredAddGalleryForHost:v7];
}

- (unint64_t)_supportedFamilies
{
  if (SBHScreenTypeIsPad()) {
    return 94;
  }
  else {
    return 78;
  }
}

- (void)_rebuildAndTransmitConfiguredWidgetData:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(SBChronoHomeScreenUsageObserver *)self widgetDataGeneration] + 1;
  [(SBChronoHomeScreenUsageObserver *)self setWidgetDataGeneration:v6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__SBChronoHomeScreenUsageObserver__rebuildAndTransmitConfiguredWidgetData___block_invoke;
  v8[3] = &unk_1E6AF7748;
  v8[4] = self;
  id v9 = v5;
  unint64_t v10 = v6;
  SEL v11 = a2;
  id v7 = v5;
  [v7 performAfterCachingWidgetIntentsUsingBlock:v8];
}

void __75__SBChronoHomeScreenUsageObserver__rebuildAndTransmitConfiguredWidgetData___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == [*(id *)(a1 + 32) widgetDataGeneration])
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    id v4 = [*(id *)(a1 + 40) rootFolder];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__SBChronoHomeScreenUsageObserver__rebuildAndTransmitConfiguredWidgetData___block_invoke_2;
    v15[3] = &unk_1E6B03FE8;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    id v16 = v5;
    uint64_t v17 = v6;
    id v7 = v3;
    id v18 = v7;
    [v5 enumerateAllIconsWithOptions:2 usingBlock:v15];
    int v8 = SBLogChrono();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) _descriptionForArray:v7 name:@"containers"];
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Configured widgets changed: %@", buf, 0xCu);
    }
    unint64_t v10 = [*(id *)(a1 + 32) iconManager];
    SEL v11 = [v10 widgetMetricsProvider];

    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v11, "systemDefaultMetricsSpecificationForFamilies:", objc_msgSend(*(id *)(a1 + 32), "_supportedFamilies"));
    }
    else {
    int v12 = [v11 systemDefaultMetricsSpecification];
    }
    if (!v12)
    {
      __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"SBChronoHomeScreenUsageObserver.m" lineNumber:154 description:@"A widget metrics specification is required."];
    }
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F58DE0]) initWithContainerDescriptors:v7 metricsSpecification:v12];
    [*(id *)(*(void *)(a1 + 32) + 8) setConfiguration:v13];
  }
}

void __75__SBChronoHomeScreenUsageObserver__rebuildAndTransmitConfiguredWidgetData___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  uint64_t v6 = objc_opt_class();
  id v7 = SBSafeCast(v6, v5);

  if (v7)
  {
    uint64_t v8 = objc_msgSend(a1[4], "visibleIndexForIndex:", objc_msgSend(v11, "indexAtPosition:", 0));
    if ([a1[4] isIconAtIndexPathInTodayList:v11]) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    unint64_t v10 = [a1[5] _containerDescriptorForWidgetIcon:v7 atLocation:v9 page:v8];
    if (v10) {
      [a1[6] addObject:v10];
    }
  }
}

- (id)_containerDescriptorForWidgetIcon:(id)a3 atLocation:(int64_t)a4 page:(unint64_t)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v37 = [MEMORY[0x1E4F1CA48] array];
  v35 = [v5 gridSizeClass];
  uint64_t v40 = CHSWidgetFamilyForSBHIconGridSizeClass();
  [v5 widgets];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v41)
  {
    uint64_t v38 = *(void *)v43;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v43 != v38) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v42 + 1) + 8 * v6);
        uint64_t v8 = [(SBChronoHomeScreenUsageObserver *)self iconManager];
        id v9 = v5;
        unint64_t v10 = [v8 intentForWidget:v7 ofIcon:v5];

        id v11 = objc_alloc(MEMORY[0x1E4F58DD8]);
        int v12 = [v7 extensionBundleIdentifier];
        uint64_t v13 = [v7 containerBundleIdentifier];
        __int16 v14 = [v7 kind];
        v15 = (void *)[v11 initWithExtensionBundleIdentifier:v12 containerBundleIdentifier:v13 kind:v14 family:v40 intent:v10];

        id v16 = [(SBChronoHomeScreenUsageObserver *)self iconManager];
        uint64_t v17 = [v16 widgetMetricsProvider];
        id v18 = [v17 systemMetricsForWidget:v15];

        id v19 = objc_alloc(MEMORY[0x1E4F58D10]);
        v20 = [v7 uniqueIdentifier];
        uint64_t v21 = (void *)[v19 initWithUniqueIdentifier:v20 widget:v15 metrics:v18];

        objc_msgSend(v21, "setSuggestion:", objc_msgSend(v7, "suggestionSource") == 1);
        objc_msgSend(v21, "setSystemConfigured:", objc_msgSend(v7, "suggestionSource") == 2);
        v22 = (void *)[objc_alloc(MEMORY[0x1E4F58EE0]) initWithRenderingMode:0 backgroundViewPolicy:0];
        v23 = (void *)[objc_alloc(MEMORY[0x1E4F58EE0]) initWithRenderingMode:2 backgroundViewPolicy:2];
        v24 = (void *)[objc_alloc(MEMORY[0x1E4F58EE0]) initWithRenderingMode:2 backgroundViewPolicy:0];
        v48[0] = v22;
        v48[1] = v23;
        v48[2] = v24;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
        [v21 setSupportedRenderSchemes:v25];

        if (v21)
        {
          [v37 addObject:v21];
          v26 = SBLogChronoVerbose();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v21;
            _os_log_debug_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEBUG, "Found configured widget: %@", buf, 0xCu);
          }
        }
        ++v6;
        id v5 = v9;
      }
      while (v41 != v6);
      uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v41);
  }
  if ([v37 count])
  {
    id v27 = objc_alloc(MEMORY[0x1E4F58C38]);
    v28 = [v5 uniqueIdentifier];
    v29 = [v5 activeWidget];
    v30 = [v29 uniqueIdentifier];
    v31 = (void *)[v27 initWithUniqueIdentifier:v28 location:a4 canAppearInSecureEnvironment:a4 == 2 page:a5 family:v40 widgets:v37 activeWidget:v30];
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)_descriptionForArray:(id)a3 name:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F4F718];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 builderWithObject:0];
  [v8 appendArraySection:v7 withName:v6 skipIfEmpty:0];

  id v9 = [v8 build];

  return v9;
}

- (CHSWidgetHost)widgetHost
{
  return self->_widgetHost;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (unint64_t)widgetDataGeneration
{
  return self->_widgetDataGeneration;
}

- (void)setWidgetDataGeneration:(unint64_t)a3
{
  self->_widgetDataGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_widgetHost, 0);
}

@end