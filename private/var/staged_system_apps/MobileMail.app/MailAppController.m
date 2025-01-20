@interface MailAppController
+ (id)allTestsName;
+ (id)log;
- (BOOL)_allMessageViewControllersDidDisplayContent:(id)a3;
- (BOOL)_shouldShowAlertForUndoManager:(id)a3;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)canPerformNetworkOperationOnAccount:(id)a3;
- (BOOL)canRegisterForAPSPush;
- (BOOL)canUseSpotlightIndex;
- (BOOL)finishedLaunching;
- (BOOL)isAllowedToAccessProtectedData;
- (BOOL)isComposeWindowActive;
- (BOOL)isForeground;
- (BOOL)isFrontmost;
- (BOOL)isMaild;
- (BOOL)isMobileMail;
- (BOOL)isTesting;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (ComposeNavigationController)handoffComposeController;
- (DockContainerPersistence)dockPersistence;
- (EFCancelable)diagnosticInfoProviderToken;
- (EFCancelable)focusObservationToken;
- (EMBlockedSenderManager)blockedSenderManager;
- (EMCachingContactStore)contactStore;
- (EMDaemonInterface)daemonInterface;
- (EMFocus)currentFocus;
- (EMFocusController)focusController;
- (EMMailboxCategoryCloudStorage)mailboxCategoryCloudStorage;
- (EMObjectID)providerObjectID;
- (EMQueryingCollection)mailboxCollection;
- (FavoritesPersistence)favoritesPersistence;
- (MEContentRuleListManager)contentRuleListManager;
- (MFAccountsController)accountsController;
- (MFDiskFreeSpaceMonitor)freeSpaceMonitor;
- (MFMailAccountsProvider)accountsProvider;
- (MFMailPurgeableStorage)purgeableStorage;
- (MFMailboxProvider)mailboxProvider;
- (MFMessageRuleLibraryHook)messageRuleManager;
- (MSBucketBarConfigurationController)bucketBarConfigurationController;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MUIBrandIndicatorProvider)brandIndicatorProvider;
- (MailAppController)init;
- (MailExtendedLaunchTracker)extendedLaunchTracker;
- (MailMainScene)mostRecentMainScene;
- (MailUserNotificationCenterDelegate)userNotificationCenterHelper;
- (NSArray)activeScenes;
- (NSSet)currentAlertSuppressionContexts;
- (NSSet)selectedAccounts;
- (NSString)lastDefaultImageUpdateReason;
- (NSURL)postponedMessageURL;
- (UIAlertController)lowDiskAlertController;
- (UNUserNotificationCenter)userNotificationCenter;
- (_TtC10MobileMail21AppStoreReviewManager)appStoreReviewManager;
- (id)_createContactStore;
- (id)_dumpBucketBarConfigurationAtURL:(id)a3;
- (id)_dumpCurrentFocusAtURL:(id)a3;
- (id)_dumpDictionary:(id)a3 atURL:(id)a4;
- (id)_dumpEMUserDefaultsAtURL:(id)a3;
- (id)_dumpNotificationSettingsAtURL:(id)a3;
- (id)_dumpStandardUserDefaultsAtURL:(id)a3;
- (id)_dumpUIStateAtURL:(id)a3;
- (id)_dumpUserDefaults:(id)a3 atURL:(id)a4;
- (id)_extendLaunchTest;
- (id)_mailboxStringFromMailbox:(id)a3;
- (id)_prepareForScrollMailboxesTest:(id)a3;
- (id)_prepareForScrollMessagesTest:(id)a3 inEditMode:(BOOL)a4 currentDelay:(double *)a5;
- (id)accountCanPerformNetworkOperations:(id)a3;
- (id)activeViewController;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)composeCompletionBlock;
- (id)copyDiagnosticInformation;
- (id)copySourcesCurrentlyVisible;
- (id)defaultAttachmentManager;
- (id)dockContainer;
- (id)getAccount;
- (id)getControllerOfType:(Class)a3;
- (id)getControllerOfType:(Class)a3 fromNavigationController:(id)a4;
- (id)getConversationViewController;
- (id)getMailboxListViewControllerMail;
- (id)getMailboxPickerController;
- (id)getMailboxWithName:(id)a3;
- (id)getMessageListContainerViewController;
- (id)getMessageListViewController;
- (id)identifiersToExcludeFromDockedItemRecovery;
- (id)masterNavigationController;
- (id)presentingViewControllerForTriageInteraction:(id)a3;
- (id)rootViewController;
- (id)sourceApplicationBundleIdentifier;
- (unint64_t)protectedDataAvailability;
- (void)_accountsChanged:(id)a3;
- (void)_beginAutoFetchIfViable;
- (void)_configureUserDefaultsKVOAdd:(BOOL)a3;
- (void)_deliveryQueueProcessingFinished:(id)a3;
- (void)_didFinishExitEditModeTest:(id)a3;
- (void)_dismissComposeViewController:(id)a3 animated:(BOOL)a4;
- (void)_dismissPhotoPickerWithCompletion:(id)a3;
- (void)_finishTestDismissingReply:(id)a3;
- (void)_finishTestIfComposeAndKeyboardDidShow:(id)a3;
- (void)_handleDeliveryFailure:(id)a3;
- (void)_mailWasSent:(id)a3;
- (void)_messageContentLayerFinished;
- (void)_messageLibraryDidBecomeAvailable:(id)a3;
- (void)_messageLibraryWillBecomeUnavailable:(id)a3;
- (void)_performBackEndOneShotInitialization;
- (void)_performNextShowDismissComposeTransitionForTest:(id)a3;
- (void)_performScrollTestOnMessageListOnCollectionView:(id)a3 withOptions:(id)a4 isNatural:(BOOL)a5;
- (void)_preallocateWebViews;
- (void)_prepareForComposePseudoContactTest:(id)a3 withOptions:(id)a4;
- (void)_prepareForComposeView:(id)a3;
- (void)_prepareForDismissComposeTest:(id)a3;
- (void)_prepareForScrollPseudoContactTest:(id)a3 withOptions:(id)a4;
- (void)_prepareForShowComposeTest:(id)a3;
- (void)_reallyStartComposeToPseudoContactTest:(id)a3 withOptions:(id)a4;
- (void)_reallyStartDismissComposeTest:(id)a3;
- (void)_reallyStartExitEditModeTest:(id)a3;
- (void)_reallyStartMessageDeleteTest:(id)a3;
- (void)_reallyStartMessageTransferTest:(id)a3 mailboxController:(id)a4;
- (void)_reallyStartRotationTest:(id)a3;
- (void)_reallyStartScrollPseudoContactTest:(id)a3 withOptions:(id)a4;
- (void)_reallyStartShowComposeTest:(id)a3;
- (void)_reallyStartShowEmptyComposeAnimationTest:(id)a3;
- (void)_reallyStartShowEmptyComposeTest:(id)a3;
- (void)_reallyStartShowReplyTest:(id)a3;
- (void)_reallyUpdateDefaultImage;
- (void)_registerBucketBarStateCapture;
- (void)_setProtectedDataAvailabilityWithNotification:(id)a3;
- (void)_setupDiagnosticProviderIfNeeded;
- (void)_showEditAlertViewWithUndoManager:(id)a3 window:(id)a4;
- (void)_showMessageListView:(BOOL)a3;
- (void)_showPhotoPickerWithCompletion:(id)a3;
- (void)_startPhotoPickerTest:(id)a3;
- (void)_testFailedDueToNilReferenceMessage:(id)a3 messageCount:(unint64_t)a4;
- (void)_updateAccountsIfNecessaryFromCollection:(id)a3;
- (void)_userDefaultDidChange:(id)a3;
- (void)_userDidTakeScreenshot:(id)a3;
- (void)_waitForTimeInterval:(double)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)cancelPreviousPerformRequestsWhenProtectedDataIsAvailable;
- (void)cleanUpAfterSuspend;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 changedItemIDs:(id)a4;
- (void)collection:(id)a3 deletedItemIDs:(id)a4;
- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5;
- (void)dealloc;
- (void)delayedStartupTasks;
- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4;
- (void)didFinishLoadAllScenes:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)dismissAnyModalViewControllerOrPopoverAnimated:(BOOL)a3;
- (void)dismissComposeViewController:(id)a3 animated:(BOOL)a4 afterSending:(BOOL)a5;
- (void)dismissReply;
- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5;
- (void)failedTest:(id)a3;
- (void)failedTest:(id)a3 withFailure:(id)a4;
- (void)finishedTest:(id)a3 extraResults:(id)a4;
- (void)installNotificationObserverForNotificationName:(id)a3 forOneNotification:(BOOL)a4 usingBlock:(id)a5;
- (void)installNotificationObserverForNotificationName:(id)a3 object:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6;
- (void)mailComposeDeliveryController:(id)a3 didMoveCancelledMessageToDrafts:(id)a4 draftMailboxObjectID:(id)a5;
- (void)mailComposeDeliveryControllerDidAttemptToSaveDraft:(id)a3 account:(id)a4 result:(unint64_t)a5;
- (void)mailComposeDeliveryControllerDidAttemptToSend:(id)a3 outgoingMessageDelivery:(id)a4 result:(id)a5;
- (void)mailComposeDeliveryControllerWillAttemptToSend:(id)a3;
- (void)mf_updateCurrentContexts;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performUIRelatedLaunchTasksIfNeeded;
- (void)performWhenProtectedDataIsAvailable:(id)a3;
- (void)provideDiagnosticsAt:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)reallyStartScrollMessageViewListTest:(id)a3;
- (void)registerAppIntentsDependencies;
- (void)registerApplicationLifecycleObservers;
- (void)reportPPTTimings:(id)a3;
- (void)runAllTests;
- (void)scrollPseudoContactList:(id)a3;
- (void)searchPseudoContact:(id)a3;
- (void)setAccountsProvider:(id)a3;
- (void)setBlockedSenderManager:(id)a3;
- (void)setComposeCompletionBlock:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setCurrentAlertSuppressionContexts:(id)a3;
- (void)setCurrentFocus:(id)a3;
- (void)setDaemonInterface:(id)a3;
- (void)setDiagnosticInfoProviderToken:(id)a3;
- (void)setExtendedLaunchTracker:(id)a3;
- (void)setFocusObservationToken:(id)a3;
- (void)setFreeSpaceMonitor:(id)a3;
- (void)setLastDefaultImageUpdateReason:(id)a3;
- (void)setLowDiskAlertController:(id)a3;
- (void)setMailboxCollection:(id)a3;
- (void)setMailboxProvider:(id)a3;
- (void)setPostponedMessageURL:(id)a3;
- (void)setProtectedDataAvailability:(unint64_t)a3;
- (void)setUserNotificationCenter:(id)a3;
- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 completionBlock:(id)a6;
- (void)significantTimeChange;
- (void)startComposeToPseudoContactTest:(id)a3;
- (void)startConversationLoadAllMessagesTestWithOptions:(id)a3;
- (void)startConversationScrollTestWithOptions:(id)a3;
- (void)startConversationSelectionTestWithOptions:(id)a3;
- (void)startConversationViewRotationTestWithOptions:(id)a3;
- (void)startDismissComposeTest:(id)a3;
- (void)startExitEditModeTest:(id)a3;
- (void)startListeningForNotifications;
- (void)startMailCategorizationTest:(id)a3;
- (void)startMailboxFilterDisableTestWithOptions:(id)a3;
- (void)startMailboxFilterEnableTestWithOptions:(id)a3;
- (void)startMailboxFilterPickerDisableTestWithOptions:(id)a3;
- (void)startMailboxFilterPickerEnableTestWithOptions:(id)a3;
- (void)startMailboxPredictionTestWithOptions:(id)a3;
- (void)startMessageDeleteTest:(id)a3;
- (void)startMessageIterationTest:(id)a3;
- (void)startMessageListSwipeActionTestWithOptions:(id)a3;
- (void)startMessageTransferTest:(id)a3 multiSelect:(BOOL)a4;
- (void)startPhotoPickerTest:(id)a3;
- (void)startRotationTest:(id)a3;
- (void)startScrollMailboxListTestWithOptions:(id)a3;
- (void)startScrollMessageListSearchTestWithOptions:(id)a3;
- (void)startScrollMessageListTest:(id)a3 withOptions:(id)a4;
- (void)startScrollMessagesInEditModeTest:(id)a3;
- (void)startScrollMessagesInEditModeWithSelectionTest:(id)a3;
- (void)startScrollPseudoContactTest:(id)a3;
- (void)startSearchWhileTypingTestWithOptions:(id)a3;
- (void)startSenderListSelectionTestWithOptions:(id)a3;
- (void)startShowComposeTest:(id)a3;
- (void)startShowDismissComposeTest:(id)a3;
- (void)startShowDismissReplyTest:(id)a3;
- (void)startShowEmptyComposeTest:(id)a3;
- (void)switchToDesiredMailbox;
- (void)switchToInbox;
- (void)systemDidWake;
- (void)systemWillSleep;
- (void)tearDownPhotoPickerTest;
- (void)terminateOnNextSuspend;
- (void)updateDefaultImageWithReason:(id)a3;
- (void)waitForUIToSettleDown;
@end

@implementation MailAppController

- (void)_accountsChanged:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007D38;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  v3 = +[EFScheduler mainThreadScheduler];
  [v3 performSyncBlock:v4];
}

- (void)updateDefaultImageWithReason:(id)a3
{
  id v6 = a3;
  if (pthread_main_np() != 1)
  {
    v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MailAppController.m" lineNumber:640 description:@"Current thread must be main"];
  }
  [(MailAppController *)self setLastDefaultImageUpdateReason:v6];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_reallyUpdateDefaultImage" object:0];
  [(MailAppController *)self performSelector:"_reallyUpdateDefaultImage" withObject:0 afterDelay:1.0];
}

- (void)didFinishLoadAllScenes:(id)a3
{
  sub_100005A50((uint64_t)self);
  v4 = (void *)UIApp;
  id v5 = [UIApp _launchTestName];
  [v4 finishedTest:extraResults:];

  [(MailAppController *)self setExtendedLaunchTracker:0];
  id v6 = [(MailAppController *)self avatarGenerator];
  [v6 allowGeneratingAvatarImages];
}

- (void)registerAppIntentsDependencies
{
  swift_getObjectType();
  v3 = self;
  sub_10000CB24();
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000917C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699580 != -1) {
    dispatch_once(&qword_100699580, block);
  }
  v2 = (void *)qword_100699578;

  return v2;
}

- (void)registerApplicationLifecycleObservers
{
  v3 = [(MailAppController *)self daemonInterface];
  v4 = [v3 clientState];
  id v5 = [v4 foregroundObservable];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CC0C;
  v7[3] = &unk_100605780;
  v7[4] = self;
  id v6 = [v5 subscribeWithResultBlock:v7];
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  id v6 = (void *)qword_100699558;
  qword_100699558 = 0;
  id v7 = a4;
  id v8 = a3;

  v9 = (void *)qword_100699560;
  qword_100699560 = 0;

  v10 = (void *)qword_100699568;
  qword_100699568 = 0;

  v11.receiver = self;
  v11.super_class = (Class)MailAppController;
  [(MailAppController *)&v11 finishedTest:v8 extraResults:v7];
}

- (MailExtendedLaunchTracker)extendedLaunchTracker
{
  return self->_extendedLaunchTracker;
}

- (void)_updateAccountsIfNecessaryFromCollection:(id)a3
{
  id v5 = a3;
  id v6 = [(MailAppController *)self mailboxCollection];

  if (v6 == v5)
  {
    id v7 = +[MailAppController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSStringFromSelector(a2);
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(MailAppController *)self _accountsChanged:0];
  }
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = +[MailAppController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 objectForInfoDictionaryKey:kCFBundleVersionKey];
    int v12 = 138543362;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MobileMail version %{public}@ launched", (uint8_t *)&v12, 0xCu);
  }
  [(MailAppController *)self _performBackEndOneShotInitialization];
  [(MailAppController *)self registerApplicationLifecycleObservers];
  id v8 = [(MailAppController *)self daemonInterface];
  int v9 = [v8 interactionLogger];
  [v9 applicationLaunched];

  v10 = dispatch_get_global_queue(9, 0);
  dispatch_async(v10, &stru_1006074C0);

  return 1;
}

- (void)_beginAutoFetchIfViable
{
  v3 = [(MailAppController *)self freeSpaceMonitor];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100026904;
  v4[3] = &unk_1006074A0;
  v4[4] = self;
  [v3 getFreeSpaceStatusWithCompletionHandler:v4];
}

- (MFDiskFreeSpaceMonitor)freeSpaceMonitor
{
  return self->_freeSpaceMonitor;
}

- (id)_mailboxStringFromMailbox:(id)a3
{
  id v3 = a3;
  if (![v3 isSmartMailbox])
  {
    id v6 = +[UIApplication sharedApplication];
    id v4 = [v6 mailboxProvider];

    id v7 = [v3 objectID];
    id v8 = [v4 legacyMailboxForObjectID:v7];

    id v5 = [v8 URLString];

    goto LABEL_11;
  }
  id v4 = v3;
  if ([v4 smartMailboxType] == (id)8)
  {
    id v5 = @"com.apple.mobilemail.context.AllInbox";
    goto LABEL_11;
  }
  if (![v4 smartMailboxType] || !objc_msgSend(v4, "smartMailboxType"))
  {
    int v9 = (id *)&MSUserNotificationCenterTopicVIP;
LABEL_10:
    id v5 = (__CFString *)*v9;
    goto LABEL_11;
  }
  if ([v4 smartMailboxType] == (id)1)
  {
    id v5 = @"com.apple.mobilemail.context.flagged";
    goto LABEL_11;
  }
  if ([v4 smartMailboxType] == (id)3)
  {
    id v5 = @"com.apple.mobilemail.context.toMe";
    goto LABEL_11;
  }
  if ([v4 smartMailboxType] == (id)4)
  {
    id v5 = @"com.apple.mobilemail.context.hasAttachments";
    goto LABEL_11;
  }
  if ([v4 smartMailboxType] == (id)5)
  {
    int v9 = (id *)&MSUserNotificationCenterTopicNotifiedThreads;
    goto LABEL_10;
  }
  id v5 = 0;
LABEL_11:

  return v5;
}

- (MFMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (void)_performBackEndOneShotInitialization
{
  if ((byte_100699550 & 1) == 0)
  {
    byte_100699550 = 1;
    +[MailAppIntentConfigurator configureAppManager];
    id v3 = (EMFocusController *)objc_alloc_init((Class)EMFocusController);
    focusController = self->_focusController;
    self->_focusController = v3;

    id v5 = [[MFAccountsController alloc] initWithFocusController:self->_focusController];
    accountsController = self->_accountsController;
    self->_accountsController = v5;

    id v7 = [(MFAccountsController *)self->_accountsController accountsProvider];
    accountsProvider = self->_accountsProvider;
    self->_accountsProvider = v7;

    int v9 = [(MFAccountsController *)self->_accountsController mailboxProvider];
    mailboxProvider = self->_mailboxProvider;
    self->_mailboxProvider = v9;

    objc_super v11 = [(MailAppController *)self daemonInterface];
    [v11 setAllowsBackgroundResume:1];

    int v12 = [(MailAppController *)self daemonInterface];
    v13 = [v12 vipManager];
    +[VIPManager setBackingManager:v13];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:self selector:"_mailWasSent:" name:@"MailComposeControllerDidSendMail" object:0];
    [v14 addObserver:self selector:"_accountsChanged:" name:EMAccountsChangedNotification object:0];
    v15 = +[UIApplication sharedApplication];
    v16 = [v15 daemonInterface];
    v17 = [v16 mailboxRepository];

    id v18 = objc_alloc((Class)EMQuery);
    uint64_t v19 = objc_opt_class();
    v20 = +[NSPredicate ef_matchEverythingPredicate];
    id v21 = [v18 initWithTargetClass:v19 predicate:v20 sortDescriptors:&__NSArray0__struct];

    id v22 = [objc_alloc((Class)EMQueryingCollection) initWithQuery:v21 repository:v17];
    [v22 beginObserving:self];
    [(MailAppController *)self setMailboxCollection:v22];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000D4EC4, @"com.apple.mail.MailAccountSignaturesChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_1000D4ED0, kCFLocaleCurrentLocaleDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v25 = [(MailAppController *)self accountsController];
    [v25 resetAccountsSynchronouslyOnMainThread];

    v26 = +[MFMailMessageLibrary defaultInstance];
    v27 = [v26 persistence];
    v28 = [v27 conversationPersistence];

    v29 = [FavoritesPersistence alloc];
    v30 = self->_accountsProvider;
    v31 = [(MailAppController *)self daemonInterface];
    v32 = [(FavoritesPersistence *)v29 initWithConversationSubscriptionProvider:v28 accountsProvider:v30 mailboxPersistence:0 daemonInterface:v31 analyticsCollector:0];
    favoritesPersistence = self->_favoritesPersistence;
    self->_favoritesPersistence = v32;

    [(MailAppController *)self performSelector:"delayedStartupTasks" withObject:0 afterDelay:4.0];
    v34 = +[MFUserProfileProvider_iOS defaultProvider];
    [v34 allEmailAddresses];

    v35 = [[DockContainerPersistence alloc] initWithRecoveryDelegate:self];
    dockPersistence = self->_dockPersistence;
    self->_dockPersistence = v35;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v37 = [(MailAppController *)self daemonInterface];
    v38 = [v37 clientState];
    v39 = [v38 foregroundObservable];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10001130C;
    v41[3] = &unk_100607510;
    objc_copyWeak(&v42, &location);
    id v40 = [v39 subscribeWithResultBlock:v41];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
}

- (MailAppController)init
{
  v58.receiver = self;
  v58.super_class = (Class)MailAppController;
  v2 = [(MailAppController *)&v58 init];
  if (v2)
  {
    id v3 = [[MailExtendedLaunchTracker alloc] initWithDelegate:v2];
    extendedLaunchTracker = v2->_extendedLaunchTracker;
    v2->_extendedLaunchTracker = v3;

    id v5 = +[EFScheduler mainThreadScheduler];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_1000D34BC;
    v56[3] = &unk_1006047A0;
    id v6 = v2;
    v57 = v6;
    id v7 = [v5 afterDelay:v56 performBlock:60.0];

    id v8 = [objc_alloc((Class)EMDaemonInterface) initAndConfigureBlockedSenderManager:1];
    [(MailAppController *)v6 setDaemonInterface:v8];

    int v9 = [(MailAppController *)v6 daemonInterface];
    [v9 launchDaemon];

    v10 = [(MailAppController *)v6 daemonInterface];
    +[MFWKWebViewFactory setDaemonInterface:v10 URLCacheWithMemoryCapacity:0x400000];

    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1000D3554;
    v54[3] = &unk_100607410;
    objc_super v11 = v6;
    v55 = v11;
    +[MFComposeWebView setURLCacheBlock:v54];
    +[MFAccount setShouldHealAccounts:1];
    int v12 = [(MailAppController *)v11 daemonInterface];
    v13 = [v12 accountRepository];
    [v13 requestAccounts];

    id v14 = objc_alloc_init((Class)MUICachingSVGConverter);
    id v15 = objc_alloc((Class)MUIBrandIndicatorProvider);
    v16 = [(MailAppController *)v11 daemonInterface];
    v17 = [v16 messageRepository];
    id v18 = (MUIBrandIndicatorProvider *)[v15 initWithMessageRepository:v17 svgConverter:v14];
    brandIndicatorProvider = v11->_brandIndicatorProvider;
    v11->_brandIndicatorProvider = v18;

    MFSetUserAgent();
    uint64_t v20 = +[MFDiskFreeSpaceMonitor defaultMonitor];
    freeSpaceMonitor = v11->_freeSpaceMonitor;
    v11->_freeSpaceMonitor = (MFDiskFreeSpaceMonitor *)v20;

    id v22 = objc_alloc_init(NetworkActivityIndicator);
    networkActivityIndicator = v11->_networkActivityIndicator;
    v11->_networkActivityIndicator = v22;

    v11->_contactStoreLock._os_unfair_lock_opaque = 0;
    uint64_t v24 = +[UNUserNotificationCenter currentNotificationCenter];
    userNotificationCenter = v11->_userNotificationCenter;
    v11->_userNotificationCenter = (UNUserNotificationCenter *)v24;

    v26 = [[MailUserNotificationCenterDelegate alloc] initWithAlertSuppressionContextProvider:v11];
    userNotificationCenterHelper = v11->_userNotificationCenterHelper;
    v11->_userNotificationCenterHelper = v26;

    [(UNUserNotificationCenter *)v11->_userNotificationCenter setDelegate:v11->_userNotificationCenterHelper];
    if (EMBlackPearlIsFeatureEnabled())
    {
      v28 = (EMMailboxCategoryCloudStorage *)objc_alloc_init((Class)EMMailboxCategoryCloudStorage);
      mailboxCategoryCloudStorage = v11->_mailboxCategoryCloudStorage;
      v11->_mailboxCategoryCloudStorage = v28;

      v30 = (MUIAvatarImageGenerator *)objc_alloc_init((Class)MUIAvatarImageGenerator);
      avatarGenerator = v11->_avatarGenerator;
      v11->_avatarGenerator = v30;

      id v32 = objc_alloc_init((Class)MSUserDefaultsBucketBarConfigurationProvider);
      v33 = (MSBucketBarConfigurationController *)[objc_alloc((Class)MSBucketBarConfigurationController) initWithProvider:v32];
      bucketBarConfigurationController = v11->_bucketBarConfigurationController;
      v11->_bucketBarConfigurationController = v33;

      [(MailAppController *)v11 _registerBucketBarStateCapture];
    }
    if (_os_feature_enabled_impl())
    {
      id v35 = objc_alloc((Class)MEContentRuleListManager);
      v36 = +[MEAppExtensionsController sharedInstance];
      id v37 = [v35 initWithExtensionsController:v36];

      objc_storeStrong((id *)&v11->_contentRuleListManager, v37);
      v38 = +[MFWKWebViewFactory sharedWebViewFactoryFuture];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1000D35F8;
      v52[3] = &unk_100607438;
      id v39 = v37;
      id v53 = v39;
      [v38 addSuccessBlock:v52];
    }
    +[EMServerConfiguration refreshAsync];
    [(MailAppController *)v11 _configureUserDefaultsKVOAdd:1];
    id v40 = +[EFDevice currentDevice];
    unsigned int v41 = [v40 isInternal];

    if (v41)
    {
      id v42 = +[NSNotificationCenter defaultCenter];
      [v42 addObserver:v11 selector:"_userDidTakeScreenshot:" name:UIApplicationUserDidTakeScreenshotNotification object:0];
    }
    signal(30, (void (__cdecl *)(int))1);
    dispatch_source_t v43 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    diagnostic_signal_source = v11->diagnostic_signal_source;
    v11->diagnostic_signal_source = (OS_dispatch_source *)v43;

    dispatch_source_set_event_handler((dispatch_source_t)v11->diagnostic_signal_source, &stru_100607458);
    dispatch_resume((dispatch_object_t)v11->diagnostic_signal_source);
    signal(31, (void (__cdecl *)(int))1);
    dispatch_source_t v45 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1FuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    multipurpose_signal_source = v11->multipurpose_signal_source;
    v11->multipurpose_signal_source = (OS_dispatch_source *)v45;

    dispatch_source_set_event_handler((dispatch_source_t)v11->multipurpose_signal_source, &stru_100607478);
    dispatch_resume((dispatch_object_t)v11->multipurpose_signal_source);
    +[NSURLProtocol registerClass:objc_opt_class()];
    MFRegisterPowerObserver();
    +[MFMessageStore setDefaultMessageHeadersClass:objc_opt_class()];
    [(MailAppController *)v11 _setUserDefaultsSyncEnabled:0];
    v47 = +[MFDiagnostics sharedController];
    [v47 addDiagnosticsGenerator:v11];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobilemail.launch", 0, 0, 1u);
    v49 = +[UIDevice currentDevice];
    [v49 setBatteryMonitoringEnabled:1];

    v50 = v11;
  }

  return v2;
}

- (void)_configureUserDefaultsKVOAdd:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSUserDefaults em_userDefaults];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = sub_100059894(self);
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (v3) {
          [v5 addObserver:self forKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * i) options:1 context:"UserDefaultsKVOContext"];
        }
        else {
          [v5 removeObserver:self forKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        objc_super v11 = MFLogGeneral();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v17 = self;
          __int16 v18 = 1024;
          BOOL v19 = v3;
          __int16 v20 = 2112;
          uint64_t v21 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "MailAppController (%p) add(%{BOOL}d) observer for key path %@", buf, 0x1Cu);
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v22 count:16];
    }
    while (v7);
  }
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (EMFocusController)focusController
{
  return self->_focusController;
}

- (EMMailboxCategoryCloudStorage)mailboxCategoryCloudStorage
{
  return self->_mailboxCategoryCloudStorage;
}

- (MSBucketBarConfigurationController)bucketBarConfigurationController
{
  return self->_bucketBarConfigurationController;
}

- (void)mf_updateCurrentContexts
{
  id v21 = objc_alloc_init((Class)NSMutableSet);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v3 = [(MailAppController *)self activeScenes];
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [v7 suppressionMailboxes];
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10001D48C;
          v22[3] = &unk_1006074E8;
          v22[4] = self;
          int v9 = [v8 ef_compactMap:v22];

          if ([v9 count]) {
            [v21 unionSet:v9];
          }
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }

  [(MailAppController *)self setCurrentAlertSuppressionContexts:v21];
  uint64_t v10 = [(MailAppController *)self daemonInterface];
  objc_super v11 = [v10 fetchController];
  [v11 setSuppressedContexts:v21];

  long long v12 = objc_opt_new();
  long long v13 = [(MailAppController *)self mostRecentMainScene];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    long long v15 = [(MailAppController *)self mostRecentMainScene];
    v16 = [v15 visibleMailboxes];
    uint64_t v17 = [v16 allObjects];

    long long v12 = (void *)v17;
  }
  __int16 v18 = +[UIApplication sharedApplication];
  BOOL v19 = [v18 daemonInterface];
  __int16 v20 = [v19 clientState];
  [v20 setCurrentlyVisibleMailboxes:v12];
}

- (MailMainScene)mostRecentMainScene
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(MailAppController *)self openSessions];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v9 != v4) {
        objc_enumerationMutation(v2);
      }
      id v6 = [*(id *)(*((void *)&v8 + 1) + 8 * v5) scene];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if (v3 == (id)++v5)
      {
        id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v6 = 0;
  }

  return (MailMainScene *)v6;
}

- (void)setCurrentAlertSuppressionContexts:(id)a3
{
}

- (NSArray)activeScenes
{
  v2 = [(MailAppController *)self connectedScenes];
  id v3 = [v2 allObjects];
  uint64_t v4 = [v3 ef_compactMap:&stru_100607618];

  return (NSArray *)v4;
}

- (BOOL)isMaild
{
  return 0;
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (BOOL)isMobileMail
{
  return 1;
}

- (id)_extendLaunchTest
{
  return @"LaunchToBecomeResponsive";
}

- (void)setMailboxCollection:(id)a3
{
}

- (void)setLastDefaultImageUpdateReason:(id)a3
{
}

- (void)setExtendedLaunchTracker:(id)a3
{
}

- (void)setDaemonInterface:(id)a3
{
}

- (void)performUIRelatedLaunchTasksIfNeeded
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009A1C;
  block[3] = &unk_1006047A0;
  block[4] = self;
  if (qword_100699540 != -1) {
    dispatch_once(&qword_100699540, block);
  }
}

- (EMQueryingCollection)mailboxCollection
{
  return self->_mailboxCollection;
}

- (FavoritesPersistence)favoritesPersistence
{
  return self->_favoritesPersistence;
}

- (DockContainerPersistence)dockPersistence
{
  return self->_dockPersistence;
}

- (id)defaultAttachmentManager
{
  return self->_defaultAttachmentManager;
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (MFAccountsController)accountsController
{
  return self->_accountsController;
}

- (id)copyDiagnosticInformation
{
  id v2 = objc_alloc_init((Class)NSMutableString);
  id v3 = +[MFWebAttachmentSource allSources];
  if ([v3 count]) {
    [v2 appendFormat:@"==== Attachment Stores ====\n%@\n", v3];
  }
  [v2 appendString:@"\n==== Accounts ====\n"];
  id v21 = 0;
  v16 = +[MailAccount mailAccountsWithError:&v21];
  id v4 = v21;
  uint64_t v5 = v4;
  if (v4) {
    [v2 appendFormat:@"  last error: %@\n", v4, v16];
  }
  id v6 = +[MailAccount lastMailAccountsReloadDate];
  if (v6)
  {
    id v7 = +[NSDateFormatter ef_formatDate:v6 shortStyle:0];
    [v2 appendFormat:@"  last reload: %@\n", v7];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v16;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v11) copyDiagnosticInformation];
        long long v13 = v12;
        if (v12) {
          [v2 appendFormat:@"\n%@\n", v12];
        }

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }

  char v14 = EFContentProtectionDumpDiagnosticState();
  [v2 appendString:v14];

  return v2;
}

- (BOOL)isFrontmost
{
  if ([UIApp isSuspended]) {
    return 0;
  }
  else {
    return [UIApp isSuspendedEventsOnly] ^ 1;
  }
}

- (void)startListeningForNotifications
{
  +[MailAccount mailAccounts];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v6, "canFetch", (void)v7)) {
          [v6 startListeningForNotifications];
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)delayedStartupTasks
{
  if ([(MailAppController *)self launchedToTest]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = EFIsRunningUnitTests();
  }
  uint64_t v4 = [(MailAppController *)self daemonInterface];
  uint64_t v5 = [v4 clientState];
  [v5 setIsRunningTests:v3];

  [(MailAppController *)self registerAppIntentsDependencies];
  id v6 = +[MFPowerController sharedInstance];
  [v6 startListeningForBatterySaverNotifications];

  [(MailAppController *)self _preallocateWebViews];
  if ((v3 & 1) == 0)
  {
    if ([(MailAppController *)self isForeground])
    {
      [(MailAppController *)self _setupDiagnosticProviderIfNeeded];
      long long v7 = [(MailAppController *)self daemonInterface];
      long long v8 = [v7 fetchController];
      [v8 performFetchOfType:EMFetchTypeLaunch];
    }
    long long v9 = +[MailTipsHelper shared];
    [v9 setup];
  }
  long long v10 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3CAC;
  block[3] = &unk_1006047A0;
  block[4] = self;
  dispatch_async(v10, block);
}

- (void)_preallocateWebViews
{
  uint64_t v3 = +[MailAppController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412546;
    long long v10 = v5;
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Launch] Preallocate web views", buf, 0x16u);
  }
  id v6 = +[MFWKWebViewFactory sharedWebViewFactoryFuture];
  long long v7 = +[EFScheduler mainThreadScheduler];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D3EB8;
  v8[3] = &unk_100607438;
  v8[4] = self;
  [v6 onScheduler:v7 addSuccessBlock:v8];
}

- (void)_setupDiagnosticProviderIfNeeded
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4058;
  block[3] = &unk_1006047A0;
  block[4] = self;
  if (qword_100699548 != -1) {
    dispatch_once(&qword_100699548, block);
  }
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v7 = a4;
  id v27 = a5;
  id v8 = [v7 configuration];
  long long v9 = [v7 role];
  long long v10 = [v27 userActivities];
  __int16 v11 = [v10 anyObject];
  if ([v10 count])
  {
    id v12 = [v10 allObjects];
    long long v13 = [v12 ef_mapSelector:@"activityType"];
    char v14 = [v13 componentsJoinedByString:@", "];
  }
  else
  {
    char v14 = @"None";
  }
  long long v15 = +[MailAppController log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NSStringFromSelector(a2);
    long long v17 = [v11 activityType];
    *(_DWORD *)buf = 138544130;
    v29 = v16;
    __int16 v30 = 2114;
    v31 = v9;
    __int16 v32 = 2114;
    v33 = v17;
    __int16 v34 = 2114;
    id v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ -\n\tRole: %{public}@\n\tSelected User Activity: %{public}@\n\tUser Activity Types: %{public}@", buf, 0x2Au);
  }
  if (v9 != UIWindowSceneSessionRoleApplication)
  {
    if (v9 == (NSString *)SiriInteractiveSessionRoleSnippet)
    {
      id v22 = +[MailAppController log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found SiriInteractiveSessionRoleSnippet, updating config", buf, 2u);
      }

      long long v18 = +[UISceneConfiguration configurationWithName:0 sessionRole:v9];

      [v18 setDelegateClass:objc_opt_class()];
    }
    else
    {
      long long v18 = v8;
    }
    goto LABEL_23;
  }
  id v19 = MailSceneNameMainScene;
  if (!v11)
  {
LABEL_22:
    long long v18 = +[UISceneConfiguration configurationWithName:v19 sessionRole:v9];

LABEL_23:
    id v8 = v18;
    long long v24 = v8;
    goto LABEL_24;
  }
  long long v20 = [v11 activityType];
  if ([v20 isEqualToString:MSMailActivityHandoffTypeComposeWithStreams])
  {
    id v21 = (id *)&MailSceneNameComposeScene;
LABEL_19:
    long long v23 = v19;
    id v19 = *v21;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  if ([v20 isEqualToString:MSMailActivityHandoffTypeDisplayMessage])
  {
    id v21 = (id *)&MailSceneNameConversationScene;
    goto LABEL_19;
  }
  if ([v20 isEqualToString:MSMailActivityHandoffTypeQuickLook])
  {
    id v21 = (id *)&MailSceneNameQuickLookScene;
    goto LABEL_19;
  }
  long long v23 = +[EFDevice currentDevice];
  if (![v23 isInternal]) {
    goto LABEL_20;
  }
  unsigned int v26 = [v20 isEqualToString:@"com.apple.mail.private.debugmenu"];

  if (!v26) {
    goto LABEL_21;
  }
  long long v24 = +[UISceneConfiguration configurationWithName:0 sessionRole:v9];
  [v24 setDelegateClass:objc_opt_class()];
  [v24 setSceneClass:objc_opt_class()];

LABEL_24:

  return v24;
}

- (void)_deliveryQueueProcessingFinished:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 userInfo];
  uint64_t v5 = [v4 objectForKey:@"sent"];
  if ([v5 count])
  {
    id v6 = [v4 objectForKey:@"playSound"];
    unsigned int v7 = [v6 BOOLValue];

    if (v7) {
      +[MFSoundController playSentMailSound];
    }
    [(MailAppController *)self _mailWasSent:v8];
  }
}

- (void)_mailWasSent:(id)a3
{
  id v7 = a3;
  if (+[NSThread isMainThread])
  {
    uint64_t v5 = [(MailAppController *)self daemonInterface];
    id v6 = [v5 fetchController];
    [v6 performFetchOfType:EMFetchTypeStandardMailbox];
  }
  else
  {
    [(MailAppController *)self performSelectorOnMainThread:a2 withObject:v7 waitUntilDone:0];
  }
}

- (void)significantTimeChange
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D4884;
  v3[3] = &unk_1006047A0;
  v3[4] = self;
  id v2 = +[EFScheduler mainThreadScheduler];
  [v2 performBlock:v3];
}

- (EMBlockedSenderManager)blockedSenderManager
{
  id v2 = [(MailAppController *)self daemonInterface];
  uint64_t v3 = [v2 blockedSenderManager];

  return (EMBlockedSenderManager *)v3;
}

- (_TtC10MobileMail21AppStoreReviewManager)appStoreReviewManager
{
  appStoreReviewManager = self->_appStoreReviewManager;
  if (!appStoreReviewManager)
  {
    uint64_t v4 = +[MailAppController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing AppStoreReviewManager...", v12, 2u);
    }

    uint64_t v5 = [_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker alloc];
    id v6 = +[NSUserDefaults em_userDefaults];
    id v7 = [(AppStoreReviewEligibilityUserDefaultsTracker *)v5 initWithUserDefaults:v6];

    id v8 = objc_alloc_init(_TtC10MobileMail40AppStoreReviewRequirementConstantStorage);
    long long v9 = [[_TtC10MobileMail21AppStoreReviewManager alloc] initWithEligibilityTracker:v7 requirementStorage:v8];
    long long v10 = self->_appStoreReviewManager;
    self->_appStoreReviewManager = v9;

    appStoreReviewManager = self->_appStoreReviewManager;
  }

  return appStoreReviewManager;
}

- (void)_reallyUpdateDefaultImage
{
  if ([(MailAppController *)self isSuspended])
  {
    uint64_t v3 = [(MailAppController *)self mostRecentMainScene];

    if (v3)
    {
      uint64_t v4 = +[MFMailMessageLibrary defaultInstance];
      id v5 = [v4 protectedDataAvailability];

      if (!v5)
      {
        [(MailAppController *)self _updateSnapshotForBackgroundApplication:0];
        id v6 = [(MailAppController *)self lastDefaultImageUpdateReason];
        id v7 = MFLogGeneral();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          id v8 = ": ";
          if (!v6) {
            id v8 = "";
          }
          CFStringRef v9 = &stru_100619928;
          if (v6) {
            CFStringRef v9 = v6;
          }
          int v10 = 136315394;
          __int16 v11 = v8;
          __int16 v12 = 2112;
          CFStringRef v13 = v9;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Updated default image%s%@", (uint8_t *)&v10, 0x16u);
        }
      }
    }
  }
}

- (void)cleanUpAfterSuspend
{
  if (+[NSThread isMainThread])
  {
    id v5 = +[MFInvocationQueue sharedInvocationQueue];
    uint64_t v4 = +[MFMonitoredInvocation invocationWithSelector:a2 target:self taskName:0 priority:15 canBeCancelled:0];
    [v5 addInvocation:v4];
  }
  else
  {
    +[MailAccount saveStateForAllAccounts];
    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 synchronize];

    id v5 = +[MailPersistentStorage sharedStorage];
    [v5 save];
  }
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)MailAppController;
  [(MailAppController *)&v3 didReceiveMemoryWarning];
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:MailApplicationMemoryWarningNotification object:0];
}

- (BOOL)isForeground
{
  id v2 = [(MailAppController *)self daemonInterface];
  objc_super v3 = [v2 clientState];
  unsigned __int8 v4 = [v3 isForeground];

  return v4;
}

- (BOOL)canUseSpotlightIndex
{
  return 1;
}

- (void)dealloc
{
  notify_cancel(self->_accountChangeNotificationToken);
  emptiedTrashTimestamps = self->_emptiedTrashTimestamps;
  if (emptiedTrashTimestamps) {
    CFRelease(emptiedTrashTimestamps);
  }
  unsigned __int8 v4 = [(MailAppController *)self diagnosticInfoProviderToken];
  [v4 cancel];

  [(MailAppController *)self _configureUserDefaultsKVOAdd:0];
  [(EFCancelable *)self->_bucketBarStateCancelable cancel];
  v5.receiver = self;
  v5.super_class = (Class)MailAppController;
  [(MailAppController *)&v5 dealloc];
}

- (void)_handleDeliveryFailure:(id)a3
{
  id v6 = [a3 userInfo];
  unsigned __int8 v4 = [v6 objectForKey:@"account"];
  objc_super v5 = [v6 objectForKey:@"error"];
  if (v5) {
    [(MailAppController *)self displayError:v5 forAccount:v4 mode:1];
  }
}

- (void)provideDiagnosticsAt:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v26 = a5;
  id v8 = +[MailAppController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = [(MailAppController *)self providerObjectID];
    *(_DWORD *)buf = 138412290;
    __int16 v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> Gathering diagnostics...", buf, 0xCu);
  }
  long long v23 = [v7 ef_URLByAppendingTimestampedPathComponent:@"SceneSessions" withExtension:@"log"];
  long long v25 = [(MailAppController *)self _dumpUIStateAtURL:v23];
  id v22 = [v7 ef_URLByAppendingTimestampedPathComponent:@"EMUserDefaults" withExtension:@"plist"];
  id v21 = [(MailAppController *)self _dumpEMUserDefaultsAtURL:v22];
  long long v24 = [v7 ef_URLByAppendingTimestampedPathComponent:@"StandardUserDefaults" withExtension:@"plist"];
  id v27 = -[MailAppController _dumpEMUserDefaultsAtURL:](self, "_dumpEMUserDefaultsAtURL:");
  int v10 = [v7 ef_URLByAppendingTimestampedPathComponent:@"NotificationSettings" withExtension:@"plist"];
  __int16 v11 = [(MailAppController *)self _dumpNotificationSettingsAtURL:v10];
  __int16 v12 = [v7 ef_URLByAppendingTimestampedPathComponent:@"CurrentFocus" withExtension:@"plist"];
  CFStringRef v13 = [(MailAppController *)self _dumpCurrentFocusAtURL:v12];
  v32[0] = v25;
  v32[1] = v21;
  v32[2] = v27;
  v32[3] = v11;
  v32[4] = v13;
  char v14 = +[NSArray arrayWithObjects:v32 count:5];
  long long v15 = [v7 ef_URLByAppendingTimestampedPathComponent:@"BucketBarConfiguration" withExtension:@"plist"];
  v16 = [(MailAppController *)self _dumpBucketBarConfigurationAtURL:v15];
  long long v17 = [v14 arrayByAddingObject:v16];

  long long v18 = +[EFFuture join:v17];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000D5474;
  v30[3] = &unk_100605208;
  id v19 = v26;
  id v31 = v19;
  [v18 addSuccessBlock:v30];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000D5530;
  v28[3] = &unk_100604DB8;
  id v20 = v19;
  id v29 = v20;
  [v18 addFailureBlock:v28];
}

- (void)_userDidTakeScreenshot:(id)a3
{
  unsigned __int8 v4 = +[MailAppController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Screenshot taken. Dumping UI state...", buf, 2u);
  }

  objc_super v5 = +[EMDiagnosticInfoGatherer localDiagnosticsDirectoryURL];
  id v6 = +[NSFileManager defaultManager];
  id v12 = 0;
  [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v7 = v12;

  if (v7)
  {
    id v8 = +[MailAppController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v9 = [v5 path];
      sub_10045A068(v9, (uint64_t)v7, (uint64_t)buf);
    }
  }
  int v10 = [v5 ef_URLByAppendingTimestampedPathComponent:@"Screenshot" withExtension:@"log"];
  id v11 = [(MailAppController *)self _dumpUIStateAtURL:v10];
}

- (id)_dumpUIStateAtURL:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[EFPromise promise];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_1000D5998;
  v16[4] = sub_1000D59A8;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = objc_alloc_init((Class)NSMutableString);
  long long v15 = v16;
  id v6 = v4;
  id v12 = v6;
  CFStringRef v13 = self;
  id v7 = v5;
  id v14 = v7;
  id v8 = +[EFScheduler mainThreadScheduler];
  [v8 performBlock:&v11];

  CFStringRef v9 = [v7 future];

  _Block_object_dispose(v16, 8);

  return v9;
}

- (id)_dumpEMUserDefaultsAtURL:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSUserDefaults em_userDefaults];
  id v6 = [(MailAppController *)self _dumpUserDefaults:v5 atURL:v4];

  return v6;
}

- (id)_dumpStandardUserDefaultsAtURL:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [(MailAppController *)self _dumpUserDefaults:v5 atURL:v4];

  return v6;
}

- (id)_dumpUserDefaults:(id)a3 atURL:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dictionaryRepresentation];
  id v8 = [(MailAppController *)self _dumpDictionary:v7 atURL:v6];

  return v8;
}

- (id)_dumpDictionary:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EFPromise promise];
  CFStringRef v9 = +[EFScheduler globalAsyncScheduler];
  long long v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1000D6330;
  long long v18 = &unk_1006061C8;
  id v10 = v6;
  id v19 = v10;
  id v11 = v7;
  id v20 = v11;
  id v21 = self;
  id v12 = v8;
  id v22 = v12;
  [v9 performBlock:&v15];

  CFStringRef v13 = [v12 future:v15, v16, v17, v18];

  return v13;
}

- (id)_dumpNotificationSettingsAtURL:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[EFPromise promise];
  id v6 = +[UNUserNotificationCenter currentNotificationCenter];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D66F4;
  v11[3] = &unk_1006075B0;
  v11[4] = self;
  id v7 = v4;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  [v6 getNotificationSettingsForTopicsWithCompletionHandler:v11];

  CFStringRef v9 = [v8 future];

  return v9;
}

- (id)_dumpCurrentFocusAtURL:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MailAppController *)self focusController];
  id v6 = [v5 _stateCaptureInformation];

  id v7 = [(MailAppController *)self _dumpDictionary:v6 atURL:v4];

  return v7;
}

- (id)_dumpBucketBarConfigurationAtURL:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MailAppController *)self bucketBarConfigurationController];
  id v6 = [v5 stateCaptureInformation];

  id v7 = [(MailAppController *)self _dumpDictionary:v6 atURL:v4];

  return v7;
}

- (void)_registerBucketBarStateCapture
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  objc_copyWeak(&v6, &location);
  EFLogRegisterStateCaptureBlock();
  id v4 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
  bucketBarStateCancelable = self->_bucketBarStateCancelable;
  self->_bucketBarStateCancelable = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  if (a6 == "UserDefaultsKVOContext") {
    [(MailAppController *)self _userDefaultDidChange:v8];
  }
}

- (void)_userDefaultDidChange:(id)a3
{
  id v16 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 synchronize];

  objc_super v5 = +[NSUserDefaults em_userDefaults];
  [v5 synchronize];

  id v6 = +[NSNotificationCenter defaultCenter];
  if ([v16 isEqualToString:MFMailAccountDescription])
  {
    id v7 = &MailApplicationDidChangeAccountDisplayName;
LABEL_3:
    [v6 postNotificationName:*v7 object:self];
    int v8 = 1;
    goto LABEL_10;
  }
  if ([v16 isEqualToString:EMUserDefaultLoadRemoteContentKey])
  {
    CFStringRef v9 = &MailApplicationDidChangeRemoteImageLoading;
  }
  else
  {
    if ([v16 isEqualToString:IncludeAttachmentRepliesKey])
    {
      id v10 = sub_100216908(1);
      goto LABEL_9;
    }
    if ([v16 isEqualToString:EMUserDefaultLinesOfPreviewKey])
    {
      +[NSUserDefaults em_resetLinesOfPreview];
      id v7 = &MailApplicationDidChangePreviewLinesNotification;
      goto LABEL_3;
    }
    if ([v16 isEqualToString:ShowToCCIndicatorsKey])
    {
      sub_100057180(1);
      id v7 = &MailApplicationDidChangeShowToCCNotification;
      goto LABEL_3;
    }
    if ([v16 isEqualToString:DisableThreadingKey])
    {
      id v7 = &MailApplicationsDisableThreadingKeyChanged;
      goto LABEL_3;
    }
    if ([v16 isEqualToString:RightSwipeActionKey])
    {
      id v13 = sub_100216998(1);
      id v14 = +[NSNotificationCenter defaultCenter];
      [v14 postNotificationName:MailApplicationDidChangeSwipeActions object:self];

      goto LABEL_9;
    }
    if ([v16 isEqualToString:LeftSwipeActionKey])
    {
      id v15 = sub_100216A64(1);
      CFStringRef v9 = &MailApplicationDidChangeSwipeActions;
    }
    else if ([v16 isEqualToString:ConversationViewShowsNewestAtTop])
    {
      sub_100057594(1);
      CFStringRef v9 = &MailApplicationDidChangeConversationOrder;
    }
    else if ([v16 isEqualToString:ConversationViewExcludesRelatedMessagesKey])
    {
      sub_1000575E0(1);
      CFStringRef v9 = &MailApplicationDidChangeConversationViewIncludesRelatedMessages;
    }
    else
    {
      if (![v16 isEqualToString:CollapseReadConversationMessagesKey]) {
        goto LABEL_9;
      }
      sub_1002168B8(1);
      CFStringRef v9 = &MailApplicationDidChangeConversationViewCollapseReadMessagesNotification;
    }
  }
  [v6 postNotificationName:*v9 object:self];
LABEL_9:
  int v8 = 0;
LABEL_10:
  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 postNotificationName:MailDefaultsChangedNotification object:v16 userInfo:0];

  if (v8)
  {
    id v12 = +[NSString stringWithFormat:@"defaults changed: %@", v16];
    [(MailAppController *)self updateDefaultImageWithReason:v12];
  }
}

- (void)systemWillSleep
{
  id v2 = +[MailAccount activeAccounts];
  [v2 makeObjectsPerformSelector:"systemWillSleep"];
}

- (void)systemDidWake
{
  id v2 = +[MailAccount activeAccounts];
  [v2 makeObjectsPerformSelector:"systemDidWake"];
}

- (BOOL)canPerformNetworkOperationOnAccount:(id)a3
{
  id v3 = a3;
  if ([v3 canGoOffline])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    objc_super v5 = +[MFNetworkController sharedInstance];
    unsigned __int8 v4 = [v5 isDataAvailable];
  }
  return v4;
}

- (id)accountCanPerformNetworkOperations:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D7264;
  v6[3] = &unk_100606520;
  v6[4] = self;
  id v7 = a3;
  id v3 = v7;
  unsigned __int8 v4 = +[EFFuture futureWithBlock:v6];

  return v4;
}

- (BOOL)isAllowedToAccessProtectedData
{
  return 1;
}

- (id)sourceApplicationBundleIdentifier
{
  return kMFMobileMailBundleIdentifier;
}

- (BOOL)canRegisterForAPSPush
{
  return 0;
}

- (void)_setProtectedDataAvailabilityWithNotification:(id)a3
{
  unsigned __int8 v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:MailMessageLibraryProtectedDataAvailibilityKey];

  objc_super v5 = v6;
  if (v6)
  {
    self->_protectedDataAvailability = [v6 unsignedIntValue];
    objc_super v5 = v6;
  }
}

- (void)performWhenProtectedDataIsAvailable:(id)a3
{
  objc_super v5 = (void (**)(void))a3;
  if (pthread_main_np() != 1)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MailAppController.m" lineNumber:1148 description:@"Current thread must be main"];
  }
  if (self->_protectedDataAvailability == 2)
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will perform when protected data is available.", v11, 2u);
    }

    id blockToPerformWhenProtectedDataIsAvailable = self->_blockToPerformWhenProtectedDataIsAvailable;
    self->_id blockToPerformWhenProtectedDataIsAvailable = 0;

    if (v5)
    {
      int v8 = objc_retainBlock(v5);
      id v9 = self->_blockToPerformWhenProtectedDataIsAvailable;
      self->_id blockToPerformWhenProtectedDataIsAvailable = v8;

      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"cancelPreviousPerformRequestsWhenProtectedDataIsAvailable" object:0];
      [(MailAppController *)self performSelector:"cancelPreviousPerformRequestsWhenProtectedDataIsAvailable" withObject:0 afterDelay:2.0];
    }
  }
  else if (v5)
  {
    v5[2](v5);
  }
}

- (void)cancelPreviousPerformRequestsWhenProtectedDataIsAvailable
{
  if (pthread_main_np() != 1)
  {
    unsigned __int8 v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"MailAppController.m" lineNumber:1170 description:@"Current thread must be main"];
  }

  [(MailAppController *)self performWhenProtectedDataIsAvailable:0];
}

- (void)_messageLibraryWillBecomeUnavailable:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MailAppController.m" lineNumber:1176 description:@"Current thread must be main"];
  }
  [(MailAppController *)self _setProtectedDataAvailabilityWithNotification:v5];
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t protectedDataAvailability = self->_protectedDataAvailability;
    int v13 = 134217984;
    unint64_t v14 = protectedDataAvailability;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Protected data will become unavailable (%lu)", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v8 = +[NSNotificationCenter defaultCenter];
  [(id)v8 postNotificationName:MailApplicationProtectedDataWillBecomeUnavailable object:self];

  id v9 = [(MailAppController *)self postponedMessageURL];
  LOBYTE(v8) = v9 == 0;

  if ((v8 & 1) == 0)
  {
    id v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [(MailAppController *)self postponedMessageURL];
      int v13 = 138412290;
      unint64_t v14 = (unint64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Forgetting postponed URL %@ because protected data became unavailable", (uint8_t *)&v13, 0xCu);
    }
    [(MailAppController *)self setPostponedMessageURL:0];
  }
}

- (void)_messageLibraryDidBecomeAvailable:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MailAppController.m" lineNumber:1190 description:@"Current thread must be main"];
  }
  [(MailAppController *)self _setProtectedDataAvailabilityWithNotification:v5];
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t protectedDataAvailability = self->_protectedDataAvailability;
    int v11 = 134217984;
    unint64_t v12 = protectedDataAvailability;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Protected data did become available (%lu)", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:MailApplicationProtectedDataDidBecomeAvailable object:self];

  if (self->_blockToPerformWhenProtectedDataIsAvailable)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"cancelPreviousPerformRequestsWhenProtectedDataIsAvailable" object:0];
    (*((void (**)(void))self->_blockToPerformWhenProtectedDataIsAvailable + 2))();
    id blockToPerformWhenProtectedDataIsAvailable = self->_blockToPerformWhenProtectedDataIsAvailable;
    self->_id blockToPerformWhenProtectedDataIsAvailable = 0;
  }
}

- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = [(MailAppController *)self mostRecentMainScene];
  [v9 displayError:v10 forAccount:v8 mode:a5];
}

- (NSSet)selectedAccounts
{
  id v2 = [(MailAppController *)self mostRecentMainScene];
  id v3 = [v2 selectedAccounts];

  return (NSSet *)v3;
}

- (void)terminateOnNextSuspend
{
  *((unsigned char *)self + 80) |= 1u;
}

- (EMCachingContactStore)contactStore
{
  p_contactStoreLock = &self->_contactStoreLock;
  os_unfair_lock_lock(&self->_contactStoreLock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    id v5 = [(MailAppController *)self _createContactStore];
    id v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  id v7 = contactStore;
  os_unfair_lock_unlock(p_contactStoreLock);

  return v7;
}

- (id)_createContactStore
{
  id v2 = objc_alloc_init((Class)EMCachingContactStore);

  return v2;
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
}

- (id)identifiersToExcludeFromDockedItemRecovery
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000D5998;
  id v10 = sub_1000D59A8;
  id v11 = 0;
  id v2 = +[EFScheduler mainThreadScheduler];
  [v2 performSyncBlock:&v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MailAppController;
  [(MailAppController *)&v28 buildMenuWithBuilder:v4];
  if (self)
  {
    self = self->_menuCommandsCollection;
    if (self)
    {
      uint64_t v5 = [v4 system];
      uint64_t v6 = +[UIMenuSystem mainSystem];

      if (v5 == v6)
      {
        id v26 = sub_100117AF4((uint64_t)self, 0);
        long long v25 = sub_100117AF4((uint64_t)self, 1);
        id v27 = sub_100117AF4((uint64_t)self, 2);
        long long v24 = sub_100117AF4((uint64_t)self, 3);
        long long v23 = sub_100117AF4((uint64_t)self, 4);
        id v22 = sub_100117AF4((uint64_t)self, 5);
        id v21 = sub_100117AF4((uint64_t)self, 6);
        id v20 = sub_100117AF4((uint64_t)self, 7);
        [v4 replaceChildrenOfMenuForIdentifier:UIMenuFind fromChildrenBlock:&stru_1006076C0];
        id v19 = +[UIMenu menuWithChildren:v26];
        [v4 insertChildMenu:v19 atStartOfMenuForIdentifier:UIMenuApplication];
        long long v18 = +[UIMenu menuWithChildren:v21];
        [v4 insertChildMenu:v18 atEndOfMenuForIdentifier:UIMenuEdit];
        id v7 = +[UIMenu menuWithChildren:v23];
        [v4 insertChildMenu:v7 atEndOfMenuForIdentifier:UIMenuFile];
        uint64_t v8 = +[UIMenu menuWithChildren:v20];
        [v4 insertChildMenu:v8 atEndOfMenuForIdentifier:UIMenuView];
        id v9 = +[UIMenu menuWithChildren:v22];
        [v4 insertChildMenu:v9 atEndOfMenuForIdentifier:UIMenuFormat];
        id v10 = sub_1000D859C(@"MAILBOX_MENU_TITLE");
        id v11 = +[UIMenu menuWithTitle:v10 children:v25];

        [v4 insertSiblingMenu:v11 afterMenuForIdentifier:UIMenuEdit];
        unint64_t v12 = sub_1000D859C(@"MESSAGE_MENU_TITLE");
        int v13 = +[UIMenu menuWithTitle:v12 children:v27];

        unint64_t v14 = [v11 identifier];
        [v4 insertSiblingMenu:v13 afterMenuForIdentifier:v14];

        id v15 = sub_1000D859C(@"WINDOW_MENU_TITLE");
        id v16 = +[UIMenu menuWithTitle:v15 children:v24];

        id v17 = [v13 identifier];
        [v4 insertSiblingMenu:v16 afterMenuForIdentifier:v17];
      }
    }
  }
}

- (void)dismissComposeViewController:(id)a3 animated:(BOOL)a4 afterSending:(BOOL)a5
{
  if (a5) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  id v8 = [a3 view];
  uint64_t v6 = [v8 window];
  id v7 = [v6 windowScene];
  [v7 closeSceneWithAnimation:v5];
}

- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(MailAppController *)self mostRecentMainScene];
  [v7 didFailToContinueUserActivityWithType:v8 error:v6];
}

- (id)activeViewController
{
  id v2 = [(MailAppController *)self mostRecentMainScene];
  id v3 = [v2 activeViewController];

  return v3;
}

- (void)mailComposeDeliveryControllerDidAttemptToSaveDraft:(id)a3 account:(id)a4 result:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v14 = self;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  unint64_t v17 = a5;
  unint64_t v12 = +[EFScheduler mainThreadScheduler];
  [v12 performBlock:&v13];
}

- (void)mailComposeDeliveryControllerDidAttemptToSend:(id)a3 outgoingMessageDelivery:(id)a4 result:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v16 = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  unint64_t v14 = +[EFScheduler mainThreadScheduler];
  [v14 performBlock:&v15];
}

- (void)mailComposeDeliveryControllerWillAttemptToSend:(id)a3
{
  id v6 = self;
  id v3 = a3;
  id v7 = v3;
  id v4 = +[EFScheduler mainThreadScheduler];
  [v4 performBlock:&v5];
}

- (void)mailComposeDeliveryController:(id)a3 didMoveCancelledMessageToDrafts:(id)a4 draftMailboxObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v16 = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  unint64_t v14 = +[EFScheduler mainThreadScheduler];
  [v14 performBlock:&v15];
}

- (BOOL)_shouldShowAlertForUndoManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = &NSURLErrorDomain_ptr;
  if (!+[UIApplication instancesRespondToSelector:](UIApplication, "instancesRespondToSelector:", "_motionKeyWindow")|| !+[UIApplication instancesRespondToSelector:"_shouldShowAlertForUndoManager:"])
  {
    uint64_t v5 = +[MailAppController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10045A188(v5);
    }
    BOOL v7 = 0;
    goto LABEL_10;
  }
  id v6 = v4;
  if (!v4)
  {
    uint64_t v5 = [(MailAppController *)self _motionKeyWindow];
    id v6 = [v5 undoManager];
  }
  v9.receiver = self;
  v9.super_class = (Class)MailAppController;
  BOOL v7 = [(MailAppController *)&v9 _shouldShowAlertForUndoManager:v6];
  if (!v4)
  {

LABEL_10:
  }

  return v7;
}

- (void)_showEditAlertViewWithUndoManager:(id)a3 window:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = &NSURLErrorDomain_ptr;
  if (!+[UIApplication instancesRespondToSelector:](UIApplication, "instancesRespondToSelector:", "_motionKeyWindow")|| !+[UIApplication instancesRespondToSelector:"_shouldShowAlertForUndoManager:"])
  {
    id v8 = +[MailAppController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10045A1CC(v8);
    }
    goto LABEL_9;
  }
  objc_super v9 = v6;
  if (!v6)
  {
    id v8 = [(MailAppController *)self _motionKeyWindow];
    objc_super v9 = [v8 undoManager];
  }
  v10.receiver = self;
  v10.super_class = (Class)MailAppController;
  [(MailAppController *)&v10 _showEditAlertViewWithUndoManager:v9 window:v7];
  if (!v6)
  {

LABEL_9:
  }
}

- (EMObjectID)providerObjectID
{
  return self->_providerObjectID;
}

- (id)composeCompletionBlock
{
  return self->composeCompletionBlock;
}

- (void)setComposeCompletionBlock:(id)a3
{
}

- (NSSet)currentAlertSuppressionContexts
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)finishedLaunching
{
  return self->_finishedLaunching;
}

- (void)setAccountsProvider:(id)a3
{
}

- (void)setMailboxProvider:(id)a3
{
}

- (MFMessageRuleLibraryHook)messageRuleManager
{
  return self->_messageRuleManager;
}

- (ComposeNavigationController)handoffComposeController
{
  return self->_handoffComposeController;
}

- (MFMailPurgeableStorage)purgeableStorage
{
  return self->_purgeableStorage;
}

- (void)setBlockedSenderManager:(id)a3
{
}

- (MEContentRuleListManager)contentRuleListManager
{
  return self->_contentRuleListManager;
}

- (void)setContactStore:(id)a3
{
}

- (NSString)lastDefaultImageUpdateReason
{
  return self->_lastDefaultImageUpdateReason;
}

- (NSURL)postponedMessageURL
{
  return self->_postponedMessageURL;
}

- (void)setPostponedMessageURL:(id)a3
{
}

- (unint64_t)protectedDataAvailability
{
  return self->_protectedDataAvailability;
}

- (void)setProtectedDataAvailability:(unint64_t)a3
{
  self->_unint64_t protectedDataAvailability = a3;
}

- (UIAlertController)lowDiskAlertController
{
  return self->_lowDiskAlertController;
}

- (void)setLowDiskAlertController:(id)a3
{
}

- (void)setFreeSpaceMonitor:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (EFCancelable)diagnosticInfoProviderToken
{
  return self->_diagnosticInfoProviderToken;
}

- (void)setDiagnosticInfoProviderToken:(id)a3
{
}

- (MailUserNotificationCenterDelegate)userNotificationCenterHelper
{
  return self->_userNotificationCenterHelper;
}

- (EMFocus)currentFocus
{
  return self->_currentFocus;
}

- (void)setCurrentFocus:(id)a3
{
}

- (EFCancelable)focusObservationToken
{
  return self->_focusObservationToken;
}

- (void)setFocusObservationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusObservationToken, 0);
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_userNotificationCenterHelper, 0);
  objc_storeStrong((id *)&self->_menuCommandsCollection, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoProviderToken, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_mailboxCollection, 0);
  objc_storeStrong((id *)&self->_freeSpaceMonitor, 0);
  objc_storeStrong((id *)&self->_lowDiskAlertController, 0);
  objc_storeStrong((id *)&self->_postponedMessageURL, 0);
  objc_storeStrong((id *)&self->_lastDefaultImageUpdateReason, 0);
  objc_storeStrong((id *)&self->_bucketBarConfigurationController, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_mailboxCategoryCloudStorage, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_focusController, 0);
  objc_storeStrong((id *)&self->_contentRuleListManager, 0);
  objc_storeStrong((id *)&self->_extendedLaunchTracker, 0);
  objc_storeStrong((id *)&self->_dockPersistence, 0);
  objc_storeStrong((id *)&self->_favoritesPersistence, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_purgeableStorage, 0);
  objc_storeStrong((id *)&self->_handoffComposeController, 0);
  objc_storeStrong((id *)&self->_messageRuleManager, 0);
  objc_storeStrong((id *)&self->_accountsController, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_appStoreReviewManager, 0);
  objc_storeStrong((id *)&self->currentAlertSuppressionContexts, 0);
  objc_storeStrong(&self->composeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_providerObjectID, 0);
  objc_storeStrong((id *)&self->_bucketBarStateCancelable, 0);
  objc_storeStrong((id *)&self->_networkActivityIndicator, 0);
  objc_storeStrong(&self->_blockToPerformWhenProtectedDataIsAvailable, 0);
  objc_storeStrong((id *)&self->_defaultAttachmentManager, 0);
  objc_storeStrong((id *)&self->multipurpose_signal_source, 0);

  objc_storeStrong((id *)&self->diagnostic_signal_source, 0);
}

- (BOOL)isTesting
{
  return qword_100699558 != 0;
}

+ (id)allTestsName
{
  return &off_10062B3D8;
}

- (void)runAllTests
{
  [(id)objc_opt_class() allTestsName];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[MailAppController runTest:options:](self, "runTest:options:", *(void *)(*((void *)&v7 + 1) + 8 * (void)v6), 0, (void)v7);
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000D9E38;
  v34[3] = &unk_100607728;
  v34[4] = self;
  id v9 = v7;
  id v35 = v9;
  long long v10 = objc_retainBlock(v34);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000D9EBC;
  v32[3] = &unk_100607728;
  v32[4] = self;
  id v11 = v9;
  id v33 = v11;
  id v12 = objc_retainBlock(v32);
  objc_storeStrong((id *)&qword_100699558, a3);
  objc_storeStrong((id *)&qword_100699560, a4);
  uint64_t v13 = [v8 mf_mailboxName];
  unint64_t v14 = (void *)qword_100699568;
  qword_100699568 = v13;

  uint64_t v15 = [(id)objc_opt_class() allTestsName];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000D9F40;
  v30[3] = &unk_100606678;
  id v16 = v11;
  id v31 = v16;
  unsigned __int8 v17 = [v15 ef_any:v30];

  if (v17)
  {
    [(MailAppController *)self waitForUIToSettleDown];
    [v8 mf_testInterfaceOrientation];
    id v19 = (void *)UIApp;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000D9F4C;
    v22[3] = &unk_100607750;
    id v28 = v18;
    id v23 = v16;
    long long v24 = self;
    id v25 = v8;
    id v26 = v10;
    id v27 = v12;
    [v19 rotateIfNeeded:v18 completion:v22];

    BOOL v20 = 1;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)MailAppController;
    BOOL v20 = [(MailAppController *)&v29 runTest:v16 options:v8];
  }

  return v20;
}

- (void)_finishTestDismissingReply:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DAD44;
  v3[3] = &unk_1006047A0;
  v3[4] = self;
  [(MailAppController *)self finishedTest:a3 extraResults:0 withTeardownBlock:v3];
}

- (void)failedTest:(id)a3 withFailure:(id)a4
{
  id v6 = (void *)qword_100699558;
  qword_100699558 = 0;
  id v7 = a4;
  id v8 = a3;

  id v9 = (void *)qword_100699560;
  qword_100699560 = 0;

  long long v10 = (void *)qword_100699568;
  qword_100699568 = 0;

  v11.receiver = self;
  v11.super_class = (Class)MailAppController;
  [(MailAppController *)&v11 failedTest:v8 withFailure:v7];
}

- (void)failedTest:(id)a3
{
}

- (id)getControllerOfType:(Class)a3 fromNavigationController:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [v4 viewControllers];
  if (v5)
  {
    for (unint64_t i = 0; i < (unint64_t)[v5 count]; ++i)
    {
      id v7 = [v5 objectAtIndex:i];
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v9 = [v5 objectAtIndex:i];
        goto LABEL_8;
      }
    }
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

- (id)getControllerOfType:(Class)a3
{
  uint64_t v5 = [(MailAppController *)self masterNavigationController];
  id v6 = [(MailAppController *)self getControllerOfType:a3 fromNavigationController:v5];

  return v6;
}

- (id)getMessageListContainerViewController
{
  uint64_t v3 = objc_opt_class();

  return [(MailAppController *)self getControllerOfType:v3];
}

- (id)getMessageListViewController
{
  id v2 = [(MailAppController *)self getMessageListContainerViewController];
  uint64_t v3 = [v2 messageListViewController];

  return v3;
}

- (id)getMailboxListViewControllerMail
{
  uint64_t v3 = objc_opt_class();

  return [(MailAppController *)self getControllerOfType:v3];
}

- (id)getMailboxPickerController
{
  uint64_t v3 = objc_opt_class();

  return [(MailAppController *)self getControllerOfType:v3];
}

- (id)getConversationViewController
{
  id v2 = [(MailAppController *)self mostRecentMainScene];
  uint64_t v3 = [v2 splitViewController];
  id v4 = [v3 messageDetailNavController];
  uint64_t v5 = [v4 conversationViewController];

  return v5;
}

- (id)getAccount
{
  id v2 = [(MailAppController *)self mostRecentMainScene];
  uint64_t v3 = [v2 _defaultAccountsToSelect];
  id v4 = [v3 anyObject];

  return v4;
}

- (id)getMailboxWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MailChangeManager sharedChangeManager];
  id v6 = [(MailAppController *)self getAccount];
  id v7 = [v5 allMailboxUidsSortedWithSpecialsAtTopForAccount:v6 includingLocals:0 client:0 outbox:0];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v12 name];
        unsigned __int8 v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)switchToInbox
{
  uint64_t v3 = +[MailChangeManager sharedChangeManager];
  id v4 = [(MailAppController *)self getAccount];
  uint64_t v5 = [v3 allMailboxUidsSortedWithSpecialsAtTopForAccount:v4 includingLocals:0 client:0 outbox:0];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "mailboxType", (void)v12) == (id)7)
        {
          objc_super v11 = [(MailAppController *)self getMailboxListViewControllerMail];
          [v11 setSelectedMailbox:v10];

          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)switchToDesiredMailbox
{
  if (qword_100699568)
  {
    -[MailAppController getMailboxWithName:](self, "getMailboxWithName:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      uint64_t v3 = [(MailAppController *)self getMailboxListViewControllerMail];
      [v3 setSelectedMailbox:v5];
    }
  }
  else
  {
    [(MailAppController *)self switchToInbox];
  }
  id v6 = +[NSRunLoop currentRunLoop];
  id v4 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
  [v6 runUntilDate:v4];

  if (+[UIDevice mf_isPad]
    && [(id)qword_100699558 rangeOfString:@"DismissCompose"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(MailAppController *)self getMessageListViewController];
    [v7 selectMessageAtIndex:0];
  }
}

- (void)waitForUIToSettleDown
{
  if (+[UIDevice mf_isPad])
  {
    uint64_t v3 = [(MailAppController *)self getMessageListViewController];

    if (!v3)
    {
      id v5 = +[NSRunLoop currentRunLoop];
      id v4 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
      [v5 runUntilDate:v4];
    }
  }
}

- (id)_prepareForScrollMessagesTest:(id)a3 inEditMode:(BOOL)a4 currentDelay:(double *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(MailAppController *)self getMessageListViewController];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a5) {
      double v11 = *a5;
    }
    else {
      double v11 = 0.0;
    }
    [v9 setEditing:0 animated:0];
    if (+[UIDevice mf_isPad])
    {
      double v11 = v11 + 2.0;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000DBB94;
      v24[3] = &unk_1006047A0;
      id v25 = v10;
      +[EFScheduler mf_afterUIDelay:v24 performBlock:v11];
    }
    double v13 = v11 + 2.0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000DBBA0;
    v23[3] = &unk_1006047A0;
    v23[4] = self;
    +[EFScheduler mf_afterUIDelay:v23 performBlock:v13];
    if ((unint64_t)(qword_100699588 - 1) <= 1)
    {
      double v13 = v13 + 2.0;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000DBBAC;
      v22[3] = &unk_1006047A0;
      void v22[4] = self;
      +[EFScheduler mf_afterUIDelay:v22 performBlock:v13];
    }
    if (v6)
    {
      double v13 = v13 + 2.0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000DBBB8;
      v20[3] = &unk_1006047A0;
      id v21 = v10;
      +[EFScheduler mf_afterUIDelay:v20 performBlock:v13];
    }
    if (EMBlackPearlIsFeatureEnabled())
    {
      long long v14 = [v8 objectForKeyedSubscript:@"testName"];
      unsigned int v15 = [v14 mf_containsSubstring:@"SenderListNatural"];

      if (v15)
      {
        double v13 = v13 + 2.0;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000DBBC0;
        v18[3] = &unk_100604618;
        v18[4] = self;
        id v19 = v10;
        +[EFScheduler mf_afterUIDelay:v18 performBlock:v13];
      }
    }
    if (a5) {
      *a5 = v13;
    }
    id v16 = v10;
  }
  else
  {
    long long v12 = [v8 objectForKey:@"testName"];
    [(MailAppController *)self failedTest:v12];
  }

  return v10;
}

- (void)_showMessageListView:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MailAppController *)self mostRecentMainScene];
  id v4 = [v5 splitViewController];
  [v4 showMessageListViewController:1 animated:v3 completion:0];
}

- (void)_performScrollTestOnMessageListOnCollectionView:(id)a3 withOptions:(id)a4 isNatural:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[MailAppController log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Starting to perform scroll test", v29, 2u);
  }

  if (v8)
  {
    if (v5)
    {
LABEL_5:
      id v11 = objc_alloc((Class)RPTScrollViewTestParameters);
      long long v12 = [v9 mf_testName];
      id v13 = [v11 initWithTestName:v12 scrollView:v8 completionHandler:0];

      [v9 mf_pages];
      RPTAmplitudeFromPagesOfView();
      [v13 setAmplitude:v14 * 0.8];
      [v13 setDirection:3];
      [v13 setIterationDurationFactor:0.9];
      RPTGetBoundsForView();
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      [v8 adjustedContentInset];
      double v24 = v23;
      [v8 adjustedContentInset];
      [v13 setScrollingBounds:v16 + 0.0, v18 + v24, v20, v22 - (v24 + v25 + 5.0)];
      +[RPTTestRunner runTestWithParameters:v13];
      goto LABEL_11;
    }
  }
  else
  {
    id v26 = [(MailAppController *)self getMessageListViewController];
    id v8 = [v26 collectionView];

    if (v5) {
      goto LABEL_5;
    }
  }
  int v27 = [v8 desiredScrollLength:v9];
  if (v27 >= 0) {
    int v28 = v27;
  }
  else {
    int v28 = v27 + 15;
  }
  [v9 mf_testName];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v8 _performScrollTest:v13 iterations:[v9 mf_iterations] scrollOffset:[v9 mf_scrollOffset] length:(v28 >> 4)];
LABEL_11:
}

- (id)_prepareForScrollMailboxesTest:(id)a3
{
  id v4 = a3;
  if (+[UIDevice mf_isPad])
  {
    BOOL v5 = [(MailAppController *)self getMessageListViewController];
    BOOL v6 = v5;
    if (v5)
    {
      [v5 setEditing:0 animated:0];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000DC260;
      v18[3] = &unk_1006047A0;
      id v19 = v6;
      +[EFScheduler mf_afterUIDelay:v18 performBlock:2.0];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000DC26C;
      v17[3] = &unk_1006047A0;
      v17[4] = self;
      +[EFScheduler mf_afterUIDelay:v17 performBlock:4.0];
      if ((unint64_t)(qword_100699588 - 1) <= 1)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000DC278;
        v16[3] = &unk_1006047A0;
        v16[4] = self;
        +[EFScheduler mf_afterUIDelay:v16 performBlock:6.0];
      }
    }
    id v7 = [(MailAppController *)self getMailboxPickerController];
    id v8 = v7;
    if (v7)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000DC284;
      v14[3] = &unk_100604618;
      v14[4] = self;
      id v9 = v7;
      id v15 = v9;
      +[EFScheduler mf_afterUIDelay:v14 performBlock:8.0];
      id v10 = v9;
    }
    else
    {
      long long v12 = [v4 objectForKey:@"testName"];
      [(MailAppController *)self failedTest:v12];
    }
  }
  else
  {
    id v11 = [v4 objectForKey:@"testName"];
    [(MailAppController *)self failedTest:v11];

    id v8 = 0;
  }

  return v8;
}

- (void)startScrollMessagesInEditModeWithSelectionTest:(id)a3
{
  id v6 = a3;
  id v4 = -[MailAppController _prepareForScrollMessagesTest:inEditMode:currentDelay:](self, "_prepareForScrollMessagesTest:inEditMode:currentDelay:");

  if (!v4)
  {
    BOOL v5 = [v6 objectForKey:@"testName"];
    [(MailAppController *)self failedTest:v5];
  }
}

- (void)startScrollMessagesInEditModeTest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MailAppController *)self _prepareForScrollMessagesTest:v4 inEditMode:1 currentDelay:0];

  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DC4D0;
    v7[3] = &unk_100604618;
    v7[4] = self;
    id v8 = v4;
    +[EFScheduler mf_afterUIDelay:v7 performBlock:12.0];
  }
  else
  {
    id v6 = [v4 objectForKey:@"testName"];
    [(MailAppController *)self failedTest:v6];
  }
}

- (void)startSenderListSelectionTestWithOptions:(id)a3
{
  id v4 = a3;
  double v12 = 0.0;
  BOOL v5 = [(MailAppController *)self _prepareForScrollMessagesTest:v4 inEditMode:0 currentDelay:&v12];
  if (v5)
  {
    id v6 = [v4 mf_testName];
    double v12 = v12 + 2.0;
    double v7 = v12;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000DC634;
    v9[3] = &unk_100604668;
    v9[4] = self;
    id v10 = v6;
    id v11 = v5;
    id v8 = v6;
    +[EFScheduler mf_afterUIDelay:v9 performBlock:v7];
  }
}

- (void)reallyStartScrollMessageViewListTest:(id)a3
{
  id v14 = a3;
  id v4 = [v14 objectForKey:@"testName"];
  [(MailAppController *)self startedTest:v4];

  BOOL v5 = [(MailAppController *)self getMessageListViewController];
  id v6 = [v5 collectionView];
  int v7 = [v6 desiredScrollLength:v14];
  if (v7 >= 0) {
    int v8 = v7;
  }
  else {
    int v8 = v7 + 15;
  }

  id v9 = [v5 collectionView];
  id v10 = [v14 objectForKey:@"testName"];
  id v11 = [v14 objectForKey:@"iterations"];
  id v12 = [v11 intValue];
  id v13 = [v14 objectForKey:@"offset"];
  [v9 _performScrollTest:v10 iterations:v12 delta:[v13 intValue] length:(v8 >> 4)];
}

- (void)startScrollMessageListTest:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[UIDevice mf_isPad])
  {
    if (objc_msgSend(v6, "mf_isScrollMessageListTest")) {
      [(MailAppController *)self _prepareForScrollMessagesTest:v7 inEditMode:0 currentDelay:0];
    }
    else {
    int v8 = [(MailAppController *)self _prepareForScrollMailboxesTest:v7];
    }
    id v9 = v8;
    if (!v8)
    {
      [(MailAppController *)self failedTest:v6];
      goto LABEL_12;
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000DCC1C;
    v20[3] = &unk_1006061C8;
    void v20[4] = self;
    id v21 = v8;
    id v22 = v7;
    id v23 = v6;
    +[EFScheduler mf_afterUIDelay:v20 performBlock:12.0];

    id v13 = v21;
  }
  else
  {
    double v19 = 0.0;
    id v9 = [(MailAppController *)self _prepareForScrollMessagesTest:v7 inEditMode:0 currentDelay:&v19];
    double v19 = v19 + 2.0;
    unsigned int v10 = [v6 hasSuffix:@"Natural"];
    double v11 = v19;
    if (v10)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000DCCA8;
      v16[3] = &unk_100604668;
      v16[4] = self;
      id v17 = v9;
      id v18 = v7;
      +[EFScheduler mf_afterUIDelay:v16 performBlock:v11];
      id v12 = &v17;
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000DCD1C;
      v14[3] = &unk_100604618;
      v14[4] = self;
      id v15 = v7;
      +[EFScheduler mf_afterUIDelay:v14 performBlock:v11];
      id v12 = &v15;
    }
    id v13 = *v12;
  }

LABEL_12:
}

- (void)startScrollMessageListSearchTestWithOptions:(id)a3
{
  id v4 = a3;
  double v29 = 1.0;
  BOOL v5 = [(MailAppController *)self _prepareForScrollMessagesTest:v4 inEditMode:0 currentDelay:&v29];
  id v6 = [v5 conversationViewController];
  if (+[UIDevice mf_isPad])
  {
    if ((unint64_t)(qword_100699588 - 1) <= 1)
    {
      double v29 = v29 + 1.0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000DD0BC;
      v28[3] = &unk_1006047A0;
      void v28[4] = self;
      +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v28);
    }
  }
  else if (!v5 || [v6 isFullyVisible])
  {
    double v29 = v29 + 1.0;
    id v7 = [v5 navigationController];
    id v8 = [v7 popToViewController:v5 animated:1];

    [(MailAppController *)self _waitForTimeInterval:v29];
  }
  double v29 = v29 + 1.0;
  double v9 = v29;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000DD0C8;
  v25[3] = &unk_100604618;
  id v10 = v5;
  id v26 = v10;
  id v11 = v4;
  id v27 = v11;
  +[EFScheduler mf_afterUIDelay:v25 performBlock:v9];
  double v29 = v29 + 1.0;
  double v12 = v29;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000DD188;
  v21[3] = &unk_100604668;
  id v13 = v10;
  id v22 = v13;
  id v23 = self;
  id v14 = v11;
  id v24 = v14;
  +[EFScheduler mf_afterUIDelay:v21 performBlock:v12];
  double v29 = v29 + 1.0;
  double v15 = v29;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000DD498;
  v18[3] = &unk_100604668;
  void v18[4] = self;
  id v16 = v14;
  id v19 = v16;
  id v17 = v13;
  id v20 = v17;
  +[EFScheduler mf_afterUIDelay:v18 performBlock:v15];
}

- (void)startSearchWhileTypingTestWithOptions:(id)a3
{
  double v51 = 0.5;
  id v30 = a3;
  id v26 = [v30 objectForKey:@"testName"];
  double v29 = [(MailAppController *)self _prepareForScrollMessagesTest:v30 inEditMode:0 currentDelay:&v51];
  int v28 = [v29 conversationViewController];
  double v25 = [v29 presentedViewController];
  id v4 = [v25 searchResultsUpdater];
  id v31 = self;
  BOOL v5 = [v30 objectForKeyedSubscript:@"searchStrings"];
  id v27 = [v5 componentsSeparatedByString:@" "];

  id v6 = v29;
  id v7 = v31;
  if (+[UIDevice mf_isPad]
    && (unint64_t)(qword_100699588 - 1) <= 1)
  {
    double v51 = v51 + 0.5;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000DDB88;
    v50[3] = &unk_1006047A0;
    v50[4] = v31;
    +[EFScheduler mf_afterUIDelay:performBlock:](EFScheduler, "mf_afterUIDelay:performBlock:", v50);
  }
  else if (!v29 || [v28 isFullyVisible])
  {
    double v51 = v51 + 0.5;
    id v8 = [v29 navigationController];
    id v9 = [v8 popToViewController:v29 animated:1];

    id v7 = v31;
    id v6 = v29;
    [(MailAppController *)v31 _waitForTimeInterval:v51];
  }
  double v51 = v51 + 0.5;
  double v10 = v51;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000DDB94;
  v47[3] = &unk_100604668;
  v47[4] = v7;
  id v11 = v26;
  id v48 = v11;
  id v12 = v6;
  id v49 = v12;
  +[EFScheduler mf_afterUIDelay:v47 performBlock:v10];
  double v51 = v51 + 1.0;
  id v13 = [v30 objectForKeyedSubscript:@"timeBetweenLetters"];
  [v13 floatValue];
  float v15 = v14;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  id obj = v27;
  id v16 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v16)
  {
    double v17 = v15;
    uint64_t v33 = *(void *)v44;
    do
    {
      id v18 = 0;
      id v34 = v16;
      do
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(obj);
        }
        unint64_t v19 = 0;
        id v20 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v18);
        while (v19 < (unint64_t)[v20 length] + 1)
        {
          double v21 = v51;
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_1000DDBD8;
          v38[3] = &unk_100604868;
          id v39 = v12;
          id v40 = v20;
          unint64_t v42 = v19;
          id v41 = v4;
          +[EFScheduler mf_afterUIDelay:v38 performBlock:v21];
          double v51 = v51 + v17;

          ++v19;
        }
        id v18 = (char *)v18 + 1;
      }
      while (v18 != v34);
      id v16 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v16);
  }

  double v22 = v51;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000DDCDC;
  v35[3] = &unk_100604668;
  v35[4] = v31;
  id v23 = v11;
  id v36 = v23;
  id v24 = v12;
  id v37 = v24;
  +[EFScheduler mf_afterUIDelay:v35 performBlock:v22];
}

- (void)_reallyStartShowComposeTest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:0];
  [v5 setShowKeyboardImmediately:1];
  uint64_t v6 = MFMailComposeViewDidShow;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000DDFB0;
  v18[3] = &unk_100607778;
  void v18[4] = self;
  id v7 = v4;
  id v19 = v7;
  [(MailAppController *)self installNotificationObserverForNotificationName:v6 forOneNotification:1 usingBlock:v18];
  if ((+[UIDevice mf_isPad] & 1) == 0)
  {
    uint64_t v8 = MFMailComposeViewDidAnimate;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000DDFC4;
    v16[3] = &unk_100607778;
    v16[4] = self;
    id v17 = v7;
    [(MailAppController *)self installNotificationObserverForNotificationName:v8 forOneNotification:1 usingBlock:v16];
  }
  double v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1000DDFDC;
  id v13 = &unk_100607778;
  float v14 = self;
  id v9 = v7;
  id v15 = v9;
  [(MailAppController *)self installNotificationObserverForNotificationName:UIKeyboardDidShowNotification forOneNotification:1 usingBlock:&v10];
  -[MailAppController startedTest:](self, "startedTest:", v9, v10, v11, v12, v13, v14);
  [(MailAppController *)self startedSubTest:@"ComposeViewAnimationStart" forTest:v9];
  [(MailAppController *)self showComposeWithContext:v5 animated:1 initialTitle:0 completionBlock:0];
}

- (void)_finishTestIfComposeAndKeyboardDidShow:(id)a3
{
  id v4 = a3;
  if ((+[UIDevice mf_isPad] & 1) != 0
    || byte_100699590 == 1 && byte_100699591 == 1)
  {
    [(MailAppController *)self _finishTestDismissingReply:v4];
    byte_100699590 = 0;
    byte_100699591 = 0;
  }
}

- (void)_reallyStartShowEmptyComposeTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MFMailComposeViewDidShow;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000DE23C;
  v15[3] = &unk_100607778;
  v15[4] = self;
  id v6 = v4;
  id v16 = v6;
  [(MailAppController *)self installNotificationObserverForNotificationName:v5 forOneNotification:1 usingBlock:v15];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_1000DE250;
  id v12 = &unk_100607778;
  id v13 = self;
  id v7 = v6;
  id v14 = v7;
  [(MailAppController *)self installNotificationObserverForNotificationName:UIKeyboardDidShowNotification forOneNotification:1 usingBlock:&v9];
  -[MailAppController startedTest:](self, "startedTest:", v7, v9, v10, v11, v12, v13);
  [(MailAppController *)self startedSubTest:@"ComposeViewAnimationStart" forTest:v7];
  uint64_t v8 = [(MailAppController *)self mostRecentMainScene];
  [v8 composeButtonPressed:0];
}

- (void)_reallyStartShowEmptyComposeAnimationTest:(id)a3
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000DE3D0;
  v13[3] = &unk_100604618;
  id v14 = self;
  id v4 = a3;
  id v15 = v4;
  [(MailAppController *)v14 installCACommitCompletionBlock:v13];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_1000DE3DC;
  uint64_t v10 = &unk_100607778;
  uint64_t v11 = self;
  id v5 = v4;
  id v12 = v5;
  [(MailAppController *)self installNotificationObserverForNotificationName:UIKeyboardDidShowNotification forOneNotification:1 usingBlock:&v7];
  id v6 = [(MailAppController *)self mostRecentMainScene];
  [v6 composeButtonPressed:0];
}

- (void)_prepareForShowComposeTest:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DE510;
  v8[3] = &unk_1006047A0;
  v8[4] = self;
  +[EFScheduler mf_afterUIDelay:v8 performBlock:2.0];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DE51C;
  v6[3] = &unk_100604618;
  v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  +[EFScheduler mf_afterUIDelay:v6 performBlock:4.0];
}

- (void)searchPseudoContact:(id)a3
{
  id v11 = a3;
  id v4 = [(MailAppController *)self dockContainer];
  id v5 = [v4 activeViewController];

  if (v5)
  {
    id v6 = [v5 _mailComposeController];
    id v7 = [v6 mailComposeView];
    uint64_t v8 = [v7 toField];

    id v9 = [v8 textView];
    [v9 setText:v11];

    uint64_t v10 = [v8 textView];
    [v8 textViewDidChange:v10];
  }
}

- (void)scrollPseudoContactList:(id)a3
{
  id v15 = a3;
  id v4 = [(MailAppController *)self dockContainer];
  id v5 = [v4 activeViewController];

  id v6 = [v5 _mailComposeController];
  id v7 = [v6 mailComposeView];
  uint64_t v8 = [v7 searchTableView];

  id v9 = [v15 objectForKey:@"offset"];
  id v10 = [v9 intValue];

  id v11 = [v15 objectForKey:@"iterations"];
  id v12 = [v11 intValue];

  id v13 = [v8 desiredScrollLength:v15];
  id v14 = [v15 objectForKey:@"testName"];
  [v8 _performScrollTest:v14 iterations:v12 delta:v10 length:v13];
}

- (void)_reallyStartComposeToPseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:0];
  [v8 setShowKeyboardImmediately:1];
  id v9 = [v7 objectForKey:@"PseudoContact"];
  uint64_t v10 = MFMailComposeViewDidShow;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000DEA20;
  v20[3] = &unk_100607778;
  void v20[4] = self;
  id v11 = v9;
  id v21 = v11;
  [(MailAppController *)self installNotificationObserverForNotificationName:v10 forOneNotification:1 usingBlock:v20];
  uint64_t v12 = MFMailComposeViewDidSortSearchResults;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1000DEA2C;
  id v17 = &unk_100607778;
  id v18 = self;
  id v13 = v6;
  id v19 = v13;
  [(MailAppController *)self installNotificationObserverForNotificationName:v12 forOneNotification:1 usingBlock:&v14];
  -[MailAppController showComposeWithContext:animated:initialTitle:completionBlock:](self, "showComposeWithContext:animated:initialTitle:completionBlock:", v8, 1, 0, 0, v14, v15, v16, v17, v18);
  [(MailAppController *)self startedTest:v13];
}

- (void)_reallyStartScrollPseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:0];
  [v8 setShowKeyboardImmediately:1];
  id v9 = [v7 objectForKey:@"PseudoContact"];
  uint64_t v10 = MFMailComposeViewDidShow;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000DEC34;
  v20[3] = &unk_100607778;
  void v20[4] = self;
  id v11 = v9;
  id v21 = v11;
  [(MailAppController *)self installNotificationObserverForNotificationName:v10 forOneNotification:1 usingBlock:v20];
  uint64_t v12 = MFMailComposeViewDidSortSearchResults;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1000DEC40;
  id v17 = &unk_100607778;
  id v18 = self;
  id v13 = v7;
  id v19 = v13;
  [(MailAppController *)self installNotificationObserverForNotificationName:v12 forOneNotification:1 usingBlock:&v14];
  -[MailAppController showComposeWithContext:animated:initialTitle:completionBlock:](self, "showComposeWithContext:animated:initialTitle:completionBlock:", v8, 1, 0, 0, v14, v15, v16, v17, v18);
  [(MailAppController *)self startedTest:v6];
}

- (void)_prepareForComposePseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000DEDAC;
  v13[3] = &unk_1006047A0;
  void v13[4] = self;
  +[EFScheduler mf_afterUIDelay:v13 performBlock:2.0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DEDB8;
  v10[3] = &unk_100604668;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  +[EFScheduler mf_afterUIDelay:v10 performBlock:4.0];
}

- (void)_prepareForScrollPseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000DEF28;
  v13[3] = &unk_1006047A0;
  void v13[4] = self;
  +[EFScheduler mf_afterUIDelay:v13 performBlock:2.0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DEF34;
  v10[3] = &unk_100604668;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  +[EFScheduler mf_afterUIDelay:v10 performBlock:4.0];
}

- (void)tearDownPhotoPickerTest
{
  BOOL v3 = [(MailAppController *)self dockContainer];
  id v6 = [v3 activeViewController];

  id v4 = v6;
  if (v6)
  {
    id v5 = [v6 _mailComposeController];
    [(MailAppController *)self _dismissComposeViewController:v5 animated:0];

    id v4 = v6;
  }
}

- (void)_startPhotoPickerTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MFMailComposeViewDidShow;
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1000DF12C;
  id v13 = &unk_100607778;
  id v6 = v4;
  id v14 = v6;
  uint64_t v15 = self;
  [(MailAppController *)self installNotificationObserverForNotificationName:v5 forOneNotification:1 usingBlock:&v10];
  id v7 = objc_alloc((Class)_MFMailCompositionContext);
  id v8 = +[NSURL URLWithString:@"mailto:foo@bar.com", v10, v11, v12, v13];
  id v9 = [v7 initWithURL:v8];

  [(MailAppController *)self showComposeWithContext:v9 animated:1 initialTitle:0 completionBlock:0];
}

- (void)_showPhotoPickerWithCompletion:(id)a3
{
  id v7 = a3;
  id v4 = [(MailAppController *)self dockContainer];
  uint64_t v5 = [v4 activeViewController];

  if (v5)
  {
    id v6 = [v5 _mailComposeController];
    [v6 insertPhotoOrVideo];
    [(MailAppController *)self installCACommitCompletionBlock:v7];
  }
}

- (void)_dismissPhotoPickerWithCompletion:(id)a3
{
  id v8 = (void (**)(void))a3;
  id v4 = [(MailAppController *)self dockContainer];
  uint64_t v5 = [v4 activeViewController];

  if (v5)
  {
    id v6 = [v5 _mailComposeController];
    id v7 = [v6 presentedViewController];
    [v6 imagePickerControllerDidCancel:v7];
    if (v8) {
      v8[2]();
    }
  }
}

- (void)startPhotoPickerTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"testName"];
  [(MailAppController *)self _prepareForComposeView:v5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DF618;
  v7[3] = &unk_100604618;
  v7[4] = self;
  id v6 = v5;
  id v8 = v6;
  +[EFScheduler mf_afterUIDelay:v7 performBlock:4.0];
}

- (void)startShowComposeTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"testName"];
  id v6 = [(MailAppController *)self _prepareForScrollMessagesTest:v4 inEditMode:0 currentDelay:0];
  [(MailAppController *)self _prepareForComposeView:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DF740;
  v8[3] = &unk_100604618;
  v8[4] = self;
  id v7 = v5;
  id v9 = v7;
  +[EFScheduler mf_afterUIDelay:v8 performBlock:4.0];
}

- (void)startShowEmptyComposeTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 mf_testName];
  [(MailAppController *)self _prepareForComposeView:v5];
  if (objc_msgSend(v5, "mf_containsSubstring:", @"Animation"))
  {
    id v6 = v8;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DF8D0;
    v8[3] = &unk_100604618;
    v8[4] = self;
    void v8[5] = v5;
    +[EFScheduler mf_afterUIDelay:v8 performBlock:4.0];
  }
  else
  {
    id v6 = v7;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DF8DC;
    v7[3] = &unk_100604618;
    v7[4] = self;
    void v7[5] = v5;
    +[EFScheduler mf_afterUIDelay:v7 performBlock:4.0];
  }
}

- (void)startComposeToPseudoContactTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"testName"];
  [(MailAppController *)self _prepareForComposeView:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DFA0C;
  v8[3] = &unk_100604668;
  v8[4] = self;
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  +[EFScheduler mf_afterUIDelay:v8 performBlock:4.0];
}

- (void)startScrollPseudoContactTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"testName"];
  [(MailAppController *)self _prepareForComposeView:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DFB40;
  v8[3] = &unk_100604668;
  v8[4] = self;
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  +[EFScheduler mf_afterUIDelay:v8 performBlock:4.0];
}

- (void)_prepareForComposeView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MailAppController *)self getMessageListViewController];
  id v6 = v5;
  if (v5)
  {
    [v5 setEditing:0 animated:0];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DFC40;
    v7[3] = &unk_1006047A0;
    v7[4] = self;
    +[EFScheduler mf_afterUIDelay:v7 performBlock:2.0];
  }
  else
  {
    [(MailAppController *)self failedTest:v4];
  }
}

- (void)_reallyStartDismissComposeTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MailAppController *)self dockContainer];
  id v6 = [v5 activeViewController];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 _mailComposeController];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000DFEB4;
      v15[3] = &unk_100607778;
      v15[4] = self;
      id v8 = v4;
      id v16 = v8;
      [(MailAppController *)self installNotificationObserverForNotificationName:UIKeyboardDidHideNotification forOneNotification:1 usingBlock:v15];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000DFEC4;
      v12[3] = &unk_100604668;
      v12[4] = self;
      id v13 = v8;
      id v9 = v7;
      id v14 = v9;
      [(MailAppController *)self installCACommitCompletionBlock:v12];
    }
    else
    {
      id v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      id v9 = +[NSString stringWithFormat:@"activeViewController is not a ComposeNavigationController. It is a %@", v11];

      [(MailAppController *)self failedTest:v4 withFailure:v9];
    }
  }
  else
  {
    [(MailAppController *)self failedTest:v4 withFailure:@"Unable to get the active ViewController"];
  }
}

- (void)_prepareForDismissComposeTest:(id)a3
{
  id v4 = a3;
  if (![(MailAppController *)self isComposeWindowActive])
  {
    uint64_t v5 = [(MailAppController *)self getMessageListViewController];
    id v6 = v5;
    if (!v5)
    {
      [(MailAppController *)self failedTest:v4];
      goto LABEL_5;
    }
    [v5 setEditing:0 animated:0];
    id v7 = objc_alloc((Class)_MFMailCompositionContext);
    id v8 = +[NSURL URLWithString:@"mailto:"];
    id v9 = [v7 initWithURL:v8];

    [v9 setShowKeyboardImmediately:1];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000E0124;
    v13[3] = &unk_100604618;
    void v13[4] = self;
    id v10 = v9;
    id v14 = v10;
    +[EFScheduler mf_afterUIDelay:v13 performBlock:2.0];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E013C;
  v11[3] = &unk_100604618;
  v11[4] = self;
  id v12 = v4;
  +[EFScheduler mf_afterUIDelay:v11 performBlock:4.0];

LABEL_5:
}

- (void)startDismissComposeTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E0200;
  v4[3] = &unk_100604618;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[EFScheduler mf_afterUIDelay:v4 performBlock:3.0];
}

- (void)startRotationTest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"testName"];
  id v6 = [(MailAppController *)self getMessageListViewController];
  id v7 = v6;
  if (v6)
  {
    [v6 setEditing:0 animated:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000E0408;
    v10[3] = &unk_1006047A0;
    v10[4] = self;
    +[EFScheduler mf_afterUIDelay:v10 performBlock:2.0];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000E0414;
    v8[3] = &unk_100604618;
    v8[4] = self;
    id v9 = v5;
    +[EFScheduler mf_afterUIDelay:v8 performBlock:4.0];
  }
  else
  {
    [(MailAppController *)self failedTest:v5];
  }
}

- (void)_reallyStartRotationTest:(id)a3
{
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E04D4;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E059C;
  v3[3] = &unk_1006047A0;
  [(MailAppController *)self runTestForKeyboardRotationWithName:a3 fromOrientation:qword_100699588 withShowKeyboardBlock:v4 withExtraResultsBlock:0 withCleanupBlock:v3];
}

- (void)_reallyStartExitEditModeTest:(id)a3
{
  id v6 = a3;
  id v4 = [(MailAppController *)self getMessageListViewController];
  if (v4)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_didFinishExitEditModeTest:" name:@"DidFinishExitEditModeTest" object:0];

    [(MailAppController *)self startedTest:v6];
    [v4 setEditing:0 animated:1];
  }
  else
  {
    [(MailAppController *)self failedTest:v6];
  }
}

- (void)startExitEditModeTest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"testName"];
  id v6 = [(MailAppController *)self _prepareForScrollMessagesTest:v4 inEditMode:1 currentDelay:0];

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E07BC;
    v7[3] = &unk_100604618;
    v7[4] = self;
    id v8 = v5;
    +[EFScheduler mf_afterUIDelay:v7 performBlock:12.0];
  }
  else
  {
    [(MailAppController *)self failedTest:v5];
  }
}

- (void)_didFinishExitEditModeTest:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E0844;
  v3[3] = &unk_1006047A0;
  v3[4] = self;
  [(MailAppController *)self finishedTest:qword_100699558 extraResults:0 withTeardownBlock:v3];
}

- (void)_reallyStartMessageTransferTest:(id)a3 mailboxController:(id)a4
{
  id v7 = a3;
  id v5 = [(MailAppController *)self getAccount];
  id v6 = [v5 mailboxUidOfType:3 createIfNeeded:0];

  if (v6) {
    [(MailAppController *)self runTest:v7 forAnimation:@"MessageToPointAnimation"];
  }
  else {
    [(MailAppController *)self failedTest:v7];
  }
}

- (void)startMessageTransferTest:(id)a3 multiSelect:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MailAppController *)self _prepareForScrollMessagesTest:v6 inEditMode:1 currentDelay:0];
  id v8 = [v6 objectForKey:@"testName"];
  if (v7)
  {
    id v9 = [(MailAppController *)self getAccount];
    id v10 = [v9 mailboxUidOfType:3 createIfNeeded:1];

    if (v10)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000E0C9C;
      v20[3] = &unk_1006047A0;
      id v11 = v7;
      id v21 = v11;
      +[EFScheduler mf_afterUIDelay:v20 performBlock:12.0];
      if (v4)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000E0CA8;
        v18[3] = &unk_1006047A0;
        id v12 = v11;
        id v19 = v12;
        +[EFScheduler mf_afterUIDelay:v18 performBlock:13.0];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000E0CB4;
        v16[3] = &unk_1006047A0;
        id v17 = v12;
        +[EFScheduler mf_afterUIDelay:v16 performBlock:14.0];
      }
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000E0CC0;
      v13[3] = &unk_100604668;
      void v13[4] = self;
      id v14 = v8;
      id v15 = v11;
      +[EFScheduler mf_afterUIDelay:v13 performBlock:18.0];
    }
    else
    {
      [(MailAppController *)self failedTest:v8];
    }
  }
  else
  {
    [(MailAppController *)self failedTest:v8];
  }
}

- (void)_reallyStartMessageDeleteTest:(id)a3
{
}

- (void)startMessageDeleteTest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"testName"];
  if (+[UIDevice mf_isPad])
  {
    id v6 = [(MailAppController *)self getMessageListViewController];
    id v7 = v6;
    if (v6)
    {
      [v6 setEditing:0 animated:0];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000E0EB4;
      v10[3] = &unk_1006047A0;
      id v11 = v7;
      +[EFScheduler mf_afterUIDelay:v10 performBlock:2.0];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000E0EC0;
      v8[3] = &unk_100604618;
      v8[4] = self;
      id v9 = v5;
      +[EFScheduler mf_afterUIDelay:v8 performBlock:4.0];
    }
    else
    {
      [(MailAppController *)self failedTest:v5];
    }
  }
  else
  {
    [(MailAppController *)self failedTest:v5];
  }
}

- (void)_messageContentLayerFinished
{
  if ([(id)qword_100699558 isEqualToString:@"MessageIteration"])
  {
    [(MailAppController *)self finishedSubTest:@"MessageLoad" forTest:qword_100699558];
    id v3 = [(MailAppController *)self getMessageListViewController];
    id v4 = v3;
    if (!v3)
    {
LABEL_32:

      return;
    }
    id v5 = [v3 conversationViewController];
    id v31 = [v5 referenceMessageListItem];

    if (dword_100699598 < 1)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v17 = [(id)qword_100699570 allValues];
      id v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v33;
        double v20 = 0.0;
        do
        {
          for (unint64_t i = 0; i != v18; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v32 + 1) + 8 * i) doubleValue];
            double v20 = v20 + v22;
          }
          id v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v18);
      }
      else
      {
        double v20 = 0.0;
      }

      id v23 = (void *)qword_100699570;
      id v24 = +[NSNumber numberWithDouble:Current - *(double *)&qword_1006995A0];
      [v23 setObject:v24 forKey:@"time"];

      double v25 = (void *)qword_100699570;
      id v26 = +[NSNumber numberWithDouble:v20 / (Current - *(double *)&qword_1006995A0) * 100.0];
      [v25 setObject:v26 forKey:@"MMMessageDisplayPercentage"];

      [(id)qword_100699570 setObject:@"percent" forKey:@"MMMessageDisplayPercentageUnits"];
      [(MailAppController *)self finishedTest:@"MessageIteration" extraResults:qword_100699570];
      id v27 = (void *)qword_100699558;
      qword_100699558 = 0;

      int v28 = (void *)qword_100699570;
      qword_100699570 = 0;

      goto LABEL_31;
    }
    id v6 = [v4 dataSource];
    id v7 = [v6 collectionViewDataSource];

    id v8 = [v7 snapshot];
    id v9 = [v31 itemID];
    id v10 = [v7 indexPathForItemIdentifier:v9];

    uint64_t v11 = (uint64_t)[v10 row];
    id v12 = [v10 section];
    id v13 = (char *)[v8 numberOfItems];
    int v14 = byte_100699594;
    if (v13 - 1 == (char *)v11) {
      char v15 = byte_100699594;
    }
    else {
      char v15 = 1;
    }
    if (v15)
    {
      if (v11) {
        int v14 = 0;
      }
      if (v14 != 1) {
        goto LABEL_27;
      }
      if (v12)
      {
        uint64_t v11 = (uint64_t)[v8 numberOfSections];
LABEL_27:
        int v29 = byte_100699594;
        [(MailAppController *)self startedSubTest:@"MessageLoad" forTest:qword_100699558];
        if (v29) {
          uint64_t v30 = v11 - 1;
        }
        else {
          uint64_t v30 = v11 + 1;
        }
        --dword_100699598;
        [v4 selectMessageAtIndex:v30];

LABEL_31:
        goto LABEL_32;
      }
      uint64_t v11 = 0;
    }
    else if (v12 != [v8 numberOfSections])
    {
      uint64_t v11 = -1;
      goto LABEL_27;
    }
    byte_100699594 = v15 ^ 1;
    goto LABEL_27;
  }
}

- (void)startMessageIterationTest:(id)a3
{
  id v6 = a3;
  id v4 = [v6 objectForKey:@"iterations"];
  dword_100699598 = [v4 intValue];

  qword_1006995A0 = CFAbsoluteTimeGetCurrent();
  [(MailAppController *)self startedTest:qword_100699558];
  [(MailAppController *)self startedSubTest:@"MessageLoad" forTest:qword_100699558];
  id v5 = [(MailAppController *)self _prepareForScrollMessagesTest:v6 inEditMode:0 currentDelay:0];
  [v5 selectMessageAtIndex:0];
}

- (void)startMailboxFilterEnableTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(MailAppController *)self _prepareForScrollMessagesTest:v4 inEditMode:0 currentDelay:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E14EC;
  v8[3] = &unk_100604668;
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  id v11 = v5;
  id v7 = v5;
  [v7 _doOnInitialLoadCompletion:v8];
}

- (void)startMailboxFilterDisableTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(MailAppController *)self _prepareForScrollMessagesTest:v4 inEditMode:0 currentDelay:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E17B8;
  v8[3] = &unk_100604668;
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  id v11 = v5;
  id v7 = v5;
  [v7 _doOnInitialLoadCompletion:v8];
}

- (void)startMailboxFilterPickerEnableTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(MailAppController *)self getMessageListViewController];
  [v4 mf_testName];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E1AE4;
  v8[3] = &unk_1006077A0;
  void v8[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v6;
  id v7 = v5;
  id v10 = v7;
  [(MailAppController *)self installNotificationObserverForNotificationName:@"MFMailboxFilterPickerViewControllerDidShow" forOneNotification:1 usingBlock:v8];
  [(MailAppController *)self startedTest:v6];
}

- (void)startMailboxFilterPickerDisableTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(MailAppController *)self getMessageListViewController];
  id v6 = [v4 mf_testName];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E1D70;
  v9[3] = &unk_1006077A0;
  id v7 = v5;
  id v10 = v7;
  id v11 = self;
  id v8 = v6;
  id v12 = v8;
  [(MailAppController *)self installNotificationObserverForNotificationName:@"MFMailboxFilterPickerViewControllerDidShow" forOneNotification:1 usingBlock:v9];
  [(MailAppController *)self startedTest:v8];
}

- (void)startShowDismissReplyTest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"testName"];
  id v6 = [(MailAppController *)self getMessageListViewController];
  id v7 = v6;
  if (v6)
  {
    [v6 setEditing:0 animated:0];
    [(MailAppController *)self dismissAnyModalViewControllerOrPopoverAnimated:0];
    [(MailAppController *)self _waitForTimeInterval:1.0];
    if (+[UIDevice mf_isPad])
    {
      id v8 = [v7 dataSource];
      id v9 = +[NSIndexPath indexPathWithIndex:0];
      id v10 = [v8 itemIdentifierForIndexPath:v9];
      [v7 selectItemID:v10 userInitiated:1 animated:0];
    }
    id v11 = [v7 referenceMessageListItemForFirstConversationWithSingleMessage:0 markAsRead:0];
    id v12 = v11;
    if (v11)
    {
      id v13 = [v11 itemID];
      [v7 _handleDidSelectItemID:v13 referenceItem:0 scrollToVisible:1 userInitiated:1 animated:0];

      double v14 = 7.0;
      if ([v5 rangeOfString:@"WarmedUp"] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        [v5 stringByAppendingString:@"IgnoreMe"];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000E21E4;
        v19[3] = &unk_100604618;
        v19[4] = self;
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v15 = v20;
        +[EFScheduler mf_afterUIDelay:v19 performBlock:7.0];

        double v14 = 14.0;
      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000E21F0;
      v17[3] = &unk_100604618;
      v17[4] = self;
      id v18 = v5;
      +[EFScheduler mf_afterUIDelay:v17 performBlock:v14];
    }
    else
    {
      id v16 = [v7 dataSource];
      -[MailAppController _testFailedDueToNilReferenceMessage:messageCount:](self, "_testFailedDueToNilReferenceMessage:messageCount:", v5, [v16 numberOfItems]);
    }
  }
  else
  {
    [(MailAppController *)self failedTest:v5 withFailure:@"Could not get MessageListViewController/MailboxContentViewController"];
  }
}

- (void)_reallyStartShowReplyTest:(id)a3
{
  id v4 = a3;
  id v5 = [(MailAppController *)self getConversationViewController];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 targetMessageForBarButtonTriage];
    if (v7)
    {
      id v8 = [v4 rangeOfString:@"NoKeyboard"];
      +[NSDate timeIntervalSinceReferenceDate];
      uint64_t v10 = v9;
      uint64_t v11 = 4 * (v8 != (id)0x7FFFFFFFFFFFFFFFLL);
      uint64_t v12 = MFMailComposeViewDidShow;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000E245C;
      v21[3] = &unk_1006077C8;
      void v21[4] = self;
      id v13 = v4;
      id v22 = v13;
      uint64_t v23 = v10;
      uint64_t v24 = v11;
      [(MailAppController *)self installNotificationObserverForNotificationName:v12 forOneNotification:1 usingBlock:v21];
      id v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      id v17 = sub_1000E2568;
      id v18 = &unk_100607778;
      uint64_t v19 = self;
      id v14 = v13;
      id v20 = v14;
      [(MailAppController *)self installNotificationObserverForNotificationName:UIKeyboardDidShowNotification forOneNotification:1 usingBlock:&v15];
      -[MailAppController startedTest:](self, "startedTest:", v14, v15, v16, v17, v18, v19);
      [(MailAppController *)self startedSubTest:@"ComposeViewAnimationStart" forTest:v14];
      [v6 _testReplyForSelectedMessage];
    }
    else
    {
      [(MailAppController *)self failedTest:v4 withFailure:@"Could not get message from the conversation view controller"];
    }
  }
  else
  {
    [(MailAppController *)self failedTest:v4 withFailure:@"Could not get the conversationViewController"];
  }
}

- (void)dismissReply
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E25E8;
  block[3] = &unk_1006047A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performNextShowDismissComposeTransitionForTest:(id)a3
{
  id v9 = a3;
  if ([(MailAppController *)self isComposeWindowActive])
  {
    [(MailAppController *)self dismissAnyModalViewControllerOrPopoverAnimated:1];
    int v5 = --dword_100699598;
  }
  else
  {
    id v6 = objc_alloc((Class)_MFMailCompositionContext);
    id v7 = +[NSURL URLWithString:@"mailto:foo@bar.com"];
    id v8 = [v6 initWithURL:v7];

    [(MailAppController *)self showComposeWithContext:v8 animated:1 initialTitle:0 completionBlock:0];
    int v5 = dword_100699598;
  }
  if (v5 < 1) {
    [(MailAppController *)self finishedTest:v9 extraResults:0];
  }
  else {
    [(MailAppController *)self performSelector:a2 withObject:v9 afterDelay:1.0];
  }
}

- (void)startShowDismissComposeTest:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKey:@"iterations"];
  dword_100699598 = [v5 intValue];

  id v6 = [v4 objectForKey:@"testName"];
  [(MailAppController *)self startedTest:v6];
  [(MailAppController *)self dismissAnyModalViewControllerOrPopoverAnimated:0];
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E2AD0;
  v9[3] = &unk_100604618;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)reportPPTTimings:(id)a3
{
  id v3 = a3;
  if (!qword_100699570)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    int v5 = (void *)qword_100699570;
    qword_100699570 = (uint64_t)v4;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [v3 allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKey:v10];
        [v11 doubleValue];
        double v13 = v12;

        id v14 = [(id)qword_100699570 objectForKey:v10];
        id v15 = v14;
        if (v14)
        {
          [v14 doubleValue];
          double v13 = v13 + v16;
        }
        id v17 = [objc_alloc((Class)NSNumber) initWithDouble:v13];
        [(id)qword_100699570 setObject:v17 forKey:v10];
      }
      id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)startConversationSelectionTestWithOptions:(id)a3
{
  id v4 = a3;
  long long v32 = [v4 mf_testName];
  unsigned __int8 v5 = [v32 containsString:@"SelectSingleMessage"];
  id v6 = [(MailAppController *)self getMessageListViewController];
  long long v33 = [v6 conversationViewController:v6];
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  char v57 = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000E347C;
  v52[3] = &unk_1006077F0;
  v55 = v56;
  id v7 = v32;
  id v53 = v7;
  v54 = self;
  uint64_t v8 = objc_retainBlock(v52);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000E3638;
  v45[3] = &unk_100607818;
  id v9 = v6;
  unsigned __int8 v50 = v5;
  char v51 = v5 ^ 1;
  id v46 = v9;
  v47 = self;
  uint64_t v10 = v8;
  id v49 = v10;
  id v11 = v7;
  id v48 = v11;
  double v12 = objc_retainBlock(v45);
  [(MailAppController *)self _waitForTimeInterval:1.0];
  if (+[UIDevice mf_isPad])
  {
    double v13 = [v9 dataSource];
    id v14 = +[NSIndexPath indexPathWithIndex:1];
    id v15 = [v13 itemIdentifierForIndexPath:v14];
    [v9 selectItemID:v15 userInitiated:1 animated:0];

    if ((unint64_t)(qword_100699588 - 1) <= 1)
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000E376C;
      v44[3] = &unk_1006047A0;
      v44[4] = self;
      +[EFScheduler mf_afterUIDelay:v44 performBlock:1.0];
    }
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000E3778;
    v42[3] = &unk_1006047A0;
    id v43 = v9;
    +[EFScheduler mf_afterUIDelay:v42 performBlock:2.0];
    [(MailAppController *)self _waitForTimeInterval:3.0];
    double v16 = &v43;
LABEL_10:

    goto LABEL_11;
  }
  if (!v9 || [v33 isFullyVisible])
  {
    id v17 = [v9 navigationController];
    id v18 = [v17 popToViewController:v9 animated:1];

    [(MailAppController *)self _waitForTimeInterval:1.0];
    long long v19 = [v9 dataSource];
    long long v20 = +[NSIndexPath indexPathWithIndex:1];
    long long v21 = [v19 itemIdentifierForIndexPath:v20];
    [v9 selectItemID:v21 userInitiated:1 animated:0];

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000E3784;
    v40[3] = &unk_1006047A0;
    id v22 = v9;
    id v41 = v22;
    +[EFScheduler mf_afterUIDelay:v40 performBlock:1.0];
    [(MailAppController *)self _waitForTimeInterval:2.0];
    double v16 = &v41;
    if (!v9 || [v33 isFullyVisible])
    {
      uint64_t v23 = [v22 navigationController];
      id v24 = [v23 popToViewController:v22 animated:1];

      [(MailAppController *)self _waitForTimeInterval:1.0];
    }
    goto LABEL_10;
  }
LABEL_11:
  double v25 = [v4 mf_testName];
  unsigned int v26 = [v25 mf_containsSubstring:@"SelectDigestView"];

  if (v26)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000E3790;
    v38[3] = &unk_100604618;
    void v38[4] = self;
    id v39 = v9;
    +[EFScheduler mf_afterUIDelay:v38 performBlock:1.0];
  }
  if (+[UIDevice mf_isPad]
    && objc_msgSend(v4, "mf_testInterfaceOrientation") == (id)1
    || (+[UIDevice mf_isPad] & 1) == 0
    && (objc_msgSend(v4, "mf_testInterfaceOrientation") == (id)3
     || objc_msgSend(v4, "mf_testInterfaceOrientation") == (id)4))
  {
    uint64_t v30 = [(MailAppController *)self mostRecentMainScene];
    id v31 = [v30 splitViewController];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000E382C;
    v36[3] = &unk_100607840;
    v36[4] = self;
    id v37 = v12;
    [v31 showMessageListViewController:1 animated:1 completion:v36];

    int v29 = v37;
  }
  else
  {
    id v27 = [v4 mf_testName];
    unsigned int v28 = [v27 mf_containsSubstring:@"SelectDigestView"];

    if (!v28)
    {
      ((void (*)(void *))v12[2])(v12);
      goto LABEL_23;
    }
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000E3920;
    v34[3] = &unk_100604578;
    long long v35 = v12;
    +[EFScheduler mf_afterUIDelay:v34 performBlock:2.0];
    int v29 = v35;
  }

LABEL_23:
  _Block_object_dispose(v56, 8);
}

- (void)startConversationScrollTestWithOptions:(id)a3
{
  id v4 = a3;
  [(MailAppController *)self _waitForTimeInterval:1.0];
  if (+[UIDevice mf_isPad]
    && objc_msgSend(v4, "mf_testInterfaceOrientation") == (id)1)
  {
    unsigned __int8 v5 = [(MailAppController *)self mostRecentMainScene];
    id v6 = [v5 splitViewController];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000E3D8C;
    v32[3] = &unk_100604550;
    v32[4] = self;
    [v6 showMessageListViewController:1 animated:1 completion:v32];

    [(MailAppController *)self _waitForTimeInterval:1.0];
  }
  id v7 = [v4 mf_testName];
  unsigned __int8 v8 = [v4 mf_isAMSTest];
  id v9 = [(MailAppController *)self getMessageListViewController];
  if (objc_msgSend(v7, "mf_containsSubstring:", @"ScrollDigestViewNatural"))
  {
    [(MailAppController *)self _waitForTimeInterval:1.0];
    uint64_t v10 = [(MailAppController *)self getMessageListContainerViewController];
    id v11 = [v9 mailboxes];
    [v10 setMailboxes:v11 senderSpecificMessageListItem:0 bucket:3 mode:1 forceReload:1];

    [(MailAppController *)self _waitForTimeInterval:2.0];
  }
  double v12 = [v9 referenceMessageListItemForFirstConversationWithSingleMessage:0 markAsRead:1];
  double v13 = [v9 conversationViewController];
  [v13 setDisableScrollPinning:1];

  id v14 = [v9 conversationViewController];
  id v15 = [v14 collectionView];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000E3E14;
  v28[3] = &unk_100604668;
  id v16 = v7;
  id v29 = v16;
  id v17 = v4;
  id v30 = v17;
  id v18 = v15;
  id v31 = v18;
  long long v19 = objc_retainBlock(v28);
  if (v12)
  {
    long long v20 = [v12 itemID];
    [v9 _handleDidSelectItemID:v20 referenceItem:0 scrollToVisible:0 userInitiated:1 animated:1];

    long long v21 = +[EFScheduler mainThreadScheduler];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000E3F60;
    v24[3] = &unk_100607868;
    unsigned __int8 v27 = v8;
    id v25 = v18;
    unsigned int v26 = v19;
    id v22 = [v21 afterDelay:v24 performBlock:1.0];

    uint64_t v23 = v25;
  }
  else
  {
    uint64_t v23 = [v9 dataSource];
    -[MailAppController _testFailedDueToNilReferenceMessage:messageCount:](self, "_testFailedDueToNilReferenceMessage:messageCount:", v16, [v23 numberOfItems]);
  }
}

- (BOOL)_allMessageViewControllersDidDisplayContent:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] < 2 || (uint64_t)objc_msgSend(0, "countOfMessages") < 2)
  {
    BOOL v6 = 0;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [0 childViewControllers];
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    BOOL v6 = v5 != 0;
    if (v5)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          if (![v3 containsObject:*(void *)(*((void *)&v10 + 1) + 8 * i)])
          {
            BOOL v6 = 0;
            goto LABEL_14;
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
      BOOL v6 = 1;
    }
LABEL_14:
  }
  return v6;
}

- (void)startConversationLoadAllMessagesTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[NSHashTable hashTableWithOptions:517];
  [(MailAppController *)self _waitForTimeInterval:1.0];
  BOOL v6 = [v4 mf_testName];
  uint64_t v7 = [(MailAppController *)self getMessageListViewController];
  unsigned __int8 v8 = [v7 referenceMessageListItemForFirstConversationWithSingleMessage:0 markAsRead:0];
  if (v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000E4470;
    v16[3] = &unk_100607778;
    void v16[4] = self;
    id v9 = v6;
    id v17 = v9;
    [(MailAppController *)self installNotificationObserverForNotificationName:@"MFMailConversationViewDidShow" forOneNotification:1 usingBlock:v16];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E447C;
    v12[3] = &unk_1006077A0;
    id v13 = v5;
    id v14 = self;
    id v15 = v9;
    [(MailAppController *)self installNotificationObserverForNotificationName:@"MFMailConversationViewChildMessageViewDidDisplayContent" forOneNotification:0 usingBlock:v12];
    long long v10 = [v8 itemID];
    [v7 _handleDidSelectItemID:v10 referenceItem:0 scrollToVisible:1 userInitiated:1 animated:0];
  }
  else
  {
    long long v11 = [v7 dataSource];
    -[MailAppController _testFailedDueToNilReferenceMessage:messageCount:](self, "_testFailedDueToNilReferenceMessage:messageCount:", v6, [v11 numberOfItems]);
  }
}

- (void)startConversationViewRotationTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mf_testName];
  if ((unint64_t)(qword_100699588 - 3) < 2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 4;
  }
  [(MailAppController *)self _waitForTimeInterval:1.0];
  uint64_t v7 = [(MailAppController *)self getMessageListViewController];
  unsigned __int8 v8 = [v7 referenceMessageListItemForFirstConversationWithSingleMessage:0 markAsRead:0];
  id v9 = v8;
  if (v8)
  {
    long long v10 = [v8 itemID];
    [v7 selectItemID:v10 userInitiated:1 animated:1];

    [(MailAppController *)self _waitForTimeInterval:2.0];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000E47FC;
    v19[3] = &unk_100607778;
    v19[4] = self;
    id v11 = v5;
    id v20 = v11;
    [(MailAppController *)self installNotificationObserverForNotificationName:@"MailSplitViewControllerWillTransitionToSizeNotification" forOneNotification:1 usingBlock:v19];
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_1000E48B4;
    id v16 = &unk_100607778;
    id v17 = self;
    id v18 = v11;
    [(MailAppController *)self installNotificationObserverForNotificationName:@"MailSplitViewControllerDidTransitionToSizeNotification" forOneNotification:1 usingBlock:&v13];
    [UIApp rotateIfNeeded:v6 completion:0 v13, v14, v15, v16, v17];
  }
  else
  {
    long long v12 = [v7 dataSource];
    -[MailAppController _testFailedDueToNilReferenceMessage:messageCount:](self, "_testFailedDueToNilReferenceMessage:messageCount:", v5, [v12 numberOfItems]);
  }
}

- (void)startMailboxPredictionTestWithOptions:(id)a3
{
  id v4 = a3;
  [(MailAppController *)self _waitForTimeInterval:1.0];
  [0 selectMessageAtIndex:0];
  [(MailAppController *)self _waitForTimeInterval:1.0];
  [v4 mf_testName];
  unsigned __int8 v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  long long v10 = sub_1000E4A34;
  id v11 = &unk_100607778;
  long long v12 = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v5;
  [(MailAppController *)self installNotificationObserverForNotificationName:@"MFMoveToPredictionTriageInteractionPredictionPresented" forOneNotification:1 usingBlock:&v8];
  -[MailAppController startedTest:](self, "startedTest:", v5, v8, v9, v10, v11, v12);
  uint64_t v6 = [0 barItemsManager];
  uint64_t v7 = [v6 moveButtonItem];
  [0 moveButtonTapped:v7];
}

- (void)startMessageListSwipeActionTestWithOptions:(id)a3
{
  id v4 = a3;
  [v4 mf_testName];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000E4D04;
  v23[3] = &unk_1006078B8;
  v23[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v25 = 0;
  id v26 = 0;
  id v24 = v5;
  uint64_t v6 = objc_retainBlock(v23);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000E4ECC;
  v20[3] = &unk_1006078E0;
  void v20[4] = self;
  id v7 = v5;
  id v21 = v7;
  id v22 = 0;
  unsigned __int8 v8 = objc_retainBlock(v20);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v9 = [(MailAppController *)self mostRecentMainScene];
  long long v10 = [v9 splitViewController];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E5048;
  v14[3] = &unk_100607908;
  objc_copyWeak(&v18, &location);
  id v11 = v7;
  id v15 = v11;
  long long v12 = v6;
  id v16 = v12;
  id v13 = v8;
  id v17 = v13;
  [v10 showMessageListViewController:1 animated:1 completion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)startMailCategorizationTest:(id)a3
{
  id v17 = a3;
  id v4 = [v17 mf_testName];
  [(MailAppController *)self startedTest:v4];
  id v18 = +[EMMessageListItemPredicates predicateForMessagesInMailboxWithType:7];
  id v5 = objc_alloc((Class)EMQuery);
  uint64_t v6 = objc_opt_class();
  id v24 = v18;
  id v7 = +[NSArray arrayWithObjects:&v24 count:1];
  unsigned __int8 v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  uint64_t v9 = +[EMMessageListItemPredicates sortDescriptorForDateAscending:0];
  uint64_t v23 = v9;
  long long v10 = +[NSArray arrayWithObjects:&v23 count:1];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000E5490;
  v21[3] = &unk_100604DE0;
  id v11 = v17;
  id v22 = v11;
  id v12 = [v5 initWithTargetClass:v6 predicate:v8 sortDescriptors:v10 builder:v21];

  id v13 = [(MailAppController *)self mostRecentMainScene];
  uint64_t v14 = [v13 daemonInterface];
  id v15 = [v14 messageRepository];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000E54FC;
  v19[3] = &unk_100605C50;
  v19[4] = self;
  id v16 = v4;
  id v20 = v16;
  [v15 recategorizeMessagesForQuery:v12 completion:v19];
}

- (void)_testFailedDueToNilReferenceMessage:(id)a3 messageCount:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v6 = +[NSString stringWithFormat:@"Couldn't find a conversation to select. Mail message count: %lu", a4];
  [(MailAppController *)self failedTest:v7 withFailure:v6];
}

- (void)startScrollMailboxListTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(MailAppController *)self getMailboxPickerController];
  uint64_t v6 = [(MailAppController *)self mostRecentMainScene];
  id v7 = [v6 splitViewController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E58A0;
  v10[3] = &unk_100607958;
  id v8 = v5;
  id v11 = v8;
  id v9 = v4;
  id v12 = v9;
  [v7 showMailboxPickerController:1 animated:0 completion:v10];
}

- (void)_waitForTimeInterval:(double)a3
{
  id v5 = +[NSRunLoop currentRunLoop];
  id v4 = +[NSDate dateWithTimeIntervalSinceNow:a3];
  [v5 runUntilDate:v4];
}

- (void)installNotificationObserverForNotificationName:(id)a3 object:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = +[NSOperationQueue mainQueue];
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1000E5CD8;
  id v25 = sub_1000E5CE8;
  id v26 = 0;
  id v13 = +[NSNotificationCenter defaultCenter];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000E5CF0;
  v17[3] = &unk_100607980;
  long long v19 = &v21;
  BOOL v20 = a5;
  id v14 = v11;
  id v18 = v14;
  uint64_t v15 = [v13 addObserverForName:v9 object:v10 queue:v12 usingBlock:v17];
  id v16 = (void *)v22[5];
  void v22[5] = v15;

  _Block_object_dispose(&v21, 8);
}

- (void)installNotificationObserverForNotificationName:(id)a3 forOneNotification:(BOOL)a4 usingBlock:(id)a5
{
}

- (id)masterNavigationController
{
  id v2 = [(MailAppController *)self mostRecentMainScene];
  id v3 = [v2 masterNavigationController];

  return v3;
}

- (BOOL)isComposeWindowActive
{
  id v2 = [(MailAppController *)self mostRecentMainScene];
  unsigned __int8 v3 = [v2 isComposeWindowActive];

  return v3;
}

- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 completionBlock:(id)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MailAppController *)self mostRecentMainScene];
  [v12 showComposeWithContext:v13 animated:v8 initialTitle:v10 presentationSource:0 completionBlock:v11];
}

- (void)dismissAnyModalViewControllerOrPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MailAppController *)self mostRecentMainScene];
  [v4 _dismissAnyModalViewControllerOrPopoverAnimated:v3];
}

- (id)dockContainer
{
  id v2 = [(MailAppController *)self mostRecentMainScene];
  BOOL v3 = [v2 dockContainer];

  return v3;
}

- (id)rootViewController
{
  id v2 = [(MailAppController *)self mostRecentMainScene];
  BOOL v3 = [v2 mf_rootViewController];

  return v3;
}

- (void)_dismissComposeViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v6 = [(MailAppController *)self mostRecentMainScene];
  [v6 dismissComposeViewController:v7 animated:v4 afterSending:0];
}

- (id)copySourcesCurrentlyVisible
{
  return &__NSArray0__struct;
}

- (id)presentingViewControllerForTriageInteraction:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  id v5 = self;
  Class isa = MailAppController.presentingViewController(for:)((MFTriageInteraction *)a3).super.super.isa;

  return isa;
}

@end