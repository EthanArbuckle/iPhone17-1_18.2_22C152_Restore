@interface PUINumberingSystemPickerMenuController
- (NSLocale)displayLocale;
- (PUINumberingSystem)selectedNumberingSystem;
- (PUINumberingSystemPickerControllerDelegate)delegate;
- (PUINumberingSystemPickerMenuController)initWithNumberingSystem:(id)a3 font:(id)a4;
- (UIFont)font;
- (UIMenu)menu;
- (void)didSelectNumberingSystem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setSelectedNumberingSystem:(id)a3;
@end

@implementation PUINumberingSystemPickerMenuController

- (PUINumberingSystemPickerMenuController)initWithNumberingSystem:(id)a3 font:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUINumberingSystemPickerMenuController;
  v8 = [(PUINumberingSystemPickerMenuController *)&v16 init];
  if (v8)
  {
    v9 = (void *)[v6 copy];
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v11 = +[PUINumberingSystem systemDefaultNumberingSystem];
    }
    selectedNumberingSystem = v8->_selectedNumberingSystem;
    v8->_selectedNumberingSystem = v11;

    if (v7)
    {
      v13 = (UIFont *)v7;
    }
    else
    {
      v13 = [MEMORY[0x263F1C658] systemFontOfSize:12.0];
    }
    font = v8->_font;
    v8->_font = v13;
  }
  return v8;
}

- (UIMenu)menu
{
  p_menu = &self->_menu;
  menu = self->_menu;
  if (menu)
  {
    v4 = menu;
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x263F1C7A8];
    id v6 = +[PUINumberingSystem supportedNumberingSystemTypes];
    id v7 = [v6 array];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __46__PUINumberingSystemPickerMenuController_menu__block_invoke;
    v13 = &unk_265471028;
    objc_copyWeak(&v14, &location);
    v8 = objc_msgSend(v7, "bs_mapNoNulls:", &v10);
    objc_msgSend(v5, "menuWithChildren:", v8, v10, v11, v12, v13);
    v4 = (UIMenu *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_menu, v4);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v4;
}

id __46__PUINumberingSystemPickerMenuController_menu__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[PUINumberingSystem alloc] initWithNumberingSystemType:v3];
  v5 = (void *)MEMORY[0x263F1C3C0];
  id v6 = [(PUINumberingSystem *)v4 localizedDisplayName];
  id v7 = [(PUINumberingSystem *)v4 image];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __46__PUINumberingSystemPickerMenuController_menu__block_invoke_2;
  v18 = &unk_265471000;
  v8 = (id *)(a1 + 32);
  objc_copyWeak(&v20, (id *)(a1 + 32));
  v9 = v4;
  v19 = v9;
  uint64_t v10 = [v5 actionWithTitle:v6 image:v7 identifier:v3 handler:&v15];

  id WeakRetained = objc_loadWeakRetained(v8);
  v12 = WeakRetained;
  if (WeakRetained)
  {
    if (-[PUINumberingSystem isEqual:](v9, "isEqual:", *((void *)WeakRetained + 2), v15, v16, v17, v18)) {
      [v10 setState:1];
    }
    id v13 = v10;
  }
  else
  {
    id v13 = 0;
  }

  objc_destroyWeak(&v20);
  return v13;
}

void __46__PUINumberingSystemPickerMenuController_menu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didSelectNumberingSystem:*(void *)(a1 + 32)];
}

- (NSLocale)displayLocale
{
  v2 = [(PUINumberingSystemPickerMenuController *)self selectedNumberingSystem];
  id v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [v3 localeIdentifier];

  v5 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v4];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v2 systemName];
  [v6 setObject:v7 forKey:@"numbers"];

  v8 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v6];
  v9 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v8];

  return (NSLocale *)v9;
}

- (void)didSelectNumberingSystem:(id)a3
{
  id v7 = a3;
  if (!-[PUINumberingSystem isEqual:](self->_selectedNumberingSystem, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_selectedNumberingSystem, a3);
    menu = self->_menu;
    self->_menu = 0;

    id v6 = [(PUINumberingSystemPickerMenuController *)self delegate];
    [v6 numberingSystemPickerMenuController:self didSelectNumberingSystem:v7];
  }
}

- (PUINumberingSystem)selectedNumberingSystem
{
  return self->_selectedNumberingSystem;
}

- (void)setSelectedNumberingSystem:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (PUINumberingSystemPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUINumberingSystemPickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_selectedNumberingSystem, 0);
  objc_storeStrong((id *)&self->_menu, 0);
}

@end