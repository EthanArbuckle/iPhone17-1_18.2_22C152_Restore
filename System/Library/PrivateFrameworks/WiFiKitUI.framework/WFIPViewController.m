@interface WFIPViewController
- (NSArray)addresses;
- (NSArray)prefixes;
- (WFAppearanceProxy)appearanceProxy;
- (WFIPViewController)initWithAddresses:(id)a3 prefixLengths:(id)a4;
- (WFIPViewController)initWithAddresses:(id)a3 prefixLengths:(id)a4 appearanceProxy:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAddresses:(id)a3;
- (void)setAppearanceProxy:(id)a3;
- (void)setPrefixes:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFIPViewController

- (WFIPViewController)initWithAddresses:(id)a3 prefixLengths:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[WFAppearanceProxy defaultAppearanceProxy];
  v9 = [(WFIPViewController *)self initWithAddresses:v7 prefixLengths:v6 appearanceProxy:v8];

  return v9;
}

- (WFIPViewController)initWithAddresses:(id)a3 prefixLengths:(id)a4 appearanceProxy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v12)
  {
    v17.receiver = self;
    v17.super_class = (Class)WFIPViewController;
    v13 = -[WFIPViewController initWithStyle:](&v17, sel_initWithStyle_, [v11 tableViewStyle]);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_addresses, a3);
      objc_storeStrong((id *)&v14->_prefixes, a4);
      v15 = (WFAppearanceProxy *)v11;
      self = (WFIPViewController *)v14->_appearanceProxy;
      v14->_appearanceProxy = v15;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)WFIPViewController;
  [(WFIPViewController *)&v11 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"kWFLocSettingsIPV6AddressesTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [(WFIPViewController *)self setTitle:v4];

  double v5 = *MEMORY[0x263F839B8];
  id v6 = [(WFIPViewController *)self tableView];
  [v6 setRowHeight:v5];

  id v7 = [(WFIPViewController *)self tableView];
  [v7 setEstimatedRowHeight:44.0];

  v8 = [(WFIPViewController *)self tableView];
  [v8 setEstimatedSectionHeaderHeight:0.0];

  id v9 = [(WFIPViewController *)self tableView];
  [v9 setEstimatedSectionFooterHeight:0.0];

  if ([MEMORY[0x263F82670] currentIsIPad])
  {
    id v10 = [(WFIPViewController *)self tableView];
    objc_msgSend(v10, "_setSectionContentInset:", 0.0, 20.0, 0.0, 20.0);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(WFIPViewController *)self addresses];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
  id v7 = [(WFIPViewController *)self addresses];
  v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v5, "row"));

  id v9 = [(WFIPViewController *)self prefixes];

  if (v9)
  {
    id v10 = NSString;
    objc_super v11 = [(WFIPViewController *)self prefixes];
    v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v5, "row"));
    id v13 = [v10 stringWithFormat:@"%@/%@", v8, v12];
  }
  else
  {
    id v13 = v8;
  }
  v14 = [v6 textLabel];
  [v14 setText:v13];

  v15 = [MEMORY[0x263F825C8] defaultTextColor];
  v16 = [v6 textLabel];
  [v16 setTextColor:v15];

  [v6 setSelectionStyle:0];
  objc_super v17 = [v6 textLabel];
  [v17 setNumberOfLines:0];

  v18 = [(WFIPViewController *)self appearanceProxy];
  v19 = [v18 cellTextLabelFont];

  if (v19)
  {
    v20 = [(WFIPViewController *)self appearanceProxy];
    v21 = [v20 cellTextLabelFont];
    v22 = [v6 textLabel];
    [v22 setFont:v21];
  }
  return v6;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (void)setPrefixes:(id)a3
{
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end