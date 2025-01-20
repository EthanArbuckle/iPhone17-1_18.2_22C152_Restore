@interface _UISceneLayerHostContainerView
- (BOOL)_canShowKeyboardLayer;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (FBScene)scene;
- (NSSet)hostedLayers;
- (NSSet)nonHostedLayers;
- (NSString)debugDescription;
- (_UISceneLayerHostContainerView)init;
- (_UISceneLayerHostContainerView)initWithCoder:(id)a3;
- (_UISceneLayerHostContainerView)initWithFrame:(CGRect)a3;
- (_UISceneLayerHostContainerView)initWithScene:(id)a3 debugDescription:(id)a4;
- (_UISceneLayerHostContainerViewDataSource)dataSource;
- (id)_asyncContext;
- (id)_asyncRenderingContainerView;
- (id)_asyncRenderingHostView;
- (id)_backgroundView;
- (id)_createHostViewForLayer:(id)a3;
- (id)_filteredLayersToPresent;
- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5;
- (id)_hostViews;
- (id)_presentationContext;
- (id)_presentationContextForLayer:(id)a3;
- (id)_realHostedLayers;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)window;
- (int64_t)_focusedSound;
- (void)_adjustHostViewFrameAlignment:(id)a3;
- (void)_applyBackgroundViewToHierarchy;
- (void)_invalidateAndRemoveAsyncViewsFromHierarchy;
- (void)_presentationContextChangedFrom:(id)a3 toContext:(id)a4 force:(BOOL)a5;
- (void)_rebuildLayersForAsyncPresentationWithReason:(id)a3 withFence:(id)a4;
- (void)_rebuildLayersForNormalPresentationWithReason:(id)a3 withFence:(id)a4;
- (void)_rebuildLayersForReason:(id)a3 withFence:(id)a4;
- (void)_refreshDataSource;
- (void)_setBackgroundView:(id)a3;
- (void)_setDataSource:(id)a3;
- (void)_setPresentationContext:(id)a3;
- (void)_toggleClippingDisabledWithNewContext:(id)a3;
- (void)_toggleInheritsSecurityWithNewContext:(id)a3;
- (void)_toggleResizesHostedContextWithNewContext:(id)a3;
- (void)_toggleStopsHitTestTransformAccumulationWithNewContext:(id)a3;
- (void)_toggleStopsSecureSuperlayersValidationWithNewContext:(id)a3;
- (void)_updateAsyncDrawingOptionsInAsyncPresentation;
- (void)_updateRenderingModeForLayersInNormalPresentation;
- (void)dealloc;
- (void)invalidate;
- (void)popDataSource:(id)a3;
- (void)pushDataSource:(id)a3;
- (void)refreshDataSource:(id)a3;
- (void)sceneLayerManagerDidUpdateLayers:(id)a3;
- (void)updateForGeometrySettingsChanges:(id)a3;
@end

@implementation _UISceneLayerHostContainerView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  return 0;
}

- (id)window
{
  v9.receiver = self;
  v9.super_class = (Class)_UISceneLayerHostContainerView;
  v3 = [(UIView *)&v9 window];
  if (!v3)
  {
    uint64_t v5 = [(UIView *)self layer];
    if (v5)
    {
      v6 = (void *)v5;
      while (1)
      {
        v7 = [v6 delegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          break;
        }
        v3 = [v6 superlayer];

        v6 = v3;
        if (!v3) {
          goto LABEL_2;
        }
      }
      v3 = [v6 delegate];
    }
    else
    {
      v3 = 0;
    }
  }
LABEL_2:
  return v3;
}

- (id)_createHostViewForLayer:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  int v6 = [WeakRetained isValid];

  if (!v6)
  {
    v7 = 0;
    goto LABEL_14;
  }
  if ([v4 contextID])
  {
    v7 = [[_UIContextLayerHostView alloc] initWithSceneLayer:v4];
  }
  else
  {
    if ([v4 type] == 3
      && [(_UISceneLayerHostContainerView *)self _canShowKeyboardLayer])
    {
      v8 = [_UIKeyboardLayerHostView alloc];
      id v9 = objc_loadWeakRetained((id *)&self->_scene);
      uint64_t v10 = [(_UIKeyboardLayerHostView *)v8 initWithKeyboardLayer:v4 owningScene:v9];
    }
    else
    {
      if ([v4 type] != 4
        || ![(_UISceneLayerHostContainerView *)self _canShowKeyboardLayer])
      {
        v7 = 0;
        goto LABEL_13;
      }
      v11 = [_UIKeyboardLayerHostView alloc];
      id v9 = objc_loadWeakRetained((id *)&self->_scene);
      uint64_t v10 = [(_UIKeyboardLayerHostView *)v11 initWithKeyboardProxyLayer:v4 owningScene:v9];
    }
    v7 = (_UIContextLayerHostView *)v10;
  }
LABEL_13:
  [(_UISceneLayerHostView *)v7 setCurrentPresentationContext:self->_presentationContext];
LABEL_14:

  return v7;
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
}

- (void)_presentationContextChangedFrom:(id)a3 toContext:(id)a4 force:(BOOL)a5
{
  id v30 = a3;
  id v8 = a4;
  uint64_t v9 = [v30 presentedLayerTypes];
  uint64_t v10 = [v8 presentedLayerTypes];
  v11 = [v30 _exclusiveLayerTargetsToInclude];
  v12 = [v8 _exclusiveLayerTargetsToInclude];
  int v13 = BSEqualSets();

  v14 = [v30 _layerTargetsToExclude];
  v15 = [v8 _layerTargetsToExclude];
  int v16 = BSEqualSets();

  uint64_t v17 = [v30 layerPresentationOverrides];
  v18 = [v8 layerPresentationOverrides];
  int v19 = BSEqualDictionaries();

  LOBYTE(v17) = [v30 renderingMode] != 1;
  unsigned __int8 v20 = v17 ^ ([v8 renderingMode] == 1);
  if (v20)
  {
    v21 = 0;
  }
  else
  {
    v21 = +[UIScene _synchronizeDrawingAndReturnFence];
  }
  v22 = v30;
  if (a5)
  {
    [(_UISceneLayerHostContainerView *)self _rebuildLayersForReason:@"forced" withFence:v21];
    [(_UISceneLayerHostContainerView *)self _toggleClippingDisabledWithNewContext:v8];
    [(_UISceneLayerHostContainerView *)self _toggleInheritsSecurityWithNewContext:v8];
    [(_UISceneLayerHostContainerView *)self _toggleResizesHostedContextWithNewContext:v8];
    [(_UISceneLayerHostContainerView *)self _toggleStopsHitTestTransformAccumulationWithNewContext:v8];
    [(_UISceneLayerHostContainerView *)self _toggleStopsSecureSuperlayersValidationWithNewContext:v8];
  }
  else
  {
    if (v9 == v10) {
      int v23 = v19;
    }
    else {
      int v23 = 0;
    }
    if (v9 == v10) {
      v24 = @"layer presentation overrides changed";
    }
    else {
      v24 = @"presented layer types changed";
    }
    if (v23 != 1
      || ((v13 & v16) == 0
        ? (v24 = @"included or excluded windows changed")
        : (v24 = @"async render grouping changed"),
          ((v13 & v16) & v20 & 1) == 0))
    {
      [(_UISceneLayerHostContainerView *)self _rebuildLayersForReason:v24 withFence:v21];
      v22 = v30;
    }
    objc_msgSend(v22, "isClippingDisabled", v24);
    [v8 isClippingDisabled];
    if ((BSEqualBools() & 1) == 0) {
      [(_UISceneLayerHostContainerView *)self _toggleClippingDisabledWithNewContext:v8];
    }
    [v30 inheritsSecurity];
    [v8 inheritsSecurity];
    if ((BSEqualBools() & 1) == 0) {
      [(_UISceneLayerHostContainerView *)self _toggleInheritsSecurityWithNewContext:v8];
    }
    [v30 resizesHostedContext];
    [v8 resizesHostedContext];
    if ((BSEqualBools() & 1) == 0) {
      [(_UISceneLayerHostContainerView *)self _toggleResizesHostedContextWithNewContext:v8];
    }
    [v30 stopsHitTestTransformAccumulation];
    [v8 stopsHitTestTransformAccumulation];
    if ((BSEqualBools() & 1) == 0) {
      [(_UISceneLayerHostContainerView *)self _toggleStopsHitTestTransformAccumulationWithNewContext:v8];
    }
    [v30 stopsSecureSuperlayersValidation];
    [v8 stopsSecureSuperlayersValidation];
    if ((BSEqualBools() & 1) == 0) {
      [(_UISceneLayerHostContainerView *)self _toggleStopsSecureSuperlayersValidationWithNewContext:v8];
    }
    v25 = [v30 _minificationFilterName];
    v26 = [v8 _minificationFilterName];
    if (v25 == v26)
    {
      v27 = [v30 asynchronousRenderingOptions];
      v28 = [v8 asynchronousRenderingOptions];
      char v29 = BSEqualObjects();

      if (v29) {
        goto LABEL_33;
      }
    }
    else
    {
    }
  }
  if (self->_asyncRenderGroupingContext)
  {
    [(_UISceneLayerHostContainerView *)self _updateAsyncDrawingOptionsInAsyncPresentation];
LABEL_33:
    if (!v21) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  [(_UISceneLayerHostContainerView *)self _updateRenderingModeForLayersInNormalPresentation];
  if (v21) {
LABEL_34:
  }
    [v21 invalidate];
LABEL_35:
}

- (void)_updateRenderingModeForLayersInNormalPresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(UIScenePresentationContext *)self->_presentationContext renderingMode])
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:832 description:@"Rendering mode must be normal"];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_hostViews;
  uint64_t v4 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v23 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v8 = [v7 sceneLayer];
        uint64_t v9 = [(_UISceneLayerHostContainerView *)self _presentationContextForLayer:v8];

        uint64_t v10 = [v9 renderingMode];
        v11 = [v9 _minificationFilterName];
        if (!v10)
        {
          uint64_t v10 = [(UIScenePresentationContext *)self->_presentationContext renderingMode];
          uint64_t v12 = [(UIScenePresentationContext *)self->_presentationContext _minificationFilterName];

          v11 = (void *)v12;
        }
        uint64_t v13 = objc_opt_class();
        id v14 = v7;
        if (v13)
        {
          if (objc_opt_isKindOfClass()) {
            v15 = v14;
          }
          else {
            v15 = 0;
          }
        }
        else
        {
          v15 = 0;
        }
        id v16 = v15;

        [v16 setRenderingMode:v10];
        uint64_t v17 = [(UIScenePresentationContext *)self->_presentationContext asynchronousRenderingOptions];
        [v16 setAsynchronousRenderingOptions:v17];

        v18 = [v16 layer];
        int v19 = [(FBSSceneSettings *)self->_effectiveSceneSettings displayConfiguration];
        [v19 scale];
        objc_msgSend(v18, "setRasterizationScale:");

        unsigned __int8 v20 = [v16 layer];

        [v20 setMinificationFilter:v11];
      }
      uint64_t v5 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }
}

- (id)_presentationContextForLayer:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__97;
  v18 = __Block_byref_object_dispose__97;
  id v19 = 0;
  uint64_t v5 = [(UIScenePresentationContext *)self->_presentationContext layerPresentationOverrides];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63___UISceneLayerHostContainerView__presentationContextForLayer___block_invoke;
  v11[3] = &unk_1E52EF648;
  id v6 = v4;
  id v12 = v6;
  uint64_t v13 = &v14;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  v7 = (void *)v15[5];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = objc_alloc_init(UISceneLayerPresentationContext);
  }
  uint64_t v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)_adjustHostViewFrameAlignment:(id)a3
{
  id v4 = a3;
  long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v37 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v43.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v43.c = v36;
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v43.tx = v35;
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [v4 sceneLayer];
  uint64_t v14 = [v13 alignment];

  if (v14 == 1)
  {
    uint64_t v15 = [(FBSSceneSettings *)self->_effectiveSceneSettings interfaceOrientation];
    [(FBSSceneSettings *)self->_effectiveSceneSettings frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = -v20;
    double v23 = -v22;
    long long v24 = [(FBSSceneSettings *)self->_effectiveSceneSettings displayConfiguration];
    [v24 bounds];
    double v26 = v25;
    double v28 = v27;

    double v6 = _UIWindowConvertRectFromOrientationToOrientation(1, v15, v21, v23, v26, v28, v17, v19);
    double v8 = v29;
    double v10 = v30;
    double v12 = v31;
    switch(v15)
    {
      case 1:
        double v32 = 0.0;
        break;
      case 3:
        double v32 = 1.57079633;
        break;
      case 4:
        double v32 = -1.57079633;
        break;
      default:
        double v32 = 3.14159265;
        if (v15 != 2) {
          double v32 = 0.0;
        }
        break;
    }
    CGAffineTransformMakeRotation(&v41, -v32);
    *(float64x2_t *)&v41.a = vrndaq_f64(*(float64x2_t *)&v41.a);
    *(float64x2_t *)&v41.c = vrndaq_f64(*(float64x2_t *)&v41.c);
    *(float64x2_t *)&v41.tx = vrndaq_f64(*(float64x2_t *)&v41.tx);
    CGAffineTransform v42 = v41;
    [v4 setCounterTransformView:1];
    CGAffineTransform v43 = v42;
  }
  CGAffineTransform v42 = v43;
  [v4 setTransform:&v42];
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v12);
  CGAffineTransform v42 = v43;
  v33 = [v4 transformer];
  v34 = v33;
  if (v33)
  {
    [v33 transform];
    *(_OWORD *)&t1.a = v37;
    *(_OWORD *)&t1.c = v36;
    *(_OWORD *)&t1.tx = v35;
    if (!CGAffineTransformEqualToTransform(&t1, &t2))
    {
      [v34 transform];
      CGAffineTransform t1 = v43;
      CGAffineTransformConcat(&v42, &t1, &v38);
      CGAffineTransform t1 = v42;
      [v4 setTransform:&t1];
    }
  }
}

- (void)_toggleStopsSecureSuperlayersValidationWithNewContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = self->_hostViews;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setStopsSecureSuperlayersValidation:", objc_msgSend(v4, "stopsSecureSuperlayersValidation", (void)v10));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_toggleStopsHitTestTransformAccumulationWithNewContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = self->_hostViews;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setStopsHitTestTransformAccumulation:", objc_msgSend(v4, "stopsHitTestTransformAccumulation", (void)v10));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)refreshDataSource:(id)a3
{
  id v8 = a3;
  if (self->_invalidated)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:175 description:@"Unable to refresh a data source on an invalidated host container"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  uint64_t v6 = v8;
  if (WeakRetained == v8)
  {
    [(_UISceneLayerHostContainerView *)self _refreshDataSource];
    uint64_t v6 = v8;
  }
}

- (void)_refreshDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = [WeakRetained presentationContextForSceneLayerHostContainerView];
  [(_UISceneLayerHostContainerView *)self _setPresentationContext:v3];

  id v4 = [WeakRetained backgroundView];
  [(_UISceneLayerHostContainerView *)self _setBackgroundView:v4];
}

- (void)_setBackgroundView:(id)a3
{
  double v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    id v8 = v5;
    uint64_t v7 = backgroundView;
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(_UISceneLayerHostContainerView *)self _applyBackgroundViewToHierarchy];
    if (v7) {
      [(UIView *)v7 removeFromSuperview];
    }

    double v5 = v8;
  }
}

- (void)_setPresentationContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = (UIScenePresentationContext *)a3;
  p_presentationContext = &self->_presentationContext;
  presentationContext = self->_presentationContext;
  if (presentationContext != v5)
  {
    id v8 = presentationContext;
    objc_storeStrong((id *)&self->_presentationContext, a3);
    [(_UISceneLayerHostContainerView *)self _presentationContextChangedFrom:v8 toContext:*p_presentationContext force:0];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = self->_hostViews;
    uint64_t v10 = [(NSMutableOrderedSet *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13++), "setCurrentPresentationContext:", v5, (void)v15);
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableOrderedSet *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    if (self->_asyncRenderGroupingContainerView)
    {
      uint64_t v14 = (void *)[(UIScenePresentationContext *)*p_presentationContext mutableCopy];
      [v14 setRenderingMode:0];
      [(_UISceneLayerHostContainerView *)self->_asyncRenderGroupingContainerView _setPresentationContext:v14];
    }
  }
}

- (void)_rebuildLayersForNormalPresentationWithReason:(id)a3 withFence:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(UIScenePresentationContext *)self->_presentationContext renderingMode])
  {
    double v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:731 description:@"Rendering mode must be normal here"];
  }
  uint64_t v9 = (void *)[(NSMutableOrderedSet *)self->_hostedLayers mutableCopy];
  uint64_t v10 = (void *)[(NSMutableOrderedSet *)self->_hostViews mutableCopy];
  [(NSMutableOrderedSet *)self->_hostedLayers removeAllObjects];
  [(NSMutableOrderedSet *)self->_hostViews removeAllObjects];
  if (v8)
  {
    asyncRenderGroupingContext = self->_asyncRenderGroupingContext;
    if (asyncRenderGroupingContext) {
      [(CAContext *)asyncRenderGroupingContext addFence:v8];
    }
  }
  [(_UISceneLayerHostContainerView *)self _invalidateAndRemoveAsyncViewsFromHierarchy];
  uint64_t v12 = [(_UISceneLayerHostContainerView *)self _filteredLayersToPresent];
  uint64_t v13 = UIScenePresentationLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    double v23 = (objc_class *)objc_opt_class();
    double v29 = NSStringFromClass(v23);
    double v28 = [(_UISceneLayerHostContainerView *)self scene];
    double v26 = [v28 identifier];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained identifier];
    *(_DWORD *)buf = 134219266;
    CGAffineTransform v42 = self;
    __int16 v43 = 2114;
    v44 = v29;
    __int16 v45 = 2114;
    v46 = v26;
    v48 = __int16 v47 = 2114;
    long long v24 = (void *)v48;
    __int16 v49 = 2114;
    id v50 = v7;
    __int16 v51 = 2114;
    v52 = v12;
    _os_log_debug_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEBUG, "%p-%{public}@-%{public}@:%{public}@ - reason: %{public}@, new layers: %{public}@", buf, 0x3Eu);
  }
  BOOL v14 = [(UIScenePresentationContext *)self->_presentationContext isClippingDisabled];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __90___UISceneLayerHostContainerView__rebuildLayersForNormalPresentationWithReason_withFence___block_invoke;
  v34[3] = &unk_1E52EF620;
  id v15 = v9;
  id v35 = v15;
  id v16 = v10;
  long long v37 = self;
  SEL v38 = a2;
  id v36 = v16;
  BOOL v39 = v14;
  [v12 enumerateObjectsUsingBlock:v34];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "removeFromSuperview", v26);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v19);
  }

  double v22 = [(UIView *)self->_backgroundView superview];

  if (v22 != self) {
    [(_UISceneLayerHostContainerView *)self _applyBackgroundViewToHierarchy];
  }
  [(_UISceneLayerHostContainerView *)self _updateRenderingModeForLayersInNormalPresentation];
}

- (void)_applyBackgroundViewToHierarchy
{
  if (self->_asyncRenderGroupingContainerView)
  {
    v3 = [(UIView *)self->_backgroundView superview];

    if (v3 == self) {
      [(UIView *)self->_backgroundView removeFromSuperview];
    }
    asyncRenderGroupingContainerView = self->_asyncRenderGroupingContainerView;
    backgroundView = self->_backgroundView;
    [(_UISceneLayerHostContainerView *)asyncRenderGroupingContainerView _setBackgroundView:backgroundView];
  }
  else
  {
    [0 _setBackgroundView:0];
    uint64_t v6 = self->_backgroundView;
    [(UIView *)self insertSubview:v6 atIndex:0];
  }
}

- (void)_rebuildLayersForReason:(id)a3 withFence:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UIScenePresentationLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = [(_UISceneLayerHostContainerView *)self scene];
    uint64_t v12 = [v11 identifier];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    BOOL v14 = [WeakRetained identifier];
    int v15 = 134219010;
    id v16 = self;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v12;
    __int16 v21 = 2114;
    double v22 = v14;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "%p-%{public}@-%{public}@:%{public}@ - rebuilding layers for reason: %{public}@", (uint8_t *)&v15, 0x34u);
  }
  if ([(UIScenePresentationContext *)self->_presentationContext renderingMode] == 1) {
    [(_UISceneLayerHostContainerView *)self _rebuildLayersForAsyncPresentationWithReason:v6 withFence:v7];
  }
  else {
    [(_UISceneLayerHostContainerView *)self _rebuildLayersForNormalPresentationWithReason:v6 withFence:v7];
  }
}

- (void)_invalidateAndRemoveAsyncViewsFromHierarchy
{
  asyncRenderGroupingContext = self->_asyncRenderGroupingContext;
  if (asyncRenderGroupingContext)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy__97;
    v10[4] = __Block_byref_object_dispose__97;
    uint64_t v11 = asyncRenderGroupingContext;
    [MEMORY[0x1E4F39CF8] activate];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77___UISceneLayerHostContainerView__invalidateAndRemoveAsyncViewsFromHierarchy__block_invoke;
    v9[3] = &unk_1E52D9900;
    v9[4] = v10;
    if (([MEMORY[0x1E4F39CF8] addCommitHandler:v9 forPhase:5] & 1) == 0)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UISceneLayerHostContainerView.m", 811, @"failed to register commit handler for phase = kCATransactionPhasePostSynchronize (current is %i)", objc_msgSend(MEMORY[0x1E4F39CF8], "currentPhase"));
    }
    [(CAContext *)self->_asyncRenderGroupingContext setLayer:0];
    double v5 = self->_asyncRenderGroupingContext;
    self->_asyncRenderGroupingContext = 0;

    [(UIView *)self->_asyncRenderGroupingHostView removeFromSuperview];
    asyncRenderGroupingHostView = self->_asyncRenderGroupingHostView;
    self->_asyncRenderGroupingHostView = 0;

    [(UIView *)self->_asyncRenderGroupingContainerView removeFromSuperview];
    [(_UISceneLayerHostContainerView *)self->_asyncRenderGroupingContainerView invalidate];
    asyncRenderGroupingContainerView = self->_asyncRenderGroupingContainerView;
    self->_asyncRenderGroupingContainerView = 0;

    _Block_object_dispose(v10, 8);
  }
}

- (id)_filteredLayersToPresent
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  p_scene = &self->_scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  int v6 = [WeakRetained isValid];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA70] orderedSet];
    id v8 = objc_loadWeakRetained((id *)p_scene);
    uint64_t v9 = [v8 layerManager];
    uint64_t v10 = [v9 layers];

    uint64_t v11 = [(UIScenePresentationContext *)self->_presentationContext _exclusiveLayerTargetsToInclude];
    CGAffineTransform v42 = v10;
    obuint64_t j = v11;
    if (v11)
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v43 = [v11 countByEnumeratingWithState:&v65 objects:v73 count:16];
      if (v43)
      {
        uint64_t v41 = *(void *)v66;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v66 != v41) {
              objc_enumerationMutation(obj);
            }
            v44 = v12;
            uint64_t v13 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v12);
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            id v14 = v10;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v61 objects:v72 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v62;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v62 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v61 + 1) + 8 * i);
                  if ([v13 matchesLayer:v19])
                  {
                    if ([v7 containsObject:v19])
                    {
                      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
                      [v20 handleFailureInMethod:a2, self, @"_UISceneLayerHostContainerView.m", 626, @"Cannot have multiple targets matching the same layer: %@: targets=%@", v19, obj object file lineNumber description];
                    }
                    else
                    {
                      [v7 addObject:v19];
                    }
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v61 objects:v72 count:16];
              }
              while (v16);
            }

            uint64_t v12 = v44 + 1;
            uint64_t v10 = v42;
          }
          while (v44 + 1 != (char *)v43);
          uint64_t v43 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
        }
        while (v43);
      }
      [v7 sortUsingComparator:&__block_literal_global_236];
    }
    else
    {
      [v7 unionOrderedSet:v10];
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    double v22 = (void *)[v7 copy];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v71 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v58 != v25) {
            objc_enumerationMutation(v22);
          }
          double v27 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          [(UIScenePresentationContext *)self->_presentationContext presentedLayerTypes];
          [v27 type];
          if ((FBSceneLayerTypeMaskContainsType() & 1) == 0) {
            [v7 removeObject:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v57 objects:v71 count:16];
      }
      while (v24);
    }

    double v28 = [(UIScenePresentationContext *)self->_presentationContext layerPresentationOverrides];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __58___UISceneLayerHostContainerView__filteredLayersToPresent__block_invoke_2;
    v55[3] = &unk_1E52EF5F8;
    id v21 = v7;
    id v56 = v21;
    [v28 enumerateKeysAndObjectsUsingBlock:v55];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v45 = [(UIScenePresentationContext *)self->_presentationContext _layerTargetsToExclude];
    uint64_t v29 = [v45 countByEnumeratingWithState:&v51 objects:v70 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v52;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v52 != v31) {
            objc_enumerationMutation(v45);
          }
          long long v33 = *(void **)(*((void *)&v51 + 1) + 8 * k);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          v34 = (void *)[v21 copy];
          uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v69 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v48;
            while (2)
            {
              for (uint64_t m = 0; m != v36; ++m)
              {
                if (*(void *)v48 != v37) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v39 = *(void *)(*((void *)&v47 + 1) + 8 * m);
                if ([v33 matchesLayer:v39])
                {
                  [v21 removeObject:v39];
                  goto LABEL_48;
                }
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v69 count:16];
              if (v36) {
                continue;
              }
              break;
            }
          }
LABEL_48:
        }
        uint64_t v30 = [v45 countByEnumeratingWithState:&v51 objects:v70 count:16];
      }
      while (v30);
    }
  }
  else
  {
    id v21 = 0;
  }
  return v21;
}

- (void)_rebuildLayersForAsyncPresentationWithReason:(id)a3 withFence:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UIScenePresentationLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v37 = id v36 = v6;
    SEL v38 = [(_UISceneLayerHostContainerView *)self scene];
    uint64_t v39 = [v38 identifier];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v41 = [WeakRetained identifier];
    *(_DWORD *)buf = 134219010;
    long long v51 = self;
    __int16 v52 = 2114;
    long long v53 = v37;
    __int16 v54 = 2114;
    v55 = v39;
    __int16 v56 = 2114;
    long long v57 = v41;
    __int16 v58 = 2114;
    id v59 = v36;
    _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "%p-%{public}@-%{public}@:%{public}@ - async rendering scene for reason: %{public}@", buf, 0x34u);

    id v6 = v36;
  }

  if (!self->_asyncRenderGroupingContext)
  {
    id v42 = v6;
    uint64_t v9 = (void *)[(NSMutableOrderedSet *)self->_hostViews mutableCopy];
    [(NSMutableOrderedSet *)self->_hostedLayers removeAllObjects];
    [(NSMutableOrderedSet *)self->_hostViews removeAllObjects];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v12);
    }

    uint64_t v15 = (void *)MEMORY[0x1E4F39B58];
    uint64_t v47 = *MEMORY[0x1E4F39E90];
    uint64_t v48 = MEMORY[0x1E4F1CC38];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    uint64_t v17 = [v15 remoteContextWithOptions:v16];
    asyncRenderGroupingContext = self->_asyncRenderGroupingContext;
    self->_asyncRenderGroupingContext = v17;

    if (v7) {
      [(CAContext *)self->_asyncRenderGroupingContext addFence:v7];
    }
    uint64_t v19 = [_UISceneLayerHostContainerView alloc];
    id v20 = objc_loadWeakRetained((id *)&self->_scene);
    id v21 = objc_msgSend(NSString, "stringWithFormat:", @"<AsyncContainerForParentContainer-%p>", self);
    double v22 = [(_UISceneLayerHostContainerView *)v19 initWithScene:v20 debugDescription:v21];
    asyncRenderGroupingContainerView = self->_asyncRenderGroupingContainerView;
    self->_asyncRenderGroupingContainerView = v22;

    [(_UISceneLayerHostContainerView *)self->_asyncRenderGroupingContainerView _setBackgroundView:self->_backgroundView];
    uint64_t v24 = self->_asyncRenderGroupingContext;
    uint64_t v25 = [(UIView *)self->_asyncRenderGroupingContainerView layer];
    [(CAContext *)v24 setLayer:v25];

    double v26 = [MEMORY[0x1E4F62908] layerWithCAContext:self->_asyncRenderGroupingContext];
    double v27 = [_UIContextLayerHostView alloc];
    double v28 = [NSClassFromString(&cfstr_Fbscenelayer.isa) layerWithFBSSceneLayer:v26];
    uint64_t v29 = [(_UIContextLayerHostView *)v27 initWithSceneLayer:v28];
    asyncRenderGroupingHostView = self->_asyncRenderGroupingHostView;
    self->_asyncRenderGroupingHostView = v29;

    [(_UIContextLayerHostView *)self->_asyncRenderGroupingHostView setRenderingMode:1];
    uint64_t v31 = self->_asyncRenderGroupingHostView;
    long long v32 = [(UIScenePresentationContext *)self->_presentationContext asynchronousRenderingOptions];
    [(_UIContextLayerHostView *)v31 setAsynchronousRenderingOptions:v32];

    hostedLayers = self->_hostedLayers;
    v34 = [(_UISceneLayerHostView *)self->_asyncRenderGroupingHostView sceneLayer];
    [(NSMutableOrderedSet *)hostedLayers addObject:v34];

    [(NSMutableOrderedSet *)self->_hostViews addObject:self->_asyncRenderGroupingHostView];
    [(UIView *)self->_innerLayerContainer insertSubview:self->_asyncRenderGroupingHostView atIndex:0];

    id v6 = v42;
  }
  [(_UISceneLayerHostContainerView *)self->_asyncRenderGroupingContainerView _rebuildLayersForReason:@"parent async layer rebuild required" withFence:0];
  [(_UISceneLayerHostContainerView *)self _updateAsyncDrawingOptionsInAsyncPresentation];
  [(_UISceneLayerHostContainerView *)self _adjustHostViewFrameAlignment:self->_asyncRenderGroupingHostView];
}

- (void)_updateAsyncDrawingOptionsInAsyncPresentation
{
  if ([(UIScenePresentationContext *)self->_presentationContext renderingMode] != 1)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:824 description:@"Rendering mode must be async"];
  }
  [(_UIContextLayerHostView *)self->_asyncRenderGroupingHostView setRenderingMode:1];
  asyncRenderGroupingHostView = self->_asyncRenderGroupingHostView;
  double v5 = [(UIScenePresentationContext *)self->_presentationContext asynchronousRenderingOptions];
  [(_UIContextLayerHostView *)asyncRenderGroupingHostView setAsynchronousRenderingOptions:v5];

  id v6 = [(_UIContextLayerHostView *)self->_asyncRenderGroupingHostView layer];
  id v7 = [(FBSSceneSettings *)self->_effectiveSceneSettings displayConfiguration];
  [v7 scale];
  objc_msgSend(v6, "setRasterizationScale:");

  id v10 = [(_UIContextLayerHostView *)self->_asyncRenderGroupingHostView layer];
  id v8 = [(UIScenePresentationContext *)self->_presentationContext _minificationFilterName];
  [v10 setMinificationFilter:v8];
}

- (void)invalidate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    v3 = UIScenePresentationLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
      uint64_t v9 = [WeakRetained identifier];
      debugDescription = self->_debugDescription;
      int v11 = 134218754;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      id v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = debugDescription;
      _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "%p-%{public}@-%{public}@:%{public}@ - invalidate", (uint8_t *)&v11, 0x2Au);
    }
    self->_invalidated = 1;
    [(UIView *)self removeFromSuperview];
    id v4 = objc_loadWeakRetained((id *)&self->_scene);
    double v5 = [v4 layerManager];
    [v5 removeObserver:self];

    objc_storeWeak((id *)&self->_dataSource, 0);
    [(NSMutableSet *)self->_hiddenLayers removeAllObjects];
    [(NSMutableOrderedSet *)self->_hostedLayers removeAllObjects];
    [(NSMutableOrderedSet *)self->_hostViews removeAllObjects];
    [(_UISceneLayerHostContainerView *)self _invalidateAndRemoveAsyncViewsFromHierarchy];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugDescription, 0);
  objc_storeStrong((id *)&self->_asyncRenderGroupingHostView, 0);
  objc_storeStrong((id *)&self->_asyncRenderGroupingContainerView, 0);
  objc_storeStrong((id *)&self->_asyncRenderGroupingContext, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_innerLayerContainer, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_effectiveSceneSettings, 0);
  objc_storeStrong((id *)&self->_hiddenLayers, 0);
  objc_storeStrong((id *)&self->_hostedLayers, 0);
  objc_storeStrong((id *)&self->_hostViews, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_scene);
}

- (void)updateForGeometrySettingsChanges:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_invalidated)
  {
    __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:183 description:@"Unable to refresh a data source on an invalidated host container"];
  }
  objc_storeStrong((id *)&self->_effectiveSceneSettings, a3);
  [(FBSSceneSettings *)self->_effectiveSceneSettings bounds];
  -[UIView setFrame:](self, "setFrame:");
  innerLayerContainer = self->_innerLayerContainer;
  [(FBSSceneSettings *)self->_effectiveSceneSettings bounds];
  -[UIView setFrame:](innerLayerContainer, "setFrame:");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = self->_hostViews;
  uint64_t v9 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[_UISceneLayerHostContainerView _adjustHostViewFrameAlignment:](self, "_adjustHostViewFrameAlignment:", *(void *)(*((void *)&v14 + 1) + 8 * v12++), (void)v14);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  if (!self->_asyncRenderGroupingContext) {
    [(_UISceneLayerHostContainerView *)self _updateRenderingModeForLayersInNormalPresentation];
  }
  -[_UISceneLayerHostContainerView updateForGeometrySettingsChanges:](self->_asyncRenderGroupingContainerView, "updateForGeometrySettingsChanges:", v6, (void)v14);
}

- (void)pushDataSource:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (self->_invalidated)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:161 description:@"Unable to push a data source on an invalidated host container"];

    id v5 = v7;
  }
  [(_UISceneLayerHostContainerView *)self _setDataSource:v5];
}

- (void)_setDataSource:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(_UISceneLayerHostContainerView *)self _refreshDataSource];
    id v5 = obj;
  }
}

- (_UISceneLayerHostContainerView)initWithScene:(id)a3 debugDescription:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    double v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UISceneLayerHostContainerView.m", 89, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  uint64_t v9 = [v7 settings];
  [v9 bounds];
  v27.receiver = self;
  v27.super_class = (Class)_UISceneLayerHostContainerView;
  uint64_t v10 = -[UIView initWithFrame:](&v27, sel_initWithFrame_);

  if (v10)
  {
    id v11 = objc_storeWeak((id *)&v10->_scene, v7);
    uint64_t v12 = [v7 layerManager];
    [v12 addObserver:v10];

    uint64_t v13 = [v7 settings];
    effectiveSceneSettings = v10->_effectiveSceneSettings;
    v10->_effectiveSceneSettings = (FBSSceneSettings *)v13;

    uint64_t v15 = [v8 copy];
    debugDescription = v10->_debugDescription;
    v10->_debugDescription = (NSString *)v15;

    long long v17 = objc_alloc_init(_UITouchPassthroughView);
    innerLayerContainer = v10->_innerLayerContainer;
    v10->_innerLayerContainer = &v17->super;

    uint64_t v19 = v10->_innerLayerContainer;
    id v20 = [v7 settings];
    [v20 bounds];
    -[UIView setFrame:](v19, "setFrame:");

    [(UIView *)v10 addSubview:v10->_innerLayerContainer];
    id v21 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    hostedLayers = v10->_hostedLayers;
    v10->_hostedLayers = v21;

    uint64_t v23 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    hostViews = v10->_hostViews;
    v10->_hostViews = v23;

    [(_UISceneLayerHostContainerView *)v10 _rebuildLayersForReason:@"init" withFence:0];
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:110 description:@"Must be invalidated before deallocating"];
  }
  v3 = UIScenePresentationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    uint64_t v9 = [WeakRetained identifier];
    debugDescription = self->_debugDescription;
    *(_DWORD *)buf = 134218754;
    uint64_t v15 = self;
    __int16 v16 = 2114;
    long long v17 = v7;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    id v21 = debugDescription;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "%p-%{public}@-%{public}@:%{public}@ - dealloc", buf, 0x2Au);
  }
  id v4 = objc_loadWeakRetained((id *)&self->_scene);
  id v5 = [v4 layerManager];
  [v5 removeObserver:self];

  v13.receiver = self;
  v13.super_class = (Class)_UISceneLayerHostContainerView;
  [(UIView *)&v13 dealloc];
}

- (_UISceneLayerHostContainerView)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:74 description:@"-[init] is unavailable for this object."];

  return 0;
}

- (_UISceneLayerHostContainerView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v5 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:79 description:@"-[init] is unavailable for this object."];

  return [(_UISceneLayerHostContainerView *)self initWithScene:&stru_1ED0E84C0 debugDescription:@"invalid"];
}

- (_UISceneLayerHostContainerView)initWithCoder:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:84 description:@"-[init] is unavailable for this object."];

  return [(_UISceneLayerHostContainerView *)self initWithScene:&stru_1ED0E84C0 debugDescription:@"invalid"];
}

- (NSSet)hostedLayers
{
  if (self->_asyncRenderGroupingContainerView) {
    [(_UISceneLayerHostContainerView *)self->_asyncRenderGroupingContainerView hostedLayers];
  }
  else {
  v2 = [(NSMutableOrderedSet *)self->_hostedLayers set];
  }
  return (NSSet *)v2;
}

- (NSSet)nonHostedLayers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  asyncRenderGroupingContainerView = self->_asyncRenderGroupingContainerView;
  if (asyncRenderGroupingContainerView)
  {
    id v4 = [(_UISceneLayerHostContainerView *)asyncRenderGroupingContainerView nonHostedLayers];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    id v6 = objc_msgSend(WeakRetained, "layerManager", 0);
    id v7 = [v6 layers];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (([(NSMutableOrderedSet *)self->_hostedLayers containsObject:v12] & 1) == 0) {
            [v4 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return (NSSet *)v4;
}

- (void)popDataSource:(id)a3
{
  id v8 = a3;
  if (self->_invalidated)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostContainerView.m" lineNumber:167 description:@"Unable to pop a data source on an invalidated host container"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  id v6 = v8;
  if (WeakRetained == v8)
  {
    [(_UISceneLayerHostContainerView *)self _setDataSource:0];
    id v6 = v8;
  }
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_UISceneLayerHostContainerView *)self window];

  if (v11 == v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)_UISceneLayerHostContainerView;
    -[UIView _hitTest:withEvent:windowServerHitTestWindow:](&v16, sel__hitTest_withEvent_windowServerHitTestWindow_, v9, v10, x, y);
    objc_super v13 = (_UISceneLayerHostContainerView *)objc_claimAutoreleasedReturnValue();
    if ([(UIScenePresentationContext *)self->_presentationContext shouldPassthroughHitTestEventsIfTransparent])
    {
      BOOL v14 = v13 == self;
    }
    else
    {
      BOOL v14 = 0;
    }
    if (v14) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v13;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (int64_t)_focusedSound
{
  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UISceneLayerHostContainerView *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UISceneLayerHostContainerView *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  id v5 = [WeakRetained identifier];
  id v6 = (id)[v3 appendObject:v5 withName:@"sceneID" skipIfNil:1];

  id v7 = (id)[v3 appendObject:self->_debugDescription withName:@"debugDescription" skipIfNil:1];
  [(UIView *)self frame];
  id v8 = (id)objc_msgSend(v3, "appendRect:withName:", @"frame");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UISceneLayerHostContainerView *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(_UISceneLayerHostContainerView *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___UISceneLayerHostContainerView_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (id)_realHostedLayers
{
  return (id)[(NSMutableOrderedSet *)self->_hostedLayers set];
}

- (id)_hostViews
{
  return (id)[(NSMutableOrderedSet *)self->_hostViews set];
}

- (id)_backgroundView
{
  return self->_backgroundView;
}

- (id)_presentationContext
{
  return self->_presentationContext;
}

- (id)_asyncContext
{
  return self->_asyncRenderGroupingContext;
}

- (id)_asyncRenderingContainerView
{
  return self->_asyncRenderGroupingContainerView;
}

- (id)_asyncRenderingHostView
{
  return self->_asyncRenderGroupingHostView;
}

- (void)_toggleClippingDisabledWithNewContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_hostViews;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "sceneLayer", (void)v14);
        uint64_t v12 = [(_UISceneLayerHostContainerView *)self _presentationContextForLayer:v11];

        if ([v12 isClippingDisabled]) {
          int v13 = 1;
        }
        else {
          int v13 = [v4 isClippingDisabled];
        }
        [v10 setClipsToBounds:v13 ^ 1u];
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_toggleInheritsSecurityWithNewContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_hostViews;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setInheritsSecurity:", objc_msgSend(v4, "inheritsSecurity", (void)v10));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_toggleResizesHostedContextWithNewContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_hostViews;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setResizesHostedContext:", objc_msgSend(v4, "resizesHostedContext", (void)v10));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)_canShowKeyboardLayer
{
  return +[_UISceneKeyboardProxyLayerForwardingManager isRootSystemShellProcess];
}

- (_UISceneLayerHostContainerViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (_UISceneLayerHostContainerViewDataSource *)WeakRetained;
}

- (FBScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (FBScene *)WeakRetained;
}

@end