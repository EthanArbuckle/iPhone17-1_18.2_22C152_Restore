@interface UIUnflockItemAnimation
@end

@implementation UIUnflockItemAnimation

void __31___UIUnflockItemAnimation_play__block_invoke(uint64_t a1)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v2 = [_UIPortalView alloc];
  [*(id *)(a1 + 40) bounds];
  v3 = -[_UIPortalView initWithFrame:](v2, "initWithFrame:");
  [(_UIPortalView *)v3 setSourceView:*(void *)(a1 + 40)];
  [(_UIPortalView *)v3 setAllowsBackdropGroups:1];
  [(_UIPortalView *)v3 setMatchesTransform:1];
  [(_UIPortalView *)v3 setMatchesPosition:1];
  v4 = [(UIView *)v3 layer];
  [v4 setAllowsGroupOpacity:1];

  [*(id *)(a1 + 48) insertSubview:v3 aboveSubview:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setReparentingPortalView:v3];

  v5 = [_UIUnflockReparentingView alloc];
  [*(id *)(a1 + 56) bounds];
  uint64_t v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = -[UIView _subviewsNeedAxisFlipping](*(void **)(a1 + 56));
  v10 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) layer];
  [v10 setFlipsHorizontalAxis:v9];

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setUserInteractionEnabled:0];
  v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2C0]];
  v36[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  v13 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) layer];
  [v13 setFilters:v12];

  v14 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) layer];
  [v14 setValue:&unk_1ED3F26B8 forKeyPath:@"filters.opacityPair.inputAmount"];

  v15 = [*(id *)(a1 + 32) positionReferenceView];

  v16 = *(void **)(a1 + 56);
  uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v18 = *(void *)(v17 + 40);
  if (v15)
  {
    v19 = [*(id *)(a1 + 32) positionReferenceView];
    [v16 insertSubview:v18 aboveSubview:v19];
  }
  else
  {
    [*(id *)(a1 + 56) addSubview:*(void *)(v17 + 40)];
  }
  [*(id *)(a1 + 40) center];
  objc_msgSend(*(id *)(a1 + 40), "setCenter:", _UIContextMenuConvertPointBetweenViews(*(void **)(a1 + 48), *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v20, v21));
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addSubview:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setReparentingContainerView:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  _UIContextMenuGetFromPreview(*(void **)(a1 + 64), (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 32), (double *)(*(void *)(*(void *)(a1 + 88) + 8) + 32), (_OWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 32), *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8);
  double v24 = *(double *)(v22 + 32);
  double v23 = *(double *)(v22 + 40);
  [*(id *)(a1 + 40) center];
  double v27 = sqrt((v25 - v24) * (v25 - v24) + (v26 - v23) * (v26 - v23));
  if (v27 < 1.0) {
    double v27 = 1.0;
  }
  *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v27;
  v28 = objc_opt_new();
  [*(id *)(a1 + 32) setPositionTrackingProperty:v28];

  v29 = [*(id *)(a1 + 32) positionTrackingProperty];
  v35 = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __31___UIUnflockItemAnimation_play__block_invoke_2;
  v32[3] = &unk_1E530A440;
  objc_copyWeak(&v33, &location);
  uint64_t v31 = *(void *)(a1 + 72);
  v32[4] = *(void *)(a1 + 104);
  v32[5] = v31;
  +[UIView _createUnsafeTransformerWithInputAnimatableProperties:v30 modelValueSetter:&__block_literal_global_556 presentationValueSetter:v32];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __31___UIUnflockItemAnimation_play__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained positionTrackingProperty];
  [v2 presentationValue];
  double v4 = v3;

  double v5 = v4 / *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + -0.7;
  if (v5 <= 0.0) {
    double v6 = 1.0;
  }
  else {
    double v6 = v5 / -0.3 + 1.0;
  }
  uint64_t v7 = [NSNumber numberWithDouble:v6];
  v8 = [WeakRetained reparentingPortalView];
  [v8 _setPresentationValue:v7 forKey:@"opacity"];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setPresentationValue:v7 forKey:@"filters.opacityPair.inputAmount"];
}

uint64_t __31___UIUnflockItemAnimation_play__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

@end