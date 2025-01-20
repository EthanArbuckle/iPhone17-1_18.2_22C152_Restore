@interface SCLSpecifierDataSource
+ (id)keyPathsForValuesAffectingAllSpecifiers;
- (BOOL)isActive;
- (NSArray)allSpecifiers;
- (NSArray)childDataSources;
- (NSArray)specifiers;
- (SCLListViewController)listController;
- (SCLSettingsViewModel)viewModel;
- (SCLSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActive:(BOOL)a3;
- (void)setChildDataSources:(id)a3;
- (void)setListController:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 specifier:(id)a5;
@end

@implementation SCLSpecifierDataSource

- (SCLSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCLSpecifierDataSource;
  v8 = [(SCLSpecifierDataSource *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    specifiers = v9->_specifiers;
    v9->_specifiers = (NSArray *)MEMORY[0x263EFFA68];

    objc_storeStrong((id *)&v9->_viewModel, a4);
  }

  return v9;
}

- (void)dealloc
{
  [(SCLSpecifierDataSource *)self setChildDataSources:MEMORY[0x263EFFA68]];
  v3.receiver = self;
  v3.super_class = (Class)SCLSpecifierDataSource;
  [(SCLSpecifierDataSource *)&v3 dealloc];
}

- (void)setChildDataSources:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = self->_childDataSources;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v9++) removeObserver:self forKeyPath:@"allSpecifiers" context:@"active"];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  v10 = (NSArray *)[v4 copy];
  childDataSources = self->_childDataSources;
  self->_childDataSources = v10;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "addObserver:forKeyPath:options:context:", self, @"allSpecifiers", 9, @"active", (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (NSArray)allSpecifiers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(SCLSpecifierDataSource *)self isActive])
  {
    id v4 = [(SCLSpecifierDataSource *)self specifiers];
    [v3 addObjectsFromArray:v4];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(SCLSpecifierDataSource *)self childDataSources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v10 isActive])
          {
            v11 = [v10 allSpecifiers];
            [v3 addObjectsFromArray:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }

  return (NSArray *)v3;
}

+ (id)keyPathsForValuesAffectingAllSpecifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"childDataSources", @"active", @"specifiers", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"active")
  {
    uint64_t v7 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x263F081C0], a4);
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      [(SCLSpecifierDataSource *)self willChangeValueForKey:@"allSpecifiers"];
    }
    else
    {
      [(SCLSpecifierDataSource *)self didChangeValueForKey:@"allSpecifiers"];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCLSpecifierDataSource;
    -[SCLSpecifierDataSource observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 specifier:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SCLSpecifierDataSource *)self childDataSources];
  id v12 = (void *)[v11 copy];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v18, "isActive", (void)v19)) {
          [v18 tableView:v8 didSelectRowAtIndexPath:v9 specifier:v10];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (SCLListViewController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);

  return (SCLListViewController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (SCLSettingsViewModel)viewModel
{
  return self->_viewModel;
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
}

- (NSArray)childDataSources
{
  return self->_childDataSources;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childDataSources, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_destroyWeak((id *)&self->_listController);
}

@end