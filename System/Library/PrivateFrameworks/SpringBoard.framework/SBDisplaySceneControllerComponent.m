@interface SBDisplaySceneControllerComponent
- (SBDisplaySceneControllerComponent)initWithScene:(id)a3;
- (SBDisplaySceneControllerComponentDelegate)delegate;
- (UIScene)_scene;
- (void)_setScene:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBDisplaySceneControllerComponent

- (SBDisplaySceneControllerComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDisplaySceneControllerComponent;
  v5 = [(SBDisplaySceneControllerComponent *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v6;
}

- (SBDisplaySceneControllerComponentDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end