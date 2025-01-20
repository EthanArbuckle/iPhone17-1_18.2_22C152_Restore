@interface PRComplicationsSnapshotSceneHostViewController
- (PRComplicationsSnapshotSceneHostViewController)initWithScene:(id)a3;
- (void)dealloc;
- (void)viewDidLayoutSubviews;
@end

@implementation PRComplicationsSnapshotSceneHostViewController

- (PRComplicationsSnapshotSceneHostViewController)initWithScene:(id)a3
{
  v34[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PRComplicationsSnapshotSceneHostViewController;
  v6 = [(PRComplicationsSnapshotSceneHostViewController *)&v33 init];
  v7 = v6;
  if (v6)
  {
    p_scene = (id *)&v6->_scene;
    objc_storeStrong((id *)&v6->_scene, a3);
    [*p_scene configureParameters:&__block_literal_global_96];
    v9 = [*p_scene uiPresentationManager];
    uint64_t v10 = [v9 createPresenterWithIdentifier:@"complications-snapshot"];
    id v32 = v5;
    scenePresenter = v7->_scenePresenter;
    v7->_scenePresenter = (UIScenePresenter *)v10;

    [(UIScenePresenter *)v7->_scenePresenter modifyPresentationContext:&__block_literal_global_103];
    [(UIScenePresenter *)v7->_scenePresenter activate];
    v12 = [(UIScenePresenter *)v7->_scenePresenter presentationView];
    [v12 setClipsToBounds:1];
    v13 = [v12 layer];
    [v13 setName:@"Scene View"];

    [*p_scene activateWithTransitionContext:0];
    v14 = [(PRComplicationsSnapshotSceneHostViewController *)v7 view];
    [v14 addSubview:v12];

    v15 = [(PRComplicationsSnapshotSceneHostViewController *)v7 view];
    v16 = (void *)MEMORY[0x1E4F1CA48];
    v31 = [v12 leadingAnchor];
    v30 = [v15 leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v34[0] = v29;
    v28 = [v12 trailingAnchor];
    v27 = [v15 trailingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v34[1] = v26;
    v25 = [v12 topAnchor];
    v17 = [v15 topAnchor];
    v18 = [v25 constraintEqualToAnchor:v17];
    v34[2] = v18;
    v19 = [v12 bottomAnchor];
    v20 = [v15 bottomAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v34[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
    v23 = [v16 arrayWithArray:v22];

    [MEMORY[0x1E4F28DC8] activateConstraints:v23];
    id v5 = v32;
  }
  return v7;
}

uint64_t __64__PRComplicationsSnapshotSceneHostViewController_initWithScene___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateSettingsWithBlock:&__block_literal_global_98];
}

void __64__PRComplicationsSnapshotSceneHostViewController_initWithScene___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F62420];
  id v4 = a2;
  v3 = [v2 mainConfiguration];
  [v4 setDisplayConfiguration:v3];

  [v4 setForeground:1];
}

void __64__PRComplicationsSnapshotSceneHostViewController_initWithScene___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPresentedLayerTypes:26];
  [v2 setAppearanceStyle:2];
  [v2 setBackgroundColorWhileHosting:0];
  [v2 setBackgroundColorWhileNotHosting:0];
  [v2 setShouldPassthroughHitTestEventsIfTransparent:1];
}

- (void)dealloc
{
  [(UIScenePresenter *)self->_scenePresenter invalidate];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  [(FBScene *)self->_scene setDelegate:0];
  [(FBScene *)self->_scene invalidate];
  scene = self->_scene;
  self->_scene = 0;

  v5.receiver = self;
  v5.super_class = (Class)PRComplicationsSnapshotSceneHostViewController;
  [(PRComplicationsSnapshotSceneHostViewController *)&v5 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PRComplicationsSnapshotSceneHostViewController;
  [(PRComplicationsSnapshotSceneHostViewController *)&v5 viewDidLayoutSubviews];
  scene = self->_scene;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__PRComplicationsSnapshotSceneHostViewController_viewDidLayoutSubviews__block_invoke;
  v4[3] = &unk_1E54DBB58;
  v4[4] = self;
  [(FBScene *)scene performUpdate:v4];
}

void __71__PRComplicationsSnapshotSceneHostViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v12 = a2;
  v3 = [v2 view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end