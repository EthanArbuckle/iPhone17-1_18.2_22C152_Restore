@interface BFFNavBarSpinnerManager
+ (id)sharedSpinnerManager;
- (BFFNavBarSpinnerManager)init;
- (BOOL)isAnimatingForIdentifier:(id)a3;
- (void)startAnimatingInNavigationItemOfViewController:(id)a3 forIdentifier:(id)a4;
- (void)stopAnimatingForIdentifier:(id)a3;
@end

@implementation BFFNavBarSpinnerManager

- (BFFNavBarSpinnerManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)BFFNavBarSpinnerManager;
  v2 = [(BFFNavBarSpinnerManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    savedRightItems = v2->_savedRightItems;
    v2->_savedRightItems = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    savedLeftItems = v2->_savedLeftItems;
    v2->_savedLeftItems = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    navigationItems = v2->_navigationItems;
    v2->_navigationItems = v7;
  }
  return v2;
}

+ (id)sharedSpinnerManager
{
  v2 = (void *)sharedSpinnerManager___sharedManager;
  if (!sharedSpinnerManager___sharedManager)
  {
    v3 = objc_alloc_init(BFFNavBarSpinnerManager);
    v4 = (void *)sharedSpinnerManager___sharedManager;
    sharedSpinnerManager___sharedManager = (uint64_t)v3;

    v2 = (void *)sharedSpinnerManager___sharedManager;
  }
  return v2;
}

- (void)startAnimatingInNavigationItemOfViewController:(id)a3 forIdentifier:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 navigationItem];
  v9 = _BYLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BFFNavBarSpinnerManager startAnimatingInNavigationItemOfViewController:forIdentifier:]((uint64_t)v7, v8, v9);
  }

  objc_super v10 = [(NSMutableDictionary *)self->_navigationItems objectForKey:v7];

  if (!v10 && v8)
  {
    [(NSMutableDictionary *)self->_navigationItems setObject:v8 forKey:v7];
    v11 = [v8 rightBarButtonItems];
    if (v11) {
      [(NSMutableDictionary *)self->_savedRightItems setObject:v11 forKey:v7];
    }
    v12 = [v8 leftBarButtonItems];
    if (v12) {
      [(NSMutableDictionary *)self->_savedLeftItems setObject:v12 forKey:v7];
    }
    v13 = objc_alloc_init(BFFBarButtonSpinnerView);
    v17[0] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [v8 setRightBarButtonItems:v14 animated:1];
    [v8 setLeftBarButtonItems:0 animated:1];
    [MEMORY[0x263F158F8] begin];
    [(BFFBarButtonSpinnerView *)v13 startAnimating];
    [MEMORY[0x263F158F8] commit];
    v15 = [v6 traitCollection];
    if ([v15 userInterfaceStyle] == 1)
    {
      int v16 = [v6 conformsToProtocol:&unk_26D205D18];

      if (!v16 || ![v6 hasBlackBackground]) {
        goto LABEL_14;
      }
      v15 = [(BFFBarButtonSpinnerView *)v13 customView];
      [v15 setOverrideUserInterfaceStyle:2];
    }

LABEL_14:
  }
}

- (void)stopAnimatingForIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_navigationItems objectForKey:v4];

  id v6 = _BYLoggingFacility();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BFFNavBarSpinnerManager stopAnimatingForIdentifier:]((uint64_t)v4, v7);
    }

    id v7 = [(NSMutableDictionary *)self->_navigationItems objectForKey:v4];
    v8 = [v7 rightBarButtonItems];
    v9 = [v8 lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 stopAnimating];
    }
    objc_super v10 = [(NSMutableDictionary *)self->_savedRightItems objectForKey:v4];
    v11 = [(NSMutableDictionary *)self->_savedLeftItems objectForKey:v4];
    [v7 setLeftBarButtonItems:v11 animated:1];
    [v7 setRightBarButtonItems:v10 animated:1];
    [(NSMutableDictionary *)self->_savedRightItems removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_savedLeftItems removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_navigationItems removeObjectForKey:v4];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_21FF9E000, v7, OS_LOG_TYPE_DEFAULT, "Unbalanced nav bar spinner animation for \"%@\"!", (uint8_t *)&v12, 0xCu);
  }
}

- (BOOL)isAnimatingForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_navigationItems objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationItems, 0);
  objc_storeStrong((id *)&self->_savedLeftItems, 0);
  objc_storeStrong((id *)&self->_savedRightItems, 0);
}

- (void)startAnimatingInNavigationItemOfViewController:(NSObject *)a3 forIdentifier:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a2 title];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = (uint64_t)a2;
  }
  int v9 = 138412546;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v8;
  _os_log_debug_impl(&dword_21FF9E000, a3, OS_LOG_TYPE_DEBUG, "Starting spinner for \"%@\" on nav item \"%@\"", (uint8_t *)&v9, 0x16u);
}

- (void)stopAnimatingForIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21FF9E000, a2, OS_LOG_TYPE_DEBUG, "Stopping spinner for \"%@\"", (uint8_t *)&v2, 0xCu);
}

@end