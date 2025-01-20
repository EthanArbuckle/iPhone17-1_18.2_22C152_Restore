@interface SBLockedModalAlertItemPresenter
- (BOOL)canPresentMultipleAlertItemsSimultaneously;
- (BOOL)presentsAlertItemsModally;
- (SBAlertItemPresenterWindowSceneResolver)windowSceneResolver;
- (SBLockedModalAlertItemPresenter)initWithSharedModalAlertItemPresenter:(id)a3 windowSceneManager:(id)a4;
- (id)lockScreenActionContext;
- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setWindowSceneResolver:(id)a3;
- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBLockedModalAlertItemPresenter

- (SBLockedModalAlertItemPresenter)initWithSharedModalAlertItemPresenter:(id)a3 windowSceneManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBLockedModalAlertItemPresenter;
  v8 = [(SBLockedModalAlertItemPresenter *)&v12 init];
  if (v8)
  {
    v9 = [[SBAlertItemPresenterWindowSceneResolver alloc] initWithSharedModalAlertItemPresenter:v6 windowSceneManager:v7];
    windowSceneResolver = v8->_windowSceneResolver;
    v8->_windowSceneResolver = v9;
  }
  return v8;
}

- (BOOL)presentsAlertItemsModally
{
  return 1;
}

- (BOOL)canPresentMultipleAlertItemsSimultaneously
{
  return 1;
}

- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  BSDispatchQueueAssertMain();
  v10 = +[SBLockScreenManager sharedInstance];
  [v10 setBiometricAutoUnlockingDisabled:1 forReason:@"SBDisableMesaReasonModalAlertItem"];

  if ([v8 wakeDisplay] && (objc_msgSend(v8, "_didEverActivate") & 1) == 0)
  {
    v11 = +[SBLockScreenManager sharedInstance];
    v19 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
    objc_super v12 = [NSNumber numberWithBool:1];
    v20[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v11 unlockUIFromSource:10 withOptions:v13];
  }
  v14 = +[SBLockScreenManager sharedInstance];
  uint64_t v15 = [v14 isUILocked];

  v16 = [(SBLockedModalAlertItemPresenter *)self windowSceneResolver];
  v17 = [v16 resolvedSharedModalAlertItemPresenterForAlertItem:v8];
  [v17 presentAlertItem:v8 isLocked:v15 animated:v6 completion:v9];

  if ([v8 dismissesOverlaysOnLockScreen])
  {
    v18 = +[SBControlCenterController sharedInstance];
    if ([v18 isVisible]) {
      [v18 dismissAnimated:1];
    }
  }
}

- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  BSDispatchQueueAssertMain();
  v10 = [(SBLockedModalAlertItemPresenter *)self windowSceneResolver];
  v11 = [v10 resolvedSharedModalAlertItemPresenterForAlertItem:v9];
  [v11 dismissAlertItem:v9 animated:v5 completion:v8];

  id v12 = +[SBLockScreenManager sharedInstance];
  [v12 setBiometricAutoUnlockingDisabled:0 forReason:@"SBDisableMesaReasonModalAlertItem"];
}

- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBLockedModalAlertItemPresenter.m", 82, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"SBLockedModalAlertItemPresenter.m", 83, @"Invalid parameter not satisfying: %@", @"sharedModalAlertItemPresenter" object file lineNumber description];

LABEL_3:
  id v8 = [(SBLockedModalAlertItemPresenter *)self windowSceneResolver];

  if (v8)
  {
    id v9 = [(SBLockedModalAlertItemPresenter *)self windowSceneResolver];
    [v9 windowSceneDidConnect:v12 withSharedModalAlertItemPresenter:v7];
  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBLockedModalAlertItemPresenter.m", 91, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];
  }
  BOOL v5 = [(SBLockedModalAlertItemPresenter *)self windowSceneResolver];

  BOOL v6 = v9;
  if (v5)
  {
    id v7 = [(SBLockedModalAlertItemPresenter *)self windowSceneResolver];
    [v7 windowSceneDidDisconnect:v9];

    BOOL v6 = v9;
  }
}

- (id)lockScreenActionContext
{
  v2 = [(SBLockedModalAlertItemPresenter *)self windowSceneResolver];
  v3 = [v2 resolvedSharedModalAlertItemPresenterForAlertItem:0];
  v4 = [v3 currentlyPresentedAlertItem];

  if (v4)
  {
    BOOL v5 = +[SBLockScreenActionContextFactory sharedInstance];
    BOOL v6 = [v5 lockScreenActionContextForAlertItem:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (SBAlertItemPresenterWindowSceneResolver)windowSceneResolver
{
  return self->_windowSceneResolver;
}

- (void)setWindowSceneResolver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end