@interface PRUISAmbientPosterSceneLayerHostView
- (BOOL)isActive;
- (BOOL)setContextID:(unsigned int)a3 scene:(id)a4;
- (FBScene)scene;
- (NSString)identifier;
- (PRUISAmbientPosterSceneLayerHostView)initWithIdentifier:(id)a3;
- (unsigned)contextID;
- (void)invalidate;
- (void)setActive:(BOOL)a3;
@end

@implementation PRUISAmbientPosterSceneLayerHostView

- (PRUISAmbientPosterSceneLayerHostView)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISAmbientPosterSceneLayerHostView;
  v5 = -[PRUISAmbientPosterSceneLayerHostView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isActive
{
  return [(UIScenePresenter *)self->_presenter isActive];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PRUISAmbientPosterSceneLayerHostView *)self isActive] != a3)
  {
    presenter = self->_presenter;
    if (v3)
    {
      [(UIScenePresenter *)presenter activate];
    }
    else
    {
      [(UIScenePresenter *)presenter deactivate];
    }
  }
}

- (BOOL)setContextID:(unsigned int)a3 scene:(id)a4
{
  v7 = (FBScene *)a4;
  v8 = v7;
  if (self->_sceneLayerContextID == a3 && self->_scene == v7)
  {
    BOOL v20 = 0;
  }
  else
  {
    self->_sceneLayerContextID = a3;
    p_scene = &self->_scene;
    objc_storeStrong((id *)&self->_scene, a4);
    [(UIView *)self->_sceneLayerView removeFromSuperview];
    sceneLayerView = self->_sceneLayerView;
    self->_sceneLayerView = 0;

    [(UIScenePresenter *)self->_presenter invalidate];
    presenter = self->_presenter;
    self->_presenter = 0;

    if (self->_sceneLayerContextID && *p_scene)
    {
      v12 = objc_msgSend(MEMORY[0x263F1C910], "targetForContextID:");
      v13 = [(FBScene *)*p_scene uiPresentationManager];
      v14 = [(PRUISAmbientPosterSceneLayerHostView *)self identifier];
      v15 = [v13 createPresenterForLayerTarget:v12 identifier:v14 priority:100];
      v16 = self->_presenter;
      self->_presenter = v15;

      [(UIScenePresenter *)self->_presenter modifyPresentationContext:&__block_literal_global_3];
      v17 = [(UIScenePresenter *)self->_presenter presentationView];
      v18 = self->_sceneLayerView;
      self->_sceneLayerView = v17;

      v19 = self->_sceneLayerView;
      [(PRUISAmbientPosterSceneLayerHostView *)self bounds];
      -[UIView setFrame:](v19, "setFrame:");
      [(UIView *)self->_sceneLayerView setAutoresizingMask:18];
      [(PRUISAmbientPosterSceneLayerHostView *)self addSubview:self->_sceneLayerView];
    }
    BOOL v20 = 1;
  }

  return v20;
}

void __59__PRUISAmbientPosterSceneLayerHostView_setContextID_scene___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  [v2 setClippingDisabled:0];
}

- (void)invalidate
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)contextID
{
  return self->_sceneLayerContextID;
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sceneLayerView, 0);

  objc_storeStrong((id *)&self->_presenter, 0);
}

@end