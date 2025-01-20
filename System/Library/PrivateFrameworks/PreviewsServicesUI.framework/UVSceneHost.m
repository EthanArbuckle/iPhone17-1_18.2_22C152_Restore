@interface UVSceneHost
+ (id)createWithInjectedScene:(id)a3 error:(id *)a4;
- (UVInjectedScene)injectedScene;
- (id)_initWithHostIdentifier:(id)a3 scenePresenter:(id)a4 injectedScene:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)layoutSubviews;
@end

@implementation UVSceneHost

+ (id)createWithInjectedScene:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 scene];
  v7 = NSString;
  v8 = [v6 identifier];
  v9 = [v7 stringWithFormat:@"UVSceneHost-%@", v8];

  v10 = [v6 uiPresentationManager];
  v11 = [v10 createPresenterWithIdentifier:v9];

  if (v11)
  {
    id v19 = [[UVSceneHost alloc] _initWithHostIdentifier:v9 scenePresenter:v11 injectedScene:v5];
  }
  else
  {
    v20 = UVPreviewsServicesError(@"Failed to make UIScenePresentationManager for scene %@", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v6);
    v21 = UVLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      +[UVSceneHost createWithInjectedScene:error:](v20, v21);
    }

    if (a4) {
      *a4 = v20;
    }

    id v19 = 0;
  }

  return v19;
}

- (id)_initWithHostIdentifier:(id)a3 scenePresenter:(id)a4 injectedScene:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)UVSceneHost;
  uint64_t v12 = [(UVSceneHost *)&v16 init];
  p_isa = (id *)&v12->super.super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hostIdentifier, a3);
    objc_storeStrong(p_isa + 52, a4);
    objc_storeWeak(p_isa + 54, v11);
    [p_isa[52] modifyPresentationContext:&__block_literal_global];
    [p_isa[52] activate];
    uint64_t v14 = [p_isa[52] presentationView];
    [p_isa addSubview:v14];
  }
  return p_isa;
}

uint64_t __68__UVSceneHost__initWithHostIdentifier_scenePresenter_injectedScene___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAppearanceStyle:2];
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_23995F000, log, OS_LOG_TYPE_FAULT, "UVSceneHost deallocated without being invalidated", v1, 2u);
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    v3 = [(UIScenePresenter *)self->_scenePresenter presentationView];
    [v3 removeFromSuperview];

    [(UIScenePresenter *)self->_scenePresenter invalidate];
    scenePresenter = self->_scenePresenter;
    self->_scenePresenter = 0;
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)UVSceneHost;
  [(UVSceneHost *)&v4 layoutSubviews];
  v3 = [(UIScenePresenter *)self->_scenePresenter presentationView];
  [(UVSceneHost *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (UVInjectedScene)injectedScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_injectedScene);

  return (UVInjectedScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_injectedScene);
  objc_storeStrong((id *)&self->_scenePresenter, 0);

  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

+ (void)createWithInjectedScene:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 localizedDescription];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_fault_impl(&dword_23995F000, a2, OS_LOG_TYPE_FAULT, "%{public}@", (uint8_t *)&v4, 0xCu);
}

@end