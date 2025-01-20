@interface SFShareAudioViewController
+ (id)instantiateViewController;
- (BOOL)_canShowWhileLocked;
- (NSBundle)mainBundle;
- (SFShareAudioConnectingViewController)vcConnecting;
- (SFShareAudioSessionClient)shareAudioSession;
- (UIStoryboard)mainStoryboard;
- (id)completion;
- (unsigned)flags;
- (void)_reportCompletion:(id)a3 mediaRouteID:(id)a4;
- (void)_sessionProgressEvent:(int)a3 info:(id)a4;
- (void)_sessionStart;
- (void)_showBringClose;
- (void)_showConfirm:(id)a3;
- (void)_showConnecting:(id)a3;
- (void)_showError:(id)a3;
- (void)_showPairInstructions:(id)a3;
- (void)_transitionToViewController:(id)a3 animate:(BOOL)a4;
- (void)reportError:(id)a3;
- (void)reportUserCancelled;
- (void)setCompletion:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setMainBundle:(id)a3;
- (void)setMainStoryboard:(id)a3;
- (void)setShareAudioSession:(id)a3;
- (void)setVcConnecting:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFShareAudioViewController

+ (id)instantiateViewController
{
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Sharing"];
  v3 = [MEMORY[0x263F82C28] storyboardWithName:@"ShareAudioGuest" bundle:v2];
  v4 = [v3 instantiateViewControllerWithIdentifier:@"Main"];
  [v4 setMainBundle:v2];
  [v4 setMainStoryboard:v3];
  [v4 setModalPresentationStyle:6];
  [v4 setModalTransitionStyle:2];
  id v5 = (id)[v4 view];
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)SFShareAudioViewController;
  [(SFShareAudioViewController *)&v5 viewWillAppear:v3];
  [(SFShareAudioViewController *)self _showBringClose];
  [(SFShareAudioViewController *)self _sessionStart];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)SFShareAudioViewController;
  [(SFShareAudioViewController *)&v7 viewWillDisappear:v3];
  [(SFShareAudioSessionClient *)self->_shareAudioSession invalidate];
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0;

  v6 = NSErrorF();
  [(SFShareAudioViewController *)self _reportCompletion:v6 mediaRouteID:0];
}

- (void)_reportCompletion:(id)a3 mediaRouteID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  [(SFShareAudioSessionClient *)self->_shareAudioSession invalidate];
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0;

  v8 = (void (**)(void *, SFSharedAudioDeviceInfo *, void))_Block_copy(self->_completion);
  if (v8)
  {
    id completion = self->_completion;
    self->_id completion = 0;

    if (v6)
    {
      v10 = objc_alloc_init(SFSharedAudioDeviceInfo);
      [(SFSharedAudioDeviceInfo *)v10 setMediaRouteIdentifier:v6];
      v8[2](v8, v10, 0);
LABEL_4:

      goto LABEL_7;
    }
    if (!v11)
    {
      NSErrorF();
      v10 = (SFSharedAudioDeviceInfo *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void *, SFSharedAudioDeviceInfo *, SFSharedAudioDeviceInfo *))v8)[2](v8, 0, v10);
      goto LABEL_4;
    }
    ((void (*)(void (**)(void *, SFSharedAudioDeviceInfo *, void), void))v8[2])(v8, 0);
  }
LABEL_7:
}

- (void)reportError:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (gLogCategory_SFShareAudioViewController <= 90)
  {
    if (gLogCategory_SFShareAudioViewController != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      LogPrintF();
      id v4 = v7;
    }
  }
  if (v4)
  {
    [(SFShareAudioViewController *)self _reportCompletion:v4 mediaRouteID:0];
  }
  else
  {
    id v6 = NSErrorF();
    [(SFShareAudioViewController *)self _reportCompletion:v6 mediaRouteID:0];
  }
}

- (void)reportUserCancelled
{
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSErrorF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(SFShareAudioViewController *)self _reportCompletion:v3 mediaRouteID:0];
}

- (void)_sessionStart
{
  id v3 = (SFShareAudioSessionClient *)objc_alloc_init(MEMORY[0x263F6C2C8]);
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = v3;
  int v5 = v3;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SFShareAudioViewController__sessionStart__block_invoke;
  v6[3] = &unk_264472D78;
  v6[4] = v5;
  v6[5] = self;
  [(SFShareAudioSessionClient *)v5 setProgressHandler:v6];
  [(SFShareAudioSessionClient *)v5 activate];
}

void *__43__SFShareAudioViewController__sessionStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v4 == result[179]) {
    return (void *)[result _sessionProgressEvent:a2 info:a3];
  }
  return result;
}

- (void)_sessionProgressEvent:(int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (__CFString *)a4;
  v17 = v6;
  if (gLogCategory_SFShareAudioViewController > 30) {
    goto LABEL_42;
  }
  if (gLogCategory_SFShareAudioViewController == -1)
  {
    int v8 = _LogCategory_Initialize();
    id v6 = v17;
    if (!v8) {
      goto LABEL_42;
    }
  }
  if ((int)v4 > 119)
  {
    if ((int)v4 <= 219)
    {
      switch(v4)
      {
        case 0x78:
          id v7 = "ShowPairInstructions";
          goto LABEL_39;
        case 0xC8:
          id v7 = "GuestiOSConnecting";
          goto LABEL_39;
        case 0xD2:
          id v7 = "GuestiOSAuthenticated";
          goto LABEL_39;
      }
    }
    else if ((int)v4 > 309)
    {
      if (v4 == 310)
      {
        id v7 = "GuestHeadphonesConnected";
        goto LABEL_39;
      }
      if (v4 == 320)
      {
        id v7 = "GuestHeadphonesWaitForRoute";
        goto LABEL_39;
      }
    }
    else
    {
      if (v4 == 220)
      {
        id v7 = "GuestiOSWaitingForAccept";
        goto LABEL_39;
      }
      if (v4 == 300)
      {
        id v7 = "GuestHeadphonesConnecting";
        goto LABEL_39;
      }
    }
LABEL_38:
    id v7 = "?";
    goto LABEL_39;
  }
  if ((int)v4 <= 29)
  {
    switch(v4)
    {
      case 0:
        id v7 = "Invalid";
        goto LABEL_39;
      case 0xA:
        id v7 = "Activated";
        goto LABEL_39;
      case 0x14:
        id v7 = "Invalidated";
        goto LABEL_39;
    }
    goto LABEL_38;
  }
  if ((int)v4 > 49)
  {
    if (v4 == 50)
    {
      id v7 = "Failed";
      goto LABEL_39;
    }
    if (v4 == 100)
    {
      id v7 = "Confirm";
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (v4 == 30)
  {
    id v7 = "Interrupted";
    goto LABEL_39;
  }
  if (v4 != 40) {
    goto LABEL_38;
  }
  id v7 = "Succeeded";
LABEL_39:
  v9 = &stru_26CE72980;
  if (v6) {
    v9 = v6;
  }
  v15 = v7;
  v16 = v9;
  LogPrintF();
  id v6 = v17;
LABEL_42:
  if ((int)v4 > 119)
  {
    if ((v4 - 200) <= 0x14 && ((1 << (v4 + 56)) & 0x100401) != 0
      || (v4 - 300) <= 0x14 && ((1 << (v4 - 44)) & 0x100401) != 0)
    {
      -[SFShareAudioViewController _showConnecting:](self, "_showConnecting:", v17, v15, v16);
      [(SFShareAudioConnectingViewController *)self->_vcConnecting sessionProgressEvent:v4 info:v17];
    }
    else
    {
      if (v4 != 120) {
        goto LABEL_61;
      }
      [(SFShareAudioViewController *)self _showPairInstructions:v17];
    }
    goto LABEL_60;
  }
  if (v4 == 40)
  {
    CFStringGetTypeID();
    v10 = CFDictionaryGetTypedValue();
    id v11 = self;
    v12 = 0;
    v13 = v10;
    goto LABEL_57;
  }
  if (v4 == 50)
  {
    CFErrorGetTypeID();
    v10 = CFDictionaryGetTypedValue();
    uint64_t v14 = [v10 code] - 299008;
    id v11 = self;
    v12 = v10;
    if (v14 != 2023)
    {
      [(SFShareAudioViewController *)self _showError:v10];
      goto LABEL_59;
    }
    v13 = 0;
LABEL_57:
    -[SFShareAudioViewController _reportCompletion:mediaRouteID:](v11, "_reportCompletion:mediaRouteID:", v12, v13, v15, v16);
LABEL_59:

    goto LABEL_60;
  }
  if (v4 != 100) {
    goto LABEL_61;
  }
  [(SFShareAudioViewController *)self _showConfirm:v17];
LABEL_60:
  id v6 = v17;
LABEL_61:
}

- (void)_showBringClose
{
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"BringClose"];
  [v3 setMainController:self];
  [(SFShareAudioViewController *)self _transitionToViewController:v3 animate:0];
}

- (void)_showError:(id)a3
{
  id v6 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  uint64_t v4 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"Error", v5];
  [v4 setMainController:self];
  [v4 setError:v6];
  [(SFShareAudioViewController *)self _transitionToViewController:v4 animate:0];
}

- (void)_showConfirm:(id)a3
{
  id v6 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  uint64_t v4 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"Confirm", v5];
  [v4 setMainController:self];
  [v4 setProductID:CFDictionaryGetInt64Ranged()];
  [v4 setColorCode:CFDictionaryGetInt64Ranged()];
  [(SFShareAudioViewController *)self _transitionToViewController:v4 animate:0];
}

- (void)_showPairInstructions:(id)a3
{
  id v5 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v4 = objc_alloc_init(SFShareAudioHoldButtonViewController);
  [(SFShareAudioBaseViewController *)v4 setMainController:self];
  [(SFShareAudioHoldButtonViewController *)v4 setProductID:CFDictionaryGetInt64Ranged()];
  [(SFShareAudioHoldButtonViewController *)v4 setColorCode:CFDictionaryGetInt64Ranged()];
  [(SFShareAudioViewController *)self _transitionToViewController:v4 animate:0];
}

- (void)_showConnecting:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self->_vcConnecting;
  if (!v4)
  {
    uint64_t v4 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"Connecting"];
    [(SFShareAudioBaseViewController *)v4 setMainController:self];
    objc_storeStrong((id *)&self->_vcConnecting, v4);
  }
  [(SFShareAudioConnectingViewController *)v4 setProductID:CFDictionaryGetInt64Ranged()];
  [(SFShareAudioConnectingViewController *)v4 setColorCode:CFDictionaryGetInt64Ranged()];
  [(SFShareAudioViewController *)self _transitionToViewController:v4 animate:0];
}

- (void)_transitionToViewController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  if (v4)
  {
    id v6 = [MEMORY[0x263F15910] animation];
    [v6 setDuration:0.5];
    [v6 setType:*MEMORY[0x263F15FD8]];
    id v7 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v6 setTimingFunction:v7];

    int v8 = [(SFShareAudioViewController *)self view];
    v9 = [v8 layer];
    [v9 addAnimation:v6 forKey:0];

    v10 = [v15 view];
    id v11 = [v10 layer];
    [v11 addAnimation:v6 forKey:0];
  }
  v12 = [(SFShareAudioViewController *)self viewControllers];
  int v13 = [v12 containsObject:v15];

  if (v13) {
    id v14 = (id)[(SFShareAudioViewController *)self popToViewController:v15 animated:0];
  }
  else {
    [(SFShareAudioViewController *)self pushViewController:v15 animated:0];
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (SFShareAudioSessionClient)shareAudioSession
{
  return self->_shareAudioSession;
}

- (void)setShareAudioSession:(id)a3
{
}

- (NSBundle)mainBundle
{
  return self->_mainBundle;
}

- (void)setMainBundle:(id)a3
{
}

- (UIStoryboard)mainStoryboard
{
  return self->_mainStoryboard;
}

- (void)setMainStoryboard:(id)a3
{
}

- (SFShareAudioConnectingViewController)vcConnecting
{
  return self->_vcConnecting;
}

- (void)setVcConnecting:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcConnecting, 0);
  objc_storeStrong((id *)&self->_mainStoryboard, 0);
  objc_storeStrong((id *)&self->_mainBundle, 0);
  objc_storeStrong((id *)&self->_shareAudioSession, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end