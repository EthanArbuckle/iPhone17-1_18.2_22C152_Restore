@interface WGDataSourceManager
+ (id)__sharedInstance;
+ (void)requestSharedDataSourceManager:(id)a3;
- (id)discoverAvailableWidgetsWithError:(id *)a3;
- (void)_begin:(id)a3;
- (void)_start:(id)a3;
- (void)_stop:(id)a3;
- (void)addWidgetDataSourceChangeHandler:(id)a3 forIdentifier:(id)a4;
- (void)childDataSourceManagerDataSourcesDidChange:(id)a3;
- (void)removeChangeHandlersWithIdentifier:(id)a3;
@end

@implementation WGDataSourceManager

+ (id)__sharedInstance
{
  if (__sharedInstance_onceToken != -1) {
    dispatch_once(&__sharedInstance_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)__sharedInstance___sharedInstance;
  return v2;
}

uint64_t __39__WGDataSourceManager___sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(WGDataSourceManager);
  uint64_t v1 = __sharedInstance___sharedInstance;
  __sharedInstance___sharedInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (void)requestSharedDataSourceManager:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(a1, "__sharedInstance");
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__WGDataSourceManager_requestSharedDataSourceManager___block_invoke;
    v7[3] = &unk_264676BB0;
    id v8 = v5;
    id v9 = v4;
    id v6 = v5;
    [v6 _begin:v7];
  }
}

uint64_t __54__WGDataSourceManager_requestSharedDataSourceManager___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_begin:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_didBegin)
  {
    if (v4) {
      (*((void (**)(id))v4 + 2))(v4);
    }
  }
  else
  {
    self->_didBegin = 1;
    id v6 = objc_alloc_init(WGWidgetDataSourceManager);
    widgetDataSourceManager = self->_widgetDataSourceManager;
    self->_widgetDataSourceManager = v6;

    [(WGWidgetDataSourceManager *)self->_widgetDataSourceManager setParentDataSourceManager:self];
    dispatch_group_t v8 = dispatch_group_create();
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __30__WGDataSourceManager__begin___block_invoke;
    v13[3] = &unk_2646770C0;
    dispatch_group_t v14 = v8;
    id v9 = v8;
    v10 = (void (**)(void, void))MEMORY[0x223CAA850](v13);
    ((void (**)(void, WGWidgetDataSourceManager *))v10)[2](v10, self->_widgetDataSourceManager);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __30__WGDataSourceManager__begin___block_invoke_3;
    v11[3] = &unk_2646768C8;
    id v12 = v5;
    dispatch_group_notify(v9, MEMORY[0x263EF83A0], v11);
  }
}

void __30__WGDataSourceManager__begin___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__WGDataSourceManager__begin___block_invoke_2;
  v5[3] = &unk_264676588;
  id v6 = *(id *)(a1 + 32);
  [v4 _start:v5];
}

void __30__WGDataSourceManager__begin___block_invoke_2(uint64_t a1)
{
}

uint64_t __30__WGDataSourceManager__begin___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_start:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_stop:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)addWidgetDataSourceChangeHandler:(id)a3 forIdentifier:(id)a4
{
  if (a3 && a4)
  {
    identifiersToWidgetChangeHandlers = self->_identifiersToWidgetChangeHandlers;
    id v7 = a4;
    id v8 = a3;
    id v9 = (void *)[v8 copy];
    [(NSMutableDictionary *)identifiersToWidgetChangeHandlers setObject:v9 forKey:v7];

    id v10 = [(WGWidgetDataSourceManager *)self->_widgetDataSourceManager dataSources];
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

- (void)removeChangeHandlersWithIdentifier:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToWidgetChangeHandlers, "removeObjectForKey:");
  }
}

- (id)discoverAvailableWidgetsWithError:(id *)a3
{
  return +[WGWidgetDataSourceManager discoverAvailableWidgetsWithError:a3];
}

- (void)childDataSourceManagerDataSourcesDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_widgetDataSourceManager == a3)
  {
    id v4 = [a3 dataSources];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = [(NSMutableDictionary *)self->_identifiersToWidgetChangeHandlers allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetDataSourceManager, 0);
  objc_storeStrong((id *)&self->_identifiersToWidgetChangeHandlers, 0);
}

@end