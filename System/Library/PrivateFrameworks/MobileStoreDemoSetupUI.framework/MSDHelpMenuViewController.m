@interface MSDHelpMenuViewController
- (MSDHelpMenuViewController)init;
- (NSMutableSet)helpMenuUserTapped;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setHelpMenuUserTapped:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation MSDHelpMenuViewController

- (MSDHelpMenuViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSDHelpMenuViewController;
  v2 = [(MSDHelpMenuViewController *)&v7 initWithStyle:0];
  if (v2)
  {
    v3 = +[MSDSetupUILocalization localizedStringForKey:@"HELP_HEADER"];
    [(MSDHelpMenuViewController *)v2 setTitle:v3];

    v4 = [(MSDHelpMenuViewController *)v2 tableView];
    [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"HelpMenuCell"];

    v5 = objc_opt_new();
    [(MSDHelpMenuViewController *)v2 setHelpMenuUserTapped:v5];
  }
  return v2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = a4;
  if ([v4 row] > 2)
  {
    v5 = 0;
    goto LABEL_11;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"HelpMenuCell"];
  v6 = [v5 defaultContentConfiguration];
  if (![v4 row])
  {
    objc_super v7 = @"CANNOT_FIND_STORE_OPTION";
    goto LABEL_9;
  }
  if ([v4 row] == 1)
  {
    objc_super v7 = @"LEARN_MORE_OPTION";
LABEL_9:
    v8 = +[MSDSetupUILocalization localizedStringForKey:v7];
    [v6 setText:v8];

    goto LABEL_10;
  }
  if ([v4 row] == 2)
  {
    objc_super v7 = @"SUPPORT_OPTION";
    goto LABEL_9;
  }
LABEL_10:
  v9 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
  v10 = [v6 textProperties];
  [v10 setFont:v9];

  [v5 setContentConfiguration:v6];
  v11 = [MEMORY[0x263F1C550] whiteColor];
  [v5 setBackgroundColor:v11];

  v12 = [v5 contentView];
  objc_msgSend(v12, "setLayoutMargins:", 20.0, 0.0, 20.0, 0.0);

LABEL_11:
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a4;
  BOOL v5 = [v14 row] <= 2;
  v6 = v14;
  if (v5)
  {
    if ([v14 row])
    {
      if ([v14 row] == 1)
      {
        objc_super v7 = objc_alloc_init(MSDLearnMoreViewController);
        v8 = [(MSDHelpMenuViewController *)self helpMenuUserTapped];
        v9 = v8;
        v10 = @"Learn more about device assignment";
      }
      else
      {
        if ([v14 row] != 2)
        {
LABEL_11:
          v12 = +[MSDSetupUIController sharedInstance];
          v13 = [(MSDHelpMenuViewController *)self helpMenuUserTapped];
          [v12 setHelpMenuRowSelection:v13];

          v6 = v14;
          goto LABEL_12;
        }
        objc_super v7 = objc_alloc_init(MSDSupportViewController);
        v8 = [(MSDHelpMenuViewController *)self helpMenuUserTapped];
        v9 = v8;
        v10 = @"Get help from a support agent";
      }
    }
    else
    {
      objc_super v7 = objc_alloc_init(MSDDefaultStoreViewController);
      v8 = [(MSDHelpMenuViewController *)self helpMenuUserTapped];
      v9 = v8;
      v10 = @"I Can't find my store or company";
    }
    [v8 addObject:v10];

    if (v7)
    {
      v11 = +[MSDSetupUIController sharedInstance];
      [v11 pushViewController:v7 andRemoveTopmostView:0];
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (NSMutableSet)helpMenuUserTapped
{
  return self->_helpMenuUserTapped;
}

- (void)setHelpMenuUserTapped:(id)a3
{
}

- (void).cxx_destruct
{
}

@end