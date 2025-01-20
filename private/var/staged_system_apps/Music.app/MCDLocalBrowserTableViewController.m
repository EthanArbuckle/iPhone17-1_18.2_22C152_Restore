@interface MCDLocalBrowserTableViewController
- (BOOL)showOnlyLocalContent;
- (MCDLocalBrowserTableViewController)initWithLimitedUI:(BOOL)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_textForHeaderView;
- (id)titleForIdentifier:(id)a3;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
@end

@implementation MCDLocalBrowserTableViewController

- (MCDLocalBrowserTableViewController)initWithLimitedUI:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCDLocalBrowserTableViewController;
  v3 = [(MCDBrowserTableViewController *)&v6 initWithLimitedUI:a3];
  v4 = v3;
  if (v3) {
    [(MCDLocalBrowserTableViewController *)v3 setPlayActivityFeatureName:@"downloaded_music"];
  }
  return v4;
}

- (id)titleForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = sub_10008D1E8();
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Recently Downloaded" value:&stru_101023248 table:0];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MCDLocalBrowserTableViewController;
    v8 = [(MCDBrowserTableViewController *)&v10 titleForIdentifier:v4];
  }

  return v8;
}

- (BOOL)showOnlyLocalContent
{
  return 1;
}

- (id)_textForHeaderView
{
  return +[NSString downloadedOnlyMessage];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 27.0;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    objc_super v10 = (void (*)(id))off_1010D6D48;
    v18 = off_1010D6D48;
    if (!off_1010D6D48)
    {
      v11 = (void *)sub_100029270();
      v16[3] = (uint64_t)dlsym(v11, "MCDSetupTableHeaderView");
      off_1010D6D48 = (_UNKNOWN *)v16[3];
      objc_super v10 = (void (*)(id))v16[3];
    }
    _Block_object_dispose(&v15, 8);
    if (!v10)
    {
      v14 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v15, 8);
      _Unwind_Resume(v14);
    }
    v10(v9);

    v12 = [(MCDLocalBrowserTableViewController *)self _textForHeaderView];
    v13 = [v9 textLabel];
    [v13 setText:v12];
  }
}

@end