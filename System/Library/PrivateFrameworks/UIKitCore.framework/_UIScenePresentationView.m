@interface _UIScenePresentationView
- (NSString)debugDescription;
- (UIScenePresentationContext)currentPresentationContext;
- (UIScenePresenter)presenter;
- (UIView)backgroundView;
- (_UISceneLayerHostContainerView)hostContainerView;
- (_UIScenePresentationView)initWithPresenter:(id)a3;
- (_UIScenePresenterGeometryDriverStorage)_geometryDriverStorage;
- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)identifier;
- (id)presentationContextForSceneLayerHostContainerView;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_geometryDidUpdateWithTransitionContext:(id)a3;
- (void)_setGeometryDriverStorage:(id)a3;
- (void)_updateBackgroundColor;
- (void)_updateFrameAndTransform;
- (void)_updatePresentationContextFrom:(id)a3 toContext:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidate;
- (void)layoutSubviews;
- (void)removeObserver:(id)a3;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4;
- (void)sceneDidActivate:(id)a3;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
- (void)setBackgroundView:(id)a3;
- (void)setCurrentPresentationContext:(id)a3;
- (void)setHostContainerView:(id)a3;
@end

@implementation _UIScenePresentationView

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 transactionID];
  v7 = [v5 settings];
  effectiveSettings = self->_effectiveSettings;
  self->_effectiveSettings = v7;

  if (!self->_geometrySettingsDiffInspector)
  {
    v9 = (FBSSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F62A88]);
    geometrySettingsDiffInspector = self->_geometrySettingsDiffInspector;
    self->_geometrySettingsDiffInspector = v9;

    [(FBSSceneSettingsDiffInspector *)self->_geometrySettingsDiffInspector observeFrameWithBlock:&__block_literal_global_238];
    [(FBSSceneSettingsDiffInspector *)self->_geometrySettingsDiffInspector observeInterfaceOrientationWithBlock:&__block_literal_global_26_2];
    [(FBSSceneSettingsDiffInspector *)self->_geometrySettingsDiffInspector observeDisplayConfigurationWithBlock:&__block_literal_global_28_1];
  }
  if (v6 <= 1
    || (char v14 = 0,
        v11 = self->_geometrySettingsDiffInspector,
        [v5 settingsDiff],
        v12 = objc_claimAutoreleasedReturnValue(),
        [(FBSSceneSettingsDiffInspector *)v11 inspectDiff:v12 withContext:&v14],
        v12,
        v14))
  {
    v13 = [v5 transitionContext];
    [(_UIScenePresentationView *)self _geometryDidUpdateWithTransitionContext:v13];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIScenePresentationView;
  [(UIView *)&v3 layoutSubviews];
  [(_UIScenePresenterGeometryDriverStorage *)self->_geometryDriverStorage scenePresentationViewIsLayingOutSubviews];
}

- (UIView)backgroundView
{
  BSDispatchQueueAssertMain();
  backgroundView = self->_backgroundView;
  return backgroundView;
}

- (id)presentationContextForSceneLayerHostContainerView
{
  return self->_currentPresentationContext;
}

- (void)setCurrentPresentationContext:(id)a3
{
  v4 = (UIScenePresentationContext *)a3;
  currentPresentationContext = self->_currentPresentationContext;
  if (currentPresentationContext != v4)
  {
    v9 = v4;
    unint64_t v6 = v4;
    v7 = self->_currentPresentationContext;
    self->_currentPresentationContext = v6;
    v8 = currentPresentationContext;

    [(_UIScenePresentationView *)self _updatePresentationContextFrom:v8 toContext:self->_currentPresentationContext];
    v4 = v9;
  }
}

- (void)_updatePresentationContextFrom:(id)a3 toContext:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  [(_UISceneLayerHostContainerView *)self->_hostContainerView refreshDataSource:self];
  v7 = [v16 backgroundColorWhileHosting];
  v8 = [v6 backgroundColorWhileHosting];
  if (BSEqualObjects())
  {
    v9 = [v16 backgroundColorWhileNotHosting];
    v10 = [v6 backgroundColorWhileNotHosting];
    char v11 = BSEqualObjects();

    if (v11) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(_UIScenePresentationView *)self _updateBackgroundColor];
LABEL_6:
  uint64_t v12 = [v16 appearanceStyle];
  if (v12 != [v6 appearanceStyle]
    || ([v16 hostTransformer],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v6 hostTransformer],
        char v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = BSEqualObjects(),
        v14,
        v13,
        (v15 & 1) == 0))
  {
    [(_UIScenePresentationView *)self _updateFrameAndTransform];
  }
  [v16 _isVisibilityPropagationEnabled];
  [v6 _isVisibilityPropagationEnabled];
  if ((BSEqualBools() & 1) == 0) {
    -[_UIVisibilityPropagationInteraction _setVisibilityPropagationEnabled:]((uint64_t)self->super._interaction, [v6 _isVisibilityPropagationEnabled]);
  }
}

- (void)setBackgroundView:(id)a3
{
  id v5 = (UIView *)a3;
  BSDispatchQueueAssertMain();
  if (self->_backgroundView != v5)
  {
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(_UISceneLayerHostContainerView *)self->_hostContainerView refreshDataSource:self];
  }
}

- (void)_updateFrameAndTransform
{
  [(_UISceneLayerHostContainerView *)self->_hostContainerView updateForGeometrySettingsChanges:self->_effectiveSettings];
  [(FBSSceneSettings *)self->_effectiveSettings frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(FBSSceneSettings *)self->_effectiveSettings interfaceOrientation];
  if ((unint64_t)(v12 - 1) >= 4) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v24 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v30.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v30.c = v23;
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v30.tx = v22;
  unint64_t v14 = [(UIScenePresentationContext *)self->_currentPresentationContext appearanceStyle];
  if (v14)
  {
    if (v14 == 2)
    {
      double v5 = _UIWindowConvertRectFromOrientationToOrientation(1, v13, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v9, v11, v9, v11);
      double v7 = v16;
      double v9 = v17;
      double v11 = v18;
      goto LABEL_19;
    }
    if (v14 != 1)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIScenePresentationView.m", 412, @"the appearance style is invalid (%li)", -[UIScenePresentationContext appearanceStyle](self->_currentPresentationContext, "appearanceStyle"));

      goto LABEL_19;
    }
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  switch(v13)
  {
    case 1:
      double v15 = 0.0;
      break;
    case 3:
      double v15 = 1.57079633;
      break;
    case 4:
      double v15 = -1.57079633;
      break;
    default:
      double v15 = 3.14159265;
      if (v13 != 2) {
        double v15 = 0.0;
      }
      break;
  }
  CGAffineTransformMakeRotation(&v29, v15);
  *(float64x2_t *)&v29.a = vrndaq_f64(*(float64x2_t *)&v29.a);
  *(float64x2_t *)&v29.c = vrndaq_f64(*(float64x2_t *)&v29.c);
  *(float64x2_t *)&v29.tx = vrndaq_f64(*(float64x2_t *)&v29.tx);
  CGAffineTransform v30 = v29;
LABEL_19:
  CGAffineTransform v28 = v30;
  [(UIView *)self setTransform:&v28];
  -[UIView setFrame:](self, "setFrame:", v5, v7, v9, v11);
  v20 = [(UIScenePresentationContext *)self->_currentPresentationContext hostTransformer];
  v21 = v20;
  memset(&v28, 0, sizeof(v28));
  if (v20)
  {
    [v20 transform];
  }
  else
  {
    *(_OWORD *)&v28.a = v24;
    *(_OWORD *)&v28.c = v23;
    *(_OWORD *)&v28.tx = v22;
  }
  CGAffineTransform t1 = v30;
  memset(&v27, 0, sizeof(v27));
  CGAffineTransform t2 = v28;
  CGAffineTransformConcat(&v27, &t1, &t2);
  CGAffineTransform t1 = v27;
  [(UIView *)self setTransform:&t1];
}

- (void)setHostContainerView:(id)a3
{
  double v5 = (_UISceneLayerHostContainerView *)a3;
  p_hostContainerView = (id *)&self->_hostContainerView;
  hostContainerView = self->_hostContainerView;
  if (hostContainerView != v5)
  {
    double v9 = v5;
    [(_UISceneLayerHostContainerView *)hostContainerView popDataSource:self];
    id v8 = *p_hostContainerView;
    id *p_hostContainerView = 0;

    if (v9)
    {
      objc_storeStrong((id *)&self->_hostContainerView, a3);
      [*p_hostContainerView pushDataSource:self];
      [*p_hostContainerView updateForGeometrySettingsChanges:self->_effectiveSettings];
    }
    [(UIView *)self addSubview:v9];
    [(_UIScenePresentationView *)self _updateBackgroundColor];
    double v5 = v9;
  }
}

- (void)_updateBackgroundColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  int v4 = [WeakRetained isHosting];

  currentPresentationContext = self->_currentPresentationContext;
  if (v4) {
    [(UIScenePresentationContext *)currentPresentationContext backgroundColorWhileHosting];
  }
  else {
  id v6 = [(UIScenePresentationContext *)currentPresentationContext backgroundColorWhileNotHosting];
  }
  [(UIView *)self setBackgroundColor:v6];
}

- (void)didMoveToWindow
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UIScenePresentationView;
  [(UIView *)&v14 didMoveToWindow];
  objc_super v3 = [(UIView *)self window];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 presentationView:self didMoveToWindow:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)addObserver:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UIScenePresentationView.m", 135, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v9];
}

- (_UIScenePresentationView)initWithPresenter:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_UIScenePresentationView;
  uint64_t v5 = -[_UIVisibilityPropagationView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presenter, v4);
    uint64_t v7 = [v4 presentationContext];
    currentPresentationContext = v6->_currentPresentationContext;
    v6->_currentPresentationContext = (UIScenePresentationContext *)v7;

    uint64_t v9 = [v4 scene];
    scene = v6->_scene;
    v6->_scene = (FBScene *)v9;

    long long v11 = [(FBScene *)v6->_scene clientHandle];
    long long v12 = [v11 processHandle];
    uint64_t v13 = [v12 pid];

    if ((int)v13 >= 1)
    {
      objc_super v14 = (void *)MEMORY[0x1E4F96478];
      double v15 = [(FBScene *)v6->_scene identityToken];
      uint64_t v16 = [v15 stringRepresentation];
      double v17 = _UISVisibilityEnvironmentForSceneIdentityTokenString();
      double v18 = [v14 targetWithPid:v13 environmentIdentifier:v17];
      -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)v6->super._interaction, v18);
    }
    -[_UIVisibilityPropagationInteraction _setVisibilityPropagationEnabled:]((uint64_t)v6->super._interaction, [(UIScenePresentationContext *)v6->_currentPresentationContext _isVisibilityPropagationEnabled]);
    [(FBScene *)v6->_scene addObserver:v6];
    uint64_t v19 = [(FBScene *)v6->_scene settings];
    effectiveSettings = v6->_effectiveSettings;
    v6->_effectiveSettings = (FBSSceneSettings *)v19;

    [(_UIScenePresentationView *)v6 _updateFrameAndTransform];
  }

  return v6;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_UIScenePresentationView.m" lineNumber:85 description:@"Cannot dealloc a _UIScenePresentation view if it hasn't been invalidated first."];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIScenePresentationView;
  [(_UIVisibilityPropagationView *)&v5 dealloc];
}

- (_UIScenePresenterGeometryDriverStorage)_geometryDriverStorage
{
  geometryDriverStorage = self->_geometryDriverStorage;
  if (!geometryDriverStorage)
  {
    id v4 = [[_UIScenePresenterGeometryDriverStorage alloc] initWithScenePresentationView:self];
    objc_super v5 = self->_geometryDriverStorage;
    self->_geometryDriverStorage = v4;

    geometryDriverStorage = self->_geometryDriverStorage;
  }
  uint64_t v6 = geometryDriverStorage;
  return v6;
}

- (void)removeObserver:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  id v4 = v7;
  if (v7)
  {
    [(NSHashTable *)self->_observers removeObject:v7];
    NSUInteger v5 = [(NSHashTable *)self->_observers count];
    id v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      id v4 = v7;
    }
  }
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UIView *)self window];

  if (v11 == v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)_UIScenePresentationView;
    -[UIView _hitTest:withEvent:windowServerHitTestWindow:](&v16, sel__hitTest_withEvent_windowServerHitTestWindow_, v9, v10, x, y);
    uint64_t v13 = (_UIScenePresentationView *)objc_claimAutoreleasedReturnValue();
    if ([(UIScenePresentationContext *)self->_currentPresentationContext shouldPassthroughHitTestEventsIfTransparent])
    {
      BOOL v14 = v13 == self;
    }
    else
    {
      BOOL v14 = 0;
    }
    if (v14) {
      long long v12 = 0;
    }
    else {
      long long v12 = v13;
    }
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(FBSSceneSettingsDiffInspector *)self->_geometrySettingsDiffInspector removeAllObservers];
    [(FBScene *)self->_scene removeObserver:self];
    [(_UISceneLayerHostContainerView *)self->_hostContainerView popDataSource:self];
    hostContainerView = self->_hostContainerView;
    self->_hostContainerView = 0;

    interaction = self->super._interaction;
    -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)interaction, 0);
  }
}

- (UIScenePresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (UIScenePresenter *)WeakRetained;
}

- (id)identifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_super v3 = [WeakRetained identifier];

  return v3;
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  id v14 = a3;
  uint64_t v6 = [a4 processHandle];
  uint64_t v7 = [v6 pid];

  uint64_t v8 = v14;
  if ((int)v7 >= 1)
  {
    id v9 = (void *)MEMORY[0x1E4F96478];
    id v10 = [v14 identityToken];
    id v11 = [v10 stringRepresentation];
    long long v12 = _UISVisibilityEnvironmentForSceneIdentityTokenString();
    uint64_t v13 = [v9 targetWithPid:v7 environmentIdentifier:v12];
    if (self) {
      -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)self->super._interaction, v13);
    }

    uint64_t v8 = v14;
  }
}

- (void)sceneDidActivate:(id)a3
{
  id v13 = a3;
  id v4 = [v13 clientHandle];
  NSUInteger v5 = [v4 processHandle];
  uint64_t v6 = [v5 pid];

  uint64_t v7 = v13;
  if ((int)v6 >= 1)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F96478];
    id v9 = [v13 identityToken];
    id v10 = [v9 stringRepresentation];
    id v11 = _UISVisibilityEnvironmentForSceneIdentityTokenString();
    long long v12 = [v8 targetWithPid:v6 environmentIdentifier:v11];
    if (self) {
      -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)self->super._interaction, v12);
    }

    uint64_t v7 = v13;
  }
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  if (self) {
    -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)self->super._interaction, 0);
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIScenePresentationView *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UIScenePresentationView *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  id v5 = (id)[v3 appendObject:WeakRetained withName:@"presenter" skipIfNil:1];

  uint64_t v6 = [(UIScenePresentationContext *)self->_currentPresentationContext _exclusiveLayerTargetsToInclude];
  if ([v6 count] == 1)
  {
    uint64_t v7 = [v6 anyObject];
    id v8 = (id)[v3 appendObject:v7 withName:@"exclusiveHostLayerTarget"];
  }
  else if ([v6 count])
  {
    id v9 = (id)[v3 appendObject:v6 withName:@"exclusiveHostLayerTargets"];
  }
  id v10 = [(FBScene *)self->_scene identifier];
  id v11 = (id)[v3 appendObject:v10 withName:@"sceneID" skipIfNil:1];

  [(UIView *)self frame];
  id v12 = (id)objc_msgSend(v3, "appendRect:withName:", @"frame");
  [(UIView *)self transform];
  if (!CGAffineTransformIsIdentity(&v18))
  {
    [(UIView *)self transform];
    id v13 = NSStringFromCGAffineTransform(&v17);
    id v14 = (id)[v3 appendObject:v13 withName:@"transform"];
  }
  id v15 = (id)objc_msgSend(v3, "appendBool:withName:", -[UIView isHidden](self, "isHidden"), @"hidden");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(_UIScenePresentationView *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIScenePresentationView *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66___UIScenePresentationView_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

- (void)_geometryDidUpdateWithTransitionContext:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F680];
  id v5 = [a3 animationSettings];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68___UIScenePresentationView__geometryDidUpdateWithTransitionContext___block_invoke;
  v6[3] = &unk_1E52DC3A0;
  v6[4] = self;
  [v4 tryAnimatingWithSettings:v5 actions:v6 completion:0];
}

- (UIScenePresentationContext)currentPresentationContext
{
  return self->_currentPresentationContext;
}

- (_UISceneLayerHostContainerView)hostContainerView
{
  return self->_hostContainerView;
}

- (void)_setGeometryDriverStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometryDriverStorage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_geometrySettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_hostContainerView, 0);
  objc_storeStrong((id *)&self->_currentPresentationContext, 0);
  objc_storeStrong((id *)&self->_effectiveSettings, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

@end