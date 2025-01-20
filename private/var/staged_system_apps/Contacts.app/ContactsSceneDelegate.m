@interface ContactsSceneDelegate
+ (OS_os_log)log;
- (BOOL)didExecuteSceneInitializationTasks;
- (BOOL)openContactsURL:(id)a3;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)showContactFromURLReader:(id)a3 setEditing:(BOOL)a4;
- (BOOL)showContactWithIdentifier:(id)a3;
- (BOOL)showContactWithIdentifier:(id)a3 setEditing:(BOOL)a4;
- (BOOL)showContactWithLegacyIdentifier:(int)a3;
- (BOOL)showContactWithLegacyIdentifier:(int)a3 setEditing:(BOOL)a4;
- (BOOL)showMeContact;
- (BOOL)splitViewControllerIsDisplayingList;
- (CNCapabilitiesManager)capabilitiesManager;
- (CNSchedulerProvider)schedulerProvider;
- (CNUIUserActivityRestorer)activityRestorer;
- (CNUserActivityRestorerDelegate)activityRestorerDelegate;
- (CNVCardImportController)vCardImportController;
- (ContactsSceneDelegate)init;
- (ContactsSceneDelegate)initWithApplication:(id)a3 capabilitiesManager:(id)a4 schedulerProvider:(id)a5;
- (ContactsSplitViewController)splitViewController;
- (NSBundle)bundle;
- (NSBundle)mainBundle;
- (NSMutableArray)actionsDelayedUntilSceneInitialization;
- (NSUserActivity)viewingContactActivityForRestoration;
- (UIApplication)application;
- (UIWindow)sceneWindow;
- (id)contactStoreDataSource;
- (id)showMeCardShortcutItem;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)checkInLaunchTasksIfNecessary;
- (void)createNewContact;
- (void)createShowMeCardApplicationShortcutIfNecessary;
- (void)displayContactIfNecessary;
- (void)executeActionDelayedUntilSceneInitialization:(id)a3;
- (void)executeAllDelayedActions;
- (void)executeSceneInitializationTasksOnce:(id)a3;
- (void)executeShortcutIfNecessary:(id)a3 completionHandler:(id)a4;
- (void)performMigrationOfFacebookContactsToLocalStoreIfNecessary;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)searchForString:(id)a3;
- (void)setDidExecuteSceneInitializationTasks:(BOOL)a3;
- (void)setSceneWindow:(id)a3;
- (void)setViewingContactActivityForRestoration:(id)a3;
- (void)showContact:(id)a3;
- (void)showContact:(id)a3 setEditing:(BOOL)a4;
- (void)showNewContact;
- (void)vCardImportController:(id)a3 didSaveContacts:(id)a4;
- (void)vCardImportController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation ContactsSceneDelegate

- (void)executeSceneInitializationTasksOnce:(id)a3
{
  v4 = (void (**)(void))a3;
  if (![(ContactsSceneDelegate *)self didExecuteSceneInitializationTasks])
  {
    v4[2]();
    [(ContactsSceneDelegate *)self setDidExecuteSceneInitializationTasks:1];
  }
}

- (void)performMigrationOfFacebookContactsToLocalStoreIfNecessary
{
  id v3 = [(ContactsSceneDelegate *)self splitViewController];
  v2 = [v3 contactNavigationController];
  [v2 checkForFacebookContactsWithDelay:1 allowAlert:0.5];
}

- (void)executeAllDelayedActions
{
  id v3 = [(ContactsSceneDelegate *)self actionsDelayedUntilSceneInitialization];
  [v3 _cn_each:&stru_10001C778];

  id v4 = [(ContactsSceneDelegate *)self actionsDelayedUntilSceneInitialization];
  [v4 removeAllObjects];
}

- (NSMutableArray)actionsDelayedUntilSceneInitialization
{
  return self->_actionsDelayedUntilSceneInitialization;
}

- (void)sceneWillEnterForeground:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000022A0;
  v5[3] = &unk_10001C488;
  v5[4] = self;
  [(ContactsSceneDelegate *)self executeSceneInitializationTasksOnce:v5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002504;
  v4[3] = &unk_10001C488;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v5 = [(ContactsSceneDelegate *)self schedulerProvider];
  id v3 = [v5 backgroundScheduler];
  id v4 = [v3 afterDelay:&stru_10001C738 performBlock:4.0];
}

- (void)checkInLaunchTasksIfNecessary
{
  id v3 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v13 = [v3 launchCheckinRegistrar];

  id v4 = [(ContactsSceneDelegate *)self splitViewController];
  unsigned int v5 = [v4 _isCollapsed];

  v6 = [(ContactsSceneDelegate *)self viewingContactActivityForRestoration];
  if (v6)
  {
    v7 = [(ContactsSceneDelegate *)self viewingContactActivityForRestoration];
    v8 = [v7 activityType];
    unsigned int v9 = [v8 isEqualToString:CNUIActivityTypeViewingList];

    int v10 = v9 & v5;
  }
  else
  {
    int v10 = v5;
  }

  if (v10) {
    uint64_t v11 = 60;
  }
  else {
    uint64_t v11 = 2;
  }
  if ((v10 | v5))
  {
    v12 = (void *)v13;
  }
  else
  {
    if ([(ContactsSceneDelegate *)self splitViewControllerIsDisplayingList]) {
      goto LABEL_12;
    }
    uint64_t v11 = 2;
    v12 = (void *)v13;
  }
  [v12 checkInLaunchTasks:v11];
LABEL_12:

  _objc_release_x1();
}

- (void)createShowMeCardApplicationShortcutIfNecessary
{
  id v3 = [(ContactsSceneDelegate *)self capabilitiesManager];
  unsigned int v4 = [v3 hasForceTouchCapability];

  unsigned int v5 = [(ContactsSceneDelegate *)self application];
  v6 = [v5 connectedScenes];
  id v7 = [v6 count];

  if (v4 && v7 == (id)1)
  {
    uint64_t v8 = [(ContactsSceneDelegate *)self showMeCardShortcutItem];
    unsigned int v9 = (void *)v8;
    if (v8)
    {
      uint64_t v12 = v8;
      int v10 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    else
    {
      int v10 = &__NSArray0__struct;
    }
    uint64_t v11 = [(ContactsSceneDelegate *)self application];
    [v11 setShortcutItems:v10];

    if (v9) {
  }
    }
}

- (void)displayContactIfNecessary
{
  id v3 = [(ContactsSceneDelegate *)self splitViewController];
  unsigned int v4 = [v3 traitCollection];
  id v5 = [v4 horizontalSizeClass];

  if (v5 != (id)1)
  {
    v6 = [(ContactsSceneDelegate *)self splitViewController];
    id v7 = [v6 displayedContact];
    if (v7)
    {
    }
    else
    {
      uint64_t v8 = [(ContactsSceneDelegate *)self viewingContactActivityForRestoration];

      if (!v8)
      {
        uint64_t v11 = [(ContactsSceneDelegate *)self splitViewController];
        [v11 showCardForContact:0 fallbackToFirstContact:1];

        id v12 = [(ContactsSceneDelegate *)self splitViewController];
        [v12 showContactList];
        goto LABEL_7;
      }
    }
  }
  unsigned int v9 = [(ContactsSceneDelegate *)self viewingContactActivityForRestoration];

  if (!v9) {
    return;
  }
  id v12 = [(ContactsSceneDelegate *)self activityRestorer];
  int v10 = [(ContactsSceneDelegate *)self viewingContactActivityForRestoration];
  [v12 restoreUserActivity:v10];

LABEL_7:
}

- (id)contactStoreDataSource
{
  v2 = [(ContactsSceneDelegate *)self splitViewController];
  id v3 = [v2 contactNavigationController];
  unsigned int v4 = [v3 dataSource];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (ContactsSceneDelegate)init
{
  id v3 = +[UIApplication sharedApplication];
  unsigned int v4 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  id v5 = +[CNUIContactsEnvironment currentEnvironment];
  v6 = [v5 defaultSchedulerProvider];
  id v7 = [(ContactsSceneDelegate *)self initWithApplication:v3 capabilitiesManager:v4 schedulerProvider:v6];

  return v7;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  uint64_t v13 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10000F234(v12, v13);
  }

  if (v12)
  {
    id v14 = [objc_alloc((Class)UIWindow) initWithWindowScene:v12];
    [(ContactsSceneDelegate *)self setSceneWindow:v14];

    v15 = [(ContactsSceneDelegate *)self splitViewController];
    v16 = [(ContactsSceneDelegate *)self sceneWindow];
    [v16 setRootViewController:v15];

    v17 = +[CNUIColorRepository contactsApplicationTintColor];
    v18 = [(ContactsSceneDelegate *)self sceneWindow];
    [v18 setTintColor:v17];

    v19 = [(ContactsSceneDelegate *)self sceneWindow];
    [v19 makeKeyAndVisible];

    v20 = +[NSMutableArray array];
    v21 = [v10 userActivities];
    v22 = [v21 anyObject];
    [v20 _cn_addNonNilObject:v22];

    v23 = [v9 stateRestorationActivity];
    [v20 _cn_addNonNilObject:v23];

    v24 = [v10 shortcutItem];

    if (v24)
    {
      v25 = [v10 shortcutItem];
      [(ContactsSceneDelegate *)self executeShortcutIfNecessary:v25 completionHandler:0];
    }
    else
    {
      uint64_t v26 = CNIsSetEmpty;
      v27 = [v10 URLContexts];
      LOBYTE(v26) = (*(uint64_t (**)(uint64_t, void *))(v26 + 16))(v26, v27);

      if (v26)
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10000B0D4;
        v32[3] = &unk_10001C718;
        v32[4] = self;
        v25 = [v20 _cn_firstObjectPassingTest:v32];
        [(ContactsSceneDelegate *)self setViewingContactActivityForRestoration:v25];
      }
      else
      {
        v25 = [v10 URLContexts];
        v28 = [v25 allObjects];
        v29 = [v28 firstObject];
        v30 = [v29 URL];
        [(ContactsSceneDelegate *)self openContactsURL:v30];
      }
    }

    v31 = [(ContactsSceneDelegate *)self splitViewController];
    +[CNContactsAppIntentDependencyManager setupAppIntentDependenciesWithActionPerformer:v31];
  }
}

- (UIWindow)sceneWindow
{
  return self->_sceneWindow;
}

- (ContactsSceneDelegate)initWithApplication:(id)a3 capabilitiesManager:(id)a4 schedulerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)ContactsSceneDelegate;
  id v12 = [(ContactsSceneDelegate *)&v37 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_capabilitiesManager, a4);
    objc_storeStrong((id *)&v13->_application, a3);
    objc_storeStrong((id *)&v13->_schedulerProvider, a5);
    id v14 = [[ContactsSplitViewController alloc] initWithStyle:2];
    splitViewController = v13->_splitViewController;
    v13->_splitViewController = v14;

    id v16 = objc_alloc((Class)CNVCardImportController);
    v17 = [(ContactsSceneDelegate *)v13 splitViewController];
    v18 = [v17 store];
    v19 = (CNVCardImportController *)[v16 initWithContactStore:v18 presentationDelegate:v13];
    vCardImportController = v13->_vCardImportController;
    v13->_vCardImportController = v19;

    [(CNVCardImportController *)v13->_vCardImportController setDelegate:v13];
    uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
    bundle = v13->_bundle;
    v13->_bundle = (NSBundle *)v21;

    id v23 = objc_alloc((Class)CNUIUserActivityRestorer);
    v24 = [(ContactsSceneDelegate *)v13 splitViewController];
    v25 = [v24 store];
    uint64_t v26 = (CNUIUserActivityRestorer *)[v23 initWithContactStore:v25];
    activityRestorer = v13->_activityRestorer;
    v13->_activityRestorer = v26;

    v28 = [CNUserActivityRestorerDelegate alloc];
    v29 = [(ContactsSceneDelegate *)v13 splitViewController];
    v30 = [(CNUserActivityRestorerDelegate *)v28 initWithContactsSplitViewController:v29];
    activityRestorerDelegate = v13->_activityRestorerDelegate;
    v13->_activityRestorerDelegate = v30;

    v32 = [(ContactsSceneDelegate *)v13 activityRestorerDelegate];
    [(CNUIUserActivityRestorer *)v13->_activityRestorer setDelegate:v32];

    uint64_t v33 = +[NSMutableArray array];
    actionsDelayedUntilSceneInitialization = v13->_actionsDelayedUntilSceneInitialization;
    v13->_actionsDelayedUntilSceneInitialization = (NSMutableArray *)v33;

    v35 = v13;
  }

  return v13;
}

- (ContactsSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (NSUserActivity)viewingContactActivityForRestoration
{
  return self->_viewingContactActivityForRestoration;
}

- (void)setViewingContactActivityForRestoration:(id)a3
{
}

- (void)setSceneWindow:(id)a3
{
}

- (void)setDidExecuteSceneInitializationTasks:(BOOL)a3
{
  self->_didExecuteSceneInitializationTasks = a3;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (BOOL)didExecuteSceneInitializationTasks
{
  return self->_didExecuteSceneInitializationTasks;
}

- (CNCapabilitiesManager)capabilitiesManager
{
  return self->_capabilitiesManager;
}

- (UIApplication)application
{
  return self->_application;
}

- (CNUserActivityRestorerDelegate)activityRestorerDelegate
{
  return self->_activityRestorerDelegate;
}

+ (OS_os_log)log
{
  if (qword_100025B80 != -1) {
    dispatch_once(&qword_100025B80, &stru_10001C6F0);
  }
  v2 = (void *)qword_100025B88;

  return (OS_os_log *)v2;
}

- (void)executeShortcutIfNecessary:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, BOOL))a4;
  if (a3)
  {
    id v7 = [a3 type];
    if ([v7 isEqualToString:@"com.apple.contacts.create-new-contact"])
    {
      [(ContactsSceneDelegate *)self showNewContact];
      BOOL v8 = 1;
      if (!v6) {
        goto LABEL_12;
      }
    }
    else if ([v7 isEqualToString:@"com.apple.contacts.show-me"])
    {
      BOOL v8 = [(ContactsSceneDelegate *)self showMeContact];
      if (!v6) {
        goto LABEL_12;
      }
    }
    else
    {
      id v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000F2F8((uint64_t)v7, v9);
      }

      BOOL v8 = 0;
      if (!v6) {
        goto LABEL_12;
      }
    }
    v6[2](v6, v8);
LABEL_12:
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  unsigned int v4 = [(ContactsSceneDelegate *)self sceneWindow];
  [v4 setHidden:1];

  [(ContactsSceneDelegate *)self setSceneWindow:0];
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = [(ContactsSceneDelegate *)self contactStoreDataSource];
  [v3 setShouldRevalidateFilterOnStoreChange:1];
}

- (BOOL)splitViewControllerIsDisplayingList
{
  id v3 = [(ContactsSceneDelegate *)self splitViewController];
  if ([v3 displayMode] == (id)2)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(ContactsSceneDelegate *)self splitViewController];
    if ([v5 displayMode] == (id)4)
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = [(ContactsSceneDelegate *)self splitViewController];
      BOOL v4 = [v6 displayMode] == (id)6;
    }
  }

  return v4;
}

- (void)executeActionDelayedUntilSceneInitialization:(id)a3
{
  id v7 = (void (**)(void))a3;
  if ([(ContactsSceneDelegate *)self didExecuteSceneInitializationTasks])
  {
    v7[2]();
  }
  else
  {
    BOOL v4 = [(ContactsSceneDelegate *)self actionsDelayedUntilSceneInitialization];
    id v5 = [v7 copy];
    id v6 = objc_retainBlock(v5);
    [v4 addObject:v6];
  }
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
}

- (id)stateRestorationActivityForScene:(id)a3
{
  BOOL v4 = [(ContactsSceneDelegate *)self splitViewController];
  unsigned int v5 = [v4 isShowingListView];

  id v6 = [(ContactsSceneDelegate *)self splitViewController];
  id v7 = v6;
  if (v5)
  {
    BOOL v8 = [v6 contactNavigationController];
    [v8 createUserActivity];

    id v9 = [(ContactsSceneDelegate *)self splitViewController];
    id v10 = [v9 contactNavigationController];
    uint64_t v11 = [v10 userActivity];
  }
  else
  {
    unsigned int v12 = [v6 isShowingGroups];

    id v9 = [(ContactsSceneDelegate *)self splitViewController];
    uint64_t v13 = [v9 contactNavigationController];
    id v10 = v13;
    if (v12) {
      [v13 userActivityRepresentingGroupsView];
    }
    else {
    uint64_t v11 = [v13 userActivityRepresentingCurrentlyDisplayedContact];
    }
  }
  id v14 = (void *)v11;

  return v14;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5 = a4;
  id v6 = [(ContactsSceneDelegate *)self activityRestorer];
  [v6 shouldEnableActivityIndicatorWhenRestoringUserActivityWithType:v5];
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5 = a4;
  id v6 = [(ContactsSceneDelegate *)self activityRestorer];
  [v6 restoreUserActivity:v5];
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = [(ContactsSceneDelegate *)self activityRestorer];
  [v7 shouldEnableActivityIndicatorWhenRestoringUserActivityWithType:v6];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  [a4 allObjects:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v7 firstObject];
  id v6 = [v5 URL];
  [(ContactsSceneDelegate *)self openContactsURL:v6];
}

- (BOOL)openContactsURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ContactsSceneDelegate *)self splitViewController];
  [v5 cancelSearch];

  if ([v4 isFileURL])
  {
    id v6 = [(ContactsSceneDelegate *)self vCardImportController];
    unsigned __int8 v7 = [(ContactsURLParser *)v6 enqueueContactsAtURL:v4];
LABEL_10:
    BOOL v16 = v7;
    goto LABEL_11;
  }
  BOOL v8 = [ContactsURLParser alloc];
  id v9 = [(ContactsSceneDelegate *)self splitViewController];
  id v10 = [v9 contactNavigationController];
  uint64_t v11 = [v10 dataSource];
  id v6 = [(ContactsURLParser *)v8 initWithURL:v4 dataSource:v11];

  id v12 = [(ContactsURLParser *)v6 actionFound];
  if (v12 != (id)3)
  {
    if (v12 == (id)2)
    {
      uint64_t v13 = self;
      id v14 = v6;
      uint64_t v15 = 1;
    }
    else
    {
      if (v12 != (id)1)
      {
        BOOL v16 = 0;
        goto LABEL_11;
      }
      uint64_t v13 = self;
      id v14 = v6;
      uint64_t v15 = 0;
    }
    unsigned __int8 v7 = [(ContactsSceneDelegate *)v13 showContactFromURLReader:v14 setEditing:v15];
    goto LABEL_10;
  }
  [(ContactsSceneDelegate *)self createNewContact];
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

- (BOOL)showContactFromURLReader:(id)a3 setEditing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = CNIsStringEmpty;
  BOOL v8 = [v6 identifierFound];
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if (v7)
  {
    uint64_t v9 = [v6 legacyIdentifierFound];
    if (!v9
      || (id v10 = (void *)v9,
          [v6 legacyIdentifierFound],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          unsigned int v12 = [v11 intValue],
          v11,
          v10,
          (v12 & 0x80000000) != 0))
    {
      BOOL v15 = 0;
      goto LABEL_8;
    }
    uint64_t v13 = [v6 legacyIdentifierFound];
    unsigned __int8 v14 = -[ContactsSceneDelegate showContactWithLegacyIdentifier:setEditing:](self, "showContactWithLegacyIdentifier:setEditing:", [v13 intValue], v4);
  }
  else
  {
    uint64_t v13 = [v6 identifierFound];
    unsigned __int8 v14 = [(ContactsSceneDelegate *)self showContactWithIdentifier:v13 setEditing:v4];
  }
  BOOL v15 = v14;

LABEL_8:
  return v15;
}

- (id)showMeCardShortcutItem
{
  id v3 = [(ContactsSceneDelegate *)self splitViewController];
  BOOL v4 = [v3 contactNavigationController];
  id v5 = [v4 contactListViewController];
  id v6 = [v5 preferredForNameMeContact];

  if (v6)
  {
    uint64_t v7 = [(ContactsSceneDelegate *)self bundle];
    BOOL v8 = [v7 localizedStringForKey:@"QUICKACTION_TITLE_SHOW_ME" value:0 table:@"InfoPlist"];

    id v9 = [objc_alloc((Class)UIMutableApplicationShortcutItem) initWithType:@"com.apple.contacts.show-me" localizedTitle:v8];
    id v10 = +[UIApplicationShortcutIcon iconWithContact:v6];
    [v9 setIcon:v10];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = +[ContactsTestingManager defaultTestingManager];
  id v9 = [(ContactsSceneDelegate *)self splitViewController];
  unsigned __int8 v10 = [v8 runTest:v7 options:v6 splitViewController:v9];

  return v10;
}

- (void)createNewContact
{
  id v2 = [(ContactsSceneDelegate *)self splitViewController];
  [v2 createNewContact];
}

- (BOOL)showMeContact
{
  id v3 = [(ContactsSceneDelegate *)self splitViewController];
  BOOL v4 = [v3 contactNavigationController];
  id v5 = [v4 dataSource];
  id v6 = [v5 preferredForNameMeContactIdentifier];

  if ((*(uint64_t (**)(void, void *))(CNIsStringEmpty + 16))(CNIsStringEmpty, v6)) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = [(ContactsSceneDelegate *)self showContactWithIdentifier:v6 setEditing:0];
  }

  return v7;
}

- (void)showNewContact
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000BC48;
  v2[3] = &unk_10001C488;
  v2[4] = self;
  [(ContactsSceneDelegate *)self executeActionDelayedUntilSceneInitialization:v2];
}

- (void)showContact:(id)a3
{
}

- (void)showContact:(id)a3 setEditing:(BOOL)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"contact passed to showContact is nil" userInfo:0];
    objc_exception_throw(v8);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000BD64;
  v9[3] = &unk_10001C7A0;
  BOOL v11 = a4;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  [(ContactsSceneDelegate *)self executeActionDelayedUntilSceneInitialization:v9];
}

- (BOOL)showContactWithIdentifier:(id)a3
{
  return [(ContactsSceneDelegate *)self showContactWithIdentifier:a3 setEditing:0];
}

- (BOOL)showContactWithIdentifier:(id)a3 setEditing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((*(unsigned int (**)(void, id))(CNIsStringEmpty + 16))(CNIsStringEmpty, v6))
  {
    id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"identifier passed to showContactWithIdentifier is empty" userInfo:0];
    objc_exception_throw(v17);
  }
  id v7 = [(ContactsSceneDelegate *)self splitViewController];
  id v8 = [v7 store];
  id v9 = +[CNContactViewController descriptorForRequiredKeys];
  v19 = v9;
  id v10 = +[NSArray arrayWithObjects:&v19 count:1];
  id v18 = 0;
  BOOL v11 = [v8 unifiedContactWithIdentifier:v6 keysToFetch:v10 error:&v18];
  id v12 = v18;

  if (v12) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v11 == 0;
  }
  BOOL v14 = !v13;
  if (v13)
  {
    BOOL v15 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000F370((uint64_t)v6, (uint64_t)v12, v15);
    }
  }
  else
  {
    [(ContactsSceneDelegate *)self showContact:v11 setEditing:v4];
  }

  return v14;
}

- (BOOL)showContactWithLegacyIdentifier:(int)a3
{
  return [(ContactsSceneDelegate *)self showContactWithLegacyIdentifier:*(void *)&a3 setEditing:0];
}

- (BOOL)showContactWithLegacyIdentifier:(int)a3 setEditing:(BOOL)a4
{
  if (a3 < 0)
  {
    id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"legacyIdentifier cannot be negative" userInfo:0];
    objc_exception_throw(v17);
  }
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = [(ContactsSceneDelegate *)self splitViewController];
  id v8 = [v7 store];
  id v9 = +[CNContact predicateForLegacyIdentifier:v5];
  id v10 = +[CNContactViewController descriptorForRequiredKeys];
  v19 = v10;
  BOOL v11 = +[NSArray arrayWithObjects:&v19 count:1];
  id v18 = 0;
  id v12 = [v8 unifiedContactsMatchingPredicate:v9 keysToFetch:v11 error:&v18];
  id v13 = v18;

  if (v13 || ((*(uint64_t (**)(void, void *))(CNIsArrayEmpty + 16))(CNIsArrayEmpty, v12) & 1) != 0)
  {
    BOOL v14 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000F3F8((uint64_t)v13, v5, v14);
    }
    BOOL v15 = 0;
  }
  else
  {
    BOOL v14 = [v12 firstObject];
    [(ContactsSceneDelegate *)self showContact:v14 setEditing:v4];
    BOOL v15 = 1;
  }

  return v15;
}

- (void)vCardImportController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C224;
  v7[3] = &unk_10001C7A0;
  id v8 = self;
  id v9 = a4;
  BOOL v10 = a5;
  id v6 = v9;
  [(ContactsSceneDelegate *)v8 executeActionDelayedUntilSceneInitialization:v7];
}

- (void)vCardImportController:(id)a3 didSaveContacts:(id)a4
{
  [a4 firstObject:a3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ContactsSceneDelegate *)self showContact:v5];
}

- (void)searchForString:(id)a3
{
  id v4 = a3;
  id v5 = [(ContactsSceneDelegate *)self splitViewController];
  [v5 searchForString:v4];
}

- (NSBundle)mainBundle
{
  return self->_mainBundle;
}

- (CNUIUserActivityRestorer)activityRestorer
{
  return self->_activityRestorer;
}

- (CNVCardImportController)vCardImportController
{
  return self->_vCardImportController;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsDelayedUntilSceneInitialization, 0);
  objc_storeStrong((id *)&self->_sceneWindow, 0);
  objc_storeStrong((id *)&self->_viewingContactActivityForRestoration, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_vCardImportController, 0);
  objc_storeStrong((id *)&self->_activityRestorerDelegate, 0);
  objc_storeStrong((id *)&self->_activityRestorer, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_mainBundle, 0);
  objc_storeStrong((id *)&self->_capabilitiesManager, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end