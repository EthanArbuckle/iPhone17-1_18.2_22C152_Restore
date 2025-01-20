@interface MSDContactsViewController
- (MSDContactsViewController)init;
- (MSDStoreContactsModel)contactsModel;
- (NSMutableArray)regions;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setContactsModel:(id)a3;
- (void)setRegions:(id)a3;
- (void)viewDidLoad;
@end

@implementation MSDContactsViewController

- (MSDContactsViewController)init
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)MSDContactsViewController;
  v2 = [(MSDContactsViewController *)&v19 init];
  if (v2)
  {
    v3 = +[MSDStoreContactsModel sharedInstance];
    [(MSDContactsViewController *)v2 setContactsModel:v3];

    v4 = objc_opt_new();
    [(MSDContactsViewController *)v2 setRegions:v4];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = [(MSDContactsViewController *)v2 contactsModel];
    v6 = [v5 regionToCountryCode];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
          v12 = [(MSDContactsViewController *)v2 regions];
          [v12 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }

    v13 = +[MSDSetupUILocalization localizedStringForKey:@"CONTACT_NUMBER_HEADER"];
    [(MSDContactsViewController *)v2 setTitle:v13];
  }
  return v2;
}

- (void)viewDidLoad
{
  v28[4] = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)MSDContactsViewController;
  [(MSDContactsViewController *)&v27 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F1CA40]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setDataSource:self];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(MSDContactsViewController *)self view];
  [v5 addSubview:v4];

  v25 = [v4 topAnchor];
  v26 = [(MSDContactsViewController *)self view];
  v24 = [v26 safeAreaLayoutGuide];
  v23 = [v24 topAnchor];
  v22 = [v25 constraintEqualToAnchor:v23];
  v28[0] = v22;
  v20 = [v4 bottomAnchor];
  uint64_t v21 = [(MSDContactsViewController *)self view];
  objc_super v19 = [v21 safeAreaLayoutGuide];
  long long v18 = [v19 bottomAnchor];
  long long v17 = [v20 constraintEqualToAnchor:v18];
  v28[1] = v17;
  long long v15 = [v4 leftAnchor];
  v6 = [(MSDContactsViewController *)self view];
  uint64_t v7 = [v6 safeAreaLayoutGuide];
  uint64_t v8 = [v7 leftAnchor];
  uint64_t v9 = [v15 constraintEqualToAnchor:v8];
  v28[2] = v9;
  uint64_t v10 = [v4 rightAnchor];
  uint64_t v11 = [(MSDContactsViewController *)self view];
  v12 = [v11 safeAreaLayoutGuide];
  v13 = [v12 rightAnchor];
  v14 = [v10 constraintEqualToAnchor:v13];
  v28[3] = v14;
  long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];

  [MEMORY[0x263F08938] activateConstraints:v16];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"ContactsViewTableCell"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(MSDContactsViewController *)self regions];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v6 = [(MSDContactsViewController *)self regions];
  unint64_t v7 = [v6 count];

  if (v7 <= a4) {
    return 0;
  }
  uint64_t v8 = [(MSDContactsViewController *)self regions];
  uint64_t v9 = [v8 objectAtIndex:a4];

  uint64_t v10 = [(MSDContactsViewController *)self contactsModel];
  uint64_t v11 = [v10 regionToCountryCode];
  v12 = [v11 objectForKey:v9];

  int64_t v13 = [v12 count];
  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 section];
  unint64_t v7 = [(MSDContactsViewController *)self regions];
  unint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    v20 = 0;
  }
  else
  {
    uint64_t v9 = [(MSDContactsViewController *)self regions];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "section"));

    uint64_t v11 = [(MSDContactsViewController *)self contactsModel];
    v12 = [v11 regionToCountryCode];
    int64_t v13 = [v12 objectForKey:v10];

    unint64_t v14 = [v5 row];
    if (v14 >= [v13 count])
    {
      v20 = 0;
    }
    else
    {
      long long v15 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v5, "row"));
      long long v16 = [(MSDContactsViewController *)self contactsModel];
      long long v17 = [v16 contactNumberForCountryCode:v15];

      long long v18 = [MEMORY[0x263EFF960] currentLocale];
      objc_super v19 = [v18 localizedStringForCountryCode:v15];

      v20 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"ContactsViewTableCell"];
      uint64_t v21 = [v20 defaultContentConfiguration];
      [v21 setText:v19];
      [v21 setSecondaryText:v17];
      [v20 setContentConfiguration:v21];
    }
  }

  return v20;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unint64_t v6 = [(MSDContactsViewController *)self regions];
  unint64_t v7 = [v6 count];

  if (v7 <= a4)
  {
    uint64_t v9 = 0;
  }
  else
  {
    unint64_t v8 = [(MSDContactsViewController *)self regions];
    uint64_t v9 = [v8 objectAtIndex:a4];
  }
  return v9;
}

- (MSDStoreContactsModel)contactsModel
{
  return self->_contactsModel;
}

- (void)setContactsModel:(id)a3
{
}

- (NSMutableArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_contactsModel, 0);
}

@end