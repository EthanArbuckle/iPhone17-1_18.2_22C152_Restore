@interface PHContactsAndBlockTableViewController
- (BOOL)areUnknownContactsBlocked;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (CHRecentCall)recentCall;
- (CNAvatarViewControllerSettings)avatarViewControllerSettings;
- (CNContactFormatter)contactFormatter;
- (NSArray)contactArray;
- (NSArray)contactHandles;
- (NSArray)unknownContacts;
- (NSMutableArray)reportAndBlockSection;
- (PHContactsAndBlockTableViewController)initWithContactArray:(id)a3 unknownContacts:(id)a4 contactHandles:(id)a5 tableViewModel:(id)a6;
- (PHContactsReportAndBlockTableViewModel)tableViewModel;
- (id)contactAtIndex:(int64_t)a3;
- (id)contactForContact:(id)a3 contactStore:(id)a4;
- (id)customInfoButtonAction;
- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4;
- (id)handleAtIndex:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)reportSectionNeedsUpdate;
- (void)setAvatarViewControllerSettings:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setCustomInfoButtonAction:(id)a3;
- (void)setRecentCall:(id)a3;
- (void)setReportAndBlockSection:(id)a3;
- (void)setTableViewModel:(id)a3;
- (void)setUpReportAndBlockSection;
- (void)setUpTableView;
- (void)showBlockAllAlert;
- (void)showBlockUnknownAlert;
- (void)showReportAlert;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PHContactsAndBlockTableViewController

- (PHContactsAndBlockTableViewController)initWithContactArray:(id)a3 unknownContacts:(id)a4 contactHandles:(id)a5 tableViewModel:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PHContactsAndBlockTableViewController;
  v15 = [(PHTableViewController *)&v20 initWithStyle:2];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contactArray, a3);
    objc_storeStrong((id *)&v16->_unknownContacts, a4);
    objc_storeStrong((id *)&v16->_contactHandles, a5);
    [(PHContactsAndBlockTableViewController *)v16 setTableViewModel:v14];
    id v17 = objc_alloc_init((Class)CNContactFormatter);
    [(PHContactsAndBlockTableViewController *)v16 setContactFormatter:v17];

    v18 = [(PHContactsAndBlockTableViewController *)v16 contactFormatter];
    [v18 setStyle:0];
  }
  return v16;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PHContactsAndBlockTableViewController;
  [(PHTableViewController *)&v6 viewDidLoad];
  [(PHContactsAndBlockTableViewController *)self setUpTableView];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"reportSectionNeedsUpdate" name:TUPrivacyRulesChangedNotification object:0];

  uint64_t v7 = objc_opt_class();
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  id v5 = [(PHContactsAndBlockTableViewController *)self registerForTraitChanges:v4 withAction:"reportSectionNeedsUpdate"];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHContactsAndBlockTableViewController;
  [(PHTableViewController *)&v4 dealloc];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    [(PHContactsAndBlockTableViewController *)self reportAndBlockSection];
  }
  else {
  objc_super v4 = [(PHContactsAndBlockTableViewController *)self contactArray];
  }
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 section])
  {
    v15 = +[PHTableViewCell reuseIdentifier];
    id v14 = [v6 dequeueReusableCellWithIdentifier:v15 forIndexPath:v7];

    v10 = -[PHContactsAndBlockTableViewController contactAtIndex:](self, "contactAtIndex:", [v7 row]);
    v16 = -[PHContactsAndBlockTableViewController handleAtIndex:](self, "handleAtIndex:", [v7 row]);
    if (v10)
    {
      id v17 = [v14 avatarViewController];
      if (!v17)
      {
        id v18 = objc_alloc((Class)CNAvatarViewController);
        v19 = [(PHContactsAndBlockTableViewController *)self avatarViewControllerSettings];
        id v17 = [v18 initWithSettings:v19];

        [v17 setObjectViewControllerDelegate:self];
        [v14 setAvatarViewController:v17];
      }
      v41 = v10;
      objc_super v20 = +[NSArray arrayWithObjects:&v41 count:1];
      v21 = [v14 avatarViewController];
      [v21 setContacts:v20];

      v22 = [(PHContactsAndBlockTableViewController *)self contactFormatter];
      v23 = [v22 stringFromContact:v10];

      if (v23)
      {
        id v24 = v23;
      }
      else
      {
        id v24 = [v16 value];
        if (!v24)
        {
          v35 = +[NSBundle mainBundle];
          id v24 = [v35 localizedStringForKey:@"UNKNOWN_CALLER" value:&stru_1000A3488 table:@"PHRecents"];
        }
      }
      v36 = [v14 titleLabel];
      [v36 setText:v24];

      v37 = [v14 titleLabel];
      [v37 setNumberOfLines:1];

      v38 = [v14 titleLabel];
      [v38 setLineBreakMode:4];
    }
    goto LABEL_28;
  }
  v8 = sub_100012C68();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v40[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "loading isBlocked:", (uint8_t *)v40, 2u);
  }

  v9 = [(PHContactsAndBlockTableViewController *)self reportAndBlockSection];
  v10 = [v9 objectAtIndexedSubscript:[v7 row]];

  id v11 = +[PHReportTableViewCell reuseIdentifier];
  unsigned int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = [v6 dequeueReusableCellWithIdentifier:v10];
    if (v13)
    {
      id v14 = (void *)v13;
      goto LABEL_29;
    }
    v34 = PHReportTableViewCell;
    goto LABEL_21;
  }
  v25 = +[PHBlockTableViewCell reuseIdentifier];
  unsigned int v26 = [v10 isEqualToString:v25];

  if (!v26)
  {
    v34 = PHBlockTableViewCell;
LABEL_21:
    v16 = [(__objc2_class *)v34 reuseIdentifier];
    id v14 = [v6 dequeueReusableCellWithIdentifier:v16 forIndexPath:v7];
    goto LABEL_28;
  }
  id v14 = [v6 dequeueReusableCellWithIdentifier:v10];
  if (!v14)
  {
    v27 = +[PHBlockTableViewCell reuseIdentifier];
    id v14 = [v6 dequeueReusableCellWithIdentifier:v27 forIndexPath:v7];
  }
  v28 = sub_100012C68();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v29 = [(PHContactsAndBlockTableViewController *)self areUnknownContactsBlocked];
    v40[0] = 67109120;
    v40[1] = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "loading isBlocked: %d", (uint8_t *)v40, 8u);
  }

  if ([(PHContactsReportAndBlockTableViewModel *)self->_tableViewModel shouldShowBlockAll])
  {
    BOOL v30 = [(PHContactsAndBlockTableViewController *)self areUnknownContactsBlocked];
    v16 = [(PHContactsAndBlockTableViewController *)self traitCollection];
    id v31 = [v16 userInterfaceStyle];
    v32 = v14;
    uint64_t v33 = 0;
  }
  else
  {
    if (![(PHContactsReportAndBlockTableViewModel *)self->_tableViewModel shouldShowBlockUnknown])goto LABEL_29; {
    BOOL v30 = [(PHContactsAndBlockTableViewController *)self areUnknownContactsBlocked];
    }
    v16 = [(PHContactsAndBlockTableViewController *)self traitCollection];
    id v31 = [v16 userInterfaceStyle];
    v32 = v14;
    uint64_t v33 = 1;
  }
  [v32 updateCellOfFlow:v33 isBlocked:v30 style:v31];
LABEL_28:

LABEL_29:

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  if (([(PHContactsAndBlockTableViewController *)self isEditing] & 1) == 0)
  {
    id v7 = [v31 cellForRowAtIndexPath:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = -[PHContactsAndBlockTableViewController contactAtIndex:](self, "contactAtIndex:", [v6 row]);
      v9 = [(PHContactsAndBlockTableViewController *)self customInfoButtonAction];

      if (v9)
      {
        [v31 rectForRowAtIndexPath:v6];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        id v18 = [(PHContactsAndBlockTableViewController *)self view];
        [v18 convertPoint:0 toView:v11];
        double v20 = v19;
        double v22 = v21;

        v23 = [(PHContactsAndBlockTableViewController *)self customInfoButtonAction];
        id v24 = [(PHContactsAndBlockTableViewController *)self view];
        ((void (**)(void, void *, void *, double, double, double, double))v23)[2](v23, v8, v24, v20, v22, v15, v17);

LABEL_20:
        goto LABEL_21;
      }
      unsigned int v26 = -[PHContactsAndBlockTableViewController handleAtIndex:](self, "handleAtIndex:", [v6 row]);
      if ([v8 hasBeenPersisted]) {
        +[PHContactViewController viewControllerForContact:v8];
      }
      else {
      v27 = +[PHContactViewController viewControllerForUnknownContact:v8];
      }
      v28 = v27;
      if (v27)
      {
        [v27 setHandle:v26];
        unsigned int v29 = [(PHContactsAndBlockTableViewController *)self navigationController];
        [v29 pushViewController:v28 animated:1];

        [v28 setAllowsEditing:1];
        [v28 setAllowsActions:1];
        [v28 setActions:[v28 actions] | 0x80];
        BOOL v30 = +[CNContactStore suggestedContactStore];
        [v28 setContactStore:v30];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(PHContactsAndBlockTableViewController *)self showReportAlert];
        }
        goto LABEL_19;
      }
      if (![(PHContactsAndBlockTableViewController *)self areUnknownContactsBlocked])
      {
        if ([(PHContactsReportAndBlockTableViewModel *)self->_tableViewModel shouldShowBlockAll])
        {
          [(PHContactsAndBlockTableViewController *)self showBlockAllAlert];
        }
        else if ([(PHContactsReportAndBlockTableViewModel *)self->_tableViewModel shouldShowBlockUnknown])
        {
          [(PHContactsAndBlockTableViewController *)self showBlockUnknownAlert];
        }
        goto LABEL_19;
      }
      v8 = [(PHContactsAndBlockTableViewController *)self tableViewModel];
      v25 = [(PHContactsAndBlockTableViewController *)self unknownContacts];
      [v8 unblockWithContacts:v25];
    }
LABEL_19:
    [v31 deselectRowAtIndexPath:v6 animated:0];
    goto LABEL_20;
  }
LABEL_21:
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
}

- (BOOL)areUnknownContactsBlocked
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(PHContactsAndBlockTableViewController *)self unknownContacts];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    int v6 = 1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v6 &= [*(id *)(*((void *)&v9 + 1) + 8 * i) isBlocked];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)showBlockAllAlert
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"REPORT_BLOCK_FACETIME_ALERT_REPORT_BLOCK_ALERT_TITLE" value:&stru_1000A3488 table:@"PHRecents"];
  uint64_t v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:0];

  int v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"REPORT_FACETIME_ALERT_CANCEL" value:&stru_1000A3488 table:@"PHRecents"];
  v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];

  long long v9 = +[NSBundle mainBundle];
  long long v10 = [v9 localizedStringForKey:@"REPORT_BLOCK_FACETIME_ALERT_BLOCK_ALL" value:&stru_1000A3488 table:@"PHRecents"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000396A0;
  v12[3] = &unk_1000A2548;
  v12[4] = self;
  long long v11 = +[UIAlertAction actionWithTitle:v10 style:2 handler:v12];

  [v5 addAction:v8];
  [v5 addAction:v11];
  [(PHContactsAndBlockTableViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)showBlockUnknownAlert
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"REPORT_BLOCK_FACETIME_ALERT_REPORT_BLOCK_ALERT_TITLE" value:&stru_1000A3488 table:@"PHRecents"];
  uint64_t v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:0];

  int v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"REPORT_FACETIME_ALERT_CANCEL" value:&stru_1000A3488 table:@"PHRecents"];
  v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];

  long long v9 = +[NSBundle mainBundle];
  long long v10 = [v9 localizedStringForKey:@"REPORT_BLOCK_FACETIME_ALERT_BLOCK_UNKNOWN" value:&stru_1000A3488 table:@"PHRecents"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000398EC;
  v12[3] = &unk_1000A2548;
  v12[4] = self;
  long long v11 = +[UIAlertAction actionWithTitle:v10 style:2 handler:v12];

  [v5 addAction:v8];
  [v5 addAction:v11];
  [(PHContactsAndBlockTableViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)setUpReportAndBlockSection
{
  id v3 = +[NSMutableArray array];
  [(PHContactsAndBlockTableViewController *)self setReportAndBlockSection:v3];

  if ([(PHContactsReportAndBlockTableViewModel *)self->_tableViewModel shouldShowReportInitiator])
  {
    id v4 = [(PHContactsAndBlockTableViewController *)self reportAndBlockSection];
    uint64_t v5 = +[PHReportTableViewCell reuseIdentifier];
    [v4 addObject:v5];
  }
  if ([(PHContactsReportAndBlockTableViewModel *)self->_tableViewModel shouldShowBlockAll]
    || [(PHContactsReportAndBlockTableViewModel *)self->_tableViewModel shouldShowBlockUnknown])
  {
    id v7 = [(PHContactsAndBlockTableViewController *)self reportAndBlockSection];
    int v6 = +[PHBlockTableViewCell reuseIdentifier];
    [v7 addObject:v6];
  }
}

- (void)showReportAlert
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"RECENTS_REPORT_SINGLE_PARTICIPANT_AlERT_MESSAGE" value:&stru_1000A3488 table:@"PHRecents"];
  uint64_t v5 = [(PHContactsAndBlockTableViewController *)self tableViewModel];
  int v6 = [v5 formattedInitiatorValue];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  v8 = +[UIAlertController alertControllerWithTitle:0 message:v7 preferredStyle:0];
  long long v9 = +[NSBundle mainBundle];
  long long v10 = [v9 localizedStringForKey:@"REPORT_FACETIME_ALERT_CANCEL" value:&stru_1000A3488 table:@"PHRecents"];
  long long v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];

  long long v12 = +[NSBundle mainBundle];
  double v13 = [v12 localizedStringForKey:@"REPORT_SINGLE_PARTICIPANT_AlERT_REPORT_TITLE" value:&stru_1000A3488 table:@"PHRecents"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100039C90;
  v15[3] = &unk_1000A2548;
  v15[4] = self;
  double v14 = +[UIAlertAction actionWithTitle:v13 style:2 handler:v15];

  [v8 addAction:v11];
  [v8 addAction:v14];
  [(PHContactsAndBlockTableViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (id)contactAtIndex:(int64_t)a3
{
  id v4 = [(PHContactsAndBlockTableViewController *)self contactArray];
  uint64_t v5 = v4;
  if (a3 < 0 || (unint64_t)[v4 count] <= a3)
  {
    int v6 = 0;
  }
  else
  {
    int v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (id)handleAtIndex:(int64_t)a3
{
  uint64_t v5 = [(PHContactsAndBlockTableViewController *)self contactHandles];
  if (a3 < 0
    || ([(PHContactsAndBlockTableViewController *)self contactHandles],
        int v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        (unint64_t)v7 <= a3))
  {
    v8 = 0;
  }
  else
  {
    v8 = [v5 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (CNAvatarViewControllerSettings)avatarViewControllerSettings
{
  avatarViewControllerSettings = self->_avatarViewControllerSettings;
  if (!avatarViewControllerSettings)
  {
    id v4 = +[CNAvatarViewControllerSettings defaultSettings];
    uint64_t v5 = self->_avatarViewControllerSettings;
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
  v8 = sub_100012C68();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)2)
  {
    if (v9)
    {
      long long v10 = [v5 value];
      int v15 = 138412546;
      double v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "     - we'll format the destinationID '%@' with the country code '%@'", (uint8_t *)&v15, 0x16u);
    }
    long long v11 = [v5 value];
    long long v12 = TUFormattedPhoneNumber();
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
    long long v12 = [v5 value];
  }

  return v12;
}

- (void)setUpTableView
{
  id v3 = [(PHContactsAndBlockTableViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  id v5 = +[PHTableViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  id v6 = [(PHContactsAndBlockTableViewController *)self tableView];
  uint64_t v7 = objc_opt_class();
  v8 = +[PHBlockTableViewCell reuseIdentifier];
  [v6 registerClass:v7 forCellReuseIdentifier:v8];

  BOOL v9 = [(PHContactsAndBlockTableViewController *)self tableView];
  uint64_t v10 = objc_opt_class();
  long long v11 = +[PHReportTableViewCell reuseIdentifier];
  [v9 registerClass:v10 forCellReuseIdentifier:v11];

  id v12 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  double v13 = [(PHContactsAndBlockTableViewController *)self tableView];
  [v13 setTableFooterView:v12];

  [(PHContactsAndBlockTableViewController *)self setUpReportAndBlockSection];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A19C;
  block[3] = &unk_1000A1D50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)reportSectionNeedsUpdate
{
  id v3 = sub_100012C68();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "block cell update", buf, 2u);
  }

  uint64_t v4 = [(PHContactsAndBlockTableViewController *)self reportAndBlockSection];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [(PHContactsAndBlockTableViewController *)self reportAndBlockSection];
    uint64_t v7 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v6 count] - 1, 1);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003A340;
    v9[3] = &unk_1000A1E18;
    v9[4] = self;
    id v10 = v7;
    id v8 = v7;
    +[UIView performWithoutAnimation:v9];
  }
}

- (id)contactForContact:(id)a3 contactStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[CNUIFavoritesEntryPicker descriptorForRequiredKeys];
  v23 = v7;
  id v8 = +[NSArray arrayWithObjects:&v23 count:1];

  if ([v5 areKeysAvailable:v8])
  {
    id v9 = v5;
  }
  else
  {
    id v10 = +[NSMutableArray arrayWithArray:v8];
    long long v11 = [v5 availableKeyDescriptor];
    if (v11) {
      [v10 addObject:v11];
    }
    id v12 = [v5 identifier];
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

- (NSArray)unknownContacts
{
  return self->_unknownContacts;
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (PHContactsReportAndBlockTableViewModel)tableViewModel
{
  return self->_tableViewModel;
}

- (void)setTableViewModel:(id)a3
{
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (void)setRecentCall:(id)a3
{
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

- (NSMutableArray)reportAndBlockSection
{
  return self->_reportAndBlockSection;
}

- (void)setReportAndBlockSection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportAndBlockSection, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_avatarViewControllerSettings, 0);
  objc_storeStrong(&self->_customInfoButtonAction, 0);
  objc_storeStrong((id *)&self->_recentCall, 0);
  objc_storeStrong((id *)&self->_tableViewModel, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_unknownContacts, 0);

  objc_storeStrong((id *)&self->_contactArray, 0);
}

@end