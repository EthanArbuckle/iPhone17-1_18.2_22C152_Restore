@interface SMSApplication
- (BKSProcessAssertion)backgroundAssertion;
- (BOOL)canRunTests;
- (BOOL)isNewConversationList;
- (BOOL)isOldConversationList;
- (BOOL)isRunningTest;
- (BOOL)isRunningViaTestRunner;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)runTestNameOrFallback:(id)a3;
- (BOOL)validateActionMenuWindowOrientationExpectedOrientation:(int64_t)a3 withResultsDictionary:(id)a4;
- (BOOL)validateAtConversationListInConversationListController:(id)a3 previousSearchText:(id)a4 withResultsDictionary:(id)a5;
- (BOOL)validateBottomInsetGreaterThanIAVHeight:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5;
- (BOOL)validateEntryViewIsFirstResponder:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5;
- (BOOL)validateIAVisExpanded:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5;
- (BOOL)validateNonzeroTranscriptInsets:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5;
- (BOOL)validateNumberOfSearchResultsInConversationListController:(id)a3 searchText:(id)a4 expectedNumber:(int64_t)a5 withResultsDictionary:(id)a6;
- (BOOL)validatePhotoPickerVisibility:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5 withinSubtest:(id)a6;
- (BOOL)validatePhotoPickerWindowLevel:(id)a3 expected:(double)a4 withResultsDictionary:(id)a5 withinSubtest:(id)a6;
- (BOOL)validateRecipientSelectionControllerIsFirstResponder:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5;
- (BOOL)validateTranscriptControllerIsFirstResponder:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5;
- (BOOL)validateTranscriptIsScrolledToBottom:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5;
- (BOOL)validateTranscriptPreviewCacheHasResumed:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5;
- (BOOL)validateTranscriptShouldAutorotate:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5;
- (BOOL)validateTranscriptVendingIAV:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5;
- (IMDaemonMultiplexedConnectionManaging)daemonConnection;
- (NSDictionary)pendingAppleEventInfoDictionary;
- (SHKMessagesLaunchEventContext)pendingLaunchEventContext;
- (SMSApplication)init;
- (SMSApplicationPerformSearchProtocol)testPerformSearchDelegate;
- (id)_extendLaunchTest;
- (id)_fsmIdentifierForTestName:(id)a3;
- (id)messagesController;
- (id)sceneController;
- (unint64_t)mapSectionIdentifierForCurrentConversationListClass:(unint64_t)a3;
- (void)IMCoreDeleteTopChat;
- (void)IMCoreSendNewCompose;
- (void)IMCoreToggleDisturb;
- (void)UITestActionMenuAfterRotationInVideoTaker;
- (void)UITestCancelNewComposeLandscape;
- (void)UITestDeleteTopChat;
- (void)UITestDismissRegistration;
- (void)UITestLaunchToTranscript;
- (void)UITestNewComposeDismissContactPicker;
- (void)UITestPresentNewCompose;
- (void)UITestPresentNewComposeWithDraft;
- (void)UITestPushTranscript;
- (void)UITestPushTranscriptAndDetails;
- (void)UITestPushTranscriptAndDetailsKeyboardUp;
- (void)UITestPushTranscriptKeyboardDownExpandTextEntry;
- (void)UITestPushTranscriptWithDraft;
- (void)UITestRotateTranscript;
- (void)UITestRotateTranscriptKeyboardUp;
- (void)UITestRotateTranscriptTwice;
- (void)UITestRotateTranscriptTwiceKeyboardUp;
- (void)UITestSearchForStrings;
- (void)UITestSearchForSubstringThenFullString;
- (void)UITestSearchResultNearTop;
- (void)UITestSearchResultsClearingAfterNotFound;
- (void)UITestSendAndPlayAudioMessage;
- (void)UITestSendNewComposeDraft;
- (void)UITestShowConversationWithAlertPresented;
- (void)UITestTapIntoAndOutOfConversations;
- (void)_audioBalloonPlaybackDidFinish:(id)a3;
- (void)_audioBalloonPlaybackWillStart:(id)a3;
- (void)_cancelPeoplePicker;
- (void)_chatControllerDidRotate:(id)a3;
- (void)_chatControllerWillRotate:(id)a3;
- (void)_clearFailureBadge;
- (void)_clearSearchStringWithPreviousSearchText:(id)a3 resultsDictionary:(id)a4 completion:(id)a5;
- (void)_connectToDaemon;
- (void)_detailsViewScrollingPerfTest:(id)a3;
- (void)_dismissPeoplePickerWithCompletion:(id)a3 completion:(id)a4;
- (void)_handleUnitTestInvocation:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_performNextSearchPartialFirstWithRemainingSearches:(id)a3 passedSoFar:(BOOL)a4 resultsDictionary:(id)a5 finalCompletion:(id)a6;
- (void)_performNextSearchResultsClearingTestWithRemainingSearches:(id)a3 passedSoFar:(BOOL)a4 resultsDictionary:(id)a5 finalCompletion:(id)a6;
- (void)_performNextSearchWithRemainingSearches:(id)a3 passedSoFar:(BOOL)a4 resultsDictionary:(id)a5 finalCompletion:(id)a6;
- (void)_performNextTapIntoTapOutOfTestWithRemainingSearches:(id)a3 startTime:(double)a4 passedSoFar:(BOOL)a5 resultsDictionary:(id)a6 finalCompletion:(id)a7;
- (void)_recordAllTestsPassed:(BOOL)a3 resultsDictionary:(id)a4;
- (void)_recordResult:(BOOL)a3 forKey:(id)a4 comment:(id)a5 resultsDictionary:(id)a6;
- (void)_resolveContactTest:(id)a3;
- (void)_scrollPseudoContactTest:(id)a3 withOptions:(id)a4;
- (void)_searchForString:(id)a3 validateExpectedSearchResults:(id)a4 resultsDictionary:(id)a5 completion:(id)a6;
- (void)_searchForString:(id)a3 withCompletion:(id)a4;
- (void)_searchForStringWithNoCompletion:(id)a3;
- (void)_selectContact:(id)a3;
- (void)_showPeoplePickerTest:(id)a3;
- (void)_startCancelPeoplePickerTest;
- (void)_startPeoplePickerTest;
- (void)_startResolveContactTest:(id)a3;
- (void)_startSelectContactPeoplePickerTest;
- (void)_startcomposePseudoContactTest:(id)a3 withOptions:(id)a4;
- (void)_stickerDragFired:(id)a3;
- (void)_willConfigureCellWithTranscriptPluginChatItem:(id)a3;
- (void)chatRegistryDidLoad:(id)a3;
- (void)cleanupCurrentTest;
- (void)clearEntryView;
- (void)contactPickerDidHide;
- (void)dealloc;
- (void)deleteChat:(id)a3;
- (void)deleteTopChat;
- (void)didChangeOrientation:(id)a3;
- (void)didDeleteChat;
- (void)didShowAMessage:(id)a3;
- (void)didShowNewCompose;
- (void)didShowTranscriptList;
- (void)dissmissComposeSheet;
- (void)doPushToTranscriptTestForChatIdentifierPerformanceTest:(id)a3 testBlock:(id)a4;
- (void)failedTest:(id)a3;
- (void)failedTest:(id)a3 withFailure:(id)a4;
- (void)failedTest:(id)a3 withFailure:(id)a4 withResults:(id)a5;
- (void)finishedTest:(id)a3 extraResults:(id)a4;
- (void)finishedTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5 withTeardownBlock:(id)a6;
- (void)fsmDidFinish:(id)a3;
- (void)installNotificationObserverForNotificationName:(id)a3 notificationName:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6;
- (void)keyCommandCompose:(id)a3;
- (void)newComposeDismissContactPicker:(id)a3;
- (void)perfTestPushToTranscript;
- (void)playAudioMessage;
- (void)scrollPhotoPickerTestWithOptions:(id)a3;
- (void)scrollPseudoContacts;
- (void)scrollTranscript;
- (void)sendAudioMessage;
- (void)sendMultipleMessagesEntryView:(id)a3 composition:(id)a4 handler:(id)a5;
- (void)setBackgroundAssertion:(id)a3;
- (void)setDaemonConnection:(id)a3;
- (void)setPendingAppleEventInfoDictionary:(id)a3;
- (void)setPendingLaunchEventContext:(id)a3;
- (void)setRunningViaTestRunner:(BOOL)a3;
- (void)setTestPerformSearchDelegate:(id)a3;
- (void)showConversationForChatIdentifier:(id)a3 forceReload:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (void)showConversationForChatIdentifier:(id)a3 willShowConversation:(id)a4 didShowConversation:(id)a5;
- (void)showKeyboard;
- (void)showMessagesApplicationAndStartTestForIdentifier:(id)a3 supportsLaunchSubtest:(BOOL)a4;
- (void)showNextMessage;
- (void)showTranscriptList;
- (void)showTranscriptListNotAnimated;
- (void)showTransscriptAnimated:(BOOL)a3;
- (void)startAndFailTestNamed:(id)a3 withFailure:(id)a4;
- (void)startAudioBalloonPlaybackTest:(id)a3;
- (void)startAudioWaveformFPSTest;
- (void)startCancelPeoplePickerTest:(id)a3;
- (void)startComposeMessageToPseudoContactTest:(id)a3;
- (void)startDetailsTest:(id)a3;
- (void)startExtensionTest:(id)a3 launch:(BOOL)a4;
- (void)startFSMTest;
- (void)startGeneralStaticFPSTestWithDelay:(id)a3;
- (void)startGifPlaybackStaticFPSTest;
- (void)startInteractiveStickerDragTest:(id)a3;
- (void)startInvisibleInkStaticFPSTest;
- (void)startKeyboardPresentationTest:(id)a3;
- (void)startKeyboardResponsivenessTest:(id)a3;
- (void)startLiveBubbleLoadingTest:(id)a3;
- (void)startMarkAsReadLocallyTestWithOptions:(id)a3;
- (void)startMarkAsReadReceivedTestWithOptions:(id)a3;
- (void)startPPTSubtestForCurrentTest:(id)a3;
- (void)startPriorityBoostingTestWithOptions:(id)a3;
- (void)startQuicklookPresentationTest:(id)a3;
- (void)startResizeTestWithOptions:(id)a3;
- (void)startResolveContactTest:(id)a3;
- (void)startRotationTest:(id)a3;
- (void)startRotationTestWithTranscript:(id)a3;
- (void)startScreenshotTestWithOptions:(id)a3;
- (void)startScrollConversationsTest:(id)a3;
- (void)startScrollForCollectionView:(id)a3;
- (void)startScrollPseudoContactNamesTest:(id)a3;
- (void)startScrollTranscriptTest:(id)a3;
- (void)startSelectContactPeoplePickerTest:(id)a3;
- (void)startSendAnimationExistingTest;
- (void)startSendAnimationNewComposeTest:(id)a3;
- (void)startShowMessagesTest:(id)a3;
- (void)startShowNewComposeTest:(id)a3;
- (void)startShowPeoplePickerTest:(id)a3;
- (void)startStaticFSMFPSTest:(id)a3;
- (void)startStaticTranscriptFPSTest:(id)a3;
- (void)startStuckAudioPillTest:(id)a3;
- (void)startTranscriptOnlyScreenshotTestwithOptions:(id)a3;
- (void)stopPPTSubtestForCurrentTest:(id)a3;
- (void)tapFSMIfNecessary;
- (void)tearDownCancelPeoplePickerTest;
- (void)tearDownResolveContactTest:(id)a3;
- (void)tearDownSelectContactPeoplePickerTest;
- (void)tearDownShowPeoplePickerTest;
- (void)tearDownShowPeoplePickerTest:(id)a3;
- (void)typeInContactName:(id)a3;
@end

@implementation SMSApplication

- (void)cleanupCurrentTest
{
  v2 = (void *)__CurrentTestName;
  __CurrentTestName = 0;

  v3 = (void *)qword_10003AE50;
  qword_10003AE50 = 0;

  v4 = (void *)qword_10003AE68;
  qword_10003AE68 = 0;

  byte_10003AE70 = 0;
  byte_10003AE71 = 0;
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  sub_1000017E4(v7);
  v10.receiver = self;
  v10.super_class = (Class)SMSApplication;
  [(SMSApplication *)&v10 finishedTest:v7 extraResults:v6];

  if (__CurrentTestName)
  {
    [(SMSApplication *)self showTranscriptListNotAnimated];
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:@"PPTDidShowConversationEvent" object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 removeObserver:self name:UIWindowDidRotateNotification object:0];
  }
  [(SMSApplication *)self cleanupCurrentTest];
}

- (SMSApplication)init
{
  v20.receiver = self;
  v20.super_class = (Class)SMSApplication;
  v2 = [(SMSApplication *)&v20 init];
  if (v2)
  {
    if (CKIsRunningForDevelopmentOnSimulator()) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = CKIsRunningUITests() == 0;
    }
    if (((kFZListenerCapSendMessages | kFZListenerCapChats) & CKListenerCapabilities()) == 0 || v3) {
      goto LABEL_17;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001EB40;
    block[3] = &unk_100031250;
    v15 = @"+15555648583";
    v16 = @"+18885551212";
    v17 = @"john-appleseed@mac.com";
    v18 = @"kate-bell@mac.com";
    v19 = @"+18885551213";
    if (qword_10003AF50 != -1) {
      dispatch_once(&qword_10003AF50, block);
    }
    if (CKIsRunningUITests())
    {
      v23[0] = qword_10003AF10;
      v23[1] = qword_10003AF18;
      v23[2] = qword_10003AF20;
      v23[3] = qword_10003AF28;
      v23[4] = qword_10003AF30;
      v23[5] = qword_10003AF38;
      v23[6] = qword_10003AF40;
      v23[7] = qword_10003AF48;
      v4 = v23;
      uint64_t v5 = 8;
    }
    else
    {
      if (CKIsRunningForDevelopmentOnSimulator())
      {
        id v6 = +[IMLockdownManager sharedInstance];
        unsigned int v7 = [v6 isInternalInstall];

        if (v7)
        {
          v8 = +[CKIMSimulatedChat prepopulatedChat];
          v22[0] = qword_10003AF10;
          v22[1] = qword_10003AF18;
          v22[2] = v8;
          v9 = +[NSArray arrayWithObjects:v22 count:3];

LABEL_16:
          objc_super v10 = +[IMChatRegistry sharedRegistry];
          [v10 _setSimulatedChats:v9];

          v11 = +[IMDaemonController sharedInstance];
          [v11 setListeners:v9];

LABEL_17:
          +[IMChat setChatItemRulesClass:objc_opt_class()];
          id v12 = +[CKConversationList sharedConversationList];
          [(SMSApplication *)v2 _connectToDaemon];
          [(SMSApplication *)v2 _registerForAppleEventsIfNecessary];
          return v2;
        }
      }
      v21[0] = qword_10003AF10;
      v21[1] = qword_10003AF18;
      v4 = v21;
      uint64_t v5 = 2;
    }
    v9 = +[NSArray arrayWithObjects:v4 count:v5];
    goto LABEL_16;
  }
  return v2;
}

- (void)_connectToDaemon
{
  uint64_t v3 = CKListenerCapabilities() | 0x60400000;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[IMPinnedConversationsController sharedInstance];
  uint64_t v5 = [v4 pinnedConversationIdentifiers];
  [v9 setObject:v5 forKeyedSubscript:IMClientSetupContextPinnedChatIdentifiers];

  id v6 = +[IMDaemonController sharedController];
  unsigned int v7 = [v6 multiplexedConnectionWithLabel:@"MobileSMS" capabilities:v3 context:v9];
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = v7;
}

- (BOOL)isRunningTest
{
  v4.receiver = self;
  v4.super_class = (Class)SMSApplication;
  if ([(SMSApplication *)&v4 isRunningTest]) {
    return 1;
  }
  else {
    return [(SMSApplication *)self isRunningViaTestRunner];
  }
}

- (BOOL)isRunningViaTestRunner
{
  return self->_runningViaTestRunner;
}

- (id)_extendLaunchTest
{
  return @"LaunchToBecomeResponsive";
}

- (SHKMessagesLaunchEventContext)pendingLaunchEventContext
{
  return self->_pendingLaunchEventContext;
}

- (NSDictionary)pendingAppleEventInfoDictionary
{
  return self->_pendingAppleEventInfoDictionary;
}

- (void)startScreenshotTestWithOptions:(id)a3
{
  id v5 = a3;
  objc_super v4 = [v5 valueForKey:@"testName"];
  if (!IMIsRunningInScreenshotTesting()) {
    exit(-1);
  }
  if (!+[SMSScreenshotTestInfo screenshotTestNameEnumValue:v4])[(SMSApplication *)self startTranscriptOnlyScreenshotTestwithOptions:v5]; {
}
  }

- (void)startTranscriptOnlyScreenshotTestwithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForKey:@"chatIdentifier"];
  id v6 = +[CKConversationList sharedConversationList];
  unsigned int v7 = [v6 conversationForExistingChatWithChatIdentifier:v5];

  if (v7)
  {
    v8 = +[CKDraftManager sharedInstance];
    [v8 setDraft:0 forConversation:v7];

    id v9 = +[CKDraftManager sharedInstance];
    [v9 saveCompositionAndFlushCache:1];

    objc_super v10 = [(SMSApplication *)self messagesController];
    [v10 showConversationListWithAnimation:0];

    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004B64;
    block[3] = &unk_100030A58;
    void block[4] = self;
    id v13 = v7;
    id v14 = v4;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)sceneController
{
  v2 = [(SMSApplication *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 sceneController];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)messagesController
{
  v2 = [(SMSApplication *)self sceneController];
  uint64_t v3 = [v2 messagesSceneDelegate];
  id v4 = [v3 messagesController];

  return v4;
}

- (BOOL)runTestNameOrFallback:(id)a3
{
  id v4 = (NSString *)a3;
  SEL v5 = NSSelectorFromString(v4);
  if (v5 && (SEL v6 = v5, (objc_opt_respondsToSelector() & 1) != 0)
    || ([(id)qword_10003AE50 objectForKey:@"implementationMethodName"],
        (unsigned int v7 = (NSString *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v8 = v7, SEL v6 = NSSelectorFromString(v7), v8, v6))
  {
    if ([(NSString *)v4 rangeOfString:@"Landscape"] == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 3;
    }
    if (([UIApp rotateIfNeeded:v9] & 1) == 0) {
      [(SMSApplication *)self performSelector:v6 withObject:0 afterDelay:0.5];
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  +[IMBalloonPluginManager setIsRunningPPT:1];
  uint64_t v9 = IMGetDomainValueForKey();
  BOOL v10 = v9;
  if (v9 && [v9 BOOLValue])
  {
    if (qword_10003AE58) {
      sub_10001E79C(qword_10003AE58, 0, 0);
    }
    qword_10003AE58 = (uint64_t)sub_10001E3E4();
  }
  dispatch_time_t v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"didShowAMessage:" name:@"PPTDidShowConversationEvent" object:0];

  id v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"didChangeOrientation:" name:@"PPTDidTransitionToSize" object:0];

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"chatRegistryDidLoad:" name:IMChatRegistryDidLoadNotification object:0];

  objc_storeStrong((id *)&__CurrentTestName, a3);
  objc_storeStrong((id *)&qword_10003AE50, a4);
  id v14 = [(id)qword_10003AE50 objectForKey:@"iterations"];
  dword_10003AE60 = [v14 intValue] + 1;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100005120;
  void v22[3] = &unk_100030A80;
  v22[4] = self;
  id v15 = v7;
  id v23 = v15;
  id v16 = v8;
  id v24 = v16;
  v17 = objc_retainBlock(v22);
  if ([(SMSApplication *)self canRunTests])
  {
    char v18 = ((uint64_t (*)(void *))v17[2])(v17);
  }
  else
  {
    NSLog(@"No chats, deferring");
    v19 = objc_retainBlock(v17);
    objc_super v20 = (void *)qword_10003AE68;
    qword_10003AE68 = (uint64_t)v19;

    char v18 = 1;
  }

  return v18;
}

- (void)finishedTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5 withTeardownBlock:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  sub_1000017E4(v12);
  v13.receiver = self;
  v13.super_class = (Class)SMSApplication;
  [(SMSApplication *)&v13 finishedTest:v12 waitForCommit:v7 extraResults:v11 withTeardownBlock:v10];
}

- (void)failedTest:(id)a3 withFailure:(id)a4 withResults:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(SMSApplication *)self cleanupCurrentTest];
  v11.receiver = self;
  v11.super_class = (Class)SMSApplication;
  [(SMSApplication *)&v11 failedTest:v10 withFailure:v9 withResults:v8];
}

- (void)failedTest:(id)a3 withFailure:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SMSApplication *)self cleanupCurrentTest];
  v8.receiver = self;
  v8.super_class = (Class)SMSApplication;
  [(SMSApplication *)&v8 failedTest:v7 withFailure:v6];
}

- (void)failedTest:(id)a3
{
  id v4 = a3;
  [(SMSApplication *)self cleanupCurrentTest];
  v5.receiver = self;
  v5.super_class = (Class)SMSApplication;
  [(SMSApplication *)&v5 failedTest:v4];
}

- (void)showConversationForChatIdentifier:(id)a3 willShowConversation:(id)a4 didShowConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = +[CKConversationList sharedConversationList];
  id v12 = [v11 conversations];

  if ([v12 count])
  {
    [(SMSApplication *)self showTranscriptListNotAnimated];
    dispatch_time_t v13 = dispatch_time(0, 500000000);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005E48;
    v14[3] = &unk_100030AD0;
    id v15 = v8;
    id v16 = self;
    id v17 = v10;
    id v18 = v9;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);
  }
  else
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
}

- (void)doPushToTranscriptTestForChatIdentifierPerformanceTest:(id)a3 testBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006104;
  v13[3] = &unk_100030A30;
  v13[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006118;
  v10[3] = &unk_100030AF8;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = v6;
  id v8 = v11;
  id v9 = v6;
  [(SMSApplication *)self showConversationForChatIdentifier:v7 willShowConversation:v13 didShowConversation:v10];
}

- (void)showTransscriptAnimated:(BOOL)a3
{
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000061D0;
  v6[3] = &unk_100030B20;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)showTranscriptList
{
}

- (void)showTranscriptListNotAnimated
{
}

- (void)showKeyboard
{
  id v3 = [(SMSApplication *)self messagesController];
  v2 = [v3 chatController];
  [v2 showKeyboardForReply];
}

- (void)scrollPseudoContacts
{
  v2 = [(SMSApplication *)self messagesController];
  [v2 ppt_chatController];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = [v10 composeRecipientSelectionController];
  id v4 = [v3 searchListController];
  dispatch_time_t v5 = [v4 tableView];

  id v6 = [(id)qword_10003AE50 objectForKey:@"offset"];
  id v7 = [v6 intValue];

  id v8 = [(id)qword_10003AE50 objectForKey:@"iterations"];
  id v9 = [v8 intValue];

  [v5 _performScrollTest:__CurrentTestName iterations:v9 delta:v7];
}

- (void)tapFSMIfNecessary
{
  if ([__CurrentTestName rangeOfString:@"FSM"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [(SMSApplication *)self messagesController];
    id v4 = [v3 chatController];

    dispatch_time_t v5 = [v4 collectionViewController];
    id v18 = v4;
    [v4 collectionView];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v22 = 0u;
    id v6 = [v17 visibleCells];
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            uint64_t v13 = [v12 statusButton];
            if (v13)
            {
              id v14 = (void *)v13;
              char v15 = objc_opt_respondsToSelector();

              if (v15)
              {
                id v16 = [v12 statusButton];
                [v5 touchUpInsideCellStatusButton:v16];

                goto LABEL_15;
              }
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
}

- (void)scrollTranscript
{
  v2 = [(SMSApplication *)self messagesController];
  id v3 = [v2 chatController];
  id v4 = [v3 collectionViewController];
  id v14 = [v4 collectionView];

  dispatch_time_t v5 = [(id)qword_10003AE50 objectForKey:@"recapBased"];
  LODWORD(v3) = [v5 BOOLValue];

  if (v3 && [sub_100006750() isRecapAvailable])
  {
    id v6 = [objc_alloc((Class)sub_100006834()) initWithTestName:__CurrentTestName scrollView:v14 completionHandler:0];
    [sub_100006750() runTestWithParameters:v6];
  }
  else
  {
    if ([__CurrentTestName rangeOfString:kScrollTranscriptFullScreenTest] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [(id)qword_10003AE50 objectForKey:@"offset"];
      dword_10003AE74 = [v7 intValue];

      uint64_t v8 = dword_10003AE74;
      uint64_t v9 = v14;
    }
    else
    {
      [v14 frame];
      uint64_t v9 = v14;
      uint64_t v8 = (int)v10;
      dword_10003AE74 = (int)v10;
    }
    uint64_t v11 = __CurrentTestName;
    uint64_t v12 = dword_10003AE60;
    [v9 contentSize];
    [v14 _performScrollTest:v11 iterations:v12 delta:v8 length:(int)v13];
  }
}

- (void)didShowAMessage:(id)a3
{
  id v4 = a3;
  if (__CurrentTestName)
  {
    if ([__CurrentTestName rangeOfString:kShowMessagesTest] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ((+[UIDevice __ck_currentDeviceIsPadOrMac] & 1) == 0)
      {
        uint64_t v7 = __CurrentTestName;
        uint64_t v8 = +[NSArray arrayWithObject:@"time"];
        [(SMSApplication *)self startedSubTest:@"Close Message Responsiveness" forTest:v7 withMetrics:v8];

        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100006B40;
        v11[3] = &unk_100030A30;
        v11[4] = self;
        [(SMSApplication *)self installCACommitCompletionBlock:v11];
      }
      uint64_t v9 = "showTranscriptList";
      double v10 = 0.0;
      goto LABEL_15;
    }
    if ([__CurrentTestName rangeOfString:@"ScrollTranscript"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([__CurrentTestName rangeOfString:@"WithKeyboard"] != (id)0x7FFFFFFFFFFFFFFFLL) {
        [(SMSApplication *)self showKeyboard];
      }
      [(SMSApplication *)self performSelector:"tapFSMIfNecessary" withObject:0 afterDelay:0.5];
      uint64_t v9 = "scrollTranscript";
LABEL_14:
      double v10 = 1.0;
LABEL_15:
      [(SMSApplication *)self performSelector:v9 withObject:0 afterDelay:v10];
      goto LABEL_16;
    }
    if ([__CurrentTestName rangeOfString:@"StaticTranscript"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([__CurrentTestName rangeOfString:@"FSM"] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        dispatch_time_t v5 = [(id)qword_10003AE50 objectForKey:@"runtime"];
        id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v5 intValue]);
        [(SMSApplication *)self performSelector:"startGeneralStaticFPSTestWithDelay:" withObject:v6 afterDelay:1.0];

        goto LABEL_16;
      }
      uint64_t v9 = "startFSMTest";
      goto LABEL_14;
    }
  }
LABEL_16:
}

- (void)didShowNewCompose
{
  byte_10003AE71 = 1;
  if (byte_10003AE70 == 1
    && [__CurrentTestName rangeOfString:kShowNewComposeTest] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(SMSApplication *)self finishedTest:__CurrentTestName extraResults:0];
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:UIKeyboardDidShowNotification object:0];

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:@"PPTDidShowNewComposeEvent" object:0];
  }
}

- (void)didShowTranscriptList
{
  if (__CurrentTestName
    && [__CurrentTestName rangeOfString:kShowMessagesTest] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (++qword_10003AE78 >= qword_10003AE80)
    {
      id v4 = objc_alloc_init((Class)NSMutableDictionary);
      id v3 = +[NSNumber numberWithInteger:qword_10003AE80];
      [v4 setObject:v3 forKey:@"messages"];

      [v4 setObject:@"messages" forKey:@"messagesUnits"];
      [(SMSApplication *)self finishedTest:__CurrentTestName extraResults:v4];
    }
    else
    {
      [(SMSApplication *)self performSelector:"showNextMessage" withObject:0 afterDelay:0.0];
    }
  }
}

- (void)deleteTopChat
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  id v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 conversations];

  if ([v4 count])
  {
    dispatch_time_t v5 = +[CKConversationList sharedConversationList];
    id v6 = [v5 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

    uint64_t v7 = [(SMSApplication *)self messagesController];
    double v10 = v6;
    uint64_t v8 = +[NSArray arrayWithObjects:&v10 count:1];
    [v7 conversationListIsDeletingConversations:v8];

    uint64_t v9 = +[CKConversationList sharedConversationList];
    [v9 deleteConversation:v6];
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName withFailure:@"No converversations in transcript list"];
  }
}

- (void)playAudioMessage
{
  v2 = [(SMSApplication *)self messagesController];
  id v3 = [v2 chatController];

  id v4 = [v3 collectionViewController];
  dispatch_time_t v5 = [v4 collectionView];

  id v6 = [v5 visibleCells];
  uint64_t v7 = [v6 reverseObjectEnumerator];
  uint64_t v8 = [v7 allObjects];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007008;
  v11[3] = &unk_100030B48;
  id v12 = v5;
  id v13 = v3;
  id v9 = v3;
  id v10 = v5;
  [v8 enumerateObjectsUsingBlock:v11];
}

- (void)sendAudioMessage
{
  id v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 conversations];

  dispatch_time_t v5 = [(SMSApplication *)self messagesController];
  id v6 = [v5 chatController];

  if ([v4 count])
  {
    uint64_t v7 = +[CKConversationList sharedConversationList];
    uint64_t v8 = [v7 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

    id v9 = [(SMSApplication *)self messagesController];
    [v9 showConversation:v8 animate:1];

    dispatch_time_t v10 = dispatch_time(0, 1000000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000723C;
    v11[3] = &unk_100030B70;
    id v12 = v6;
    id v13 = self;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (void)UITestSendAndPlayAudioMessage
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  [(SMSApplication *)self startedTest:__CurrentTestName];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100007690;
  v16[4] = sub_1000076A0;
  id v17 = 0;
  id v3 = objc_alloc((Class)NSAttributedString);
  id v4 = +[NSBundle mainBundle];
  dispatch_time_t v5 = [v4 localizedStringForKey:@"This is a test" value:&stru_100031290 table:0];
  id v6 = [v3 initWithString:v5];

  id v7 = [objc_alloc((Class)CKComposition) initWithText:v6 subject:0];
  id v8 = [objc_alloc((Class)NSArray) initWithObjects:@"bhaskar.test@icloud.com", 0];
  dispatch_time_t v9 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000076A8;
  block[3] = &unk_100030BE8;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  char v15 = v16;
  id v10 = v7;
  id v11 = v8;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v16, 8);
}

- (void)UITestShowConversationWithAlertPresented
{
  id v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 conversations];

  id v5 = [v4 count];
  [(SMSApplication *)self startedTest:__CurrentTestName];
  if (v5)
  {
    id v6 = +[CKConversationList sharedConversationList];
    id v7 = [v6 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100007CCC;
    v10[3] = &unk_100030B70;
    void v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
}

- (void)UITestActionMenuAfterRotationInVideoTaker
{
  id v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 conversations];

  id v5 = [v4 count];
  [(SMSApplication *)self startedTest:__CurrentTestName];
  if (v5)
  {
    id v6 = +[CKConversationList sharedConversationList];
    id v7 = [v6 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100008100;
    v10[3] = &unk_100030B70;
    void v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
}

- (void)didDeleteChat
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000863C;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)deleteChat:(id)a3
{
  id v4 = a3;
  if (![(SMSApplication *)self isOldConversationList])
  {
    if ([(SMSApplication *)self isNewConversationList])
    {
      id v18 = [(SMSApplication *)self messagesController];
      long long v19 = [v18 conversationListController];

      id v20 = [v4 item];
      long long v21 = [v19 conversationList];
      long long v22 = [v21 conversations];
      id v23 = [v22 count];

      if (v20 < v23)
      {
        [v19 setEditingMode:1 animated:0];
        id v24 = [v19 collectionView];
        [v24 selectItemAtIndexPath:v4 animated:1 scrollPosition:0];

        v25 = [v19 collectionView];
        v26 = [v25 delegate];
        v27 = [v19 collectionView];
        [v26 collectionView:v27 didSelectItemAtIndexPath:v4];

        dispatch_time_t v28 = dispatch_time(0, 1000000000);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100008AD4;
        v30[3] = &unk_100030A30;
        v31 = v19;
        dispatch_after(v28, (dispatch_queue_t)&_dispatch_main_q, v30);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_12;
      }
      long long v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "The conversation list was not of type CKConversationListController or CKConversationListCollectionViewController.", v29, 2u);
      }
    }

    goto LABEL_12;
  }
  id v5 = [(SMSApplication *)self messagesController];
  id v6 = [v5 conversationListController];
  id v7 = [v6 view];

  id v8 = [v4 row];
  id v9 = [(SMSApplication *)self messagesController];
  id v10 = [v9 conversationListController];
  id v11 = [v10 conversationList];
  id v12 = [v11 conversations];
  id v13 = [v12 count];

  if (v8 < v13)
  {
    id v14 = [(SMSApplication *)self messagesController];
    char v15 = [v14 conversationListController];
    [v15 setEditing:1 animated:0];

    [v7 selectRowAtIndexPath:v4 animated:1 scrollPosition:0];
    id v16 = [v7 delegate];
    [v16 tableView:v7 didSelectRowAtIndexPath:v4];

    dispatch_time_t v17 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008A74;
    block[3] = &unk_100030A30;
    void block[4] = self;
    dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
  }

LABEL_12:
}

- (BOOL)isOldConversationList
{
  return 0;
}

- (BOOL)isNewConversationList
{
  v2 = +[CKUIBehavior sharedBehaviors];
  id v3 = [v2 conversationListControllerClass];

  return v3 == (id)objc_opt_class();
}

- (unint64_t)mapSectionIdentifierForCurrentConversationListClass:(unint64_t)a3
{
  if ([(SMSApplication *)self isOldConversationList])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_15;
    }
    id v6 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    __int16 v13 = 0;
    id v7 = "Tried to map to the TipKit section in the old conversation list.";
    id v8 = (uint8_t *)&v13;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
LABEL_14:

    goto LABEL_15;
  }
  if ([(SMSApplication *)self isNewConversationList])
  {
    switch(a3)
    {
      case 0uLL:
        return a3;
      case 1uLL:
        return 3;
      case 2uLL:
        return 1;
      case 3uLL:
        return 2;
      case 4uLL:
        if (!IMOSLoggingEnabled()) {
          goto LABEL_15;
        }
        id v6 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
          goto LABEL_14;
        }
        *(_WORD *)buf = 0;
        id v7 = "Tried to map to the siri section in the new conversation list.";
        id v8 = buf;
        break;
      case 5uLL:
        return 4;
      case 6uLL:
        return 5;
      default:
        goto LABEL_15;
    }
    goto LABEL_13;
  }
LABEL_15:
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No mapping could be made because the conversation list was not of type CKConversationListController or CKConversationListCollectionViewController.", v11, 2u);
    }
  }
  return -1;
}

- (void)UITestDeleteTopChat
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  id v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 conversations];

  if (v4)
  {
    qword_10003AE88 = (uint64_t)[v4 count];
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008F28;
    block[3] = &unk_100030A30;
    void block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName withFailure:@"No conversations in list so cannot delete top one"];
  }
}

- (void)UITestPushTranscript
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  uint64_t v3 = [(id)qword_10003AE50 objectForKey:@"chatIdentifier"];
  BOOL v4 = v3 == 0;
  if (v3) {
    dispatch_time_t v5 = (__CFString *)v3;
  }
  else {
    dispatch_time_t v5 = @"chat339741476857344860";
  }
  dispatch_time_t v6 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000909C;
  block[3] = &unk_100030C10;
  void block[4] = self;
  id v9 = v5;
  BOOL v10 = v4;
  id v7 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestLaunchToTranscript
{
  uint64_t v3 = [(id)qword_10003AE50 objectForKey:@"chatIdentifier"];
  if (v3) {
    BOOL v4 = (__CFString *)v3;
  }
  else {
    BOOL v4 = @"+14087240720";
  }
  dispatch_time_t v5 = +[NSString stringWithFormat:@"sms://open?groupid=%@", v4];
  dispatch_time_t v6 = +[NSURL URLWithString:v5];

  [(SMSApplication *)self startedTest:__CurrentTestName];
  id v7 = [(SMSApplication *)self sceneController];
  id v8 = [v7 messagesSceneDelegate];
  [v8 openURL:v6 sourceApplication:0];

  dispatch_time_t v9 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009590;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPushTranscriptWithDraft
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009790;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPushTranscriptKeyboardDownExpandTextEntry
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009C3C;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPushTranscriptAndDetails
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A228;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPushTranscriptAndDetailsKeyboardUp
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A7E0;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestDismissRegistration
{
  [(SMSApplication *)self startedTest:__CurrentTestName];
  if (+[IMServiceImpl smsEnabled])
  {
    uint64_t v3 = __CurrentTestName;
    [(SMSApplication *)self finishedTest:v3];
  }
  else
  {
    BOOL v4 = [(SMSApplication *)self sceneController];
    dispatch_time_t v5 = [v4 messagesSceneDelegate];
    [v5 setShouldShowRegistrationOverride:1];

    dispatch_time_t v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:IMAccountControllerOperationalAccountsChangedNotification object:0];

    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AF08;
    block[3] = &unk_100030A30;
    void block[4] = self;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)UITestRotateTranscript
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B1B8;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestRotateTranscriptKeyboardUp
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B680;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestRotateTranscriptTwice
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BC08;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestRotateTranscriptTwiceKeyboardUp
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C190;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPresentNewCompose
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C7D8;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPresentNewComposeWithDraft
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  id v3 = objc_alloc((Class)NSAttributedString);
  BOOL v4 = +[NSBundle mainBundle];
  dispatch_time_t v5 = [v4 localizedStringForKey:@"This is a test" value:&stru_100031290 table:0];
  id v6 = [v3 initWithString:v5];

  id v7 = [objc_alloc((Class)CKComposition) initWithText:v6 subject:0];
  id v8 = [objc_alloc((Class)NSArray) initWithObjects:@"bhaskar.test@icloud.com", 0];
  dispatch_time_t v9 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CB64;
  block[3] = &unk_100030A58;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestSendNewComposeDraft
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  id v3 = objc_alloc((Class)NSAttributedString);
  BOOL v4 = +[NSBundle mainBundle];
  dispatch_time_t v5 = [v4 localizedStringForKey:@"This is a test" value:&stru_100031290 table:0];
  id v6 = [v3 initWithString:v5];

  id v7 = [objc_alloc((Class)CKComposition) initWithText:v6 subject:0];
  id v8 = [objc_alloc((Class)NSArray) initWithObjects:@"bhaskar.test@icloud.com", 0];
  dispatch_time_t v9 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CEEC;
  block[3] = &unk_100030A58;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)perfTestPushToTranscript
{
  id v3 = [(id)qword_10003AE50 objectForKey:@"chatIdentifier"];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D58C;
  v4[3] = &unk_100030C38;
  v4[4] = self;
  [(SMSApplication *)self doPushToTranscriptTestForChatIdentifierPerformanceTest:v3 testBlock:v4];
}

- (void)contactPickerDidHide
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D68C;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)newComposeDismissContactPicker:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D84C;
  v7[3] = &unk_100030B70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)UITestNewComposeDismissContactPicker
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DA14;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestCancelNewComposeLandscape
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DCAC;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestSearchForStrings
{
  [(SMSApplication *)self startedTest:__CurrentTestName];
  dispatch_time_t v3 = +[NSArray arrayWithContentsOfFile:@"/usr/local/share/chatkit/SearchTestCorpus.plist"];
  if (v3)
  {
    [(SMSApplication *)self showTranscriptListNotAnimated];
    id v4 = v3;
    ck_dispatch_main_after_seconds();
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
}

- (void)UITestSearchResultsClearingAfterNotFound
{
  [(SMSApplication *)self startedTest:__CurrentTestName];
  dispatch_time_t v3 = +[NSArray arrayWithContentsOfFile:@"/usr/local/share/chatkit/SearchTestCorpus.plist"];
  if (v3)
  {
    [(SMSApplication *)self showTranscriptListNotAnimated];
    id v4 = v3;
    ck_dispatch_main_after_seconds();
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
}

- (void)UITestSearchForSubstringThenFullString
{
  [(SMSApplication *)self startedTest:__CurrentTestName];
  dispatch_time_t v3 = +[NSArray arrayWithContentsOfFile:@"/usr/local/share/chatkit/SearchTestCorpus.plist"];
  if (v3)
  {
    [(SMSApplication *)self showTranscriptListNotAnimated];
    id v4 = v3;
    ck_dispatch_main_after_seconds();
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
}

- (void)UITestTapIntoAndOutOfConversations
{
  [(SMSApplication *)self startedTest:__CurrentTestName];
  dispatch_time_t v3 = +[NSArray arrayWithContentsOfFile:@"/usr/local/share/chatkit/SearchTestCorpus.plist"];
  if (v3)
  {
    [(SMSApplication *)self showTranscriptListNotAnimated];
    id v4 = v3;
    ck_dispatch_main_after_seconds();
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
}

- (void)UITestSearchResultNearTop
{
  [(SMSApplication *)self startedTest:__CurrentTestName];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000E810;
  v3[3] = &unk_100030A30;
  v3[4] = self;
  [(SMSApplication *)self _searchForString:@"#4813" withCompletion:v3];
}

- (void)_performNextTapIntoTapOutOfTestWithRemainingSearches:(id)a3 startTime:(double)a4 passedSoFar:(BOOL)a5 resultsDictionary:(id)a6 finalCompletion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  char v15 = +[NSDate date];
  [v15 timeIntervalSinceReferenceDate];
  double v17 = v16;

  if ([v12 count] && (v18.n128_f64[0] = v17 - a4, v17 - a4 < 100.0))
  {
    long long v19 = [v12 objectAtIndexedSubscript:0];
    id v20 = [v19 objectForKeyedSubscript:@"Search"];
    long long v21 = [v19 objectForKeyedSubscript:@"Results"];
    [v12 removeObject:v19];
    long long v22 = [v21 objectForKeyedSubscript:@"Count"];
    uint64_t v23 = (uint64_t)[v22 integerValue];

    if (v23 < 1)
    {
      [(SMSApplication *)self _performNextTapIntoTapOutOfTestWithRemainingSearches:v12 startTime:v9 passedSoFar:v13 resultsDictionary:v14 finalCompletion:a4];
    }
    else
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000ED90;
      v24[3] = &unk_100030CD8;
      v24[4] = self;
      id v25 = v20;
      id v26 = v21;
      id v27 = v13;
      id v28 = v12;
      double v30 = a4;
      BOOL v31 = v9;
      id v29 = v14;
      [(SMSApplication *)self _searchForString:v25 withCompletion:v24];
    }
  }
  else
  {
    (*((void (**)(id, BOOL, __n128))v14 + 2))(v14, v9, v18);
  }
}

- (void)_performNextSearchPartialFirstWithRemainingSearches:(id)a3 passedSoFar:(BOOL)a4 resultsDictionary:(id)a5 finalCompletion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 count])
  {
    id v13 = [v10 objectAtIndexedSubscript:0];
    id v14 = [v13 objectForKeyedSubscript:@"Search"];
    char v15 = [v13 objectForKeyedSubscript:@"Results"];
    [v10 removeObject:v13];
    if ((unint64_t)[v14 length] > 1)
    {
      double v16 = objc_msgSend(v14, "substringToIndex:", arc4random() % ((unint64_t)objc_msgSend(v14, "length") - 1) + 1);
      [(SMSApplication *)self _searchForStringWithNoCompletion:v16];
      id v17 = v14;
      id v18 = v15;
      id v19 = v11;
      id v20 = v10;
      id v21 = v12;
      ck_dispatch_main_after_seconds();
    }
    else
    {
      id v22 = v10;
      id v23 = v11;
      id v24 = v12;
      ck_dispatch_main_after_seconds();
    }
  }
  else
  {
    (*((void (**)(id, BOOL))v12 + 2))(v12, v8);
  }
}

- (void)_performNextSearchResultsClearingTestWithRemainingSearches:(id)a3 passedSoFar:(BOOL)a4 resultsDictionary:(id)a5 finalCompletion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 count])
  {
    id v13 = [v10 objectAtIndexedSubscript:0];
    id v14 = [v13 objectForKeyedSubscript:@"Search"];
    char v15 = [v13 objectForKeyedSubscript:@"Results"];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000F7A8;
    v18[3] = &unk_100030DC8;
    id v19 = v10;
    id v20 = v13;
    id v21 = self;
    id v22 = v14;
    id v23 = v11;
    BOOL v25 = v8;
    id v24 = v12;
    id v16 = v14;
    id v17 = v13;
    [(SMSApplication *)self _searchForString:v16 validateExpectedSearchResults:v15 resultsDictionary:v23 completion:v18];
  }
  else
  {
    (*((void (**)(id, BOOL))v12 + 2))(v12, v8);
  }
}

- (void)_performNextSearchWithRemainingSearches:(id)a3 passedSoFar:(BOOL)a4 resultsDictionary:(id)a5 finalCompletion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 count])
  {
    id v13 = [v10 objectAtIndexedSubscript:0];
    id v14 = [v13 objectForKeyedSubscript:@"Search"];
    char v15 = [v13 objectForKeyedSubscript:@"Results"];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000FA90;
    v18[3] = &unk_100030DC8;
    id v19 = v10;
    id v20 = v13;
    id v21 = self;
    id v22 = v14;
    id v23 = v11;
    BOOL v25 = v8;
    id v24 = v12;
    id v16 = v14;
    id v17 = v13;
    [(SMSApplication *)self _searchForString:v16 validateExpectedSearchResults:v15 resultsDictionary:v23 completion:v18];
  }
  else
  {
    (*((void (**)(id, BOOL))v12 + 2))(v12, v8);
  }
}

- (void)_searchForString:(id)a3 validateExpectedSearchResults:(id)a4 resultsDictionary:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SMSApplication *)self messagesController];
  char v15 = [v14 conversationListController];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000FCF4;
  v20[3] = &unk_100030DF0;
  id v21 = v11;
  id v22 = self;
  id v23 = v10;
  id v24 = v12;
  id v25 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  id v19 = v11;
  [v15 performSearch:v18 completion:v20];
}

- (void)_searchForString:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SMSApplication *)self messagesController];
  BOOL v8 = [v9 conversationListController];
  [v8 performSearch:v7 completion:v6];
}

- (void)_searchForStringWithNoCompletion:(id)a3
{
}

- (void)_clearSearchStringWithPreviousSearchText:(id)a3 resultsDictionary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SMSApplication *)self messagesController];
  id v12 = [v11 conversationListController];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100010018;
  v16[3] = &unk_100030E18;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 performSearch:0 completion:v16];
}

- (BOOL)validateNumberOfSearchResultsInConversationListController:(id)a3 searchText:(id)a4 expectedNumber:(int64_t)a5 withResultsDictionary:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = [a3 searchResultsController];
  id v13 = [v12 collectionView];
  id v14 = [v13 numberOfItemsInSection:0];
  BOOL v15 = v14 == (id)a5;
  id v16 = +[NSString stringWithFormat:@"Search \"%@\" number of results", v11];

  id v17 = +[NSString stringWithFormat:@"expected=%lld, actual=%lld", a5, v14];
  [(SMSApplication *)self _recordResult:v15 forKey:v16 comment:v17 resultsDictionary:v10];

  return v15;
}

- (BOOL)validateAtConversationListInConversationListController:(id)a3 previousSearchText:(id)a4 withResultsDictionary:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 searchResultsController];
  id v11 = [v10 collectionView];
  id v12 = [v11 numberOfItemsInSection:0];
  id v13 = +[NSString stringWithFormat:@"After clearing \"%@\" should have no results", v9];

  id v14 = +[NSString stringWithFormat:@"actual=%lld", v12];
  [(SMSApplication *)self _recordResult:v12 == 0 forKey:v13 comment:v14 resultsDictionary:v8];

  return v12 == 0;
}

- (BOOL)validatePhotoPickerVisibility:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5 withinSubtest:(id)a6
{
  return 1;
}

- (BOOL)validatePhotoPickerWindowLevel:(id)a3 expected:(double)a4 withResultsDictionary:(id)a5 withinSubtest:(id)a6
{
  return 1;
}

- (BOOL)validateTranscriptShouldAutorotate:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 shouldAutorotate] ^ v5 ^ 1;
  [(SMSApplication *)self _recordResult:v9 forKey:@"Transcript should autorotate" comment:0 resultsDictionary:v8];

  return v9;
}

- (BOOL)validateTranscriptVendingIAV:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 inputAccessoryView];
  BOOL v10 = (v9 == 0) ^ v5;

  [(SMSApplication *)self _recordResult:v10 forKey:@"Transcript vending IAV" comment:0 resultsDictionary:v8];
  return v10;
}

- (BOOL)validateNonzeroTranscriptInsets:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 collectionViewController];
  BOOL v10 = [v9 collectionView];
  [v10 contentInset];
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = (v12 <= 0.0) ^ v5;
  id v16 = +[NSString stringWithFormat:@"%.2f", *(void *)&v12];
  [(SMSApplication *)self _recordResult:v15 forKey:@"Transcript top inset is nonzero" comment:v16 resultsDictionary:v8];
  uint64_t v17 = (v14 <= 0.0) ^ v5;
  id v18 = +[NSString stringWithFormat:@"%.2f", *(void *)&v14];

  [(SMSApplication *)self _recordResult:v17 forKey:@"Transcript bottom inset is nonzero" comment:v18 resultsDictionary:v8];
  return v15 & v17;
}

- (BOOL)validateBottomInsetGreaterThanIAVHeight:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  BOOL v10 = [v9 collectionViewController];
  double v11 = [v10 collectionView];
  [v11 contentInset];
  double v13 = v12;

  double v14 = [v9 inputAccessoryView];

  if (!v14) {
    [(SMSApplication *)self _recordResult:0 forKey:@"Bottom inset > IAV height (KB up)" comment:@"Transcript controller returned nil IAV, FAIL" resultsDictionary:v8];
  }
  [v14 frame];
  BOOL v16 = (v13 <= v15) ^ v5;
  uint64_t v17 = +[NSString stringWithFormat:@"bottom inset %.2f. IAV %.2f", *(void *)&v13, *(void *)&v15];
  [(SMSApplication *)self _recordResult:v16 forKey:@"Bottom inset > IAV height (KB up)" comment:v17 resultsDictionary:v8];

  return v16;
}

- (BOOL)validateIAVisExpanded:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [a3 inputAccessoryView];
  if (!v9) {
    [(SMSApplication *)self _recordResult:0 forKey:@"IAV height > 44.0 (IAV is expanded)" comment:@"Transcript controller returned nil IAV, FAIL" resultsDictionary:v8];
  }
  [v9 frame];
  BOOL v11 = (v10 <= 44.0) ^ v5;
  double v12 = +[NSString stringWithFormat:@"IAV height %.2f", *(void *)&v10];
  [(SMSApplication *)self _recordResult:v11 forKey:@"IAV height > 44.0 (IAV is expanded)" comment:v12 resultsDictionary:v8];

  return v11;
}

- (BOOL)validateTranscriptControllerIsFirstResponder:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  double v10 = [v9 view];
  BOOL v11 = [v10 window];
  id v12 = [v11 firstResponder];

  BOOL v13 = (v12 != v9) ^ v5;
  if (v13)
  {
    double v14 = 0;
  }
  else
  {
    double v15 = @"Transcript is FR when it should not be";
    if (v5) {
      double v15 = @"Expected TranscriptController to be FR";
    }
    double v14 = v15;
  }
  [(SMSApplication *)self _recordResult:v13 forKey:@"TranscriptController is First Responder" comment:v14 resultsDictionary:v8];

  return v13;
}

- (BOOL)validateEntryViewIsFirstResponder:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [a3 entryView];
  double v10 = [v9 contentView];
  unsigned int v11 = [v10 isActive] ^ v5;

  if (v11 == 1)
  {
    id v12 = @"IAV is FR when it should not be, keyboard should be dismissed";
    if (v5) {
      id v12 = @"Expected IAV to be FR, keyboard presented";
    }
    BOOL v13 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }
  [(SMSApplication *)self _recordResult:v11 ^ 1 forKey:@"Entry View is First Responder" comment:v13 resultsDictionary:v8];

  return v11 ^ 1;
}

- (BOOL)validateTranscriptIsScrolledToBottom:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [a3 collectionViewController];
  double v10 = [v9 collectionView];

  unsigned int v11 = [v10 __ck_isScrolledToBottom] ^ v5;
  if (v11 == 1)
  {
    [v10 contentOffset];
    uint64_t v13 = v12;
    [v10 __ck_bottomOffset];
    if (v5) {
      +[NSString stringWithFormat:@"Not scrolled to bottom. Current %.2f expected %.2f", v13, v14];
    }
    else {
    double v15 = +[NSString stringWithFormat:@"Scrolled to bottom when not expected to be. Current %.2f", v13, v19];
    }
  }
  else
  {
    double v15 = 0;
  }
  uint64_t v16 = v11 ^ 1;
  if (v5) {
    CFStringRef v17 = @"Transcript scrolled to bottom";
  }
  else {
    CFStringRef v17 = @"Transcript not scrolled to bottom";
  }
  [(SMSApplication *)self _recordResult:v16 forKey:v17 comment:v15 resultsDictionary:v8];

  return v16;
}

- (BOOL)validateTranscriptPreviewCacheHasResumed:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = +[CKPreviewDispatchCache transcriptPreviewCache];
  id v9 = [v8 valueForKey:@"dispatchCache"];
  double v10 = [v9 valueForKey:@"dispatchQueue"];
  uint64_t v11 = [v10 isSuspended] ^ v5;
  if (v5) {
    CFStringRef v12 = @"Transcript preview cache resumed";
  }
  else {
    CFStringRef v12 = @"Transcript preview cache not resumed";
  }
  if (v11) {
    CFStringRef v13 = &stru_100031290;
  }
  else {
    CFStringRef v13 = @"Transcript preview cache suspend state incorrect";
  }
  [(SMSApplication *)self _recordResult:v11 forKey:v12 comment:v13 resultsDictionary:v7];

  return v11;
}

- (BOOL)validateRecipientSelectionControllerIsFirstResponder:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [a3 composeRecipientSelectionController];
  unsigned int v10 = [v9 toFieldIsFirstResponder] ^ v5;
  if (v10 == 1)
  {
    uint64_t v11 = @"To: field is FR when it should not be";
    if (v5) {
      uint64_t v11 = @"Expected To: field to be FR, keyboard presented";
    }
    CFStringRef v12 = v11;
  }
  else
  {
    CFStringRef v12 = 0;
  }
  uint64_t v13 = v10 ^ 1;
  [(SMSApplication *)self _recordResult:v13 forKey:@"To: field is first responder" comment:v12 resultsDictionary:v8];

  return v13;
}

- (BOOL)validateActionMenuWindowOrientationExpectedOrientation:(int64_t)a3 withResultsDictionary:(id)a4
{
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [UIApp windows];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        CFStringRef v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        NSClassFromString(@"CKActionMenuWindow");
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 _orientationForViewTransform])
        {
          id v14 = [v12 _orientationForViewTransform];
          if (v14 == (id)a3) {
            CFStringRef v15 = @"Orientation is correct";
          }
          else {
            CFStringRef v15 = @"Orientation is incorrect";
          }
          [(SMSApplication *)self _recordResult:v14 == (id)a3 forKey:@"CKActionMenuWindow orientation" comment:v15 resultsDictionary:v6];

          BOOL v13 = 1;
          goto LABEL_15;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  [(SMSApplication *)self _recordResult:0 forKey:@"CKActionMenuWindow orientation" comment:@"No window found" resultsDictionary:v6];
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (void)_recordResult:(BOOL)a3 forKey:(id)a4 comment:(id)a5 resultsDictionary:(id)a6
{
  BOOL v8 = a3;
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = [v11 length];
  if ((unint64_t)v12 >= 0x28) {
    uint64_t v13 = 40;
  }
  else {
    uint64_t v13 = (uint64_t)v12;
  }
  [v11 substringWithRange:0, v13];
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  id v14 = @"FAILED";
  if (v8) {
    id v14 = @"PASS";
  }
  CFStringRef v15 = v14;
  uint64_t v16 = (char *)[v23 length];
  long long v17 = v16 - 40;
  if (v16 == (char *)40)
  {
    long long v18 = v15;
  }
  else
  {
    do
    {
      long long v18 = +[NSString stringWithFormat:@" %@", v15];

      CFStringRef v15 = v18;
    }
    while (!__CFADD__(v17++, 1));
  }
  if (v9)
  {
    uint64_t v20 = +[NSString stringWithFormat:@"%@ -- %@", v18, v9];

    long long v18 = (__CFString *)v20;
  }
  id v21 = +[NSNumber numberWithBool:v8];
  [v10 setObject:v21 forKey:v23];

  id v22 = +[NSString stringWithFormat:@"%@Units", v23];
  [v10 setObject:v18 forKey:v22];
}

- (void)_recordAllTestsPassed:(BOOL)a3 resultsDictionary:(id)a4
{
}

- (void)IMCoreSendNewCompose
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  [(SMSApplication *)self startedTest:__CurrentTestName];
  id v3 = objc_alloc((Class)NSAttributedString);
  id v4 = +[NSBundle mainBundle];
  BOOL v5 = [v4 localizedStringForKey:@"This is a test" value:&stru_100031290 table:0];
  id v6 = [v3 initWithString:v5];

  id v7 = [objc_alloc((Class)CKComposition) initWithText:v6 subject:0];
  id v8 = [objc_alloc((Class)NSArray) initWithObjects:@"bhaskar.test@icloud.com", 0];
  dispatch_time_t v9 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000110C4;
  block[3] = &unk_100030A58;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)IMCoreToggleDisturb
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  [(SMSApplication *)self startedTest:__CurrentTestName];
  id v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 conversations];

  if ([v4 count])
  {
    BOOL v5 = +[CKConversationList sharedConversationList];
    id v6 = [v5 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000113B0;
    v9[3] = &unk_100030B70;
    id v10 = v6;
    id v11 = self;
    id v8 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName withFailure:@"No converversations in transcript list"];
  }
}

- (void)IMCoreDeleteTopChat
{
  [(SMSApplication *)self showTranscriptListNotAnimated];
  [(SMSApplication *)self startedTest:__CurrentTestName];
  id v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 conversations];

  if ([v4 count])
  {
    BOOL v5 = +[CKConversationList sharedConversationList];
    id v6 = [v5 conversationForExistingChatWithChatIdentifier:@"chat339741476857344860"];

    dispatch_time_t v7 = [(SMSApplication *)self messagesController];
    id v12 = v6;
    id v8 = +[NSArray arrayWithObjects:&v12 count:1];
    [v7 conversationListIsDeletingConversations:v8];

    dispatch_time_t v9 = +[CKConversationList sharedConversationList];
    [v9 deleteConversation:v6];

    dispatch_time_t v10 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000116B4;
    block[3] = &unk_100030A30;
    void block[4] = self;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName withFailure:@"No converversations in transcript list"];
  }
}

- (void)showNextMessage
{
  id v3 = [(id)qword_10003AE50 objectForKey:@"chatIdentifier"];
  id v4 = v3;
  if (!v3 || ![v3 length])
  {
    BOOL v5 = +[NSString stringWithFormat:@"chatIdentifier%ld", qword_10003AE78];
    id v6 = [(id)qword_10003AE50 objectForKey:v5];
    dispatch_time_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [&off_100034E38 objectAtIndex:qword_10003AE78];
    }
    id v9 = v8;

    id v4 = v9;
  }
  dispatch_time_t v10 = +[CKConversationList sharedConversationList];
  id v11 = [v10 conversationForExistingChatWithChatIdentifier:v4];

  id v12 = [(SMSApplication *)self messagesController];
  id v13 = [v12 currentConversation];

  if (v11 == v13)
  {
    ++qword_10003AE78;
    [(SMSApplication *)self performSelector:"showNextMessage" withObject:0 afterDelay:1.0];
  }
  else
  {
    uint64_t v14 = __CurrentTestName;
    CFStringRef v15 = +[NSArray arrayWithObject:@"time"];
    [(SMSApplication *)self startedSubTest:@"Open Message Responsiveness" forTest:v14 withMetrics:v15];

    uint64_t v16 = +[NSNotificationCenter defaultCenter];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    void v21[2] = sub_100011988;
    v21[3] = &unk_100030C60;
    v21[4] = self;
    [(SMSApplication *)self installNotificationObserverForNotificationName:v16 notificationName:@"PPTDidLayoutConversationEvent" forOneNotification:1 usingBlock:v21];

    long long v17 = [(SMSApplication *)self messagesController];
    long long v18 = [v17 conversationListController];
    [v18 beginHoldingConversationListUpdatesForPPTTests];

    long long v19 = [(SMSApplication *)self messagesController];
    [v19 showConversation:v11 animate:1];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000119A4;
    block[3] = &unk_100030A30;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)startShowMessagesTest:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CKConversationList sharedConversationList];
  id v9 = [v5 conversations];

  id v6 = [v9 count];
  dispatch_time_t v7 = [v4 objectForKey:@"numMessages"];

  qword_10003AE80 = (uint64_t)[v7 integerValue];
  uint64_t v8 = qword_10003AE80;
  if (qword_10003AE80 > (uint64_t)v6)
  {
    qword_10003AE80 = (uint64_t)v6;
    uint64_t v8 = (uint64_t)v6;
  }
  qword_10003AE78 = 0;
  if (v8 < 1)
  {
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self showNextMessage];
  }
}

- (void)dissmissComposeSheet
{
  id v3 = [(SMSApplication *)self messagesController];
  id v4 = [v3 presentedViewController];

  if (v4)
  {
    id v5 = [(SMSApplication *)self messagesController];
    [v5 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)_dismissPeoplePickerWithCompletion:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [a3 _dismissPeoplePicker];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011C40;
  v8[3] = &unk_100030E40;
  id v9 = v6;
  id v7 = v6;
  [(SMSApplication *)self installCACommitCompletionBlock:v8];
}

- (void)tearDownShowPeoplePickerTest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100011CEC;
  v4[3] = &unk_100030B70;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(SMSApplication *)v5 installCACommitCompletionBlock:v4];
}

- (void)tearDownShowPeoplePickerTest
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100012030;
  v2[3] = &unk_100030A30;
  v2[4] = self;
  [(SMSApplication *)self installCACommitCompletionBlock:v2];
}

- (void)_showPeoplePickerTest:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v6 = CNContactPickerViewControllerPickerDidShowNotification;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100012304;
  id v12 = &unk_100030C88;
  id v13 = self;
  id v14 = v4;
  id v7 = v4;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v5 notificationName:v6 forOneNotification:1 usingBlock:&v9];

  [(SMSApplication *)self startedSubTest:@"ShowPeoplePicker", __CurrentTestName, v9, v10, v11, v12, v13 forTest];
  uint64_t v8 = [v7 toField];
  [v7 composeRecipientViewRequestAddRecipient:v8];
}

- (void)_startPeoplePickerTest
{
  id v3 = [(SMSApplication *)self messagesController];
  [v3 ppt_chatController];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v5 composeRecipientSelectionController];
  [(SMSApplication *)self startedTest:__CurrentTestName];
  [(SMSApplication *)self _showPeoplePickerTest:v4];
}

- (void)startShowPeoplePickerTest:(id)a3
{
  [(SMSApplication *)self dissmissComposeSheet];
  id v4 = +[NSNotificationCenter defaultCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012468;
  v6[3] = &unk_100030C60;
  v6[4] = self;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v4 notificationName:@"PPTDidShowConversationEvent" forOneNotification:1 usingBlock:v6];

  id v5 = [(SMSApplication *)self messagesController];
  [v5 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];
}

- (void)tearDownSelectContactPeoplePickerTest
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000124DC;
  v2[3] = &unk_100030A30;
  v2[4] = self;
  [(SMSApplication *)self installCACommitCompletionBlock:v2];
}

- (void)_selectContact:(id)a3
{
  id v4 = a3;
  id v5 = [(id)qword_10003AE50 objectForKey:@"contactNumber"];
  if (v5)
  {
    uint64_t v6 = +[IMContactStore sharedInstance];
    id v7 = [v6 getContactStore];

    uint64_t v8 = +[CNPhoneNumber phoneNumberWithStringValue:v5];
    id v9 = +[CNContact predicateForContactsMatchingPhoneNumber:v8];
    uint64_t v10 = +[CNContactViewController descriptorForRequiredKeys];
    v38 = v10;
    id v11 = +[NSArray arrayWithObjects:&v38 count:1];
    id v37 = 0;
    id v12 = [v7 unifiedContactsMatchingPredicate:v9 keysToFetch:v11 error:&v37];
    id v20 = v37;

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = sub_100007690;
    v35 = sub_1000076A0;
    id v36 = 0;
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = sub_100007690;
    id v29 = sub_1000076A0;
    id v30 = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    void v21[2] = sub_1000129F4;
    v21[3] = &unk_100030E90;
    id v13 = v8;
    id v22 = v13;
    id v23 = &v31;
    id v24 = &v25;
    [v12 enumerateObjectsUsingBlock:v21];
    uint64_t v14 = v32[5];
    CFStringRef v15 = [(id)v26[5] identifier];
    uint64_t v16 = +[CNContactProperty contactPropertyWithContact:v14 propertyKey:CNContactPhoneNumbersKey identifier:v15];

    uint64_t v17 = __CurrentTestName;
    long long v18 = +[NSArray arrayWithObject:@"time"];
    [(SMSApplication *)self startedSubTest:@"SelectContact" forTest:v17 withMetrics:v18];

    long long v19 = [v4 contactPickerViewController];
    [v4 contactPicker:v19 didSelectContactProperty:v16];

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName withFailure:@"Contact Number missing."];
  }
}

- (void)_startSelectContactPeoplePickerTest
{
  id v3 = [(SMSApplication *)self messagesController];
  id v4 = [v3 ppt_chatController];

  id v5 = [v4 composeRecipientSelectionController];
  uint64_t v6 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v7 = CNContactPickerViewControllerPickerDidShowNotification;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100012D10;
  v12[3] = &unk_100030C88;
  v12[4] = self;
  id v13 = v5;
  id v8 = v5;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v6 notificationName:v7 forOneNotification:1 usingBlock:v12];

  id v9 = +[NSDistributedNotificationCenter defaultCenter];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012D1C;
  v11[3] = &unk_100030C60;
  void v11[4] = self;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v9 notificationName:CNContactPickerViewControllerPickerDidHideNotification forOneNotification:1 usingBlock:v11];

  uint64_t v10 = [v8 toField];
  [v8 composeRecipientViewRequestAddRecipient:v10];
}

- (void)startSelectContactPeoplePickerTest:(id)a3
{
  [(SMSApplication *)self dissmissComposeSheet];
  id v4 = +[NSNotificationCenter defaultCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012E04;
  v6[3] = &unk_100030C60;
  v6[4] = self;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v4 notificationName:@"PPTDidShowConversationEvent" forOneNotification:1 usingBlock:v6];

  [(SMSApplication *)self startedTest:__CurrentTestName];
  id v5 = [(SMSApplication *)self messagesController];
  [v5 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];
}

- (void)tearDownCancelPeoplePickerTest
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100012F0C;
  v2[3] = &unk_100030A30;
  v2[4] = self;
  [(SMSApplication *)self installCACommitCompletionBlock:v2];
}

- (void)_cancelPeoplePicker
{
  id v3 = [(SMSApplication *)self messagesController];
  [v3 ppt_chatController];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v7 composeRecipientSelectionController];
  if (v4)
  {
    uint64_t v5 = __CurrentTestName;
    uint64_t v6 = +[NSArray arrayWithObject:@"time"];
    [(SMSApplication *)self startedSubTest:@"CancelPeoplePicker" forTest:v5 withMetrics:v6];

    [v4 contactPickerDidCancel:0];
  }
}

- (void)_startCancelPeoplePickerTest
{
  id v3 = [(SMSApplication *)self messagesController];
  id v4 = [v3 ppt_chatController];

  uint64_t v5 = [v4 composeRecipientSelectionController];
  uint64_t v6 = +[NSDistributedNotificationCenter defaultCenter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000132FC;
  v10[3] = &unk_100030C60;
  void v10[4] = self;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v6 notificationName:CNContactPickerViewControllerPickerDidShowNotification forOneNotification:1 usingBlock:v10];

  id v7 = +[NSDistributedNotificationCenter defaultCenter];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013304;
  v9[3] = &unk_100030C60;
  void v9[4] = self;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v7 notificationName:CNContactPickerViewControllerPickerDidHideNotification forOneNotification:1 usingBlock:v9];

  id v8 = [v5 toField];
  [v5 composeRecipientViewRequestAddRecipient:v8];
}

- (void)startCancelPeoplePickerTest:(id)a3
{
  [(SMSApplication *)self dissmissComposeSheet];
  id v4 = +[NSNotificationCenter defaultCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000133EC;
  v6[3] = &unk_100030C60;
  v6[4] = self;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v4 notificationName:@"PPTDidShowConversationEvent" forOneNotification:1 usingBlock:v6];

  [(SMSApplication *)self startedTest:__CurrentTestName];
  uint64_t v5 = [(SMSApplication *)self messagesController];
  [v5 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];
}

- (void)tearDownResolveContactTest:(id)a3
{
  id v4 = a3;
  [(SMSApplication *)self finishedSubTest:@"ResolveContact" forTest:__CurrentTestName];
  if (+[UIDevice __ck_currentDeviceIsPadOrMac])
  {
    uint64_t v5 = [(SMSApplication *)self messagesController];
    uint64_t v6 = [v5 ppt_chatController];
    [v6 performSelector:"cancelButtonTapped:" withObject:0];
  }
  else
  {
    [(SMSApplication *)self dissmissComposeSheet];
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013500;
  v8[3] = &unk_100030E40;
  id v9 = v4;
  id v7 = v4;
  [(SMSApplication *)self installCACommitCompletionBlock:v8];
}

- (void)_resolveContactTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMSApplication *)self messagesController];
  [v5 ppt_chatController];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v9 composeRecipientSelectionController];
  id v7 = [v6 toField];
  id v8 = [v7 textView];
  [v8 setText:v4];

  [v6 composeRecipientView:v7 textDidChange:v4];
}

- (void)typeInContactName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMSApplication *)self messagesController];
  [v5 ppt_chatController];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v9 composeRecipientSelectionController];
  id v7 = [v6 toField];
  id v8 = [v7 textView];
  [v8 setText:v4];

  [v6 composeRecipientView:v7 textDidChange:v4];
}

- (void)startComposeMessageToPseudoContactTest:(id)a3
{
  id v4 = a3;
  [(SMSApplication *)self dissmissComposeSheet];
  id v5 = [v4 objectForKey:@"contactName"];

  if (v5) {
    [(SMSApplication *)self _startcomposePseudoContactTest:__CurrentTestName withOptions:v5];
  }
  else {
    [(SMSApplication *)self failedTest:__CurrentTestName withFailure:@"Contact Name is missing."];
  }
}

- (void)_startcomposePseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SMSApplication *)self dissmissComposeSheet];
  id v8 = +[NSNotificationCenter defaultCenter];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000138D4;
  v16[3] = &unk_100030EB8;
  v16[4] = self;
  id v9 = v6;
  id v17 = v9;
  id v18 = v7;
  id v10 = v7;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v8 notificationName:@"PPTDidShowConversationEvent" forOneNotification:1 usingBlock:v16];

  id v11 = +[NSNotificationCenter defaultCenter];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000139D8;
  v14[3] = &unk_100030C88;
  void v14[4] = self;
  id v15 = v9;
  id v12 = v9;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v11 notificationName:@"PPTSearchListDidShowOrHideNotification" forOneNotification:1 usingBlock:v14];

  id v13 = [(SMSApplication *)self messagesController];
  [v13 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];
}

- (void)startScrollPseudoContactNamesTest:(id)a3
{
  id v4 = a3;
  [(SMSApplication *)self dissmissComposeSheet];
  id v5 = [v4 objectForKey:@"contactName"];

  if (v5) {
    [(SMSApplication *)self _scrollPseudoContactTest:__CurrentTestName withOptions:v5];
  }
  else {
    [(SMSApplication *)self failedTest:__CurrentTestName withFailure:@"Contact Name is missing."];
  }
}

- (void)_scrollPseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SMSApplication *)self dissmissComposeSheet];
  id v8 = [(SMSApplication *)self messagesController];
  id v9 = [v8 ppt_chatController];

  id v10 = [v9 composeRecipientSelectionController];
  id v11 = +[NSNotificationCenter defaultCenter];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_100013C68;
  v21[3] = &unk_100030C88;
  void v21[4] = self;
  id v22 = v7;
  id v12 = v7;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v11 notificationName:@"PPTDidShowConversationEvent" forOneNotification:1 usingBlock:v21];

  id v13 = +[NSNotificationCenter defaultCenter];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100013D20;
  v17[3] = &unk_100030EB8;
  id v18 = v10;
  long long v19 = self;
  id v20 = v6;
  id v14 = v6;
  id v15 = v10;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v13 notificationName:@"PPTSearchListDidShowOrHideNotification" forOneNotification:1 usingBlock:v17];

  uint64_t v16 = [(SMSApplication *)self messagesController];
  [v16 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];
}

- (void)_startResolveContactTest:(id)a3
{
  id v4 = a3;
  [(SMSApplication *)self dissmissComposeSheet];
  id v5 = +[NSNotificationCenter defaultCenter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013ED4;
  v10[3] = &unk_100030C88;
  void v10[4] = self;
  id v11 = v4;
  id v6 = v4;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v5 notificationName:@"PPTDidShowConversationEvent" forOneNotification:1 usingBlock:v10];

  id v7 = +[NSNotificationCenter defaultCenter];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013FC8;
  v9[3] = &unk_100030C60;
  void v9[4] = self;
  [(SMSApplication *)self installNotificationObserverForNotificationName:v7 notificationName:@"PPTSearchListDidShowOrHideNotification" forOneNotification:1 usingBlock:v9];

  id v8 = [(SMSApplication *)self messagesController];
  [v8 showNewMessageCompositionPanelWithRecipients:0 composition:0 animated:1];
}

- (void)startResolveContactTest:(id)a3
{
  id v4 = [a3 objectForKey:@"contactNumber"];
  if (v4)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self _startResolveContactTest:v4];
  }
  else
  {
    [(SMSApplication *)self failedTest:__CurrentTestName withFailure:@"Contact Number missing."];
  }
}

- (void)startShowNewComposeTest:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014150;
  v8[3] = &unk_100030A30;
  void v8[4] = self;
  id v4 = objc_retainBlock(v8);
  id v5 = [(SMSApplication *)self messagesController];
  id v6 = [v5 presentedViewController];

  if (v6)
  {
    id v7 = [(SMSApplication *)self messagesController];
    [v7 dismissViewControllerAnimated:0 completion:v4];
  }
  else
  {
    ((void (*)(void *))v4[2])(v4);
  }
}

- (void)startStuckAudioPillTest:(id)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_100007690;
  v7[4] = sub_1000076A0;
  id v8 = 0;
  id v4 = [(SMSApplication *)self messagesController];
  id v8 = [v4 chatController];

  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014334;
  v6[3] = &unk_100030BC0;
  v6[4] = self;
  void v6[5] = v7;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  _Block_object_dispose(v7, 8);
}

- (void)sendMultipleMessagesEntryView:(id)a3 composition:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [v8 setComposition:a4];
  dispatch_time_t v10 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014804;
  block[3] = &unk_100030F30;
  void block[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startDetailsTest:(id)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_100007690;
  v7[4] = sub_1000076A0;
  id v8 = 0;
  id v4 = [(SMSApplication *)self messagesController];
  id v8 = [v4 chatController];

  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014BD4;
  v6[3] = &unk_100030BC0;
  v6[4] = self;
  void v6[5] = v7;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  _Block_object_dispose(v7, 8);
}

- (void)_detailsViewScrollingPerfTest:(id)a3
{
  id v11 = a3;
  id v4 = [v11 view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  id v6 = [v11 view];
  id v7 = [(id)qword_10003AE50 objectForKey:@"iterations"];
  id v8 = [v7 intValue];

  uint64_t v9 = __CurrentTestName;
  [v6 frame];
  [v6 _performScrollTest:v9 iterations:v8 delta:(int)(v10 + v10)];
}

- (void)startSendAnimationNewComposeTest:(id)a3
{
  id v4 = objc_alloc((Class)NSAttributedString);
  dispatch_time_t v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"This is a long text" value:&stru_100031290 table:0];
  id v7 = [v4 initWithString:v6];

  id v8 = [objc_alloc((Class)CKComposition) initWithText:v7 subject:0];
  id v9 = [objc_alloc((Class)NSArray) initWithObjects:@"jake.chase.dev1@icloud.com", 0];
  dispatch_time_t v10 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000152F8;
  block[3] = &unk_100030A58;
  void block[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startSendAnimationExistingTest
{
  id v15 = [objc_alloc((Class)NSAttributedString) initWithString:@"This is a long text #longText"];
  id v3 = [objc_alloc((Class)CKComposition) initWithText:v15 subject:0];
  id v4 = +[CKConversationList sharedConversationList];
  dispatch_time_t v5 = [v4 conversationForExistingChatWithChatIdentifier:@"jake.chase.dev1@icloud.com"];

  id v6 = [(SMSApplication *)self messagesController];
  [v6 showConversation:v5 animate:0];

  CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
  id v7 = [(SMSApplication *)self messagesController];
  id v8 = [v7 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    dispatch_time_t v10 = [(SMSApplication *)self messagesController];
    [v10 dismissViewControllerAnimated:0 completion:0];

    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
  }
  id v11 = [(SMSApplication *)self messagesController];
  id v12 = [v11 chatController];

  id v13 = [v12 entryView];
  [(SMSApplication *)self startedTest:__CurrentTestName];
  [v13 setComposition:v3];
  CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
  [v13 touchUpInsideSendButton:0];
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [(SMSApplication *)self finishedTest:__CurrentTestName extraResults:v14];
}

- (void)startScrollTranscriptTest:(id)a3
{
  id v4 = [a3 objectForKey:@"chatIdentifier"];
  dispatch_time_t v5 = +[CKConversationList sharedConversationList];
  id v6 = [v5 conversations];

  id v7 = +[CKConversationList sharedConversationList];
  id v8 = [v7 conversationForExistingChatWithChatIdentifier:v4];

  if ([v6 count]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    dispatch_time_t v10 = [(SMSApplication *)self messagesController];
    id v11 = [v10 currentConversation];

    if (v8 == v11)
    {
      if ([__CurrentTestName rangeOfString:@"WithKeyboard"] != (id)0x7FFFFFFFFFFFFFFFLL) {
        [(SMSApplication *)self showKeyboard];
      }
      [(SMSApplication *)self performSelector:"tapFSMIfNecessary" withObject:0 afterDelay:0.5];
      [(SMSApplication *)self performSelector:"scrollTranscript" withObject:0 afterDelay:1.0];
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v12 = dispatch_time(0, 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100015BAC;
      v13[3] = &unk_100030B70;
      v13[4] = self;
      id v14 = v8;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }
}

- (void)chatRegistryDidLoad:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (qword_10003AE68)
  {
    id v6 = v4;
    id v4 = (id)[(SMSApplication *)self canRunTests];
    id v5 = v6;
    if (v4)
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100030F78);
      id v5 = v6;
    }
  }

  _objc_release_x1(v4, v5);
}

- (BOOL)canRunTests
{
  v2 = +[IMChatRegistry sharedRegistry];
  id v3 = [v2 cachedChats];
  uint64_t v4 = (uint64_t)[v3 count];

  id v5 = [__CurrentTestName rangeOfString:@"MessageSendLatency"];
  id v6 = +[IMChatRegistry sharedRegistry];
  unsigned int v7 = [v6 _isLoading] ^ 1;

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v7;
  }
  return v4 > 50 || v8;
}

- (void)startStaticTranscriptFPSTest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"chatIdentifier"];
  id v6 = +[CKConversationList sharedConversationList];
  unsigned int v7 = [v6 conversations];

  BOOL v8 = +[CKConversationList sharedConversationList];
  BOOL v9 = [v8 conversationForExistingChatWithChatIdentifier:v5];

  dispatch_time_t v10 = [v4 objectForKey:@"runtime"];

  signed int v11 = [v10 intValue];
  if ([v7 count]) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    id v13 = [(SMSApplication *)self messagesController];
    id v14 = [v13 currentConversation];

    if (v9 == v14)
    {
      uint64_t v16 = +[NSNumber numberWithInteger:v11];
      [(SMSApplication *)self performSelector:"startGeneralStaticFPSTestWithDelay:" withObject:v16 afterDelay:1.0];
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v15 = dispatch_time(0, 1000000000);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100015F34;
      v17[3] = &unk_100030B70;
      void v17[4] = self;
      id v18 = v9;
      dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, v17);
    }
  }
}

- (void)startGeneralStaticFPSTestWithDelay:(id)a3
{
  uint64_t v4 = __CurrentTestName;
  id v5 = a3;
  [(SMSApplication *)self startedTest:v4];
  LODWORD(v4) = [v5 intValue];

  dispatch_time_t v6 = dispatch_time(0, 1000000000 * (int)v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016058;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startStaticFSMFPSTest:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"chatIdentifier"];
  id v5 = +[CKConversationList sharedConversationList];
  dispatch_time_t v6 = [v5 conversations];

  unsigned int v7 = +[CKConversationList sharedConversationList];
  BOOL v8 = [v7 conversationForExistingChatWithChatIdentifier:v4];

  if ([v6 count]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    dispatch_time_t v10 = [(SMSApplication *)self messagesController];
    signed int v11 = [v10 currentConversation];

    if (v8 == v11)
    {
      [(SMSApplication *)self performSelector:"startFSMTest" withObject:0 afterDelay:1.0];
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v12 = dispatch_time(0, 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100016220;
      v13[3] = &unk_100030B70;
      v13[4] = self;
      id v14 = v8;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }
}

- (void)startFSMTest
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"fsmDidFinish:" name:CKEffectManagerEffectDidEndForPPT object:0];

  [(SMSApplication *)self tapFSMIfNecessary];
  uint64_t v4 = [(SMSApplication *)self _fsmIdentifierForTestName:__CurrentTestName];
  +[CKFullScreenEffectManager delayBeforeEffectWithIdentifier:v4];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016380;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_fsmIdentifierForTestName:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"Confetti"])
  {
    uint64_t v4 = (id *)&CKFullScreenEffectConfettiIdentifier;
LABEL_19:
    id v5 = *v4;
    goto LABEL_20;
  }
  if ([v3 containsString:@"Heart"])
  {
    uint64_t v4 = (id *)&CKFullScreenEffectLoveIdentifier;
    goto LABEL_19;
  }
  if ([v3 containsString:@"Balloon"])
  {
    uint64_t v4 = (id *)&CKFullScreenEffectHappyBirthdayIdentifier;
    goto LABEL_19;
  }
  if ([v3 containsString:@"Laser"])
  {
    uint64_t v4 = (id *)&CKFullScreenEffectLasersIdentifier;
    goto LABEL_19;
  }
  if ([v3 containsString:@"Fireworks"])
  {
    uint64_t v4 = (id *)&CKFullScreenEffectFireworksIdentifier;
    goto LABEL_19;
  }
  if ([v3 containsString:@"ShootingStar"])
  {
    uint64_t v4 = (id *)&CKFullScreenEffectShootingStarIdentifier;
    goto LABEL_19;
  }
  if ([v3 containsString:@"Sparkles"])
  {
    uint64_t v4 = (id *)&CKFullScreenEffectCelebrationIdentifier;
    goto LABEL_19;
  }
  if ([v3 containsString:@"Echo"])
  {
    uint64_t v4 = (id *)&CKFullScreenEffectEchoIdentifier;
    goto LABEL_19;
  }
  if ([v3 containsString:@"Spotlight"])
  {
    uint64_t v4 = (id *)&CKFullScreenEffectSpotlightIdentifier;
    goto LABEL_19;
  }
  id v5 = 0;
LABEL_20:

  return v5;
}

- (void)fsmDidFinish:(id)a3
{
}

- (void)startInteractiveStickerDragTest:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"runtime"];
  signed int v5 = [v4 intValue];

  id v6 = objc_alloc((Class)CKBrowserDragWindow);
  unsigned int v7 = +[UIScreen mainScreen];
  [v7 bounds];
  id v8 = [v6 initWithFrame:0 allowsRotation:0 allowsStatusBarChanges:0 restrictedToPortraitOrientation:0];

  BOOL v9 = +[UIScreen mainScreen];
  [v9 scale];
  CGFloat v11 = v10;
  v35.width = 100.0;
  v35.height = 100.0;
  UIGraphicsBeginImageContextWithOptions(v35, 1, v11);

  CurrentContext = UIGraphicsGetCurrentContext();
  id v13 = +[UIColor redColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v13 CGColor]);

  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = 100.0;
  v36.size.height = 100.0;
  CGContextFillRect(CurrentContext, v36);
  id v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v15 = objc_alloc((Class)CKAnimatedImage);
  v34 = v14;
  uint64_t v16 = +[NSArray arrayWithObjects:&v34 count:1];
  id v17 = [v15 initWithImages:v16 durations:&off_100034E68];

  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = 100.0;
  v37.size.height = 100.0;
  double MidX = CGRectGetMidX(v37);
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = 100.0;
  v38.size.height = 100.0;
  double MidY = CGRectGetMidY(v38);
  id v20 = [objc_alloc((Class)CKBrowserDragViewController) initWithDragImage:v17 inSourceRect:0 withSourcePoint:0 keyboardSourceRect:0 keyboardSourcePoint:100.0 MidX, MidY withGestureRecognizer:0, 0x4059000000000000, 0x4059000000000000, *(void *)&MidX, *(void *)&MidY];
  [v8 setHidden:0];
  id v21 = [v8 rootViewController];
  [v21 presentViewController:v20 animated:0 completion:0];
  id v22 = (void *)qword_10003AE90;
  qword_10003AE90 = (uint64_t)v20;
  id v23 = v20;

  *(double *)&xmmword_10003AEA0 = MidX;
  *((double *)&xmmword_10003AEA0 + 1) = MidY;
  id v24 = +[UIScreen mainScreen];
  uint64_t v25 = [v24 displayLinkWithTarget:self selector:"_stickerDragFired:"];

  id v26 = +[NSRunLoop currentRunLoop];
  [v25 addToRunLoop:v26 forMode:NSRunLoopCommonModes];

  [v23 manuallyInitializeDragAtPoint:MidX, MidY];
  [(SMSApplication *)self startedTest:__CurrentTestName];
  dispatch_time_t v27 = dispatch_time(0, 1000000000 * v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000168CC;
  block[3] = &unk_100030A58;
  id v31 = v25;
  id v32 = v8;
  uint64_t v33 = self;
  id v28 = v8;
  id v29 = v25;
  dispatch_after(v27, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_stickerDragFired:(id)a3
{
  __asm { FMOV            V1.2D, #2.0 }
  xmmword_10003AEA0 = (__int128)vaddq_f64((float64x2_t)xmmword_10003AEA0, _Q1);
}

- (void)startRotationTest:(id)a3
{
  [(SMSApplication *)self startedTest:__CurrentTestName];
  --dword_10003AE60;
  id v3 = (void *)UIApp;

  [v3 rotateIfNeeded:3];
}

- (void)startRotationTestWithTranscript:(id)a3
{
  uint64_t v4 = +[CKConversationList sharedConversationList];
  signed int v5 = [v4 conversations];

  id v6 = +[CKConversationList sharedConversationList];
  unsigned int v7 = [v6 conversationForExistingChatWithChatIdentifier:@"madrid64@apple.com"];

  if ([v5 count]) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    BOOL v9 = [(SMSApplication *)self messagesController];
    double v10 = [v9 currentConversation];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100016BD4;
    v17[3] = &unk_100030A30;
    void v17[4] = self;
    CGFloat v11 = objc_retainBlock(v17);
    dispatch_time_t v12 = v11;
    if (v7 == v10)
    {
      ((void (*)(void *))v11[2])(v11);
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v13 = dispatch_time(0, 1000000000);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100016C7C;
      v14[3] = &unk_100030F30;
      void v14[4] = self;
      id v15 = v7;
      id v16 = v12;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);
    }
  }
}

- (void)_chatControllerWillRotate:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 10000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016DE4;
  block[3] = &unk_100030A30;
  void block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_chatControllerDidRotate:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:kPPTChatControllerWillRotateNotification object:0];
  [v4 removeObserver:self name:kPPTChatControllerDidRotateNotification object:0];
  [(SMSApplication *)self finishedTest:__CurrentTestName];
}

- (void)startAudioWaveformFPSTest
{
  id v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 conversations];

  signed int v5 = +[CKConversationList sharedConversationList];
  id v6 = [v5 conversationForExistingChatWithChatIdentifier:@"madrid64@apple.com"];

  if ([v4 count]) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    BOOL v8 = [(SMSApplication *)self messagesController];
    BOOL v9 = [v8 currentConversation];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100017084;
    v16[3] = &unk_100030A30;
    v16[4] = self;
    double v10 = objc_retainBlock(v16);
    CGFloat v11 = v10;
    if (v6 == v9)
    {
      ((void (*)(void *))v10[2])(v10);
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v12 = dispatch_time(0, 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100017200;
      v13[3] = &unk_100030F30;
      v13[4] = self;
      id v14 = v6;
      id v15 = v11;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }
}

- (void)startInvisibleInkStaticFPSTest
{
  id v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 conversations];

  signed int v5 = +[CKConversationList sharedConversationList];
  id v6 = [v5 conversationForExistingChatWithChatIdentifier:@"chatF4855F71-ABE9-45C6-93CF-647E4D741734"];

  if ([v4 count]) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    BOOL v8 = [(SMSApplication *)self messagesController];
    BOOL v9 = [v8 currentConversation];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000174CC;
    v16[3] = &unk_100030A30;
    v16[4] = self;
    double v10 = objc_retainBlock(v16);
    CGFloat v11 = v10;
    if (v6 == v9)
    {
      ((void (*)(void *))v10[2])(v10);
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v12 = dispatch_time(0, 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100017590;
      v13[3] = &unk_100030F30;
      v13[4] = self;
      id v14 = v6;
      id v15 = v11;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }
}

- (void)startGifPlaybackStaticFPSTest
{
  id v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 conversations];

  signed int v5 = +[CKConversationList sharedConversationList];
  id v6 = [v5 conversationForExistingChatWithChatIdentifier:@"eugene@bistolas.info"];

  if ([v4 count]) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    BOOL v8 = [(SMSApplication *)self messagesController];
    BOOL v9 = [v8 currentConversation];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001785C;
    v16[3] = &unk_100030A30;
    v16[4] = self;
    double v10 = objc_retainBlock(v16);
    CGFloat v11 = v10;
    if (v6 == v9)
    {
      ((void (*)(void *))v10[2])(v10);
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v12 = dispatch_time(0, 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100017920;
      v13[3] = &unk_100030F30;
      v13[4] = self;
      id v14 = v6;
      id v15 = v11;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }
}

- (void)startKeyboardPresentationTest:(id)a3
{
  id v4 = +[CKConversationList sharedConversationList];
  signed int v5 = [v4 conversations];

  id v6 = +[CKConversationList sharedConversationList];
  BOOL v7 = [v6 conversationForExistingChatWithChatIdentifier:@"+14088969566"];

  if ([v5 count]) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    BOOL v9 = [(SMSApplication *)self messagesController];
    double v10 = [v9 currentConversation];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100017C28;
    v18[3] = &unk_100030A30;
    void v18[4] = self;
    CGFloat v11 = objc_retainBlock(v18);
    dispatch_time_t v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
    dispatch_time_t v13 = [v12 preferencesActions];
    [v13 setPredictionEnabled:0];

    if (v7 == v10)
    {
      ((void (*)(void *))v11[2])(v11);
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v14 = dispatch_time(0, 2000000000);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100017CC4;
      v15[3] = &unk_100030F30;
      v15[4] = self;
      id v16 = v7;
      id v17 = v11;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v15);
    }
  }
}

- (void)startKeyboardResponsivenessTest:(id)a3
{
  id v4 = +[CKConversationList sharedConversationList];
  signed int v5 = [v4 conversations];

  id v6 = +[CKConversationList sharedConversationList];
  BOOL v7 = [v6 conversationForExistingChatWithChatIdentifier:@"+14088969566"];

  if ([v5 count]) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    BOOL v9 = [(SMSApplication *)self messagesController];
    double v10 = [v9 currentConversation];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100017FC8;
    v18[3] = &unk_100030A30;
    void v18[4] = self;
    CGFloat v11 = objc_retainBlock(v18);
    dispatch_time_t v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
    dispatch_time_t v13 = [v12 preferencesActions];
    [v13 setPredictionEnabled:0];

    if (v7 == v10)
    {
      ((void (*)(void *))v11[2])(v11);
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v14 = dispatch_time(0, 2000000000);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100018054;
      v15[3] = &unk_100030F30;
      v15[4] = self;
      id v16 = v7;
      id v17 = v11;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v15);
    }
  }
}

- (void)_keyboardWillShow:(id)a3
{
  if ([__CurrentTestName isEqualToString:@"PresentKeyboardTest"])
  {
    uint64_t v4 = __CurrentTestName;
    [(SMSApplication *)self startedTest:v4];
  }
}

- (void)_keyboardDidShow:(id)a3
{
  byte_10003AE70 = 1;
  if (([__CurrentTestName isEqualToString:@"PresentKeyboardTest"] & 1) != 0
    || ([__CurrentTestName isEqualToString:@"PresentKeyboardResponsivenessTest"] & 1) != 0
    || byte_10003AE71 == 1
    && [__CurrentTestName rangeOfString:kShowNewComposeTest] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = __CurrentTestName;
    [(SMSApplication *)self finishedTest:v4];
  }
}

- (void)startQuicklookPresentationTest:(id)a3
{
  uint64_t v4 = +[CKConversationList sharedConversationList];
  signed int v5 = [v4 conversations];

  id v6 = +[CKConversationList sharedConversationList];
  BOOL v7 = [v6 conversationForExistingChatWithChatIdentifier:@"+14088383543"];

  if ([v5 count]) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
  else
  {
    BOOL v9 = [(SMSApplication *)self messagesController];
    double v10 = [v9 currentConversation];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100018430;
    v17[3] = &unk_100030A30;
    void v17[4] = self;
    CGFloat v11 = objc_retainBlock(v17);
    dispatch_time_t v12 = v11;
    if (v7 == v10)
    {
      ((void (*)(void *))v11[2])(v11);
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v13 = dispatch_time(0, 1000000000);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000186EC;
      v14[3] = &unk_100030F30;
      void v14[4] = self;
      id v15 = v7;
      id v16 = v12;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);
    }
  }
}

- (void)startAudioBalloonPlaybackTest:(id)a3
{
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_audioBalloonPlaybackWillStart:" name:kAudioBalloonViewPlaybackWillStartNotification object:0];

  signed int v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_audioBalloonPlaybackDidFinish:" name:kAudioBalloonViewPlaybackDidFinishNotification object:0];

  id v6 = +[CKConversationList sharedConversationList];
  BOOL v7 = [v6 conversationForExistingChatWithChatIdentifier:@"jake.chase.dev2@icloud.com"];

  if (v7)
  {
    BOOL v8 = [(SMSApplication *)self messagesController];
    [v8 showConversation:v7 animate:0];

    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
    BOOL v9 = [(SMSApplication *)self messagesController];
    double v10 = [v9 chatController];

    CGFloat v11 = [v10 collectionViewController];
    [v11 __setCurrentTestName:__CurrentTestName];
    dispatch_time_t v12 = [v10 collectionView];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    dispatch_time_t v13 = [v12 visibleCells];
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      id v21 = v11;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v17;
            long long v19 = [v18 balloonView];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              id v14 = [v18 balloonView];

              goto LABEL_15;
            }
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14) {
          continue;
        }
        break;
      }
LABEL_15:
      CGFloat v11 = v21;
    }

    [v11 balloonViewTapped:v14 withModifierFlags:0 selectedText:0];
  }
  else
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
}

- (void)_audioBalloonPlaybackWillStart:(id)a3
{
}

- (void)_audioBalloonPlaybackDidFinish:(id)a3
{
}

- (void)startScrollConversationsTest:(id)a3
{
  id v4 = a3;
  signed int v5 = [(SMSApplication *)self messagesController];
  id v6 = [v5 chatController];

  [v6 _backbuttonPressed];
  dispatch_time_t v7 = dispatch_time(0, 6000000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018BBC;
  v9[3] = &unk_100030B70;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)clearEntryView
{
  id v3 = [(SMSApplication *)self messagesController];
  id v5 = [v3 chatController];

  id v4 = [v5 entryView];
  [v4 setComposition:0];

  [(SMSApplication *)self showTranscriptListNotAnimated];
}

- (void)startScrollForCollectionView:(id)a3
{
  id v3 = (void *)qword_10003AE50;
  id v7 = a3;
  id v4 = [v3 objectForKey:@"offset"];
  unsigned int v5 = [v4 intValue];

  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 18;
  }
  [v7 _performScrollTest:__CurrentTestName iterations:dword_10003AE60 delta:v6 scrollAxis:1];
}

- (void)scrollPhotoPickerTestWithOptions:(id)a3
{
  id v4 = a3;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_1000190E0;
  v21[3] = &unk_100030A30;
  void v21[4] = self;
  unsigned int v5 = objc_retainBlock(v21);
  uint64_t v6 = +[CKConversationList sharedConversationList];
  id v7 = [v6 conversations];

  if ([v7 count])
  {
    id v8 = +[CKConversationList sharedConversationList];
    BOOL v9 = [v8 conversationForExistingChatWithChatIdentifier:@"madrid64@apple.com"];

    id v10 = [(SMSApplication *)self messagesController];
    CGFloat v11 = [v10 currentConversation];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001912C;
    v18[3] = &unk_100030FC8;
    void v18[4] = self;
    id v20 = v5;
    id v19 = v4;
    dispatch_time_t v12 = objc_retainBlock(v18);
    dispatch_time_t v13 = v12;
    if (v9 == v11)
    {
      ((void (*)(void *))v12[2])(v12);
    }
    else
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001941C;
      block[3] = &unk_100030F30;
      void block[4] = self;
      id v16 = v9;
      id v17 = v13;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    ((void (*)(void *))v5[2])(v5);
  }
}

- (void)startExtensionTest:(id)a3 launch:(BOOL)a4
{
  id v6 = a3;
  [v6 objectForKey:@"chatIdentifier"];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000195B8;
  v9[3] = &unk_100031018;
  BOOL v13 = a4;
  id v10 = v6;
  CGFloat v11 = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v12;
  id v8 = v6;
  [(SMSApplication *)self showConversationForChatIdentifier:v7 forceReload:1 options:v8 completion:v9];
}

- (void)startPriorityBoostingTestWithOptions:(id)a3
{
  [(SMSApplication *)self startedTest:__CurrentTestName];
  id v5 = __CurrentTestName;
  id v4 = +[IMDaemonController sharedInstance];
  [v4 blockUntilConnected];

  [(SMSApplication *)self finishedTest:v5];
}

- (void)startMarkAsReadLocallyTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(id)qword_10003AE50 objectForKey:@"chatIdentifier"];
  id v6 = (void *)IMCopyGUIDForChat();
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "mark as unread locally start", (uint8_t *)&v13, 2u);
    }
  }
  id v8 = +[IMChatRegistry sharedRegistry];
  BOOL v9 = [v8 existingChatWithGUID:v6];

  if (v9)
  {
    [v9 _automation_markAsRead:0 messageGUID:0 forChatGUID:v6 fromMe:0];
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "mark as unread locally finished", (uint8_t *)&v13, 2u);
      }
    }
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [v9 _automation_markAsRead:1 messageGUID:0 forChatGUID:v6 fromMe:0];
    if (IMOSLoggingEnabled())
    {
      CGFloat v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "mark as read locally finished", (uint8_t *)&v13, 2u);
      }
    }
    [(SMSApplication *)self finishedTest:__CurrentTestName];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        dispatch_time_t v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Failed to find chat: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    [(SMSApplication *)self startAndFailTestNamed:__CurrentTestName withFailure:@"Failed to find chat"];
  }
}

- (void)startMarkAsReadReceivedTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(id)qword_10003AE50 objectForKey:@"chatIdentifier"];
  id v6 = (void *)IMCopyGUIDForChat();
  id v7 = [(id)qword_10003AE50 objectForKey:@"sentGUID"];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "mark as unread received start", (uint8_t *)&v15, 2u);
    }
  }
  BOOL v9 = +[IMChatRegistry sharedRegistry];
  id v10 = [v9 existingChatWithGUID:v6];

  if (v10)
  {
    [v10 _automation_markAsRead:0 messageGUID:0 forChatGUID:v6 fromMe:1];
    if (IMOSLoggingEnabled())
    {
      CGFloat v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "mark as unread received finished", (uint8_t *)&v15, 2u);
      }
    }
    [(SMSApplication *)self startedTest:__CurrentTestName];
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "mark as read received start", (uint8_t *)&v15, 2u);
      }
    }
    [v10 _automation_markAsRead:1 messageGUID:v7 forChatGUID:v6 fromMe:1];
    if (IMOSLoggingEnabled())
    {
      int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "mark as read received finished", (uint8_t *)&v15, 2u);
      }
    }
    [(SMSApplication *)self finishedTest:__CurrentTestName];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      dispatch_time_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Failed to find chat: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    [(SMSApplication *)self startAndFailTestNamed:__CurrentTestName withFailure:@"Failed to find chat"];
  }
}

- (void)showMessagesApplicationAndStartTestForIdentifier:(id)a3 supportsLaunchSubtest:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  id v6 = [(SMSApplication *)self messagesController];
  id v7 = [v6 chatController];
  id v8 = [v7 inputController];

  BOOL v9 = +[IMBalloonPluginManager sharedInstance];
  id v10 = [v9 balloonPluginForBundleID:v21];

  if (v10)
  {
    if ([__CurrentTestName rangeOfString:@"ExtensionLaunch"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(SMSApplication *)self startedTest:__CurrentTestName];
      if (v4) {
        [(SMSApplication *)self startedSubTest:@"PluginLaunchSubtest" forTest:__CurrentTestName];
      }
    }
LABEL_13:
    if ([v21 isEqualToString:IMBalloonPluginIdentifierDT])
    {
      [v8 showDTCompose];
    }
    else if ([v21 isEqualToString:IMBalloonPluginIdentifierPhotos])
    {
      [v8 showPhotosBrowser];
    }
    else if ([v21 isEqualToString:IMBalloonPluginIdentifierHandwriting])
    {
      [v8 showHandwritingBrowser];
    }
    else
    {
      [v8 showBrowserForPlugin:v10 dataSource:0 style:1];
    }

    goto LABEL_22;
  }
  CGFloat v11 = [v21 substringFromIndex:[v21 rangeOfString:@"."] + 1];
  id v12 = +[NSString stringWithFormat:@"%@-%@", v11, @"ExtensionLaunch"];
  if ([__CurrentTestName isEqualToString:v12])
  {
    if (qword_10003AED0 != -1) {
      dispatch_once(&qword_10003AED0, &stru_1000310C0);
    }
    int v13 = [ (id) qword_10003AEC8 pluginKitProxyForIdentifier:v21];
    dispatch_time_t v14 = [v13 containingBundle];
    uint64_t v15 = [v14 teamID];
    id v16 = (void *)v15;
    id v17 = @"0000000000";
    if (v15) {
      id v17 = (__CFString *)v15;
    }
    id v18 = v17;

    id v19 = +[NSString stringWithFormat:@"%@:%@:%@", IMBalloonPluginIdentifierMessageExtension, v18, v21];

    id v20 = +[IMBalloonPluginManager sharedInstance];
    id v10 = [v20 balloonPluginForBundleID:v19];

    if (v10)
    {
      if ([__CurrentTestName rangeOfString:@"ExtensionLaunch"] != (id)0x7FFFFFFFFFFFFFFFLL) {
        [(SMSApplication *)self startedIPTest:__CurrentTestName];
      }
      goto LABEL_13;
    }
    [(SMSApplication *)self startAndFailTestNamed:__CurrentTestName, @"Plugin not found for identifier %@", v21 withFailure];
  }
  else
  {
    [(SMSApplication *)self startAndFailTestNamed:__CurrentTestName withFailure:v12];
  }
LABEL_22:
}

- (void)didChangeOrientation:(id)a3
{
  if ([__CurrentTestName rangeOfString:kShowMessagesTest] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ([__CurrentTestName rangeOfString:@"ScrollConversations"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([__CurrentTestName rangeOfString:@"ScrollTranscript"] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([__CurrentTestName isEqualToString:@"Rotation"])
        {
          int v4 = dword_10003AE60;
          id v5 = [(id)qword_10003AE50 objectForKey:@"iterations"];
          unsigned int v6 = [v5 intValue] + 1;

          if (v4 == v6) {
            [(SMSApplication *)self startRotationTest:qword_10003AE50];
          }
        }
        else
        {
          if (![__CurrentTestName isEqualToString:@"RotateTranscript"]) {
            return;
          }
          int v10 = dword_10003AE60;
          CGFloat v11 = [(id)qword_10003AE50 objectForKey:@"iterations"];
          unsigned int v12 = [v11 intValue] + 1;

          if (v10 == v12) {
            [(SMSApplication *)self startRotationTestWithTranscript:qword_10003AE50];
          }
        }
        if (dword_10003AE60 < 1)
        {
          uint64_t v13 = __CurrentTestName;
          [(SMSApplication *)self finishedTest:v13 extraResults:0];
        }
        else
        {
          --dword_10003AE60;
          if (([UIApp rotateIfNeeded:1] & 1) == 0)
          {
            dispatch_time_t v14 = (void *)UIApp;
            [v14 rotateIfNeeded:3];
          }
        }
      }
      else
      {
        uint64_t v9 = qword_10003AE50;
        [(SMSApplication *)self startScrollTranscriptTest:v9];
      }
    }
    else
    {
      uint64_t v8 = qword_10003AE50;
      [(SMSApplication *)self startScrollConversationsTest:v8];
    }
  }
  else
  {
    uint64_t v7 = qword_10003AE50;
    [(SMSApplication *)self startShowMessagesTest:v7];
  }
}

- (void)startLiveBubbleLoadingTest:(id)a3
{
  int v4 = [(id)qword_10003AE50 objectForKey:@"chatIdentifier"];
  id v5 = +[CKConversationList sharedConversationList];
  unsigned int v6 = [v5 conversationForExistingChatWithChatIdentifier:v4];

  if (v6)
  {
    [(SMSApplication *)self showTranscriptListNotAnimated];
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001A558;
    v8[3] = &unk_100030B70;
    void v8[4] = self;
    id v9 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);
  }
  else
  {
    [(SMSApplication *)self startedTest:__CurrentTestName];
    [(SMSApplication *)self failedTest:__CurrentTestName];
  }
}

- (void)startResizeTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(id)qword_10003AE50 objectForKey:@"recapBased"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    dispatch_time_t v7 = [(SMSApplication *)self sceneController];
    uint64_t v8 = [v7 messagesSceneDelegate];
    id v9 = [v8 window];

    if (([v9 isKeyWindow] & 1) == 0) {
      [(SMSApplication *)self startAndFailTestNamed:__CurrentTestName withFailure:@"The MessagesSceneDelegate's window isn't key for some reason"];
    }
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2050000000;
    int v10 = (void *)qword_10003AED8;
    uint64_t v18 = qword_10003AED8;
    if (!qword_10003AED8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10001B22C;
      v14[3] = &unk_100031068;
      void v14[4] = &v15;
      sub_10001B22C((uint64_t)v14);
      int v10 = (void *)v16[3];
    }
    CGFloat v11 = v10;
    _Block_object_dispose(&v15, 8);
    id v12 = [v11 alloc];
    id v13 = [v12 initWithTestName:__CurrentTestName window:v9 completionHandler:0];
    [v13 setMinimumWindowSize:300.0, 300.0];
    [v13 setMaximumWindowSize:600.0, 600.0];
    [sub_100006750() runTestWithParameters:v13];
  }
}

- (void)_willConfigureCellWithTranscriptPluginChatItem:(id)a3
{
  uint64_t v3 = CKPluginChatItemPPTName;
  if ([__CurrentTestName isEqualToString:CKPluginChatItemPPTName])
  {
    id v4 = +[UIApplication sharedApplication];
    [v4 startedTest:v3];
  }
}

- (void)startPPTSubtestForCurrentTest:(id)a3
{
  if (a3)
  {
    uint64_t v3 = __CurrentTestName;
    if (__CurrentTestName)
    {
      id v5 = a3;
      id v6 = +[NSArray arrayWithObject:@"time"];
      [(SMSApplication *)self startedSubTest:v5 forTest:v3 withMetrics:v6];
    }
  }
}

- (void)stopPPTSubtestForCurrentTest:(id)a3
{
  if (a3)
  {
    if (__CurrentTestName) {
      -[SMSApplication finishedSubTest:forTest:](self, "finishedSubTest:forTest:");
    }
  }
}

- (void)installNotificationObserverForNotificationName:(id)a3 notificationName:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = +[NSOperationQueue mainQueue];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = sub_100007690;
  id v26 = sub_1000076A0;
  id v27 = 0;
  id location = 0;
  objc_initWeak(&location, v9);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001ABB4;
  v16[3] = &unk_100031040;
  uint64_t v18 = &v22;
  BOOL v20 = a5;
  objc_copyWeak(&v19, &location);
  id v13 = v11;
  id v17 = v13;
  uint64_t v14 = [v9 addObserverForName:v10 object:0 queue:v12 usingBlock:v16];
  uint64_t v15 = (void *)v23[5];
  v23[5] = v14;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);
}

- (void)showConversationForChatIdentifier:(id)a3 forceReload:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  id v9 = (void (**)(id, void))a6;
  id v10 = a3;
  id v11 = +[CKConversationList sharedConversationList];
  id v12 = [v11 conversations];

  id v13 = +[CKConversationList sharedConversationList];
  uint64_t v14 = [v13 conversationForExistingChatWithChatIdentifier:v10];

  if ([v12 count]) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    v9[2](v9, 0);
  }
  else
  {
    id v16 = [(SMSApplication *)self messagesController];
    id v17 = [v16 currentConversation];

    if (a4 || v14 != v17)
    {
      [(SMSApplication *)self showTranscriptListNotAnimated];
      dispatch_time_t v18 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001AE1C;
      block[3] = &unk_100030F30;
      void block[4] = self;
      id v20 = v14;
      id v21 = v9;
      dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v9[2](v9, 1);
    }
  }
}

- (void)startAndFailTestNamed:(id)a3 withFailure:(id)a4
{
  uint64_t v5 = __CurrentTestName;
  id v6 = a4;
  [(SMSApplication *)self startedTest:v5];
  uint64_t v7 = __CurrentTestName;
  id v8 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:&v9];

  [(SMSApplication *)self failedTest:v7 withFailure:v8];
}

- (void)_clearFailureBadge
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"__kMessagesBadgeControllerClearFailureBadgeNotification", 0, 0, 1u);
}

- (void)keyCommandCompose:(id)a3
{
  uint64_t v3 = +[CKDraftManager sharedInstance];
  [v3 setDraftForPendingConversation:0 withRecipients:0];

  id v4 = +[CKDraftManager sharedInstance];
  [v4 saveCompositionAndFlushCache:0];

  +[NSURL URLWithString:@"sms://open?addresses="];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [UIApp openURL:v5 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(IMDaemonMultiplexedConnectionManaging *)self->_daemonConnection invalidate];
  [(BKSProcessAssertion *)self->_backgroundAssertion setInvalidationHandler:0];
  [(BKSProcessAssertion *)self->_backgroundAssertion invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SMSApplication;
  [(SMSApplication *)&v4 dealloc];
}

- (void)_handleUnitTestInvocation:(id)a3
{
  id v4 = a3;
  [(SMSApplication *)self setRunningViaTestRunner:1];
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F178;
  v7[3] = &unk_100030B70;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)setPendingAppleEventInfoDictionary:(id)a3
{
}

- (void)setPendingLaunchEventContext:(id)a3
{
}

- (BKSProcessAssertion)backgroundAssertion
{
  return self->_backgroundAssertion;
}

- (void)setBackgroundAssertion:(id)a3
{
}

- (void)setRunningViaTestRunner:(BOOL)a3
{
  self->_runningViaTestRunner = a3;
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
}

- (SMSApplicationPerformSearchProtocol)testPerformSearchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testPerformSearchDelegate);

  return (SMSApplicationPerformSearchProtocol *)WeakRetained;
}

- (void)setTestPerformSearchDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testPerformSearchDelegate);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_backgroundAssertion, 0);
  objc_storeStrong((id *)&self->_pendingLaunchEventContext, 0);

  objc_storeStrong((id *)&self->_pendingAppleEventInfoDictionary, 0);
}

@end