@interface MFVIPSendersListTableViewController
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (BOOL)shouldAutorotate;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (EFCancelable)tableViewObserver;
- (MFVIPSendersListTableViewController)initWithStyle:(int64_t)a3;
- (UIBarButtonItem)dismissButtonItem;
- (double)preferredNoContentViewHeight;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_labelWithPreferenceStyleFormattingForString:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)sectionCount;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addNewVIPSender;
- (void)_copyUnknownPersonForVIP:(id)a3;
- (void)_dismissButtonTapped:(id)a3;
- (void)_dismissIfNeeded;
- (void)_refreshVIPSendersList;
- (void)_updateVIPSendersList:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)dismissContactPicker:(id)a3;
- (void)setDismissButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setSectionCount:(int64_t)a3;
- (void)setTableViewObserver:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MFVIPSendersListTableViewController

- (MFVIPSendersListTableViewController)initWithStyle:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MFVIPSendersListTableViewController;
  v3 = [(MFVIPSendersListTableViewController *)&v14 initWithStyle:a3];
  if (v3)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"VIP_EDIT" value:&stru_100619928 table:@"Main"];
    [(MFVIPSendersListTableViewController *)v3 setTitle:v5];

    [(MFVIPSendersListTableViewController *)v3 setHidesBottomBarWhenPushed:1];
    v6 = +[VIPManager defaultInstance];
    v7 = [v6 sortedVIPs];
    v8 = (NSMutableArray *)[v7 mutableCopy];
    allVIPs = v3->_allVIPs;
    v3->_allVIPs = v8;

    v10 = +[NSNotificationCenter defaultCenter];
    v11 = +[VIPManager defaultInstance];
    [v10 addObserver:v3 selector:"_updateVIPSendersList:" name:EMVIPsDidChangeNotification object:v11];

    if ([(NSMutableArray *)v3->_allVIPs count]) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    [(MFVIPSendersListTableViewController *)v3 setSectionCount:v12];
  }
  return v3;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)MFVIPSendersListTableViewController;
  [(MFVIPSendersListTableViewController *)&v16 viewDidLoad];
  [(MFVIPSendersListTableViewController *)self setClearsSelectionOnViewWillAppear:0];
  if ([(NSMutableArray *)self->_allVIPs count])
  {
    v3 = [(MFVIPSendersListTableViewController *)self dismissButtonItem];
    +[UIBarButtonItem mf_configureMultiBarButtonItem:v3 usingStyle:1];

    v4 = [(MFVIPSendersListTableViewController *)self dismissButtonItem];
    v5 = [(MFVIPSendersListTableViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v4];

    v6 = [(MFVIPSendersListTableViewController *)self editButtonItem];
    v7 = [(MFVIPSendersListTableViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:v6];

    v8 = [(MFVIPSendersListTableViewController *)self tableView];
    [v8 setScrollEnabled:1];

    v9 = [(MFVIPSendersListTableViewController *)self tableView];
    [v9 flashScrollIndicators];
  }
  else
  {
    v10 = [(MFVIPSendersListTableViewController *)self navigationItem];
    [v10 setRightBarButtonItem:0];

    v11 = [(MFVIPSendersListTableViewController *)self view];
    uint64_t v12 = [v11 window];
    v13 = [v12 windowScene];
    objc_super v14 = (char *)[v13 interfaceOrientation];

    v15 = [(MFVIPSendersListTableViewController *)self tableView];
    v9 = v15;
    if ((unint64_t)(v14 - 1) > 1)
    {
      [v15 setScrollEnabled:1];

      v9 = [(MFVIPSendersListTableViewController *)self tableView];
      [v9 flashScrollIndicators];
    }
    else
    {
      [v15 setScrollEnabled:0];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFVIPSendersListTableViewController;
  -[MFVIPSendersListTableViewController viewWillAppear:](&v6, "viewWillAppear:");
  [(MFVIPSendersListTableViewController *)self focus:v3];
  if ([(NSMutableArray *)self->_allVIPs count])
  {
    v5 = [(MFVIPSendersListTableViewController *)self mf_updatePreferredContentSizeBasedOnTableView];
    [(MFVIPSendersListTableViewController *)self setTableViewObserver:v5];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFVIPSendersListTableViewController;
  -[MFVIPSendersListTableViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  if (([(MFVIPSendersListTableViewController *)self isBeingDismissed] & 1) != 0
    || [(MFVIPSendersListTableViewController *)self isMovingFromParentViewController])
  {
    [(MFVIPSendersListTableViewController *)self unfocus:v3];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFVIPSendersListTableViewController;
  [(MFVIPSendersListTableViewController *)&v5 traitCollectionDidChange:v4];
  [(MFVIPSendersListTableViewController *)self mf_updateTableViewBackgroundColorForPopover];
}

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad] ^ 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if (self->_sectionCount == 1)
  {
    v8 = [(MFVIPSendersListTableViewController *)self tableView];
    [v8 setScrollEnabled:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)MFVIPSendersListTableViewController;
  -[MFVIPSendersListTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFVIPSendersListTableViewController;
  -[MFVIPSendersListTableViewController setEditing:animated:](&v10, "setEditing:animated:");
  if ([(NSMutableArray *)self->_allVIPs count])
  {
    if (v5) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 1;
    }
    v8 = [(MFVIPSendersListTableViewController *)self dismissButtonItem];
    +[UIBarButtonItem mf_configureMultiBarButtonItem:v8 usingStyle:v7];
  }
  objc_super v9 = [(MFVIPSendersListTableViewController *)self navigationItem];
  [v9 setHidesBackButton:v5 animated:v4];
}

- (double)preferredNoContentViewHeight
{
  BOOL v3 = [(MFVIPSendersListTableViewController *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];
  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraLarge);

  if (v5 == NSOrderedAscending) {
    return 203.5;
  }
  objc_super v6 = [(MFVIPSendersListTableViewController *)self traitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];
  BOOL v8 = UIContentSizeCategoryCompareToCategory(v7, UIContentSizeCategoryAccessibilityLarge) == NSOrderedAscending;

  return dbl_1005A8400[v8];
}

- (void)setSectionCount:(int64_t)a3
{
  if (self->_sectionCount != a3)
  {
    self->_sectionCount = a3;
    [(MFVIPSendersListTableViewController *)self preferredContentSize];
    double v6 = v5;
    double v7 = 0.0;
    if (a3 == 1)
    {
      [(MFVIPSendersListTableViewController *)self preferredNoContentViewHeight];
      double v7 = v8;
    }
    -[MFVIPSendersListTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v7);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((id)[(MFVIPSendersListTableViewController *)self sectionCount] != (id)2) {
    return 0;
  }
  if (a4) {
    return 1;
  }
  return (int64_t)[(NSMutableArray *)self->_allVIPs count] + 1;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = (char *)[v5 section];
  LOBYTE(self) = (uint64_t)v6 < (uint64_t)((char *)[(MFVIPSendersListTableViewController *)self sectionCount]- 1);

  return (char)self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 dequeueReusableCellWithIdentifier:@"Cell"];
  if (!v8) {
    double v8 = [[MFTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"Cell"];
  }
  [(MFTableViewCell *)v8 setSelectionStyle:1];
  [(MFTableViewCell *)v8 setAccessoryType:0];
  objc_super v9 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0x8000 options:2];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10020673C;
  v17[3] = &unk_10060DAB8;
  objc_copyWeak(&v22, &location);
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  id v11 = v6;
  id v20 = v11;
  uint64_t v12 = v8;
  v21 = v12;
  id v13 = v9;
  [(MFTableViewCell *)v12 mf_updateContentConfigurationWithBlock:v17];
  objc_super v14 = v21;
  v15 = v12;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v15;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v5 = [(MFVIPSendersListTableViewController *)self sectionCount];
  id v6 = 0;
  if (a4 == 1 && v5 >= 2)
  {
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v7 localizedStringForKey:@"VIP_CUSTOM_ALERT_EXPLANATION" value:&stru_100619928 table:@"Main"];
  }

  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  int64_t v5 = [(MFVIPSendersListTableViewController *)self sectionCount];
  double result = 0.0;
  if (v5 == 1)
  {
    [(MFVIPSendersListTableViewController *)self preferredContentSize];
    return v7;
  }
  return result;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4 == 1)
  {
    id v11 = -[NSMutableArray objectAtIndex:](self->_allVIPs, "objectAtIndex:", [v9 row]);
    uint64_t v12 = [v11 identifier];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100206D88;
    v16[3] = &unk_100604668;
    v16[4] = self;
    id v17 = v10;
    id v18 = v8;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100206E5C;
    v14[3] = &unk_100604550;
    id v15 = v12;
    id v13 = v12;
    [v18 _performBatchUpdates:v16 completion:v14];
  }
}

- (void)_dismissIfNeeded
{
  if (![(NSMutableArray *)self->_allVIPs count])
  {
    [(MFVIPSendersListTableViewController *)self dismissViewControllerAnimated:1 completion:&stru_10060DAD8];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(MFVIPSendersListTableViewController *)self sectionCount] < 2
    || [v5 section]
    || (id v6 = [v5 row], v6 != -[NSMutableArray count](self->_allVIPs, "count")))
  {
    id v8 = (char *)[v5 section];
    int64_t v7 = v8 != (char *)[(MFVIPSendersListTableViewController *)self sectionCount] - 1;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MFVIPSendersListTableViewController *)self sectionCount] < 2) {
    goto LABEL_4;
  }
  if ([v7 section])
  {
    id v8 = +[MFPreferencesURL vipSenderListURL];
    id v9 = +[LSApplicationWorkspace defaultWorkspace];
    [v9 openSensitiveURL:v8 withOptions:0];

    goto LABEL_5;
  }
  id v10 = [v7 row];
  if (v10 == [(NSMutableArray *)self->_allVIPs count])
  {
LABEL_4:
    [(MFVIPSendersListTableViewController *)self _addNewVIPSender];
    goto LABEL_5;
  }
  v34 = -[NSMutableArray objectAtIndex:](self->_allVIPs, "objectAtIndex:", [v7 row]);
  id v11 = +[VIPManager defaultInstance];
  uint64_t v12 = +[MFAddressBookManager sharedManager];
  id v13 = [v11 existingPersonForVIP:v34 usingAddressBook:[v12 addressBook]];

  objc_super v14 = [(MFVIPSendersListTableViewController *)self _copyUnknownPersonForVIP:v34];
  id v15 = [v34 emailAddresses];
  if ([v15 count]) {
    unsigned __int8 v16 = +[MFContactsManager isAuthorizedToUseContacts];
  }
  else {
    unsigned __int8 v16 = 0;
  }

  if (v13)
  {
    CFDataRef v17 = ABPersonCopyImageData(v13);
    if (v17)
    {
      ABPersonSetImageData(v14, v17, 0);
      CFRelease(v17);
    }
    CFTypeRef v18 = ABRecordCopyValue(v14, kABPersonEmailProperty);
    id v19 = v18;
    if (v18)
    {
      ABMutableMultiValueRef MutableCopy = ABMultiValueCreateMutableCopy(v18);
      if (MutableCopy)
      {
        CFTypeRef v21 = ABRecordCopyValue(v13, kABPersonEmailProperty);
        id v22 = v21;
        ABRecordRef record = v14;
        if (v21)
        {
          CFArrayRef v23 = ABMultiValueCopyArrayOfAllValues(v21);
          if (v23)
          {
            for (CFIndex i = 0; i < CFArrayGetCount(v23); ++i)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(v23, i);
              CFIndex FirstIndexOfValue = ABMultiValueGetFirstIndexOfValue(MutableCopy, ValueAtIndex);
              if (FirstIndexOfValue != -1)
              {
                CFStringRef v27 = ABMultiValueCopyLabelAtIndex(v22, i);
                if (v27)
                {
                  ABMultiValueReplaceLabelAtIndex(MutableCopy, v27, FirstIndexOfValue);
                  CFRelease(v27);
                }
              }
            }
            ABRecordSetValue(record, kABPersonEmailProperty, MutableCopy, 0);
            CFRelease(v23);
          }
          CFRelease(v22);
        }
        CFRelease(MutableCopy);
        objc_super v14 = (void *)record;
      }
      CFRelease(v19);
    }
    unsigned __int8 v16 = 0;
  }
  v28 = +[CNContactViewController descriptorForRequiredKeys];
  v35 = v28;
  v29 = +[NSArray arrayWithObjects:&v35 count:1];
  v30 = +[CNContact contactFromPerson:v14 keysToFetch:v29];

  v31 = +[CNContactViewController viewControllerForUnknownContact:v30];
  [v31 setDelegate:self];
  if ((v16 & 1) == 0) {
    [v31 setActions:[v31 actions] & 0xFFFFFFFFFFFFFFDFLL];
  }
  [v31 _setDataOwnerForCopy:3];
  [v31 _setDataOwnerForPaste:3];
  v32 = [(MFVIPSendersListTableViewController *)self navigationController];
  [v32 pushViewController:v31 animated:1];

  CFRelease(v14);
LABEL_5:
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  [v6 mf_updateBackgroundColorForPopover:[self mf_supportsPopoverPresentation]];
}

- (void)_copyUnknownPersonForVIP:(id)a3
{
  id v3 = a3;
  ABRecordRef v4 = ABPersonCreate();
  id v5 = [v3 name];

  if (v5)
  {
    id v6 = [v3 name];
    id v7 = [v6 ec_personNameComponents];

    id v8 = [v7 namePrefix];
    ABRecordSetValue(v4, kABPersonPrefixProperty, v8, 0);

    id v9 = [v7 givenName];
    ABRecordSetValue(v4, kABPersonFirstNameProperty, v9, 0);

    id v10 = [v7 middleName];
    ABRecordSetValue(v4, kABPersonMiddleNameProperty, v10, 0);

    id v11 = [v7 familyName];
    ABRecordSetValue(v4, kABPersonLastNameProperty, v11, 0);

    uint64_t v12 = [v7 nameSuffix];
    ABRecordSetValue(v4, kABPersonSuffixProperty, v12, 0);
  }
  ABMutableMultiValueRef Mutable = ABMultiValueCreateMutable(1u);
  if (Mutable)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v14 = objc_msgSend(v3, "emailAddresses", 0);
    id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v20;
      do
      {
        CFDataRef v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v14);
          }
          ABMultiValueAddValueAndLabel(Mutable, *(CFTypeRef *)(*((void *)&v19 + 1) + 8 * (void)v17), kABOtherLabel, 0);
          CFDataRef v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }

    ABRecordSetValue(v4, kABPersonEmailProperty, Mutable, 0);
    CFRelease(Mutable);
  }

  return (void *)v4;
}

- (UIBarButtonItem)dismissButtonItem
{
  dismissButtonItem = self->_dismissButtonItem;
  if (!dismissButtonItem)
  {
    ABRecordRef v4 = +[UIBarButtonItem mf_newMultiBarButtonItemWithTarget:self action:"_dismissButtonTapped:"];
    id v5 = self->_dismissButtonItem;
    self->_dismissButtonItem = v4;

    dismissButtonItem = self->_dismissButtonItem;
  }

  return dismissButtonItem;
}

- (void)_addNewVIPSender
{
  id v6 = objc_alloc_init((Class)CNContactPickerViewController);
  [v6 setDelegate:self];
  id v3 = +[VIPManager defaultInstance];
  ABRecordRef v4 = [v3 allVIPEmailAddresses];

  id v5 = +[NSPredicate predicateWithFormat:@"emailAddresses.@count > 0 AND NONE emailAddresses.value IN %@", v4];
  [v6 setPredicateForEnablingContact:v5];

  [(MFVIPSendersListTableViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  if ([(NSMutableArray *)self->_allVIPs count])
  {
    ABRecordRef v4 = 0;
  }
  else
  {
    id v5 = +[UIContentUnavailableConfiguration emptyConfiguration];
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"VIP_MAILBOX" value:&stru_100619928 table:@"Main"];
    [v5 setText:v7];

    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"VIP_FIRST_PART_EXPLANATION" value:&stru_100619928 table:@"Main"];
    [v5 setSecondaryText:v9];

    id v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"VIP_ADD_PERSON" value:&stru_100619928 table:@"Main"];
    uint64_t v12 = [v5 button];
    [v12 setTitle:v11];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    CFDataRef v17 = sub_100207C5C;
    CFTypeRef v18 = &unk_1006070F8;
    objc_copyWeak(&v19, &location);
    id v13 = +[UIAction actionWithHandler:&v15];
    objc_super v14 = [v5 buttonProperties:v15, v16, v17, v18];
    [v14 setPrimaryAction:v13];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    ABRecordRef v4 = v5;
  }
  [(MFVIPSendersListTableViewController *)self setContentUnavailableConfiguration:v4];
}

- (void)_refreshVIPSendersList
{
  id v3 = +[VIPManager defaultInstance];
  ABRecordRef v4 = [v3 sortedVIPs];
  id v5 = (NSMutableArray *)[v4 mutableCopy];
  allVIPs = self->_allVIPs;
  self->_allVIPs = v5;

  [(MFVIPSendersListTableViewController *)self setNeedsUpdateContentUnavailableConfiguration];
}

- (void)_updateVIPSendersList:(id)a3
{
  id v4 = [(NSMutableArray *)self->_allVIPs count];
  [(MFVIPSendersListTableViewController *)self _refreshVIPSendersList];
  if (!v4 && [(NSMutableArray *)self->_allVIPs count]) {
    [(MFVIPSendersListTableViewController *)self setSectionCount:2];
  }
  id v7 = [(MFVIPSendersListTableViewController *)self tableView];
  [v7 reloadData];

  if ([(NSMutableArray *)self->_allVIPs count])
  {
    [(MFVIPSendersListTableViewController *)self isEditing];
    id v8 = [(MFVIPSendersListTableViewController *)self dismissButtonItem];
    +[UIBarButtonItem mf_configureMultiBarButtonItem:usingStyle:](UIBarButtonItem, "mf_configureMultiBarButtonItem:usingStyle:");

    id v9 = [(MFVIPSendersListTableViewController *)self dismissButtonItem];
    id v5 = [(MFVIPSendersListTableViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v9];

    id v10 = [(MFVIPSendersListTableViewController *)self editButtonItem];
    id v6 = [(MFVIPSendersListTableViewController *)self navigationItem];
    [v6 setLeftBarButtonItem:v10];

    id v11 = [(MFVIPSendersListTableViewController *)self tableView];
    [v11 setScrollEnabled:1];
  }
  else
  {
    id v12 = [(MFVIPSendersListTableViewController *)self navigationItem];
    [v12 setRightBarButtonItem:0];

    [(MFVIPSendersListTableViewController *)self setEditing:0];
  }
}

- (id)_labelWithPreferenceStyleFormattingForString:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v4 setText:v3];
  id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline2];
  [v4 setFont:v5];

  id v6 = +[UIColor colorWithWhite:0.5 alpha:1.0];
  [v4 setTextColor:v6];

  [v4 setLineBreakMode:0];
  [v4 setNumberOfLines:0];

  return v4;
}

- (void)_dismissButtonTapped:(id)a3
{
}

- (void)dismissContactPicker:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    [v5 setDelegate:0];
    id v4 = [(MFVIPSendersListTableViewController *)self presentedViewController];

    if (v4) {
      [(MFVIPSendersListTableViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v22 = a3;
  id v21 = a4;
  id v6 = objc_alloc_init((Class)CNContactStore);
  id v7 = [v6 personFromContact:v21];
  id v8 = (__CFString *)ABRecordCopyCompositeName(v7);
  id v9 = objc_alloc_init((Class)NSMutableArray);
  CFArrayRef v10 = ABPersonCopyArrayOfAllLinkedPeople(v7);
  CFArrayRef v11 = v10;
  if (v10)
  {
    CFIndex Count = CFArrayGetCount(v10);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v11, i);
        CFTypeRef v15 = ABRecordCopyValue(ValueAtIndex, kABPersonEmailProperty);
        uint64_t v16 = v15;
        if (v15)
        {
          CFArrayRef v17 = ABMultiValueCopyArrayOfAllValues(v15);
          [v9 addObjectsFromArray:v17, v21];
          CFRelease(v16);
        }
      }
    }
    CFRelease(v11);
  }
  id v18 = [objc_alloc((Class)EAEmailAddressSet) initWithArray:v9];
  id v19 = [objc_alloc((Class)EMVIP) initWithIdentifier:0 name:v8 emailAddresses:v18];
  long long v20 = +[VIPManager defaultInstance];
  [v20 saveVIP:v19];

  [(MFVIPSendersListTableViewController *)self dismissContactPicker:v22];
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v5 = [(MFVIPSendersListTableViewController *)self navigationController];
  id v4 = [v5 popViewControllerAnimated:0];
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 0;
}

- (EFCancelable)tableViewObserver
{
  return self->_tableViewObserver;
}

- (void)setTableViewObserver:(id)a3
{
}

- (int64_t)sectionCount
{
  return self->_sectionCount;
}

- (void)setDismissButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButtonItem, 0);
  objc_storeStrong((id *)&self->_tableViewObserver, 0);

  objc_storeStrong((id *)&self->_allVIPs, 0);
}

@end