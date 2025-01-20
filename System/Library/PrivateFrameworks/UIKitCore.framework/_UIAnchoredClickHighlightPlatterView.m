@interface _UIAnchoredClickHighlightPlatterView
- (_UIAnchoredClickHighlightPlatterView)initWithTargetedPreview:(id)a3;
- (_UIMorphingView)anchorView;
- (void)anchorToContainer;
- (void)deAnchor;
- (void)setAnchorView:(id)a3;
@end

@implementation _UIAnchoredClickHighlightPlatterView

- (_UIAnchoredClickHighlightPlatterView)initWithTargetedPreview:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)_UIAnchoredClickHighlightPlatterView;
  v3 = [(_UIHighlightPlatterView *)&v23 initWithTargetedPreview:a3];
  if (v3)
  {
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v4 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v6 = _UIInternalPreference_ClickUIDebugEnabled;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
      {
        while (v4 >= v6)
        {
          _UIInternalPreferenceSync(v4, &_UIInternalPreference_ClickUIDebugEnabled, @"ClickUIDebugEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v6 = _UIInternalPreference_ClickUIDebugEnabled;
          if (v4 == _UIInternalPreference_ClickUIDebugEnabled) {
            return v3;
          }
        }
        if (byte_1E8FD4F1C)
        {
          id v7 = +[UIColor systemOrangeColor];
          uint64_t v8 = [v7 CGColor];
          v9 = [(_UIHighlightPlatterView *)v3 portalView];
          v10 = [v9 layer];
          [v10 setBorderColor:v8];

          v11 = [(_UIHighlightPlatterView *)v3 portalView];
          v12 = [v11 layer];
          [v12 setBorderWidth:1.0];

          id v13 = +[UIColor redColor];
          uint64_t v14 = [v13 CGColor];
          v15 = [(UIView *)v3 layer];
          [v15 setBorderColor:v14];

          v16 = [(UIView *)v3 layer];
          [v16 setBorderWidth:1.0];

          id v17 = +[UIColor blueColor];
          uint64_t v18 = [v17 CGColor];
          v19 = [(_UIAnchoredClickHighlightPlatterView *)v3 anchorView];
          v20 = [v19 layer];
          [v20 setBorderColor:v18];

          v21 = [(_UIAnchoredClickHighlightPlatterView *)v3 anchorView];
          v22 = [v21 layer];
          [v22 setBorderWidth:1.0];
        }
      }
    }
  }
  return v3;
}

- (void)anchorToContainer
{
  v47[1] = *MEMORY[0x1E4F143B8];
  v3 = [(_UIHighlightPlatterView *)self targetedPreview];
  int v4 = [v3 target];
  v5 = objc_opt_new();
  [v5 setUserInteractionEnabled:0];
  [v5 setUseOpacityPairFilter:1];
  [(_UIAnchoredClickHighlightPlatterView *)self setAnchorView:v5];
  int v6 = [v3 view];
  id v7 = [v4 container];
  [v7 addSubview:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = [v8 _verticalScrollIndicator];
    [v8 bringSubviewToFront:v9];

    v10 = [v8 _horizontalScrollIndicator];
    [v8 bringSubviewToFront:v10];
  }
  [v4 center];
  objc_msgSend(v5, "setCenter:");
  if ([v3 hasCustomTarget])
  {
    if ([v3 _sourceViewIsInViewHierarchy])
    {
      id v11 = v6;
      [v4 center];
      double v13 = v12;
      double v15 = v14;
      v16 = [v4 container];
      objc_msgSend(v11, "convertPoint:fromView:", v16, v13, v15);
      double v18 = v17;
      double v20 = v19;
LABEL_8:

      goto LABEL_11;
    }
    id v11 = [v4 container];
    [v4 center];
    double v18 = v28;
    double v20 = v29;
  }
  else
  {
    id v11 = v6;
    v21 = [v3 parameters];
    v22 = [v21 visiblePath];

    if (v22)
    {
      v16 = [v3 parameters];
      objc_super v23 = [v16 visiblePath];
      [v23 bounds];
      double v18 = v25 + v24 * 0.5;
      double v20 = v27 + v26 * 0.5;

      goto LABEL_8;
    }
    [v11 bounds];
    double v18 = v31 + v30 * 0.5;
    double v20 = v33 + v32 * 0.5;
  }
LABEL_11:
  v34 = [v3 overridePositionTrackingView];
  if (v34)
  {
    objc_msgSend(v11, "convertPoint:toView:", v34, v18, v20);
    double v18 = v35;
    double v20 = v36;
    id v37 = v34;

    id v11 = v37;
  }
  v38 = objc_opt_new();
  v39 = [v11 layer];
  [v38 setSourceLayer:v39];

  [v38 setKeyPath:@"position"];
  [v38 setDuration:INFINITY];
  v40 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v18, v20);
  v47[0] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  [v38 setSourcePoints:v41];

  v42 = [v5 layer];
  [v42 addAnimation:v38 forKey:@"_UIClickHighlightMatchMoveAnimation"];

  if (v4)
  {
    [v4 transform];
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v44 = 0u;
  }
  v43[0] = v44;
  v43[1] = v45;
  v43[2] = v46;
  [v5 setTransform:v43];
}

- (void)deAnchor
{
  id v2 = [(_UIAnchoredClickHighlightPlatterView *)self anchorView];
  [v2 removeFromSuperview];
}

- (_UIMorphingView)anchorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_anchorView);
  return (_UIMorphingView *)WeakRetained;
}

- (void)setAnchorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end