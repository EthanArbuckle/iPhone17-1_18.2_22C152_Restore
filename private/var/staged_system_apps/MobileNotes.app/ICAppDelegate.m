@interface ICAppDelegate
+ (ICAppDelegate)sharedInstance;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)extendedLaunchTimeIsLogged;
- (BOOL)icSearchIndexerDisabled;
- (BOOL)inhibitMigrationScreenCheckOnForgroundNotification;
- (BOOL)isAnyAudioInspectorShowingForWindow:(id)a3;
- (BOOL)isAnyWelcomeScreenVisible;
- (BOOL)isAuxWindowForConnectionOptions:(id)a3;
- (BOOL)isLaunchingQuickNoteViaPencil;
- (BOOL)isPendingUserActivityContinuation;
- (BOOL)isReadyForDelayedLaunchTasks;
- (BOOL)isRunningPPT;
- (BOOL)isScrollingTest:(id)a3;
- (BOOL)isSecureScreenShowing;
- (BOOL)launchTaskRunnerShouldRunLaunchTasks:(id)a3;
- (BOOL)refreshAccountsInFolderViewOnActivate;
- (BOOL)requestedAuthorizationToShowUserNotifications;
- (BOOL)resetMigrationStateForInternalSettingsAndShowMigrationScreenIfNecessary;
- (BOOL)scrollTestUseFlick;
- (BOOL)scrollTestUseRecap;
- (BOOL)selectFirstNoteInCollectionView:(id)a3 errorString:(id *)a4;
- (BOOL)selectFirstNoteInScrollView:(id)a3 errorString:(id *)a4;
- (BOOL)selectFirstNoteInTableView:(id)a3 errorString:(id *)a4;
- (BOOL)shouldShowMigrationScreen;
- (BOOL)shouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount;
- (BOOL)showMigrationStartupScreenIfNecessary;
- (ICAllowNotificationsViewController)allowNotificationsViewController;
- (ICAppDelegate)init;
- (ICAppStoreRatingObserver)appStoreRatingObserver;
- (ICLaunchTaskCancellationToken)delayedLaunchTasks;
- (ICNAController)analyticsController;
- (ICNAEventReporter)eventReporter;
- (ICNotesCloudContextDelegate)cloudContextDelegate;
- (ICReachability)reachability;
- (ICRegulatoryLogger)regulatoryLogger;
- (ICSecureWindow)secureWindow;
- (ICServerSideUpdateTaskController)serverSideUpgradeTaskController;
- (ICViewControllerManager)randomViewControllerManager;
- (ICWindowStateArchive)lastBackgroundedArchiveState;
- (ICWindowStateArchive)quicknoteArchiveState;
- (NSArray)viewControllerManagers;
- (NSMapTable)managedObjectContextSaveTasks;
- (NSMapTable)noteContextTasks;
- (NSMutableDictionary)backgroundTasks;
- (NSNumber)userNotificationsAllowed;
- (NSTimer)lockNotesInBackgroundTimer;
- (NSTimer)pendingUserActivityContinuationTimer;
- (NSTimer)repetitiveLoggingTimer;
- (NSURL)launchURL;
- (NSUUID)databaseLockBackgroundTaskIdentifier;
- (NSUserActivity)launchUserActivity;
- (NSUserActivity)userActivityPendingContinuation;
- (UIWindow)window;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)ic_folderListScrollView;
- (id)ic_noteEditorViewController;
- (id)ic_notesGridScrollView;
- (id)ic_notesListScrollView;
- (id)ic_viewControllerManager;
- (id)mainWindowIdentifier;
- (id)serverChangeTokensForCloudKitAccounts:(id)a3;
- (id)sharedInstanceInit;
- (id)undoManager;
- (id)windows;
- (int64_t)_dragDataOwner;
- (int64_t)_dropDataOwner;
- (int64_t)scrollIterationsFromDefaults;
- (int64_t)scrollOffsetFromDefaults;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (unint64_t)beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4;
- (unint64_t)delayedLockProtectedNotesTask;
- (void)accountWillBeDeleted:(id)a3;
- (void)accountsDidChange:(id)a3;
- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4;
- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5;
- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationDidReceiveMemoryWarning:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)authenticationStateDidDeauthenticate:(id)a3;
- (void)bringUpKeyboard;
- (void)buildMenuWithBuilder:(id)a3;
- (void)checkIfHasSharedNotesOrFolders:(id)a3;
- (void)checkIfUserNotificationsAllowed:(id)a3;
- (void)cleanUpTemporaryFiles;
- (void)dealloc;
- (void)didEditorBeginEditing;
- (void)didEditorPresentActivityViewController;
- (void)didFinishExtendedLaunch;
- (void)didShowFolderList;
- (void)didShowGridView;
- (void)didShowNoteEditor;
- (void)didShowNotesList;
- (void)dismissAllowNotificationsWarmingSheet;
- (void)dismissKeyboard;
- (void)dismissMigrationScreenCompletionBlock:(id)a3;
- (void)endBackgroundTask:(unint64_t)a3;
- (void)finishLaunching;
- (void)folderListDidLayoutSubviews;
- (void)goToBottomOfNoteInEditor;
- (void)handleDarwinNotificationName:(id)a3;
- (void)ic_selectFolderNamed:(id)a3;
- (void)ic_selectLocalModernAccount;
- (void)inkPickerDidShow;
- (void)legacyNotesChanged;
- (void)lockAllNotes;
- (void)managedObjectContextDidSave:(id)a3;
- (void)managedObjectContextWillSave:(id)a3;
- (void)mentionNotificationDidSend:(id)a3;
- (void)mentionNotificationWillSend:(id)a3;
- (void)newShareCreatedOrSynced:(id)a3;
- (void)noteContextDidSetupCoreDataStack:(id)a3;
- (void)noteContextWillSetupCoreDataStack:(id)a3;
- (void)noteEditorDidLayoutSubviews;
- (void)noteListDidLayoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openWelcomeScreenWhenLoggingInToUnmigratedICloudAccount;
- (void)performFlickScrollOnScrollView:(id)a3 duration:(double)a4 delta:(int64_t)a5 delayBetweenScroll:(double)a6 iterations:(unint64_t)a7;
- (void)performFlickScrollTestForScrollView:(id)a3 withOptions:(id)a4;
- (void)performScrollTestForScrollView:(id)a3 withOptions:(id)a4;
- (void)persistentContainerDidUnlockDatabase:(id)a3;
- (void)persistentContainerWillLockDatabase:(id)a3;
- (void)registerBackgroundTasks;
- (void)registerForNotifications;
- (void)reindexEverythingThenPerformBlock:(id)a3;
- (void)requestAuthorizationToShowUserNotificationsIfNecessary;
- (void)rotateToOrientation:(int64_t)a3 iterationsRemaining:(int)a4 completion:(id)a5;
- (void)runDelayedLaunchTasks;
- (void)saveLastBackgroundedArchiveState:(id)a3;
- (void)saveQuicknoteArchiveState:(id)a3;
- (void)searchResultBecameVisible;
- (void)sessionDidStartForWindowScene:(id)a3;
- (void)setAllowNotificationsViewController:(id)a3;
- (void)setAppStoreRatingObserver:(id)a3;
- (void)setBackgroundTasks:(id)a3;
- (void)setCloudContextDelegate:(id)a3;
- (void)setDatabaseLockBackgroundTaskIdentifier:(id)a3;
- (void)setDelayedLaunchTasks:(id)a3;
- (void)setDelayedLockProtectedNotesTask:(unint64_t)a3;
- (void)setEventReporter:(id)a3;
- (void)setExtendedLaunchTimeIsLogged:(BOOL)a3;
- (void)setIcSearchIndexerDisabled:(BOOL)a3;
- (void)setInhibitMigrationScreenCheckOnForgroundNotification:(BOOL)a3;
- (void)setLaunchURL:(id)a3;
- (void)setLaunchUserActivity:(id)a3;
- (void)setLaunchingQuickNoteViaPencil:(BOOL)a3;
- (void)setLockNotesInBackgroundTimer:(id)a3;
- (void)setManagedObjectContextSaveTasks:(id)a3;
- (void)setNoteContextTasks:(id)a3;
- (void)setPendingUserActivityContinuation:(BOOL)a3;
- (void)setPendingUserActivityContinuationTimer:(id)a3;
- (void)setReachability:(id)a3;
- (void)setRefreshAccountsInFolderViewOnActivate:(BOOL)a3;
- (void)setRegulatoryLogger:(id)a3;
- (void)setRepetitiveLoggingTimer:(id)a3;
- (void)setRequestedAuthorizationToShowUserNotifications:(BOOL)a3;
- (void)setSecureWindow:(id)a3;
- (void)setServerSideUpgradeTaskController:(id)a3;
- (void)setShouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount:(BOOL)a3;
- (void)setUpAppStoreRatingObserverWithWindowScene:(id)a3;
- (void)setUserActivityPendingContinuation:(id)a3;
- (void)setUserNotificationsAllowed:(id)a3;
- (void)setWindow:(id)a3;
- (void)setupReachability;
- (void)showAccountsList;
- (void)showAccountsListAnimated:(BOOL)a3;
- (void)showAllowNotificationsWarmingSheet:(id)a3;
- (void)showMigrationScreen;
- (void)showNoteWithAccountSelectionBlock:(id)a3 noteSelectionBlock:(id)a4 readyBlock:(id)a5 errorBlock:(id)a6;
- (void)showNotesGridWithAccountSelectionBlock:(id)a3 readyBlock:(id)a4;
- (void)showNotesListWithAccountSelectionBlock:(id)a3 readyBlock:(id)a4;
- (void)showStartupWithCompletionBlock:(id)a3;
- (void)showStartupWithForceWelcomeScreen:(BOOL)a3 completion:(id)a4;
- (void)startAnalyticsSessionWithReferralURL:(id)a3 referralApplication:(id)a4;
- (void)startICInsertChecklistTest:(id)a3;
- (void)startICKeyboardBringUpAndDismissal:(id)a3;
- (void)startICKeyboardRotation:(id)a3;
- (void)startICKeyboardSplitAndMerge:(id)a3;
- (void)startICNewNoteFromNoteViewTest:(id)a3 warm:(BOOL)a4;
- (void)startICNewNoteFromNotesListTest:(id)a3;
- (void)startICNoteEditorTypingTest:(id)a3;
- (void)startICResizeWindowTest:(id)a3;
- (void)startICRotateAccountsListTest:(id)a3;
- (void)startICRotateNoteTest:(id)a3;
- (void)startICRotateNotesListTest:(id)a3;
- (void)startICScrollAccountsListTest:(id)a3;
- (void)startICScrollEnglishNotesListTest:(id)a3;
- (void)startICScrollGridViewTest:(id)a3;
- (void)startICScrollInlineSketchTest:(id)a3;
- (void)startICScrollNoteTest:(id)a3 withKeyboardUp:(BOOL)a4;
- (void)startICScrollNotesListTest:(id)a3;
- (void)startICScrollSearchResultsNotesListTest:(id)a3;
- (void)startICScrollTableHorizontallyTest:(id)a3;
- (void)startICScrollTableVerticallyTest:(id)a3;
- (void)startICShowAccountsListTest:(id)a3;
- (void)startICShowGridViewTest:(id)a3;
- (void)startICShowInkPickerTest:(id)a3;
- (void)startICShowNoteTest:(id)a3;
- (void)startICShowNoteTestInFolderNamed:(id)a3 withOptions:(id)a4;
- (void)startICShowNotesListTest:(id)a3 warm:(BOOL)a4;
- (void)startICShowSearchResultsTest:(id)a3;
- (void)startICShowShareSheetFromNoteViewTest:(id)a3;
- (void)submitBackgroundAnalyticsEventsWithEventReporter:(id)a3;
- (void)submitMoveCheckedItemsToBottomSwitchEventChangedInPreferencesWithState:(BOOL)a3 eventReporter:(id)a4;
- (void)submitPasswordChangeEventsWithReset:(BOOL)a3 eventReporter:(id)a4;
- (void)submitPasswordChangeModeEventWithEventReporter:(id)a3;
- (void)testScrollNote;
- (void)testScrollNotesList;
- (void)textViewDidChange;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
- (void)waitForDelayedLaunchWithCompletionHandler:(id)a3;
- (void)willLoadNoteIntoEditor;
@end

@implementation ICAppDelegate

- (ICNAEventReporter)eventReporter
{
  eventReporter = self->_eventReporter;
  if (!eventReporter)
  {
    id v4 = objc_alloc((Class)ICNAEventReporter);
    v5 = (ICNAEventReporter *)[v4 initWithSubTrackerName:kICNASubtrackerNameAppDelegate];
    v6 = self->_eventReporter;
    self->_eventReporter = v5;

    eventReporter = self->_eventReporter;
  }

  return eventReporter;
}

- (void)registerForNotifications
{
  v3 = +[UIApplication sharedApplication];
  [v3 registerForRemoteNotifications];

  id v4 = +[UNUserNotificationCenter currentNotificationCenter];
  [v4 setDelegate:self];
}

- (void)didShowNoteEditor
{
  if ((byte_1006AA211 & 1) == 0
    && (([(id)qword_1006AA1F8 containsString:@"ICShowNote"] & 1) != 0
     || ([(id)qword_1006AA1F8 containsString:@"ICShowInlineSketchNote"] & 1) != 0
     || [(id)qword_1006AA1F8 containsString:@"ICShowTableNote"]))
  {
    v2 = +[UIDevice currentDevice];
    id v3 = [v2 userInterfaceIdiom];

    if (!v3)
    {
      if (byte_1006AA228 == 1)
      {
        [UIApp finishedSubTest:@"ICDelaySubTest" forTest:qword_1006AA1F8];
        byte_1006AA228 = 0;
      }
      else
      {
        [UIApp finishedSubTest:@"ICAnimationSubTest" forTest:qword_1006AA1F8];
      }
      id v4 = (void *)UIApp;
      uint64_t v5 = qword_1006AA1F8;
      [v4 finishedTest:v5];
    }
  }
}

- (void)willLoadNoteIntoEditor
{
  if ((byte_1006AA211 & 1) == 0
    && (([(id)qword_1006AA1F8 containsString:@"ICShowInlineSketchNote"] & 1) != 0
     || [(id)qword_1006AA1F8 containsString:@"ICShowTableNote"]))
  {
    v2 = +[UIDevice currentDevice];
    id v3 = [v2 userInterfaceIdiom];

    if (v3 == (id)1)
    {
      [UIApp startedTest:qword_1006AA1F8];
      id v4 = (void *)UIApp;
      [v4 installCACommitCompletionBlock:&stru_100629370];
    }
  }
}

- (ICAppDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICAppDelegate;
  v2 = [(ICAppDelegate *)&v5 init];
  id v3 = [(id)objc_opt_class() sharedInstance];

  return v3;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)ICAppDelegate;
  [(ICAppDelegate *)&v5 dealloc];
}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v4 = a4;
  objc_super v5 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100037078();
  }
}

- (void)startAnalyticsSessionWithReferralURL:(id)a3 referralApplication:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICAppDelegate *)self analyticsController];
  [v8 startSessionWithReferralURL:v7 referralApplication:v6 startingSessionType:4];
}

- (BOOL)resetMigrationStateForInternalSettingsAndShowMigrationScreenIfNecessary
{
  id v3 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ICAppDelegate resetMigrationStateForInternalSettingsAndShowMigrationScreenIfNecessary]";
    __int16 v10 = 1024;
    int v11 = 1372;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  BOOL v4 = +[ICStartupController consumeShouldResetMigrationStateInternalSetting];
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007BBE8;
    block[3] = &unk_100625AF0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:kICInternalSettingsResetMigrationStateDefaultKey];

  return v4;
}

- (BOOL)shouldShowMigrationScreen
{
  if ([(ICAppDelegate *)self shouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount])
  {
    id v3 = +[ICNoteContext sharedContext];
    BOOL v4 = [v3 managedObjectContext];
    objc_super v5 = +[ICAccount cloudKitAccountInContext:v4];

    if (v5 && ([v5 didChooseToMigrate] & 1) == 0)
    {
      [(ICAppDelegate *)self setShouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount:0];
      char v6 = 1;
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }
  id v7 = +[UMUserManager sharedManager];
  id v8 = [v7 currentUser];
  id v9 = [v8 userType];

  if (v9 == (id)1)
  {
    +[ICStartupController setHasShownWelcomeScreen:1];
    +[ICMigrationController upgradeEmptyLocalLegacyAccountIfNecessary];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  __int16 v10 = [(ICAppDelegate *)self viewControllerManagers];
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v14);
        if (v15)
        {
          v16 = [v15 systemPaperViewController];

          if (v16)
          {

            return 0;
          }
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (v6) {
    return 1;
  }
  if ([(ICAppDelegate *)self resetMigrationStateForInternalSettingsAndShowMigrationScreenIfNecessary])
  {
    return 0;
  }
  return +[ICStartupController shouldShowWelcomeOrWhatsNewScreen];
}

- (id)sharedInstanceInit
{
  v2 = self;
  v12.receiver = v2;
  v12.super_class = (Class)ICAppDelegate;

  id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  backgroundTasks = v2->_backgroundTasks;
  v2->_backgroundTasks = v3;

  uint64_t v5 = +[NSMapTable strongToStrongObjectsMapTable];
  managedObjectContextSaveTasks = v2->_managedObjectContextSaveTasks;
  v2->_managedObjectContextSaveTasks = (NSMapTable *)v5;

  uint64_t v7 = +[NSMapTable strongToStrongObjectsMapTable];
  noteContextTasks = v2->_noteContextTasks;
  v2->_noteContextTasks = (NSMapTable *)v7;

  uint64_t v9 = +[NSUUID UUID];
  databaseLockBackgroundTaskIdentifier = v2->_databaseLockBackgroundTaskIdentifier;
  v2->_databaseLockBackgroundTaskIdentifier = (NSUUID *)v9;

  return v2;
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[ICAppDelegate applicationWillEnterForeground:]";
    __int16 v16 = 1024;
    int v17 = 870;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v14, 0x12u);
  }

  objc_opt_class();
  char v6 = [v4 object];

  uint64_t v7 = ICCheckedDynamicCast();

  if (self->_isLaunchedInBackground)
  {
    self->_isLaunchedInBackground = 0;
    [(ICAppDelegate *)self finishLaunching];
  }
  else
  {
    id v8 = +[NotesApp sharedNotesApp];
    [v8 applicationWillEnterForeground:v7];

    uint64_t v9 = +[ICNoteContext sharedContext];
    [v9 cleanupAdditionalPersistentStores];

    __int16 v10 = +[ICAttachmentPreviewGenerator sharedGenerator];
    [v10 enableAutomaticPreviewGeneration];
    [v10 generatePreviewsIfNeeded];
    id v11 = +[ICNoteContext sharedContext];
    objc_super v12 = [v11 workerManagedObjectContext];

    [v10 generateMissingOrOutdatedAttachmentMetaDataIfNeededInContext:v12];
    uint64_t v13 = +[ICCloudContext sharedContext];
    [v13 applicationWillEnterForeground];
  }
  if (![(ICAppDelegate *)self inhibitMigrationScreenCheckOnForgroundNotification])
  {
    [(ICAppDelegate *)self setInhibitMigrationScreenCheckOnForgroundNotification:1];
    [(ICAppDelegate *)self showMigrationStartupScreenIfNecessary];
  }
  +[ICNoteListSortUtilities clearCache];
  +[ICDateHeadersUtilities clearCache];
}

- (ICNAController)analyticsController
{
  id v3 = +[ICNAController sharedController];
  id v4 = [v3 appDelegate];

  if (!v4) {
    [v3 setAppDelegate:self];
  }

  return (ICNAController *)v3;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v12 = "-[ICAppDelegate applicationDidBecomeActive:]";
    __int16 v13 = 1024;
    int v14 = 602;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  if (!self->_isActive)
  {
    self->_isActive = 1;
    if ([(ICAppDelegate *)self refreshAccountsInFolderViewOnActivate]) {
      [(ICAppDelegate *)self setRefreshAccountsInFolderViewOnActivate:0];
    }
    uint64_t v5 = [(ICAppDelegate *)self lockNotesInBackgroundTimer];
    [v5 invalidate];

    [(ICAppDelegate *)self setLockNotesInBackgroundTimer:0];
    if ([(ICAppDelegate *)self delayedLockProtectedNotesTask] != UIBackgroundTaskInvalid)
    {
      char v6 = +[UIApplication sharedApplication];
      [v6 endBackgroundTask:[self delayedLockProtectedNotesTask]];

      [(ICAppDelegate *)self setDelayedLockProtectedNotesTask:UIBackgroundTaskInvalid];
    }
  }
  uint64_t v7 = dispatch_get_global_queue(17, 0);
  dispatch_async(v7, &stru_100626E20);

  objc_initWeak((id *)buf, self);
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077E14;
  block[3] = &unk_100625938;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreRatingObserver, 0);
  objc_storeStrong((id *)&self->_allowNotificationsViewController, 0);
  objc_storeStrong((id *)&self->_userNotificationsAllowed, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_databaseLockBackgroundTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_noteContextTasks, 0);
  objc_storeStrong((id *)&self->_managedObjectContextSaveTasks, 0);
  objc_storeStrong((id *)&self->_backgroundTasks, 0);
  objc_storeStrong((id *)&self->_delayedLaunchTasks, 0);
  objc_storeStrong((id *)&self->_launchUserActivity, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_repetitiveLoggingTimer, 0);
  objc_storeStrong((id *)&self->_serverSideUpgradeTaskController, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->_userActivityPendingContinuation, 0);
  objc_storeStrong((id *)&self->_lockNotesInBackgroundTimer, 0);
  objc_storeStrong((id *)&self->_pendingUserActivityContinuationTimer, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_secureWindow, 0);
  objc_storeStrong((id *)&self->_cloudContextDelegate, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

- (void)noteContextDidSetupCoreDataStack:(id)a3
{
  id v4 = [a3 object];
  if (!v4) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteContext) != nil)", "-[ICAppDelegate noteContextDidSetupCoreDataStack:]", 1, 0, @"Expected non-nil value for '%s'", "noteContext");
  }
  uint64_t v5 = [(ICAppDelegate *)self noteContextTasks];
  char v6 = [v5 objectForKey:v4];

  if (!v6) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((taskIdentifierValue) != nil)", "-[ICAppDelegate noteContextDidSetupCoreDataStack:]", 1, 0, @"Expected non-nil value for '%s'", "taskIdentifierValue");
  }
  UIBackgroundTaskIdentifier v9 = UIBackgroundTaskInvalid;
  [v6 getValue:&v9];
  if (v9 != UIBackgroundTaskInvalid)
  {
    uint64_t v7 = +[UIApplication sharedApplication];
    [v7 endBackgroundTask:v9];
  }
  dispatch_time_t v8 = [(ICAppDelegate *)self noteContextTasks];
  [v8 removeObjectForKey:v4];
}

- (void)noteContextWillSetupCoreDataStack:(id)a3
{
  id v4 = [a3 object];
  if (!v4) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteContext) != nil)", "-[ICAppDelegate noteContextWillSetupCoreDataStack:]", 1, 0, @"Expected non-nil value for '%s'", "noteContext");
  }
  uint64_t v5 = [(ICAppDelegate *)self noteContextTasks];
  char v6 = [v5 objectForKey:v4];

  if (v6) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "(([self.noteContextTasks objectForKey:noteContext]) == nil)", "-[ICAppDelegate noteContextWillSetupCoreDataStack:]", 1, 0, @"Expected nil value for '%s'", "[self.noteContextTasks objectForKey:noteContext]");
  }
  uint64_t v7 = +[NSString stringWithFormat:@"Note Context Setup %p", v4];
  dispatch_time_t v8 = +[UIApplication sharedApplication];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007ABBC;
  v13[3] = &unk_100625AF0;
  id v14 = v4;
  id v9 = v4;
  id v10 = [v8 beginBackgroundTaskWithName:v7 expirationHandler:v13];

  id v15 = v10;
  id v11 = [(ICAppDelegate *)self noteContextTasks];
  objc_super v12 = +[NSValue value:&v15 withObjCType:"Q"];
  [v11 setObject:v12 forKey:v9];
}

- (NSMapTable)noteContextTasks
{
  return self->_noteContextTasks;
}

- (void)noteEditorDidLayoutSubviews
{
  if ((byte_1006AA211 & 1) == 0
    && (([(id)qword_1006AA1F8 containsString:@"ICShowNote"] & 1) != 0
     || ([(id)qword_1006AA1F8 containsString:@"ICShowInlineSketchNote"] & 1) != 0
     || [(id)qword_1006AA1F8 containsString:@"ICShowTableNote"]))
  {
    v2 = +[UIDevice currentDevice];
    id v3 = [v2 userInterfaceIdiom];

    if (!v3)
    {
      id v4 = (void *)qword_1006AA1F8;
      sub_1000D63F4(v4);
    }
  }
}

+ (ICAppDelegate)sharedInstance
{
  if (qword_1006AA0D0 != -1) {
    dispatch_once(&qword_1006AA0D0, &stru_100626D58);
  }
  v2 = (void *)qword_1006AA0C8;

  return (ICAppDelegate *)v2;
}

- (void)didFinishExtendedLaunch
{
  if (![(ICAppDelegate *)self extendedLaunchTimeIsLogged]
    && [UIApp shouldRecordExtendedLaunchTime])
  {
    id v3 = (void *)UIApp;
    id v4 = [UIApp _launchTestName];
    [v3 finishedTest:v4];

    [(ICAppDelegate *)self setExtendedLaunchTimeIsLogged:1];
  }
}

- (BOOL)extendedLaunchTimeIsLogged
{
  return self->_extendedLaunchTimeIsLogged;
}

- (BOOL)isRunningPPT
{
  v2 = +[UIApplication sharedApplication];
  if ([v2 isRunningTest])
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    id v4 = +[UIApplication sharedApplication];
    if ([v4 launchedToTest])
    {
      unsigned __int8 v3 = 1;
    }
    else
    {
      uint64_t v5 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v3 = [v5 BOOLForKey:@"isRunningPPT"];
    }
  }

  return v3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_time_t v8 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315394;
    v28 = "-[ICAppDelegate application:didFinishLaunchingWithOptions:]";
    __int16 v29 = 1024;
    int v30 = 336;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v27, 0x12u);
  }

  self->_isLaunchedInBackground = [v7 applicationState] == (id)2;
  [(ICAppDelegate *)self setExtendedLaunchTimeIsLogged:0];
  id v9 = +[NotesApp sharedNotesApp];
  [v9 application:v7 didFinishLaunchingWithOptions:v6];

  id v10 = objc_alloc_init(ICNotesCloudContextDelegate);
  [(ICAppDelegate *)self setCloudContextDelegate:v10];

  id v11 = +[ICCloudContext sharedContext];
  objc_super v12 = [(ICAppDelegate *)self cloudContextDelegate];
  [v11 setCloudContextDelegate:v12];

  __int16 v13 = +[ICCloudContext sharedContext];
  id v14 = +[ICNACloudOperationEventReporter sharedReporter];
  [v13 setCloudAnalyticsDelegate:v14];

  +[ICRemoteFileAttachmentDownloader initializeDownloaderAfterDelayIfNecessary];
  id v15 = +[ICCollaborationUIController sharedInstance];
  __int16 v16 = +[ICCollaborationController sharedInstance];
  [v16 setCollaborationControllerDelegate:v15];

  int v17 = +[ICCollaborationUIController sharedInstance];
  long long v18 = +[ICCollaborationController sharedInstance];
  [v18 setCollaborationAnalyticsDelegate:v17];

  [(ICAppDelegate *)self registerForNotifications];
  long long v19 = [(ICAppDelegate *)self launchURL];
  [(ICAppDelegate *)self setLaunchingQuickNoteViaPencil:+[ICAppURLUtilities isLaunchingQuickNoteViaPencil:v19]];

  long long v20 = [v6 objectForKeyedSubscript:UIApplicationLaunchOptionsUserActivityDictionaryKey];

  if (v20)
  {
    long long v21 = [v20 objectForKeyedSubscript:UIApplicationLaunchOptionsUserActivityTypeKey];
    unsigned int v22 = [v21 isEqualToString:CSSearchableItemActionType];

    if (v22)
    {
      v23 = [v20 objectForKey:@"UIApplicationLaunchOptionsUserActivityKey"];
      [(ICAppDelegate *)self setLaunchUserActivity:v23];
    }
  }
  if (!self->_isLaunchedInBackground) {
    [(ICAppDelegate *)self finishLaunching];
  }
  [(ICAppDelegate *)self registerBackgroundTasks];
  id v24 = objc_alloc_init((Class)ICRegulatoryLogger);
  [(ICAppDelegate *)self setRegulatoryLogger:v24];

  v25 = +[ICCloudContext sharedContext];
  [v25 applicationDidFinishLaunching];

  +[ICAppIntentsManager registerDependencies];
  if (ICDebugModeEnabled()) {
    +[ICGroupActivityDebugStatusController setUp];
  }
  +[ICFastSyncPresenceController setUp];

  return 1;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v5 = a4;
  if ([(ICAppDelegate *)self isAnyWelcomeScreenVisible]
    || [(ICAppDelegate *)self isAnyAudioInspectorShowingForWindow:v5])
  {
    id v6 = [v5 traitCollection];
    id v7 = [v6 userInterfaceIdiom];

    if (v7) {
      unint64_t v8 = 30;
    }
    else {
      unint64_t v8 = 2;
    }
  }
  else
  {
    unint64_t v8 = 30;
  }

  return v8;
}

- (BOOL)isAnyAudioInspectorShowingForWindow:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAppDelegate *)self viewControllerManagers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023B3C;
  v9[3] = &unk_100627150;
  id v10 = v4;
  id v6 = v4;
  unsigned __int8 v7 = [v5 ic_containsObjectPassingTest:v9];

  return v7;
}

- (BOOL)isAnyWelcomeScreenVisible
{
  v2 = [(ICAppDelegate *)self viewControllerManagers];
  unsigned __int8 v3 = [v2 ic_containsObjectPassingTest:&stru_100627128];

  return v3;
}

- (void)finishLaunching
{
  unsigned __int8 v3 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[ICAppDelegate finishLaunching]";
    __int16 v35 = 1024;
    int v36 = 523;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  objc_initWeak((id *)buf, self);
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077DB8;
  block[3] = &unk_100625938;
  objc_copyWeak(&v31, (id *)buf);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"accountWillBeDeleted:" name:ICAccountWillBeDeletedNotification object:0];
  [v5 addObserver:self selector:"accountsDidChange:" name:ICAccountsDidChangeNotification object:0];
  id v6 = +[ICAuthenticationState sharedState];
  [v5 addObserver:self selector:"authenticationStateDidDeauthenticate:" name:ICAuthenticationStateDidDeauthenticateNotification object:v6];

  [v5 addObserver:self selector:"mentionNotificationWillSend:" name:ICMentionNotificationControllerWillSendNotification object:0];
  [v5 addObserver:self selector:"mentionNotificationDidSend:" name:ICMentionNotificationControllerDidSendNotification object:0];
  [v5 addObserver:self selector:"newShareCreatedOrSynced:" name:ICNotesCloudContextDidFetchShareNotification object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v8 = (const __CFString *)ICInternalPreferencesChangedNotification();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100077E0C, v8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)sub_100077E0C, @"com.apple.springboard.lockcomplete", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v10, self, (CFNotificationCallback)sub_100077E0C, @"GSEventHardwareKeyboardAttached", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v11 = +[NSUserDefaults standardUserDefaults];
  [v11 ic_addObserver:self forKeyPath:ICSettingsNoteListSortTypeKey context:&off_1006994F8];

  objc_super v12 = +[NSUserDefaults standardUserDefaults];
  [v12 ic_addObserver:self forKeyPath:ICFolderCustomNoteSortTypeQuerySortKey context:&off_1006994F8];

  __int16 v13 = +[NSUserDefaults standardUserDefaults];
  [v13 ic_addObserver:self forKeyPath:ICSettingsNoteDateHeadersTypeKey context:&off_1006994F8];

  id v14 = +[NSUserDefaults standardUserDefaults];
  [v14 ic_addObserver:self forKeyPath:ICSettingsQueryDateHeadersTypeKey context:&off_1006994F8];

  self->_isActive = 1;
  if ([(ICAppDelegate *)self isRunningPPT])
  {
    if (ICUseCoreDataCoreSpotlightIntegration())
    {
      id v15 = +[ICCDCSIReindexer sharedReindexer];
      [v15 stopIndexing];
    }
    else
    {
      __int16 v16 = +[ICSearchIndexer sharedIndexer];
      [v16 setDisabled:1];

      int v17 = +[ICSearchIndexer sharedIndexer];
      [v17 stopObservingChanges];

      id v15 = os_log_create("com.apple.notes", "Test");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_100037034();
      }
    }
  }
  long long v18 = [(ICAppDelegate *)self window];
  +[ICLongRunningTaskController setMainWindow:v18];

  [(ICAppDelegate *)self setDelayedLockProtectedNotesTask:UIBackgroundTaskInvalid];
  long long v19 = +[NSProcessInfo processInfo];
  long long v20 = [v19 arguments];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v25, "isEqualToString:", @"TestScrollNotesList", (void)v26))
        {
          [(ICAppDelegate *)self testScrollNotesList];
          goto LABEL_21;
        }
        if ([v25 isEqualToString:@"TestScrollNote"])
        {
          [(ICAppDelegate *)self testScrollNote];
          goto LABEL_21;
        }
      }
      id v22 = [v21 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v5 = a4;
  id v6 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    int v17 = "-[ICAppDelegate application:willFinishLaunchingWithOptions:]";
    __int16 v18 = 1024;
    int v19 = 288;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v16, 0x12u);
  }
  uint64_t v7 = 721457;

  if (+[ICDeviceSupport isRunningUnitTests]
    && !+[ICDeviceSupport isRunningDuoTests])
  {
    uint64_t v7 = 4915760;
  }
  +[ICNoteContext startSharedContextWithOptions:v7];
  +[ICNoteContext importArchivesForCurrentLaunchConfigurationIfNeeded];
  +[ICAccount initializeLocalAccountNamesInBackground];
  CFStringRef v8 = [v5 objectForKeyedSubscript:UIApplicationLaunchOptionsURLKey];
  [(ICAppDelegate *)self setLaunchURL:v8];

  if ([(ICAppDelegate *)self isRunningPPT]) {
    +[ICNAOptedInObject disableAnalytics];
  }
  id v9 = [v5 objectForKeyedSubscript:UIApplicationLaunchOptionsSourceApplicationKey];
  id v10 = [(ICAppDelegate *)self analyticsController];
  [v10 startAppSession];

  id v11 = [(ICAppDelegate *)self launchURL];
  [(ICAppDelegate *)self startAnalyticsSessionWithReferralURL:v11 referralApplication:v9];

  if (ICIsSandboxModeEnabled())
  {
    objc_super v12 = +[NSUserDefaults standardUserDefaults];
    [v12 registerDefaults:&off_10064B660];
  }
  __int16 v13 = dispatch_get_global_queue(0, 0);
  dispatch_async(v13, &stru_100626DB8);

  id v14 = +[NSNotificationCenter defaultCenter];
  [v14 addObserver:self selector:"applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
  [v14 addObserver:self selector:"applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
  [v14 addObserver:self selector:"applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
  [v14 addObserver:self selector:"applicationWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];
  [v14 addObserver:self selector:"persistentContainerWillLockDatabase:" name:ICPersistentContainerWillLockDatabaseNotification object:0];
  [v14 addObserver:self selector:"persistentContainerDidUnlockDatabase:" name:ICPersistentContainerDidUnlockDatabaseNotification object:0];
  [v14 addObserver:self selector:"managedObjectContextWillSave:" name:NSManagedObjectContextWillSaveNotification object:0];
  [v14 addObserver:self selector:"managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];
  [v14 addObserver:self selector:"noteContextWillSetupCoreDataStack:" name:NoteContextWillSetUpCoreDataStackNotification object:0];
  [v14 addObserver:self selector:"noteContextDidSetupCoreDataStack:" name:NoteContextDidSetUpCoreDataStackNotification object:0];

  return 1;
}

- (NSArray)viewControllerManagers
{
  v2 = [(ICAppDelegate *)self windows];
  unsigned __int8 v3 = [v2 ic_compactMap:&stru_100626D98];

  return (NSArray *)v3;
}

- (id)windows
{
  v2 = +[NSMutableArray array];
  unsigned __int8 v3 = +[UIApplication sharedApplication];
  dispatch_time_t v4 = [v3 connectedScenes];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) _windows:v13];
        [v2 ic_addObjectsFromNonNilArray:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v2 copy];

  return v11;
}

- (UIWindow)window
{
  return self->_window;
}

- (BOOL)isReadyForDelayedLaunchTasks
{
  return self->_isReadyForDelayedLaunchTasks;
}

- (BOOL)showMigrationStartupScreenIfNecessary
{
  BOOL v3 = [(ICAppDelegate *)self shouldShowMigrationScreen];
  if (v3) {
    [(ICAppDelegate *)self showStartupWithCompletionBlock:0];
  }
  return v3;
}

- (BOOL)shouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount
{
  return self->_shouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount;
}

- (void)setRegulatoryLogger:(id)a3
{
}

- (void)setLaunchingQuickNoteViaPencil:(BOOL)a3
{
  self->_launchingQuickNoteViaPencil = a3;
}

- (void)setLaunchURL:(id)a3
{
}

- (void)setInhibitMigrationScreenCheckOnForgroundNotification:(BOOL)a3
{
  self->_inhibitMigrationScreenCheckOnForgroundNotification = a3;
}

- (void)setExtendedLaunchTimeIsLogged:(BOOL)a3
{
  self->_extendedLaunchTimeIsLogged = a3;
}

- (void)setDelayedLockProtectedNotesTask:(unint64_t)a3
{
  self->_delayedLockProtectedNotesTask = a3;
}

- (void)setCloudContextDelegate:(id)a3
{
}

- (void)registerBackgroundTasks
{
  if (+[ICDeviceSupport isRunningUnitTests])
  {
    BOOL v3 = os_log_create("com.apple.notes", "BackgroundTask");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Skipping registration of background tasks during unit tests", buf, 2u);
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017D24;
    block[3] = &unk_100625AF0;
    void block[4] = self;
    if (qword_1006AA0D8 != -1) {
      dispatch_once(&qword_1006AA0D8, block);
    }
  }
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (BOOL)inhibitMigrationScreenCheckOnForgroundNotification
{
  return self->_inhibitMigrationScreenCheckOnForgroundNotification;
}

- (ICNotesCloudContextDelegate)cloudContextDelegate
{
  return self->_cloudContextDelegate;
}

- (ICViewControllerManager)randomViewControllerManager
{
  v2 = [(ICAppDelegate *)self viewControllerManagers];
  BOOL v3 = [v2 firstObject];

  return (ICViewControllerManager *)v3;
}

- (int64_t)_dragDataOwner
{
  return 3;
}

- (int64_t)_dropDataOwner
{
  return 3;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [v8 role];
  id v10 = (void *)_UIWindowSceneSessionTypeCoverSheet;

  if (v9 == v10)
  {
    long long v13 = @"quicknoteScene";
  }
  else
  {
    unsigned int v11 = [(ICAppDelegate *)self isAuxWindowForConnectionOptions:v7];
    objc_super v12 = off_100699250;
    if (!v11) {
      objc_super v12 = @"mainScene";
    }
    long long v13 = v12;
  }
  id v14 = objc_alloc((Class)UISceneConfiguration);
  long long v15 = [v8 role];

  id v16 = [v14 initWithName:v13 sessionRole:v15];

  return v16;
}

- (BOOL)isAuxWindowForConnectionOptions:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v3 = [a3 userActivities];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 activityType];
        if ([v9 isEqualToString:@"com.apple.notes.open.object"])
        {
          id v10 = [v8 userInfo];
          unsigned int v11 = [v10 objectForKeyedSubscript:@"ICUseAuxiliaryWindow"];
          unsigned __int8 v12 = [v11 isEqual:&__kCFBooleanTrue];

          if (v12)
          {

            BOOL v13 = 1;
            goto LABEL_12;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (void)runDelayedLaunchTasks
{
  BOOL v3 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[ICAppDelegate runDelayedLaunchTasks]";
    __int16 v44 = 1024;
    int v45 = 389;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  if (!+[NSThread isMainThread]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAppDelegate runDelayedLaunchTasks]", 1, 0, @"Unexpected call from background thread");
  }
  self->_isReadyForDelayedLaunchTasks = 1;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"ICAppDelegateWillRunDelayedLaunchTasks" object:self];

  [(ICAppDelegate *)self setupReachability];
  id v5 = [(ICAppDelegate *)self cloudContextDelegate];
  [v5 syncPasswordProtectedNotesIfNecessary];

  uint64_t v6 = [(ICAppDelegate *)self cloudContextDelegate];
  [v6 updateLastOSVersion];

  id v7 = [(ICAppDelegate *)self cloudContextDelegate];
  [v7 updateAppleAccountBags];

  id v8 = [(ICAppDelegate *)self cloudContextDelegate];
  [v8 registerForSyncMessages];

  if (+[ICNoteContext hasSharedContext])
  {
    id v9 = [(ICAppDelegate *)self windows];
    id v10 = [v9 ic_firstObjectOfClass:objc_opt_class()];

    unsigned int v11 = [v10 traitCollection];
    unsigned __int8 v12 = +[ICSystemPaperThumbnailService sharedService];
    [v12 setTraitCollection:v11];

    BOOL v13 = +[ICSystemPaperThumbnailService sharedService];
    [v13 observe];

    id v14 = +[ICSystemPaperThumbnailService sharedService];
    [v14 updateIfNeededWithCompletion:0];
  }
  long long v15 = +[ICWidget sharedWidget];
  [v15 setReloadsTimelinesAutomatically:1];

  long long v16 = +[ICAuthenticationState sharedState];
  [v16 setDeauthenticationTimeInterval:0.0];

  long long v17 = +[UIPasteboard generalPasteboard];
  uint64_t v41 = ICNotePasteboardUTI;
  long long v18 = +[NSArray arrayWithObjects:&v41 count:1];
  unsigned __int8 v19 = [v17 containsPasteboardTypes:v18];

  if ((v19 & 1) == 0) {
    +[ICDataPersister deletePasteboardDataFiles];
  }
  long long v20 = +[UIApplication sharedApplication];
  id v21 = [v20 applicationState];

  if (!v21) {
    +[ICMigrationController continueMigrationIfNecessary];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = +[ICNoteContext sharedContext];
  uint64_t v23 = [v22 managedObjectContext];
  id v24 = +[ICAccount allActiveAccountsInContext:v23];

  id v25 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v37;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        [v29 updateFullNameAndEmail:0];
        int v30 = [v29 accountDataCreateIfNecessary];
        [v30 updateSupportsV1Neo:0];
      }
      id v26 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v26);
  }

  id v31 = +[ICNoteContext sharedContext];
  v32 = [v31 workerManagedObjectContext];
  v33 = +[ICSharedWithYouController sharedController];
  [v33 setManagedObjectContext:v32];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100077788;
  v35[3] = &unk_100626580;
  v35[4] = self;
  v34 = +[ICLaunchTaskRunner runDelayedLaunchTasksWithDelegate:self completionHandler:v35];
  [(ICAppDelegate *)self setDelayedLaunchTasks:v34];
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v39 = "-[ICAppDelegate applicationWillTerminate:]";
    __int16 v40 = 1024;
    int v41 = 657;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  self->_willTerminate = 1;
  uint64_t v6 = [(ICAppDelegate *)self delayedLaunchTasks];
  [v6 cancel];

  [(ICAppDelegate *)self setDelayedLaunchTasks:0];
  id v7 = +[ICQuickNoteSessionManager sharedManager];
  unsigned int v8 = [v7 isQuickNoteSessionActive];

  if (v8)
  {
    id v9 = +[ICQuickNoteSessionManager sharedManager];
    [v9 endSession];
  }
  id v10 = +[NSUserDefaults standardUserDefaults];
  [v10 ic_removeObserver:self forKeyPath:ICSettingsNoteListSortTypeKey context:&off_1006994F8];

  unsigned int v11 = +[NSUserDefaults standardUserDefaults];
  [v11 ic_removeObserver:self forKeyPath:ICFolderCustomNoteSortTypeQuerySortKey context:&off_1006994F8];

  unsigned __int8 v12 = +[NSUserDefaults standardUserDefaults];
  [v12 ic_removeObserver:self forKeyPath:ICSettingsNoteDateHeadersTypeKey context:&off_1006994F8];

  BOOL v13 = +[NSUserDefaults standardUserDefaults];
  [v13 ic_removeObserver:self forKeyPath:ICSettingsQueryDateHeadersTypeKey context:&off_1006994F8];

  id v14 = +[ICAuthenticationState sharedState];
  [v14 deauthenticate];

  long long v15 = +[ICNoteContext sharedContext];
  [v15 saveImmediately];

  long long v16 = +[ICDispatchAfterHandler appLifeCycleHandler];
  [v16 cancelAll];

  long long v17 = +[NotesApp sharedNotesApp];
  [v17 applicationWillTerminate:v4];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v18 = [(ICAppDelegate *)self viewControllerManagers];
  id v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      id v22 = 0;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v22) legacyNoteEditorViewController];
        [v23 donateEditingIntentIfNecessary];

        id v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v20);
  }

  id v24 = +[UIApplication sharedApplication];
  id v25 = [v24 beginBackgroundTaskWithName:@"Remove All Cloud Syncing Activity Events" expirationHandler:&stru_100626E40];

  id v26 = +[ICNoteContext sharedContext];
  uint64_t v27 = [v26 managedObjectContext];
  +[ICCloudSyncingObject removeAllCloudSyncingObjectActivityEventsForUnsharedObjectsInContext:v27];

  long long v28 = +[UIApplication sharedApplication];
  [v28 endBackgroundTask:v25];

  long long v29 = +[ICNoteContext sharedContext];
  [v29 applicationWillTerminate];

  int v30 = +[ICCloudContext sharedContext];
  [v30 applicationWillTerminate];

  id v31 = [(ICAppDelegate *)self appStoreRatingObserver];
  [v31 stopObserving];

  v32 = [(ICAppDelegate *)self analyticsController];
  [v32 appSessionDidTerminate];

  [(ICAppDelegate *)self cleanUpTemporaryFiles];
}

- (void)applicationWillResignActive:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v22 = "-[ICAppDelegate applicationWillResignActive:]";
    __int16 v23 = 1024;
    int v24 = 702;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  objc_opt_class();
  uint64_t v6 = [v4 object];
  id v7 = ICCheckedDynamicCast();

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned int v8 = [(ICAppDelegate *)self viewControllerManagers];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) noteEditorViewController];
        id v14 = [v13 note];
        unsigned int v15 = [v14 isPasswordProtected];

        if (v15)
        {
          [v7 ignoreSnapshotOnNextApplicationLaunch];
          goto LABEL_13;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  if (+[ICFeatureFlags appShortcutsEnabled]) {
    +[ICAppIntentsManager updateAppShortcutParameters];
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];
  uint64_t v6 = ICCheckedDynamicCast();

  if (ICUseCoreDataCoreSpotlightIntegration()) {
    id v7 = [v6 beginBackgroundTaskWithName:@"Save When Backgrounding" expirationHandler:&stru_100626E80];
  }
  else {
    id v7 = [v6 beginBackgroundTaskWithName:@"Save When Backgrounding" expirationHandler:&stru_100626E80 beginBackgroundTaskWithName:@"Finish Indexing" expirationHandler:&stru_100626E60];
  }
  id v8 = v7;
  id v9 = +[ICCloudContext sharedContext];
  [v9 applicationDidEnterBackground];

  id v10 = +[ICMentionNotificationController sharedController];
  [v10 applicationDidEnterBackground];

  uint64_t v11 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[ICAppDelegate applicationDidEnterBackground:]";
    __int16 v54 = 1024;
    int v55 = 740;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  unsigned __int8 v12 = +[ICQuickNoteSessionManager sharedManager];
  if ([v12 isQuickNoteSessionActive])
  {
    BOOL v13 = +[ICQuickNoteSessionManager sharedManager];
    unsigned __int8 v14 = [v13 isSecureScreenShowing];

    if (v14) {
      goto LABEL_12;
    }
    unsigned __int8 v12 = +[ICQuickNoteSessionManager sharedManager];
    unsigned int v15 = [v12 noteEditorViewController];
    long long v16 = [v15 presentedViewController];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      long long v18 = [v15 presentedViewController];
      [v18 prepareForDismissal];
    }
    [v15 dismissViewControllerAnimated:0 completion:0];
    long long v19 = +[ICQuickNoteSessionManager sharedManager];
    [v19 endSession];
  }
LABEL_12:
  self->_isActive = 0;
  id v20 = +[ICDispatchAfterHandler appLifeCycleHandler];
  [v20 cancelAll];

  uint64_t v21 = +[ICNoteContext sharedContext];
  [v21 saveImmediately];

  [v6 endBackgroundTask:v8];
  long long v50 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  id v22 = [(ICAppDelegate *)self viewControllerManagers];
  id v23 = [v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v48;
    do
    {
      id v26 = 0;
      do
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)v26) legacyNoteEditorViewController];
        [v27 donateEditingIntentIfNecessary];

        id v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v24);
  }

  long long v28 = +[ICAttachmentPreviewGenerator sharedGenerator];
  [v28 cancelGenerationOfPendingPreviews];

  long long v29 = +[ICAttachmentPreviewGenerator sharedGenerator];
  [v29 disableAutomaticPreviewGeneration];

  int v30 = +[NSUserDefaults standardUserDefaults];
  [v30 synchronize];

  id v31 = +[NotesApp sharedNotesApp];
  [v31 applicationDidEnterBackground:v6];

  v32 = +[ICNoteContext sharedContext];
  long long v33 = [v32 managedObjectContext];
  long long v34 = +[ICAccount cloudKitAccountInContext:v33];

  if (!v34 || [v34 didChooseToMigrate]) {
    [(ICAppDelegate *)self openWelcomeScreenWhenLoggingInToUnmigratedICloudAccount];
  }
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
  {
    long long v35 = +[ICSearchIndexer sharedIndexer];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100078E9C;
    v44[3] = &unk_100626EA8;
    id v45 = v6;
    uint64_t v46 = v42;
    [v35 finishRemainingOperationsWithCompletionHandler:v44];
  }
  long long v36 = +[ICAuthenticationState sharedState];
  unsigned int v37 = [v36 isAuthenticated];

  if (v37)
  {
    long long v38 = [(ICAppDelegate *)self secureWindow];

    if (v38)
    {
      [(ICAppDelegate *)self lockAllNotes];
    }
    else
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100078EA8;
      v43[3] = &unk_100625AF0;
      v43[4] = self;
      self->_delayedLockProtectedNotesTask = (unint64_t)[v6 beginBackgroundTaskWithName:@"Lock Notes In Background" expirationHandler:v43];
      long long v39 = +[NSTimer timerWithTimeInterval:self target:"lockAllNotes" selector:0 userInfo:0 repeats:480.0];
      [(ICAppDelegate *)self setLockNotesInBackgroundTimer:v39];

      __int16 v40 = +[NSRunLoop currentRunLoop];
      int v41 = [(ICAppDelegate *)self lockNotesInBackgroundTimer];
      [v40 addTimer:v41 forMode:NSDefaultRunLoopMode];
    }
  }
  [(ICAppDelegate *)self setUserNotificationsAllowed:0];
}

- (void)cleanUpTemporaryFiles
{
  uint64_t v11 = 0;
  unsigned __int8 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  char v6 = 0;
  performBlockOnMainThreadAndWait();
  if (!*((unsigned char *)v12 + 24)) {
    +[ICAttachmentModel deletePreviewItemHardLinkURLs];
  }
  if (!*((unsigned char *)v8 + 24) && !*((unsigned char *)v4 + 24)) {
    +[ICDocCamPDFGenerator deleteAllDocCamPDFs];
  }
  _Block_object_dispose(&v3, 8);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

- (void)lockAllNotes
{
  uint64_t v3 = [(ICAppDelegate *)self lockNotesInBackgroundTimer];
  [v3 invalidate];

  [(ICAppDelegate *)self setLockNotesInBackgroundTimer:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(ICAppDelegate *)self viewControllerManagers];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) lockNotesNow];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  if ([(ICAppDelegate *)self delayedLockProtectedNotesTask] != UIBackgroundTaskInvalid) {
    dispatchMainAfterDelay();
  }
  uint64_t v9 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1004D5D14();
  }
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICAppDelegate;
  [(ICAppDelegate *)&v12 buildMenuWithBuilder:v4];
  id v5 = [v4 system];
  id v6 = +[UIMenuSystem mainSystem];

  if (v5 == v6)
  {
    [v4 removeMenuForIdentifier:UIMenuTextSize];
    [v4 replaceChildrenOfMenuForIdentifier:UIMenuFind fromChildrenBlock:&stru_100626F90];
    uint64_t v7 = +[ICKeyboardHandler fileKeyboardShortcutMenu];
    [v4 insertChildMenu:v7 atEndOfMenuForIdentifier:UIMenuFile];

    id v8 = +[ICKeyboardHandler editKeyboardShortcutMenu];
    [v4 insertChildMenu:v8 atEndOfMenuForIdentifier:UIMenuEdit];

    uint64_t v9 = +[ICKeyboardHandler viewKeyboardShortcutMenu];
    [v4 insertChildMenu:v9 atEndOfMenuForIdentifier:UIMenuView];

    long long v10 = +[ICKeyboardHandler goKeyboardShortcutMenu];
    [v4 insertChildMenu:v10 atEndOfMenuForIdentifier:UIMenuRoot];

    long long v11 = +[ICNoteEditorViewController formatKeyboardShortcutMenu];
    [v4 insertChildMenu:v11 atEndOfMenuForIdentifier:UIMenuFormat];
  }
}

- (BOOL)launchTaskRunnerShouldRunLaunchTasks:(id)a3
{
  return +[ICDeviceSupport isRunningUnitTests] ^ 1;
}

- (id)serverChangeTokensForCloudKitAccounts:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v9 = [v8 serverChangeTokens];
        id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v22;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              char v14 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
              unsigned int v15 = [v14 zoneID];
              long long v16 = [v15 zoneName];

              if (v16)
              {
                char v17 = [v14 ckServerChangeToken];
                [v4 addObject:v17];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v11);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1004D5D48();
  }

  uint64_t v9 = +[ICCloudContext sharedContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100079A64;
  v11[3] = &unk_100626FF8;
  id v12 = v7;
  id v10 = v7;
  [v9 handleRemoteNotificationWithUserInfo:v6 completion:v11];
}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v4 = a4;
  ++qword_1006AA0E0;
  double v5 = fmin((double)(unint64_t)(60 * qword_1006AA0E0), 300.0);
  id v6 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1004D5DB0((uint64_t)v4, v6, v5);
  }

  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_100627018);
}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  id v3 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004D5E68();
  }

  id v4 = +[ICAttachmentPreviewGenerator sharedGenerator];
  [v4 didReceiveMemoryWarning];
}

- (void)handleDarwinNotificationName:(id)a3
{
  id v4 = a3;
  double v5 = ICInternalPreferencesChangedNotification();
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    [(ICAppDelegate *)self setRefreshAccountsInFolderViewOnActivate:1];
  }
  else if ([v4 isEqualToString:@"com.apple.springboard.lockcomplete"])
  {
    dispatch_time_t v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1004D5E9C();
    }

    [(ICAppDelegate *)self lockAllNotes];
  }
  else if ([v4 isEqualToString:@"GSEventHardwareKeyboardAttached"])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [(ICAppDelegate *)self viewControllerManagers];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) keyboardHandler];
          [v13 updateHardwareKeyboardAvailability];

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)legacyNotesChanged
{
  v2 = +[ICNoteContext sharedContext];
  [v2 addOrDeleteLocalAccountIfNecessary];

  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];
  unsigned int v5 = [v4 hasChanges];

  if (v5)
  {
    id v7 = +[ICNoteContext sharedContext];
    unsigned int v6 = [v7 managedObjectContext];
    [v6 ic_save];
  }
}

- (void)authenticationStateDidDeauthenticate:(id)a3
{
}

- (void)mentionNotificationWillSend:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100079F94;
  v5[3] = &unk_100625860;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)mentionNotificationDidSend:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007A29C;
  v5[3] = &unk_100625860;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)persistentContainerWillLockDatabase:(id)a3
{
  id v4 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[ICAppDelegate persistentContainerWillLockDatabase:]";
    __int16 v12 = 1024;
    int v13 = 1092;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v10, 0x12u);
  }

  unsigned int v5 = +[UIApplication sharedApplication];
  id v6 = [v5 beginBackgroundTaskWithName:@"Finish Database-locking operation" expirationHandler:&stru_100627038];

  id v7 = +[NSNumber numberWithUnsignedInteger:v6];
  id v8 = [(ICAppDelegate *)self backgroundTasks];
  id v9 = [(ICAppDelegate *)self databaseLockBackgroundTaskIdentifier];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

- (void)persistentContainerDidUnlockDatabase:(id)a3
{
  id v4 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    int v13 = "-[ICAppDelegate persistentContainerDidUnlockDatabase:]";
    __int16 v14 = 1024;
    int v15 = 1102;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v12, 0x12u);
  }

  unsigned int v5 = [(ICAppDelegate *)self backgroundTasks];
  id v6 = [(ICAppDelegate *)self databaseLockBackgroundTaskIdentifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1004D6090();
    }

    id v9 = +[UIApplication sharedApplication];
    [v9 endBackgroundTask:[v7 unsignedIntegerValue]];

    int v10 = [(ICAppDelegate *)self backgroundTasks];
    uint64_t v11 = [(ICAppDelegate *)self databaseLockBackgroundTaskIdentifier];
    [v10 setObject:0 forKeyedSubscript:v11];
  }
}

- (void)managedObjectContextWillSave:(id)a3
{
  id v4 = [a3 object];
  if (!v4) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((context) != nil)", "-[ICAppDelegate managedObjectContextWillSave:]", 1, 0, @"Expected non-nil value for '%s'", "context");
  }
  unsigned int v5 = [(ICAppDelegate *)self managedObjectContextSaveTasks];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "(([self.managedObjectContextSaveTasks objectForKey:context]) == nil)", "-[ICAppDelegate managedObjectContextWillSave:]", 1, 0, @"Expected nil value for '%s'", "[self.managedObjectContextSaveTasks objectForKey:context]");
  }
  id v7 = [v4 name];
  id v8 = +[NSString stringWithFormat:@"Context Save %@", v7];

  id v9 = +[UIApplication sharedApplication];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007A9A8;
  v14[3] = &unk_100625AF0;
  id v15 = v4;
  id v10 = v4;
  id v11 = [v9 beginBackgroundTaskWithName:v8 expirationHandler:v14];

  id v16 = v11;
  int v12 = [(ICAppDelegate *)self managedObjectContextSaveTasks];
  int v13 = +[NSValue value:&v16 withObjCType:"Q"];
  [v12 setObject:v13 forKey:v10];
}

- (void)managedObjectContextDidSave:(id)a3
{
  id v4 = [a3 object];
  if (!v4) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((context) != nil)", "-[ICAppDelegate managedObjectContextDidSave:]", 1, 0, @"Expected non-nil value for '%s'", "context");
  }
  unsigned int v5 = [(ICAppDelegate *)self managedObjectContextSaveTasks];
  id v6 = [v5 objectForKey:v4];

  if (!v6) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((taskIdentifierValue) != nil)", "-[ICAppDelegate managedObjectContextDidSave:]", 1, 0, @"Expected non-nil value for '%s'", "taskIdentifierValue");
  }
  UIBackgroundTaskIdentifier v9 = UIBackgroundTaskInvalid;
  [v6 getValue:&v9];
  if (v9 != UIBackgroundTaskInvalid)
  {
    id v7 = +[UIApplication sharedApplication];
    [v7 endBackgroundTask:v9];
  }
  id v8 = [(ICAppDelegate *)self managedObjectContextSaveTasks];
  [v8 removeObjectForKey:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  if ([(ICAppDelegate *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/GlobalUI/ICAppDelegate.m"])
  {
    unsigned __int8 v13 = [(ICAppDelegate *)self ic_shouldIgnoreObserveValue:v11 ofObject:v10 forKeyPath:v12];

    if (a6 == &off_1006994F8 && (v13 & 1) == 0)
    {
      id v14 = +[NSUserDefaults standardUserDefaults];

      if (v14 == v10)
      {
        +[ICNoteListSortUtilities clearCache];
        +[ICDateHeadersUtilities clearCache];
      }
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICAppDelegate;
    [(ICAppDelegate *)&v15 observeValueForKeyPath:v12 ofObject:v10 change:v11 context:a6];
  }
}

- (void)accountsDidChange:(id)a3
{
  id v4 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1004D60C4();
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v5 = [(ICAppDelegate *)self viewControllerManagers];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [v10 currentAttachmentPresenter];

        if (v11)
        {
          id v12 = [v10 currentAttachmentPresenter];
          unsigned __int8 v13 = [v12 attachments];
          unsigned int v14 = [v13 ic_containsObjectPassingTest:&stru_100627078];

          if (v14)
          {
            objc_super v15 = [v10 currentAttachmentPresenter];
            id v16 = [v15 presentedViewController];
            [v16 dismissViewControllerAnimated:1 completion:0];
          }
        }
        [(ICAppDelegate *)self showMigrationStartupScreenIfNecessary];
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  long long v17 = +[ICAuthenticationState sharedState];
  [v17 deauthenticate];
}

- (void)accountWillBeDeleted:(id)a3
{
  id v4 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1004D60F8();
  }

  unsigned int v5 = [(ICAppDelegate *)self undoManager];
  [v5 removeAllActions];
}

- (void)submitBackgroundAnalyticsEventsWithEventReporter:(id)a3
{
  id v4 = a3;
  [(ICAppDelegate *)self submitMoveCheckedItemsToBottomSwitchEventChangedInPreferencesWithState:1 eventReporter:v4];
  [(ICAppDelegate *)self submitMoveCheckedItemsToBottomSwitchEventChangedInPreferencesWithState:0 eventReporter:v4];
  [(ICAppDelegate *)self submitPasswordChangeEventsWithReset:1 eventReporter:v4];
  [(ICAppDelegate *)self submitPasswordChangeEventsWithReset:0 eventReporter:v4];
  [(ICAppDelegate *)self submitPasswordChangeModeEventWithEventReporter:v4];
}

- (void)submitMoveCheckedItemsToBottomSwitchEventChangedInPreferencesWithState:(BOOL)a3 eventReporter:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  uint64_t v5 = (uint64_t)+[ICInstrumentationUtilities autoSortSelectionChangeCountForState:v4];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    +[ICInstrumentationUtilities clearAutoSortSelectionChangeCountForState:v4];
    do
    {
      [v7 submitMoveCheckedItemsToBottomSwitchEventWithNewState:v4 isInApp:0];
      --v6;
    }
    while (v6);
  }
}

- (void)submitPasswordChangeEventsWithReset:(BOOL)a3 eventReporter:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  uint64_t v6 = (uint64_t)+[ICInstrumentationUtilities recentPasswordChangeCountAsReset:v4];
  id v7 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1004D612C(v4, v6, v7);
  }

  if (v6 >= 1)
  {
    uint64_t v8 = +[ICNoteContext sharedContext];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10007B24C;
    v9[3] = &unk_1006270A0;
    BOOL v12 = v4;
    uint64_t v11 = v6;
    id v10 = v5;
    [v8 performSnapshotBackgroundTask:v9];
  }
}

- (void)submitPasswordChangeModeEventWithEventReporter:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[ICNoteContext sharedContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007B3C0;
  v6[3] = &unk_1006270E8;
  id v7 = v3;
  id v5 = v3;
  [v4 performSnapshotBackgroundTask:v6];
}

- (void)openWelcomeScreenWhenLoggingInToUnmigratedICloudAccount
{
}

- (id)mainWindowIdentifier
{
  id v3 = [(ICAppDelegate *)self lastBackgroundedArchiveState];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 windowIdentifier];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(ICAppDelegate *)self viewControllerManagers];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (![v11 isAuxiliary])
          {
            BOOL v12 = [v11 window];
            id v5 = [v12 windowIdentifier];

            goto LABEL_13;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:

  return v5;
}

- (void)showStartupWithForceWelcomeScreen:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(ICAppDelegate *)self viewControllerManagers];
  id v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10007BA6C;
        v14[3] = &unk_100627178;
        id v12 = v6;
        void v14[4] = self;
        id v15 = v12;
        [v11 showStartupWithForceWelcomeScreen:v4 completion:v14];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)showMigrationScreen
{
}

- (void)showStartupWithCompletionBlock:(id)a3
{
}

- (id)undoManager
{
  return +[NSUndoManager shared];
}

- (void)setUpAppStoreRatingObserverWithWindowScene:(id)a3
{
  id v14 = a3;
  if (+[ICNoteContext hasSharedContext])
  {
    BOOL v4 = +[ICAccountUtilities sharedInstance];
    id v5 = [v4 primaryICloudACAccount];

    id v6 = [v5 identifier];
    if ([v6 length])
    {
      appStoreRatingObserver = self->_appStoreRatingObserver;
      if (!appStoreRatingObserver)
      {
        id v8 = [ICAppStoreRatingObserver alloc];
        uint64_t v9 = +[ICNoteContext sharedContext];
        id v10 = [v9 workerManagedObjectContext];
        uint64_t v11 = +[NSUserDefaults standardUserDefaults];
        id v12 = [(ICAppStoreRatingObserver *)v8 initWithAccountIdentifier:v6 managedObjectContext:v10 userDefaults:v11 windowScene:v14];
        unsigned __int8 v13 = self->_appStoreRatingObserver;
        self->_appStoreRatingObserver = v12;

        appStoreRatingObserver = self->_appStoreRatingObserver;
      }
      [(ICAppStoreRatingObserver *)appStoreRatingObserver startObserving];
    }
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, uint64_t))a5;
  id v8 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1004D62A8();
  }

  v7[2](v7, 26);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = kICNANotificationCenterReferralURL;
  uint64_t v9 = (void (**)(void))a5;
  id v10 = +[NSURL URLWithString:v8];
  [(ICAppDelegate *)self startAnalyticsSessionWithReferralURL:v10 referralApplication:0];

  uint64_t v11 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1004D643C();
  }

  [UIApp setApplicationIconBadgeNumber:0];
  id v12 = [v7 notification];
  unsigned __int8 v13 = [v12 request];
  id v14 = [v13 content];
  id v15 = [v14 userInfo];

  objc_opt_class();
  long long v16 = [v15 objectForKeyedSubscript:kICCloudNotificationsNotesPayloadKey];
  long long v17 = ICDynamicCast();

  objc_opt_class();
  if (v17)
  {
    uint64_t v18 = kICCloudNotificationsNotesPayloadNoteUUIDKey;
    long long v19 = v17;
  }
  else
  {
    uint64_t v18 = kICNotificationNoteIdentifierKey;
    long long v19 = v15;
  }
  long long v20 = [v19 objectForKeyedSubscript:v18];
  long long v21 = ICDynamicCast();

  objc_opt_class();
  long long v22 = [v17 objectForKeyedSubscript:kICCloudNotificationsNotesPayloadInlineAttachmentUUIDKey];
  long long v23 = ICDynamicCast();

  long long v24 = [(ICAppDelegate *)self randomViewControllerManager];
  long long v25 = os_log_create("com.apple.notes", "Notifications");
  long long v26 = v25;
  if (v23 && v21)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_1004D6310();
    }

    [v24 showInlineAttachmentWithIdentifier:v23 inNoteIdentifier:v21];
  }
  else if (v21)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_1004D6394();
    }

    [v24 showNoteWithIdentifier:v21];
  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1004D63FC();
    }
  }
  v9[2](v9);
}

- (void)newShareCreatedOrSynced:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  performBlockOnMainThread();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)checkIfHasSharedNotesOrFolders:(id)a3
{
  id v3 = a3;
  id v4 = +[ICNoteContext sharedContext];
  id v5 = [v4 workerManagedObjectContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007C4A4;
  v8[3] = &unk_100625B40;
  id v9 = v5;
  id v10 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlock:v8];
}

- (void)showAllowNotificationsWarmingSheet:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = +[ICUIApplicationShim sharedInstance];
  id v6 = [v5 keyWindow];
  id v7 = ICDynamicCast();

  if ([v7 behavior] == (id)1)
  {
    uint64_t v8 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Not showing allow notifications warming sheet in Calculator.", v20, 2u);
    }
  }
  else
  {
    id v9 = [v7 ic_topmostPresentedViewController];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v7 rootViewController];
    }
    id v12 = v11;

    if (+[UIDevice ic_isiPhone]) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 2;
    }
    id v14 = objc_alloc_init(ICAllowNotificationsViewController);
    [(ICAppDelegate *)self setAllowNotificationsViewController:v14];

    id v15 = [(ICAppDelegate *)self allowNotificationsViewController];
    [v15 setModalPresentationStyle:v13];

    long long v16 = [(ICAppDelegate *)self allowNotificationsViewController];
    [v16 setModalInPresentation:1];

    if (+[UIDevice ic_isVision])
    {
      long long v17 = [(ICAppDelegate *)self allowNotificationsViewController];
      [v17 setPreferredContentSize:CGSizeMake(512.0, 680.0)];
    }
    uint64_t v18 = [(ICAppDelegate *)self allowNotificationsViewController];
    [v18 setCompletionHandler:v4];

    long long v19 = [(ICAppDelegate *)self allowNotificationsViewController];
    [v12 presentViewController:v19 animated:1 completion:0];
  }
}

- (void)dismissAllowNotificationsWarmingSheet
{
  id v3 = [(ICAppDelegate *)self allowNotificationsViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  [(ICAppDelegate *)self setAllowNotificationsViewController:0];
}

- (void)requestAuthorizationToShowUserNotificationsIfNecessary
{
  if (!+[NSThread isMainThread]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAppDelegate requestAuthorizationToShowUserNotificationsIfNecessary]", 1, 0, @"Unexpected call from background thread");
  }
  if (![(ICAppDelegate *)self requestedAuthorizationToShowUserNotifications])
  {
    if (+[UIDevice ic_isLocked])
    {
LABEL_19:
      id v14 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_1004D64A4();
      }
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v3 = +[UIApplication sharedApplication];
      id v4 = [v3 connectedScenes];

      id v5 = (char *)[v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v25;
        while (2)
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v25 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_opt_class();
            id v9 = ICDynamicCast();
            id v10 = [v9 screen];
            unsigned __int8 v11 = [v10 ic_isSecure];

            if (v11)
            {

              goto LABEL_19;
            }
            ++v8;
          }
          while (v6 != v8);
          id v6 = (char *)[v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

      objc_opt_class();
      id v12 = +[ICUIApplicationShim sharedInstance];
      uint64_t v13 = [v12 keyWindow];
      id v14 = ICDynamicCast();

      id v15 = [v14 ic_topmostPresentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      unsigned __int8 v17 = [(ICAppDelegate *)self isAnyWelcomeScreenVisible];
      uint64_t v18 = [v14 windowScene];
      long long v19 = [v18 session];
      long long v20 = [v19 role];

      if (![(ICAppDelegate *)self requestedAuthorizationToShowUserNotifications])
      {
        long long v21 = +[UIApplication sharedApplication];
        char v22 = ([v21 applicationState] != 0) | v17 | isKindOfClass;

        if ((v22 & 1) == 0 && v20 != (void *)SBSUIWindowSceneSessionRoleSystemNotes)
        {
          [(ICAppDelegate *)self setRequestedAuthorizationToShowUserNotifications:1];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10007CB24;
          v23[3] = &unk_1006271A0;
          v23[4] = self;
          [(ICAppDelegate *)self checkIfUserNotificationsAllowed:v23];
        }
      }
    }
  }
}

- (void)checkIfUserNotificationsAllowed:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(ICAppDelegate *)self userNotificationsAllowed];

  if (v5)
  {
    if (v4)
    {
      id v6 = [(ICAppDelegate *)self userNotificationsAllowed];
      v4[2](v4, [v6 integerValue]);
    }
  }
  else
  {
    uint64_t v7 = +[UNUserNotificationCenter currentNotificationCenter];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007CE6C;
    v8[3] = &unk_1006271F0;
    void v8[4] = self;
    id v9 = v4;
    [v7 getNotificationSettingsWithCompletionHandler:v8];
  }
}

- (void)saveQuicknoteArchiveState:(id)a3
{
  id v3 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 dictionaryRepresentation];

  [v5 setObject:v4 forKey:@"quicknoteState"];
}

- (void)saveLastBackgroundedArchiveState:(id)a3
{
  id v3 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 dictionaryRepresentation];

  [v5 setObject:v4 forKey:@"lastBackgroundedState"];
}

- (ICWindowStateArchive)quicknoteArchiveState
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"quicknoteState"];

  if (v3)
  {
    id v4 = +[ICWindowStateArchive windowStateArchiveFromDictionary:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (ICWindowStateArchive *)v4;
}

- (ICWindowStateArchive)lastBackgroundedArchiveState
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"lastBackgroundedState"];

  if (v3)
  {
    id v4 = +[ICWindowStateArchive windowStateArchiveFromDictionary:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (ICWindowStateArchive *)v4;
}

- (unint64_t)beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[UIApplication sharedApplication];
  id v8 = [v7 beginBackgroundTaskWithName:v6 expirationHandler:v5];

  return (unint64_t)v8;
}

- (void)endBackgroundTask:(unint64_t)a3
{
  id v4 = +[UIApplication sharedApplication];
  [v4 endBackgroundTask:a3];
}

- (void)sessionDidStartForWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)ICNAEventReporter);
  id v6 = [v5 initWithSubTrackerName:kICNASubtrackerNameAppDelegate windowScene:v4];

  [(ICAppDelegate *)self submitBackgroundAnalyticsEventsWithEventReporter:v6];
}

- (void)setupReachability
{
  id v3 = +[ICReachability sharedReachabilityForInternetConnection];
  [(ICAppDelegate *)self setReachability:v3];

  id v4 = [(ICAppDelegate *)self reachability];
  [v4 startNotifier];

  id v5 = +[ICMentionNotificationController sharedController];
  [v5 listenForReachabilityChange];
}

- (void)setWindow:(id)a3
{
}

- (BOOL)isSecureScreenShowing
{
  return self->_secureScreenShowing;
}

- (ICSecureWindow)secureWindow
{
  return self->_secureWindow;
}

- (void)setSecureWindow:(id)a3
{
}

- (BOOL)isLaunchingQuickNoteViaPencil
{
  return self->_launchingQuickNoteViaPencil;
}

- (void)setEventReporter:(id)a3
{
}

- (BOOL)icSearchIndexerDisabled
{
  return self->_icSearchIndexerDisabled;
}

- (void)setIcSearchIndexerDisabled:(BOOL)a3
{
  self->_icSearchIndexerDisabled = a3;
}

- (BOOL)isPendingUserActivityContinuation
{
  return self->_pendingUserActivityContinuation;
}

- (void)setPendingUserActivityContinuation:(BOOL)a3
{
  self->_pendingUserActivityContinuation = a3;
}

- (NSTimer)pendingUserActivityContinuationTimer
{
  return self->_pendingUserActivityContinuationTimer;
}

- (void)setPendingUserActivityContinuationTimer:(id)a3
{
}

- (NSTimer)lockNotesInBackgroundTimer
{
  return self->_lockNotesInBackgroundTimer;
}

- (void)setLockNotesInBackgroundTimer:(id)a3
{
}

- (NSUserActivity)userActivityPendingContinuation
{
  return self->_userActivityPendingContinuation;
}

- (void)setUserActivityPendingContinuation:(id)a3
{
}

- (ICReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
}

- (ICServerSideUpdateTaskController)serverSideUpgradeTaskController
{
  return self->_serverSideUpgradeTaskController;
}

- (void)setServerSideUpgradeTaskController:(id)a3
{
}

- (NSTimer)repetitiveLoggingTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRepetitiveLoggingTimer:(id)a3
{
}

- (BOOL)refreshAccountsInFolderViewOnActivate
{
  return self->_refreshAccountsInFolderViewOnActivate;
}

- (void)setRefreshAccountsInFolderViewOnActivate:(BOOL)a3
{
  self->_refreshAccountsInFolderViewOnActivate = a3;
}

- (NSUserActivity)launchUserActivity
{
  return self->_launchUserActivity;
}

- (void)setLaunchUserActivity:(id)a3
{
}

- (void)setShouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount:(BOOL)a3
{
  self->_shouldShowWelcomeScreenWhenLoggingInToUnmigratedICloudAccount = a3;
}

- (unint64_t)delayedLockProtectedNotesTask
{
  return self->_delayedLockProtectedNotesTask;
}

- (ICLaunchTaskCancellationToken)delayedLaunchTasks
{
  return self->_delayedLaunchTasks;
}

- (void)setDelayedLaunchTasks:(id)a3
{
}

- (NSMutableDictionary)backgroundTasks
{
  return self->_backgroundTasks;
}

- (void)setBackgroundTasks:(id)a3
{
}

- (NSMapTable)managedObjectContextSaveTasks
{
  return self->_managedObjectContextSaveTasks;
}

- (void)setManagedObjectContextSaveTasks:(id)a3
{
}

- (void)setNoteContextTasks:(id)a3
{
}

- (NSUUID)databaseLockBackgroundTaskIdentifier
{
  return self->_databaseLockBackgroundTaskIdentifier;
}

- (void)setDatabaseLockBackgroundTaskIdentifier:(id)a3
{
}

- (ICRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (NSNumber)userNotificationsAllowed
{
  return self->_userNotificationsAllowed;
}

- (void)setUserNotificationsAllowed:(id)a3
{
}

- (BOOL)requestedAuthorizationToShowUserNotifications
{
  return self->_requestedAuthorizationToShowUserNotifications;
}

- (void)setRequestedAuthorizationToShowUserNotifications:(BOOL)a3
{
  self->_requestedAuthorizationToShowUserNotifications = a3;
}

- (ICAllowNotificationsViewController)allowNotificationsViewController
{
  return self->_allowNotificationsViewController;
}

- (void)setAllowNotificationsViewController:(id)a3
{
}

- (ICAppStoreRatingObserver)appStoreRatingObserver
{
  return self->_appStoreRatingObserver;
}

- (void)setAppStoreRatingObserver:(id)a3
{
}

- (void)waitForDelayedLaunchWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (!+[NSThread isMainThread]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAppDelegate(DelayedLaunch) waitForDelayedLaunchWithCompletionHandler:]", 1, 0, @"Unexpected call from background thread");
  }
  if ([(ICAppDelegate *)self isReadyForDelayedLaunchTasks])
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = sub_10007D7F8;
    id v15 = sub_10007D808;
    id v16 = 0;
    id v5 = +[NSNotificationCenter defaultCenter];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007D810;
    v8[3] = &unk_100627218;
    id v10 = &v11;
    id v9 = v4;
    uint64_t v6 = [v5 addObserverForName:@"ICAppDelegateWillRunDelayedLaunchTasks" object:self queue:0 usingBlock:v8];
    uint64_t v7 = (void *)v12[5];
    v12[5] = v6;

    _Block_object_dispose(&v11, 8);
  }
}

- (id)ic_viewControllerManager
{
  v2 = +[ICAppDelegate sharedInstance];
  id v3 = [v2 viewControllerManagers];
  id v4 = [v3 firstObject];

  return v4;
}

- (void)ic_selectLocalModernAccount
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];
  id v8 = +[ICAccount localAccountInContext:v4];

  id v5 = [(ICAppDelegate *)self ic_viewControllerManager];
  uint64_t v6 = [v5 folderListViewController];
  uint64_t v7 = [v8 objectID];
  [v6 selectItemWithIdentifier:v7 animated:0];
}

- (void)ic_selectFolderNamed:(id)a3
{
  id v4 = a3;
  id v5 = +[ICNoteContext sharedContext];
  uint64_t v6 = [v5 managedObjectContext];
  uint64_t v7 = +[ICFolder predicateForVisibleFoldersInContext:v6];
  v18[0] = v7;
  id v8 = +[NSPredicate predicateWithFormat:@"title == %@", v4];
  v18[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v18 count:2];
  id v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];

  uint64_t v11 = +[ICNoteContext sharedContext];
  id v12 = [v11 managedObjectContext];
  uint64_t v13 = +[ICFolder foldersMatchingPredicate:v10 context:v12];

  if ([v13 count] != (id)1) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "folders.count == 1", "-[ICAppDelegate(ICTesting) ic_selectFolderNamed:]", 1, 0, @"Unexpected number (%lu) of folders named: %@", [v13 count], v4);
  }
  id v14 = [v13 firstObject];
  id v15 = [(ICAppDelegate *)self ic_viewControllerManager];
  id v16 = [v15 folderListViewController];
  unsigned __int8 v17 = [v14 objectID];
  [v16 selectItemWithIdentifier:v17 animated:0];
}

- (id)ic_folderListScrollView
{
  v2 = [(ICAppDelegate *)self ic_viewControllerManager];
  id v3 = [v2 folderListViewController];
  id v4 = [v3 collectionView];

  return v4;
}

- (id)ic_notesListScrollView
{
  id v3 = [(ICAppDelegate *)self ic_viewControllerManager];
  id v4 = [v3 rootNoteBrowseViewController];

  if ([v4 noteContainerViewMode]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "noteBrowseViewController.noteContainerViewMode == ICNoteContainerViewModeList", "-[ICAppDelegate(ICTesting) ic_notesListScrollView]", 1, 0, @"Expected a note list, but got view mode %lu", [v4 noteContainerViewMode]);
  }
  id v5 = [(ICAppDelegate *)self ic_viewControllerManager];
  uint64_t v6 = [v5 rootNoteBrowseViewController];
  uint64_t v7 = [v6 collectionView];

  return v7;
}

- (id)ic_noteEditorViewController
{
  v2 = [(ICAppDelegate *)self ic_viewControllerManager];
  id v3 = [v2 noteEditorViewController];

  return v3;
}

- (id)ic_notesGridScrollView
{
  v2 = [(ICAppDelegate *)self ic_viewControllerManager];
  id v3 = [v2 rootNoteBrowseViewController];

  if ([v3 noteContainerViewMode] != (id)1) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "noteBrowseViewController.noteContainerViewMode == ICNoteContainerViewModeGrid", "-[ICAppDelegate(ICTesting) ic_notesGridScrollView]", 1, 0, @"Expected grid view, but got view mode %lu", [v3 noteContainerViewMode]);
  }
  id v4 = [v3 collectionView];

  return v4;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_storeStrong((id *)&qword_1006AA1F8, a4);
  objc_storeStrong(&qword_1006AA200, a5);
  [v8 containsString:@"Landscape"];
  byte_1006AA211 = 0;
  uint64_t v10 = objc_opt_class();
  if (v10) {
    LOBYTE(v10) = +[RPTTestRunner isRecapAvailable];
  }
  byte_1006AA210 = v10;
  [(ICAppDelegate *)self setIcSearchIndexerDisabled:[(ICAppDelegate *)self isScrollingTest:v8]];
  if ([v8 containsString:@"ICShowAccountsList"])
  {
    [(ICAppDelegate *)self startICShowAccountsListTest:v9];
    goto LABEL_8;
  }
  if (([v8 containsString:@"ICScrollAccountsList"] & 1) != 0
    || [v8 containsString:@"ICScrollAccountsListRecap"])
  {
    [(ICAppDelegate *)self startICScrollAccountsListTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICRotateAccountsList"])
  {
    [(ICAppDelegate *)self startICRotateAccountsListTest:v9];
    goto LABEL_8;
  }
  if (([v8 containsString:@"ICShowNotesList"] & 1) != 0
    || [v8 containsString:@"ICWarmShowNotesList"])
  {
    -[ICAppDelegate startICShowNotesListTest:warm:](self, "startICShowNotesListTest:warm:", v9, [v8 containsString:@"ICWarmShowNotesList"]);
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICScrollNotesList"])
  {
    [(ICAppDelegate *)self startICScrollNotesListTest:v9];
    goto LABEL_8;
  }
  if (([v8 containsString:@"ICScrollEnglishNotesList"] & 1) != 0
    || [v8 containsString:@"ICScrollEnglishNotesListRecap"])
  {
    [(ICAppDelegate *)self startICScrollEnglishNotesListTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICNewNoteFromNotesList"])
  {
    [(ICAppDelegate *)self startICNewNoteFromNotesListTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICRotateNotesList"])
  {
    [(ICAppDelegate *)self startICRotateNotesListTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICScrollSearchResultsNotesList"])
  {
    [(ICAppDelegate *)self startICScrollSearchResultsNotesListTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICShowSearchResults"])
  {
    [(ICAppDelegate *)self startICShowSearchResultsTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICScrollTableHorizontally"])
  {
    [(ICAppDelegate *)self startICScrollTableHorizontallyTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICScrollTableVertically"])
  {
    [(ICAppDelegate *)self startICScrollTableVerticallyTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICShowTableNote"])
  {
    CFStringRef v12 = @"Tables";
LABEL_33:
    [(ICAppDelegate *)self startICShowNoteTestInFolderNamed:v12 withOptions:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICShowGridView"])
  {
    [(ICAppDelegate *)self startICShowGridViewTest:v9];
    goto LABEL_8;
  }
  if (([v8 containsString:@"ICScrollNotesGrid"] & 1) != 0
    || [v8 containsString:@"ICScrollNotesGridRecap"])
  {
    [(ICAppDelegate *)self startICScrollGridViewTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICShowInlineSketchNote"])
  {
    CFStringRef v12 = @"Inline Sketches";
    goto LABEL_33;
  }
  if ([v8 containsString:@"ICScrollInlineSketchNote"])
  {
    [(ICAppDelegate *)self startICScrollInlineSketchTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICShowInkPicker"])
  {
    [(ICAppDelegate *)self startICShowInkPickerTest:v9];
    goto LABEL_8;
  }
  if (([v8 containsString:@"ICNewNoteFromNoteView"] & 1) != 0
    || [v8 containsString:@"ICWarmKeyboardNewNoteFromNoteView"])
  {
    -[ICAppDelegate startICNewNoteFromNoteViewTest:warm:](self, "startICNewNoteFromNoteViewTest:warm:", v9, [v8 containsString:@"ICWarmKeyboardNewNoteFromNoteView"]);
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICShowNote"])
  {
    [(ICAppDelegate *)self startICShowNoteTest:v9];
    goto LABEL_8;
  }
  if ([v8 containsString:@"ICScrollNoteKeyboardUp"])
  {
    uint64_t v13 = self;
    id v14 = v9;
    uint64_t v15 = 1;
LABEL_55:
    [(ICAppDelegate *)v13 startICScrollNoteTest:v14 withKeyboardUp:v15];
    goto LABEL_8;
  }
  if (([v8 containsString:@"ICScrollNote"] & 1) != 0
    || [v8 containsString:@"ICScrollNoteRecap"])
  {
    uint64_t v13 = self;
    id v14 = v9;
    uint64_t v15 = 0;
    goto LABEL_55;
  }
  if ([v8 containsString:@"ICShowShareSheetFromNoteView"])
  {
    [(ICAppDelegate *)self startICShowShareSheetFromNoteViewTest:v9];
  }
  else if ([v8 containsString:@"ICRotateNote"])
  {
    [(ICAppDelegate *)self startICRotateNoteTest:v9];
  }
  else if ([v8 containsString:@"ICInsertChecklist"])
  {
    [(ICAppDelegate *)self startICInsertChecklistTest:v9];
  }
  else if ([v8 containsString:@"ICKeyboardBringUpAndDismissal"])
  {
    [(ICAppDelegate *)self startICKeyboardBringUpAndDismissal:v9];
  }
  else if ([v8 containsString:@"ICKeyboardRotation"])
  {
    [(ICAppDelegate *)self startICKeyboardRotation:v9];
  }
  else if ([v8 containsString:@"ICKeyboardSplitAndMerge"])
  {
    [(ICAppDelegate *)self startICKeyboardSplitAndMerge:v9];
  }
  else if ([v8 containsString:@"ICNoteEditorTyping"])
  {
    [(ICAppDelegate *)self startICNoteEditorTypingTest:v9];
  }
  else if ([v8 containsString:@"ICResizeWindow"])
  {
    [(ICAppDelegate *)self startICResizeWindowTest:v9];
  }
LABEL_8:

  return 1;
}

- (void)didShowFolderList
{
  if ((byte_1006AA211 & 1) == 0
    && [(id)qword_1006AA1F8 containsString:@"ICShowAccountsList"])
  {
    if ([(id)qword_1006AA1F8 containsString:@"ICShowAccountsList"])
    {
      if (byte_1006AA228 == 1)
      {
        [UIApp finishedSubTest:@"ICDelaySubTest" forTest:qword_1006AA1F8];
        byte_1006AA228 = 0;
      }
      else
      {
        [UIApp finishedSubTest:@"ICAnimationSubTest" forTest:qword_1006AA1F8];
      }
    }
    v2 = (void *)UIApp;
    uint64_t v3 = qword_1006AA1F8;
    [v2 finishedTest:v3];
  }
}

- (void)folderListDidLayoutSubviews
{
  if ((byte_1006AA211 & 1) == 0
    && [(id)qword_1006AA1F8 containsString:@"ICShowAccountsList"])
  {
    v2 = (void *)qword_1006AA1F8;
    sub_1000D63F4(v2);
  }
}

- (void)didShowNotesList
{
  if ((byte_1006AA211 & 1) == 0
    && (([(id)qword_1006AA1F8 containsString:@"ICShowNotesList"] & 1) != 0
     || [(id)qword_1006AA1F8 containsString:@"ICWarmShowNotesList"]))
  {
    if (byte_1006AA228 == 1)
    {
      [UIApp finishedSubTest:@"ICDelaySubTest" forTest:qword_1006AA1F8];
      byte_1006AA228 = 0;
    }
    else
    {
      [UIApp finishedSubTest:@"ICAnimationSubTest" forTest:qword_1006AA1F8];
    }
    v2 = (void *)UIApp;
    uint64_t v3 = qword_1006AA1F8;
    [v2 finishedTest:v3];
  }
}

- (void)noteListDidLayoutSubviews
{
  if ((byte_1006AA211 & 1) == 0
    && (([(id)qword_1006AA1F8 containsString:@"ICShowNotesList"] & 1) != 0
     || [(id)qword_1006AA1F8 containsString:@"ICWarmShowNotesList"]))
  {
    v2 = (void *)qword_1006AA1F8;
    sub_1000D63F4(v2);
  }
}

- (void)didEditorBeginEditing
{
  if ((byte_1006AA211 & 1) == 0
    && (([(id)qword_1006AA1F8 containsString:@"ICNewNoteFromNotesList"] & 1) != 0
     || ([(id)qword_1006AA1F8 containsString:@"ICNewNoteFromNoteView"] & 1) != 0
     || [(id)qword_1006AA1F8 containsString:@"ICWarmKeyboardNewNoteFromNoteView"]))
  {
    v2 = (void *)UIApp;
    [v2 installCACommitCompletionBlock:&stru_100629390];
  }
}

- (void)didEditorPresentActivityViewController
{
  if ((byte_1006AA211 & 1) == 0
    && [(id)qword_1006AA1F8 containsString:@"ICShowShareSheetFromNoteView"])
  {
    v2 = (void *)UIApp;
    [v2 installCACommitCompletionBlock:&stru_1006293B0];
  }
}

- (void)textViewDidChange
{
  if ((byte_1006AA211 & 1) == 0)
  {
    if ([(id)qword_1006AA1F8 containsString:@"ICInsertChecklist"])
    {
      uint64_t v3 = (void *)UIApp;
      [v3 installCACommitCompletionBlock:&stru_1006293D0];
    }
    else if ([(id)qword_1006AA1F8 containsString:@"ICNoteEditorTyping"] {
           && byte_1006AA212 == 1)
    }
    {
      id v4 = [(ICAppDelegate *)self ic_noteEditorViewController];
      id v9 = [v4 textView];

      id v5 = [v9 textStorage];
      uint64_t v6 = [@"dog" length];
      if ([v5 length] > v6)
      {
        uint64_t v7 = [v5 attributedSubstringFromRange:[v5 length] - v6, v6];
        id v8 = [v7 string];

        if ([v8 isEqualToString:@"dog"]) {
          [UIApp installCACommitCompletionBlock:&stru_1006293F0];
        }
      }
    }
  }
}

- (void)inkPickerDidShow
{
  if ([(id)qword_1006AA1F8 containsString:@"ICShowInkPicker"])
  {
    if (byte_1006AA228 == 1)
    {
      [UIApp finishedSubTest:@"ICDelaySubTest" forTest:qword_1006AA1F8];
      byte_1006AA228 = 0;
    }
    else
    {
      [UIApp finishedSubTest:@"ICAnimationSubTest" forTest:qword_1006AA1F8];
    }
    v2 = (void *)UIApp;
    uint64_t v3 = qword_1006AA1F8;
    [v2 finishedTest:v3];
  }
}

- (void)searchResultBecameVisible
{
  if ((byte_1006AA211 & 1) == 0
    && (byte_1006AA213 & 1) == 0
    && [(id)qword_1006AA1F8 containsString:@"ICShowSearchResults"])
  {
    byte_1006AA213 = 1;
    v2 = (void *)UIApp;
    [v2 installCACommitCompletionBlock:&stru_100629410];
  }
}

- (void)didShowGridView
{
  if ((byte_1006AA211 & 1) == 0
    && [(id)qword_1006AA1F8 containsString:@"ICShowGridView"])
  {
    if (byte_1006AA228 == 1)
    {
      [UIApp finishedSubTest:@"ICDelaySubTest" forTest:qword_1006AA1F8];
      byte_1006AA228 = 0;
    }
    else
    {
      [UIApp finishedSubTest:@"ICAnimationSubTest" forTest:qword_1006AA1F8];
    }
    v2 = (void *)UIApp;
    uint64_t v3 = qword_1006AA1F8;
    _[v2 finishedTest:v3 waitForCommit:0 extraResults:0];
  }
}

- (void)startICShowAccountsListTest:(id)a3
{
  byte_1006AA211 = 1;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D6CB4;
  v4[3] = &unk_100625AF0;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D6D64;
  v3[3] = &unk_100625AF0;
  [(ICAppDelegate *)self showNotesListWithAccountSelectionBlock:v4 readyBlock:v3];
}

- (void)startICScrollAccountsListTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D6F44;
  v4[3] = &unk_100625860;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ICAppDelegate *)v5 dismissMigrationScreenCompletionBlock:v4];
}

- (void)startICRotateAccountsListTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D718C;
  v4[3] = &unk_100625860;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ICAppDelegate *)v5 dismissMigrationScreenCompletionBlock:v4];
}

- (void)startICShowNotesListTest:(id)a3 warm:(BOOL)a4
{
  byte_1006AA211 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D7494;
  v4[3] = &unk_100625D18;
  void v4[4] = self;
  BOOL v5 = a4;
  [(ICAppDelegate *)self dismissMigrationScreenCompletionBlock:v4];
}

- (void)performScrollTestForScrollView:(id)a3 withOptions:(id)a4
{
  id v5 = a4;
  id v12 = a3;
  id v6 = [v5 objectForKey:@"iterations"];
  id v7 = [v6 intValue];

  id v8 = [v5 objectForKey:@"offset"];
  unsigned int v9 = [v8 intValue];

  [v12 scrollToTop];
  uint64_t v10 = [v5 objectForKey:@"recapBased"];

  LODWORD(v5) = [v10 BOOLValue];
  if (v5)
  {
    [v12 ic_performRecapScrollTestNamed:qword_1006AA1F8 iterations:(int)v7];
  }
  else
  {
    if (v9) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 20;
    }
    [v12 _performScrollTest:qword_1006AA1F8 iterations:v7 delta:v11];
  }
}

- (void)performFlickScrollOnScrollView:(id)a3 duration:(double)a4 delta:(int64_t)a5 delayBetweenScroll:(double)a6 iterations:(unint64_t)a7
{
  id v12 = a3;
  uint64_t v13 = os_log_create("com.apple.notes", "Test");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1004DAE84(v13);
  }

  double v14 = (double)a5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D7B60;
  v16[3] = &unk_100629480;
  id v17 = v12;
  unint64_t v18 = a7;
  v16[4] = self;
  double v19 = a6;
  double v20 = a4;
  int64_t v21 = a5;
  id v15 = v12;
  [v15 _simulateScrollWithTranslation:0 duration:0 willBeginDragging:0 didEndDragging:v16 willBeginDecelerating:0 didEndDecelerating:v14 a4];
}

- (void)performFlickScrollTestForScrollView:(id)a3 withOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 objectForKey:@"iterations"];
  signed int v9 = [v8 intValue];

  uint64_t v10 = [v6 objectForKey:@"offset"];
  unsigned int v11 = [v10 intValue];
  if (v11) {
    int v12 = v11;
  }
  else {
    int v12 = 100;
  }

  uint64_t v13 = [v6 objectForKey:@"flickDelay"];

  [v13 doubleValue];
  double v15 = v14;

  id v16 = os_log_create("com.apple.notes", "Test");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134218752;
    uint64_t v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = v12;
    __int16 v21 = 2048;
    uint64_t v22 = 0x3FC999999999999ALL;
    __int16 v23 = 2048;
    double v24 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Flick scroll test iterations %lu, delta: %lu, duration: %.2f, delay: %.2f", (uint8_t *)&v17, 0x2Au);
  }

  [v7 scrollToTop];
  [(ICAppDelegate *)self performFlickScrollOnScrollView:v7 duration:v12 delta:v9 delayBetweenScroll:0.2 iterations:v15];
}

- (void)startICScrollNotesListTest:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D7F2C;
  v6[3] = &unk_100625AF0;
  id v7 = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D7F34;
  v4[3] = &unk_100625860;
  void v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [(ICAppDelegate *)v7 showNotesListWithAccountSelectionBlock:v6 readyBlock:v4];
}

- (void)startICScrollEnglishNotesListTest:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D806C;
  v6[3] = &unk_100625AF0;
  id v7 = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D807C;
  v4[3] = &unk_100625860;
  void v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [(ICAppDelegate *)v7 showNotesListWithAccountSelectionBlock:v6 readyBlock:v4];
}

- (void)startICScrollSearchResultsNotesListTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D8170;
  v4[3] = &unk_100625860;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ICAppDelegate *)v5 reindexEverythingThenPerformBlock:v4];
}

- (void)startICRotateNotesListTest:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D84F0;
  v7[3] = &unk_100625AF0;
  id v8 = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D84F8;
  v4[3] = &unk_100625860;
  id v5 = a3;
  id v6 = v8;
  id v3 = v5;
  [(ICAppDelegate *)v8 showNotesListWithAccountSelectionBlock:v7 readyBlock:v4];
}

- (void)startICShowNoteTest:(id)a3
{
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D86CC;
  v4[3] = &unk_100625AF0;
  void v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D86D4;
  v3[3] = &unk_100625AF0;
  [(ICAppDelegate *)self showNotesListWithAccountSelectionBlock:v4 readyBlock:v3];
}

- (void)startICNewNoteFromNotesListTest:(id)a3
{
  byte_1006AA211 = 1;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D8858;
  v4[3] = &unk_100625AF0;
  void v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D8860;
  v3[3] = &unk_100625AF0;
  [(ICAppDelegate *)self showNotesListWithAccountSelectionBlock:v4 readyBlock:v3];
}

- (void)startICNewNoteFromNoteViewTest:(id)a3 warm:(BOOL)a4
{
  byte_1006AA211 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D8AE8;
  v8[3] = &unk_1006294C8;
  void v8[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D8B1C;
  v6[3] = &unk_1006294F0;
  void v6[4] = self;
  BOOL v7 = a4;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D8C34;
  v4[3] = &unk_100625D18;
  void v4[4] = self;
  BOOL v5 = a4;
  [(ICAppDelegate *)self showNoteWithAccountSelectionBlock:v8 noteSelectionBlock:v6 readyBlock:v4 errorBlock:&stru_100629350];
}

- (void)startICScrollNoteTest:(id)a3 withKeyboardUp:(BOOL)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D8FB4;
  v9[3] = &unk_1006294C8;
  uint64_t v10 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D8FD4;
  v7[3] = &unk_1006294F0;
  void v7[4] = self;
  BOOL v8 = a4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D9044;
  v5[3] = &unk_100625860;
  void v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  [(ICAppDelegate *)v10 showNoteWithAccountSelectionBlock:v9 noteSelectionBlock:v7 readyBlock:v5 errorBlock:&stru_100629350];
}

- (void)startICShowShareSheetFromNoteViewTest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D919C;
  v5[3] = &unk_1006294C8;
  void v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D91BC;
  v4[3] = &unk_1006294C8;
  void v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D9214;
  v3[3] = &unk_100625AF0;
  [(ICAppDelegate *)self showNoteWithAccountSelectionBlock:v5 noteSelectionBlock:v4 readyBlock:v3 errorBlock:&stru_100629350];
}

- (void)startICRotateNoteTest:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D9428;
  v8[3] = &unk_1006294C8;
  signed int v9 = self;
  id v6 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D9448;
  v7[3] = &unk_1006294C8;
  void v7[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D94A0;
  v4[3] = &unk_100625860;
  id v5 = a3;
  id v3 = v5;
  [(ICAppDelegate *)v9 showNoteWithAccountSelectionBlock:v8 noteSelectionBlock:v7 readyBlock:v4 errorBlock:&stru_100629350];
}

- (void)startICScrollTableHorizontallyTest:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D96EC;
  v8[3] = &unk_1006294C8;
  signed int v9 = self;
  id v6 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D9714;
  v7[3] = &unk_1006294C8;
  void v7[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D976C;
  v4[3] = &unk_100625860;
  id v5 = a3;
  id v3 = v5;
  [(ICAppDelegate *)v9 showNoteWithAccountSelectionBlock:v8 noteSelectionBlock:v7 readyBlock:v4 errorBlock:&stru_100629350];
}

- (void)startICScrollTableVerticallyTest:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D9940;
  v8[3] = &unk_1006294C8;
  signed int v9 = self;
  id v6 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D9968;
  v7[3] = &unk_1006294C8;
  void v7[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D99C0;
  v4[3] = &unk_100625860;
  id v5 = a3;
  id v3 = v5;
  [(ICAppDelegate *)v9 showNoteWithAccountSelectionBlock:v8 noteSelectionBlock:v7 readyBlock:v4 errorBlock:&stru_100629350];
}

- (void)startICShowGridViewTest:(id)a3
{
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D9B1C;
  v4[3] = &unk_100625AF0;
  void v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D9B24;
  v3[3] = &unk_100625AF0;
  [(ICAppDelegate *)self showNotesListWithAccountSelectionBlock:v4 readyBlock:v3];
}

- (void)startICScrollGridViewTest:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D9D08;
  v6[3] = &unk_100625AF0;
  BOOL v7 = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000D9D18;
  v4[3] = &unk_100625860;
  void v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [(ICAppDelegate *)v7 showNotesGridWithAccountSelectionBlock:v6 readyBlock:v4];
}

- (void)startICShowNoteTestInFolderNamed:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  byte_1006AA211 = 1;
  id v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 == (id)1)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000D9EEC;
    v16[3] = &unk_100625860;
    BOOL v8 = &v17;
    v16[4] = self;
    id v17 = v5;
    id v9 = v5;
    uint64_t v10 = &stru_100629530;
    unsigned int v11 = v16;
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000D9F00;
    v14[3] = &unk_100625860;
    BOOL v8 = &v15;
    void v14[4] = self;
    id v15 = v5;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000D9F0C;
    v13[3] = &unk_100625AF0;
    void v13[4] = self;
    id v12 = v5;
    uint64_t v10 = (Block_layout *)v14;
    unsigned int v11 = v13;
  }
  [(ICAppDelegate *)self showNotesListWithAccountSelectionBlock:v10 readyBlock:v11];
}

- (void)startICScrollInlineSketchTest:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DA0F4;
  v8[3] = &unk_1006294C8;
  id v9 = self;
  id v6 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DA11C;
  v7[3] = &unk_1006294C8;
  void v7[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000DA174;
  v4[3] = &unk_100625860;
  id v5 = a3;
  id v3 = v5;
  [(ICAppDelegate *)v9 showNoteWithAccountSelectionBlock:v8 noteSelectionBlock:v7 readyBlock:v4 errorBlock:&stru_100629350];
}

- (void)startICKeyboardBringUpAndDismissal:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DA31C;
  v5[3] = &unk_1006294C8;
  void v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000DA33C;
  v4[3] = &unk_1006294C8;
  void v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DA394;
  v3[3] = &unk_100625AF0;
  [(ICAppDelegate *)self showNoteWithAccountSelectionBlock:v5 noteSelectionBlock:v4 readyBlock:v3 errorBlock:&stru_100629350];
}

- (void)startICKeyboardRotation:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DA560;
  v5[3] = &unk_1006294C8;
  void v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000DA580;
  v4[3] = &unk_1006294C8;
  void v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DA5D8;
  v3[3] = &unk_100625AF0;
  [(ICAppDelegate *)self showNoteWithAccountSelectionBlock:v5 noteSelectionBlock:v4 readyBlock:v3 errorBlock:&stru_100629350];
}

- (void)startICKeyboardSplitAndMerge:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DA7A4;
  v5[3] = &unk_1006294C8;
  void v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000DA7C4;
  v4[3] = &unk_1006294C8;
  void v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DA81C;
  v3[3] = &unk_100625AF0;
  [(ICAppDelegate *)self showNoteWithAccountSelectionBlock:v5 noteSelectionBlock:v4 readyBlock:v3 errorBlock:&stru_100629350];
}

- (void)startICInsertChecklistTest:(id)a3
{
  byte_1006AA211 = 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DA9F0;
  v5[3] = &unk_1006294C8;
  void v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000DAA24;
  v4[3] = &unk_1006294C8;
  void v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DAC30;
  v3[3] = &unk_100625AF0;
  [(ICAppDelegate *)self showNoteWithAccountSelectionBlock:v5 noteSelectionBlock:v4 readyBlock:v3 errorBlock:&stru_100629550];
}

- (void)startICShowInkPickerTest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DAE08;
  v5[3] = &unk_1006294C8;
  void v5[4] = self;
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000DAE3C;
  v4[3] = &unk_1006294C8;
  void v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DAE94;
  v3[3] = &unk_100625AF0;
  [(ICAppDelegate *)self showNoteWithAccountSelectionBlock:v5 noteSelectionBlock:v4 readyBlock:v3 errorBlock:&stru_100629350];
}

- (void)startICShowSearchResultsTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000DAFA0;
  v4[3] = &unk_100625860;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ICAppDelegate *)v5 reindexEverythingThenPerformBlock:v4];
}

- (void)startICNoteEditorTypingTest:(id)a3
{
  if (byte_1006AA210)
  {
    byte_1006AA211 = 1;
    byte_1006AA212 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DB2AC;
    v7[3] = &unk_1006294C8;
    void v7[4] = self;
    void v5[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DB2E0;
    v6[3] = &unk_1006294C8;
    void v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000DB670;
    v5[3] = &unk_100625AF0;
    [(ICAppDelegate *)self showNoteWithAccountSelectionBlock:v7 noteSelectionBlock:v6 readyBlock:v5 errorBlock:&stru_100629570];
  }
  else
  {
    id v3 = (void *)UIApp;
    uint64_t v4 = qword_1006AA1F8;
    [v3 failedTest:v4 withFailure:@"Recap required"];
  }
}

- (void)startICResizeWindowTest:(id)a3
{
  if (byte_1006AA210)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DBBF0;
    v7[3] = &unk_1006294C8;
    void v7[4] = self;
    void v5[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000DBC24;
    v6[3] = &unk_1006294C8;
    void v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000DBC7C;
    v5[3] = &unk_100625AF0;
    [(ICAppDelegate *)self showNoteWithAccountSelectionBlock:v7 noteSelectionBlock:v6 readyBlock:v5 errorBlock:&stru_100629350];
  }
  else
  {
    id v3 = (void *)UIApp;
    uint64_t v4 = qword_1006AA1F8;
    [v3 failedTest:v4 withFailure:@"Recap required"];
  }
}

- (int64_t)scrollIterationsFromDefaults
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"scrollTestIterations"];

  if ((uint64_t)v3 <= 0) {
    return 6;
  }
  else {
    return (int64_t)v3;
  }
}

- (int64_t)scrollOffsetFromDefaults
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"scrollTestOffset"];

  if ((uint64_t)v3 <= 0) {
    return 3;
  }
  else {
    return (int64_t)v3;
  }
}

- (BOOL)scrollTestUseRecap
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"scrollTestUseRecap"];

  return v3;
}

- (BOOL)scrollTestUseFlick
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"scrollTestUseFlick"];

  return v3;
}

- (void)testScrollNotesList
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DBF44;
  v5[3] = &unk_100625AF0;
  void v5[4] = self;
  [(ICAppDelegate *)self showNotesListWithAccountSelectionBlock:v5 readyBlock:0];
  int out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000DBF54;
  handler[3] = &unk_100629598;
  handler[4] = self;
  notify_register_dispatch("com.apple.mobilenotes.testScrollNotesList", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (void)testScrollNote
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DC1F0;
  v6[3] = &unk_1006294C8;
  void v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DC210;
  v5[3] = &unk_1006294C8;
  void v5[4] = self;
  [(ICAppDelegate *)self showNoteWithAccountSelectionBlock:v6 noteSelectionBlock:v5 readyBlock:0 errorBlock:&stru_100629350];
  int out_token = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DC268;
  v3[3] = &unk_100629598;
  v3[4] = self;
  notify_register_dispatch("com.apple.mobilenotes.testScrollNote", &out_token, (dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)reindexEverythingThenPerformBlock:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSDate date];
  id v5 = os_log_create("com.apple.notes", "Test");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004DAF40(v5);
  }

  if (ICUseCoreDataCoreSpotlightIntegration())
  {
    id v6 = +[ICCDCSIReindexer sharedReindexer];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000DC5A0;
    v16[3] = &unk_100625230;
    id v17 = v4;
    id v18 = v3;
    id v7 = v3;
    id v8 = v4;
    [v6 reindexAllSearchableItemsWithCompletionHandler:v16];

    id v9 = v17;
  }
  else
  {
    uint64_t v10 = +[ICSearchIndexer sharedIndexer];
    [v10 setDisabled:0];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000DC614;
    v12[3] = &unk_1006295C0;
    id v13 = v4;
    id v14 = v10;
    id v15 = v3;
    id v9 = v3;
    id v7 = v10;
    id v11 = v4;
    [v7 reindexAllSearchableItemsWithCompletionHandler:v12];
  }
}

- (void)dismissMigrationScreenCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(ICAppDelegate *)self window];
  id v6 = ICDynamicCast();
  id v7 = [v6 ic_topmostPresentedViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 noUpgradeActionAndDismiss];
    int64_t v8 = 2000000000;
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v8 = 0;
  if (v4)
  {
LABEL_5:
    dispatch_time_t v9 = dispatch_time(0, v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DC7CC;
    block[3] = &unk_100625988;
    id v11 = v4;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
LABEL_6:
}

- (void)showNotesListWithAccountSelectionBlock:(id)a3 readyBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DC89C;
  v7[3] = &unk_100625CC8;
  int64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(ICAppDelegate *)v8 dismissMigrationScreenCompletionBlock:v7];
}

- (void)showNotesGridWithAccountSelectionBlock:(id)a3 readyBlock:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DCB30;
  v6[3] = &unk_100625B40;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(ICAppDelegate *)v7 showNotesListWithAccountSelectionBlock:a3 readyBlock:v6];
}

- (void)showNoteWithAccountSelectionBlock:(id)a3 noteSelectionBlock:(id)a4 readyBlock:(id)a5 errorBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000DCDD0;
  v17[3] = &unk_100629660;
  v17[4] = self;
  id v18 = v10;
  id v19 = a6;
  id v20 = v11;
  id v21 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v19;
  id v16 = v10;
  [(ICAppDelegate *)self dismissMigrationScreenCompletionBlock:v17];
}

- (BOOL)selectFirstNoteInCollectionView:(id)a3 errorString:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 numberOfItemsInSection:0];
  if (v6)
  {
    id v7 = +[NSIndexPath indexPathForItem:0 inSection:0];
    id v8 = [v5 delegate];
    unsigned __int8 v9 = [v8 collectionView:v5 shouldSelectItemAtIndexPath:v7];

    if (v9)
    {
      id v10 = v7;
    }
    else
    {
      id v10 = +[NSIndexPath indexPathForItem:1 inSection:0];

      id v11 = [v5 delegate];
      unsigned __int8 v12 = [v11 collectionView:v5 shouldSelectItemAtIndexPath:v10];

      if ((v12 & 1) == 0) {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[collectionView.delegate collectionView:collectionView shouldSelectItemAtIndexPath:indexPath]", "-[ICAppDelegate(ICTesting) selectFirstNoteInCollectionView:errorString:]", 1, 0, @"2nd item in collection view is not a note");
      }
    }
    [v5 selectItemAtIndexPath:v10 animated:0 scrollPosition:0];
    id v13 = [v5 delegate];
    [v13 collectionView:v5 didSelectItemAtIndexPath:v10];

    id v14 = [v5 delegate];
    [v14 collectionView:v5 performPrimaryActionForItemAtIndexPath:v10];
  }
  else if (a4)
  {
    *a4 = @"No notes found.";
  }

  return v6 != 0;
}

- (BOOL)selectFirstNoteInTableView:(id)a3 errorString:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 numberOfRowsInSection:0];
  if (v6)
  {
    id v7 = +[NSIndexPath indexPathForItem:0 inSection:0];
    [v5 selectRowAtIndexPath:v7 animated:0 scrollPosition:0];
    id v8 = [v5 delegate];
    [v8 tableView:v5 didSelectRowAtIndexPath:v7];
  }
  else if (a4)
  {
    *a4 = @"No notes found.";
  }

  return v6 != 0;
}

- (BOOL)selectFirstNoteInScrollView:(id)a3 errorString:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v7 = [(ICAppDelegate *)self selectFirstNoteInTableView:v6 errorString:a4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    unsigned __int8 v7 = [(ICAppDelegate *)self selectFirstNoteInCollectionView:v6 errorString:a4];
  }
  BOOL v8 = v7;
LABEL_7:

  return v8;
}

- (void)showAccountsList
{
}

- (void)showAccountsListAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICAppDelegate *)self ic_viewControllerManager];
  [v4 showAccountListAnimated:v3];
}

- (void)bringUpKeyboard
{
  id v2 = [(ICAppDelegate *)self ic_noteEditorViewController];
  [v2 setEditing:1 animated:1];
}

- (void)goToBottomOfNoteInEditor
{
  id v2 = [(ICAppDelegate *)self ic_noteEditorViewController];
  id v6 = [v2 textView];

  BOOL v3 = [v6 textStorage];
  [v6 setSelectedRange:[v3 length]];

  id v4 = [v6 selectedRange];
  [v6 ic_scrollRangeToVisible:v4 consideringInsets:v5 animated:1];
}

- (void)dismissKeyboard
{
  id v2 = [(ICAppDelegate *)self ic_noteEditorViewController];
  [v2 setEditing:0 animated:1];
}

- (BOOL)isScrollingTest:(id)a3
{
  uint64_t v3 = qword_1006AA220;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1006AA220, &stru_100629680);
  }
  unsigned __int8 v5 = [(id)qword_1006AA218 containsObject:v4];

  return v5;
}

- (void)rotateToOrientation:(int64_t)a3 iterationsRemaining:(int)a4 completion:(id)a5
{
  BOOL v8 = (void (**)(void))a5;
  unsigned __int8 v9 = v8;
  if (a4 < 1)
  {
    v8[2](v8);
  }
  else
  {
    id v10 = (void *)UIApp;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000DD7AC;
    v11[3] = &unk_1006296D0;
    int64_t v13 = a3;
    void v11[4] = self;
    int v14 = a4;
    unsigned __int8 v12 = v8;
    [v10 rotateIfNeeded:a3 completion:v11];
  }
}

@end