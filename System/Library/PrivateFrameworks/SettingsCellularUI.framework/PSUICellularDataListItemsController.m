@interface PSUICellularDataListItemsController
- (BOOL)_isDataSwitchAutomatic:(id)a3;
- (PSUICellularDataListItemsController)init;
- (RadiosPreferences)radioPreferences;
- (id)getLogger;
- (id)specifiers;
- (void)airplaneModeChanged;
- (void)dealloc;
- (void)reloadCache;
- (void)setRadioPreferences:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PSUICellularDataListItemsController

- (PSUICellularDataListItemsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSUICellularDataListItemsController;
  v2 = [(PSUICellularDataListItemsController *)&v8 init];
  if (v2)
  {
    v3 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x263F255D8]);
    radioPreferences = v2->_radioPreferences;
    v2->_radioPreferences = v3;

    [(RadiosPreferences *)v2->_radioPreferences setNotifyForExternalChangeOnly:1];
    [(RadiosPreferences *)v2->_radioPreferences setDelegate:v2];
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_reloadCache name:@"PSUICellularPlanChanged" object:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_reloadCache name:*MEMORY[0x263F833B8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSUICellularDataListItemsController;
  [(PSListItemsController *)&v4 dealloc];
}

- (void)airplaneModeChanged
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(PSUICellularDataListItemsController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[PSUICellularDataListItemsController airplaneModeChanged]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s Received airplane mode changed", buf, 0xCu);
  }

  id v4 = *(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]);
  if ([v4 isDetailControllerNeeded])
  {
    v5 = [(PSUICellularDataListItemsController *)self radioPreferences];
    int v6 = [v5 airplaneMode];

    if (v6)
    {
      v7 = [(PSUICellularDataListItemsController *)self getLogger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Airplane mode is enabled", buf, 2u);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__PSUICellularDataListItemsController_airplaneModeChanged__block_invoke;
      block[3] = &unk_2645E0B88;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __58__PSUICellularDataListItemsController_airplaneModeChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F5FE88]));
  id v1 = (id)[WeakRetained popViewControllerAnimated:1];
}

- (void)reloadCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__PSUICellularDataListItemsController_reloadCache__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__PSUICellularDataListItemsController_reloadCache__block_invoke(uint64_t a1)
{
  id v7 = *(id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F5FE98]);
  [v7 updateCachedState];
  int v2 = [v7 isDetailControllerNeeded];
  v3 = *(char **)(a1 + 32);
  if (v2)
  {
    [v3 reloadSpecifiers];
    id v4 = v7;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v3[*MEMORY[0x263F5FE88]]);

    id v6 = (id)[WeakRetained popViewControllerAnimated:1];
    id v4 = WeakRetained;
  }
}

- (id)specifiers
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v30 = (int)*MEMORY[0x263F5FDB8];
    v41.receiver = self;
    v41.super_class = (Class)PSUICellularDataListItemsController;
    id v4 = [(PSListItemsController *)&v41 specifiers];
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v35 = [v5 localizedStringForKey:@"CELLULAR_DATA_SWITCHING_FOOTER" value:&stru_26D410CA0 table:@"Gemini-Gemini"];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v44 count:16];
    id v31 = v6;
    if (v7)
    {
      uint64_t v8 = v7;
      int v36 = 0;
      char v9 = 0;
      uint64_t v10 = *(void *)v38;
      uint64_t v34 = *MEMORY[0x263F5FFE0];
      uint64_t v32 = *MEMORY[0x263F60290];
      uint64_t v33 = *MEMORY[0x263F5FFE8];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v12 cellType])
          {
            uint64_t v13 = (int)*MEMORY[0x263F5FE98];
            v14 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v13) planItemForListItem:v12];
            if (v14)
            {
              [v12 setProperty:objc_opt_class() forKey:v34];
              v15 = [(PSUICellularDataListItemsController *)self getLogger];
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v43 = v14;
                _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "Setting plan item: %@", buf, 0xCu);
              }

              [v12 setProperty:v14 forKey:v33];
              v16 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v13) subscriptionContextForListItem:v12];
              if (v16) {
                [v12 setProperty:v16 forKey:v32];
              }
              int v17 = [v14 isSelected];
              if ([(PSUICellularDataListItemsController *)self _isDataSwitchAutomatic:v14])
              {
                v18 = NSString;
                v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                v20 = [v19 localizedStringForKey:@"CELLULAR_DATA_SWITCHING_FOOTER_PNW" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
                uint64_t v21 = [v18 stringWithFormat:v20];

                char v9 = 1;
                v35 = (void *)v21;
                id v6 = v31;
              }
              v36 += v17;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v8);
    }
    else
    {
      int v36 = 0;
      char v9 = 0;
    }

    v22 = [(PSUICellularDataListItemsController *)self getLogger];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = v36;
      _os_log_impl(&dword_221B17000, v22, OS_LOG_TYPE_DEFAULT, "Lines turned on: %d", buf, 8u);
    }

    v23 = [MEMORY[0x263EFF980] arrayWithArray:v6];
    v24 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CELLULAR_DATA_SWITCHING_GROUP"];
    [v24 setProperty:v35 forKey:*MEMORY[0x263F600F8]];
    [v23 addObject:v24];
    if ((v9 & 1) == 0)
    {
      v25 = [[PSUICellularDataFallbackSwitchSpecifier alloc] initWithHostController:self];
      v26 = [NSNumber numberWithInt:v36 > 1];
      [(PSUICellularDataFallbackSwitchSpecifier *)v25 setProperty:v26 forKey:*MEMORY[0x263F600A8]];

      id v6 = v31;
      [v23 addObject:v25];
    }
    [MEMORY[0x263F67F00] logSpecifiers:v23 origin:@"[PSUICellularDataListItemsController specifiers] end"];
    v27 = (objc_class *)[v23 copy];
    v28 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v30);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v30) = v27;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v30);
  }
  return v3;
}

- (BOOL)_isDataSwitchAutomatic:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 isSelected]
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v3 settingsMode] == 1;

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section])
  {
    [v7 deselectRowAtIndexPath:v6 animated:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PSUICellularDataListItemsController;
    [(PSListItemsController *)&v8 tableView:v7 didSelectRowAtIndexPath:v6];
  }
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PSUICellularDataListItemsController;
  [(PSUICellularDataListItemsController *)&v5 setSpecifier:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDetailController:self];
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularDataListItemsController"];
}

- (RadiosPreferences)radioPreferences
{
  return self->_radioPreferences;
}

- (void)setRadioPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end