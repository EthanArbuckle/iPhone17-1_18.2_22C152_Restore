@interface UIGravityWellEffect
@end

@implementation UIGravityWellEffect

id __65___UIGravityWellEffect_effectWithDescriptor_continuationPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  [v4 setPreview:v3];
  v5 = [v3 target];
  v6 = [v5 container];
  v7 = [v3 target];

  [v7 center];
  double v9 = v8;
  double v11 = v10;
  v12 = [*(id *)(a1 + 32) container];
  objc_msgSend(v6, "convertPoint:toView:", v12, v9, v11);
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v4, "setPositionInPrimaryContainer:", v14, v16, 0.0);
  return v4;
}

uint64_t __37___UIGravityWellEffect_endForHandOff__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _tearDownEffectViews];
  v2 = *(void **)(a1 + 32);
  return [v2 _performAllCompletions];
}

void __43___UIGravityWellEffect__installEffectViews__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) secondaryBodies];
  BOOL v3 = [v2 count] != 0;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___UIGravityWellEffect__installEffectViews__block_invoke_2;
  aBlock[3] = &__block_descriptor_33_e54_v24__0___UIGravityWellEffectBody_8___UIMorphingView_16l;
  BOOL v54 = v3;
  v4 = _Block_copy(aBlock);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v5 = [*(id *)(v1 + 32) secondaryBodies];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        (*((void (**)(void *, void, void))v4 + 2))(v4, *(void *)(*((void *)&v49 + 1) + 8 * i), 0);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v7);
  }

  double v10 = [*(id *)(v1 + 32) continuationPreview];
  if ([v10 _isVisible])
  {
    uint64_t v43 = v1;
    double v11 = objc_opt_new();
    [v11 setUseOpacityPairFilter:1];
    v42 = [v10 view];
    v12 = [[_UIPortalView alloc] initWithSourceView:v42];
    [(_UIPortalView *)v12 setHidesSourceView:1];
    double v13 = v11;
    v41 = v12;
    [v11 addContentView:v12];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    double v14 = v10;
    obuint64_t j = [v10 _matchableProperties];
    uint64_t v15 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          v20 = objc_opt_new();
          v21 = [v14 view];
          v22 = [v21 layer];
          [v20 setSourceLayer:v22];

          [v20 setKeyPath:v19];
          [v20 setDuration:INFINITY];
          v23 = [NSString stringWithFormat:@"_UIGravityWellEffect.propertyMatch.%@", v19];
          [v13 addAnimation:v20 forKey:v23];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v16);
    }

    uint64_t v1 = v43;
    double v10 = v14;
    v24 = v13;
  }
  else
  {
    v24 = 0;
  }
  v25 = [*(id *)(v1 + 32) primaryBody];
  (*((void (**)(void *, void *, void *))v4 + 2))(v4, v25, v24);

  v26 = [*(id *)(v1 + 32) primaryBody];
  v27 = [v26 preview];
  v28 = [v27 target];

  v29 = [v28 container];
  v30 = [*(id *)(v1 + 32) primaryBody];
  v31 = [v30 preview];
  v32 = [v31 view];

  v33 = [v32 superview];

  v34 = [*(id *)(v1 + 32) primaryBody];
  v35 = [v34 anchorView];
  if (v29 == v33) {
    [v29 insertSubview:v35 aboveSubview:v32];
  }
  else {
    [v29 addSubview:v35];
  }

  v36 = [*(id *)(v1 + 32) primaryBody];
  v37 = [v36 anchorView];
  [v29 bringSubviewToFront:v37];

  [v32 _bringAncestorControlledCollectionSubviewToFrontAmongCoplanarPeers];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v38 = v29;
    v39 = [v38 _verticalScrollIndicator];
    [v38 bringSubviewToFront:v39];

    v40 = [v38 _horizontalScrollIndicator];
    [v38 bringSubviewToFront:v40];
  }
}

void __43___UIGravityWellEffect__installEffectViews__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 preview];
  int v8 = *(unsigned __int8 *)(a1 + 32);
  double v9 = [v7 view];
  double v10 = [v9 traitCollection];
  double v11 = _UIContextMenuGetPlatformMetrics([v10 userInterfaceIdiom]);

  uint64_t v12 = [v11 shouldApplyShadowHandler];
  double v13 = (void *)v12;
  if (v12)
  {
    uint64_t v14 = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v7);
    uint64_t v15 = [v7 parameters];
    uint64_t v16 = v15;
    uint64_t v17 = v14;
  }
  else
  {
    uint64_t v15 = [v7 parameters];
    uint64_t v16 = v15;
    uint64_t v17 = 1;
  }
  [v15 setAppliesShadow:v17];
  BOOL v18 = v8 != 0;

  uint64_t v19 = objc_opt_new();
  v20 = [v11 previewShadowSettings];
  [v19 setShadowSettings:v20];

  v21 = [v11 submenuSeparatedOptions];
  [v19 setSeparatedOptions:v21];

  v22 = [v11 shouldApplyClippingHandler];
  [v19 setShouldApplyClippingHandler:v22];

  [v19 setAlwaysCompact:v18];
  [v19 setCollapsedPreview:v7];
  [v19 setCollapsedShadowStyle:1];
  [v19 setCollapsedShadowIntensity:0.0];
  [v7 size];
  objc_msgSend(v19, "setBounds:", 0.0, 0.0, v23, v24);
  [v19 setUserInteractionEnabled:0];
  [v19 setHideChromeWhenCollapsed:0];
  [v19 setWantsEdgeAntialiasing:v18];
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v25 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v60 = _UIInternalPreference_ClickUIDebugEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
    {
      while (v25 >= v60)
      {
        _UIInternalPreferenceSync(v25, &_UIInternalPreference_ClickUIDebugEnabled, @"ClickUIDebugEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v60 = _UIInternalPreference_ClickUIDebugEnabled;
        if (v25 == _UIInternalPreference_ClickUIDebugEnabled) {
          goto LABEL_7;
        }
      }
      if (byte_1E8FD4F1C)
      {
        id v61 = +[UIColor redColor];
        uint64_t v62 = [v61 CGColor];
        v63 = [v19 layer];
        [v63 setBorderColor:v62];

        v64 = [v19 layer];
        [v64 setBorderWidth:1.0];
      }
    }
  }
LABEL_7:

  [v5 setEffectView:v19];
  if (v6)
  {
    [v5 setAnchorView:v6];
    v26 = [v5 effectView];
    [v6 addContentView:v26];
  }
  else
  {
    v27 = -[UIView initWithFrame:]([_UIGravityWellEffectAnchorView alloc], "initWithFrame:", 0.0, 0.0, 2.0, 2.0);
    [v5 setAnchorView:v27];

    v28 = [v7 target];
    v29 = v28;
    if (v28)
    {
      [v28 transform];
    }
    else
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v66 = 0u;
    }
    v30 = [v5 anchorView];
    v65[0] = v66;
    v65[1] = v67;
    v65[2] = v68;
    [v30 setTransform:v65];

    v26 = [v5 anchorView];
    v31 = [v5 effectView];
    [v26 addSubview:v31];
  }
  v32 = [v5 anchorView];
  [v32 bounds];
  double v35 = v34 + v33 * 0.5;
  double v38 = v37 + v36 * 0.5;
  v39 = [v5 effectView];
  objc_msgSend(v39, "setCenter:", v35, v38);

  v40 = [v5 anchorView];
  [v40 setUserInteractionEnabled:0];

  v41 = [v7 target];
  [v41 center];
  double v43 = v42;
  double v45 = v44;
  long long v46 = [v5 anchorView];
  objc_msgSend(v46, "setCenter:", v43, v45);

  long long v47 = [v7 target];
  long long v48 = [v47 container];

  long long v49 = [v7 view];
  long long v50 = [v7 target];
  long long v51 = [v50 container];
  uint64_t v52 = -[UIView _subviewsNeedAxisFlipping](v51);
  v53 = [v5 anchorView];
  BOOL v54 = [v53 layer];
  [v54 setFlipsHorizontalAxis:v52];

  v55 = [v7 target];
  v56 = [v55 container];
  uint64_t v57 = [v5 anchorView];
  [v56 addSubview:v57];

  v58 = [v49 superview];

  v59 = [v5 anchorView];
  if (v48 == v58) {
    [v48 insertSubview:v59 aboveSubview:v49];
  }
  else {
    [v48 addSubview:v59];
  }
}

void __48___UIGravityWellEffect__updateToProgress_state___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") + 1);
  v2 = [*(id *)(a1 + 40) preview];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v4;
  }
  else {
    double v7 = v6;
  }
  double v8 = (v7 + 8.0) / v7;
  if (v8 < 0.9) {
    double v8 = 0.9;
  }
  double v9 = *(double *)(a1 + 48);
  double v10 = 1.0 - v9 + v9 * v8;
  double v11 = v9 + (1.0 - v9) * 0.0;
  uint64_t v12 = [*(id *)(a1 + 40) effectView];
  [v12 setCollapsedShadowIntensity:v11];

  double v13 = [*(id *)(a1 + 32) continuationPreview];
  int v14 = [v13 _isVisible];

  if (v14) {
    [*(id *)(a1 + 32) continuationPreview];
  }
  else {
  uint64_t v15 = [*(id *)(a1 + 40) preview];
  }
  uint64_t v16 = [v15 target];
  uint64_t v17 = v16;
  if (v16) {
    [v16 transform];
  }
  else {
    memset(&v51, 0, sizeof(v51));
  }
  CGAffineTransform v52 = v51;

  CGAffineTransform v51 = v52;
  CGAffineTransformScale(&v50, &v51, v10, v10);
  BOOL v18 = [*(id *)(a1 + 40) anchorView];
  CGAffineTransform v49 = v50;
  [v18 setTransform:&v49];

  uint64_t v19 = [*(id *)(a1 + 40) effectView];
  [v19 setHideChromeWhenCollapsed:0];

  if (!_AXSReduceMotionEnabled())
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v20 = [*(id *)(a1 + 32) secondaryBodies];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          int v25 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          [v25 positionInPrimaryContainer];
          long double v27 = v26 - *(double *)(a1 + 56);
          [v25 positionInPrimaryContainer];
          long double v29 = v28 - *(double *)(a1 + 64);
          [v25 positionInPrimaryContainer];
          double v31 = v30 - *(double *)(a1 + 72);
          double v32 = atan2(v29, v27);
          double v33 = hypot(v27, v29);
          double v34 = [*(id *)(a1 + 32) secondaryBodies];
          double v35 = [v34 lastObject];
          [v35 distanceFromPrimaryBody];
          double v37 = v33 / v36;

          double v38 = (1.0 - v37) * (1.0 - v37);
          double v39 = *(double *)(a1 + 48);
          double v40 = v39 * (v38 * 20.0 + (1.0 - v38) * 10.0);
          if (v40 < v33) {
            double v33 = v40;
          }
          __double2 v41 = __sincos_stret(v32);
          CATransform3DMakeTranslation(&v44, -(v33 * v41.__cosval), -(v33 * v41.__sinval), v31 * v39 + (1.0 - v39) * 0.0);
          double v42 = [v25 effectView];
          CATransform3D v43 = v44;
          [v42 setTransform3D:&v43];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v22);
    }
  }
}

uint64_t __48___UIGravityWellEffect__updateToProgress_state___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") - 1);
  [*(id *)(a1 + 32) animationCount];
  uint64_t result = [*(id *)(a1 + 32) animationCount];
  if (!result)
  {
    uint64_t result = [*(id *)(a1 + 32) state];
    if (!result)
    {
      [*(id *)(a1 + 32) _tearDownEffectViews];
      double v3 = *(void **)(a1 + 32);
      return [v3 _performAllCompletions];
    }
  }
  return result;
}

@end