@interface SBAlertItemPresenterWindowSceneResolver
- (NSMapTable)modalAlertPresenters;
- (SBAlertItemPresenterWindowSceneResolver)initWithSharedModalAlertItemPresenter:(id)a3 windowSceneManager:(id)a4;
- (SBWindowSceneManager)windowSceneManager;
- (id)resolvedSharedModalAlertItemPresenterForAlertItem:(id)a3;
- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBAlertItemPresenterWindowSceneResolver

- (SBAlertItemPresenterWindowSceneResolver)initWithSharedModalAlertItemPresenter:(id)a3 windowSceneManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBAlertItemPresenterWindowSceneResolver;
  v8 = [(SBAlertItemPresenterWindowSceneResolver *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    modalAlertPresenters = v8->_modalAlertPresenters;
    v8->_modalAlertPresenters = (NSMapTable *)v9;

    v11 = v8->_modalAlertPresenters;
    v12 = [v6 windowScene];
    [(NSMapTable *)v11 setObject:v6 forKey:v12];

    objc_storeStrong((id *)&v8->_windowSceneManager, a4);
  }

  return v8;
}

- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if (v14)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBAlertItemPresenterWindowSceneResolver.m", 37, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"SBAlertItemPresenterWindowSceneResolver.m", 38, @"Invalid parameter not satisfying: %@", @"sharedModalAlertItemPresenter" object file lineNumber description];

LABEL_3:
  v8 = [(SBAlertItemPresenterWindowSceneResolver *)self modalAlertPresenters];
  uint64_t v9 = [v7 windowScene];
  v10 = [v8 objectForKey:v9];

  if (!v10)
  {
    v11 = [(SBAlertItemPresenterWindowSceneResolver *)self modalAlertPresenters];
    [v11 setObject:v7 forKey:v14];
  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBAlertItemPresenterWindowSceneResolver.m", 46, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];
  }
  v5 = [(SBAlertItemPresenterWindowSceneResolver *)self modalAlertPresenters];
  id v6 = [v5 objectForKey:v9];
  [v6 invalidate];

  id v7 = [(SBAlertItemPresenterWindowSceneResolver *)self modalAlertPresenters];
  [v7 removeObjectForKey:v9];
}

- (id)resolvedSharedModalAlertItemPresenterForAlertItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 alertController];
  id v6 = [v5 _sbWindowScene];

  if (!v6)
  {
    id v7 = self;
    v8 = [v4 _preferredActivationWindowScene];
    id v6 = SBSafeCast((uint64_t)v7, v8);

    if (!v6) {
      goto LABEL_4;
    }
  }
  id v9 = [(SBAlertItemPresenterWindowSceneResolver *)self modalAlertPresenters];
  v10 = [v9 objectForKey:v6];

  if (!v10)
  {
LABEL_4:
    v11 = [(SBAlertItemPresenterWindowSceneResolver *)self windowSceneManager];
    v12 = [v11 activeDisplayWindowScene];

    v13 = [(SBAlertItemPresenterWindowSceneResolver *)self modalAlertPresenters];
    v10 = [v13 objectForKey:v12];
  }
  return v10;
}

- (NSMapTable)modalAlertPresenters
{
  return self->_modalAlertPresenters;
}

- (SBWindowSceneManager)windowSceneManager
{
  return self->_windowSceneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_modalAlertPresenters, 0);
}

@end