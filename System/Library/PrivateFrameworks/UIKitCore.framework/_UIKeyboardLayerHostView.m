@interface _UIKeyboardLayerHostView
- (_UIKeyboardLayerHostView)initWithKeyboardLayer:(id)a3 owningScene:(id)a4;
- (_UIKeyboardLayerHostView)initWithKeyboardProxyLayer:(id)a3 owningScene:(id)a4;
- (id)_initWithLayer:(id)a3 owningScene:(id)a4 keyboardMatchingPredicate:(id)a5;
- (void)_setKeyboardScene:(id)a3;
- (void)_updatePairingState;
- (void)dealloc;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)setCurrentPresentationContext:(id)a3;
- (void)setInheritsSecurity:(BOOL)a3;
@end

@implementation _UIKeyboardLayerHostView

- (id)_initWithLayer:(id)a3 owningScene:(id)a4 keyboardMatchingPredicate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_10:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_UIKeyboardLayerHostView.m", 45, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"_UIKeyboardLayerHostView.m", 44, @"Invalid parameter not satisfying: %@", @"layer" object file lineNumber description];

  if (!v10) {
    goto LABEL_10;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_11:
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"_UIKeyboardLayerHostView.m", 46, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)_UIKeyboardLayerHostView;
  v12 = [(_UISceneLayerHostView *)&v25 initWithSceneLayer:v9];
  if (v12)
  {
    v13 = _Block_copy(v11);
    id sceneLayerMatchingPredicate = v12->_sceneLayerMatchingPredicate;
    v12->_id sceneLayerMatchingPredicate = v13;

    objc_storeStrong((id *)&v12->_owningScene, a4);
    objc_initWeak(&location, v12);
    v15 = (void *)MEMORY[0x1E4F62490];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81___UIKeyboardLayerHostView__initWithLayer_owningScene_keyboardMatchingPredicate___block_invoke;
    v22[3] = &unk_1E52E0648;
    objc_copyWeak(&v23, &location);
    uint64_t v16 = [v15 observeKeyboardSceneAvailability:v22];
    keyboardSceneAvailabilityObserver = v12->_keyboardSceneAvailabilityObserver;
    v12->_keyboardSceneAvailabilityObserver = (BSInvalidatable *)v16;

    if (v12->_keyboardScene) {
      [(_UIKeyboardLayerHostView *)v12 _updatePairingState];
    }
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (_UIKeyboardLayerHostView)initWithKeyboardProxyLayer:(id)a3 owningScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67___UIKeyboardLayerHostView_initWithKeyboardProxyLayer_owningScene___block_invoke;
  v11[3] = &unk_1E52E0670;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v12 = v8;
  id v9 = [(_UIKeyboardLayerHostView *)self _initWithLayer:v8 owningScene:v7 keyboardMatchingPredicate:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

- (_UIKeyboardLayerHostView)initWithKeyboardLayer:(id)a3 owningScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62___UIKeyboardLayerHostView_initWithKeyboardLayer_owningScene___block_invoke;
  v11[3] = &unk_1E52E0670;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v12 = v8;
  id v9 = [(_UIKeyboardLayerHostView *)self _initWithLayer:v6 owningScene:v8 keyboardMatchingPredicate:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

- (void)dealloc
{
  [(UIScenePresenter *)self->_presenter invalidate];
  [(FBScene *)self->_keyboardScene removeObserver:self];
  [(BSInvalidatable *)self->_keyboardSceneAvailabilityObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardLayerHostView;
  [(UIView *)&v3 dealloc];
}

- (void)setCurrentPresentationContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIKeyboardLayerHostView;
  [(_UISceneLayerHostView *)&v10 setCurrentPresentationContext:v4];
  v5 = [(UIScenePresenter *)self->_presenter presentationContext];
  [v5 _isVisibilityPropagationEnabled];
  [v4 _isVisibilityPropagationEnabled];
  char v6 = BSEqualBools();

  if ((v6 & 1) == 0)
  {
    presenter = self->_presenter;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58___UIKeyboardLayerHostView_setCurrentPresentationContext___block_invoke;
    v8[3] = &unk_1E52E0698;
    id v9 = v4;
    [(UIScenePresenter *)presenter modifyPresentationContext:v8];
  }
}

- (void)setInheritsSecurity:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyboardLayerHostView;
  -[_UISceneLayerHostView setInheritsSecurity:](&v8, sel_setInheritsSecurity_);
  if (self->_isPaired)
  {
    presenter = self->_presenter;
    if (presenter)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __48___UIKeyboardLayerHostView_setInheritsSecurity___block_invoke;
      v6[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
      BOOL v7 = a3;
      [(UIScenePresenter *)presenter modifyPresentationContext:v6];
    }
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  keyboardSceneClientSettingsDiffInspector = self->_keyboardSceneClientSettingsDiffInspector;
  if (!keyboardSceneClientSettingsDiffInspector)
  {
    v15 = (FBSSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F62A40]);
    uint64_t v16 = self->_keyboardSceneClientSettingsDiffInspector;
    self->_keyboardSceneClientSettingsDiffInspector = v15;

    v17 = self->_keyboardSceneClientSettingsDiffInspector;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __102___UIKeyboardLayerHostView_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    v21 = &unk_1E52E06E0;
    objc_copyWeak(&v22, &location);
    [(FBSSceneClientSettingsDiffInspector *)v17 observePreferredSceneHostIdentityWithBlock:&v18];
    objc_destroyWeak(&v22);
    keyboardSceneClientSettingsDiffInspector = self->_keyboardSceneClientSettingsDiffInspector;
  }
  -[FBSSceneClientSettingsDiffInspector inspectDiff:withContext:](keyboardSceneClientSettingsDiffInspector, "inspectDiff:withContext:", v11, 0, v18, v19, v20, v21);
  objc_destroyWeak(&location);
}

- (void)_setKeyboardScene:(id)a3
{
  v5 = (FBScene *)a3;
  if (self->_keyboardScene)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIKeyboardLayerHostView.m" lineNumber:137 description:@"Cannot already have a keyboard scene."];
  }
  [(BSInvalidatable *)self->_keyboardSceneAvailabilityObserver invalidate];
  keyboardSceneAvailabilityObserver = self->_keyboardSceneAvailabilityObserver;
  self->_keyboardSceneAvailabilityObserver = 0;

  [(FBScene *)self->_keyboardScene removeObserver:self];
  keyboardScene = self->_keyboardScene;
  self->_keyboardScene = v5;
  objc_super v8 = v5;

  [(FBScene *)self->_keyboardScene addObserver:self];
  [(_UIKeyboardLayerHostView *)self _updatePairingState];
}

- (void)_updatePairingState
{
  keyboardScene = self->_keyboardScene;
  if (!keyboardScene || !self->_owningScene)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"_UIKeyboardLayerHostView.m" lineNumber:152 description:@"Require a keyboard scene."];

    keyboardScene = self->_keyboardScene;
  }
  v5 = [(FBScene *)keyboardScene clientSettings];
  char v6 = [v5 preferredSceneHostIdentity];
  keyboardPreferredHostIdentity = self->_keyboardPreferredHostIdentity;
  self->_keyboardPreferredHostIdentity = v6;

  int v8 = (*((uint64_t (**)(void))self->_sceneLayerMatchingPredicate + 2))();
  if (self->_isPaired != v8)
  {
    self->_isPaired = v8;
    if (v8)
    {
      id v9 = [NSString alloc];
      uint64_t v10 = _updatePairingState___hostViewRequesterCount++;
      id v11 = [(FBScene *)self->_keyboardScene identifier];
      id v12 = (void *)[v9 initWithFormat:@"UIKeyboardSceneLayerHostView-%i:%@", v10, v11];

      id v13 = [(FBScene *)self->_keyboardScene uiPresentationManager];
      objc_msgSend(v13, "createPresenterWithIdentifier:priority:", v12, objc_msgSend(v13, "_defaultPresentationPriority") - 1);
      v14 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      presenter = self->_presenter;
      self->_presenter = v14;

      uint64_t v16 = self->_presenter;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __47___UIKeyboardLayerHostView__updatePairingState__block_invoke;
      v20[3] = &unk_1E52E0698;
      v20[4] = self;
      [(UIScenePresenter *)v16 modifyPresentationContext:v20];
      [(UIScenePresenter *)self->_presenter activate];
      v17 = [(UIScenePresenter *)self->_presenter presentationView];
      [(UIView *)self addSubview:v17];
    }
    else
    {
      [(UIScenePresenter *)self->_presenter invalidate];
      uint64_t v18 = self->_presenter;
      self->_presenter = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_keyboardPreferredHostIdentity, 0);
  objc_storeStrong((id *)&self->_keyboardSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_keyboardSceneAvailabilityObserver, 0);
  objc_storeStrong((id *)&self->_keyboardScene, 0);
  objc_storeStrong((id *)&self->_owningScene, 0);
  objc_storeStrong(&self->_sceneLayerMatchingPredicate, 0);
}

@end