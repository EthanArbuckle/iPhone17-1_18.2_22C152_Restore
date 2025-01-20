@interface WLTipsListViewController
- (WLTipsListViewController)initWithItems;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)userInterfaceStyleDidChange;
- (void)viewDidLoad;
@end

@implementation WLTipsListViewController

- (WLTipsListViewController)initWithItems
{
  v3 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"TIPS_TITLE"];
  v4 = WLLocalizedString();

  v5 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"TIPS_DESCRIPTION"];
  v6 = WLLocalizedString();

  v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];
  v9 = @"ipad";
  if (!v8) {
    v9 = @"iphone";
  }
  v10 = v9;

  v16.receiver = self;
  v16.super_class = (Class)WLTipsListViewController;
  v11 = [(OBTableWelcomeController *)&v16 initWithTitle:v4 detailText:v6 symbolName:v10 adoptTableViewScrollView:1];

  if (v11)
  {
    uint64_t v12 = +[WLTips tips];
    tips = v11->_tips;
    v11->_tips = (NSArray *)v12;

    v14 = objc_alloc_init(_TtC12WelcomeKitUI6Signal);
    [(Signal *)v14 send];
  }
  return v11;
}

- (void)viewDidLoad
{
  v15[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)WLTipsListViewController;
  [(OBTableWelcomeController *)&v14 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  v5 = [(OBTableWelcomeController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"WLTipsListViewCell"];

  v6 = [(OBTableWelcomeController *)self tableView];
  v7 = [MEMORY[0x263F825C8] clearColor];
  [v6 setBackgroundColor:v7];

  uint64_t v8 = [(OBTableWelcomeController *)self tableView];
  [v8 setDataSource:self];

  v9 = [(OBTableWelcomeController *)self tableView];
  [v9 setDelegate:self];

  v10 = [(OBTableWelcomeController *)self tableView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = self;
  v15[0] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v13 = (id)[(WLTipsListViewController *)self registerForTraitChanges:v12 withAction:sel_userInterfaceStyleDidChange];
}

- (void)userInterfaceStyleDidChange
{
  id v2 = [(OBTableWelcomeController *)self tableView];
  [v2 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_tips count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"WLTipsListViewCell" forIndexPath:v6];
  uint64_t v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v7 setBackgroundColor:v8];

  [v7 setAccessoryType:1];
  v9 = [v7 imageView];
  v10 = [MEMORY[0x263F825C8] systemLightGrayColor];
  [v9 setBackgroundColor:v10];

  tips = self->_tips;
  uint64_t v12 = [v6 row];

  id v13 = [(NSArray *)tips objectAtIndexedSubscript:v12];
  objc_super v14 = [MEMORY[0x263F82B60] mainScreen];
  v15 = [v14 traitCollection];
  uint64_t v16 = [v15 userInterfaceStyle];

  v17 = [MEMORY[0x263F82918] valueCellConfiguration];
  v18 = (void *)MEMORY[0x263F827E8];
  v19 = [v13 thumbnail];
  v20 = v19;
  if (v16 == 2) {
    [v19 dark];
  }
  else {
  v21 = [v19 light];
  }
  v22 = [v21 localFile];
  v23 = [v18 imageNamed:v22];

  [v17 setImage:v23];
  v24 = [v17 imageProperties];
  objc_msgSend(v24, "setMaximumSize:", 100.0, 100.0);

  v25 = [v13 title];
  [v17 setText:v25];

  v26 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  v27 = [v17 textProperties];
  [v27 setFont:v26];

  v28 = [v13 desc];
  [v17 setSecondaryText:v28];

  v29 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  v30 = [v17 secondaryTextProperties];
  [v30 setFont:v29];

  [v7 setContentConfiguration:v17];
  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = objc_alloc(MEMORY[0x263F82E00]);
  v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v5 setUserInteractionEnabled:0];
  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  +[WLProgressBar height];
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  tips = self->_tips;
  uint64_t v8 = [v6 row];

  id v11 = [(NSArray *)tips objectAtIndexedSubscript:v8];
  v9 = [[WLTipsViewController alloc] initWithTips:v11];
  v10 = [(WLTipsListViewController *)self navigationController];
  [v10 pushViewController:v9 animated:1];
}

- (void).cxx_destruct
{
}

@end