@interface _UIRootWindow
+ (BOOL)_needsPassthroughInteraction;
- ($015CE332057EA49C37F0282AEB389482)_bindingDescription;
- (BOOL)_extendsScreenSceneLifetime;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_touchesInsideShouldHideCalloutBar;
- (BOOL)_transformLayerIncludesScreenRotation;
- (BOOL)_wantsSceneAssociation;
- (CGAffineTransform)_additionalRootLayerAffineTransform;
- (NSString)visibilityEnvironment;
- (_UIRootWindow)initWithDisplay:(id)a3;
- (_UIRootWindow)initWithScreen:(id)a3;
- (id)_context;
- (id)_layerForCoordinateSpaceConversion;
- (id)_visibilityLock_environment;
- (void)_configureRootLayer:(id)a3 sceneTransformLayer:(id)a4 transformLayer:(id)a5;
- (void)_didMoveFromScene:(id)a3 toScene:(id)a4;
- (void)_didMoveFromScreen:(id)a3 toScreen:(id)a4;
- (void)_noteScreenDidChangeMode:(id)a3;
- (void)_prepareHierarchyForWindowHostingSceneRemoval;
- (void)_setAdditionalRootLayerAffineTransform:(CGAffineTransform *)a3;
- (void)_updateVisibility;
- (void)_visibilityLock_enqueueUpdateIfNecessary;
- (void)_visibilityLock_enqueueUpdateIfNecessary_body;
- (void)dealloc;
- (void)setHidden:(BOOL)a3;
- (void)setVisibilityIdentifier:(id)a3;
@end

@implementation _UIRootWindow

- (BOOL)_isWindowServerHostingManaged
{
  return 0;
}

- (id)_layerForCoordinateSpaceConversion
{
  return self->super._rootLayer;
}

- (CGAffineTransform)_additionalRootLayerAffineTransform
{
  long long v3 = *(_OWORD *)&self[20].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[20].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[20].tx;
  return self;
}

- (_UIRootWindow)initWithDisplay:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"_UIRootWindow.m", 51, @"Invalid parameter not satisfying: %@", @"display" object file lineNumber description];
  }
  v6 = [v5 identity];
  currentDisplayIdentity = self->_currentDisplayIdentity;
  self->_currentDisplayIdentity = v6;

  +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v5, [(id)UIApp _hasCalledRunWithMainScene]);
  v8 = +[UIScreen _screenWithFBSDisplayIdentity:self->_currentDisplayIdentity];
  [v8 _scale];
  self->_scale = v9;
  self->super._viewOrientation = 1;
  v10 = (_OWORD *)MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&self->_additionalRootLayerAffineTransform.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v11 = v10[1];
  *(_OWORD *)&self->_additionalRootLayerAffineTransform.a = *v10;
  *(_OWORD *)&self->_additionalRootLayerAffineTransform.c = v11;
  [v5 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [NSString stringWithFormat:@"%@ - display %@", objc_opt_class(), v5];
  v21 = +[UIWindowScene _unassociatedWindowSceneForScreen:v8 create:1];
  v22 = -[UIWindow _initWithFrame:debugName:windowScene:](self, "_initWithFrame:debugName:windowScene:", v20, v21, v13, v15, v17, v19);

  if (v22)
  {
    if ([v5 isExternal]) {
      -[UIWindow setFrame:](v22, "setFrame:", v13, v15, v17, v19);
    }
    [(_UIRootWindow *)v22 _updateVisibility];
  }

  return v22;
}

- (_UIRootWindow)initWithScreen:(id)a3
{
  v4 = [a3 displayConfiguration];
  id v5 = [(_UIRootWindow *)self initWithDisplay:v4];

  return v5;
}

- (void)dealloc
{
  long long v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIScreenDisplayConfigurationUpdatedNotification" object:0];

  [(RBSAssertion *)self->_visibilityProcessingLock_assertion invalidate];
  v4.receiver = self;
  v4.super_class = (Class)_UIRootWindow;
  [(UIWindow *)&v4 dealloc];
}

- (NSString)visibilityEnvironment
{
  p_visibilityLock = &self->_visibilityLock;
  os_unfair_lock_lock(&self->_visibilityLock);
  objc_super v4 = [(_UIRootWindow *)self _visibilityLock_environment];
  os_unfair_lock_unlock(p_visibilityLock);
  return (NSString *)v4;
}

- (void)setVisibilityIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_visibilityLock);
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_super v4 = (NSString *)[v6 copy];
    visibilityLock_identifier = self->_visibilityLock_identifier;
    self->_visibilityLock_identifier = v4;

    [(_UIRootWindow *)self _visibilityLock_enqueueUpdateIfNecessary];
  }
  os_unfair_lock_unlock(&self->_visibilityLock);
}

- (id)_context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._layerContext);
  return WeakRetained;
}

- (void)_setAdditionalRootLayerAffineTransform:(CGAffineTransform *)a3
{
  p_additionalRootLayerAffineTransform = &self->_additionalRootLayerAffineTransform;
  long long v6 = *(_OWORD *)&self->_additionalRootLayerAffineTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_additionalRootLayerAffineTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_additionalRootLayerAffineTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_additionalRootLayerAffineTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_additionalRootLayerAffineTransform->tx = v9;
    *(_OWORD *)&p_additionalRootLayerAffineTransform->a = v8;
    [(UIWindow *)self _updateTransformLayer];
  }
}

- (BOOL)_extendsScreenSceneLifetime
{
  return 1;
}

- (BOOL)_wantsSceneAssociation
{
  return 0;
}

- (BOOL)_touchesInsideShouldHideCalloutBar
{
  return 0;
}

+ (BOOL)_needsPassthroughInteraction
{
  return 0;
}

- ($015CE332057EA49C37F0282AEB389482)_bindingDescription
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  *(void *)&retstr->var9 = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UIRootWindow;
  result = ($015CE332057EA49C37F0282AEB389482 *)[($015CE332057EA49C37F0282AEB389482 *)&v5 _bindingDescription];
  retstr->var1 = 1;
  return result;
}

- (BOOL)_transformLayerIncludesScreenRotation
{
  return 1;
}

- (void)_configureRootLayer:(id)a3 sceneTransformLayer:(id)a4 transformLayer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [(UIWindow *)self screen];
  [v11 _unjailedReferenceBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = v12 + v16 * 0.5;
  double v21 = v14 + v18 * 0.5;
  [v11 scale];
  double v23 = v22;
  [v11 _rotation];
  CGAffineTransformMakeRotation(&v41, -v24);
  *(float64x2_t *)&v41.a = vrndaq_f64(*(float64x2_t *)&v41.a);
  *(float64x2_t *)&v41.c = vrndaq_f64(*(float64x2_t *)&v41.c);
  *(float64x2_t *)&v41.tx = vrndaq_f64(*(float64x2_t *)&v41.tx);
  CGAffineTransform v42 = v41;
  CGAffineTransform v40 = v41;
  CGAffineTransformScale(&v42, &v40, v23, v23);
  long long v25 = *(_OWORD *)&self->_additionalRootLayerAffineTransform.c;
  *(_OWORD *)&v40.a = *(_OWORD *)&self->_additionalRootLayerAffineTransform.a;
  *(_OWORD *)&v40.c = v25;
  *(_OWORD *)&v40.tx = *(_OWORD *)&self->_additionalRootLayerAffineTransform.tx;
  if (!CGAffineTransformIsIdentity(&v40))
  {
    CGAffineTransform t1 = v42;
    long long v26 = *(_OWORD *)&self->_additionalRootLayerAffineTransform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_additionalRootLayerAffineTransform.a;
    *(_OWORD *)&t2.c = v26;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_additionalRootLayerAffineTransform.tx;
    CGAffineTransformConcat(&v40, &t1, &t2);
    CGAffineTransform v42 = v40;
  }
  v27 = [v11 displayConfiguration];
  [v27 renderingCenter];
  objc_msgSend(v10, "setPosition:");

  CGAffineTransform v40 = v42;
  [v10 setAffineTransform:&v40];
  objc_msgSend(v10, "setBounds:", v13, v15, v17, v19);

  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v36 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v40.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v40.c = v35;
  long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v40.tx = v34;
  [v9 setAffineTransform:&v40];
  objc_msgSend(v9, "setPosition:", v20, v21);
  objc_msgSend(v9, "setBounds:", v13, v15, v17, v19);

  objc_msgSend(v8, "setPosition:", v20, v21);
  if ([(id)objc_opt_class() _transformLayerRotationsAreEnabled])
  {
    int64_t viewOrientation = self->super._viewOrientation;
    switch(viewOrientation)
    {
      case 1:
        double v29 = 0.0;
        break;
      case 3:
        double v29 = 1.57079633;
        break;
      case 4:
        double v29 = -1.57079633;
        break;
      default:
        double v29 = 3.14159265;
        if (viewOrientation != 2) {
          double v29 = 0.0;
        }
        break;
    }
    CGAffineTransformMakeRotation(&v37, v29);
    *(float64x2_t *)&v37.a = vrndaq_f64(*(float64x2_t *)&v37.a);
    *(float64x2_t *)&v37.c = vrndaq_f64(*(float64x2_t *)&v37.c);
    *(float64x2_t *)&v37.tx = vrndaq_f64(*(float64x2_t *)&v37.tx);
    CGAffineTransform v40 = v37;
    [v8 setAffineTransform:&v40];
    double v13 = _UIWindowConvertRectFromOrientationToOrientation(1, self->super._viewOrientation, v13, v15, v17, v19, v17, v19);
    double v15 = v30;
    double v17 = v31;
    double v19 = v32;
  }
  else
  {
    *(_OWORD *)&v40.a = v36;
    *(_OWORD *)&v40.c = v35;
    *(_OWORD *)&v40.tx = v34;
    [v8 setAffineTransform:&v40];
  }
  objc_msgSend(v8, "setBounds:", v13, v15, v17, v19);
  [v8 setMasksToBounds:1];
  if (self->_scale != v23)
  {
    self->_scale = v23;
    v33 = [(UIWindow *)self windowScene];
    [v33 _recycleAttachmentForWindow:self];
  }
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIRootWindow;
  [(UIWindow *)&v4 setHidden:a3];
  [(_UIRootWindow *)self _updateVisibility];
}

- (void)_didMoveFromScene:(id)a3 toScene:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)_UIRootWindow;
  id v6 = a4;
  id v7 = a3;
  [(UIWindow *)&v24 _didMoveFromScene:v7 toScene:v6];
  id v8 = objc_msgSend(v7, "_screen", v24.receiver, v24.super_class);

  id v9 = [v8 displayIdentity];

  id v10 = [v6 _screen];

  long long v11 = [v10 displayConfiguration];

  double v12 = [v11 identity];
  id v13 = v9;
  id v14 = v12;
  double v15 = v14;
  if (v13 == v14)
  {

    double v17 = (FBSDisplayIdentity *)v13;
LABEL_25:

    goto LABEL_26;
  }
  if (!v13 || !v14)
  {

    if (v7) {
      goto LABEL_15;
    }
LABEL_9:
    if (v6)
    {
      currentDisplayIdentity = self->_currentDisplayIdentity;
      double v19 = v15;
      double v20 = currentDisplayIdentity;
      if (v19 == v20)
      {

LABEL_24:
        double v23 = v15;
        double v17 = self->_currentDisplayIdentity;
        self->_currentDisplayIdentity = v23;
        goto LABEL_25;
      }
      double v21 = v20;
      if (v15 && v20)
      {
        char v22 = [(FBSDisplayIdentity *)v19 isEqual:v20];

        if (v22) {
          goto LABEL_24;
        }
      }
      else
      {
      }
LABEL_23:
      +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v11, [(id)UIApp _hasCalledRunWithMainScene]);
      goto LABEL_24;
    }
LABEL_15:
    if (!v7 || !v6) {
      goto LABEL_24;
    }
    if (self->_currentDisplayIdentity) {
      +[UIScreen _FBSDisplayIdentityDisconnected:](UIScreen, "_FBSDisplayIdentityDisconnected:");
    }
    if (!v15) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  char v16 = [v13 isEqual:v14];

  if ((v16 & 1) == 0)
  {
    if (v7) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
LABEL_26:
}

- (void)_prepareHierarchyForWindowHostingSceneRemoval
{
  +[UIScreen _FBSDisplayIdentityDisconnected:self->_currentDisplayIdentity];
  currentDisplayIdentity = self->_currentDisplayIdentity;
  self->_currentDisplayIdentity = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIRootWindow;
  [(UIWindow *)&v4 _prepareHierarchyForWindowHostingSceneRemoval];
}

- (void)_didMoveFromScreen:(id)a3 toScreen:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 defaultCenter];
  [v9 removeObserver:self];
  v10.receiver = self;
  v10.super_class = (Class)_UIRootWindow;
  [(UIWindow *)&v10 _didMoveFromScreen:v8 toScreen:v7];

  [v9 addObserver:self selector:sel__noteScreenDidChangeMode_ name:@"_UIScreenDisplayConfigurationUpdatedNotification" object:v7];
}

- (void)_noteScreenDidChangeMode:(id)a3
{
  id v17 = a3;
  objc_super v5 = [v17 object];
  if (!v5)
  {
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UIRootWindow.m", 278, @"got a screen mode change notification without a screen -> %@", v17 object file lineNumber description];
  }
  id v6 = [v5 displayConfiguration];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  -[UIWindow setFrame:](self, "setFrame:", v8, v10, v12, v14);
  [(UIWindow *)self _updateTransformLayer];
  double v15 = [(UIWindow *)self windowScene];
  [v15 _recycleAttachmentForWindow:self];
}

- (void)_updateVisibility
{
  p_visibilityLock = &self->_visibilityLock;
  os_unfair_lock_lock(&self->_visibilityLock);
  BOOL v4 = [(UIView *)self isHidden];
  if (self->_visibilityLock_enabled != !v4)
  {
    self->_visibilityLock_enabled = !v4;
    [(_UIRootWindow *)self _visibilityLock_enqueueUpdateIfNecessary];
  }
  os_unfair_lock_unlock(p_visibilityLock);
}

- (id)_visibilityLock_environment
{
  os_unfair_lock_assert_owner(&self->_visibilityLock);
  visibilityLock_environment = self->_visibilityLock_environment;
  if (!visibilityLock_environment)
  {
    BOOL v4 = _UIVisibilityEnvironmentForRootWindow((uint64_t)self);
    objc_super v5 = (NSString *)[v4 copy];
    id v6 = self->_visibilityLock_environment;
    self->_visibilityLock_environment = v5;

    visibilityLock_environment = self->_visibilityLock_environment;
  }
  return visibilityLock_environment;
}

- (void)_visibilityLock_enqueueUpdateIfNecessary
{
  os_unfair_lock_assert_owner(&self->_visibilityLock);
  if (!self->_visibilityLock_updateEnqueued && (*(void *)&self->super.super._viewFlags & 0x1000) == 0)
  {
    self->_visibilityLock_updateEnqueued = 1;
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3032000000;
    v5[3] = __Block_byref_object_copy__167;
    v5[4] = __Block_byref_object_dispose__167;
    id v6 = self;
    long long v3 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57___UIRootWindow__visibilityLock_enqueueUpdateIfNecessary__block_invoke;
    block[3] = &unk_1E52D9900;
    block[4] = v5;
    dispatch_async(v3, block);

    _Block_object_dispose(v5, 8);
  }
}

- (void)_visibilityLock_enqueueUpdateIfNecessary_body
{
  v21[1] = *MEMORY[0x1E4F143B8];
  p_visibilityProcessingLock = &self->_visibilityProcessingLock;
  os_unfair_lock_lock(&self->_visibilityProcessingLock);
  os_unfair_lock_lock(&self->_visibilityLock);
  BOOL visibilityLock_enabled = self->_visibilityLock_enabled;
  objc_super v5 = [(_UIRootWindow *)self _visibilityLock_environment];
  visibilityLock_identifier = self->_visibilityLock_identifier;
  double v7 = visibilityLock_identifier;
  self->_visibilityLock_updateEnqueued = 0;
  os_unfair_lock_unlock(&self->_visibilityLock);
  if (!BSEqualBools() || (BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visibilityProcessingLock_identifier, visibilityLock_identifier);
    double v8 = self->_visibilityProcessingLock_assertion;
    visibilityProcessingLock_assertion = self->_visibilityProcessingLock_assertion;
    self->_visibilityProcessingLock_assertion = 0;

    if (visibilityLock_enabled)
    {
      double v10 = [MEMORY[0x1E4F96478] targetWithPid:getpid() environmentIdentifier:v5];
      double v20 = [NSString stringWithFormat:@"creating %@ visibility", v10];
      if (v7) {
        double v11 = v7;
      }
      else {
        double v11 = (NSString *)MEMORY[0x1E4F1CC38];
      }
      double v12 = [MEMORY[0x1E4F96370] grantWithNamespace:*MEMORY[0x1E4FB3560] endowment:v11];
      double v13 = p_visibilityProcessingLock;
      double v14 = v5;
      id v15 = objc_alloc(MEMORY[0x1E4F96318]);
      v21[0] = v12;
      char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      id v17 = v15;
      objc_super v5 = v14;
      p_visibilityProcessingLock = v13;
      double v18 = (RBSAssertion *)[v17 initWithExplanation:v20 target:v10 attributes:v16];
      double v19 = self->_visibilityProcessingLock_assertion;
      self->_visibilityProcessingLock_assertion = v18;

      [(RBSAssertion *)self->_visibilityProcessingLock_assertion acquireWithError:0];
    }
    [(RBSAssertion *)v8 invalidate];
  }
  os_unfair_lock_unlock(p_visibilityProcessingLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityProcessingLock_assertion, 0);
  objc_storeStrong((id *)&self->_visibilityProcessingLock_identifier, 0);
  objc_storeStrong((id *)&self->_visibilityLock_identifier, 0);
  objc_storeStrong((id *)&self->_visibilityLock_environment, 0);
  objc_storeStrong((id *)&self->_currentDisplayIdentity, 0);
}

@end