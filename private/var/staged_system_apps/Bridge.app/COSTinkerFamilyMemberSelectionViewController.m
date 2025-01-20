@interface COSTinkerFamilyMemberSelectionViewController
- (COSTinkerFamilyMemberSelectionViewController)init;
- (id)detailString;
- (id)familyMemberAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)titleString;
- (int64_t)logicalSectionFromSectionNumber:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)sectionNumberFromSection:(int64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)showMustUnpairFirstAlert:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation COSTinkerFamilyMemberSelectionViewController

- (COSTinkerFamilyMemberSelectionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSTinkerFamilyMemberSelectionViewController;
  v2 = [(COSTinkerFamilyMemberSelectionViewController *)&v5 initWithTitle:&stru_100249230 detailText:0 icon:0 contentLayout:3];
  v3 = v2;
  if (v2) {
    [(COSTinkerFamilyMemberSelectionViewController *)v2 setStyle:0];
  }
  return v3;
}

- (void)viewDidLoad
{
  v67.receiver = self;
  v67.super_class = (Class)COSTinkerFamilyMemberSelectionViewController;
  [(COSTinkerFamilyMemberSelectionViewController *)&v67 viewDidLoad];
  v3 = [COSSelfSizingTableView alloc];
  v4 = [(COSTinkerFamilyMemberSelectionViewController *)self contentView];
  [v4 bounds];
  objc_super v5 = -[COSSelfSizingTableView initWithFrame:style:](v3, "initWithFrame:style:", 2);
  sub_100129630((uint64_t)self, v5);

  v6 = [(COSTinkerFamilyMemberSelectionViewController *)self contentView];
  v7 = v6;
  if (self)
  {
    [v6 addSubview:self->_tableView];

    tableView = self->_tableView;
  }
  else
  {
    [v6 addSubview:0];

    tableView = 0;
  }
  [(UITableView *)tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  v62 = [(COSTinkerFamilyMemberSelectionViewController *)self contentView];
  v9 = [v62 topAnchor];
  if (self) {
    v10 = self->_tableView;
  }
  else {
    v10 = 0;
  }
  v60 = v10;
  v59 = [(UITableView *)v60 topAnchor];
  v58 = [v9 constraintEqualToAnchor:];
  v68[0] = v58;
  v57 = [(COSTinkerFamilyMemberSelectionViewController *)self contentView];
  v11 = [v57 bottomAnchor];
  if (self) {
    v12 = self->_tableView;
  }
  else {
    v12 = 0;
  }
  v55 = v12;
  v54 = [(UITableView *)v55 bottomAnchor];
  v53 = [v11 constraintEqualToAnchor:];
  v68[1] = v53;
  v52 = [(COSTinkerFamilyMemberSelectionViewController *)self contentView];
  v13 = [v52 leadingAnchor];
  if (self) {
    v14 = self->_tableView;
  }
  else {
    v14 = 0;
  }
  v15 = v14;
  v16 = [(UITableView *)v15 leadingAnchor];
  v51 = v13;
  v17 = [v13 constraintEqualToAnchor:v16];
  v68[2] = v17;
  v18 = [(COSTinkerFamilyMemberSelectionViewController *)self contentView];
  v19 = [v18 trailingAnchor];
  v61 = v9;
  v56 = v11;
  if (self) {
    v20 = self->_tableView;
  }
  else {
    v20 = 0;
  }
  v21 = v20;
  v22 = [(UITableView *)v21 trailingAnchor];
  v23 = [v19 constraintEqualToAnchor:v22];
  v68[3] = v23;
  v24 = +[NSArray arrayWithObjects:v68 count:4];
  +[NSLayoutConstraint activateConstraints:v24];

  if (self)
  {
    v25 = &OBJC_IVAR___COSGlobalAlertPresentationCoordinator__pairedSyncSaysSyncNeeded;
    [(UITableView *)self->_tableView setScrollEnabled:0];
    v26 = self->_tableView;
  }
  else
  {
    [0 setScrollEnabled:0];
    v26 = 0;
    v25 = &OBJC_IVAR___COSGlobalAlertPresentationCoordinator__pairedSyncSaysSyncNeeded;
  }
  v27 = v26;
  uint64_t v28 = objc_opt_class();
  v29 = (objc_class *)objc_opt_class();
  v30 = NSStringFromClass(v29);
  [(UITableView *)v27 registerClass:v28 forCellReuseIdentifier:v30];

  if (self) {
    v31 = *(void **)&self->super.BPSWelcomeOptinViewController_opaque[v25[470]];
  }
  else {
    v31 = 0;
  }
  id v32 = v31;
  [v32 registerClass:objc_opt_class() forCellReuseIdentifier:@"AddNewCellIdentifier"];

  if (self)
  {
    [*(id *)&self->super.BPSWelcomeOptinViewController_opaque[v25[470]] setRowHeight:UITableViewAutomaticDimension];
    v33 = *(void **)&self->super.BPSWelcomeOptinViewController_opaque[v25[470]];
  }
  else
  {
    [0 setRowHeight:UITableViewAutomaticDimension];
    v33 = 0;
  }
  [v33 setDelegate:self];
  if (self) {
    v34 = *(void **)&self->super.BPSWelcomeOptinViewController_opaque[v25[470]];
  }
  else {
    v34 = 0;
  }
  [v34 setDataSource:self];
  v35 = [UIApp setupController];
  v36 = [v35 activePairingDevice];

  v37 = [v36 valueForProperty:NRDevicePropertySerialNumber];
  sub_100129648((uint64_t)self, v37);

  v38 = [UIApp setupController];
  v39 = [v38 familyCircle];

  v40 = sub_10001284C();
  v41 = +[NSMutableArray array];
  v42 = +[NSMutableDictionary dictionary];
  v43 = [v39 members];
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100129660;
  v63[3] = &unk_100247D18;
  id v44 = v41;
  id v64 = v44;
  id v65 = v40;
  id v45 = v42;
  id v66 = v45;
  id v46 = v40;
  [v43 enumerateObjectsUsingBlock:v63];

  sub_1001297F0((uint64_t)self, v44);
  sub_100129808((uint64_t)self, v45);
  v47 = [v39 members];
  id v48 = [v47 count];
  if (self)
  {
    self->_familyAtMaximumSize = (unint64_t)v48 >= 6;

    v49 = *(void **)&self->super.BPSWelcomeOptinViewController_opaque[v25[470]];
  }
  else
  {

    v49 = 0;
  }
  [v49 reloadData];
  v50 = +[NSNotificationCenter defaultCenter];
  [v50 addObserver:self selector:"contentSizeCategoryDidChangeNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)COSTinkerFamilyMemberSelectionViewController;
  [(COSTinkerFamilyMemberSelectionViewController *)&v8 viewDidAppear:a3];
  if (self)
  {
    v4 = self->_tableView;
    tableView = self->_tableView;
  }
  else
  {
    v4 = 0;
    tableView = 0;
  }
  v6 = tableView;
  v7 = [(UITableView *)v6 indexPathForSelectedRow];
  [(UITableView *)v4 deselectRowAtIndexPath:v7 animated:1];
}

- (int64_t)logicalSectionFromSectionNumber:(int64_t)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  if (self) {
    familyMembers = self->_familyMembers;
  }
  else {
    familyMembers = 0;
  }
  v6 = familyMembers;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    int64_t v25 = a3;
    uint64_t v26 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v28;
    uint64_t v11 = NRDevicePropertySerialNumber;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v12);
        if (self) {
          pairedTinkerDevices = self->_pairedTinkerDevices;
        }
        else {
          pairedTinkerDevices = 0;
        }
        v15 = pairedTinkerDevices;
        v16 = [v13 appleID];
        v17 = [(NSDictionary *)v15 objectForKey:v16];

        v18 = [v17 valueForProperty:v11];
        v19 = v18;
        if (v17
          && (!self
            ? (activePairingDeviceSerialNumber = 0)
            : (activePairingDeviceSerialNumber = self->_activePairingDeviceSerialNumber),
              (objc_msgSend(v18, "isEqualToString:", activePairingDeviceSerialNumber, v25) & 1) == 0))
        {
          ++v26;
        }
        else
        {
          ++v9;
        }

        v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v21 = [(NSArray *)v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v8 = v21;
    }
    while (v21);

    a3 = v25;
    int64_t v22 = 1;
    if (v26 < 1) {
      int64_t v22 = 2;
    }
    if (v9 <= 0)
    {
      int64_t v23 = v22;
      int64_t v22 = 2 * (v26 > 0);
    }
    else
    {
      int64_t v23 = 0;
    }
  }
  else
  {

    int64_t v22 = 0;
    int64_t v23 = 2;
  }
  if (a3 != 1) {
    int64_t v22 = 2;
  }
  if (a3) {
    return v22;
  }
  else {
    return v23;
  }
}

- (int64_t)sectionNumberFromSection:(int64_t)a3
{
  int64_t v5 = 0;
  while ([(COSTinkerFamilyMemberSelectionViewController *)self logicalSectionFromSectionNumber:v5] != a3)
  {
    if (++v5 == 3) {
      return 0;
    }
  }
  return v5;
}

- (id)familyMemberAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[COSTinkerFamilyMemberSelectionViewController logicalSectionFromSectionNumber:](self, "logicalSectionFromSectionNumber:", [v4 section]);
  id v6 = [v4 row];

  if (self) {
    activePairingDeviceSerialNumber = self->_activePairingDeviceSerialNumber;
  }
  else {
    activePairingDeviceSerialNumber = 0;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100129C5C;
  v12[3] = &unk_100247D40;
  v12[4] = self;
  v13 = activePairingDeviceSerialNumber;
  id v8 = v13;
  uint64_t v9 = objc_retainBlock(v12);
  uint64_t v10 = ((void (*)(void *, id, BOOL))v9[2])(v9, v6, v5 == 0);

  return v10;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"TINKER_FAMILY_MEMBERS_NAV_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"TINKER_FAMILY_MEMBERS_DETAIL" value:&stru_100249230 table:@"Localizable-tinker"];

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(COSTinkerFamilyMemberSelectionViewController *)self sectionNumberFromSection:2]+ 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int64_t v23 = [(COSTinkerFamilyMemberSelectionViewController *)self logicalSectionFromSectionNumber:a4];
  if (self) {
    familyMembers = self->_familyMembers;
  }
  else {
    familyMembers = 0;
  }
  obj = familyMembers;
  id v6 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    int64_t v8 = 0;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v26;
    uint64_t v11 = NRDevicePropertySerialNumber;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v12);
        if (self) {
          pairedTinkerDevices = self->_pairedTinkerDevices;
        }
        else {
          pairedTinkerDevices = 0;
        }
        v15 = pairedTinkerDevices;
        v16 = [v13 appleID];
        v17 = [(NSDictionary *)v15 objectForKey:v16];

        v18 = [v17 valueForProperty:v11];
        v19 = v18;
        if (v17
          && (!self
            ? (activePairingDeviceSerialNumber = 0)
            : (activePairingDeviceSerialNumber = self->_activePairingDeviceSerialNumber),
              (objc_msgSend(v18, "isEqualToString:", activePairingDeviceSerialNumber, v23) & 1) == 0))
        {
          ++v8;
        }
        else
        {
          ++v9;
        }

        v12 = (char *)v12 + 1;
      }
      while (v7 != v12);
      id v21 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      id v7 = v21;
    }
    while (v21);
  }
  else
  {
    int64_t v8 = 0;
    int64_t v9 = 0;
  }

  if (v23)
  {
    if (v23 == 2)
    {
      return 1;
    }
    else
    {
      int64_t v9 = v8;
      if (v23 != 1) {
        return 0;
      }
    }
  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[COSTinkerFamilyMemberSelectionViewController logicalSectionFromSectionNumber:](self, "logicalSectionFromSectionNumber:", [v7 section]);
  if (v8 == 2)
  {
    int64_t v9 = [v6 dequeueReusableCellWithIdentifier:@"AddNewCellIdentifier"];
    uint64_t v10 = +[UIImage systemImageNamed:@"plus.circle.fill"];
    uint64_t v11 = [v9 imageView];
    [v11 setImage:v10];

    if (self && self->_familyAtMaximumSize)
    {
      uint64_t v12 = +[UIColor systemDarkGrayColor];
    }
    else
    {
      uint64_t v12 = +[UIColor systemOrangeColor];
    }
    v17 = (void *)v12;
    v18 = [v9 textLabel];
    [v18 setTextColor:v17];

    if (self && self->_familyAtMaximumSize)
    {
      v19 = +[UIColor systemDarkGrayColor];
      int v20 = 1;
    }
    else
    {
      int v20 = 0;
      v19 = 0;
    }
    id v21 = [v9 imageView];
    [v21 setTintColor:v19];

    if (v20) {
    int64_t v22 = +[NSBundle mainBundle];
    }
    int64_t v23 = [v22 localizedStringForKey:@"TINKER_ACCOUNT_CREATE" value:&stru_100249230 table:@"Localizable-tinker"];
    v24 = [v9 textLabel];
    [v24 setText:v23];

    long long v25 = [v9 textLabel];
    [v25 setNumberOfLines:0];

    if (self) {
      BOOL v26 = !self->_familyAtMaximumSize;
    }
    else {
      BOOL v26 = 1;
    }
    [v9 setEnabled:v26];
  }
  else
  {
    BOOL v13 = v8 == 1;
    v14 = [(COSTinkerFamilyMemberSelectionViewController *)self familyMemberAtIndexPath:v7];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    int64_t v9 = [v6 dequeueReusableCellWithIdentifier:v16];

    sub_100128C38((uint64_t)v9, v14, v13);
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v4 = [(COSTinkerFamilyMemberSelectionViewController *)self logicalSectionFromSectionNumber:a4];
  if (v4 == 1)
  {
    int64_t v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"TINKER_FAMILY_MEMBER_ALREADY_SETUP_HEADER";
    goto LABEL_5;
  }
  if (!v4)
  {
    int64_t v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"TINKER_FAMILY_MEMBER_READY_FOR_SETUP_HEADER";
LABEL_5:
    int64_t v8 = [v5 localizedStringForKey:v7 value:&stru_100249230 table:@"Localizable-tinker"];

    goto LABEL_7;
  }
  int64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int64_t v4 = [(COSTinkerFamilyMemberSelectionViewController *)self logicalSectionFromSectionNumber:a4];
  if (v4 == 2)
  {
    int64_t v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"TINKER_FAMILY_MEMBER_ADD_FOOTER";
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    int64_t v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"TINKER_FAMILY_MEMBER_ALREADY_SETUP_FOOTER";
LABEL_5:
    int64_t v8 = [v5 localizedStringForKey:v7 value:&stru_100249230 table:@"Localizable-tinker"];

    goto LABEL_7;
  }
  int64_t v8 = 0;
LABEL_7:

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = -[COSTinkerFamilyMemberSelectionViewController logicalSectionFromSectionNumber:](self, "logicalSectionFromSectionNumber:", [v5 section]);
  if (v6 == 2)
  {
    CFStringRef v7 = pbb_accountsignin_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating a new family member", (uint8_t *)&v16, 2u);
    }

    int64_t v8 = [UIApp setupController];
    [v8 setTinkerFamilyMember:0];

    int64_t v9 = [(COSTinkerFamilyMemberSelectionViewController *)self delegate];
    [v9 buddyControllerDone:self nextControllerClass:objc_opt_class()];
  }
  else
  {
    int64_t v10 = v6;
    int64_t v9 = [(COSTinkerFamilyMemberSelectionViewController *)self familyMemberAtIndexPath:v5];
    if (v10 == 1)
    {
      [(COSTinkerFamilyMemberSelectionViewController *)self showMustUnpairFirstAlert:v9];
      if (self) {
        tableView = self->_tableView;
      }
      else {
        tableView = 0;
      }
      [(UITableView *)tableView deselectRowAtIndexPath:v5 animated:1];
    }
    else
    {
      uint64_t v12 = pbb_accountsignin_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = [v9 appleID];
        int v16 = 138412290;
        v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Selected family member -- %@", (uint8_t *)&v16, 0xCu);
      }
      v14 = [UIApp setupController];
      [v14 setTinkerFamilyMember:v9];

      v15 = [(COSTinkerFamilyMemberSelectionViewController *)self delegate];
      [v15 buddyControllerDone:self];
    }
  }
}

- (void)showMustUnpairFirstAlert:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v14 = [v5 localizedStringForKey:@"TINKER_FAMILY_MEMBER_UNPAIR_FIRST_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];

  int64_t v6 = +[NSBundle mainBundle];
  CFStringRef v7 = [v6 localizedStringForKey:@"TINKER_FAMILY_MEMBER_UNPAIR_FIRST_DETAIL" value:&stru_100249230 table:@"Localizable-tinker"];
  int64_t v8 = [v4 firstName];

  int64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

  int64_t v10 = +[UIAlertController alertControllerWithTitle:v14 message:v9 preferredStyle:1];
  uint64_t v11 = +[NSBundle mainBundle];
  uint64_t v12 = [v11 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  BOOL v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:0];
  [v10 addAction:v13];

  [(COSTinkerFamilyMemberSelectionViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  if (self) {
    self = (COSTinkerFamilyMemberSelectionViewController *)self->_tableView;
  }
  [(COSTinkerFamilyMemberSelectionViewController *)self reloadData];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_activePairingDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_pairedTinkerDevices, 0);

  objc_storeStrong((id *)&self->_familyMembers, 0);
}

@end