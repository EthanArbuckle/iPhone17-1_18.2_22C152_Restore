@interface ContactsSplitViewController
+ (id)newContactStoreDataSourceForSplitViewController;
+ (id)prewarmContactStoreDataSourceBlock;
+ (id)prewarmContactStoreDataSourceSnapshotBlock;
+ (id)prewarmedContactStoreDataSource;
+ (id)resourcesPrewarmingQueue;
+ (void)disableCompatiblityWorkaround;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)contactNavigationController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5;
- (BOOL)contactNavigationController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 dismissingPresentedController:(BOOL)a6 shouldHideContactListIfNeeded:(BOOL)a7;
- (BOOL)contactNavigationControllerShouldManageGroupsController:(id)a3;
- (BOOL)contactViewIsCovered;
- (BOOL)groupsPanelIsHidden;
- (BOOL)isSetupFinished;
- (BOOL)isShowingGroups;
- (BOOL)isShowingListView;
- (CNContact)displayedContact;
- (CNContact)restoredContact;
- (CNContact)unsavedContact;
- (CNContactListCollectionView)contactsList;
- (CNContactNavigationController)contactNavigationController;
- (CNContactStore)store;
- (CNContactStoreDataSource)dataSource;
- (CNContactViewController)presentedContactViewController;
- (CNSharedProfileOnboardingController)onboardingController;
- (ContactsCardNavigationController)contactContainer;
- (ContactsSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ContactsSplitViewController)initWithStyle:(int64_t)a3;
- (NSIndexPath)selectedIndexPath;
- (UINavigationController)groupsNavigationController;
- (UINavigationController)potentiallyPresentedDetailViewController;
- (id)_multitaskingDragExclusionRects;
- (id)navigationControllerForPPT;
- (id)navigationControllerForPotentiallyWrappedViewController:(id)a3;
- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (void)_cancelOutstandingSearch;
- (void)addContact:(id)a3;
- (void)beginSearch:(id)a3;
- (void)cancelSearch;
- (void)contactNavigationController:(id)a3 didDeleteContact:(id)a4;
- (void)contactNavigationControllerClearContactSelection:(id)a3;
- (void)createNewContact;
- (void)dealloc;
- (void)deleteContact:(id)a3;
- (void)deselectContactAndSelectNext:(BOOL)a3;
- (void)onboardingControllerDidFinishSetup:(id)a3;
- (void)presentAddContactViewController:(id)a3 animated:(BOOL)a4;
- (void)removeContactViewController;
- (void)resetContactViewController;
- (void)saveEditingViewControllersAndDismissViewController:(id)a3;
- (void)searchForString:(id)a3;
- (void)selectNextContact:(id)a3;
- (void)selectPreviousContact:(id)a3;
- (void)setContactNavigationController:(id)a3;
- (void)setDisplayedContact:(id)a3;
- (void)setGroupsNavigationController:(id)a3;
- (void)setIsSetupFinished:(BOOL)a3;
- (void)setOnboardingController:(id)a3;
- (void)setPotentiallyPresentedDetailViewController:(id)a3;
- (void)setRestoredContact:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setup;
- (void)setupColumns;
- (void)setupContainerController;
- (void)setupGroupsNavigationController;
- (void)setupKeyCommands;
- (void)setupNavigationController;
- (void)setupPrimaryColumnViewController;
- (void)setupSplitViewControllerProperties;
- (void)showCardForContact:(id)a3 fallbackToFirstContact:(BOOL)a4;
- (void)showContactDetailViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 dismissingPresentedController:(BOOL)a6;
- (void)showContactList;
- (void)showDetailTargetDidChange:(id)a3;
- (void)showEditingCardForContact:(id)a3;
- (void)showGroupsAnimated:(BOOL)a3;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)toggleGroupsPanel;
- (void)toggleGroupsPanel:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)updateModeOnSplitViewControllerForDisplayMode:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ContactsSplitViewController

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  -[ContactsSplitViewController updateModeOnSplitViewControllerForDisplayMode:](self, "updateModeOnSplitViewControllerForDisplayMode:", [a3 displayMode]);
  v5 = [(ContactsSplitViewController *)self displayedContact];

  if (v5) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  [(ContactsSplitViewController *)self updateModeOnSplitViewControllerForDisplayMode:a4];
  dispatch_time_t v5 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A60;
  block[3] = &unk_10001C488;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (CNContactListCollectionView)contactsList
{
  v2 = [(CNContactNavigationController *)self->_contactNavigationController contactListViewController];
  v3 = [v2 collectionView];

  return (CNContactListCollectionView *)v3;
}

- (void)setupContainerController
{
  v3 = [ContactsCardNavigationController alloc];
  id v6 = objc_alloc_init((Class)UIViewController);
  v4 = [(ContactsCardNavigationController *)v3 initWithRootViewController:v6];
  contactContainer = self->_contactContainer;
  self->_contactContainer = v4;
}

- (ContactsSplitViewController)initWithStyle:(int64_t)a3
{
  [(id)objc_opt_class() disableCompatiblityWorkaround];
  v9.receiver = self;
  v9.super_class = (Class)ContactsSplitViewController;
  dispatch_time_t v5 = [(ContactsSplitViewController *)&v9 initWithStyle:a3];
  id v6 = v5;
  if (v5)
  {
    [(ContactsSplitViewController *)v5 setup];
    v7 = v6;
  }

  return v6;
}

- (void)setupPrimaryColumnViewController
{
  v7 = [(ContactsSplitViewController *)self viewControllerForColumn:0];
  v3 = [(ContactsSplitViewController *)self contactNavigationController];
  unsigned int v4 = [v3 shouldShowAccountsAndGroups];
  groupsNavigationController = 0;
  if (v4) {
    groupsNavigationController = self->_groupsNavigationController;
  }
  id v6 = groupsNavigationController;

  if (v7 != v6) {
    [(ContactsSplitViewController *)self setViewController:v6 forColumn:0];
  }
}

- (CNContact)displayedContact
{
  v3 = self->_displayedContact;
  if ([(ContactsSplitViewController *)self _isCollapsed])
  {
    unsigned int v4 = [(ContactsSplitViewController *)self presentedContactViewController];

    if (!v4)
    {

      v3 = 0;
    }
  }

  return v3;
}

+ (id)newContactStoreDataSourceForSplitViewController
{
  id v2 = objc_alloc_init((Class)CNContactStoreConfiguration);
  if (+[CNContact suggestionsEnabled])
  {
    [v2 setIncludeLocalContacts:1];
    [v2 setIncludeSuggestedContacts:1];
    [v2 setIncludeDonatedContacts:1];
  }
  [v2 setUseInProcessMapperExclusively:1];
  id v3 = [objc_alloc((Class)CNContactStore) initWithConfiguration:v2];
  id v4 = [objc_alloc((Class)CNContactStoreDataSource) initWithStore:v3];

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)CNSharedProfileOnboardingController);
  id v6 = [(ContactsSplitViewController *)self store];
  id v7 = [v5 initWithContactStore:v6];

  if ([v7 shouldShowOnboarding])
  {
    [v7 presentOnboardingFlowIfNeededForMode:1 fromViewController:self];
    [(ContactsSplitViewController *)self setOnboardingController:v7];
  }
  v8.receiver = self;
  v8.super_class = (Class)ContactsSplitViewController;
  [(ContactsSplitViewController *)&v8 viewDidAppear:v3];
}

- (void)setup
{
  if (![(ContactsSplitViewController *)self isSetupFinished])
  {
    [(ContactsSplitViewController *)self setupNavigationController];
    [(ContactsSplitViewController *)self setupContainerController];
    [(ContactsSplitViewController *)self setupGroupsNavigationController];
    [(ContactsSplitViewController *)self setupKeyCommands];
    [(ContactsSplitViewController *)self setupSplitViewControllerProperties];
    [(ContactsSplitViewController *)self setupColumns];
    BOOL v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"showDetailTargetDidChange:" name:UIViewControllerShowDetailTargetDidChangeNotification object:self];

    [(ContactsSplitViewController *)self setIsSetupFinished:1];
  }
}

- (void)setupNavigationController
{
  id v10 = [(id)objc_opt_class() prewarmedContactStoreDataSource];
  BOOL v3 = +[CNUIContactsEnvironment currentEnvironment];
  if (v10)
  {
    id v4 = objc_alloc((Class)CNContactNavigationController);
    id v5 = [v10 contactFormatter];
    id v6 = (CNContactNavigationController *)[v4 initWithDataSource:v10 contactFormatter:v5 applyGroupFilterFromPreferences:0 environment:v3 allowsLargeTitles:1];
    contactNavigationController = self->_contactNavigationController;
    self->_contactNavigationController = v6;
  }
  else
  {
    id v10 = [(id)objc_opt_class() newContactStoreDataSourceForSplitViewController];
    objc_super v8 = (CNContactNavigationController *)[objc_alloc((Class)CNContactNavigationController) initWithDataSource:v10 environment:v3 allowsLargeTitles:1];
    id v5 = self->_contactNavigationController;
    self->_contactNavigationController = v8;
  }

  [(CNContactNavigationController *)self->_contactNavigationController setAllowsCardEditing:1];
  [(CNContactNavigationController *)self->_contactNavigationController setAllowsCardDeletion:1];
  objc_super v9 = [(CNContactNavigationController *)self->_contactNavigationController contactListViewController];
  [v9 setShouldDisplayMeContactBanner:1];

  [(CNContactNavigationController *)self->_contactNavigationController setDelegate:self];
}

- (CNContactViewController)presentedContactViewController
{
  objc_opt_class();
  BOOL v3 = [(ContactsSplitViewController *)self potentiallyPresentedDetailViewController];
  id v4 = [v3 childViewControllers];
  id v5 = [v4 firstObject];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  objc_super v8 = [v7 view];
  objc_super v9 = [v8 window];
  if (v9) {
    id v10 = v7;
  }
  else {
    id v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (void)updateModeOnSplitViewControllerForDisplayMode:(int64_t)a3
{
  if ([(ContactsSplitViewController *)self _isCollapsed])
  {
    [(ContactsSplitViewController *)self setPresentsWithGesture:0];
    id v5 = [(ContactsSplitViewController *)self contactNavigationController];
    [v5 setHideGroupsButton:0];

    if ([(ContactsSplitViewController *)self isShowingListView])
    {
      id v12 = [(ContactsSplitViewController *)self contactNavigationController];
      id v6 = [v12 contactListViewController];
      [v6 deselectAllSelectedIndexPathsAnimated:0];
    }
  }
  else
  {
    id v7 = [(ContactsSplitViewController *)self contactNavigationController];
    [v7 setHideGroupsButton:1];

    if (a3 == 2
      && ([(ContactsSplitViewController *)self contactNavigationController],
          objc_super v8 = objc_claimAutoreleasedReturnValue(),
          unsigned int v9 = [v8 shouldShowAccountsAndGroups],
          v8,
          !v9))
    {
      id v10 = self;
      uint64_t v11 = 0;
    }
    else
    {
      id v10 = self;
      uint64_t v11 = 1;
    }
    [(ContactsSplitViewController *)v10 setPresentsWithGesture:v11];
  }
}

- (BOOL)isShowingListView
{
  BOOL v3 = [(CNContactNavigationController *)self->_contactNavigationController contactListViewController];
  if ([v3 isViewLoaded])
  {
    id v4 = [(ContactsSplitViewController *)self contactsList];
    id v5 = [v4 window];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setupGroupsNavigationController
{
  BOOL v3 = [(ContactsSplitViewController *)self contactNavigationController];
  unsigned int v4 = [v3 shouldShowAccountsAndGroups];

  if (v4)
  {
    id v5 = objc_alloc((Class)UINavigationController);
    BOOL v6 = [(ContactsSplitViewController *)self contactNavigationController];
    id v7 = [v6 accountsAndGroupsViewController];
    objc_super v8 = (UINavigationController *)[v5 initWithRootViewController:v7];
    groupsNavigationController = self->_groupsNavigationController;
    self->_groupsNavigationController = v8;

    id v10 = [(UINavigationController *)self->_groupsNavigationController navigationBar];
    [v10 setPrefersLargeTitles:1];
  }
}

- (CNContactNavigationController)contactNavigationController
{
  return self->_contactNavigationController;
}

+ (id)prewarmedContactStoreDataSource
{
  if (byte_100025B78 == 1)
  {
    kdebug_trace();
    BOOL v3 = [a1 resourcesPrewarmingQueue];
    dispatch_async_and_wait(v3, &stru_10001C598);

    unsigned int v4 = [(id)objc_opt_class() prewarmContactStoreDataSourceSnapshotBlock];
    id v5 = [a1 resourcesPrewarmingQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004A68;
    block[3] = &unk_10001C5C0;
    id v11 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    kdebug_trace();
    id v7 = (void *)qword_100025B70;
    qword_100025B70 = 0;
  }
  objc_super v8 = (void *)qword_100025B68;

  return v8;
}

+ (id)resourcesPrewarmingQueue
{
  id v2 = (void *)qword_100025B70;
  if (!qword_100025B70)
  {
    BOOL v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Contacts.ResourcesPrewarming", v3);
    id v5 = (void *)qword_100025B70;
    qword_100025B70 = (uint64_t)v4;

    id v2 = (void *)qword_100025B70;
  }

  return v2;
}

- (CNContactStore)store
{
  id v2 = [(ContactsSplitViewController *)self dataSource];
  BOOL v3 = [v2 store];

  return (CNContactStore *)v3;
}

- (CNContactStoreDataSource)dataSource
{
  return (CNContactStoreDataSource *)[(CNContactNavigationController *)self->_contactNavigationController dataSource];
}

- (void)setupKeyCommands
{
  id v29 = +[UIKeyCommand keyCommandWithInput:@"n" modifierFlags:0x100000 action:"addContact:"];
  BOOL v3 = CNContactsUIBundle();
  dispatch_queue_t v4 = [v3 localizedStringForKey:@"ADD_CONTACT_KEYBOARD_DISCOVERY" value:&stru_10001CAA0 table:@"Localized"];
  [v29 setDiscoverabilityTitle:v4];

  [(ContactsSplitViewController *)self addKeyCommand:v29];
  v28 = +[UIKeyCommand keyCommandWithInput:@"f" modifierFlags:0x100000 action:"beginSearch:"];
  id v5 = CNContactsUIBundle();
  id v6 = [v5 localizedStringForKey:@"BEGIN_SEARCH_KEYBOARD_DISCOVERY" value:&stru_10001CAA0 table:@"Localized"];
  [v28 setDiscoverabilityTitle:v6];

  [(ContactsSplitViewController *)self addKeyCommand:v28];
  v27 = +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", @"[", 0x100000);
  id v7 = CNContactsUIBundle();
  objc_super v8 = [v7 localizedStringForKey:@"SELECT_PREVIOUS_CONTACT_KEYBOARD_DISCOVERY" value:&stru_10001CAA0 table:@"Localized"];
  [v27 setDiscoverabilityTitle:v8];

  [(ContactsSplitViewController *)self addKeyCommand:v27];
  v26 = +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", @"]", 0x100000);
  unsigned int v9 = CNContactsUIBundle();
  id v10 = [v9 localizedStringForKey:@"SELECT_NEXT_CONTACT_KEYBOARD_DISCOVERY" value:&stru_10001CAA0 table:@"Localized"];
  [v26 setDiscoverabilityTitle:v10];

  [(ContactsSplitViewController *)self addKeyCommand:v26];
  id v11 = +[UIKeyCommand keyCommandWithInput:@"s" modifierFlags:1310720 action:"toggleGroupsPanel:"];
  id v12 = CNContactsUIBundle();
  v13 = [v12 localizedStringForKey:@"TOGGLE_GROUPS_PANEL_KEYBOARD_DISCOVERY" value:&stru_10001CAA0 table:@"Localized"];
  [v11 setDiscoverabilityTitle:v13];

  [(ContactsSplitViewController *)self addKeyCommand:v11];
  v14 = +[UIKeyCommand keyCommandWithInput:@"\b" modifierFlags:0x100000 action:"deleteContact:"];
  [(ContactsSplitViewController *)self addKeyCommand:v14];
  v15 = +[UIKeyCommand keyCommandWithInput:@"\b" modifierFlags:0 action:"deleteContact:"];
  v16 = CNContactsUIBundle();
  v17 = [v16 localizedStringForKey:@"DELETE_SELECTED_CONTACT_KEYBOARD_DISCOVERY" value:&stru_10001CAA0 table:@"Localized"];
  [v15 setDiscoverabilityTitle:v17];

  [(ContactsSplitViewController *)self addKeyCommand:v15];
  v18 = +[UIKeyCommand keyCommandWithInput:@"L" modifierFlags:1179648 action:"mergeUnifyContacts:"];
  v19 = CNContactsUIBundle();
  v20 = [v19 localizedStringForKey:@"MERGE_UNIFY_SELECTED_CONTACTS_KEYBOARD_DISCOVERY" value:&stru_10001CAA0 table:@"Localized"];
  [v18 setDiscoverabilityTitle:v20];

  [(ContactsSplitViewController *)self addKeyCommand:v18];
  v21 = +[UIKeyCommand keyCommandWithInput:@"V" modifierFlags:0x100000 action:"pasteContacts:"];
  v22 = CNContactsUIBundle();
  v23 = [v22 localizedStringForKey:@"PASTE_CONTACTS_KEYBOARD_DISCOVERY" value:&stru_10001CAA0 table:@"Localized"];
  [v21 setDiscoverabilityTitle:v23];

  [v21 setWantsPriorityOverSystemBehavior:1];
  [(ContactsSplitViewController *)self addKeyCommand:v21];
  v24 = +[UIKeyCommand keyCommandWithInput:UIKeyInputRightArrow modifierFlags:0 action:"selectNextContact:"];
  [(ContactsSplitViewController *)self addKeyCommand:v24];

  v25 = +[UIKeyCommand keyCommandWithInput:UIKeyInputLeftArrow modifierFlags:0 action:"selectPreviousContact:"];
  [(ContactsSplitViewController *)self addKeyCommand:v25];
}

- (void)setupColumns
{
  [(ContactsSplitViewController *)self setupPrimaryColumnViewController];
  [(ContactsSplitViewController *)self setViewController:self->_contactNavigationController forColumn:1];
  [(ContactsSplitViewController *)self setViewController:self->_contactContainer forColumn:2];

  [(ContactsSplitViewController *)self setPreferredSupplementaryColumnWidth:375.0];
}

- (void)showDetailTargetDidChange:(id)a3
{
  if (([(ContactsSplitViewController *)self isCollapsed] & 1) == 0)
  {
    id v7 = self->_displayedContact;
    if (v7)
    {
      dispatch_queue_t v4 = [(CNContactNavigationController *)self->_contactNavigationController contactListViewController];
      [v4 selectContact:v7 animated:1 scrollPosition:0];
    }
    else
    {
      dispatch_queue_t v4 = [(ContactsSplitViewController *)self contactContainer];
      id v5 = [v4 popToRootViewControllerAnimated:0];
      id v6 = [(ContactsSplitViewController *)self detailViewController];

      if (v6 != v4) {
        [(ContactsSplitViewController *)self setViewController:v4 forColumn:2];
      }
    }
  }
}

- (void)setupSplitViewControllerProperties
{
  [(ContactsSplitViewController *)self setDelegate:self];
  [(ContactsSplitViewController *)self setRestorationIdentifier:@"ContactsSplitViewController"];
  [(ContactsSplitViewController *)self setPreferredDisplayMode:0];

  [(ContactsSplitViewController *)self setPreferredPrimaryColumnWidth:320.0];
}

- (void)setIsSetupFinished:(BOOL)a3
{
  self->_isSetupFinished = a3;
}

- (UINavigationController)potentiallyPresentedDetailViewController
{
  return self->_potentiallyPresentedDetailViewController;
}

- (BOOL)isSetupFinished
{
  return self->_isSetupFinished;
}

- (BOOL)contactNavigationControllerShouldManageGroupsController:(id)a3
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

+ (id)prewarmContactStoreDataSourceSnapshotBlock
{
  return &stru_10001C578;
}

+ (id)prewarmContactStoreDataSourceBlock
{
  byte_100025B78 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002E5C;
  v4[3] = &unk_10001C558;
  v4[4] = a1;
  id v2 = objc_retainBlock(v4);

  return v2;
}

+ (void)disableCompatiblityWorkaround
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 registerDefaults:&off_10001D198];
}

- (ContactsSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(id)objc_opt_class() disableCompatiblityWorkaround];
  v11.receiver = self;
  v11.super_class = (Class)ContactsSplitViewController;
  objc_super v8 = [(ContactsSplitViewController *)&v11 initWithNibName:v7 bundle:v6];

  if (v8)
  {
    [(ContactsSplitViewController *)v8 setup];
    unsigned int v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIViewControllerShowDetailTargetDidChangeNotification object:self];

  v4.receiver = self;
  v4.super_class = (Class)ContactsSplitViewController;
  [(ContactsSplitViewController *)&v4 dealloc];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = [(ContactsSplitViewController *)self contactNavigationController];
  LOBYTE(a3) = [v7 canPerformAction:a3 withSender:v6];

  return (char)a3;
}

- (void)removeContactViewController
{
  [(ContactsSplitViewController *)self setDisplayedContact:0];
  if ([(ContactsSplitViewController *)self isCollapsed])
  {
    id v10 = [(ContactsSplitViewController *)self viewControllerForColumn:2];
    BOOL v3 = [v10 navigationController];
    id v4 = [v3 popViewControllerAnimated:1];
  }
  else
  {
    id v5 = [(ContactsSplitViewController *)self contactContainer];
    id v6 = [v5 popToRootViewControllerAnimated:0];

    id v7 = [(ContactsSplitViewController *)self detailViewController];
    objc_super v8 = [(ContactsSplitViewController *)self contactContainer];

    if (v7 != v8)
    {
      contactContainer = self->_contactContainer;
      [(ContactsSplitViewController *)self setViewController:contactContainer forColumn:2];
    }
  }
}

- (void)resetContactViewController
{
  [(ContactsSplitViewController *)self setDisplayedContact:0];
  contactContainer = self->_contactContainer;

  [(ContactsSplitViewController *)self setViewController:contactContainer forColumn:2];
}

- (void)showCardForContact:(id)a3 fallbackToFirstContact:(BOOL)a4
{
}

- (void)showEditingCardForContact:(id)a3
{
  [(CNContactNavigationController *)self->_contactNavigationController showCardForContact:a3 resetFilter:0 resetSearch:1 fallbackToFirstContact:0 scrollToContact:1 animated:0];
  contactNavigationController = self->_contactNavigationController;

  [(CNContactNavigationController *)contactNavigationController startEditingPresentedContact];
}

- (void)createNewContact
{
  if (([(CNContactNavigationController *)self->_contactNavigationController isDisplayingAddNewContactViewController] & 1) == 0)
  {
    if ([(ContactsSplitViewController *)self isShowingGroups]) {
      [(ContactsSplitViewController *)self showContactList];
    }
    contactNavigationController = self->_contactNavigationController;
    [(CNContactNavigationController *)contactNavigationController addContact:0 animated:0];
  }
}

- (void)_cancelOutstandingSearch
{
  BOOL v3 = [(CNContactNavigationController *)self->_contactNavigationController contactListViewController];
  unsigned int v4 = [v3 isSearching];

  if (v4)
  {
    id v5 = [(CNContactNavigationController *)self->_contactNavigationController contactListViewController];
    [v5 cancelSearch:0];
  }
}

- (CNContact)unsavedContact
{
  BOOL v3 = [(ContactsSplitViewController *)self presentedContactViewController];

  if (v3)
  {
    unsigned int v4 = [(ContactsSplitViewController *)self presentedContactViewController];
    id v5 = [v4 contentViewController];
    [v5 saveModelChangesToContact];

    id v6 = [v4 contact];
  }
  else
  {
    id v6 = 0;
  }

  return (CNContact *)v6;
}

- (BOOL)isShowingGroups
{
  BOOL v3 = [(ContactsSplitViewController *)self contactNavigationController];
  unsigned int v4 = [v3 accountsAndGroupsViewController];
  if ([v4 isViewLoaded])
  {
    id v5 = [(ContactsSplitViewController *)self contactNavigationController];
    id v6 = [v5 accountsAndGroupsViewController];
    id v7 = [v6 view];
    objc_super v8 = [v7 window];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setRestoredContact:(id)a3
{
  id v13 = a3;
  p_restoredContact = &self->_restoredContact;
  objc_storeStrong((id *)&self->_restoredContact, a3);
  restoredContact = self->_restoredContact;
  if (restoredContact) {
    goto LABEL_7;
  }
  if (([(ContactsSplitViewController *)self _isCollapsed] & 1) == 0)
  {
    id v7 = [(ContactsSplitViewController *)self contactNavigationController];
    objc_super v8 = [v7 dataSource];
    BOOL v9 = [v8 contacts];

    if ([v9 count])
    {
      uint64_t v10 = [v9 objectAtIndexedSubscript:0];
      objc_super v11 = *p_restoredContact;
      *p_restoredContact = (CNContact *)v10;
    }
  }
  restoredContact = *p_restoredContact;
  if (*p_restoredContact)
  {
LABEL_7:
    [(ContactsSplitViewController *)self showCardForContact:restoredContact fallbackToFirstContact:0];
    id v12 = *p_restoredContact;
  }
  else
  {
    id v12 = 0;
  }
  *p_restoredContact = 0;
}

- (void)presentAddContactViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 setModalPresentationStyle:1];
  [(ContactsSplitViewController *)self presentViewController:v6 animated:v4 completion:0];
}

- (void)onboardingControllerDidFinishSetup:(id)a3
{
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  id v6 = [(ContactsSplitViewController *)self presentedContactViewController];

  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = a4 == 1;
  }
  if (v7) {
    a4 = 3;
  }
  if (a4 == 3)
  {
    objc_super v8 = [(ContactsSplitViewController *)self contactNavigationController];
    BOOL v9 = [v8 contactListViewController];
    uint64_t v10 = [(ContactsSplitViewController *)self selectedIndexPath];
    unsigned __int8 v11 = [v9 isValidIndexPath:v10];

    if ((v11 & 1) == 0) {
      [(ContactsSplitViewController *)self setSelectedIndexPath:0];
    }
    id v12 = [(ContactsSplitViewController *)self selectedIndexPath];

    id v13 = [(ContactsSplitViewController *)self contactsList];
    if (v12)
    {
      v14 = [(ContactsSplitViewController *)self selectedIndexPath];
      [v13 selectItemAtIndexPath:v14 animated:1 scrollPosition:2];
    }
    else
    {
      v14 = [(ContactsSplitViewController *)self contactsList];
      v15 = [v14 indexPathsForSelectedItems];
      v16 = [v15 firstObject];
      [v13 deselectItemAtIndexPath:v16 animated:1];
    }
  }
  v17 = [(ContactsSplitViewController *)self presentedContactViewController];

  if (!v17)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000083EC;
    v19[3] = &unk_10001C488;
    v19[4] = self;
    [(ContactsSplitViewController *)self _allowingMutationsInDelegateCallback:v19];
  }
  return a4;
}

- (void)showContactDetailViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 dismissingPresentedController:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (v6)
  {
    id v12 = [(ContactsSplitViewController *)self contactNavigationController];
    id v13 = [v12 presentedViewController];
    [(ContactsSplitViewController *)self saveEditingViewControllersAndDismissViewController:v13];
  }
  id v14 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v10];
  [(ContactsSplitViewController *)self setPotentiallyPresentedDetailViewController:v14];

  if (v7)
  {
    v15 = [(ContactsSplitViewController *)self potentiallyPresentedDetailViewController];
    [(ContactsSplitViewController *)self showDetailViewController:v15 sender:v11];
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000085C0;
    v16[3] = &unk_10001C538;
    v16[4] = self;
    id v17 = v11;
    +[UIView performWithoutAnimation:v16];
  }
}

- (void)saveEditingViewControllersAndDismissViewController:(id)a3
{
  id v6 = a3;
  BOOL v3 = [v6 childViewControllers];
  BOOL v4 = [v3 _cn_flatMap:&stru_10001C600];
  id v5 = [v4 _cn_filter:&stru_10001C640];
  [v5 _cn_each:&stru_10001C680];

  [v6 dismissViewControllerAnimated:0 completion:0];
}

- (BOOL)contactNavigationController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  return [(ContactsSplitViewController *)self contactNavigationController:a3 presentViewController:a4 animated:a5 dismissingPresentedController:1 shouldHideContactListIfNeeded:1];
}

- (BOOL)contactNavigationController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 dismissingPresentedController:(BOOL)a6 shouldHideContactListIfNeeded:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = [(ContactsSplitViewController *)self presentedContactViewController];
  id v15 = v14;
  BOOL v30 = v8;
  BOOL v31 = v7;
  BOOL v29 = v9;
  if (v14)
  {
    unsigned int v16 = [v14 isEditing];
    BOOL v17 = v15 == v13;
    if (v15 != v13 && v16)
    {
      v18 = [v15 contentViewController];
      [v18 saveChanges];

      v19 = [v15 contentViewController];
      [v19 setEditing:0 animated:0];

      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = v13 == 0;
  }
  v20 = [v13 contact];
  v21 = [(ContactsSplitViewController *)self contactNavigationController];
  v22 = [v21 contactListViewController];

  unsigned int v23 = [v22 shouldDisplayListHeaderView];
  v24 = [(ContactsSplitViewController *)self dataSource];
  uint64_t v25 = [v24 indexPathForContact:v20];
  v26 = (void *)v25;
  if (v23)
  {

    v27 = [NSIndexPath indexPathForItem:[v26 item] inSection:[v26 section] + 1];
  }
  else
  {
    v27 = (void *)v25;
    v26 = v24;
  }
  [(ContactsSplitViewController *)self setSelectedIndexPath:v27];

  if (!v17)
  {
    [(ContactsSplitViewController *)self removeContactViewController];
    [(ContactsSplitViewController *)self showContactDetailViewController:v13 sender:v12 animated:v29 dismissingPresentedController:v30];
  }
  [(ContactsSplitViewController *)self setDisplayedContact:v20];
  if ([(ContactsSplitViewController *)self contactViewIsCovered] && v31) {
    [(ContactsSplitViewController *)self hideColumn:1];
  }

  return 1;
}

- (BOOL)contactViewIsCovered
{
  return [(ContactsSplitViewController *)self displayMode] == (id)3
      || [(ContactsSplitViewController *)self displayMode] == (id)5
      || [(ContactsSplitViewController *)self displayMode] == (id)6;
}

- (void)showContactList
{
}

- (BOOL)groupsPanelIsHidden
{
  id v3 = [(ContactsSplitViewController *)self displayMode];
  if (v3 != (id)1) {
    LOBYTE(v3) = [(ContactsSplitViewController *)self displayMode] == (id)2
  }
              || [(ContactsSplitViewController *)self displayMode] == (id)3;
  return (char)v3;
}

- (void)toggleGroupsPanel
{
  if (([(ContactsSplitViewController *)self isCollapsed] & 1) == 0)
  {
    if ([(ContactsSplitViewController *)self groupsPanelIsHidden])
    {
      [(ContactsSplitViewController *)self showColumn:0];
    }
    else
    {
      [(ContactsSplitViewController *)self hideColumn:0];
    }
  }
}

- (void)showGroupsAnimated:(BOOL)a3
{
  if ([(ContactsSplitViewController *)self groupsPanelIsHidden])
  {
    [(ContactsSplitViewController *)self showColumn:0];
  }
}

- (void)contactNavigationControllerClearContactSelection:(id)a3
{
}

- (void)contactNavigationController:(id)a3 didDeleteContact:(id)a4
{
  id v8 = a4;
  id v5 = [(ContactsSplitViewController *)self displayedContact];
  if (v5 == v8)
  {

    goto LABEL_5;
  }
  id v6 = [(ContactsSplitViewController *)self displayedContact];
  unsigned int v7 = [v8 isEqual:v6];

  if (v7) {
LABEL_5:
  }
    [(ContactsSplitViewController *)self setDisplayedContact:0];
  [(ContactsSplitViewController *)self deselectContactAndSelectNext:1];
}

- (void)deselectContactAndSelectNext:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ContactsSplitViewController *)self isCollapsed])
  {
    [(ContactsSplitViewController *)self removeContactViewController];
    [(ContactsSplitViewController *)self setSelectedIndexPath:0];
  }
  else if (v3)
  {
    id v5 = [(ContactsSplitViewController *)self selectedIndexPath];
    id v6 = [(ContactsSplitViewController *)self contactsList];
    id v7 = [v6 globalIndexForItemAtIndexPath:v5];

    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    id v8 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, (char *)[v5 section] + 1);
    [(ContactsSplitViewController *)self setSelectedIndexPath:v8];

    BOOL v9 = [(ContactsSplitViewController *)self contactsList];
    id v10 = [(ContactsSplitViewController *)self selectedIndexPath];
    id v7 = [v9 globalIndexForItemAtIndexPath:v10];

    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    if ((uint64_t)[v5 row] < 1) {
      goto LABEL_8;
    }
    id v11 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v5 row] - 1, objc_msgSend(v5, "section"));
    [(ContactsSplitViewController *)self setSelectedIndexPath:v11];

    id v12 = [(ContactsSplitViewController *)self contactsList];
    id v13 = [(ContactsSplitViewController *)self selectedIndexPath];
    id v7 = [v12 globalIndexForItemAtIndexPath:v13];

    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      [(ContactsSplitViewController *)self setSelectedIndexPath:0];
      [(ContactsSplitViewController *)self removeContactViewController];
    }
    else
    {
LABEL_10:
      unsigned int v16 = [(ContactsSplitViewController *)self dataSource];
      BOOL v17 = [v16 contacts];
      v18 = [v17 objectAtIndexedSubscript:v7];
      [(ContactsSplitViewController *)self showCardForContact:v18 fallbackToFirstContact:1];
    }
  }
  else
  {
    [(ContactsSplitViewController *)self setDisplayedContact:0];
    id v14 = [(ContactsSplitViewController *)self contactNavigationController];
    id v15 = [v14 contactListViewController];
    [v15 deselectAllSelectedIndexPathsAnimated:1];

    [(ContactsSplitViewController *)self setSelectedIndexPath:0];
    [(ContactsSplitViewController *)self removeContactViewController];
  }
  if (([(ContactsSplitViewController *)self isCollapsed] & 1) == 0)
  {
    [(ContactsSplitViewController *)self showColumn:1];
  }
}

- (void)searchForString:(id)a3
{
  id v4 = a3;
  [(ContactsSplitViewController *)self showContactList];
  id v5 = [(ContactsSplitViewController *)self contactNavigationController];
  [v5 searchForString:v4];
}

- (void)cancelSearch
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ContactsSplitViewController;
  [(ContactsSplitViewController *)&v6 touchesBegan:a3 withEvent:a4];
  id v5 = [(ContactsSplitViewController *)self view];
  [v5 endEditing:1];
}

- (void)beginSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(ContactsSplitViewController *)self contactNavigationController];
  [v5 beginSearch:v4];
}

- (void)addContact:(id)a3
{
  id v4 = a3;
  id v5 = [(ContactsSplitViewController *)self contactNavigationController];
  [v5 addContact:v4];
}

- (void)deleteContact:(id)a3
{
  id v4 = a3;
  id v5 = [(ContactsSplitViewController *)self contactNavigationController];
  [v5 deleteContact:v4];
}

- (void)selectNextContact:(id)a3
{
  id v4 = a3;
  id v5 = [(ContactsSplitViewController *)self contactNavigationController];
  [v5 selectNextContact:v4];
}

- (void)selectPreviousContact:(id)a3
{
  id v4 = a3;
  id v5 = [(ContactsSplitViewController *)self contactNavigationController];
  [v5 selectPreviousContact:v4];
}

- (void)toggleGroupsPanel:(id)a3
{
}

- (id)navigationControllerForPPT
{
  if ([(ContactsSplitViewController *)self _isCollapsed])
  {
    uint64_t v3 = [(ContactsSplitViewController *)self viewControllerForColumn:0];
    if (v3) {
      goto LABEL_6;
    }
    id v4 = self;
    uint64_t v5 = 1;
  }
  else
  {
    id v4 = self;
    uint64_t v5 = 2;
  }
  uint64_t v3 = [(ContactsSplitViewController *)v4 viewControllerForColumn:v5];
LABEL_6:
  objc_super v6 = (void *)v3;
  id v7 = [(ContactsSplitViewController *)self navigationControllerForPotentiallyWrappedViewController:v3];

  return v7;
}

- (id)navigationControllerForPotentiallyWrappedViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 navigationController];
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)_multitaskingDragExclusionRects
{
  id v3 = [(ContactsSplitViewController *)self contactNavigationController];
  uint64_t v4 = [v3 accountsAndGroupsViewController];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    unsigned __int8 v6 = [(ContactsSplitViewController *)self groupsPanelIsHidden];

    if ((v6 & 1) == 0)
    {
      id v7 = [(ContactsSplitViewController *)self contactNavigationController];
      id v8 = [v7 accountsAndGroupsViewController];
      BOOL v9 = [v8 multitaskingDragExclusionRects];
      id v10 = [v9 firstObject];
      [v10 CGRectValue];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;

      v19 = [(ContactsSplitViewController *)self view];
      v20 = [(ContactsSplitViewController *)self contactNavigationController];
      v21 = [v20 accountsAndGroupsViewController];
      v22 = [v21 view];
      [v19 convertRect:v22 fromView:v12, v14, v16, v18];
      uint64_t v24 = v23;
      uint64_t v26 = v25;
      uint64_t v28 = v27;
      uint64_t v30 = v29;

      v34[0] = v24;
      v34[1] = v26;
      v34[2] = v28;
      v34[3] = v30;
      BOOL v31 = +[NSValue valueWithBytes:v34 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v35 = v31;
      v32 = +[NSArray arrayWithObjects:&v35 count:1];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v32 = &__NSArray0__struct;
LABEL_6:

  return v32;
}

- (void)setContactNavigationController:(id)a3
{
}

- (void)setDisplayedContact:(id)a3
{
}

- (CNContact)restoredContact
{
  return self->_restoredContact;
}

- (ContactsCardNavigationController)contactContainer
{
  return self->_contactContainer;
}

- (UINavigationController)groupsNavigationController
{
  return self->_groupsNavigationController;
}

- (void)setGroupsNavigationController:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (void)setPotentiallyPresentedDetailViewController:(id)a3
{
}

- (CNSharedProfileOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_potentiallyPresentedDetailViewController, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_groupsNavigationController, 0);
  objc_storeStrong((id *)&self->_contactContainer, 0);
  objc_storeStrong((id *)&self->_restoredContact, 0);
  objc_storeStrong((id *)&self->_displayedContact, 0);

  objc_storeStrong((id *)&self->_contactNavigationController, 0);
}

@end