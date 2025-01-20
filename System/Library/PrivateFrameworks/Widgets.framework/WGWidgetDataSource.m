@interface WGWidgetDataSource
- (BOOL)isEqual:(id)a3;
- (NSArray)widgetIdentifiers;
- (NSString)dataSourceIdentifier;
- (NSString)description;
- (NSString)parentDataSourceIdentifier;
- (WGWidgetDataSource)initWithIdentifier:(id)a3;
- (_WGConcreteDataSource)_concreteDataSource;
- (id)widgetDatumWithIdentifier:(id)a3;
- (void)_setConcreteDataSource:(id)a3;
- (void)addWidgetObserver:(id)a3 completion:(id)a4;
- (void)removeDatumWithIdentifier:(id)a3;
- (void)removeWidgetObserver:(id)a3 completion:(id)a4;
- (void)replaceWithDatum:(id)a3;
@end

@implementation WGWidgetDataSource

- (WGWidgetDataSource)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetDataSource;
  v5 = [(WGWidgetDataSource *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dataSourceIdentifier = v5->_dataSourceIdentifier;
    v5->_dataSourceIdentifier = (NSString *)v6;

    v8 = objc_alloc_init(_WGConcreteDataSource);
    concreteDataSource = v5->_concreteDataSource;
    v5->_concreteDataSource = v8;
  }
  return v5;
}

- (NSString)parentDataSourceIdentifier
{
  return 0;
}

- (NSArray)widgetIdentifiers
{
  return [(_WGConcreteDataSource *)self->_concreteDataSource dataIdentifiers];
}

- (id)widgetDatumWithIdentifier:(id)a3
{
  return [(_WGConcreteDataSource *)self->_concreteDataSource datumWithIdentifier:a3];
}

- (BOOL)isEqual:(id)a3
{
  return _WGDataSourceIsEqualToDataSource(self, a3);
}

- (void)addWidgetObserver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  concreteDataSource = self->_concreteDataSource;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__WGWidgetDataSource_addWidgetObserver_completion___block_invoke;
  v11[3] = &unk_2646774F8;
  id v9 = v7;
  id v13 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v6;
  id v12 = v10;
  [(_WGConcreteDataSource *)concreteDataSource addObserver:v10 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __51__WGWidgetDataSource_addWidgetObserver_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(WeakRetained, "_concreteDataSource", 0);
  v5 = [v4 data];

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
        [*(id *)(a1 + 32) widgetDataSource:WeakRetained replaceWithDatum:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeWidgetObserver:(id)a3 completion:(id)a4
{
}

- (void)replaceWithDatum:(id)a3
{
}

void __39__WGWidgetDataSource_replaceWithDatum___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if [v6 conformsToProtocol:&unk_26D5EB760] && (objc_opt_respondsToSelector()) {
    [v6 widgetDataSource:*(void *)(a1 + 32) replaceWithDatum:v5];
  }
}

- (void)removeDatumWithIdentifier:(id)a3
{
}

void __48__WGWidgetDataSource_removeDatumWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if [v6 conformsToProtocol:&unk_26D5EB760] && (objc_opt_respondsToSelector()) {
    [v6 widgetDataSource:*(void *)(a1 + 32) removeDatum:v5];
  }
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(WGWidgetDataSource *)self dataSourceIdentifier];
  id v6 = [v3 stringWithFormat:@"<%@: %p; dataSourceIdentifier: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (_WGConcreteDataSource)_concreteDataSource
{
  return self->_concreteDataSource;
}

- (void)_setConcreteDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concreteDataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
}

@end