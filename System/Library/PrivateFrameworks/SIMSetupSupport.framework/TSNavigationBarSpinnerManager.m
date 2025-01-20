@interface TSNavigationBarSpinnerManager
+ (id)sharedManager;
- (NSMutableDictionary)navigationItems;
- (NSMutableDictionary)previousLeftBarButtonItems;
- (NSMutableDictionary)previousRightBarButtonItems;
- (TSNavigationBarSpinnerManager)init;
- (void)setNavigationItems:(id)a3;
- (void)setPreviousLeftBarButtonItems:(id)a3;
- (void)setPreviousRightBarButtonItems:(id)a3;
- (void)startSpinnerInNavigationItem:(id)a3 withIdentifier:(id)a4;
- (void)stopSpinnerForIdentifier:(id)a3;
- (void)stopSpinnerInNavigationItem:(id)a3 withIdentifier:(id)a4;
@end

@implementation TSNavigationBarSpinnerManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __46__TSNavigationBarSpinnerManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(TSNavigationBarSpinnerManager);
  return MEMORY[0x270F9A758]();
}

- (TSNavigationBarSpinnerManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)TSNavigationBarSpinnerManager;
  v2 = [(TSNavigationBarSpinnerManager *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(TSNavigationBarSpinnerManager *)v2 setNavigationItems:v3];

    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(TSNavigationBarSpinnerManager *)v2 setPreviousLeftBarButtonItems:v4];

    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(TSNavigationBarSpinnerManager *)v2 setPreviousRightBarButtonItems:v5];
  }
  return v2;
}

- (void)startSpinnerInNavigationItem:(id)a3 withIdentifier:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(TSNavigationBarSpinnerManager *)self navigationItems];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9)
  {
    v10 = [(TSNavigationBarSpinnerManager *)self navigationItems];
    [v10 setObject:v6 forKeyedSubscript:v7];

    v11 = [v6 leftBarButtonItems];

    if (v11)
    {
      v12 = [(TSNavigationBarSpinnerManager *)self previousLeftBarButtonItems];
      v13 = [v6 leftBarButtonItems];
      [v12 setObject:v13 forKey:v7];
    }
    v14 = [v6 rightBarButtonItems];

    if (v14)
    {
      v15 = [(TSNavigationBarSpinnerManager *)self previousRightBarButtonItems];
      v16 = [v6 rightBarButtonItems];
      [v15 setObject:v16 forKey:v7];
    }
    v17 = objc_alloc_init(TSSpinnerNavigationBarItem);
    v19[0] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    [v6 setRightBarButtonItems:v18 animated:1];

    [v6 setLeftBarButtonItems:0 animated:1];
    [(TSSpinnerNavigationBarItem *)v17 startAnimating];
  }
}

- (void)stopSpinnerForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TSNavigationBarSpinnerManager *)self navigationItems];
  id v6 = [v5 objectForKeyedSubscript:v4];

  [(TSNavigationBarSpinnerManager *)self stopSpinnerInNavigationItem:v6 withIdentifier:v4];
}

- (void)stopSpinnerInNavigationItem:(id)a3 withIdentifier:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  id v7 = [(TSNavigationBarSpinnerManager *)self navigationItems];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    v9 = [v22 rightBarButtonItems];
    v10 = [v9 lastObject];

    [v10 stopAnimating];
    v11 = [(TSNavigationBarSpinnerManager *)self previousLeftBarButtonItems];
    v12 = [v11 objectForKeyedSubscript:v6];

    if (v12)
    {
      v13 = [(TSNavigationBarSpinnerManager *)self previousLeftBarButtonItems];
      v14 = [v13 objectForKeyedSubscript:v6];
      [v22 setLeftBarButtonItems:v14 animated:1];
    }
    v15 = [(TSNavigationBarSpinnerManager *)self previousRightBarButtonItems];
    v16 = [v15 objectForKeyedSubscript:v6];

    if (v16)
    {
      v17 = [(TSNavigationBarSpinnerManager *)self previousRightBarButtonItems];
      v18 = [v17 objectForKeyedSubscript:v6];
      [v22 setRightBarButtonItems:v18 animated:1];
    }
    v19 = [(TSNavigationBarSpinnerManager *)self navigationItems];
    [v19 removeObjectForKey:v6];

    v20 = [(TSNavigationBarSpinnerManager *)self previousLeftBarButtonItems];
    [v20 removeObjectForKey:v6];

    v21 = [(TSNavigationBarSpinnerManager *)self previousRightBarButtonItems];
    [v21 removeObjectForKey:v6];
  }
}

- (NSMutableDictionary)navigationItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNavigationItems:(id)a3
{
}

- (NSMutableDictionary)previousLeftBarButtonItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPreviousLeftBarButtonItems:(id)a3
{
}

- (NSMutableDictionary)previousRightBarButtonItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPreviousRightBarButtonItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_previousLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_navigationItems, 0);
}

@end