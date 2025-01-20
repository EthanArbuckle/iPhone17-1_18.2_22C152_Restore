@interface WGWidgetDataSourceManager
+ (id)_widgetExtensionsDiscoveryAttributes;
+ (id)discoverAvailableWidgetsWithError:(id *)a3;
- (BOOL)_shouldPublishWidgetExtension:(id)a3;
- (NSArray)dataSources;
- (WGWidgetDataSourceManager)init;
- (WGWidgetVisibilityManager)_widgetVisbilityManager;
- (_WGParentDataSourceManager)parentDataSourceManager;
- (id)_plugInDiscoveryToken;
- (void)_beginContinuousPlugInDiscovery;
- (void)_endContinuousPlugInDiscovery;
- (void)_revokeExtensionWithIdentifier:(id)a3;
- (void)_setPlugInDiscoveryToken:(id)a3;
- (void)_start:(id)a3;
- (void)_stop:(id)a3;
- (void)_updateDataSourceWithExtension:(id)a3;
- (void)_updatePublishedWidgetExtensions;
- (void)_updatePublishedWidgetExtensions:(id)a3;
- (void)setParentDataSourceManager:(id)a3;
- (void)setWidgetVisbilityManager:(id)a3;
@end

@implementation WGWidgetDataSourceManager

+ (id)_widgetExtensionsDiscoveryAttributes
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F07FF8];
  v5[0] = @"com.apple.widget-extension";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

+ (id)discoverAvailableWidgetsWithError:(id *)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08800];
  v5 = [a1 _widgetExtensionsDiscoveryAttributes];
  v6 = [v4 extensionsWithMatchingAttributes:v5 error:a3];
  v7 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_1);

  return v7;
}

WGWidgetDatum *__63__WGWidgetDataSourceManager_discoverAvailableWidgetsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WGWidgetDatum alloc] initWithExtension:v2];

  return v3;
}

- (WGWidgetDataSourceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)WGWidgetDataSourceManager;
  id v2 = [(WGWidgetDataSourceManager *)&v8 init];
  if (v2)
  {
    v3 = [[WGWidgetDataSource alloc] initWithIdentifier:@"com.apple.notificationcenter.widgetdatasource"];
    widgetDataSource = v2->_widgetDataSource;
    v2->_widgetDataSource = v3;

    v5 = objc_alloc_init(WGWidgetVisibilityManager);
    widgetVisbilityManager = v2->_widgetVisbilityManager;
    v2->_widgetVisbilityManager = v5;

    [(WGWidgetVisibilityManager *)v2->_widgetVisbilityManager setDelegate:v2];
  }
  return v2;
}

- (NSArray)dataSources
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_widgetDataSource;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (void)_start:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id didStartBlock = self->_didStartBlock;
  self->_id didStartBlock = v4;

  self->_isPublishing = 1;
  [(WGWidgetDataSourceManager *)self _beginContinuousPlugInDiscovery];
  parentDataSourceManager = self->_parentDataSourceManager;
  [(_WGParentDataSourceManager *)parentDataSourceManager childDataSourceManagerDataSourcesDidChange:self];
}

- (void)_stop:(id)a3
{
  id v5 = a3;
  self->_isPublishing = 0;
  [(WGWidgetDataSourceManager *)self _endContinuousPlugInDiscovery];
  uint64_t v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    uint64_t v4 = v5;
  }
}

- (BOOL)_shouldPublishWidgetExtension:(id)a3
{
  widgetVisbilityManager = self->_widgetVisbilityManager;
  uint64_t v4 = [a3 identifier];
  LOBYTE(widgetVisbilityManager) = [(WGWidgetVisibilityManager *)widgetVisbilityManager isWidgetWithIdentifierVisible:v4];

  return (char)widgetVisbilityManager;
}

- (void)_updateDataSourceWithExtension:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[WGWidgetDatum alloc] initWithExtension:v4];

    [(WGWidgetDataSource *)self->_widgetDataSource replaceWithDatum:v5];
  }
}

- (void)_revokeExtensionWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(WGWidgetDataSource *)self->_widgetDataSource removeDatumWithIdentifier:v4];
  }
}

- (void)_updatePublishedWidgetExtensions:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL isPublishing = self->_isPublishing;
  v6 = WGLogWidgets;
  BOOL v7 = os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG);
  if (isPublishing)
  {
    if (v7) {
      -[WGWidgetDataSourceManager _updatePublishedWidgetExtensions:](v6, v4);
    }
    objc_super v8 = [(WGWidgetDataSource *)self->_widgetDataSource widgetIdentifiers];
    v9 = (void *)[v8 mutableCopy];

    if ([v4 count])
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v32 = v4;
      id v10 = v4;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v40;
        id v33 = v10;
        v34 = v9;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v40 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if ([(WGWidgetDataSourceManager *)self _shouldPublishWidgetExtension:v15])
            {
              v16 = [v15 identifier];
              if ([v9 containsObject:v16])
              {
                v17 = [(WGWidgetDataSource *)self->_widgetDataSource widgetDatumWithIdentifier:v16];
                v18 = [v17 representedExtension];

                v19 = [v18 _plugIn];
                v20 = [v15 _plugIn];
                char v21 = [v19 isEqual:v20];

                if ((v21 & 1) == 0)
                {
                  v22 = (void *)WGLogWidgets;
                  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
                  {
                    v23 = v22;
                    v24 = objc_msgSend(v18, "wg_description");
                    *(_DWORD *)buf = 138543618;
                    v45 = v16;
                    __int16 v46 = 2114;
                    v47 = v24;
                    _os_log_debug_impl(&dword_222E49000, v23, OS_LOG_TYPE_DEBUG, "Widget extension with ID '%{public}@' has changed: %{public}@ ", buf, 0x16u);
                  }
                  [(WGWidgetDataSourceManager *)self _updateDataSourceWithExtension:v15];
                }
                v9 = v34;
                [v34 removeObject:v16];

                id v10 = v33;
              }
              else
              {
                [(WGWidgetDataSourceManager *)self _updateDataSourceWithExtension:v15];
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v48 count:16];
        }
        while (v12);
      }

      id v4 = v32;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v25 = v9;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          [(WGWidgetDataSourceManager *)self _revokeExtensionWithIdentifier:*(void *)(*((void *)&v35 + 1) + 8 * j)];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v27);
    }

    id didStartBlock = (void (**)(void))self->_didStartBlock;
    if (didStartBlock)
    {
      didStartBlock[2]();
      id v31 = self->_didStartBlock;
      self->_id didStartBlock = 0;
    }
  }
  else if (v7)
  {
    -[WGWidgetDataSourceManager _updatePublishedWidgetExtensions:](v6);
  }
}

- (void)_updatePublishedWidgetExtensions
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x263F08800];
  v3 = [(id)objc_opt_class() _widgetExtensionsDiscoveryAttributes];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke;
  v4[3] = &unk_264676658;
  objc_copyWeak(&v5, &location);
  [v2 extensionsWithMatchingAttributes:v3 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke_cold_1();
    }
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke_2;
    v7[3] = &unk_264676630;
    objc_copyWeak(&v9, (id *)(a1 + 32));
    id v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v7);

    objc_destroyWeak(&v9);
  }
}

void __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updatePublishedWidgetExtensions:*(void *)(a1 + 32)];
}

- (void)_beginContinuousPlugInDiscovery
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_222E49000, a2, OS_LOG_TYPE_DEBUG, "New discovery token: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = (void *)WGLogWidgets;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_cold_2();
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_16;
    block[3] = &unk_264676588;
    id v9 = &v13;
    id v13 = WeakRetained;
    id v10 = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
      __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_cold_1(v7, v5);
    }
    id v11 = objc_loadWeakRetained((id *)(a1 + 32));
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_15;
    v14[3] = &unk_264676680;
    id v9 = &v15;
    id v15 = v11;
    id v16 = v5;
    id v10 = v11;
    dispatch_async(MEMORY[0x263EF83A0], v14);
  }
}

uint64_t __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_15(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _widgetVisbilityManager];
  [v2 updateVisibilityForExtensions:*(void *)(a1 + 40)];

  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _updatePublishedWidgetExtensions:v4];
}

uint64_t __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_16(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPlugInDiscoveryToken:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _beginContinuousPlugInDiscovery];
}

- (void)_endContinuousPlugInDiscovery
{
  if (self->_plugInDiscoveryToken)
  {
    objc_msgSend(MEMORY[0x263F08800], "endMatchingExtensions:");
    id plugInDiscoveryToken = self->_plugInDiscoveryToken;
    self->_id plugInDiscoveryToken = 0;
  }
}

- (id)_plugInDiscoveryToken
{
  return self->_plugInDiscoveryToken;
}

- (void)_setPlugInDiscoveryToken:(id)a3
{
}

- (_WGParentDataSourceManager)parentDataSourceManager
{
  return self->_parentDataSourceManager;
}

- (void)setParentDataSourceManager:(id)a3
{
  self->_parentDataSourceManager = (_WGParentDataSourceManager *)a3;
}

- (WGWidgetVisibilityManager)_widgetVisbilityManager
{
  return self->_widgetVisbilityManager;
}

- (void)setWidgetVisbilityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didStartBlock, 0);
  objc_storeStrong(&self->_plugInDiscoveryToken, 0);
  objc_storeStrong((id *)&self->_widgetVisbilityManager, 0);
  objc_storeStrong((id *)&self->_widgetDataSource, 0);
}

- (void)_updatePublishedWidgetExtensions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_222E49000, log, OS_LOG_TYPE_DEBUG, "Skip loading widgets extensions because we aren't publishing yet", v1, 2u);
}

- (void)_updatePublishedWidgetExtensions:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 valueForKey:@"wg_description"];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_222E49000, v5, v6, "Extensions to update: %{public}@", v7, v8, v9, v10, v11);
}

void __61__WGWidgetDataSourceManager__updatePublishedWidgetExtensions__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_222E49000, v0, OS_LOG_TYPE_ERROR, "Encountered error requestion widget extensions: %{public}@", v1, 0xCu);
}

void __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 valueForKey:@"wg_description"];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_222E49000, v5, v6, "Discovered widget plug-ins: %{public}@", v7, v8, v9, v10, v11);
}

void __60__WGWidgetDataSourceManager__beginContinuousPlugInDiscovery__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_222E49000, v0, OS_LOG_TYPE_ERROR, "Encountered errors discovering widget plug-ins: %{public}@", v1, 0xCu);
}

@end