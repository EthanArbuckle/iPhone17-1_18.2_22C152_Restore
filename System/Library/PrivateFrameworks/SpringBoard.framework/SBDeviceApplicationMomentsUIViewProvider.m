@interface SBDeviceApplicationMomentsUIViewProvider
- (BOOL)handledStatusBarTap:(id)a3 type:(int64_t)a4;
- (id)acquireSystemUIScenePresentingAssertion;
- (id)dismissScene:(id)a3;
- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4;
- (int64_t)priority;
@end

@implementation SBDeviceApplicationMomentsUIViewProvider

- (id)acquireSystemUIScenePresentingAssertion
{
  v3 = [(id)SBApp systemUIScenesCoordinator];
  v4 = [v3 momentsUISceneController];
  v5 = [v4 addPresenter:self];

  return v5;
}

- (int64_t)priority
{
  return 1;
}

- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4
{
  p_presentedScene = &self->_presentedScene;
  id v7 = a4;
  id v8 = a3;
  objc_storeWeak((id *)p_presentedScene, v8);
  v11.receiver = self;
  v11.super_class = (Class)SBDeviceApplicationMomentsUIViewProvider;
  v9 = [(SBDeviceApplicationSystemUISceneAbstractViewProvider *)&v11 presentScene:v8 viewControllerBuilderBlock:v7];

  return v9;
}

- (id)dismissScene:(id)a3
{
  p_presentedScene = &self->_presentedScene;
  id v5 = a3;
  objc_storeWeak((id *)p_presentedScene, 0);
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationMomentsUIViewProvider;
  v6 = [(SBDeviceApplicationSystemUISceneAbstractViewProvider *)&v8 dismissScene:v5];

  return v6;
}

- (BOOL)handledStatusBarTap:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  if (a4 || ![(SBDeviceApplicationSystemUISceneAbstractViewProvider *)self isActive])
  {
    LOBYTE(WeakRetained) = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedScene);
    if (WeakRetained)
    {
      objc_super v8 = [(SBDeviceApplicationSceneOverlayViewProvider *)self overlayViewController];
      v9 = [v8 view];
      [v6 locationInView:v9];
      double v11 = v10;

      v12 = (void *)[objc_alloc(MEMORY[0x1E4F42E50]) initWithType:0 xPosition:v11];
      v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
      [WeakRetained sendActions:v13];

      LOBYTE(WeakRetained) = 1;
    }
  }

  return (char)WeakRetained;
}

- (void).cxx_destruct
{
}

@end