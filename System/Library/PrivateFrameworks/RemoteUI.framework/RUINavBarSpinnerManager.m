@interface RUINavBarSpinnerManager
+ (id)sharedSpinnerManager;
- (RUINavBarSpinnerManager)init;
- (int64_t)activityIndicatorViewStyle;
- (void)setActivityIndicatorViewStyle:(int64_t)a3;
- (void)startAnimatingInNavItem:(id)a3 title:(id)a4 forIdentifier:(id)a5 hideBackButton:(BOOL)a6 hideLeftItems:(BOOL)a7;
- (void)stopAnimatingForIdentifier:(id)a3;
@end

@implementation RUINavBarSpinnerManager

- (RUINavBarSpinnerManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)RUINavBarSpinnerManager;
  v2 = [(RUINavBarSpinnerManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    savedRecords = v2->_savedRecords;
    v2->_savedRecords = v3;
  }
  return v2;
}

+ (id)sharedSpinnerManager
{
  v2 = (void *)sharedSpinnerManager___sharedManager;
  if (!sharedSpinnerManager___sharedManager)
  {
    v3 = objc_alloc_init(RUINavBarSpinnerManager);
    v4 = (void *)sharedSpinnerManager___sharedManager;
    sharedSpinnerManager___sharedManager = (uint64_t)v3;

    if (+[RUIPlatform isAppleTV]) {
      uint64_t v5 = 19;
    }
    else {
      uint64_t v5 = 100;
    }
    [(id)sharedSpinnerManager___sharedManager setActivityIndicatorViewStyle:v5];
    v2 = (void *)sharedSpinnerManager___sharedManager;
  }
  return v2;
}

- (void)startAnimatingInNavItem:(id)a3 title:(id)a4 forIdentifier:(id)a5 hideBackButton:(BOOL)a6 hideLeftItems:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = [(NSMutableDictionary *)self->_savedRecords objectForKey:v14];

  if (!v15)
  {
    BOOL v29 = v8;
    BOOL v30 = v7;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v16 = self->_savedRecords;
    uint64_t v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [(NSMutableDictionary *)self->_savedRecords objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          id v22 = [v21 navigationItem];

          if (v22 == v12)
          {
            if (_isInternalInstall())
            {
              v28 = _RUILoggingFacility();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v37 = v12;
                __int16 v38 = 2112;
                id v39 = v14;
                _os_log_impl(&dword_2144F2000, v28, OS_LOG_TYPE_DEFAULT, "Adding a second spinner to navigation item %@, identifer %@", buf, 0x16u);
              }
            }
            goto LABEL_25;
          }
        }
        uint64_t v18 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    v16 = (NSMutableDictionary *)objc_opt_new();
    [(NSMutableDictionary *)v16 setNavigationItem:v12];
    [(NSMutableDictionary *)self->_savedRecords setObject:v16 forKey:v14];
    v23 = [v12 rightBarButtonItems];
    [(NSMutableDictionary *)v16 setRightItems:v23];

    v24 = [v12 leftBarButtonItems];
    [(NSMutableDictionary *)v16 setLeftItems:v24];

    -[NSMutableDictionary setHidesBackButton:](v16, "setHidesBackButton:", [v12 hidesBackButton]);
    v25 = [[RUIBarButtonSpinnerView alloc] initWithActivityIndicatorStyle:[(RUINavBarSpinnerManager *)self activityIndicatorViewStyle]];
    if (v29) {
      [v12 setHidesBackButton:1 animated:1];
    }
    if (v30) {
      [v12 setLeftBarButtonItems:0 animated:1];
    }
    v35 = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
    [v12 setRightBarButtonItems:v26 animated:1];

    if (v13)
    {
      v27 = [v12 title];
      [(NSMutableDictionary *)v16 setTitle:v27];

      [(NSMutableDictionary *)v16 setSpinningTitle:v13];
      [v12 setTitle:v13];
    }
    [MEMORY[0x263F158F8] begin];
    [(RUIBarButtonSpinnerView *)v25 startAnimating];
    [MEMORY[0x263F158F8] commit];
    [MEMORY[0x263F158F8] flush];

    goto LABEL_25;
  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v14;
      _os_log_impl(&dword_2144F2000, &v16->super.super, OS_LOG_TYPE_DEFAULT, "Duplicate spinner for identifier %@", buf, 0xCu);
    }
LABEL_25:
  }
}

- (void)stopAnimatingForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_savedRecords objectForKey:v4];

  if (v5)
  {
    objc_super v6 = [(NSMutableDictionary *)self->_savedRecords objectForKeyedSubscript:v4];
    BOOL v7 = [v6 navigationItem];
    BOOL v8 = [v7 rightBarButtonItems];
    v9 = [v8 lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 stopAnimating];
      v10 = [v6 leftItems];
      [v7 setLeftBarButtonItems:v10 animated:1];

      v11 = [v6 rightItems];
      [v7 setRightBarButtonItems:v11 animated:1];

      objc_msgSend(v7, "setHidesBackButton:animated:", objc_msgSend(v6, "hidesBackButton"), 1);
      id v12 = [v6 spinningTitle];

      if (v12)
      {
        id v13 = [v6 title];
        [v7 setTitle:v13];
LABEL_8:
      }
    }
    else if (_isInternalInstall())
    {
      id v13 = _RUILoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v4;
        _os_log_impl(&dword_2144F2000, v13, OS_LOG_TYPE_DEFAULT, "Error: Tried to remove a spinner for identifier %@but it wasn't there.", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_8;
    }
    [(NSMutableDictionary *)self->_savedRecords removeObjectForKey:v4];
  }
}

- (int64_t)activityIndicatorViewStyle
{
  return self->_activityIndicatorViewStyle;
}

- (void)setActivityIndicatorViewStyle:(int64_t)a3
{
  self->_activityIndicatorViewStyle = a3;
}

- (void).cxx_destruct
{
}

@end