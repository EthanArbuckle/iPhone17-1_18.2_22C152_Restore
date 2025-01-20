@interface _UISceneHostingView
- (BOOL)_isHostingRemoteContent;
- (BOOL)_shouldUseHostCornerRadius;
- (BOOL)canBecomeFirstResponder;
- (Class)_intelligenceBaseClass;
- (UIScenePresenter)_scenePresenter;
- (_UISceneHostingController)_sceneHostingController;
- (_UISceneHostingView)initWithSceneHostingController:(id)a3;
- (id)description;
- (void)_applyOverridesToHostedSceneSettings:(id)a3;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4;
- (void)_intelligenceCollectRemoteContentIn:(CGRect)a3 remoteContextWrapper:(id)a4;
- (void)layoutSubviews;
- (void)requestSceneSettingsUpdateIfNecessary;
- (void)setPresentedScene:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UISceneHostingView

- (Class)_intelligenceBaseClass
{
  sub_1859E2020();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = self;
  _UISceneHostingView._intelligenceCollectContent(in:collector:)((uint64_t)v9, x, y, width, height);
}

- (void)_intelligenceCollectRemoteContentIn:(CGRect)a3 remoteContextWrapper:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v12 = self;
  v10 = [(_UISceneHostingView *)v12 _sceneHostingController];
  v11 = [(_UISceneHostingController *)v10 intelligenceHostSceneComponent];

  if (v11)
  {
    -[_UISceneHostingIntelligenceSupportHost collectRemoteContentInVisibleRect:withRemoteContextWrapper:](v11, sel_collectRemoteContentInVisibleRect_withRemoteContextWrapper_, v9, x, y, width, height);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_UISceneHostingView)initWithSceneHostingController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISceneHostingView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sceneHostingController, v4);
    -[UIView _addGeometryChangeObserver:](v6, v6);
  }

  return v6;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_UISceneHostingView;
  [(UIView *)&v5 layoutSubviews];
  v3 = [(UIView *)self window];
  id v4 = [v3 windowScene];

  if (v4) {
    [(_UISceneHostingView *)self requestSceneSettingsUpdateIfNecessary];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  id v4 = [WeakRetained traitCollectionReceiver];
  objc_super v5 = [(UIView *)self traitCollection];
  [v4 setTraitCollection:v5];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISceneHostingView;
  [(UIView *)&v9 willMoveToWindow:v4];
  if ([(id)UIApp _supportedOnLockScreen]) {
    int v5 = [(id)objc_opt_class() _isSecure];
  }
  else {
    int v5 = 0;
  }
  v6 = [(UIView *)self layer];
  v7 = v6;
  objc_super v8 = (void *)MEMORY[0x1E4F3A440];
  if (!v5) {
    objc_super v8 = (void *)MEMORY[0x1E4F3A438];
  }
  [v6 setSecurityMode:*v8];
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)_UISceneHostingView;
  id v4 = [(UIView *)&v13 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  v6 = WeakRetained;
  if (WeakRetained) {
    v7 = (void *)*((void *)WeakRetained + 10);
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  objc_super v9 = [v8 identityToken];
  v10 = [v9 stringRepresentation];
  v11 = [v3 stringWithFormat:@"%@ => hosting %@", v4, v10];

  return v11;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  unint64_t var0 = a3->var0;
  v7 = [(UIView *)self _window];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  double v15 = v14;

  if ((var0 & 0x1000) != 0)
  {
    v16 = [(UIView *)self _window];
    uint64_t v17 = [v16 interfaceOrientation];

    int64_t var6 = a3->var6;
    BOOL v19 = (unint64_t)(v17 - 3) <= 1 && (unint64_t)(var6 - 3) < 2;
    BOOL v20 = (unint64_t)(var6 - 1) < 2;
    if ((unint64_t)(v17 - 1) > 1) {
      BOOL v20 = v19;
    }
    if (v20 || vabdd_f64(v13, v15) <= 2.22044605e-16) {
      goto LABEL_13;
    }
  }
  BOOL v21 = [(UIWindow *)self->super._window isRotating];
  if (v21)
  {
    [(UIView *)self frame];
    v28.origin.double x = v22;
    v28.origin.double y = v23;
    v28.size.double width = v24;
    v28.size.double height = v25;
    v27.origin.double x = v9;
    v27.origin.double y = v11;
    v27.size.double width = v13;
    v27.size.double height = v15;
    LOBYTE(v21) = CGRectEqualToRect(v27, v28);
  }
  if ((var0 & 0x36) != 0 && !v21)
  {
LABEL_13:
    [(_UISceneHostingView *)self requestSceneSettingsUpdateIfNecessary];
  }
}

- (void)setPresentedScene:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"_UISceneHostingView.m" lineNumber:136 description:@"Can not set up _UISceneHostingView with a nil scene"];
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UISceneHosting", &setPresentedScene____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    BOOL v19 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = v19;
      *(_DWORD *)buf = 138413058;
      id v46 = (id)objc_opt_class();
      __int16 v47 = 2048;
      v48 = self;
      __int16 v49 = 2112;
      id v50 = v5;
      __int16 v51 = 2112;
      v52 = self;
      id v21 = v46;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "[<%@;%p>] Presenting scene: %@ (self: %@)", buf, 0x2Au);
    }
  }
  v7 = [v5 uiPresentationManager];
  double v8 = [MEMORY[0x1E4F29128] UUID];
  CGFloat v9 = [v8 UUIDString];

  double v10 = [NSString stringWithFormat:@"UISceneHostingScenePresenter-%@", v9];
  CGFloat v11 = [v7 createPresenterWithIdentifier:v10];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = v11;

  [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&__block_literal_global_603];
  [(UIScenePresenter *)self->_scenePresenter activate];
  double v13 = [(UIScenePresenter *)self->_scenePresenter presentationView];
  [(UIView *)self frame];
  objc_msgSend(v13, "setFrame:");
  [v13 setAutoresizingMask:18];
  [(UIView *)self setClipsToBounds:1];
  [(UIView *)self addSubview:v13];
  [(UIView *)self sendSubviewToBack:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  double v15 = [WeakRetained traitCollectionReceiver];
  v16 = [(UIView *)self traitCollection];
  [v15 setTraitCollection:v16];

  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v17 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v22 = _UIInternalPreference_SceneHostingDebugOverlay;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_SceneHostingDebugOverlay)
    {
      while (v17 >= v22)
      {
        _UIInternalPreferenceSync(v17, &_UIInternalPreference_SceneHostingDebugOverlay, @"SceneHostingDebugOverlay", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v22 = _UIInternalPreference_SceneHostingDebugOverlay;
        if (v17 == _UIInternalPreference_SceneHostingDebugOverlay) {
          goto LABEL_7;
        }
      }
      if (byte_1E8FD5514 && !self->_debugLabel)
      {
        CGFloat v23 = objc_alloc_init(UILabel);
        [(UILabel *)v23 setNumberOfLines:0];
        CGFloat v24 = NSString;
        CGFloat v25 = [v5 identifier];
        v26 = [v24 stringWithFormat:@"Hosting: %@", v25];
        [(UILabel *)v23 setText:v26];

        [(UIView *)v23 sizeToFit];
        [(UIView *)self addSubview:v23];
        [(UIView *)self bringSubviewToFront:v23];
        CGRect v27 = +[UIColor systemGreenColor];
        CGRect v28 = [v27 colorWithAlphaComponent:0.8];
        [(UIView *)v23 setBackgroundColor:v28];

        debugLabel = self->_debugLabel;
        self->_debugLabel = v23;
        v30 = v23;

        v31 = [(UIView *)self->_debugLabel layer];
        [v31 setAllowsHitTesting:0];

        [(UIView *)v30 setTranslatesAutoresizingMaskIntoConstraints:0];
        v38 = (void *)MEMORY[0x1E4F5B268];
        v43 = [(UIView *)v30 leftAnchor];
        v42 = [(UIView *)self leftAnchor];
        v41 = [v43 constraintEqualToAnchor:v42];
        v44[0] = v41;
        v39 = [(UIView *)v30 topAnchor];
        v40 = [(UIView *)self safeAreaLayoutGuide];
        v37 = [v40 topAnchor];
        v36 = [v39 constraintEqualToAnchor:v37];
        v44[1] = v36;
        v32 = [(UIView *)v30 rightAnchor];
        v33 = [(UIView *)self rightAnchor];
        v34 = [v32 constraintLessThanOrEqualToAnchor:v33];
        v44[2] = v34;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
        [v38 activateConstraints:v35];
      }
    }
  }
LABEL_7:
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)_isHostingRemoteContent
{
  return 1;
}

- (void)requestSceneSettingsUpdateIfNecessary
{
  p_currentSceneFrame = &self->_currentSceneFrame;
  [(_UISceneHostingView *)self portraitSceneFrame];
  v37.origin.double x = v4;
  v37.origin.double y = v5;
  v37.size.double width = v6;
  v37.size.double height = v7;
  if (CGRectEqualToRect(*p_currentSceneFrame, v37))
  {
    double v8 = [(UIView *)self traitCollection];
    if ([v8 isEqual:self->_currentTraitCollection])
    {
      [(UIView *)self safeAreaInsets];
      BOOL v13 = v12 == self->_currentSafeAreaInsets.left && v9 == self->_currentSafeAreaInsets.top;
      BOOL v14 = v13 && v11 == self->_currentSafeAreaInsets.right;
      if (v14 && v10 == self->_currentSafeAreaInsets.bottom)
      {
        v16 = [(UIView *)self tintColor];
        if ([v16 isEqual:self->_currentTintColor])
        {
          BOOL currentShouldUseHostCornerRadius = self->_currentShouldUseHostCornerRadius;
          if (currentShouldUseHostCornerRadius == [(_UISceneHostingView *)self _shouldUseHostCornerRadius])
          {
            v18 = [(UIView *)self _window];
            uint64_t v19 = [v18 interfaceOrientation];
            int64_t currentOrientation = self->_currentOrientation;

            if (v19 == currentOrientation) {
              return;
            }
            goto LABEL_20;
          }
        }
      }
    }
  }
LABEL_20:
  [(_UISceneHostingView *)self portraitSceneFrame];
  p_currentSceneFrame->origin.double x = v21;
  p_currentSceneFrame->origin.double y = v22;
  p_currentSceneFrame->size.double width = v23;
  p_currentSceneFrame->size.double height = v24;
  CGFloat v25 = [(UIView *)self traitCollection];
  currentTraitCollection = self->_currentTraitCollection;
  self->_currentTraitCollection = v25;

  [(UIView *)self safeAreaInsets];
  self->_currentSafeAreaInsets.top = v27;
  self->_currentSafeAreaInsets.left = v28;
  self->_currentSafeAreaInsets.bottom = v29;
  self->_currentSafeAreaInsets.right = v30;
  v31 = [(UIView *)self tintColor];
  currentTintColor = self->_currentTintColor;
  self->_currentTintColor = v31;

  self->_BOOL currentShouldUseHostCornerRadius = [(_UISceneHostingView *)self _shouldUseHostCornerRadius];
  v33 = [(UIView *)self _window];
  self->_int64_t currentOrientation = [v33 interfaceOrientation];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  if (WeakRetained)
  {
    v35 = WeakRetained;
    [WeakRetained _updateSceneSettingsFromSettingsProvidersWithFence:WeakRetained[72] == 0];
    id WeakRetained = v35;
  }
}

- (BOOL)_shouldUseHostCornerRadius
{
  v3 = [(UIView *)self _window];
  CGFloat v4 = [v3 _windowHostingScene];

  if (v4)
  {
    [(UIView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    BOOL v13 = [v4 _coordinateSpace];
    -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v13, v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    CGFloat v22 = [v4 _coordinateSpace];
    [v22 bounds];
    char v27 = _UIRectEquivalentToRectWithAccuracy(v15, v17, v19, v21, v23, v24, v25, v26, 0.1);
  }
  else
  {
    char v27 = 0;
  }

  return v27;
}

- (void)_applyOverridesToHostedSceneSettings:(id)a3
{
  id v20 = a3;
  [(_UISceneHostingView *)self portraitSceneFrame];
  if (v5 != *MEMORY[0x1E4F1DB30] || v4 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    objc_msgSend(v20, "setFrame:");
  }
  if ([v20 isUISubclass])
  {
    id v7 = v20;
    [v7 setSafeAreaInsetsPortrait:_UIPortraitSafeAreaInsetsForSceneHosting(self)];
    double v8 = [(UIView *)self _window];
    uint64_t v9 = [v8 interfaceOrientation];

    if (!v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
      double v11 = WeakRetained;
      if (WeakRetained) {
        double v12 = (void *)*((void *)WeakRetained + 10);
      }
      else {
        double v12 = 0;
      }
      id v13 = v12;
      double v14 = [v13 settings];
      uint64_t v15 = [v14 interfaceOrientation];

      if (v15) {
        goto LABEL_12;
      }
      uint64_t v9 = 1;
    }
    [v7 setInterfaceOrientation:v9];
LABEL_12:
    [v7 setInterfaceOrientationMode:2];
    if ([(_UISceneHostingView *)self _shouldUseHostCornerRadius])
    {
      double v16 = [(UIView *)self _window];
      double v17 = [v16 windowScene];
      double v18 = [v17 _effectiveUISettings];
      double v19 = [v18 cornerRadiusConfiguration];
      [v7 setCornerRadiusConfiguration:v19];
    }
    else
    {
      double v16 = (void *)[objc_alloc(MEMORY[0x1E4F4F700]) initWithCornerRadius:0.0];
      [v7 setCornerRadiusConfiguration:v16];
    }
  }
}

- (UIScenePresenter)_scenePresenter
{
  return self->_scenePresenter;
}

- (_UISceneHostingController)_sceneHostingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHostingController);
  return (_UISceneHostingController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneHostingController);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_currentTintColor, 0);
  objc_storeStrong((id *)&self->_currentTraitCollection, 0);
}

@end