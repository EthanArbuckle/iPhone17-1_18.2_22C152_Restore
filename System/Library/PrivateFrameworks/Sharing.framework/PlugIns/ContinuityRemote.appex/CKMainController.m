@interface CKMainController
- (CRSessionInfo)sessionInfo;
- (NSDictionary)userInfo;
- (SFRemoteAutoFillSession)rafSession;
- (SFRemoteAutoFillSessionHelper)rafHelper;
- (SFRemoteInteractionSession)riSession;
- (SFRemoteTextInputClient)rtiClient;
- (UIStoryboard)mainStoryboard;
- (unsigned)displayMode;
- (unsigned)testFlags;
- (void)_handleRemoteTextEvent:(id)a3;
- (void)_textSessionDidBegin:(id)a3;
- (void)_textSessionDidEnd:(id)a3;
- (void)_updateTextField:(id)a3;
- (void)activateUILockTimer;
- (void)autoFillEnsureActive;
- (void)didReceiveNotification:(id)a3;
- (void)dismissWithDeferral;
- (void)keyboardEnsureActive;
- (void)refreshRTI;
- (void)setDisplayMode:(unsigned int)a3;
- (void)setMainStoryboard:(id)a3;
- (void)setRafHelper:(id)a3;
- (void)setRafSession:(id)a3;
- (void)setRiSession:(id)a3;
- (void)setRtiClient:(id)a3;
- (void)setSessionInfo:(id)a3;
- (void)setTestFlags:(unsigned int)a3;
- (void)setUserInfo:(id)a3;
- (void)showContinuityKeyboardUI;
- (void)showPINEntryUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)showPickerUIWithURLString:(id)a3 bundleID:(id)a4 localizedAppName:(id)a5 unlocalizedAppName:(id)a6 handler:(id)a7;
- (void)transitionToViewControllerWhenReady:(id)a3;
- (void)update;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKMainController

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v30.receiver = self;
  v30.super_class = (Class)CKMainController;
  [(CKMainController *)&v30 viewDidAppear:v3];
  self->_uiLockActive = 1;
  v5 = +[UIStoryboard storyboardWithName:@"ContinuityKeyboard" bundle:0];
  mainStoryboard = self->_mainStoryboard;
  self->_mainStoryboard = v5;

  v7 = [(UIStoryboard *)self->_mainStoryboard instantiateInitialViewController];
  vcNav = self->_vcNav;
  self->_vcNav = v7;

  [(CKCommonNavController *)self->_vcNav setModalPresentationStyle:2];
  [(CKCommonNavController *)self->_vcNav setModalTransitionStyle:2];
  v9 = [(CKCommonNavController *)self->_vcNav viewControllers];
  v10 = [v9 firstObject];
  vcConnecting = self->_vcConnecting;
  self->_vcConnecting = v10;

  [(CKBaseViewController *)self->_vcConnecting setMainController:self];
  [(CKMainController *)self addChildViewController:self->_vcNav];
  v12 = [(CKMainController *)self view];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(CKCommonNavController *)self->_vcNav view];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = [(CKMainController *)self view];
  v23 = [(CKCommonNavController *)self->_vcNav view];
  [v22 addSubview:v23];

  [(CKCommonNavController *)self->_vcNav didMoveToParentViewController:self];
  v24 = [(CKConnectingViewController *)self->_vcConnecting view];
  objc_msgSend(v24, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v26 = v25;

  v27 = [(CKMainController *)self view];
  [v27 size];
  double v29 = v28;

  -[CKMainController setPreferredContentSize:](self, "setPreferredContentSize:", v29, v26);
  -[CKCommonNavController setPreferredContentSize:](self->_vcNav, "setPreferredContentSize:", v29, v26);
  [(CKMainController *)self activateUILockTimer];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFRemoteTextInputClient *)self->_rtiClient invalidate];
  [(SFRemoteInteractionSession *)self->_riSession invalidate];
  if (!self->_paired) {
    [(SFRemoteAutoFillSessionHelper *)self->_rafHelper serverUserNotificationDidDismiss:self->_deviceID];
  }
  [(SFRemoteAutoFillSessionHelper *)self->_rafHelper invalidate];
  uiLockTimer = self->_uiLockTimer;
  if (uiLockTimer)
  {
    v6 = uiLockTimer;
    dispatch_source_cancel(v6);
    v7 = self->_uiLockTimer;
    self->_uiLockTimer = 0;
  }
  [(CKBaseViewController *)self->_vcConnecting setMainController:0];
  vcConnecting = self->_vcConnecting;
  self->_vcConnecting = 0;

  vcDeferred = self->_vcDeferred;
  self->_vcDeferred = 0;

  [(CKBaseViewController *)self->_vcKeyboard setMainController:0];
  vcKeyboard = self->_vcKeyboard;
  self->_vcKeyboard = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  v12.receiver = self;
  v12.super_class = (Class)CKMainController;
  [(CKMainController *)&v12 viewWillDisappear:v3];
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  v5 = +[CRSessionInfo sessionInfoWithNotification:v4];
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    double v14 = [v5 deviceIdentifier];
    LogPrintF();
  }
  v6 = objc_msgSend(v4, "request", v14);
  v7 = [v6 content];
  v8 = [v7 userInfo];

  uint64_t Int64 = CFDictionaryGetInt64();
  if (v5)
  {
    objc_storeStrong((id *)&self->_sessionInfo, v5);
    self->_testFlags = 0;
    v10 = [(CRSessionInfo *)self->_sessionInfo deviceIdentifier];
    if ([v10 isEqualToString:@"00000000-0000-0000-0000-000000000001"]) {
      self->_testFlags |= 1u;
    }
    if ([v10 isEqualToString:@"00000000-0000-0000-0000-000000000002"]) {
      self->_testFlags |= 2u;
    }
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
    objc_super v12 = v11;
    if (!v11)
    {
      objc_super v12 = +[NSUUID UUID];
    }
    objc_storeStrong((id *)&self->_deviceID, v12);
    if (!v11) {
  }
    }
  else if (gLogCategory_ContinuityKeyboard <= 60 {
         && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  }
  {
    id v15 = v4;
    LogPrintF();
  }
  if (Int64) {
    unsigned int v13 = 1;
  }
  else {
    unsigned int v13 = 2;
  }
  self->_displayMode = v13;
  [(CKMainController *)self update];
}

- (void)dismissWithDeferral
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dismissTimer = self->_dismissTimer;
  if (dismissTimer)
  {
    id v4 = dismissTimer;
    dispatch_source_cancel(v4);
    v5 = self->_dismissTimer;
    self->_dismissTimer = 0;
  }
  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  v7 = self->_dismissTimer;
  self->_dismissTimer = v6;

  v8 = self->_dismissTimer;
  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
  v10 = self->_dismissTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003D88;
  handler[3] = &unk_10000C2A0;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_dismissTimer);
}

- (void)update
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  unsigned int displayMode = self->_displayMode;
  if (displayMode == 2)
  {
    [(CKMainController *)self keyboardEnsureActive];
  }
  else if (displayMode == 1)
  {
    [(CKMainController *)self autoFillEnsureActive];
  }
  else if (gLogCategory_ContinuityKeyboard <= 60 {
         && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)autoFillEnsureActive
{
  BOOL v3 = [(CRSessionInfo *)self->_sessionInfo deviceIdentifier];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  if (!self->_rafHelper)
  {
    v5 = (SFRemoteAutoFillSessionHelper *)objc_alloc_init((Class)SFRemoteAutoFillSessionHelper);
    rafHelper = self->_rafHelper;
    self->_rafHelper = v5;

    [(SFRemoteAutoFillSessionHelper *)self->_rafHelper setInterruptionHandler:&stru_10000C2E0];
    [(SFRemoteAutoFillSessionHelper *)self->_rafHelper setInvalidationHandler:&stru_10000C300];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000042B4;
    v11[3] = &unk_10000C2A0;
    v11[4] = self;
    [(SFRemoteAutoFillSessionHelper *)self->_rafHelper setDismissUserNotificationHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000042BC;
    v10[3] = &unk_10000C350;
    v10[4] = self;
    [(SFRemoteAutoFillSessionHelper *)self->_rafHelper setPairingResponseHandler:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004458;
    v9[3] = &unk_10000C378;
    v9[4] = self;
    [(SFRemoteAutoFillSessionHelper *)self->_rafHelper setPromptForPINHandler:v9];
    v7 = self->_rafHelper;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004468;
    v8[3] = &unk_10000C3A0;
    v8[4] = self;
    v8[5] = v4;
    [(SFRemoteAutoFillSessionHelper *)v7 activateWithCompletion:v8];
  }
}

- (void)keyboardEnsureActive
{
  BOOL v3 = [(CRSessionInfo *)self->_sessionInfo deviceIdentifier];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  v5 = v4;
  if (self->_riSession) {
    goto LABEL_11;
  }
  if (!self->_sessionInfo)
  {
    if (gLogCategory_ContinuityKeyboard > 10
      || gLogCategory_ContinuityKeyboard == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_11;
    }
LABEL_17:
    LogPrintF();
    goto LABEL_11;
  }
  if (!v4)
  {
    if (gLogCategory_ContinuityKeyboard > 60
      || gLogCategory_ContinuityKeyboard == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if ([v3 isEqualToString:@"00000000-0000-0000-0000-000000000001"]) {
    self->_testFlags |= 4u;
  }
  id v6 = objc_alloc_init((Class)SFDevice);
  [v6 setIdentifier:v5];
  v7 = (SFRemoteInteractionSession *)objc_alloc_init((Class)SFRemoteInteractionSession);
  riSession = self->_riSession;
  self->_riSession = v7;

  [(SFRemoteInteractionSession *)self->_riSession setPeerDevice:v6];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000048B0;
  v15[3] = &unk_10000C3C8;
  v15[4] = self;
  [(SFRemoteInteractionSession *)self->_riSession setRemoteTextEventHandler:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004920;
  v14[3] = &unk_10000C3F0;
  v14[4] = self;
  [(SFRemoteInteractionSession *)self->_riSession setTextSessionDidBegin:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004990;
  v13[3] = &unk_10000C3F0;
  v13[4] = self;
  [(SFRemoteInteractionSession *)self->_riSession setTextSessionDidEnd:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000499C;
  v12[3] = &unk_10000C3F0;
  v12[4] = self;
  [(SFRemoteInteractionSession *)self->_riSession setTextSessionDidChange:v12];
  [(SFRemoteInteractionSession *)self->_riSession activateWithCompletion:&stru_10000C430];
  dispatch_time_t v9 = (SFRemoteTextInputClient *)objc_alloc_init((Class)SFRemoteTextInputClient);
  rtiClient = self->_rtiClient;
  self->_rtiClient = v9;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004A90;
  v11[3] = &unk_10000C3C8;
  v11[4] = self;
  [(SFRemoteTextInputClient *)self->_rtiClient setEventHandler:v11];
  [(SFRemoteTextInputClient *)self->_rtiClient activate];

LABEL_11:
}

- (void)refreshRTI
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rtiClient = self->_rtiClient;
  cachedRTIData = self->_cachedRTIData;

  [(SFRemoteTextInputClient *)rtiClient handleTextInputData:cachedRTIData];
}

- (void)activateUILockTimer
{
  if (!self->_uiLockTimer)
  {
    BOOL v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    uiLockTimer = self->_uiLockTimer;
    self->_uiLockTimer = v3;

    v5 = self->_uiLockTimer;
    dispatch_time_t v6 = dispatch_time(0, 400000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
    v7 = self->_uiLockTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100004CE8;
    handler[3] = &unk_10000C2A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_uiLockTimer);
  }
}

- (void)showContinuityKeyboardUI
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  vcKeyboard = self->_vcKeyboard;
  if (!vcKeyboard)
  {
    id v4 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"Keyboard"];
    v5 = self->_vcKeyboard;
    self->_vcKeyboard = v4;

    [(CKBaseViewController *)self->_vcKeyboard setMainController:self];
    vcKeyboard = self->_vcKeyboard;
  }

  [(CKMainController *)self transitionToViewControllerWhenReady:vcKeyboard];
}

- (void)showPickerUIWithURLString:(id)a3 bundleID:(id)a4 localizedAppName:(id)a5 unlocalizedAppName:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v12;
  if (v17)
  {
    double v18 = +[NSURL URLWithString:v17];
  }
  else
  {
    double v18 = 0;
  }
  double v19 = (_SFAppAutoFillPasswordViewController *)objc_alloc_init(off_100012080());
  vcPicker = self->_vcPicker;
  self->_vcPicker = v19;

  [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setDelegate:self];
  if (v18) {
    [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setWebViewURL:v18];
  }
  if (v13) {
    [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setRemoteAppID:v13];
  }
  if (v14) {
    [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setRemoteLocalizedAppName:v14];
  }
  if (v15) {
    [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setRemoteUnlocalizedAppName:v15];
  }
  [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setAuthenticationGracePeriod:45.0];
  v21 = self->_vcPicker;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100005050;
  v22[3] = &unk_10000C458;
  v22[4] = self;
  [(_SFAppAutoFillPasswordViewController *)v21 authenticateToPresentInPopover:0 completion:v22];
}

- (void)showPINEntryUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  vcPINEntry = self->_vcPINEntry;
  if (vcPINEntry)
  {
    [(CKPINEntryViewController *)vcPINEntry showWithFlags:v5 throttleSeconds:v4];
  }
  else
  {
    v8 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"AuthEntry"];
    dispatch_time_t v9 = self->_vcPINEntry;
    self->_vcPINEntry = v8;

    [(CKBaseViewController *)self->_vcPINEntry setMainController:self];
    v10 = self->_vcPINEntry;
    [(CKMainController *)self transitionToViewControllerWhenReady:v10];
  }
}

- (void)transitionToViewControllerWhenReady:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_uiLockActive)
  {
    if (gLogCategory_ContinuityKeyboard <= 30)
    {
      if (gLogCategory_ContinuityKeyboard != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
      {
        LogPrintF();
        id v4 = v8;
      }
    }
    v7 = (UIViewController *)v4;
    vcDeferred = self->_vcDeferred;
    self->_vcDeferred = v7;
  }
  else
  {
    CKTransitionToViewController(self->_vcNav, v4, self);
    vcDeferred = self->_vcDeferred;
    self->_vcDeferred = 0;
  }
}

- (void)_handleRemoteTextEvent:(id)a3
{
  id v19 = a3;
  dismissTimer = self->_dismissTimer;
  if (dismissTimer)
  {
    uint64_t v5 = dismissTimer;
    dispatch_source_cancel(v5);
    int v6 = self->_dismissTimer;
    self->_dismissTimer = 0;
  }
  v7 = (NSDictionary *)[v19 copy];
  cachedRTIData = self->_cachedRTIData;
  self->_cachedRTIData = v7;

  [(SFRemoteTextInputClient *)self->_rtiClient handleTextInputData:v19];
  dispatch_time_t v9 = SFRTIDataPayloadForData();
  if (!v9)
  {
    if (gLogCategory_ContinuityKeyboard > 60
      || gLogCategory_ContinuityKeyboard == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_26;
    }
LABEL_22:
    LogPrintF();
LABEL_26:
    id v17 = 0;
    id v14 = 0;
    id v12 = 0;
    id v16 = 0;
    goto LABEL_14;
  }
  Class v10 = off_100012088();
  id v11 = [v9 data];
  id v12 = -[objc_class payloadWithData:version:](v10, "payloadWithData:version:", v11, [v9 version]);

  if (!v12)
  {
    if (gLogCategory_ContinuityKeyboard > 60
      || gLogCategory_ContinuityKeyboard == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  id v13 = [v12 documentTraits];
  id v14 = [v13 prompt];

  id v15 = [v12 documentTraits];
  id v16 = [v15 title];

  if (!v14)
  {
    id v17 = 0;
LABEL_9:
    if (v16) {
      id v17 = [v16 copy];
    }
    goto LABEL_11;
  }
  id v17 = [v14 copy];
  if (!v17) {
    goto LABEL_9;
  }
LABEL_11:
  if (v17)
  {
    vcKeyboard = self->_vcKeyboard;
    if (vcKeyboard) {
      [(CKKeyboardViewController *)vcKeyboard updatePrompt:v17];
    }
  }
LABEL_14:
}

- (void)_textSessionDidBegin:(id)a3
{
  [(CKMainController *)self _updateTextField:a3];
  dismissTimer = self->_dismissTimer;
  if (dismissTimer)
  {
    int v6 = dismissTimer;
    dispatch_source_cancel(v6);
    uint64_t v5 = self->_dismissTimer;
    self->_dismissTimer = 0;
  }
}

- (void)_textSessionDidEnd:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(CKMainController *)self dismissWithDeferral];
}

- (void)_updateTextField:(id)a3
{
  id v8 = a3;
  id v4 = [(CKKeyboardViewController *)self->_vcKeyboard textField];
  if (v4)
  {
    objc_msgSend(v4, "setKeyboardType:", objc_msgSend(v8, "keyboardType"));
    objc_msgSend(v4, "setReturnKeyType:", objc_msgSend(v8, "returnKeyType"));
    objc_msgSend(v4, "setSecureTextEntry:", objc_msgSend(v8, "secureTextEntry"));
    uint64_t v5 = [v8 text];
    [v4 setText:v5];

    int v6 = [v8 prompt];
    if (v6)
    {
      [v4 setPlaceholder:v6];
    }
    else
    {
      v7 = [v8 title];
      [v4 setPlaceholder:v7];
    }
    [v4 becomeFirstResponder];
  }
  else if (gLogCategory_ContinuityKeyboard <= 60 {
         && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (UIStoryboard)mainStoryboard
{
  return self->_mainStoryboard;
}

- (void)setMainStoryboard:(id)a3
{
}

- (unsigned)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unsigned int)a3
{
  self->_unsigned int displayMode = a3;
}

- (SFRemoteAutoFillSession)rafSession
{
  return self->_rafSession;
}

- (void)setRafSession:(id)a3
{
}

- (SFRemoteAutoFillSessionHelper)rafHelper
{
  return self->_rafHelper;
}

- (void)setRafHelper:(id)a3
{
}

- (SFRemoteInteractionSession)riSession
{
  return self->_riSession;
}

- (void)setRiSession:(id)a3
{
}

- (SFRemoteTextInputClient)rtiClient
{
  return self->_rtiClient;
}

- (void)setRtiClient:(id)a3
{
}

- (CRSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
}

- (unsigned)testFlags
{
  return self->_testFlags;
}

- (void)setTestFlags:(unsigned int)a3
{
  self->_testFlags = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_rtiClient, 0);
  objc_storeStrong((id *)&self->_riSession, 0);
  objc_storeStrong((id *)&self->_rafHelper, 0);
  objc_storeStrong((id *)&self->_rafSession, 0);
  objc_storeStrong((id *)&self->_mainStoryboard, 0);
  objc_storeStrong((id *)&self->_uiLockTimer, 0);
  objc_storeStrong((id *)&self->_vcPINEntry, 0);
  objc_storeStrong((id *)&self->_vcPicker, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcKeyboard, 0);
  objc_storeStrong((id *)&self->_vcDeferred, 0);
  objc_storeStrong((id *)&self->_vcConnecting, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);

  objc_storeStrong((id *)&self->_cachedRTIData, 0);
}

@end