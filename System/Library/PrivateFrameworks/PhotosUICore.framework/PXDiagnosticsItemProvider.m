@interface PXDiagnosticsItemProvider
+ (PXDiagnosticsItemProvider)providerWithItem:(id)a3 identifier:(id)a4;
- (BOOL)hasItemForIdentifier:(id)a3;
- (NSMutableDictionary)_loadHandlers;
- (NSSet)registeredIdentifiers;
- (PXDiagnosticsItemProvider)init;
- (id)itemForIdentifier:(id)a3;
- (void)registerItem:(id)a3 forIdentifier:(id)a4;
- (void)registerItemForIdentifier:(id)a3 loadHandler:(id)a4;
@end

@implementation PXDiagnosticsItemProvider

- (void).cxx_destruct
{
}

- (NSMutableDictionary)_loadHandlers
{
  return self->__loadHandlers;
}

- (void)registerItem:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PXDiagnosticsItemProvider_registerItem_forIdentifier___block_invoke;
  v8[3] = &unk_1E5DD2988;
  id v9 = v6;
  id v7 = v6;
  [(PXDiagnosticsItemProvider *)self registerItemForIdentifier:a4 loadHandler:v8];
}

id __56__PXDiagnosticsItemProvider_registerItem_forIdentifier___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSSet)registeredIdentifiers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(PXDiagnosticsItemProvider *)self _loadHandlers];
  v4 = [v3 allKeys];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (id)itemForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXDiagnosticsItemProvider *)self _loadHandlers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = v6[2](v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)hasItemForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PXDiagnosticsItemProvider *)self _loadHandlers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (void)registerItemForIdentifier:(id)a3 loadHandler:(id)a4
{
  id v6 = a3;
  id v8 = (id)[a4 copy];
  id v7 = [(PXDiagnosticsItemProvider *)self _loadHandlers];
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (PXDiagnosticsItemProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXDiagnosticsItemProvider;
  v2 = [(PXDiagnosticsItemProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    loadHandlers = v2->__loadHandlers;
    v2->__loadHandlers = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (PXDiagnosticsItemProvider)providerWithItem:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 registerItem:v7 forIdentifier:v6];

  return (PXDiagnosticsItemProvider *)v8;
}

@end