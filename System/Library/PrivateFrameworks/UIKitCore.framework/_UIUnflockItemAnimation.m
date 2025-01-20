@interface _UIUnflockItemAnimation
+ (id)animationWithPlatterView:(id)a3 destination:(id)a4 positionReferenceView:(id)a5 type:(int64_t)a6;
- (UITargetedPreview)destination;
- (UIView)positionReferenceView;
- (UIViewFloatAnimatableProperty)positionTrackingProperty;
- (_UIMorphingPlatterView)platterView;
- (_UIPortalView)reparentingPortalView;
- (_UIUnflockReparentingView)reparentingContainerView;
- (int64_t)type;
- (void)complete;
- (void)play;
- (void)setDestination:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setPositionReferenceView:(id)a3;
- (void)setPositionTrackingProperty:(id)a3;
- (void)setReparentingContainerView:(id)a3;
- (void)setReparentingPortalView:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _UIUnflockItemAnimation

+ (id)animationWithPlatterView:(id)a3 destination:(id)a4 positionReferenceView:(id)a5 type:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = objc_opt_new();
  [v12 setPlatterView:v11];

  [v12 setDestination:v9];
  if (v10)
  {
    [v12 setPositionReferenceView:v10];
  }
  else
  {
    v13 = [v9 view];
    v14 = [v9 target];
    v15 = [v14 container];
    v16 = [v15 superview];

    if (v13 == v16)
    {
      v17 = [v9 view];
      [v12 setPositionReferenceView:v17];
    }
  }
  [v12 setType:a6];

  return v12;
}

- (void)play
{
  v3 = [(_UIUnflockItemAnimation *)self platterView];
  v4 = [(_UIUnflockItemAnimation *)self destination];
  v5 = [(_UIUnflockItemAnimation *)self platterView];
  v6 = [v5 superview];

  v7 = [v4 target];
  v8 = [v7 container];

  uint64_t v49 = 0;
  v50 = (double *)&v49;
  uint64_t v51 = 0x3810000000;
  v52 = &unk_186D7DBA7;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v43 = 0;
  v44 = (double *)&v43;
  uint64_t v45 = 0x4010000000;
  v46 = &unk_186D7DBA7;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x5010000000;
  v39 = &unk_186D7DBA7;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  if ([(_UIUnflockItemAnimation *)self type] == 1 || [(_UIUnflockItemAnimation *)self type] == 2)
  {
    _UIContextMenuGetFromPreview(v4, (void *)v44 + 4, v50 + 4, (_OWORD *)v37 + 2, v6);
  }
  else
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__206;
    v34[4] = __Block_byref_object_dispose__206;
    id v35 = 0;
    uint64_t v30 = 0;
    v31 = (double *)&v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __31___UIUnflockItemAnimation_play__block_invoke;
    v20[3] = &unk_1E530A468;
    v20[4] = self;
    id v21 = v3;
    id v22 = v6;
    v25 = v34;
    id v23 = v8;
    id v24 = v4;
    v26 = &v43;
    v27 = &v49;
    v28 = &v36;
    v29 = &v30;
    +[UIView performWithoutAnimation:v20];
    double v9 = v31[3];
    id v10 = [(_UIUnflockItemAnimation *)self positionTrackingProperty];
    [v10 setValue:v9];

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(v34, 8);
  }
  if ([(_UIUnflockItemAnimation *)self type] == 2)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __31___UIUnflockItemAnimation_play__block_invoke_3;
    v18[3] = &unk_1E52D9F70;
    id v19 = v3;
    +[UIView performWithoutAnimation:v18];
  }
  else
  {
    objc_msgSend(v3, "setCenter:", v50[4], v50[5]);
    double v11 = v50[6];
    v12 = [v3 layer];
    [v12 setZPosition:v11];

    objc_msgSend(v3, "setBounds:", v44[4], v44[5], v44[6], v44[7]);
    int64_t v13 = [(_UIUnflockItemAnimation *)self type];
    double v14 = 1.0;
    if (v13 == 1) {
      double v14 = 0.0;
    }
    [v3 setAlpha:v14];
    long long v15 = *((_OWORD *)v37 + 4);
    long long v16 = *((_OWORD *)v37 + 2);
    v17[1] = *((_OWORD *)v37 + 3);
    v17[2] = v15;
    v17[0] = v16;
    [v3 setTransform:v17];
  }
  [v3 setExpanded:0];
  [v3 layoutIfNeeded];
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
}

- (void)complete
{
  v3 = [(_UIUnflockItemAnimation *)self reparentingPortalView];
  [v3 removeFromSuperview];

  id v4 = [(_UIUnflockItemAnimation *)self reparentingContainerView];
  [v4 removeFromSuperview];
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (_UIMorphingPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UITargetedPreview)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (UIView)positionReferenceView
{
  return self->_positionReferenceView;
}

- (void)setPositionReferenceView:(id)a3
{
}

- (_UIUnflockReparentingView)reparentingContainerView
{
  return self->_reparentingContainerView;
}

- (void)setReparentingContainerView:(id)a3
{
}

- (_UIPortalView)reparentingPortalView
{
  return self->_reparentingPortalView;
}

- (void)setReparentingPortalView:(id)a3
{
}

- (UIViewFloatAnimatableProperty)positionTrackingProperty
{
  return self->_positionTrackingProperty;
}

- (void)setPositionTrackingProperty:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionTrackingProperty, 0);
  objc_storeStrong((id *)&self->_reparentingPortalView, 0);
  objc_storeStrong((id *)&self->_reparentingContainerView, 0);
  objc_storeStrong((id *)&self->_positionReferenceView, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
}

@end