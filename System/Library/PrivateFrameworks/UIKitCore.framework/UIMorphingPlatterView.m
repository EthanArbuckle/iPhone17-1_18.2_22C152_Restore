@interface UIMorphingPlatterView
@end

@implementation UIMorphingPlatterView

void __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _modelUpdates];
}

void __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (![WeakRetained shouldMorphContents]) {
    goto LABEL_13;
  }
  v1 = [WeakRetained platterWidth];
  [v1 presentationValue];
  double v3 = v2;

  v4 = [WeakRetained platterHeight];
  [v4 presentationValue];
  double v6 = v5;

  if (([WeakRetained allowsElasticMorph] & 1) == 0)
  {
    if ([WeakRetained preferredMorphingAxis] == 1)
    {
      v7 = [WeakRetained platterHeight];
      v8 = [WeakRetained platterWidth];
      double v6 = __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke_3(v7, v8);
LABEL_7:

      goto LABEL_8;
    }
    if ([WeakRetained preferredMorphingAxis] == 2)
    {
      v7 = [WeakRetained platterWidth];
      v8 = [WeakRetained platterHeight];
      double v3 = __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke_3(v7, v8);
      goto LABEL_7;
    }
  }
LABEL_8:
  v9 = [WeakRetained collapsedClippingView];
  v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v3, v6);
  [v9 _setPresentationValue:v10 forKey:@"bounds"];

  v11 = [WeakRetained expandedClippingView];
  v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v3, v6);
  [v11 _setPresentationValue:v12 forKey:@"bounds"];

  v13 = [WeakRetained platterWidth];
  [v13 presentationValue];
  double v15 = v14 * 0.5;
  v16 = [WeakRetained platterHeight];
  [v16 presentationValue];
  double v18 = v17 * 0.5;

  v19 = [WeakRetained collapsedClippingView];
  v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v15, v18);
  [v19 _setPresentationValue:v20 forKey:@"position"];

  v21 = [WeakRetained expandedClippingView];
  v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v15, v18);
  [v21 _setPresentationValue:v22 forKey:@"position"];

  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = v3;
  v38.size.height = v6;
  CGFloat v23 = CGRectGetWidth(v38) * 0.5;
  v24 = [WeakRetained collapsedTransformView];
  v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v23, 0.0);
  [v24 _setPresentationValue:v25 forKey:@"position"];

  v26 = [WeakRetained expandedTransformView];
  v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v23, 0.0);
  [v26 _setPresentationValue:v27 forKey:@"position"];

  v28 = [WeakRetained expansionProgress];
  [v28 presentationValue];
  double v30 = v29;

  if (([WeakRetained alwaysCompact] & 1) == 0)
  {
    double v31 = fmax(fmin(v30 / 0.65, 1.0), 0.0);
    v32 = [WeakRetained collapsedClippingView];
    v33 = [NSNumber numberWithDouble:1.0 - v31];
    [v32 _setPresentationValue:v33 forKey:@"opacity"];

    if ([WeakRetained bothViewsAreLikelyOpaque]) {
      double v31 = 1.0;
    }
    v34 = [WeakRetained expandedClippingView];
    v35 = [NSNumber numberWithDouble:v31];
    [v34 _setPresentationValue:v35 forKey:@"opacity"];
  }
  objc_msgSend(WeakRetained, "_updateShadowsWithExpansionProgress:contentBounds:center:forPresentation:", 1, v30, 0.0, 0.0, v3, v6, v15, v18);
LABEL_13:
}

double __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke_3(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = [v4 lastModelValueChangeWasPositive];
  [v4 presentationValue];
  double v7 = v6;
  [v4 presentationValue];
  double v9 = v8;
  [v4 value];
  double v11 = v10;

  if (v9 >= v11) {
    double v12 = v9;
  }
  else {
    double v12 = v11;
  }
  if (v9 >= v11) {
    double v13 = v11;
  }
  else {
    double v13 = v9;
  }
  if (v5) {
    double v12 = v13;
  }
  double v14 = v7 / v12;
  [v3 value];
  double v16 = v15 * v14;
  [v3 presentationValue];
  int v17 = [v3 lastModelValueChangeWasPositive];
  [v3 presentationValue];
  if (v18 >= v16) {
    double v19 = v16;
  }
  else {
    double v19 = v18;
  }
  if (v18 < v16) {
    double v18 = v16;
  }
  if (v17) {
    double v20 = v19;
  }
  else {
    double v20 = v18;
  }

  return v20;
}

void __43___UIMorphingPlatterView__updatePathShadow__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) pathShadowView];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) pathShadowView];
    [v3 removeFromSuperview];

    [*(id *)(a1 + 32) setPathShadowView:0];
  }
  id v4 = [*(id *)(a1 + 32) collapsedPreview];
  int v5 = [v4 parameters];

  if ([v5 appliesShadow])
  {
    double v6 = [*(id *)(a1 + 32) collapsedPreview];
    double v7 = [v6 view];

    [v7 bounds];
    double x = v8;
    double y = v10;
    double width = v12;
    double height = v14;
    double v16 = [v5 effectiveShadowPath];
    int v17 = (void *)[v16 copy];

    if (v17)
    {
      id v18 = v5;
      double v19 = [v18 effectiveShadowPath];
      double v20 = [v18 visiblePath];

      if (v19 == v20 && ([v19 _isRoundedRect] & 1) != 0)
      {
        [v19 _cornerRadius];
        double v22 = v21;

        if (v22 <= 20.0) {
          goto LABEL_8;
        }
      }
      else
      {
      }
LABEL_13:
      double v31 = [v5 effectiveShadowPath];
      v32 = [v5 visiblePath];

      if (v31 == v32)
      {
        [v17 bounds];
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        CGAffineTransformMakeTranslation(&v92, -v33, -v35);
        [v17 applyTransform:&v92];
        v95.origin.double x = v34;
        v95.origin.double y = v36;
        v95.size.double width = v38;
        v95.size.double height = v40;
        CGRect v96 = CGRectOffset(v95, v34, v36);
        double x = v96.origin.x;
        double y = v96.origin.y;
        double width = v96.size.width;
        double height = v96.size.height;
      }
      [v17 bounds];
      if (!CGRectIsEmpty(v97))
      {
        v41 = [*(id *)(a1 + 32) shadowSettings];

        if (v41)
        {
          uint64_t v42 = [v17 CGPath];
          v43 = [*(id *)(a1 + 32) layer];
          [v43 setShadowPath:v42];

          v44 = [*(id *)(a1 + 32) shadowSettings];
          id v45 = [v44 color];
          uint64_t v46 = [v45 CGColor];
          v47 = [*(id *)(a1 + 32) layer];
          [v47 setShadowColor:v46];

          v48 = [*(id *)(a1 + 32) shadowSettings];
          [v48 offset];
          double v50 = v49;
          double v52 = v51;
          v53 = [*(id *)(a1 + 32) layer];
          objc_msgSend(v53, "setShadowOffset:", v50, v52);

          v54 = [*(id *)(a1 + 32) shadowSettings];
          [(_UIPlatterSoftShadowView *)v54 radius];
          double v56 = v55;
          v57 = [*(id *)(a1 + 32) layer];
          [v57 setShadowRadius:v56];
        }
        else
        {
          v54 = -[_UIPlatterSoftShadowView initWithFrame:shadowPath:]([_UIPlatterSoftShadowView alloc], "initWithFrame:shadowPath:", v17, x, y, width, height);
          v58 = [*(id *)(a1 + 32) collapsedPreview];
          [v58 size];
          double v60 = v59 * 0.5;
          v61 = [*(id *)(a1 + 32) collapsedPreview];
          [v61 size];
          double v63 = v62 * 0.5;

          v98.origin.double x = x;
          v98.origin.double y = y;
          v98.size.double width = width;
          v98.size.double height = height;
          double v64 = v60 / CGRectGetWidth(v98);
          v99.origin.double x = x;
          v99.origin.double y = y;
          v99.size.double width = width;
          v99.size.double height = height;
          double v65 = v63 / CGRectGetHeight(v99);
          v66 = [(UIView *)v54 layer];
          objc_msgSend(v66, "setAnchorPoint:", v64, v65);

          [(UIView *)v54 bounds];
          CGFloat v68 = v67;
          recta.origin.double x = v67;
          recta.origin.double y = v69;
          CGFloat v71 = v70;
          CGFloat v73 = v72;
          [*(id *)(a1 + 32) bounds];
          CGFloat v74 = v100.origin.x;
          CGFloat v75 = v100.origin.y;
          CGFloat v76 = v100.size.width;
          CGFloat v77 = v100.size.height;
          double v78 = CGRectGetWidth(v100);
          v101.origin.double x = v68;
          v101.origin.double y = v71;
          v101.size.double width = v73;
          v101.size.double height = recta.origin.y;
          CGFloat v79 = v78 / CGRectGetWidth(v101);
          v102.origin.double x = v74;
          v102.origin.double y = v75;
          v102.size.double width = v76;
          v102.size.double height = v77;
          double v80 = CGRectGetHeight(v102);
          v103.origin.double x = recta.origin.x;
          v103.origin.double y = v71;
          v103.size.double width = v73;
          v103.size.double height = recta.origin.y;
          CGFloat v81 = CGRectGetHeight(v103);
          CGAffineTransformMakeScale(&v91, v79, v80 / v81);
          recta.size = *(CGSize *)&v91.a;
          long long v89 = *(_OWORD *)&v91.c;
          long long v90 = *(_OWORD *)&v91.tx;
          [(UIView *)v54 setTransform:&recta.size];
          [*(id *)(a1 + 32) bounds];
          -[UIView setCenter:](v54, "setCenter:", v83 + v82 * 0.5, v85 + v84 * 0.5);
          if ([v5 _previewMode] == 5)
          {
            [(_UIPlatterSoftShadowView *)v54 setNeedsPunchOut:0];
          }
          else
          {
            v86 = [v5 backgroundColor];
            -[_UIPlatterSoftShadowView setNeedsPunchOut:](v54, "setNeedsPunchOut:", [v86 _isOpaque] ^ 1);
          }
          [*(id *)(a1 + 32) insertSubview:v54 atIndex:0];
          [*(id *)(a1 + 32) setPathShadowView:v54];
          if (*(unsigned char *)(a1 + 40)) {
            double v87 = 0.0;
          }
          else {
            double v87 = 1.0;
          }
          v57 = [*(id *)(a1 + 32) pathShadowView];
          [v57 setAlpha:v87];
        }
      }
      goto LABEL_27;
    }
LABEL_8:
    unsigned __int8 v94 = 0;
    uint64_t v93 = 0;
    int v23 = [*(id *)(a1 + 32) alwaysCompact];
    v24 = *(void **)(a1 + 32);
    if (v23) {
      [v24 _expandedCornerRadius:&v94 maskedCorners:&v93 ignoreLiftScale:1];
    }
    else {
      [v24 _collapsedCornerRadius:&v94 maskedCorners:&v93];
    }
    double v26 = v25;
    v27 = [*(id *)(a1 + 32) collapsedPreview];
    [v27 size];
    uint64_t v30 = +[UIBezierPath _roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:](UIBezierPath, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", v93, 16, v94, 0.0, 0.0, v28, v29, v26);

    int v17 = (void *)v30;
    goto LABEL_13;
  }
LABEL_27:
}

uint64_t __64___UIMorphingPlatterView__installShadowViewForStyleIfNecessary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertSubview:*(void *)(a1 + 40) atIndex:0];
}

void __99___UIMorphingPlatterView__updateShadowsWithExpansionProgress_contentBounds_center_forPresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v22 = a3;
  id v5 = a2;
  [v22 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [v5 integerValue];

  if (v14 == 3)
  {
    double v7 = *(double *)(a1 + 40);
    double v9 = *(double *)(a1 + 48);
    double v11 = *(double *)(a1 + 56);
    double v13 = *(double *)(a1 + 64);
  }
  else if (v14 == 2)
  {
    objc_msgSend(v22, "frameWithContentWithFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v11 = v15;
    double v13 = v16;
    double v9 = 0.0;
    double v7 = 0.0;
  }
  if (v14 == [*(id *)(a1 + 32) expandedShadowStyle])
  {
    int v17 = (double *)(a1 + 72);
  }
  else
  {
    if (v14 != [*(id *)(a1 + 32) collapsedShadowStyle])
    {
      if ([*(id *)(a1 + 32) expanded]) {
        double v18 = 1.0 - *(double *)(a1 + 88);
      }
      else {
        double v18 = *(double *)(a1 + 88);
      }
      goto LABEL_13;
    }
    int v17 = (double *)(a1 + 80);
  }
  double v18 = *v17;
LABEL_13:
  if (*(unsigned char *)(a1 + 112))
  {
    double v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v7, v9, v11, v13);
    [v22 _setPresentationValue:v19 forKey:@"bounds"];

    double v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *(double *)(a1 + 96), *(double *)(a1 + 104));
    [v22 _setPresentationValue:v20 forKey:@"position"];

    double v21 = [NSNumber numberWithDouble:v18];
    [v22 _setPresentationValue:v21 forKey:@"opacity"];
  }
  else
  {
    objc_msgSend(v22, "setBounds:", v7, v9, v11, v13);
    objc_msgSend(v22, "setCenter:", *(double *)(a1 + 96), *(double *)(a1 + 104));
    [v22 setAlpha:v18];
  }
}

@end