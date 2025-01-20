@interface RTTUIConversationViewController
+ (BOOL)_validRectangle:(CGRect)a3;
+ (id)viewControllerForCall:(id)a3;
+ (id)viewControllerForConversation:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)currentCallIsDowngraded;
- (BOOL)isCurrentCallConnected;
- (BOOL)isCurrentCallOnHold;
- (BOOL)isCurrentCallReceivingOnHold;
- (BOOL)isCurrentCallSendingOnHold;
- (BOOL)isIncomingScreeningCall;
- (BOOL)showTextViewForCurrentCall;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)utteranceIsSelected;
- (DDParsecCollectionViewController)lookupController;
- (RTTConversation)conversation;
- (RTTUIConversationViewController)init;
- (RTTUtterance)currentUtterance;
- (TUCall)call;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_updateTableViewUtteranceOldCount:(unint64_t)a3 newCount:(unint64_t)a4;
- (id)addTranscriptionText:(id)a3 isNew:(BOOL)a4;
- (id)addUtterance:(id)a3;
- (id)cannedResponses;
- (id)contactDisplayString;
- (id)currentContactPath;
- (id)inputTextView;
- (id)lastConversationRowPathForUtterance:(id)a3;
- (id)rttConversationAvailabilityCallback;
- (id)serviceUpdateCellAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)textViewUtterance;
- (id)utteranceCellAtIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addServiceCellWithUpdate:(id)a3 options:(id)a4;
- (void)_define:(id)a3;
- (void)_processRealtimeTimeout;
- (void)_removeServiceCellWithUpdate:(id)a3;
- (void)_replaceServiceCellWithOldUpdate:(id)a3 withNewUpdate:(id)a4 options:(id)a5;
- (void)_scrollToIndexPathIfNecessary:(id)a3 animated:(BOOL)a4;
- (void)_updateBarButtonState;
- (void)_updateTableViewRowAtIndexPath:(id)a3 action:(int64_t)a4 animation:(int64_t)a5;
- (void)_updateTableViewRowsAtIndexPaths:(id)a3 action:(int64_t)a4 animation:(int64_t)a5;
- (void)addServiceCellWithUpdate:(id)a3 options:(id)a4;
- (void)callDidConnect:(id)a3;
- (void)dealloc;
- (void)deviceDidReceiveString:(id)a3 forUtterance:(id)a4;
- (void)gaButtonPressed:(id)a3;
- (void)isCurrentCallReceivingOnHold;
- (void)logCallHold:(BOOL)a3;
- (void)realtimeTextDidChange;
- (void)removeServiceCellWithUpdate:(id)a3;
- (void)replaceServiceCellWithOldUpdate:(id)a3 withNewUpdate:(id)a4 options:(id)a5;
- (void)setCall:(id)a3;
- (void)setConversation:(id)a3;
- (void)setCurrentUtterance:(id)a3;
- (void)setLookupController:(id)a3;
- (void)setRttConversationAvailabilityCallback:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTextViewUtterance:(id)a3;
- (void)setupTableView;
- (void)shareCallInfo:(id)a3;
- (void)showCallEnded;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)toggleHold:(id)a3;
- (void)toggleMute:(id)a3;
- (void)updateBarButtons;
- (void)updateCallDowngradeStatus;
- (void)updateCallHold:(id)a3;
- (void)updateDeviceLockStatus:(BOOL)a3;
- (void)updateGAButton;
- (void)updateInputEnabled;
- (void)updateTableViewSizeAnimated:(BOOL)a3;
- (void)updateUtterance:(id)a3 forIndexPath:(id)a4;
- (void)updateViewForKeyboard:(id)a3;
- (void)updateVoiceOverAnnouncement:(id)a3;
- (void)utteranceCellDidUpdateContent:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RTTUIConversationViewController

+ (id)viewControllerForCall:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(RTTUIConversationViewController);
  v5 = +[RTTUIConversationControllerCoordinator sharedInstance];
  [v5 addConversationController:v4];

  [(RTTUIConversationViewController *)v4 setCall:v3];
  return v4;
}

+ (id)viewControllerForConversation:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(RTTUIConversationViewController);
  [(RTTUIConversationViewController *)v4 setConversation:v3];
  v5 = +[RTTUIConversationControllerCoordinator sharedInstance];
  [v5 addConversationController:v4];

  if (_AXSInUnitTestMode())
  {
    uint64_t v6 = [v3 call];
    call = v4->_call;
    v4->_call = (TUCall *)v6;
  }
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (RTTUIConversationViewController)init
{
  v23.receiver = self;
  v23.super_class = (Class)RTTUIConversationViewController;
  v2 = [(RTTUIConversationViewController *)&v23 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_callDidConnect_ name:*MEMORY[0x263F7E310] object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_callDidConnect_ name:*MEMORY[0x263F7E380] object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_callDidConnect_ name:*MEMORY[0x263F7E338] object:0];

    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_updateCallHold_ name:*MEMORY[0x263F7E358] object:0];

    id v7 = objc_alloc(MEMORY[0x263F21398]);
    v8 = (void *)MEMORY[0x263EF83A0];
    uint64_t v9 = [v7 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    realTimeTimeout = v2->_realTimeTimeout;
    v2->_realTimeTimeout = (AXDispatchTimer *)v9;

    [(AXDispatchTimer *)v2->_realTimeTimeout setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    uint64_t v11 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v8];
    muteStatusTimeout = v2->_muteStatusTimeout;
    v2->_muteStatusTimeout = (AXDispatchTimer *)v11;

    [(AXDispatchTimer *)v2->_muteStatusTimeout setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    objc_initWeak(&location, v2);
    v13 = [MEMORY[0x263F62AF8] sharedInstance];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __39__RTTUIConversationViewController_init__block_invoke;
    v20[3] = &unk_264638720;
    objc_copyWeak(&v21, &location);
    [v13 registerUpdateBlock:v20 forRetrieveSelector:sel_ttyShouldBeRealtime withListener:v2];

    uint64_t v14 = objc_opt_new();
    serviceUpdates = v2->_serviceUpdates;
    v2->_serviceUpdates = (NSMutableArray *)v14;

    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __39__RTTUIConversationViewController_init__block_invoke_2;
    handler[3] = &unk_264638748;
    objc_copyWeak(&v19, &location);
    notify_register_dispatch("com.apple.springboard.passcodeLockedOrBlocked", &v2->_lockStateNotifyToken, MEMORY[0x263EF83A0], handler);

    objc_copyWeak(&v17, &location);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __39__RTTUIConversationViewController_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateGAButton];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setTextViewUtterance:&stru_26D51E848];
}

void __39__RTTUIConversationViewController_init__block_invoke_2(uint64_t a1, int token)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  uint64_t v3 = state64;
  v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v8 = v3 != 0;
    _os_log_impl(&dword_222978000, v4, OS_LOG_TYPE_INFO, "Device lock state changed: %d", buf, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateDeviceLockStatus:v3 != 0];
}

void __39__RTTUIConversationViewController_init__block_invoke_306(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int out_token = 0;
  notify_register_check("com.apple.springboard.passcodeLockedOrBlocked", &out_token);
  uint64_t v5 = 0;
  notify_get_state(out_token, &v5);
  uint64_t v2 = v5;
  uint64_t v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v8 = v2 != 0;
    _os_log_impl(&dword_222978000, v3, OS_LOG_TYPE_INFO, "Initial device lock state: %d", buf, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateDeviceLockStatus:v2 != 0];
}

- (id)inputTextView
{
  return self->_textView;
}

- (void)setCall:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!self->_conversation)
  {
    uint64_t v6 = AXLogRTT();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_222978000, v6, OS_LOG_TYPE_INFO, "%@: No initial conversation, requesting conversation: %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    id v7 = (void *)MEMORY[0x263F62AD8];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__RTTUIConversationViewController_setCall___block_invoke;
    v15[3] = &unk_264638798;
    objc_copyWeak(&v16, (id *)buf);
    [v7 conversationWithCall:v5 withCallback:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  objc_storeStrong((id *)&self->_call, a3);
  int v8 = [v5 supportsTTYWithVoice];
  asciiSubstitutions = self->_asciiSubstitutions;
  if (v8)
  {
    self->_asciiSubstitutions = (NSDictionary *)&unk_26D522818;

    v10 = [MEMORY[0x263F089C0] characterSetWithCharactersInString:@"\n"];
    unsupportedCharacterSet = self->_unsupportedCharacterSet;
    self->_unsupportedCharacterSet = v10;
  }
  else
  {
    self->_asciiSubstitutions = (NSDictionary *)&unk_26D522840;

    objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 32, 95);
    v12 = (NSMutableCharacterSet *)objc_claimAutoreleasedReturnValue();
    v13 = self->_unsupportedCharacterSet;
    self->_unsupportedCharacterSet = v12;

    [(NSMutableCharacterSet *)self->_unsupportedCharacterSet invert];
  }
  [(RTTUIConversationViewController *)self updateBarButtons];
  uint64_t v14 = [MEMORY[0x263F62AE8] sharedInstance];
  objc_msgSend(v14, "setShouldSuppressIncomingNotification:", -[RTTUIConversationViewController isCurrentCallConnected](self, "isCurrentCallConnected"));
}

void __43__RTTUIConversationViewController_setCall___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  AXPerformBlockOnMainThreadAfterDelay();

  objc_destroyWeak(&v5);
}

void __43__RTTUIConversationViewController_setCall___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setConversation:v2];

  id v5 = objc_loadWeakRetained(v3);
  uint64_t v6 = [v5 tableView];
  [v6 reloadData];

  id v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v13 = 138412290;
    uint64_t v14 = v8;
    _os_log_impl(&dword_222978000, v7, OS_LOG_TYPE_INFO, "Received conversation: %@", (uint8_t *)&v13, 0xCu);
  }

  id v9 = objc_loadWeakRetained(v3);
  v10 = [v9 rttConversationAvailabilityCallback];

  if (v10)
  {
    id v11 = objc_loadWeakRetained(v3);
    v12 = [v11 rttConversationAvailabilityCallback];
    v12[2](v12, *(void *)(a1 + 32));
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F62AE8] sharedInstance];
  [v3 setShouldSuppressIncomingNotification:0];

  [(RTTUIConversationViewController *)self setLookupController:0];
  [(BSInvalidatable *)self->_sleepTimerDisabledAssertion invalidate];
  notify_cancel(self->_lockStateNotifyToken);
  v4.receiver = self;
  v4.super_class = (Class)RTTUIConversationViewController;
  [(RTTUIConversationViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RTTUIConversationViewController;
  [(RTTUIConversationViewController *)&v3 viewDidLoad];
  [(RTTUIConversationViewController *)self setupTableView];
  [(RTTUIConversationViewController *)self callDidConnect:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = self;
    _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "RTT view controller will appear: %@", buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)RTTUIConversationViewController;
  [(RTTUIConversationViewController *)&v14 viewWillAppear:v3];
  if ([(RTTUIConversationViewController *)self isCurrentCallConnected])
  {
    uint64_t v6 = [(RTTUIConversationViewController *)self call];
    int v7 = [v6 status];

    if (v7 != 1)
    {
LABEL_14:
      int v13 = [MEMORY[0x263F62AE8] sharedInstance];
      [v13 setShouldSuppressIncomingNotification:1];

      return;
    }
    if (![(RTTUIConversationViewController *)self isIncomingScreeningCall])
    {
      [(RTTUITextView *)self->_textView becomeFirstResponder];
      [(RTTUITextView *)self->_textView updateTTYBar];
    }
    uint64_t v8 = [(RTTUIConversationViewController *)self conversation];
    id v9 = [v8 utterances];
    v10 = [v9 lastObject];

    id v11 = [(RTTUIConversationViewController *)self call];
    if (+[RTTUIUtilities ttyShouldBeRealtimeForCall:v11]
      && [v10 isMe]
      && ([v10 isComplete] & 1) == 0)
    {
      char v12 = [v10 hasTimedOut];

      if (v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v11 = [v10 text];
      [(RTTUIConversationViewController *)self setTextViewUtterance:v11];
    }

    goto LABEL_13;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = self;
    _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "RTT view controller will disappear: %@", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)RTTUIConversationViewController;
  [(RTTUIConversationViewController *)&v7 viewWillDisappear:v3];
  [(RTTUITextView *)self->_textView overrideTTYPredictionsHidden:1];
  uint64_t v6 = [MEMORY[0x263F62AE8] sharedInstance];
  [v6 setShouldSuppressIncomingNotification:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    int v13 = self;
    _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "RTT view controller disappeared: %@", buf, 0xCu);
  }

  v11.receiver = self;
  v11.super_class = (Class)RTTUIConversationViewController;
  [(RTTUIConversationViewController *)&v11 viewDidDisappear:v3];
  if (soft_AXProcessIsInCallService())
  {
    uint64_t v6 = [MEMORY[0x263F62AE8] sharedInstance];
    objc_super v7 = [(RTTUIConversationViewController *)self call];
    uint64_t v8 = [v7 callUUID];
    [v6 setViewControllerIsVisible:0 withCallID:v8];
  }
  sleepTimerDisabledAssertion = self->_sleepTimerDisabledAssertion;
  if (sleepTimerDisabledAssertion)
  {
    [(BSInvalidatable *)sleepTimerDisabledAssertion invalidate];
    uint64_t v10 = self->_sleepTimerDisabledAssertion;
    self->_sleepTimerDisabledAssertion = 0;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "RTT view controller appeared: %@", (uint8_t *)&buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)RTTUIConversationViewController;
  [(RTTUIConversationViewController *)&v14 viewDidAppear:v3];
  if (soft_AXProcessIsInCallService())
  {
    uint64_t v6 = [MEMORY[0x263F62AE8] sharedInstance];
    objc_super v7 = [(RTTUIConversationViewController *)self call];
    uint64_t v8 = [v7 callUUID];
    [v6 setViewControllerIsVisible:1 withCallID:v8];
  }
  if (!self->_sleepTimerDisabledAssertion)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2050000000;
    id v9 = (void *)getAXUserEventTimerClass_softClass;
    uint64_t v18 = getAXUserEventTimerClass_softClass;
    if (!getAXUserEventTimerClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      id v20 = __getAXUserEventTimerClass_block_invoke;
      uint64_t v21 = &unk_2646386E0;
      v22 = &v15;
      __getAXUserEventTimerClass_block_invoke((uint64_t)&buf);
      id v9 = (void *)v16[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v15, 8);
    objc_super v11 = [v10 sharedInstance];
    char v12 = [v11 acquireAssertionToDisableIdleTimerWithReason:@"RealTimeText"];
    sleepTimerDisabledAssertion = self->_sleepTimerDisabledAssertion;
    self->_sleepTimerDisabledAssertion = v12;
  }
  [(RTTUIConversationViewController *)self updateBarButtons];
}

- (void)updateDeviceLockStatus:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RTTUIConversationViewController *)self isIncomingScreeningCall] && v3)
  {
    id v5 = AXLogRTT();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "Springboard locked", buf, 2u);
    }

    [(RTTUIConversationViewController *)self addServiceCellWithUpdate:*MEMORY[0x263F62B30] options:0];
  }
  else
  {
    [(RTTUIConversationViewController *)self removeServiceCellWithUpdate:*MEMORY[0x263F62B30]];
  }
  uint64_t v6 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
  objc_super v7 = (void *)MEMORY[0x263F1CB60];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__RTTUIConversationViewController_updateDeviceLockStatus___block_invoke;
  v9[3] = &unk_264638648;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performWithoutAnimation:v9];
}

void __58__RTTUIConversationViewController_updateDeviceLockStatus___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadSections:*(void *)(a1 + 40) withRowAnimation:100];
}

- (void)updateCallDowngradeStatus
{
  if ([(RTTUIConversationViewController *)self currentCallIsDowngraded])
  {
    BOOL v3 = AXLogRTT();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_222978000, v3, OS_LOG_TYPE_INFO, "Call downgraded", v6, 2u);
    }

    [(RTTUIConversationViewController *)self addServiceCellWithUpdate:*MEMORY[0x263F62B18] options:0];
    objc_super v4 = [(RTTUIConversationViewController *)self call];
    int v5 = [v4 isUplinkMuted];

    if (v5) {
      [(RTTUIConversationViewController *)self toggleMute:0];
    }
  }
  else
  {
    [(RTTUIConversationViewController *)self removeServiceCellWithUpdate:*MEMORY[0x263F62B18]];
  }
  [(RTTUIConversationViewController *)self updateInputEnabled];
}

- (void)callDidConnect:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __50__RTTUIConversationViewController_callDidConnect___block_invoke;
  v23[3] = &unk_2646387C0;
  v23[4] = &v36;
  v23[5] = &v30;
  v23[6] = &v24;
  [MEMORY[0x263F62B00] performCallCenterTask:v23];
  int v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(RTTUIConversationViewController *)self call];
    *(_DWORD *)long long buf = 138412290;
    v43 = v6;
    _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "Call did connect %@", buf, 0xCu);
  }
  objc_super v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)v37[5];
    *(_DWORD *)long long buf = 138412290;
    v43 = v8;
    _os_log_impl(&dword_222978000, v7, OS_LOG_TYPE_INFO, "Current call list %@", buf, 0xCu);
  }

  id v9 = [(RTTUIConversationViewController *)self call];
  int v10 = [v9 status];

  if ([(RTTUIConversationViewController *)self isCurrentCallConnected])
  {
    if ([(id)v31[5] count] || objc_msgSend((id)v25[5], "count"))
    {
      objc_super v11 = [(RTTUIConversationViewController *)self navigationController];
      id v12 = (id)[v11 popViewControllerAnimated:1];
    }
    else
    {
      [(RTTUIConversationViewController *)self updateCallDowngradeStatus];
      if ([(RTTUIConversationViewController *)self currentCallIsDowngraded]) {
        goto LABEL_14;
      }
      uint64_t v15 = +[RTTUIConversationControllerCoordinator sharedInstance];
      id v16 = [(RTTUIConversationViewController *)self call];
      uint64_t v17 = [v16 callUUID];
      [v15 registerForCallUpdates:v17];

      [(RTTUIConversationViewController *)self updateTableViewSizeAnimated:0];
      uint64_t v18 = [(RTTUIConversationViewController *)self navigationController];
      objc_super v11 = [v18 navigationBar];

      if (soft_AXProcessIsInCallService())
      {
        [v11 setBarStyle:1];
        [v11 setBackgroundImage:0 forBarMetrics:0];
      }
      __int16 v19 = [(RTTUIConversationViewController *)self call];
      if ([v19 supportsTTYWithVoice])
      {
        id v20 = [(RTTUIConversationViewController *)self call];
        BOOL v21 = [v20 ttyType] == 0;

        if (!v21) {
          [(RTTUIConversationViewController *)self updateBarButtons];
        }
      }
      else
      {
      }
      BKSHIDServicesRequestProximityDetectionMode();
      [(RTTUIConversationViewController *)self updateCallHold:0];
      v22 = [MEMORY[0x263F62AE8] sharedInstance];
      [v22 setShouldSuppressIncomingNotification:1];
    }
  }
  else if ((v10 - 5) <= 1)
  {
    [(RTTUITextView *)self->_textView overrideTTYPredictionsHidden:1];
    int v13 = [(RTTUIConversationViewController *)self navigationController];
    id v14 = (id)[v13 popViewControllerAnimated:1];

    if (soft_AXProcessIsRTTNotificationContentExtension()) {
      [(RTTUIConversationViewController *)self showCallEnded];
    }
  }
LABEL_14:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
}

void __50__RTTUIConversationViewController_callDidConnect___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x263F62B00] sharedCallCenter];
  uint64_t v3 = [v2 currentCalls];
  uint64_t v4 = *(void *)(a1[4] + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [MEMORY[0x263F62B00] sharedCallCenter];
  uint64_t v7 = [v6 callsWithStatus:4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v13 = [MEMORY[0x263F62B00] sharedCallCenter];
  uint64_t v10 = [v13 callsWithStatus:3];
  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)updateCallHold:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v4 = [(RTTUIConversationViewController *)self isCurrentCallReceivingOnHold];
  BOOL v5 = [(RTTUIConversationViewController *)self isCurrentCallSendingOnHold];
  char v6 = [(TUCall *)self->_call isConnected];
  uint64_t v7 = AXLogRTT();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      call = self->_call;
      *(_DWORD *)long long buf = 67109634;
      BOOL v25 = v4;
      __int16 v26 = 1024;
      BOOL v27 = v5;
      __int16 v28 = 2112;
      id v29 = call;
      _os_log_impl(&dword_222978000, v8, OS_LOG_TYPE_DEFAULT, "Call hold status: %d | %d, %@", buf, 0x18u);
    }

    if (v5)
    {
      uint64_t v10 = *MEMORY[0x263F62B28];
      uint64_t v11 = *MEMORY[0x263F62B40];
      uint64_t v22 = *MEMORY[0x263F62B10];
      id v12 = [(RTTUIConversationViewController *)self contactDisplayString];
      uint64_t v23 = v12;
      id v13 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v14 = self;
      uint64_t v15 = v10;
      uint64_t v16 = v11;
    }
    else
    {
      uint64_t v18 = *MEMORY[0x263F62B40];
      if (!v4)
      {
        [(RTTUIConversationViewController *)self removeServiceCellWithUpdate:*MEMORY[0x263F62B40]];
        [(RTTUIConversationViewController *)self removeServiceCellWithUpdate:*MEMORY[0x263F62B28]];
        goto LABEL_13;
      }
      uint64_t v19 = *MEMORY[0x263F62B28];
      id v12 = [(RTTUIConversationViewController *)self contactDisplayString];
      BOOL v21 = v12;
      id v13 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v14 = self;
      uint64_t v15 = v18;
      uint64_t v16 = v19;
    }
    [(RTTUIConversationViewController *)v14 replaceServiceCellWithOldUpdate:v15 withNewUpdate:v16 options:v13];

LABEL_13:
    [(RTTUIConversationViewController *)self _updateBarButtonState];
    [(RTTUIConversationViewController *)self updateInputEnabled];
    return;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = self->_call;
    *(_DWORD *)long long buf = 67109634;
    BOOL v25 = v4;
    __int16 v26 = 1024;
    BOOL v27 = v5;
    __int16 v28 = 2112;
    id v29 = v17;
    _os_log_impl(&dword_222978000, v8, OS_LOG_TYPE_INFO, "Call not connected, not showing hold status: (hold: %d | %d): %@", buf, 0x18u);
  }
}

- (void)showCallEnded
{
  uint64_t v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_222978000, v3, OS_LOG_TYPE_INFO, "Showing call ended service message", v4, 2u);
  }

  [(RTTUIConversationViewController *)self addServiceCellWithUpdate:*MEMORY[0x263F62B20] options:0];
  [(RTTUIConversationViewController *)self updateInputEnabled];
}

- (BOOL)showTextViewForCurrentCall
{
  uint64_t v3 = [(RTTUIConversationViewController *)self call];
  if ([v3 isConnected]) {
    BOOL v4 = ![(RTTUIConversationViewController *)self isIncomingScreeningCall];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isIncomingScreeningCall
{
  uint64_t v3 = [(RTTUIConversationViewController *)self call];
  if ([v3 isScreening])
  {
    BOOL v4 = [(RTTUIConversationViewController *)self call];
    char v5 = [v4 isIncoming];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_updateBarButtonState
{
  uint64_t v3 = [(RTTUIConversationViewController *)self navigationController];
  BOOL v4 = [v3 navigationBar];
  char v5 = [v4 topItem];
  char v6 = [v5 rightBarButtonItems];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__RTTUIConversationViewController__updateBarButtonState__block_invoke;
  v7[3] = &unk_2646387E8;
  v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __56__RTTUIConversationViewController__updateBarButtonState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = [v3 accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"BarButtonMuteIdentifier"];

  if (v5)
  {
    int v6 = [*(id *)(a1 + 32) isCurrentCallSendingOnHold];
    uint64_t v7 = [*(id *)(a1 + 32) call];
    uint64_t v8 = [v7 isUplinkMuted] | v6;

    id v9 = AXLogRTT();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v18 = 67109376;
      int v19 = v8;
      __int16 v20 = 1024;
      int v21 = v6;
      _os_log_impl(&dword_222978000, v9, OS_LOG_TYPE_INFO, "Setting mute button state for muted %d held %d", (uint8_t *)&v18, 0xEu);
    }

    uint64_t v10 = [v3 customView];
    [v10 setSelected:v8];
    [v10 setEnabled:v6 ^ 1u];
LABEL_9:
    uint64_t v17 = ttyLocString();
    [v10 setAccessibilityValue:v17];

    goto LABEL_10;
  }
  uint64_t v11 = [v3 accessibilityIdentifier];
  int v12 = [v11 isEqualToString:@"BarButtonHoldIdentifier"];

  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 32) isCurrentCallSendingOnHold];
    int v14 = [*(id *)(a1 + 32) isCurrentCallReceivingOnHold] & (v13 ^ 1);
    uint64_t v15 = AXLogRTT();
    uint64_t v16 = v14 ^ 1u;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v18 = 67109376;
      int v19 = v13;
      __int16 v20 = 1024;
      int v21 = v14 ^ 1;
      _os_log_impl(&dword_222978000, v15, OS_LOG_TYPE_INFO, "Setting hold button state for held %d enabled %d", (uint8_t *)&v18, 0xEu);
    }

    uint64_t v10 = [v3 customView];
    [v10 setSelected:v13];
    [v10 setEnabled:v16];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)updateBarButtons
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = [(RTTUIConversationViewController *)self navigationController];
  BOOL v4 = [v3 navigationBar];
  int v5 = [v4 topItem];
  int v6 = [v5 rightBarButtonItems];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    uint64_t v8 = objc_opt_new();
    id v9 = [(RTTUIConversationViewController *)self call];

    if (!v9)
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:9 target:self action:sel_shareCallInfo_];
      [v8 addObject:v10];
    }
    uint64_t v11 = [(RTTUIConversationViewController *)self call];
    int v12 = [v11 supportsTTYWithVoice];

    if (v12)
    {
      uint64_t v13 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"mic.slash.fill"];
      int v14 = [v13 _imageThatSuppressesAccessibilityHairlineThickening];

      uint64_t v15 = ttyImageNamed(@"ttyMuteCircle");
      uint64_t v16 = [MEMORY[0x263F1C550] systemFillColor];
      uint64_t v17 = [v15 imageWithTintColor:v16];
      int v18 = [v17 _imageThatSuppressesAccessibilityHairlineThickening];

      int v19 = ttyImageNamed(@"ttyMuteCircle");
      __int16 v20 = [MEMORY[0x263F1C550] systemWhiteColor];
      int v21 = [v19 imageWithTintColor:v20];
      uint64_t v22 = [v21 _imageThatSuppressesAccessibilityHairlineThickening];

      uint64_t v23 = [MEMORY[0x263F1C488] buttonWithType:0];
      [v23 addTarget:self action:sel_toggleMute_ forControlEvents:64];
      uint64_t v24 = [MEMORY[0x263F1C550] systemWhiteColor];
      BOOL v25 = [v14 imageWithTintColor:v24 renderingMode:1];
      [v23 setImage:v25 forState:0];

      __int16 v26 = [MEMORY[0x263F1C550] systemBlackColor];
      BOOL v27 = [v14 imageWithTintColor:v26 renderingMode:1];
      [v23 setImage:v27 forState:4];

      [v23 setBackgroundImage:v18 forState:0];
      [v23 setBackgroundImage:v22 forState:4];
      [v23 sizeToFit];
      __int16 v28 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v23];
      [v28 setAccessibilityIdentifier:@"BarButtonMuteIdentifier"];
      [v8 addObject:v28];
    }
    id v29 = [MEMORY[0x263F62B00] sharedUtilityProvider];
    uint64_t v30 = [(RTTUIConversationViewController *)self call];
    v31 = [v29 contextForCall:v30];

    uint64_t v32 = [MEMORY[0x263F62AF8] sharedInstance];
    int v33 = [v32 rttCallHoldEnabled];

    int v34 = [MEMORY[0x263F62B00] isRTTCallHoldSupportedForContext:v31];
    int v35 = v34;
    if ((v33 & v12) == 1 && v34)
    {
      uint64_t v36 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"pause.fill"];
      v37 = [v36 _imageThatSuppressesAccessibilityHairlineThickening];

      uint64_t v38 = ttyImageNamed(@"ttyMuteCircle");
      v39 = [MEMORY[0x263F1C550] systemFillColor];
      v40 = [v38 imageWithTintColor:v39];
      id v41 = [v40 _imageThatSuppressesAccessibilityHairlineThickening];

      v42 = ttyImageNamed(@"ttyMuteCircle");
      v43 = [MEMORY[0x263F1C550] systemWhiteColor];
      uint64_t v44 = [v42 imageWithTintColor:v43];
      v45 = [v44 _imageThatSuppressesAccessibilityHairlineThickening];

      v46 = [MEMORY[0x263F1C488] buttonWithType:0];
      [v46 addTarget:self action:sel_toggleHold_ forControlEvents:64];
      v47 = [MEMORY[0x263F1C550] systemBlackColor];
      v48 = [v37 imageWithTintColor:v47 renderingMode:1];
      [v46 setImage:v48 forState:4];

      v49 = [MEMORY[0x263F1C550] systemWhiteColor];
      v50 = [v37 imageWithTintColor:v49 renderingMode:1];
      [v46 setImage:v50 forState:0];

      [v46 setBackgroundImage:v41 forState:0];
      [v46 setBackgroundImage:v45 forState:4];
      [v46 sizeToFit];
      v51 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
      [v51 setWidth:24.0];
      [v8 addObject:v51];
      v52 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v46];
      [v52 setAccessibilityIdentifier:@"BarButtonHoldIdentifier"];
      v53 = [(RTTUIConversationViewController *)self call];
      objc_msgSend(v52, "setEnabled:", objc_msgSend(v53, "isEmergency") ^ 1);

      [v8 addObject:v52];
    }
    else
    {
      v54 = AXLogRTT();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        v58[0] = 67109632;
        v58[1] = v33;
        __int16 v59 = 1024;
        int v60 = v12;
        __int16 v61 = 1024;
        int v62 = v35;
        _os_log_impl(&dword_222978000, v54, OS_LOG_TYPE_INFO, "Disabled RTT Hold Feature: %d %d %d", (uint8_t *)v58, 0x14u);
      }
    }
    v55 = [(RTTUIConversationViewController *)self navigationController];
    v56 = [v55 navigationBar];
    v57 = [v56 topItem];
    [v57 setRightBarButtonItems:v8];
  }
  [(RTTUIConversationViewController *)self _updateBarButtonState];
}

- (void)toggleMute:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__RTTUIConversationViewController_toggleMute___block_invoke;
  v3[3] = &unk_264638690;
  v3[4] = self;
  [MEMORY[0x263F62B00] performCallCenterTask:v3];
}

void __46__RTTUIConversationViewController_toggleMute___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) call];
  int v3 = [v2 isUplinkMuted];

  BOOL v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3 ^ 1;
    _os_log_impl(&dword_222978000, v4, OS_LOG_TYPE_INFO, "Toggling TTY mute: New value: %d", (uint8_t *)&buf, 8u);
  }

  int v5 = [*(id *)(a1 + 32) call];
  if ([v5 isTTY])
  {
    int v6 = [*(id *)(a1 + 32) call];
    int v7 = [v6 supportsTTYWithVoice];

    int v8 = v7 ^ 1;
  }
  else
  {
    int v8 = 0;
  }

  id v9 = AXLogRTT();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_222978000, v9, OS_LOG_TYPE_INFO, "Will toggle downlink mute: %d", (uint8_t *)&buf, 8u);
  }

  if (v8)
  {
    uint64_t v10 = [MEMORY[0x263F62AE8] sharedInstance];
    uint64_t v11 = [*(id *)(a1 + 32) call];
    int v12 = [v11 callUUID];
    [v10 setSystemOutputAudioMuted:v3 ^ 1u withCallID:v12];
  }
  int v14 = *(void **)(a1 + 32);
  uint64_t v13 = (id *)(a1 + 32);
  uint64_t v15 = [v14 call];
  [v15 setUplinkMuted:v3 ^ 1u];

  [*v13 _updateBarButtonState];
  if (v3) {
    uint64_t v16 = (void **)MEMORY[0x263F62B50];
  }
  else {
    uint64_t v16 = (void **)MEMORY[0x263F62B38];
  }
  uint64_t v17 = *v16;
  if (v3) {
    int v18 = (id *)MEMORY[0x263F62B38];
  }
  else {
    int v18 = (id *)MEMORY[0x263F62B50];
  }
  id v19 = v17;
  id v20 = *v18;
  [*v13 replaceServiceCellWithOldUpdate:v20 withNewUpdate:v19 options:0];
  objc_initWeak(&buf, *v13);
  int v21 = (void *)*((void *)*v13 + 127);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__RTTUIConversationViewController_toggleMute___block_invoke_407;
  v23[3] = &unk_264638770;
  objc_copyWeak(&v25, &buf);
  id v22 = v19;
  id v24 = v22;
  [v21 afterDelay:v23 processBlock:2.0];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&buf);
}

void __46__RTTUIConversationViewController_toggleMute___block_invoke_407(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeServiceCellWithUpdate:*(void *)(a1 + 32)];
}

- (void)toggleHold:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__RTTUIConversationViewController_toggleHold___block_invoke;
  v3[3] = &unk_264638690;
  v3[4] = self;
  [MEMORY[0x263F62B00] performCallCenterTask:v3];
}

uint64_t __46__RTTUIConversationViewController_toggleHold___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) isCurrentCallSendingOnHold];
  int v3 = AXLogRTT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v2 ^ 1;
    _os_log_impl(&dword_222978000, v3, OS_LOG_TYPE_INFO, "Setting RTT call on hold -> %d", (uint8_t *)v7, 8u);
  }

  BOOL v4 = [MEMORY[0x263F62B00] sharedCallCenter];
  int v5 = [*(id *)(a1 + 32) call];
  if (v2) {
    [v4 unholdCall:v5];
  }
  else {
    [v4 holdCall:v5];
  }

  [*(id *)(a1 + 32) logCallHold:v2 ^ 1u];
  [*(id *)(a1 + 32) updateCallHold:0];
  [*(id *)(a1 + 32) _updateBarButtonState];
  return [*(id *)(a1 + 32) updateInputEnabled];
}

- (void)logCallHold:(BOOL)a3
{
  BOOL v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__RTTUIConversationViewController_logCallHold___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v6 = a3;
  dispatch_async(v4, block);
}

void __47__RTTUIConversationViewController_logCallHold___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = AXLogAggregate();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)id buf = 67109120;
    int v9 = v3;
    _os_log_impl(&dword_222978000, v2, OS_LOG_TYPE_INFO, "RTT call placed upstream hold: %d", buf, 8u);
  }

  BOOL v4 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32), @"callHeld");
  int v7 = v4;
  int v5 = [NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  AnalyticsSendEvent();
}

- (id)contactDisplayString
{
  int v3 = [(RTTUIConversationViewController *)self call];
  BOOL v4 = [v3 displayName];

  if (![v4 length])
  {
    int v5 = (void *)MEMORY[0x263EFEA20];
    uint64_t v6 = (void *)MEMORY[0x263EFE9F8];
    int v7 = [(RTTUIConversationViewController *)self conversation];
    uint64_t v8 = [v7 otherContactPath];
    int v9 = [v6 contactForPhoneNumber:v8];
    uint64_t v10 = [v5 stringFromContact:v9 style:0];

    BOOL v4 = (void *)v10;
  }
  if (![v4 length])
  {
    uint64_t v11 = [(RTTUIConversationViewController *)self conversation];
    uint64_t v12 = [v11 otherContactPath];

    BOOL v4 = (void *)v12;
  }
  return v4;
}

- (BOOL)isCurrentCallConnected
{
  int v2 = [(RTTUIConversationViewController *)self call];
  int v3 = [v2 status];

  return (v3 - 1) < 2;
}

- (BOOL)isCurrentCallOnHold
{
  if ([(RTTUIConversationViewController *)self isCurrentCallReceivingOnHold]) {
    return 1;
  }
  return [(RTTUIConversationViewController *)self isCurrentCallSendingOnHold];
}

- (BOOL)isCurrentCallReceivingOnHold
{
  int v2 = [(RTTUIConversationViewController *)self call];
  int v3 = [v2 providerContext];
  BOOL v4 = AXTTYIsTextHeldForRTTCall();
  int v5 = [v3 objectForKey:v4];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = [v5 BOOLValue];
  }
  else
  {
    int v7 = AXLogRTT();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[RTTUIConversationViewController isCurrentCallReceivingOnHold](v7);
    }

    char v6 = 0;
  }

  return v6;
}

- (BOOL)isCurrentCallSendingOnHold
{
  int v2 = [(RTTUIConversationViewController *)self call];
  char v3 = [v2 isOnHold];

  return v3;
}

- (BOOL)currentCallIsDowngraded
{
  int v2 = [(RTTUIConversationViewController *)self call];
  BOOL v3 = [v2 ttyType] == 0;

  return v3;
}

- (void)updateInputEnabled
{
  BOOL v3 = [(RTTUIConversationViewController *)self call];
  int v4 = [v3 status];

  if ([(RTTUIConversationViewController *)self currentCallIsDowngraded]
    || [(RTTUIConversationViewController *)self isCurrentCallOnHold]
    || (v4 - 5) < 2
    || [(RTTUIConversationViewController *)self isIncomingScreeningCall])
  {
    int v5 = [(RTTUIConversationViewController *)self call];
    BOOL v6 = +[RTTUIUtilities ttyShouldBeRealtimeForCall:v5];

    if (v6)
    {
      [(RTTUITextView *)self->_textView setEditable:0];
      textView = self->_textView;
      [(RTTUITextView *)textView resignFirstResponder];
      return;
    }
    gaButton = self->_gaButton;
    uint64_t v9 = 0;
  }
  else
  {
    [(RTTUITextView *)self->_textView setEditable:1];
    gaButton = self->_gaButton;
    uint64_t v9 = 1;
  }
  [(UIButton *)gaButton setEnabled:v9];
}

- (void)addServiceCellWithUpdate:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  AXPerformBlockOnMainThread();
}

uint64_t __68__RTTUIConversationViewController_addServiceCellWithUpdate_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addServiceCellWithUpdate:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

- (void)_addServiceCellWithUpdate:(id)a3 options:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  _AXAssertIsMainThread();
  id v8 = (void *)[objc_alloc(MEMORY[0x263F62AF0]) initWithServiceUpdateType:v6 options:v7];

  if (([(NSMutableArray *)self->_serviceUpdates containsObject:v8] & 1) == 0)
  {
    uint64_t v9 = [(NSMutableArray *)self->_serviceUpdates count];
    uint64_t v10 = [MEMORY[0x263F088C8] indexPathForRow:v9 inSection:1];
    uint64_t v11 = AXLogRTT();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_222978000, v11, OS_LOG_TYPE_INFO, "Add service cell %@ %@", (uint8_t *)&v13, 0x16u);
    }

    [(NSMutableArray *)self->_serviceUpdates addObject:v8];
    if (v10)
    {
      [(RTTUIConversationViewController *)self _updateTableViewRowAtIndexPath:v10 action:1 animation:4];
      uint64_t v12 = [(RTTUIConversationViewController *)self tableView];
      [v12 scrollToRowAtIndexPath:v10 atScrollPosition:3 animated:1];
    }
  }
}

- (void)removeServiceCellWithUpdate:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

uint64_t __63__RTTUIConversationViewController_removeServiceCellWithUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeServiceCellWithUpdate:*(void *)(a1 + 40)];
}

- (void)_removeServiceCellWithUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _AXAssertIsMainThread();
  serviceUpdates = self->_serviceUpdates;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__RTTUIConversationViewController__removeServiceCellWithUpdate___block_invoke;
  v11[3] = &unk_264638858;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [(NSMutableArray *)serviceUpdates indexOfObjectPassingTest:v11];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [MEMORY[0x263F088C8] indexPathForRow:v7 inSection:1];
    uint64_t v10 = AXLogRTT();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_222978000, v10, OS_LOG_TYPE_INFO, "Remove service cell %@ %@", buf, 0x16u);
    }

    [(NSMutableArray *)self->_serviceUpdates removeObjectAtIndex:v8];
    if (v9) {
      [(RTTUIConversationViewController *)self _updateTableViewRowAtIndexPath:v9 action:2 animation:4];
    }
  }
}

BOOL __64__RTTUIConversationViewController__removeServiceCellWithUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 serviceUpdateType];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)replaceServiceCellWithOldUpdate:(id)a3 withNewUpdate:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  AXPerformBlockOnMainThread();
}

uint64_t __89__RTTUIConversationViewController_replaceServiceCellWithOldUpdate_withNewUpdate_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _replaceServiceCellWithOldUpdate:*(void *)(a1 + 40) withNewUpdate:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
}

- (void)_replaceServiceCellWithOldUpdate:(id)a3 withNewUpdate:(id)a4 options:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _AXAssertIsMainThread();
  serviceUpdates = self->_serviceUpdates;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90__RTTUIConversationViewController__replaceServiceCellWithOldUpdate_withNewUpdate_options___block_invoke;
  v17[3] = &unk_264638858;
  id v12 = v8;
  id v18 = v12;
  uint64_t v13 = [(NSMutableArray *)serviceUpdates indexOfObjectPassingTest:v17];
  id v14 = (void *)[objc_alloc(MEMORY[0x263F62AF0]) initWithServiceUpdateType:v9 options:v10];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || ([(NSMutableArray *)self->_serviceUpdates containsObject:v14] & 1) != 0)
  {
    [(RTTUIConversationViewController *)self _addServiceCellWithUpdate:v9 options:v10];
  }
  else
  {
    __int16 v15 = [MEMORY[0x263F088C8] indexPathForRow:v13 inSection:1];
    uint64_t v16 = AXLogRTT();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 138412802;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_222978000, v16, OS_LOG_TYPE_INFO, "Replace service cell %@ %@ with %@", buf, 0x20u);
    }

    [(NSMutableArray *)self->_serviceUpdates setObject:v14 atIndexedSubscript:v13];
    [(RTTUIConversationViewController *)self _updateTableViewRowAtIndexPath:v15 action:0 animation:0];
  }
}

BOOL __90__RTTUIConversationViewController__replaceServiceCellWithOldUpdate_withNewUpdate_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 serviceUpdateType];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)addTranscriptionText:(id)a3 isNew:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(RTTUIConversationViewController *)self conversation];
  id v8 = [v7 utterances];
  uint64_t v9 = [v8 count];

  id v10 = [(RTTUIConversationViewController *)self conversation];
  id v11 = v10;
  if (v4) {
    id v12 = (id)[v10 addTranscriptionFromOtherContactPath:v6];
  }
  else {
    id v13 = (id)[v10 updateTranscriptionFromOtherContactPath:v6];
  }

  id v14 = [(RTTUIConversationViewController *)self conversation];
  __int16 v15 = [v14 utterances];
  uint64_t v16 = [v15 count];

  id v17 = objc_alloc(MEMORY[0x263F62AF0]);
  id v18 = (void *)[v17 initWithServiceUpdateType:*MEMORY[0x263F62B30] options:0];
  int v19 = [(NSMutableArray *)self->_serviceUpdates containsObject:v18];
  id v20 = AXLogRTT();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v19)
  {
    if (v21)
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_222978000, v20, OS_LOG_TYPE_INFO, "Not adding transcription text to table view because screen is locked", (uint8_t *)&v24, 2u);
    }

    id v22 = 0;
  }
  else
  {
    if (v21)
    {
      int v24 = 138412802;
      id v25 = v6;
      __int16 v26 = 1024;
      int v27 = v9;
      __int16 v28 = 1024;
      int v29 = v16;
      _os_log_impl(&dword_222978000, v20, OS_LOG_TYPE_INFO, "Adding transcription: %@ (old count: %d, new count: %d)", (uint8_t *)&v24, 0x18u);
    }

    id v22 = [(RTTUIConversationViewController *)self _updateTableViewUtteranceOldCount:v9 newCount:v16];
  }

  return v22;
}

- (id)addUtterance:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RTTUIConversationViewController *)self conversation];
  id v6 = [v5 utterances];
  uint64_t v7 = [v6 count];

  id v8 = [(RTTUIConversationViewController *)self conversation];
  [v8 addUtterance:v4];

  uint64_t v9 = [(RTTUIConversationViewController *)self conversation];
  id v10 = [v9 utterances];
  uint64_t v11 = [v10 count];

  id v12 = objc_alloc(MEMORY[0x263F62AF0]);
  id v13 = (void *)[v12 initWithServiceUpdateType:*MEMORY[0x263F62B30] options:0];
  int v14 = [(NSMutableArray *)self->_serviceUpdates containsObject:v13];
  __int16 v15 = AXLogRTT();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_222978000, v15, OS_LOG_TYPE_INFO, "Not adding utterance because screen is locked", (uint8_t *)&v19, 2u);
    }

    id v17 = 0;
  }
  else
  {
    if (v16)
    {
      int v19 = 138412802;
      id v20 = v4;
      __int16 v21 = 1024;
      int v22 = v7;
      __int16 v23 = 1024;
      int v24 = v11;
      _os_log_impl(&dword_222978000, v15, OS_LOG_TYPE_INFO, "Adding utterance: %@ (old count: %d, new count: %d)", (uint8_t *)&v19, 0x18u);
    }

    id v17 = [(RTTUIConversationViewController *)self _updateTableViewUtteranceOldCount:v7 newCount:v11];
  }

  return v17;
}

- (id)_updateTableViewUtteranceOldCount:(unint64_t)a3 newCount:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  if (a3 >= a4)
  {
    if (a3 > a4)
    {
      do
      {
        id v10 = [MEMORY[0x263F088C8] indexPathForRow:--a3 inSection:0];
        [v7 addObject:v10];
      }
      while (a3 > a4);
      a3 = a4;
    }
    [(RTTUIConversationViewController *)self _updateTableViewRowsAtIndexPaths:v7 action:2 animation:4];
    uint64_t v9 = AXLogRTT();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      unint64_t v25 = (unint64_t)v7;
      _os_log_impl(&dword_222978000, v9, OS_LOG_TYPE_INFO, "Deleting rows: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    do
    {
      id v8 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:0];
      [v7 addObject:v8];

      ++a3;
    }
    while (a4 != a3);
    [(RTTUIConversationViewController *)self _updateTableViewRowsAtIndexPaths:v7 action:1 animation:4];
    uint64_t v9 = AXLogRTT();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      unint64_t v25 = (unint64_t)v7;
      _os_log_impl(&dword_222978000, v9, OS_LOG_TYPE_INFO, "Inserting rows: %@", (uint8_t *)&v24, 0xCu);
    }
    a3 = a4;
  }

  if (a4) {
    unint64_t v11 = a4 - 1;
  }
  else {
    unint64_t v11 = 0;
  }
  id v12 = [MEMORY[0x263F088C8] indexPathForRow:v11 inSection:0];
  id v13 = AXLogRTT();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v24 = 134218754;
    unint64_t v25 = v11;
    __int16 v26 = 2048;
    unint64_t v27 = a3;
    __int16 v28 = 2048;
    unint64_t v29 = a4;
    __int16 v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_222978000, v13, OS_LOG_TYPE_INFO, "Trying to update utterance and cell: %lld (old count, %lld, new count %lld) path: %@", (uint8_t *)&v24, 0x2Au);
  }

  if ((v11 & 0x8000000000000000) == 0)
  {
    int v14 = [(RTTUIConversationViewController *)self tableView];
    __int16 v15 = [v14 cellForRowAtIndexPath:v12];

    BOOL v16 = [(RTTUIConversationViewController *)self conversation];
    id v17 = [v16 utterances];
    id v18 = [v17 lastObject];
    [v15 updateUtterance:v18];

    int v19 = [(RTTUIConversationViewController *)self tableView];
    uint64_t v20 = [v19 numberOfRowsInSection:0];

    __int16 v21 = AXLogRTT();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = [NSNumber numberWithInteger:v20];
      int v24 = 138412802;
      unint64_t v25 = (unint64_t)v15;
      __int16 v26 = 2112;
      unint64_t v27 = (unint64_t)v12;
      __int16 v28 = 2112;
      unint64_t v29 = (unint64_t)v22;
      _os_log_impl(&dword_222978000, v21, OS_LOG_TYPE_INFO, "Updated cell: %@, index path: %@, number of rows: %@", (uint8_t *)&v24, 0x20u);
    }
    if ([v12 row] < v20 && !v15) {
      [(RTTUIConversationViewController *)self _scrollToIndexPathIfNecessary:v12 animated:1];
    }
  }
  return v12;
}

- (void)updateUtterance:(id)a3 forIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(RTTUIConversationViewController *)self utteranceCellAtIndexPath:a4];
  [v7 updateUtterance:v6];

  [(RTTUIConversationViewController *)self utteranceCellDidUpdateContent:v7];
}

- (id)textViewUtterance
{
  return (id)[(RTTUITextView *)self->_textView text];
}

- (void)setTextViewUtterance:(id)a3
{
  [(RTTUITextView *)self->_textView setText:a3];
  [(RTTUIConversationViewController *)self updateTableViewSizeAnimated:1];
}

- (id)utteranceCellAtIndexPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RTTUIConversationViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    id v8 = AXLogRTT();
    uint64_t v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RTTUIConversationViewController utteranceCellAtIndexPath:]();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_222978000, v9, OS_LOG_TYPE_INFO, "No utterance cell found at index path: %@", (uint8_t *)&v11, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)serviceUpdateCellAtIndexPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RTTUIConversationViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    id v8 = AXLogRTT();
    uint64_t v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RTTUIConversationViewController serviceUpdateCellAtIndexPath:]();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_222978000, v9, OS_LOG_TYPE_INFO, "No service update cell found at index path: %@", (uint8_t *)&v11, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)cannedResponses
{
  int v2 = [MEMORY[0x263F62AF8] sharedInstance];
  id v3 = [v2 cannedResponses];

  return v3;
}

- (id)currentContactPath
{
  id v3 = [MEMORY[0x263F62B00] sharedUtilityProvider];
  id v4 = [(RTTUIConversationViewController *)self call];
  id v5 = [v3 contactPathForCall:v4];

  return v5;
}

+ (BOOL)_validRectangle:(CGRect)a3
{
  BOOL result = 0;
  if (fabs(a3.origin.x) != INFINITY && fabs(a3.origin.y) != INFINITY) {
    return !CGRectIsInfinite(a3);
  }
  return result;
}

- (void)updateVoiceOverAnnouncement:(id)a3
{
  id v4 = a3;
  voAnnouncementTimer = self->_voAnnouncementTimer;
  if (!voAnnouncementTimer)
  {
    id v6 = objc_alloc(MEMORY[0x263F21398]);
    id v7 = (AXDispatchTimer *)[v6 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    id v8 = self->_voAnnouncementTimer;
    self->_voAnnouncementTimer = v7;

    uint64_t v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    voAnnouncementBuffer = self->_voAnnouncementBuffer;
    self->_voAnnouncementBuffer = v9;

    voAnnouncementTimer = self->_voAnnouncementTimer;
  }
  [(AXDispatchTimer *)voAnnouncementTimer cancel];
  if ([v4 length] && objc_msgSend(v4, "characterAtIndex:", 0) == 8)
  {
    if ([(NSMutableString *)self->_voAnnouncementBuffer length]) {
      -[NSMutableString deleteCharactersInRange:](self->_voAnnouncementBuffer, "deleteCharactersInRange:", [(NSMutableString *)self->_voAnnouncementBuffer length] - 1, 1);
    }
  }
  else
  {
    [(NSMutableString *)self->_voAnnouncementBuffer appendString:v4];
  }
  int v11 = [(NSMutableString *)self->_voAnnouncementBuffer trimmedString];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = self->_voAnnouncementTimer;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__RTTUIConversationViewController_updateVoiceOverAnnouncement___block_invoke;
    v14[3] = &unk_264638690;
    v14[4] = self;
    [(AXDispatchTimer *)v13 afterDelay:v14 processBlock:4.0];
  }
}

void __63__RTTUIConversationViewController_updateVoiceOverAnnouncement___block_invoke(uint64_t a1)
{
  id argument = [MEMORY[0x263F21660] stringWithString:*(void *)(*(void *)(a1 + 32) + 1048)];
  [argument setAttribute:&unk_26D522868 forKey:*MEMORY[0x263F216D8]];
  [argument setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F218B8]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  [*(id *)(*(void *)(a1 + 32) + 1048) setString:&stru_26D51E848];
}

- (void)_scrollToIndexPathIfNecessary:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  *(void *)&v53[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(RTTUIConversationViewController *)self view];
  id v8 = [(RTTUIConversationViewController *)self tableView];
  [v8 rectForRowAtIndexPath:v6];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = [(RTTUIConversationViewController *)self tableView];
  objc_msgSend(v7, "convertRect:fromView:", v17, v10, v12, v14, v16);
  CGFloat v19 = v18;
  double v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  __int16 v26 = [(RTTUIConversationViewController *)self view];
  [(RTTUITextView *)self->_textView bounds];
  objc_msgSend(v26, "convertRect:fromView:", self->_textView);
  CGFloat v28 = v27;
  double v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v54.origin.x = v19;
  v54.origin.y = v21;
  v54.size.width = v23;
  v54.size.height = v25;
  v56.origin.x = v28;
  v56.origin.y = v30;
  v56.size.width = v32;
  v56.size.height = v34;
  BOOL v35 = CGRectIntersectsRect(v54, v56);
  uint64_t v36 = [(RTTUIConversationViewController *)self tableView];
  v37 = [v36 indexPathsForVisibleRows];
  int v38 = [v37 containsObject:v6] ^ 1;

  if ((v38 & 1) != 0 || v35)
  {
    uint64_t v39 = [v6 section];
    v40 = [(RTTUIConversationViewController *)self tableView];
    if (v39 >= [v40 numberOfSections])
    {
    }
    else
    {
      uint64_t v41 = [v6 row];
      v42 = [(RTTUIConversationViewController *)self tableView];
      uint64_t v43 = objc_msgSend(v42, "numberOfRowsInSection:", objc_msgSend(v6, "section"));

      if (v41 < v43)
      {
        uint64_t v44 = AXLogRTT();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = [(RTTUIConversationViewController *)self tableView];
          [v45 rectForRowAtIndexPath:v6];
          v46 = NSStringFromRect(v55);
          int v51 = 138412546;
          *(void *)v52 = v6;
          *(_WORD *)&v52[8] = 2112;
          *(void *)v53 = v46;
          _os_log_impl(&dword_222978000, v44, OS_LOG_TYPE_INFO, "Scrolling to row: %@ - %@", (uint8_t *)&v51, 0x16u);
        }
        v47 = AXLogRTT();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          int v51 = 67109632;
          *(_DWORD *)v52 = v35;
          *(_WORD *)&v52[4] = 1024;
          *(_DWORD *)&v52[6] = v38;
          v53[0] = 1024;
          *(_DWORD *)&v53[1] = v21 > v30;
          _os_log_debug_impl(&dword_222978000, v47, OS_LOG_TYPE_DEBUG, "Scroll row options: %d, %d, %d", (uint8_t *)&v51, 0x14u);
        }

        v48 = [(RTTUIConversationViewController *)self tableView];
        v49 = v48;
        BOOL v50 = v21 > v30 && v4;
        [v48 scrollToRowAtIndexPath:v6 atScrollPosition:3 animated:v50];
LABEL_16:

        goto LABEL_17;
      }
    }
    v49 = AXLogRTT();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      int v51 = 138412802;
      *(void *)v52 = v6;
      *(_WORD *)&v52[8] = 1024;
      *(_DWORD *)v53 = [v6 section];
      v53[2] = 1024;
      *(_DWORD *)&v53[3] = [v6 row];
      _os_log_impl(&dword_222978000, v49, OS_LOG_TYPE_INFO, "Not scrolling to path[%@], because tableview doesn't have any sections[%d] or rows[%d]", (uint8_t *)&v51, 0x18u);
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)deviceDidReceiveString:(id)a3 forUtterance:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_222978000, v8, OS_LOG_TYPE_INFO, "TTY receive |%@|=%@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__RTTUIConversationViewController_deviceDidReceiveString_forUtterance___block_invoke;
  v15[3] = &unk_2646388A8;
  void v15[4] = self;
  double v12 = v7;
  double v13 = v6;
  double v14 = (void *)MEMORY[0x223CA2070](v15);
  id v9 = v14;
  id v10 = v6;
  id v11 = v7;
  AXPerformBlockOnMainThread();
}

void __71__RTTUIConversationViewController_deviceDidReceiveString_forUtterance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __71__RTTUIConversationViewController_deviceDidReceiveString_forUtterance___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  HCPerformSafeBlock();
}

uint64_t __71__RTTUIConversationViewController_deviceDidReceiveString_forUtterance___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scrollToIndexPathIfNecessary:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

void __71__RTTUIConversationViewController_deviceDidReceiveString_forUtterance___block_invoke_4(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) conversation];
  id v3 = [v2 utterances];
  BOOL v4 = [v3 lastObject];
  id v5 = [*(id *)(a1 + 32) tableView];
  [v5 bounds];
  +[RTTUIUtteranceCell heightForUtterance:v4 andWidth:CGRectGetWidth(v60)];
  double v7 = v6;

  id v8 = [*(id *)(a1 + 32) conversation];
  id v9 = [v8 utterances];
  unint64_t v10 = [v9 count];

  id v11 = [*(id *)(a1 + 32) conversation];
  double v12 = [v11 lastUtteranceForMe:0];

  double v13 = [*(id *)(a1 + 32) lastConversationRowPathForUtterance:v12];
  uint64_t v14 = [v12 text];
  if (v14)
  {
    double v15 = (void *)v14;
    double v16 = *(void **)(a1 + 40);
    id v17 = [v12 text];
    __int16 v18 = [v17 stringByAppendingString:*(void *)(a1 + 48)];
    LODWORD(v16) = [v16 isEqualToString:v18];

    if (v16)
    {
      [v12 updateText:*(void *)(a1 + 40)];
      AXLogRTT();
      *(double *)&id v19 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      double v20 = *(double *)(a1 + 40);
      *(double *)&double v21 = [v12 text];
      *(_DWORD *)id buf = 138412802;
      double v54 = v20;
      __int16 v55 = 2112;
      double v56 = *(double *)&v21;
      __int16 v57 = 2112;
      v58 = v12;
      double v22 = "total utterance: %@, utterance text: %@, updated: %@";
      CGFloat v23 = v19;
      uint32_t v24 = 32;
      goto LABEL_11;
    }
  }
  CGFloat v25 = [*(id *)(a1 + 32) conversation];
  *(double *)&id v19 = [v25 appendStringFromOtherContactPath:*(void *)(a1 + 48)];

  __int16 v26 = AXLogRTT();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    double v27 = *(double *)(a1 + 48);
    *(_DWORD *)id buf = 138412546;
    double v54 = v27;
    __int16 v55 = 2112;
    double v56 = *(double *)&v19;
    _os_log_impl(&dword_222978000, v26, OS_LOG_TYPE_INFO, "Append utterance: %@ -> %@", buf, 0x16u);
  }

  if (*(void *)(a1 + 40))
  {
    CGFloat v28 = [v19 text];
    char v29 = [v28 isEqualToString:*(void *)(a1 + 40)];

    if ((v29 & 1) == 0)
    {
      [v19 updateText:*(void *)(a1 + 40)];
      AXLogRTT();
      *(double *)&double v21 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_12:

        goto LABEL_13;
      }
      *(_DWORD *)id buf = 138412290;
      double v54 = *(double *)&v19;
      double v22 = "updated utterance: %@";
      CGFloat v23 = v21;
      uint32_t v24 = 12;
LABEL_11:
      _os_log_impl(&dword_222978000, v23, OS_LOG_TYPE_INFO, v22, buf, v24);
      goto LABEL_12;
    }
  }
LABEL_13:

  double v30 = [*(id *)(a1 + 32) conversation];
  double v31 = [v30 utterances];
  unint64_t v32 = [v31 count];

  id v33 = objc_alloc(MEMORY[0x263F62AF0]);
  CGFloat v34 = (void *)[v33 initWithServiceUpdateType:*MEMORY[0x263F62B30] options:0];
  if (![*(id *)(*(void *)(a1 + 32) + 1056) containsObject:v34])
  {
    [*(id *)(a1 + 32) updateVoiceOverAnnouncement:*(void *)(a1 + 48)];
    if (v32 <= v10)
    {
      if (v32 >= v10)
      {
        if (!v10) {
          goto LABEL_35;
        }
        *(double *)&uint64_t v36 = [*(id *)(a1 + 32) utteranceCellAtIndexPath:*(void *)&v13];
        v40 = [*(id *)(a1 + 32) tableView];
        [v40 bounds];
        +[RTTUIUtteranceCell heightForUtterance:v12 andWidth:CGRectGetWidth(v61)];
        double v42 = v41;

        [v36 updateUtterance:v12];
        if (v42 != v7)
        {
          uint64_t v43 = AXLogRTT();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id buf = 134218240;
            double v54 = v7;
            __int16 v55 = 2048;
            double v56 = v42;
            _os_log_impl(&dword_222978000, v43, OS_LOG_TYPE_INFO, "Updating utterance cell height from %f to %f", buf, 0x16u);
          }

          if (v13 != 0.0) {
            [*(id *)(a1 + 32) _updateTableViewRowAtIndexPath:*(void *)&v13 action:0 animation:0];
          }
        }
        if (*(double *)&v36 != 0.0) {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
      }
      else
      {
        [*(id *)(a1 + 32) _updateTableViewRowAtIndexPath:*(void *)&v13 action:2 animation:1];
        if (v32)
        {
          uint64_t v38 = *(void *)(a1 + 56);
          uint64_t v39 = [MEMORY[0x263F088C8] indexPathForRow:v32 - 1 inSection:0];
          (*(void (**)(uint64_t, void *, uint64_t))(v38 + 16))(v38, v39, 1);
        }
        AXLogRTT();
        *(double *)&uint64_t v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id buf = 138412290;
          double v54 = v13;
          _os_log_impl(&dword_222978000, v36, OS_LOG_TYPE_INFO, "Deleting row: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      *(double *)&uint64_t v36 = [MEMORY[0x263F088C8] indexPathForRow:v32 - 1 inSection:0];
      [*(id *)(a1 + 32) _updateTableViewRowAtIndexPath:v36 action:1 animation:2];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      v37 = AXLogRTT();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id buf = 138412290;
        double v54 = *(double *)&v36;
        _os_log_impl(&dword_222978000, v37, OS_LOG_TYPE_INFO, "Inserting row: %@", buf, 0xCu);
      }
    }
LABEL_35:
    if ([v12 isComplete])
    {
      uint64_t v44 = [*(id *)(a1 + 32) call];
      if ([v44 ttyType] != 2)
      {
LABEL_39:

        goto LABEL_40;
      }
      v45 = [*(id *)(a1 + 32) conversation];
      uint64_t v46 = [v45 utteranceCountForMe:1];

      if (!v46)
      {
        v47 = NSString;
        v48 = ttyLocString();
        v49 = [*(id *)(a1 + 32) call];
        BOOL v50 = [v49 handle];
        int v51 = [v50 value];
        uint64_t v44 = objc_msgSend(v47, "stringWithFormat:", v48, v51);

        v52 = +[RTTUIConversationControllerCoordinator sharedInstance];
        [v52 sendNewUtteranceString:v44 controller:*(void *)(a1 + 32)];

        goto LABEL_39;
      }
    }
LABEL_40:
    [*(id *)(a1 + 32) updateTableViewSizeAnimated:0];
    goto LABEL_41;
  }
  BOOL v35 = AXLogRTT();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_222978000, v35, OS_LOG_TYPE_INFO, "Not adding received string for utterance to table view because screen is locked", buf, 2u);
  }

LABEL_41:
}

- (void)gaButtonPressed:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(RTTUIConversationViewController *)self textViewUtterance];
    int v11 = 138412290;
    double v12 = v5;
    _os_log_impl(&dword_222978000, v4, OS_LOG_TYPE_INFO, "GA button pressed: %@", (uint8_t *)&v11, 0xCu);
  }
  double v6 = [(RTTUIConversationViewController *)self textViewUtterance];
  if ([v6 length])
  {
    double v7 = [MEMORY[0x263F62AF8] sharedInstance];
    char v8 = [v7 ttyShouldBeRealtime];

    if ((v8 & 1) == 0)
    {
      id v9 = +[RTTUIConversationControllerCoordinator sharedInstance];
      unint64_t v10 = [(RTTUIConversationViewController *)self textViewUtterance];
      [v9 sendNewUtteranceString:v10 controller:self];

      [(RTTUIConversationViewController *)self setTextViewUtterance:&stru_26D51E848];
      [(RTTUIConversationViewController *)self setCurrentUtterance:0];
      [(RTTUIConversationViewController *)self updateTableViewSizeAnimated:1];
    }
  }
  else
  {
  }
}

- (id)lastConversationRowPathForUtterance:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F088C8];
  id v5 = a3;
  double v6 = [(RTTUIConversationViewController *)self conversation];
  double v7 = [v6 utterances];
  uint64_t v8 = [v7 indexOfObjectIdenticalTo:v5];

  id v9 = [v4 indexPathForRow:v8 inSection:0];

  return v9;
}

- (void)realtimeTextDidChange
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [(RTTUIConversationViewController *)self currentUtterance];
  BOOL v4 = [(RTTUIConversationViewController *)self lastConversationRowPathForUtterance:v3];
  id v5 = +[RTTUIConversationControllerCoordinator sharedInstance];
  int v6 = [v5 realtimeTextDidChange:self forUtterance:v3 lastRowPath:v4];

  double v7 = AXLogRTT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 67109634;
    *(_DWORD *)uint64_t v36 = v6;
    *(_WORD *)&v36[4] = 2112;
    *(void *)&v36[6] = v3;
    *(_WORD *)&v36[14] = 2112;
    *(void *)&v36[16] = v4;
    _os_log_impl(&dword_222978000, v7, OS_LOG_TYPE_INFO, "Real time text changed: %d, utterance: %@, path: %@", buf, 0x1Cu);
  }

  if (v6)
  {
    uint64_t v8 = AXLogRTT();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [v3 hasTimedOut];
      *(_DWORD *)id buf = 138412546;
      *(void *)uint64_t v36 = v3;
      *(_WORD *)&v36[8] = 1024;
      *(_DWORD *)&v36[10] = v9;
      _os_log_impl(&dword_222978000, v8, OS_LOG_TYPE_INFO, "Realtime text changed. Last utterance: %@, timeout: %d", buf, 0x12u);
    }

    if ([v3 isMe] && (objc_msgSend(v3, "hasTimedOut") & 1) == 0)
    {
      double v20 = [(RTTUIConversationViewController *)self tableView];
      double v21 = [v20 cellForRowAtIndexPath:v4];

      [v21 updateUtterance:v3];
      [v21 bounds];
      double Height = CGRectGetHeight(v38);
      CGFloat v23 = [v21 utterance];
      uint32_t v24 = [(RTTUIConversationViewController *)self tableView];
      [v24 bounds];
      +[RTTUIUtteranceCell heightForUtterance:v23 andWidth:CGRectGetWidth(v39)];
      double v26 = v25;

      if (Height != v26) {
        [(RTTUIConversationViewController *)self utteranceCellDidUpdateContent:v21];
      }
      double v27 = AXLogRTT();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id buf = 138412546;
        *(void *)uint64_t v36 = v21;
        *(_WORD *)&v36[8] = 2112;
        *(void *)&v36[10] = v3;
        _os_log_impl(&dword_222978000, v27, OS_LOG_TYPE_INFO, "Updating utterance since it's still me: %@ %@", buf, 0x16u);
      }

      CGFloat v28 = [v3 text];
      uint64_t v29 = [v28 length];

      if (!v29)
      {
        double v30 = [(RTTUIConversationViewController *)self conversation];
        double v31 = [v30 utterances];
        [v31 removeObject:v3];

        [(RTTUIConversationViewController *)self setCurrentUtterance:0];
        if (v4 && [v4 row] != 0x7FFFFFFFFFFFFFFFLL) {
          [(RTTUIConversationViewController *)self _updateTableViewRowAtIndexPath:v4 action:2 animation:1];
        }
        unint64_t v32 = AXLogRTT();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id buf = 138412290;
          *(void *)uint64_t v36 = v3;
          _os_log_impl(&dword_222978000, v32, OS_LOG_TYPE_INFO, "Deleting utterance since text length was empty: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      unint64_t v10 = [(RTTUIConversationViewController *)self textViewUtterance];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        double v12 = AXLogRTT();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = [(RTTUIConversationViewController *)self textViewUtterance];
          *(_DWORD *)id buf = 138412546;
          *(void *)uint64_t v36 = v13;
          *(_WORD *)&v36[8] = 2112;
          *(void *)&v36[10] = self;
          _os_log_impl(&dword_222978000, v12, OS_LOG_TYPE_INFO, "Sending updated utterance: %@, from %@", buf, 0x16u);
        }
        uint64_t v14 = +[RTTUIConversationControllerCoordinator sharedInstance];
        double v15 = [(RTTUIConversationViewController *)self textViewUtterance];
        [v14 sendNewUtteranceString:v15 controller:self];

        double v16 = [(RTTUIConversationViewController *)self conversation];
        id v17 = [v16 lastUtteranceForMe:1];
        [(RTTUIConversationViewController *)self setCurrentUtterance:v17];

        __int16 v18 = AXLogRTT();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = [(RTTUIConversationViewController *)self currentUtterance];
          *(_DWORD *)id buf = 138412290;
          *(void *)uint64_t v36 = v19;
          _os_log_impl(&dword_222978000, v18, OS_LOG_TYPE_INFO, "Updating current utterance to last utterance from me: %@", buf, 0xCu);
        }
        [(RTTUIConversationViewController *)self updateTableViewSizeAnimated:1];
      }
    }
  }
  realTimeTimeout = self->_realTimeTimeout;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __56__RTTUIConversationViewController_realtimeTextDidChange__block_invoke;
  v34[3] = &unk_264638690;
  v34[4] = self;
  [(AXDispatchTimer *)realTimeTimeout afterDelay:v34 processBlock:3.0];
}

uint64_t __56__RTTUIConversationViewController_realtimeTextDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processRealtimeTimeout];
}

- (void)_processRealtimeTimeout
{
  id v3 = [(RTTUIConversationViewController *)self currentUtterance];
  if ([v3 hasTimedOut])
  {
    [(RTTUIConversationViewController *)self setCurrentUtterance:0];
    [(RTTUIConversationViewController *)self setTextViewUtterance:&stru_26D51E848];
  }
}

- (void)updateGAButton
{
  if (self->_gaButton) {
    goto LABEL_2;
  }
  int v6 = [(RTTUIConversationViewController *)self call];
  BOOL v7 = +[RTTUIUtilities ttyShouldBeRealtimeForCall:v6];

  if (!v7)
  {
    uint64_t v8 = (UIButton *)objc_msgSend(objc_alloc(MEMORY[0x263F1C488]), "initWithFrame:", 0.0, 0.0, 40.0, 35.0);
    gaButton = self->_gaButton;
    self->_gaButton = v8;

    unint64_t v10 = ttyImageNamed(@"TTYSend");
    if (soft_AXProcessIsRTTNotificationContentExtension()) {
      [MEMORY[0x263F1C550] labelColor];
    }
    else {
    uint64_t v11 = [MEMORY[0x263F1C550] systemWhiteColor];
    }
    id v5 = [v10 imageWithTintColor:v11];

    [(UIButton *)self->_gaButton setImage:v5 forState:0];
    [(UIButton *)self->_gaButton addTarget:self action:sel_gaButtonPressed_ forControlEvents:64];
    double v12 = self->_gaButton;
    uint64_t v13 = ttyLocString();
    [(UIButton *)v12 setAccessibilityLabel:v13];

    uint64_t v14 = [(RTTUIConversationViewController *)self view];
    [v14 addSubview:self->_gaButton];

LABEL_11:
    goto LABEL_12;
  }
  if (self->_gaButton)
  {
LABEL_2:
    id v3 = [(RTTUIConversationViewController *)self call];
    BOOL v4 = +[RTTUIUtilities ttyShouldBeRealtimeForCall:v3];

    if (!v4) {
      goto LABEL_12;
    }
    [(UIButton *)self->_gaButton removeFromSuperview];
    id v5 = self->_gaButton;
    self->_gaButton = 0;
    goto LABEL_11;
  }
LABEL_12:
  [(RTTUIConversationViewController *)self updateInputEnabled];
}

- (void)updateTableViewSizeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(RTTUIConversationViewController *)self updateGAButton];
  id v5 = [MEMORY[0x263F1C760] activeKeyboardSceneDelegate];
  [v5 visibleFrameInView:0];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;

  v60.origin.x = v7;
  v60.origin.y = v9;
  v60.size.width = v11;
  v60.size.height = v13;
  double MinY = CGRectGetMinY(v60);
  uint64_t v56 = 0;
  __int16 v57 = &v56;
  uint64_t v58 = 0x2020000000;
  double v15 = (unsigned int (*)(void))getAXUIKeyboardIsOnScreenSymbolLoc_ptr;
  uint64_t v59 = getAXUIKeyboardIsOnScreenSymbolLoc_ptr;
  if (!getAXUIKeyboardIsOnScreenSymbolLoc_ptr)
  {
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __getAXUIKeyboardIsOnScreenSymbolLoc_block_invoke;
    v55[3] = &unk_2646386E0;
    v55[4] = &v56;
    __getAXUIKeyboardIsOnScreenSymbolLoc_block_invoke((uint64_t)v55);
    double v15 = (unsigned int (*)(void))v57[3];
  }
  _Block_object_dispose(&v56, 8);
  if (!v15)
  {
    v53 = (_Unwind_Exception *)-[RTTUIConversationControllerCoordinator registerForCallUpdates:]();
    _Block_object_dispose(&v56, 8);
    _Unwind_Resume(v53);
  }
  if (!v15() || v13 == 0.0 || ([(RTTUITextView *)self->_textView isFirstResponder] & 1) == 0)
  {
    double v16 = [(RTTUIConversationViewController *)self view];
    [v16 bounds];
    double v18 = v17;
    id v19 = [(RTTUIConversationViewController *)self view];
    double v20 = [v19 window];
    [v20 safeAreaInsets];
    double MinY = v18 - v21;
  }
  [(RTTUITextView *)self->_textView frame];
  uint64_t v23 = v22;
  double v25 = v24;
  if (([MEMORY[0x263F472B0] deviceHasHomeButton] & 1) == 0
    && [MEMORY[0x263F472B0] deviceIsPhone])
  {
    double v26 = [(RTTUIConversationViewController *)self view];
    double v27 = [v26 window];
    CGFloat v28 = [v27 windowScene];
    uint64_t v29 = [v28 statusBarManager];
    [v29 statusBarFrame];
    CGRectGetHeight(v61);
  }
  double v30 = +[RTTUIUtilities sharedUtilityProvider];
  [v30 bubbleInsetForMe:1];
  double v32 = v31;
  double v34 = v33;

  BOOL v35 = (void *)MEMORY[0x263F62B08];
  uint64_t v36 = [(RTTUIConversationViewController *)self currentContactPath];
  uint64_t v37 = [(RTTUIConversationViewController *)self textViewUtterance];
  CGRect v38 = [v35 utteranceWithContactPath:v36 andText:v37];
  CGRect v39 = [(RTTUIConversationViewController *)self view];
  [v39 bounds];
  +[RTTUIUtteranceCell heightForUtterance:v38 andWidth:CGRectGetWidth(v62) + 20.0];
  double v41 = v34 + v32 + v40;

  if (soft_AXProcessIsRTTNotificationContentExtension())
  {
    double v42 = [(RTTUIConversationViewController *)self view];
    [v42 bounds];
    double v44 = v43 - v41 + -5.0;

    v45 = [(RTTUIConversationViewController *)self view];
    [v45 bounds];
    double v25 = v46 + -5.0;
  }
  else
  {
    [(RTTUITextView *)self->_textView ttyBarHeight];
    double v44 = MinY - (v41 + v47 + 5.0);
  }
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __63__RTTUIConversationViewController_updateTableViewSizeAnimated___block_invoke;
  v54[3] = &unk_2646388F8;
  v54[4] = self;
  v54[5] = v23;
  *(double *)&v54[6] = v44;
  *(double *)&v54[7] = v25;
  *(double *)&v54[8] = v41;
  uint64_t v48 = MEMORY[0x223CA2070](v54);
  v49 = (void *)v48;
  if (v3) {
    [MEMORY[0x263F1CB60] animateWithDuration:v48 animations:0.2];
  }
  else {
    (*(void (**)(uint64_t))(v48 + 16))(v48);
  }
  BOOL v50 = [(RTTUIConversationViewController *)self tableView];
  uint64_t v51 = [v50 numberOfRowsInSection:0];

  if (v51)
  {
    v52 = [MEMORY[0x263F088C8] indexPathForRow:v51 - 1 inSection:0];
    [(RTTUIConversationViewController *)self _scrollToIndexPathIfNecessary:v52 animated:v3];
  }
}

uint64_t __63__RTTUIConversationViewController_updateTableViewSizeAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 984);
  BOOL v4 = (void *)MEMORY[0x263F1C478];
  id v5 = [*(id *)(v2 + 976) layer];
  [v5 bounds];
  objc_msgSend(v4, "bezierPathWithRoundedRect:cornerRadius:", v6 + 15.0, v7 + 2.0, v8 + -30.0, v9 + -4.0, 20.0);
  id v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPath:", objc_msgSend(v10, "CGPath"));

  CGFloat v11 = *(void **)(*(void *)(a1 + 32) + 976);
  double v12 = [v11 beginningOfDocument];
  [v11 caretRectForPosition:v12];
  double v14 = v13;

  double v15 = v14 + v14;
  v41.origin.x = *(CGFloat *)(a1 + 40);
  v41.origin.y = *(CGFloat *)(a1 + 48);
  v41.size.width = *(CGFloat *)(a1 + 56);
  double v16 = *(double *)(a1 + 64);
  v41.size.height = v16;
  double MaxY = CGRectGetMaxY(v41);
  if (v15 <= v16)
  {
    double v19 = MaxY + -40.0;
    double v18 = *(double *)(a1 + 64);
  }
  else
  {
    double v18 = *(double *)(a1 + 64);
    double v19 = MaxY + v18 * -0.5 + -17.5;
  }
  uint64_t v20 = *(void *)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v22 = *(void *)(a1 + 56);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setFrame:", CGRectGetWidth(*(CGRect *)(&v18 - 3)) + -55.0, v19, 40.0, 35.0);
  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 992) titleLabel];
  [v23 setHidden:0];

  double v24 = [*(id *)(a1 + 32) view];
  [v24 bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double MinY = v31;

  double v33 = [*(id *)(a1 + 32) call];
  int v34 = [v33 isConnected];

  if (v34) {
    double MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
  }
  BOOL v35 = [*(id *)(a1 + 32) tableView];
  objc_msgSend(v35, "setFrame:", v26, v28, v30, MinY);

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "setHidden:", objc_msgSend(*(id *)(a1 + 32), "showTextViewForCurrentCall") ^ 1);
  uint64_t v36 = *(void **)(a1 + 32);
  uint64_t v37 = (void *)v36[124];
  uint64_t v38 = [v36 showTextViewForCurrentCall] ^ 1;
  return [v37 setHidden:v38];
}

- (void)setupTableView
{
  BOOL v3 = [MEMORY[0x263F62AE8] sharedInstance];
  objc_msgSend(v3, "setShouldSuppressIncomingNotification:", -[RTTUIConversationViewController isCurrentCallConnected](self, "isCurrentCallConnected"));

  BOOL v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_updateViewForKeyboard_ name:*MEMORY[0x263F1D488] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_updateViewForKeyboard_ name:*MEMORY[0x263F1D480] object:0];

  id v50 = [(RTTUIConversationViewController *)self contactDisplayString];
  -[RTTUIConversationViewController setTitle:](self, "setTitle:");
  id v6 = objc_alloc(MEMORY[0x263F1CA40]);
  double v7 = [(RTTUIConversationViewController *)self view];
  [v7 bounds];
  double v8 = objc_msgSend(v6, "initWithFrame:");

  [v8 setDelegate:self];
  [v8 setDataSource:self];
  [v8 setSeparatorStyle:0];
  [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"AXRTTConversationCellIdentifier"];
  int IsRTTNotificationContentExtension = soft_AXProcessIsRTTNotificationContentExtension();
  if (![(RTTUIConversationViewController *)self isCurrentCallConnected]
    || IsRTTNotificationContentExtension)
  {
    id v10 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [v8 setBackgroundColor:v10];
  }
  else
  {
    id v10 = [MEMORY[0x263F1C550] whiteColor];
    CGFloat v11 = [v10 colorWithAlphaComponent:0.001];
    [v8 setBackgroundColor:v11];
  }
  objc_msgSend(v8, "setContentInset:", 15.0, 0.0, 0.0, 0.0);
  [v8 setCanCancelContentTouches:1];
  [(RTTUIConversationViewController *)self setTableView:v8];
  double v12 = [(RTTUIConversationViewController *)self view];
  [v12 addSubview:v8];

  [(UITableView *)self->_tableView reloadData];
  id v13 = objc_alloc(MEMORY[0x263F086A0]);
  double v14 = ttyLocString();
  double v15 = (void *)[v13 initWithString:v14];

  double v16 = [RTTUITextView alloc];
  double v17 = [(RTTUIConversationViewController *)self view];
  [v17 bounds];
  double v18 = -[RTTUITextView initWithFrame:textContainer:](v16, "initWithFrame:textContainer:", 0);
  textView = self->_textView;
  self->_textView = v18;

  uint64_t v20 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [(RTTUITextView *)self->_textView setFont:v20];

  int v21 = soft_AXProcessIsRTTNotificationContentExtension();
  uint64_t v22 = self->_textView;
  if (v21)
  {
    uint64_t v23 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(RTTUITextView *)v22 setBackgroundColor:v23];

    double v24 = self->_textView;
    double v25 = [MEMORY[0x263F1C550] labelColor];
    [(RTTUITextView *)v24 setTextColor:v25];
  }
  else
  {
    double v26 = [MEMORY[0x263F1C550] whiteColor];
    [(RTTUITextView *)v22 setTextColor:v26];

    double v27 = self->_textView;
    double v25 = [MEMORY[0x263F1C550] clearColor];
    [(RTTUITextView *)v27 setBackgroundColor:v25];
  }

  [(RTTUITextView *)self->_textView setDelegate:self];
  double v28 = [(RTTUIConversationViewController *)self view];
  [v28 addSubview:self->_textView];

  double v29 = [(RTTUITextView *)self->_textView textContainer];
  [v29 setLineBreakMode:0];

  double v30 = [(RTTUITextView *)self->_textView textContainer];
  [v30 setMaximumNumberOfLines:0];

  [(RTTUITextView *)self->_textView setDataDetectorTypes:-1];
  [(RTTUITextView *)self->_textView setEditable:1];
  [(RTTUITextView *)self->_textView setSelectable:1];
  double v31 = [(RTTUIConversationViewController *)self call];
  LODWORD(v30) = +[RTTUIUtilities ttyShouldBeRealtimeForCall:v31];

  if (v30) {
    [(RTTUITextView *)self->_textView setInlinePredictionType:1];
  }
  [(RTTUITextView *)self->_textView setScrollEnabled:0];
  -[RTTUITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", 11.0, 24.0, 0.0, 50.0);
  [(RTTUITextView *)self->_textView setAttributedPlaceholder:v15];
  double v32 = self->_textView;
  double v33 = [(RTTUIConversationViewController *)self call];
  -[RTTUITextView setKeyboardType:](v32, "setKeyboardType:", [v33 supportsTTYWithVoice] ^ 1);

  [(RTTUITextView *)self->_textView setAutoresizingMask:2];
  id v34 = objc_alloc_init(MEMORY[0x263F15880]);
  BOOL v35 = [MEMORY[0x263F1C550] clearColor];
  objc_msgSend(v34, "setFillColor:", objc_msgSend(v35, "cgColor"));

  uint64_t v36 = (void *)MEMORY[0x263F1C478];
  uint64_t v37 = [(RTTUITextView *)self->_textView layer];
  [v37 bounds];
  objc_msgSend(v36, "bezierPathWithRect:");
  id v38 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPath:", objc_msgSend(v38, "CGPath"));

  CGRect v39 = [(RTTUITextView *)self->_textView layer];
  [v39 insertSublayer:v34 atIndex:0];

  double v40 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
  bubbleLayer = self->_bubbleLayer;
  self->_bubbleLayer = v40;

  double v42 = self->_bubbleLayer;
  double v43 = [MEMORY[0x263F1C550] clearColor];
  -[CAShapeLayer setFillColor:](v42, "setFillColor:", [v43 cgColor]);

  double v44 = self->_bubbleLayer;
  v45 = [MEMORY[0x263F1C550] grayColor];
  -[CAShapeLayer setStrokeColor:](v44, "setStrokeColor:", [v45 cgColor]);

  double v46 = self->_bubbleLayer;
  double v47 = (void *)MEMORY[0x263F1C478];
  uint64_t v48 = [(RTTUITextView *)self->_textView layer];
  [v48 bounds];
  CGRect v53 = CGRectInset(v52, 5.0, 5.0);
  objc_msgSend(v47, "bezierPathWithRoundedRect:cornerRadius:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height, 15.0);
  id v49 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](v46, "setPath:", [v49 CGPath]);

  [v34 addSublayer:self->_bubbleLayer];
  [(RTTUIConversationViewController *)self updateViewForKeyboard:0];
}

- (void)shareCallInfo:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = +[RTTUIUtilities sharedUtilityProvider];
  double v7 = [(RTTUIConversationViewController *)self conversation];
  double v8 = [v6 transcriptStringForConversation:v7];
  [v5 setTranscript:v8];

  id v9 = objc_alloc(MEMORY[0x263F1C3E8]);
  v13[0] = v5;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  CGFloat v11 = (void *)[v9 initWithActivityItems:v10 applicationActivities:0];

  double v12 = [v11 popoverPresentationController];
  [v12 setSourceView:v4];

  [(RTTUIConversationViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)updateViewForKeyboard:(id)a3
{
}

uint64_t __57__RTTUIConversationViewController_updateViewForKeyboard___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTableViewSizeAnimated:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 3)
  {
    double v12 = [(RTTUIConversationViewController *)self cannedResponses];
    int64_t v9 = [v12 count];
  }
  else if (a4 == 1)
  {
    int64_t v9 = [(NSMutableArray *)self->_serviceUpdates count];
  }
  else if (a4)
  {
    int64_t v9 = 0;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F62AF0]);
    double v8 = (void *)[v7 initWithServiceUpdateType:*MEMORY[0x263F62B30] options:0];
    int64_t v9 = 0;
    if (([(NSMutableArray *)self->_serviceUpdates containsObject:v8] & 1) == 0)
    {
      id v10 = [(RTTUIConversationViewController *)self conversation];
      CGFloat v11 = [v10 utterances];
      int64_t v9 = [v11 count];
    }
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(RTTUIConversationViewController *)self conversation];
  id v7 = [v6 utterances];

  double v8 = [(RTTUIConversationViewController *)self cannedResponses];
  unint64_t v9 = [v5 row];
  double v10 = 20.0;
  switch([v5 section])
  {
    case 0:
      if (v9 < [v7 count])
      {
        CGFloat v11 = [v7 objectAtIndex:v9];
        double v12 = [(RTTUIConversationViewController *)self tableView];
        [v12 bounds];
        +[RTTUIUtteranceCell heightForUtterance:v11 andWidth:CGRectGetWidth(v23)];
        double v10 = v13;

        goto LABEL_10;
      }
      break;
    case 1:
      -[NSMutableArray objectAtIndex:](self->_serviceUpdates, "objectAtIndex:", [v5 row]);
      CGFloat v11 = (RTTUIResponseCell *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [(RTTUIConversationViewController *)self tableView];
      [v20 bounds];
      +[RTTUIServiceUpdateCell heightForWidth:self delegate:v11 serviceUpdate:CGRectGetWidth(v25)];
      double v10 = v21;

      goto LABEL_10;
    case 2:
      double v10 = 50.0;
      break;
    case 3:
      if (v9 < [v8 count])
      {
        CGFloat v11 = objc_alloc_init(RTTUIResponseCell);
        double v14 = [(RTTUIResponseCell *)v11 textLabel];
        double v15 = [v8 objectAtIndex:v9];
        [v14 setText:v15];

        double v16 = [(RTTUIResponseCell *)v11 textLabel];
        double v17 = [(RTTUIConversationViewController *)self tableView];
        [v17 bounds];
        objc_msgSend(v16, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0, CGRectGetWidth(v24), 3.40282347e38);
        double v19 = v18;

        if (v19 + 25.0 >= 35.0) {
          double v10 = v19 + 25.0;
        }
        else {
          double v10 = 35.0;
        }
LABEL_10:
      }
      break;
    default:
      break;
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 row];
  uint64_t v9 = [v7 section];
  switch(v9)
  {
    case 3:
      double v10 = [v6 dequeueReusableCellWithIdentifier:@"AXRTTUIResponseCellIdentifier"];
      if (!v10) {
        double v10 = [[RTTUIResponseCell alloc] initWithStyle:0 reuseIdentifier:@"AXRTTUIResponseCellIdentifier"];
      }
      double v26 = [(RTTUIConversationViewController *)self cannedResponses];
      unint64_t v27 = [v26 count];

      if (v8 >= v27)
      {
        double v29 = 0;
      }
      else
      {
        double v28 = [(RTTUIConversationViewController *)self cannedResponses];
        double v29 = [v28 objectAtIndex:v8];
      }
      double v30 = [(RTTUIResponseCell *)v10 textLabel];
      [v30 setText:v29];

      if ([(RTTUIConversationViewController *)self isCurrentCallOnHold]) {
        uint64_t v31 = 0;
      }
      else {
        uint64_t v31 = [(RTTUIConversationViewController *)self currentCallIsDowngraded] ^ 1;
      }
      [(RTTUIResponseCell *)v10 setUserInteractionEnabled:v31];
      goto LABEL_23;
    case 1:
      double v29 = -[NSMutableArray objectAtIndex:](self->_serviceUpdates, "objectAtIndex:", [v7 row]);
      double v10 = [[RTTUIServiceUpdateCell alloc] initWithStyle:0 reuseIdentifier:@"AXRTTUIServiceCellIdentifier" serviceUpdate:v29];
      [(RTTUIResponseCell *)v10 setDelegate:self];
LABEL_23:

      goto LABEL_35;
    case 0:
      double v10 = [v6 dequeueReusableCellWithIdentifier:@"AXRTTConversationCellIdentifier" forIndexPath:v7];
      if (!v10) {
        double v10 = [[RTTUIUtteranceCell alloc] initWithStyle:0 reuseIdentifier:@"AXRTTConversationCellIdentifier"];
      }
      CGFloat v11 = [(RTTUIConversationViewController *)self conversation];
      double v12 = [v11 utterances];
      double v43 = [v12 objectAtIndex:v8];

      [(RTTUIResponseCell *)v10 setUtterance:v43];
      [(RTTUIResponseCell *)v10 setDelegate:self];
      double v13 = [(RTTUIConversationViewController *)self call];
      if (+[RTTUIUtilities ttyShouldBeRealtimeForCall:v13])
      {
        double v42 = +[RTTUIConversationControllerCoordinator sharedInstance];
        double v14 = [v42 inProgressRealTimeUtterance];
        double v15 = [v14 contactPath];
        double v16 = [v43 contactPath];
        if ([v15 isEqualToString:v16])
        {
          CGRect v41 = +[RTTUIConversationControllerCoordinator sharedInstance];
          double v40 = [v41 inProgressRealTimeIndexPath];
          if ([v40 isEqual:v7])
          {
            CGRect v39 = +[RTTUIConversationControllerCoordinator sharedInstance];
            id v38 = [v39 inProgressRealTimeUtterance];
            uint64_t v37 = [v38 text];
            double v17 = [v43 text];
            char v36 = [v37 isEqualToString:v17];

            if ((v36 & 1) == 0)
            {
              double v18 = +[RTTUIConversationControllerCoordinator sharedInstance];
              double v19 = [v18 inProgressRealTimeUtterance];
              uint64_t v20 = [v19 text];
              [v43 updateText:v20];

              textView = self->_textView;
              uint64_t v22 = [v43 text];
              [(RTTUITextView *)textView setText:v22];

              [(RTTUIConversationViewController *)self setCurrentUtterance:v43];
              realTimeTimeout = self->_realTimeTimeout;
              v47[0] = MEMORY[0x263EF8330];
              v47[1] = 3221225472;
              v47[2] = __67__RTTUIConversationViewController_tableView_cellForRowAtIndexPath___block_invoke;
              v47[3] = &unk_264638690;
              v47[4] = self;
              [(AXDispatchTimer *)realTimeTimeout afterDelay:v47 processBlock:3.0];
              CGRect v24 = AXLogRTT();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                CGRect v25 = [(RTTUIConversationViewController *)self currentUtterance];
                *(_DWORD *)id buf = 138412290;
                id v49 = v25;
                _os_log_impl(&dword_222978000, v24, OS_LOG_TYPE_INFO, "this cell is not using the right utterance because we have one in flight, swapping with current utterance: %@", buf, 0xCu);
              }
            }
LABEL_27:
            double v32 = [(RTTUIConversationViewController *)self conversation];
            double v33 = [v32 utterances];
            if ([v33 count] - 1 == v8)
            {
              int v34 = [v43 isMe];

              if (!v34)
              {
LABEL_32:
                objc_initWeak((id *)buf, self);
                if (objc_opt_respondsToSelector())
                {
                  v44[0] = MEMORY[0x263EF8330];
                  v44[1] = 3221225472;
                  v44[2] = __67__RTTUIConversationViewController_tableView_cellForRowAtIndexPath___block_invoke_461;
                  v44[3] = &unk_264638920;
                  id v45 = v43;
                  objc_copyWeak(&v46, (id *)buf);
                  [(RTTUIResponseCell *)v10 _setAccessibilityIsRealtimeElementBlock:v44];
                  objc_destroyWeak(&v46);
                }
                objc_destroyWeak((id *)buf);

LABEL_35:
                if (v10) {
                  goto LABEL_37;
                }
                break;
              }
              double v32 = [(RTTUIConversationViewController *)self call];
              -[RTTUIResponseCell setEditingUtterance:](v10, "setEditingUtterance:", [v32 isConnected]);
            }
            else
            {
            }
            goto LABEL_32;
          }
        }
      }

      goto LABEL_27;
  }
  double v10 = [v6 dequeueReusableCellWithIdentifier:@"EmptyCell" forIndexPath:v7];
LABEL_37:

  return v10;
}

uint64_t __67__RTTUIConversationViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processRealtimeTimeout];
}

uint64_t __67__RTTUIConversationViewController_tableView_cellForRowAtIndexPath___block_invoke_461(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isMe]) {
    return 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_msgSend(WeakRetained, "conversation", 0);
  id v5 = [v4 utterances];
  id v6 = [v5 reverseObjectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![v11 isMe])
        {
          uint64_t v2 = [*(id *)(a1 + 32) isEqual:v11];
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v2 = 0;
LABEL_13:

  return v2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 row];
  uint64_t v7 = [v5 section];

  if (v7 == 3)
  {
    uint64_t v8 = [(RTTUIConversationViewController *)self cannedResponses];
    if (v6 < [v8 count])
    {
      uint64_t v9 = [v8 objectAtIndex:v6];
      double v10 = [v9 stringByAppendingString:@" "];

      CGFloat v11 = +[RTTUIConversationControllerCoordinator sharedInstance];
      [v11 sendNewUtteranceString:v10 controller:self];

      AXPerformBlockAsynchronouslyOnMainThread();
    }
  }
}

void __69__RTTUIConversationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tableView];
  uint64_t v3 = [v2 numberOfRowsInSection:0];

  if (v3 >= 1)
  {
    id v5 = [*(id *)(a1 + 32) tableView];
    id v4 = [MEMORY[0x263F088C8] indexPathForRow:v3 - 1 inSection:0];
    [v5 scrollToRowAtIndexPath:v4 atScrollPosition:3 animated:1];
  }
}

- (void)_updateTableViewRowAtIndexPath:(id)a3 action:(int64_t)a4 animation:(int64_t)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v11 = a3;
    uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
    id v9 = a3;
    double v10 = [v8 arrayWithObjects:&v11 count:1];

    -[RTTUIConversationViewController _updateTableViewRowsAtIndexPaths:action:animation:](self, "_updateTableViewRowsAtIndexPaths:action:animation:", v10, a4, a5, v11, v12);
  }
}

- (void)_updateTableViewRowsAtIndexPaths:(id)a3 action:(int64_t)a4 animation:(int64_t)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  if (a4 == 2)
  {
    id v9 = v13;
    double v10 = (id *)&v14;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    id v11 = __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke_3;
  }
  else if (a4 == 1)
  {
    id v9 = v15;
    double v10 = (id *)&v16;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    id v11 = __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke_2;
  }
  else
  {
    if (a4)
    {
      uint64_t v12 = 0;
      goto LABEL_9;
    }
    id v9 = v17;
    double v10 = (id *)&v18;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    id v11 = __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke;
  }
  v9[2] = v11;
  v9[3] = &unk_264638948;
  objc_copyWeak(v10, &location);
  v9[4] = v8;
  v9[6] = a5;
  uint64_t v12 = (void (**)(void))MEMORY[0x223CA2070](v9);

  objc_destroyWeak(v10);
LABEL_9:
  v12[2](v12);
  objc_destroyWeak(&location);
}

void __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained tableView];
  [v2 reloadRowsAtIndexPaths:*(void *)(a1 + 32) withRowAnimation:*(void *)(a1 + 48)];
}

void __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained tableView];
  [v2 insertRowsAtIndexPaths:*(void *)(a1 + 32) withRowAnimation:*(void *)(a1 + 48)];
}

void __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained tableView];
  [v2 deleteRowsAtIndexPaths:*(void *)(a1 + 32) withRowAnimation:*(void *)(a1 + 48)];
}

- (void)utteranceCellDidUpdateContent:(id)a3
{
  id v4 = a3;
  id v5 = [(RTTUIConversationViewController *)self tableView];
  unint64_t v6 = [v5 indexPathForCell:v4];

  if (v6)
  {
    uint64_t v7 = [(RTTUIConversationViewController *)self tableView];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__RTTUIConversationViewController_utteranceCellDidUpdateContent___block_invoke;
    v8[3] = &unk_264638648;
    v8[4] = self;
    id v9 = v6;
    [v7 performBatchUpdates:v8 completion:0];
  }
}

uint64_t __65__RTTUIConversationViewController_utteranceCellDidUpdateContent___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTableViewRowAtIndexPath:*(void *)(a1 + 40) action:0 animation:0];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _scrollToIndexPathIfNecessary:v3 animated:1];
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v7 = a3;
  id v4 = [(RTTUIConversationViewController *)self call];
  if (+[RTTUIUtilities ttyShouldBeRealtimeForCall:v4])
  {
    id v5 = [v7 text];
    uint64_t v6 = [v5 length];

    if (!v6) {
      goto LABEL_5;
    }
    id v4 = [(RTTUIConversationViewController *)self currentUtterance];
    [v4 resetTimeout];
  }

LABEL_5:
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = [(RTTUIConversationViewController *)self call];
  if (!+[RTTUIUtilities ttyShouldBeRealtimeForCall:v11]) {
    goto LABEL_4;
  }
  uint64_t v12 = [v9 text];
  if ([v12 length])
  {

LABEL_4:
    goto LABEL_5;
  }
  uint64_t v24 = [v10 length];

  if (v24)
  {
LABEL_5:
    if (self->_unsupportedCharacterSet)
    {
      NSUInteger v33 = location;
      uint64_t v13 = [v10 length];
      uint64_t v14 = (void *)[v10 mutableCopy];
      if (v13)
      {
        NSUInteger v31 = length;
        double v32 = v9;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        char v17 = 0;
        CFStringRef transform = (const __CFString *)*MEMORY[0x263EFFF58];
        CFStringRef v34 = (const __CFString *)*MEMORY[0x263EFFF48];
        do
        {
          uint64_t v18 = [v10 characterAtIndex:v15];
          if ([(NSMutableCharacterSet *)self->_unsupportedCharacterSet characterIsMember:v18])
          {
            double v19 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v18);
            uint64_t v20 = [(NSDictionary *)self->_asciiSubstitutions objectForKey:v19];
            if (!v20)
            {
              uint64_t v20 = (__CFString *)[v19 mutableCopy];
              CFStringTransform(v20, 0, transform, 0);
              CFStringTransform(v20, 0, v34, 0);
              if (([(__CFString *)v20 isEqualToString:@"?"] & 1) != 0
                || [(__CFString *)v20 isEqualToString:v19])
              {
                [(__CFString *)v20 setString:@" "];
              }
            }
            char v17 = 1;
            objc_msgSend(v14, "replaceCharactersInRange:withString:", v16 + v15, 1, v20);
            uint64_t v16 = v16 + [(__CFString *)v20 length] - 1;
          }
          ++v15;
        }
        while (v13 != v15);
        if (v17)
        {
          id v9 = v32;
          double v21 = [v32 text];
          uint64_t v22 = objc_msgSend(v21, "stringByReplacingCharactersInRange:withString:", v33, v31, v14);

          [v32 setText:v22];
          [(RTTUIConversationViewController *)self textViewDidChange:v32];

          BOOL v23 = 0;
        }
        else
        {
          BOOL v23 = 1;
          id v9 = v32;
        }
      }
      else
      {
        BOOL v23 = 1;
      }
    }
    else
    {
      BOOL v23 = 1;
    }
    goto LABEL_25;
  }
  CGRect v25 = [(RTTUIConversationViewController *)self conversation];
  double v26 = [v25 lastUtteranceForMe:1];

  [v26 resetTimeout];
  unint64_t v27 = [v26 text];
  [(RTTUIConversationViewController *)self setTextViewUtterance:v27];

  [(RTTUIConversationViewController *)self setCurrentUtterance:v26];
  double v28 = AXLogRTT();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    double v29 = [v26 text];
    *(_DWORD *)id buf = 138412290;
    uint64_t v37 = v29;
    _os_log_impl(&dword_222978000, v28, OS_LOG_TYPE_INFO, "Should text view change: %@", buf, 0xCu);
  }
  [(RTTUIConversationViewController *)self realtimeTextDidChange];

  BOOL v23 = 0;
LABEL_25:

  return v23;
}

- (void)textViewDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(RTTUIConversationViewController *)self updateTableViewSizeAnimated:1];
  [(RTTUITextView *)self->_textView setShowTTYPredictions:0];
  ttyPredictionsTimer = self->_ttyPredictionsTimer;
  if (!ttyPredictionsTimer)
  {
    id v6 = objc_alloc(MEMORY[0x263F21398]);
    id v7 = (AXDispatchTimer *)[v6 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    id v8 = self->_ttyPredictionsTimer;
    self->_ttyPredictionsTimer = v7;

    ttyPredictionsTimer = self->_ttyPredictionsTimer;
  }
  [(AXDispatchTimer *)ttyPredictionsTimer cancel];
  objc_initWeak(&location, self);
  id v9 = self->_ttyPredictionsTimer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__RTTUIConversationViewController_textViewDidChange___block_invoke;
  v14[3] = &unk_264638970;
  v14[4] = self;
  objc_copyWeak(&v15, &location);
  [(AXDispatchTimer *)v9 afterDelay:v14 processBlock:1.75];
  id v10 = [(RTTUIConversationViewController *)self call];
  BOOL v11 = +[RTTUIUtilities ttyShouldBeRealtimeForCall:v10];

  if (v11)
  {
    uint64_t v12 = AXLogRTT();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_222978000, v12, OS_LOG_TYPE_INFO, "Text view did change: %@", buf, 0xCu);
    }

    [(RTTUIConversationViewController *)self realtimeTextDidChange];
  }
  dispatch_time_t v13 = dispatch_time(0, 100000000);
  dispatch_after(v13, MEMORY[0x263EF83A0], &__block_literal_global_0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __53__RTTUIConversationViewController_textViewDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) setShowTTYPredictions:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateTableViewSizeAnimated:0];
}

void __53__RTTUIConversationViewController_textViewDidChange___block_invoke_481()
{
}

- (BOOL)utteranceIsSelected
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  [(RTTUITextView *)self->_textView selectedRange];
  if (v3)
  {
    *((unsigned char *)v10 + 24) = 1;
  }
  else if (([(RTTUITextView *)self->_textView isEditing] & 1) == 0)
  {
    id v4 = [(RTTUIConversationViewController *)self tableView];
    id v5 = [v4 visibleCells];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__RTTUIConversationViewController_utteranceIsSelected__block_invoke;
    v8[3] = &unk_2646389B8;
    v8[4] = &v9;
    [v5 enumerateObjectsUsingBlock:v8];
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __54__RTTUIConversationViewController_utteranceIsSelected__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v10;
    [v6 selectedTextRange];
    if (v7)
    {
      [v6 selectedTextRange];
      if (v8)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel__define_ == a3)
  {
    id v6 = [MEMORY[0x263F1C748] sharedInputModeController];
    BOOL v5 = ([v6 deviceStateIsLocked] & 1) == 0
      && [(RTTUIConversationViewController *)self utteranceIsSelected];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RTTUIConversationViewController;
    return -[RTTUIConversationViewController canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_);
  }
  return v5;
}

- (void)_define:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x3032000000;
  double v30 = __Block_byref_object_copy__0;
  NSUInteger v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3010000000;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v24 = &unk_22299784D;
  uint64_t v25 = [(RTTUITextView *)self->_textView selectedRange];
  uint64_t v26 = v5;
  if (v22[5])
  {
    uint64_t v6 = [(RTTUITextView *)self->_textView text];
    uint64_t v7 = (void *)v28[5];
    v28[5] = v6;

    uint64_t v8 = [(RTTUITextView *)self->_textView selectedRange];
    uint64_t v9 = v22;
    v22[4] = v8;
    void v9[5] = v10;
  }
  else
  {
    uint64_t v11 = [(RTTUIConversationViewController *)self tableView];
    char v12 = [v11 visibleCells];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __43__RTTUIConversationViewController__define___block_invoke;
    v20[3] = &unk_2646389E0;
    void v20[4] = &v27;
    v20[5] = &v21;
    [v12 enumerateObjectsUsingBlock:v20];
  }
  if ([(id)v28[5] length])
  {
    [(RTTUIConversationViewController *)self setLookupController:0];
    uint64_t v34 = 0;
    BOOL v35 = &v34;
    uint64_t v36 = 0x2050000000;
    dispatch_time_t v13 = (void *)getDDParsecCollectionViewControllerClass_softClass;
    uint64_t v37 = getDDParsecCollectionViewControllerClass_softClass;
    if (!getDDParsecCollectionViewControllerClass_softClass)
    {
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __getDDParsecCollectionViewControllerClass_block_invoke;
      v33[3] = &unk_2646386E0;
      v33[4] = &v34;
      __getDDParsecCollectionViewControllerClass_block_invoke((uint64_t)v33);
      dispatch_time_t v13 = (void *)v35[3];
    }
    uint64_t v14 = v13;
    _Block_object_dispose(&v34, 8);
    id v15 = [v14 alloc];
    uint64_t v16 = objc_msgSend(v15, "initWithString:range:", v28[5], v22[4], v22[5]);
    [(RTTUIConversationViewController *)self setLookupController:v16];

    char v17 = [(RTTUIConversationViewController *)self lookupController];
    [v17 setModalPresentationStyle:6];

    id v18 = [(RTTUIConversationViewController *)self navigationController];
    uint64_t v19 = [(RTTUIConversationViewController *)self lookupController];
    [v18 presentModalViewController:v19 withTransition:0];
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

uint64_t __43__RTTUIConversationViewController__define___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v17;
    uint64_t v7 = [v6 selectedTextRange];
    if (v8)
    {
      uint64_t v9 = v7;
      uint64_t v10 = v8;
      uint64_t v11 = [v6 utterance];
      uint64_t v12 = [v11 text];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 4UIAccessibilityPostNotification(0x421u, 0) = v12;

      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      *(void *)(v15 + 32) = v9;
      *(void *)(v15 + 4UIAccessibilityPostNotification(0x421u, 0) = v10;
      *a4 = 1;
    }
  }
  return MEMORY[0x270F9A758]();
}

- (RTTConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (id)rttConversationAvailabilityCallback
{
  return self->_rttConversationAvailabilityCallback;
}

- (void)setRttConversationAvailabilityCallback:(id)a3
{
}

- (DDParsecCollectionViewController)lookupController
{
  return self->_lookupController;
}

- (void)setLookupController:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (RTTUtterance)currentUtterance
{
  return self->_currentUtterance;
}

- (void)setCurrentUtterance:(id)a3
{
}

- (TUCall)call
{
  return self->_call;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_currentUtterance, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_lookupController, 0);
  objc_storeStrong(&self->_rttConversationAvailabilityCallback, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_textInputQuickCoalescer, 0);
  objc_storeStrong((id *)&self->_sleepTimerDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_serviceUpdates, 0);
  objc_storeStrong((id *)&self->_voAnnouncementBuffer, 0);
  objc_storeStrong((id *)&self->_voAnnouncementTimer, 0);
  objc_storeStrong((id *)&self->_asciiSubstitutions, 0);
  objc_storeStrong((id *)&self->_unsupportedCharacterSet, 0);
  objc_storeStrong((id *)&self->_muteStatusTimeout, 0);
  objc_storeStrong((id *)&self->_realTimeTimeout, 0);
  objc_storeStrong((id *)&self->_ttyPredictionsTimer, 0);
  objc_storeStrong((id *)&self->_gaButton, 0);
  objc_storeStrong((id *)&self->_bubbleLayer, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

- (void)isCurrentCallReceivingOnHold
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_222978000, log, OS_LOG_TYPE_ERROR, "Call hold status string missing", v1, 2u);
}

- (void)utteranceCellAtIndexPath:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0(v0);
  OUTLINED_FUNCTION_1(&dword_222978000, v2, v3, "Wrong cell type found at index path: %@. Expected update cell, got %@", v4, v5, v6, v7, v8);
}

- (void)serviceUpdateCellAtIndexPath:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0(v0);
  OUTLINED_FUNCTION_1(&dword_222978000, v2, v3, "Wrong cell type found at index path: %@. Expected service cell, got %@", v4, v5, v6, v7, v8);
}

@end