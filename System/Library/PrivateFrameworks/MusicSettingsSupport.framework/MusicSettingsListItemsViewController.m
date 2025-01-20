@interface MusicSettingsListItemsViewController
- (NSArray)allSpecifiers;
- (NSString)stringsTable;
- (id)itemsFromParent;
- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)valueForMusicCapability:(id)a3;
- (void)listItemSelected:(id)a3;
- (void)setAllSpecifiers:(id)a3;
- (void)setStringsTable:(id)a3;
@end

@implementation MusicSettingsListItemsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringsTable, 0);
  objc_storeStrong((id *)&self->_allSpecifiers, 0);
}

- (void)setStringsTable:(id)a3
{
}

- (NSString)stringsTable
{
  return self->_stringsTable;
}

- (void)setAllSpecifiers:(id)a3
{
}

- (NSArray)allSpecifiers
{
  return self->_allSpecifiers;
}

- (id)valueForMusicCapability:(id)a3
{
  return 0;
}

- (id)itemsFromParent
{
  v17.receiver = self;
  v17.super_class = (Class)MusicSettingsListItemsViewController;
  v3 = [(PSListItemsController *)&v17 itemsFromParent];
  uint64_t v4 = (int)*MEMORY[0x263F5FE98];
  v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) properties];
  v6 = [v5 objectForKeyedSubscript:@"musicValidDetails"];

  v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) properties];
  v8 = [v7 objectForKeyedSubscript:@"musicShouldSelectAction"];

  id v16 = v3;
  v9 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
  if ([v9 count])
  {
    unint64_t v10 = 0;
    uint64_t v11 = *MEMORY[0x263F5FFE0];
    do
    {
      v12 = [v9 objectAtIndexedSubscript:v10];
      if (v10 < [v6 count])
      {
        [v12 setProperty:objc_opt_class() forKey:v11];
        v13 = [v6 objectAtIndexedSubscript:v10];
        [v12 setProperty:v13 forKey:@"musicDetail"];
      }
      if (v10 < [v8 count])
      {
        v14 = [v8 objectAtIndexedSubscript:v10];
        if ([v14 length]) {
          [v12 setProperty:v14 forKey:@"musicShouldSelectAction"];
        }
      }
      ++v10;
    }
    while (v10 < [v9 count]);
  }

  return v16;
}

- (void)listItemSelected:(id)a3
{
  id v4 = a3;
  v5 = [(MusicSettingsListItemsViewController *)self specifierAtIndexPath:v4];
  v6 = [v5 propertyForKey:@"cellObject"];
  if (([v6 isChecked] & 1) == 0)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __57__MusicSettingsListItemsViewController_listItemSelected___block_invoke;
    v15[3] = &unk_264CBF5E8;
    id v16 = v4;
    objc_super v17 = self;
    id v7 = v5;
    id v18 = v7;
    v8 = (void (**)(void))MEMORY[0x237E0CAA0](v15);
    v9 = [v7 propertyForKey:@"musicShouldSelectAction"];
    SEL v10 = NSSelectorFromString(v9);

    if (v10)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __57__MusicSettingsListItemsViewController_listItemSelected___block_invoke_2;
      v13[3] = &unk_264CBF6B0;
      v14 = v8;
      uint64_t v11 = (void *)MEMORY[0x237E0CAA0](v13);
      id v12 = MusicSettingsPerformSelector2((uint64_t)v10, self, v7, v11);
    }
    else
    {
      v8[2](v8);
    }
  }
}

void __57__MusicSettingsListItemsViewController_listItemSelected___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 40);
  v6.super_class = (Class)MusicSettingsListItemsViewController;
  objc_msgSendSuper2(&v6, sel_listItemSelected_, v2);
  v3 = [*(id *)(a1 + 48) propertyForKey:@"musicDidSelectAction"];
  SEL v4 = NSSelectorFromString(v3);

  if (v4) {
    id v5 = MusicSettingsPerformSelector2((uint64_t)v4, *(void **)(a1 + 40), *(void **)(a1 + 48), 0);
  }
}

uint64_t __57__MusicSettingsListItemsViewController_listItemSelected___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MusicSettingsListItemsViewController *)self specifierAtIndexPath:v6];
  v16.receiver = self;
  v16.super_class = (Class)MusicSettingsListItemsViewController;
  v9 = [(PSListItemsController *)&v16 tableView:v7 cellForRowAtIndexPath:v6];

  SEL v10 = [v8 propertyForKey:@"musicDetail"];
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [(MusicSettingsListItemsViewController *)self stringsTable];
  v13 = [v11 localizedStringForKey:v10 value:&stru_26E9F45B8 table:v12];

  v14 = [v9 detailTextLabel];
  [v14 setText:v13];

  return v9;
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5
{
  objc_storeStrong((id *)&self->_stringsTable, a3);
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MusicSettingsListItemsViewController;
  id v12 = [(MusicSettingsListItemsViewController *)&v14 loadSpecifiersFromPlistName:v9 target:v11 bundle:v10];

  return v12;
}

@end