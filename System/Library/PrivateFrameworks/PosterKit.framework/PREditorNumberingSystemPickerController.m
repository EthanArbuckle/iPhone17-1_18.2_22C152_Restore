@interface PREditorNumberingSystemPickerController
- (NSLocale)displayLocale;
- (NSString)selectedNumberingSystem;
- (PREditorNumberingSystemPickerController)initWithSelectedNumberingSystem:(id)a3 selectedFont:(id)a4;
- (PREditorNumberingSystemPickerControllerDelegate)delegate;
- (UIFont)font;
- (id)menu;
- (void)didSelectNumberingSystem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
@end

@implementation PREditorNumberingSystemPickerController

- (PREditorNumberingSystemPickerController)initWithSelectedNumberingSystem:(id)a3 selectedFont:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PREditorNumberingSystemPickerController *)self init];
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = [v6 copy];
      selectedNumberingSystem = v8->_selectedNumberingSystem;
      v8->_selectedNumberingSystem = (NSString *)v9;
    }
    else
    {
      selectedNumberingSystem = PRSystemNumberingSystem();
      uint64_t v11 = [selectedNumberingSystem copy];
      v12 = v8->_selectedNumberingSystem;
      v8->_selectedNumberingSystem = (NSString *)v11;
    }
    if (v7)
    {
      v13 = (UIFont *)v7;
    }
    else
    {
      v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    }
    font = v8->_font;
    v8->_font = v13;
  }
  return v8;
}

- (id)menu
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v17 = [MEMORY[0x1E4F1CA48] array];
  v3 = PRAllNumberingSystems();
  objc_initWeak(&location, self);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = (int)[*(id *)(*((void *)&v21 + 1) + 8 * i) intValue];
        v8 = PRNumberingSystemStringForType(v7);
        uint64_t v9 = PRNumberingSystemImageForType(v7);
        v10 = (void *)MEMORY[0x1E4FB13F0];
        uint64_t v11 = PRNumberingSystemDisplayNameForType(v7);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __47__PREditorNumberingSystemPickerController_menu__block_invoke;
        v18[3] = &unk_1E54DAD10;
        objc_copyWeak(&v20, &location);
        id v12 = v8;
        id v19 = v12;
        v13 = [v10 actionWithTitle:v11 image:v9 identifier:v12 handler:v18];

        if ([v12 isEqualToString:self->_selectedNumberingSystem]) {
          [v13 setState:1];
        }
        [v17 addObject:v13];

        objc_destroyWeak(&v20);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  v14 = [MEMORY[0x1E4FB1970] menuWithChildren:v17];
  objc_destroyWeak(&location);

  return v14;
}

void __47__PREditorNumberingSystemPickerController_menu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didSelectNumberingSystem:*(void *)(a1 + 32)];
}

- (NSLocale)displayLocale
{
  v2 = [(PREditorNumberingSystemPickerController *)self selectedNumberingSystem];
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v4 = [v3 localeIdentifier];

  uint64_t v5 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v4];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setObject:v2 forKey:@"numbers"];
  uint64_t v7 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v6];
  v8 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v7];

  return (NSLocale *)v8;
}

- (void)didSelectNumberingSystem:(id)a3
{
  id v6 = (NSString *)a3;
  if (self->_selectedNumberingSystem != v6)
  {
    objc_storeStrong((id *)&self->_selectedNumberingSystem, a3);
    uint64_t v5 = [(PREditorNumberingSystemPickerController *)self delegate];
    [v5 numberingSystemPickerController:self didSelectNumberingSystem:v6];
  }
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (NSString)selectedNumberingSystem
{
  return self->_selectedNumberingSystem;
}

- (PREditorNumberingSystemPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditorNumberingSystemPickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedNumberingSystem, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end