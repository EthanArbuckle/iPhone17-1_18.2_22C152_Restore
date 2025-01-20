@interface PHContactsTableViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (CNAvatarViewControllerSettings)avatarViewControllerSettings;
- (CNContactFormatter)contactFormatter;
- (NSArray)contactArray;
- (NSArray)contactHandles;
- (PHContactsTableViewController)initWithContactArray:(id)a3 contactHandles:(id)a4;
- (id)contactAtIndex:(int64_t)a3;
- (id)contactForContact:(id)a3 contactStore:(id)a4;
- (id)customInfoButtonAction;
- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4;
- (id)handleAtIndex:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAvatarViewControllerSettings:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setCustomInfoButtonAction:(id)a3;
- (void)setUpTableView;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PHContactsTableViewController

- (PHContactsTableViewController)initWithContactArray:(id)a3 contactHandles:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHContactsTableViewController;
  v9 = [(PHContactsTableViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactArray, a3);
    objc_storeStrong((id *)&v10->_contactHandles, a4);
    id v11 = objc_alloc_init((Class)CNContactFormatter);
    [(PHContactsTableViewController *)v10 setContactFormatter:v11];

    v12 = [(PHContactsTableViewController *)v10 contactFormatter];
    [v12 setStyle:0];
  }
  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PHContactsTableViewController;
  [(PHTableViewController *)&v3 viewDidLoad];
  [(PHContactsTableViewController *)self setUpTableView];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(PHContactsTableViewController *)self contactArray];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PHTableViewCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  v10 = -[PHContactsTableViewController contactAtIndex:](self, "contactAtIndex:", [v6 row]);
  id v11 = [v6 row];

  v12 = [(PHContactsTableViewController *)self handleAtIndex:v11];
  if (v10)
  {
    id v13 = [v9 avatarViewController];
    if (!v13)
    {
      id v14 = objc_alloc((Class)CNAvatarViewController);
      v15 = [(PHContactsTableViewController *)self avatarViewControllerSettings];
      id v13 = [v14 initWithSettings:v15];

      [v13 setObjectViewControllerDelegate:self];
      [v9 setAvatarViewController:v13];
    }
    v27 = v10;
    v16 = +[NSArray arrayWithObjects:&v27 count:1];
    v17 = [v9 avatarViewController];
    [v17 setContacts:v16];

    v18 = [(PHContactsTableViewController *)self contactFormatter];
    v19 = [v18 stringFromContact:v10];

    if (v19)
    {
      id v20 = v19;
    }
    else
    {
      id v20 = [v12 value];
      if (!v20)
      {
        v21 = +[NSBundle mainBundle];
        id v20 = [v21 localizedStringForKey:@"UNKNOWN_CALLER" value:&stru_1000A3488 table:@"PHRecents"];
      }
    }
    v22 = [v9 titleLabel];
    [v22 setText:v20];

    v23 = [v9 titleLabel];
    [v23 setNumberOfLines:1];

    v24 = [v9 titleLabel];
    [v24 setLineBreakMode:4];

    v25 = +[UIColor clearColor];
    [v9 setBackgroundColor:v25];
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  if (([(PHContactsTableViewController *)self isEditing] & 1) == 0)
  {
    id v7 = -[PHContactsTableViewController contactAtIndex:](self, "contactAtIndex:", [v6 row]);
    id v8 = [(PHContactsTableViewController *)self customInfoButtonAction];

    if (v8)
    {
      [v27 rectForRowAtIndexPath:v6];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      v17 = [(PHContactsTableViewController *)self view];
      [v17 convertPoint:0 toView:v10];
      double v19 = v18;
      double v21 = v20;

      v22 = [(PHContactsTableViewController *)self customInfoButtonAction];
      v23 = [(PHContactsTableViewController *)self view];
      ((void (**)(void, void *, void *, double, double, double, double))v22)[2](v22, v7, v23, v19, v21, v14, v16);
    }
    else
    {
      -[PHContactsTableViewController handleAtIndex:](self, "handleAtIndex:", [v6 row]);
      v22 = (void (**)(void, void, void, double, double, double, double))objc_claimAutoreleasedReturnValue();
      if ([v7 hasBeenPersisted]) {
        +[PHContactViewController viewControllerForContact:v7];
      }
      else {
      v24 = +[PHContactViewController viewControllerForUnknownContact:v7];
      }
      v23 = v24;
      if (v24)
      {
        [v24 setHandle:v22];
        v25 = [(PHContactsTableViewController *)self navigationController];
        [v25 pushViewController:v23 animated:1];

        [v23 setAllowsEditing:1];
        [v23 setAllowsActions:1];
        [v23 setActions:[v23 actions] | 0x80];
        v26 = +[CNContactStore suggestedContactStore];
        [v23 setContactStore:v26];
      }
      [v27 deselectRowAtIndexPath:v6 animated:0];
    }
  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)contactAtIndex:(int64_t)a3
{
  v4 = [(PHContactsTableViewController *)self contactArray];
  id v5 = v4;
  if (a3 < 0 || (unint64_t)[v4 count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (id)handleAtIndex:(int64_t)a3
{
  id v5 = [(PHContactsTableViewController *)self contactHandles];
  if (a3 < 0
    || ([(PHContactsTableViewController *)self contactHandles],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        (unint64_t)v7 <= a3))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v5 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (CNAvatarViewControllerSettings)avatarViewControllerSettings
{
  avatarViewControllerSettings = self->_avatarViewControllerSettings;
  if (!avatarViewControllerSettings)
  {
    v4 = +[CNAvatarViewControllerSettings defaultSettings];
    id v5 = self->_avatarViewControllerSettings;
    self->_avatarViewControllerSettings = v4;

    avatarViewControllerSettings = self->_avatarViewControllerSettings;
  }

  return avatarViewControllerSettings;
}

- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 type];
  id v8 = sub_100012C68();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)2)
  {
    if (v9)
    {
      double v10 = [v5 value];
      int v15 = 138412546;
      double v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "     - we'll format the destinationID '%@' with the country code '%@'", (uint8_t *)&v15, 0x16u);
    }
    double v11 = [v5 value];
    double v12 = TUFormattedPhoneNumber();
  }
  else
  {
    if (v9)
    {
      double v13 = [v5 value];
      int v15 = 138412290;
      double v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "     - handle can't/shouldn't be formatted as a phone number, so using the unmodified destination ID '%@'", (uint8_t *)&v15, 0xCu);
    }
    double v12 = [v5 value];
  }

  return v12;
}

- (void)setUpTableView
{
  objc_super v3 = [(PHContactsTableViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  id v5 = +[PHTableViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  id v6 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v7 = [(PHContactsTableViewController *)self tableView];
  [v7 setTableFooterView:v6];

  id v8 = +[UIApplication sharedApplication];
  BOOL v9 = [v8 preferredContentSizeCategory];
  +[PHContactTableViewCell separatorInsetForContentSizeCategory:v9];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = [(PHContactsTableViewController *)self tableView];
  [v18 setSeparatorInset:v11, v13, v15, v17];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023160;
  block[3] = &unk_1000A1D50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)contactForContact:(id)a3 contactStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[CNUIFavoritesEntryPicker descriptorForRequiredKeys];
  v23 = v7;
  id v8 = +[NSArray arrayWithObjects:&v23 count:1];

  if ([v5 areKeysAvailable:v8])
  {
    id v9 = v5;
  }
  else
  {
    double v10 = +[NSMutableArray arrayWithArray:v8];
    double v11 = [v5 availableKeyDescriptor];
    if (v11) {
      [v10 addObject:v11];
    }
    double v12 = [v5 identifier];
    id v16 = 0;
    id v9 = [v6 unifiedContactWithIdentifier:v12 keysToFetch:v10 error:&v16];
    id v13 = v16;

    if (!v9)
    {
      double v14 = sub_100012C68();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v6;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not retrieve a compatible contact using contact (%@) and contact store (%@) due to an error (%@).", buf, 0x20u);
      }
    }
  }

  return v9;
}

- (NSArray)contactArray
{
  return self->_contactArray;
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (id)customInfoButtonAction
{
  return self->_customInfoButtonAction;
}

- (void)setCustomInfoButtonAction:(id)a3
{
}

- (void)setAvatarViewControllerSettings:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_avatarViewControllerSettings, 0);
  objc_storeStrong(&self->_customInfoButtonAction, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);

  objc_storeStrong((id *)&self->_contactArray, 0);
}

@end