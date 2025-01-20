@interface SBSystemApertureSceneElementScenePresenterView
- (FBScene)scene;
- (UIScenePresenter)scenePresenter;
- (UIView)sceneContentView;
- (void)layoutSubviews;
- (void)setScene:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBSystemApertureSceneElementScenePresenterView

- (void)setScene:(id)a3
{
  p_scene = &self->_scene;
  v14 = (FBScene *)a3;
  if (*p_scene != v14)
  {
    objc_storeStrong((id *)&self->_scene, a3);
    [(UIScenePresenter *)self->_scenePresenter invalidate];
    [(UIView *)self->_sceneContentView removeFromSuperview];
    sceneContentView = self->_sceneContentView;
    self->_sceneContentView = 0;

    scenePresenter = self->_scenePresenter;
    self->_scenePresenter = 0;

    if (*p_scene)
    {
      v8 = self->_scenePresenter;
      if (!v8)
      {
        v9 = [(FBScene *)*p_scene uiPresentationManager];
        v10 = [v9 createPresenterWithIdentifier:@"default"];
        v11 = self->_scenePresenter;
        self->_scenePresenter = v10;

        v8 = self->_scenePresenter;
      }
      [(UIScenePresenter *)v8 modifyPresentationContext:&__block_literal_global_0];
      [(UIScenePresenter *)self->_scenePresenter activate];
      v12 = [(UIScenePresenter *)self->_scenePresenter presentationView];
      v13 = self->_sceneContentView;
      self->_sceneContentView = v12;

      [(SBSystemApertureSceneElementScenePresenterView *)self insertSubview:self->_sceneContentView atIndex:0];
    }
  }
}

void __59__SBSystemApertureSceneElementScenePresenterView_setScene___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPresentedLayerTypes:26];
  [v2 setAppearanceStyle:2];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBSystemApertureSceneElementScenePresenterView;
  [(SBSystemApertureSceneElementScenePresenterView *)&v4 layoutSubviews];
  sceneContentView = self->_sceneContentView;
  [(SBSystemApertureSceneElementScenePresenterView *)self bounds];
  -[UIView setFrame:](sceneContentView, "setFrame:");
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBSystemApertureSceneElementScenePresenterView;
  id v4 = a3;
  [(SBSystemApertureSceneElementScenePresenterView *)&v9 traitCollectionDidChange:v4];
  v5 = [(SBSystemApertureSceneElementScenePresenterView *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6)
  {
    scene = self->_scene;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __75__SBSystemApertureSceneElementScenePresenterView_traitCollectionDidChange___block_invoke;
    v8[3] = &unk_2645D3B98;
    v8[4] = self;
    [(FBScene *)scene updateSettingsWithBlock:v8];
  }
}

void __75__SBSystemApertureSceneElementScenePresenterView_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v9 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v9;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  [v6 setUserInterfaceStyle:v8];
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (UIView)sceneContentView
{
  return self->_sceneContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneContentView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);

  objc_storeStrong((id *)&self->_scene, 0);
}

@end