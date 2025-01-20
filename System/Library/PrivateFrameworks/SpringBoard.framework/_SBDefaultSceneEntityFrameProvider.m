@interface _SBDefaultSceneEntityFrameProvider
- (CGRect)sceneEntityFrameForWorkspaceEntity:(id)a3 inLayoutState:(id)a4;
- (SBWindowScene)windowScene;
- (_SBDefaultSceneEntityFrameProvider)initWithWindowScene:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation _SBDefaultSceneEntityFrameProvider

- (_SBDefaultSceneEntityFrameProvider)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SBDefaultSceneEntityFrameProvider;
  v5 = [(_SBDefaultSceneEntityFrameProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_windowScene, v4);
  }

  return v6;
}

- (CGRect)sceneEntityFrameForWorkspaceEntity:(id)a3 inLayoutState:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v5 = [WeakRetained _fbsDisplayConfiguration];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end