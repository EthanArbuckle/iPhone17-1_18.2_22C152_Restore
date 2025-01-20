@interface SBUnlockedAlertItemPresenter
- (BOOL)canPresentMultipleAlertItemsSimultaneously;
- (BOOL)presentsAlertItemsModally;
- (SBAlertItemPresenterWindowSceneResolver)windowSceneResolver;
- (SBUnlockedAlertItemPresenter)initWithSharedModalAlertItemPresenter:(id)a3 windowSceneManager:(id)a4;
- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setWindowSceneResolver:(id)a3;
- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBUnlockedAlertItemPresenter

- (SBUnlockedAlertItemPresenter)initWithSharedModalAlertItemPresenter:(id)a3 windowSceneManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUnlockedAlertItemPresenter;
  v8 = [(SBUnlockedAlertItemPresenter *)&v12 init];
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
  id v13 = a3;
  id v8 = a5;
  BSDispatchQueueAssertMain();
  v9 = +[SBIconController sharedInstance];
  [v9 noteViewCovered];

  if ([v13 wakeDisplay])
  {
    v10 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    [v10 resetIdleTimerForReason:@"PresentAlertItem"];
  }
  v11 = [(SBUnlockedAlertItemPresenter *)self windowSceneResolver];
  objc_super v12 = [v11 resolvedSharedModalAlertItemPresenterForAlertItem:v13];
  [v12 presentAlertItem:v13 isLocked:0 animated:v6 completion:v8];
}

- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  BSDispatchQueueAssertMain();
  id v11 = [(SBUnlockedAlertItemPresenter *)self windowSceneResolver];
  v10 = [v11 resolvedSharedModalAlertItemPresenterForAlertItem:v9];
  [v10 dismissAlertItem:v9 animated:v5 completion:v8];
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
    [v10 handleFailureInMethod:a2, self, @"SBUnlockedAlertItemPresenter.m", 65, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"SBUnlockedAlertItemPresenter.m", 66, @"Invalid parameter not satisfying: %@", @"sharedModalAlertItemPresenter" object file lineNumber description];

LABEL_3:
  id v8 = [(SBUnlockedAlertItemPresenter *)self windowSceneResolver];

  if (v8)
  {
    id v9 = [(SBUnlockedAlertItemPresenter *)self windowSceneResolver];
    [v9 windowSceneDidConnect:v12 withSharedModalAlertItemPresenter:v7];
  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBUnlockedAlertItemPresenter.m", 74, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];
  }
  BOOL v5 = [(SBUnlockedAlertItemPresenter *)self windowSceneResolver];

  BOOL v6 = v9;
  if (v5)
  {
    id v7 = [(SBUnlockedAlertItemPresenter *)self windowSceneResolver];
    [v7 windowSceneDidDisconnect:v9];

    BOOL v6 = v9;
  }
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