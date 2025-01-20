@interface UIRefreshControlModernContentView
@end

@implementation UIRefreshControlModernContentView

void __52___UIRefreshControlModernContentView_initWithFrame___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
  UIRoundToViewScale(*(void **)(a1 + 32));
  [v3 setCornerRadius:v2 * 0.5];
}

uint64_t __52___UIRefreshControlModernContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [*(id *)(a1 + 32) safeAreaInsets];
  double v11 = v10 + 0.0;
  double v13 = v3 + v11;
  double v14 = v5 + 0.0;
  double v15 = v7 - (v11 + v12 + 0.0);
  [*(id *)(*(void *)(a1 + 32) + 440) frame];
  CGRect v124 = *(CGRect *)*(void *)&MEMORY[0x1E4F1DB28];
  CGFloat y = v124.origin.y;
  CGFloat v110 = *MEMORY[0x1E4F1DB28];
  CGFloat height = v124.size.height;
  CGFloat width = v124.size.width;
  BOOL v16 = CGRectEqualToRect(v118, *MEMORY[0x1E4F1DB28]);
  uint64_t v17 = *(void *)(a1 + 32);
  if (v16 || *(unsigned char *)(v17 + 481))
  {
    [(id)v17 _currentScreenScale];
    UIRectCenteredXInRectScale(0.0, -20.0, 100.0, 100.0, v13, v5 + 0.0, v15, v9, v18);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 440), "setFrame:");
    uint64_t v17 = *(void *)(a1 + 32);
  }
  v19 = *(void **)(v17 + 440);
  v119.origin.double x = v13;
  v119.origin.CGFloat y = v5 + 0.0;
  v119.size.CGFloat width = v15;
  v119.size.CGFloat height = v9;
  double MidX = CGRectGetMidX(v119);
  v120.origin.double x = v13;
  v120.origin.CGFloat y = v5 + 0.0;
  v120.size.CGFloat width = v15;
  v120.size.CGFloat height = v9;
  objc_msgSend(v19, "setCenter:", MidX, CGRectGetMidY(v120));
  [*(id *)(*(void *)(a1 + 32) + 440) frame];
  double v103 = v21;
  [*(id *)(*(void *)(a1 + 32) + 448) frame];
  v125.origin.CGFloat y = y;
  v125.origin.double x = v110;
  v125.size.CGFloat height = height;
  v125.size.CGFloat width = width;
  if (CGRectEqualToRect(v121, v125))
  {
    [*(id *)(*(void *)(a1 + 32) + 440) bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    [*(id *)(a1 + 32) _currentScreenScale];
    UIRectCenteredXInRectScale(0.0, 0.0, 100.0, 100.0, v23, v25, v27, v29, v30);
    double v101 = v32;
    double v102 = v31;
    double v99 = v34;
    double v100 = v33;
    [*(id *)(*(void *)(a1 + 32) + 440) bounds];
    double v35 = v9;
    double v37 = v36;
    double v38 = v15;
    double v40 = v39;
    double v41 = v13;
    double v43 = v42;
    double v44 = v14;
    double v46 = v45;
    [*(id *)(a1 + 32) _currentScreenScale];
    double v47 = v37;
    double v9 = v35;
    double v48 = v40;
    double v15 = v38;
    double v49 = v43;
    double v13 = v41;
    double v50 = v46;
    double v14 = v44;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setFrame:", UIRectCenteredYInRectScale(v102, v101, v100, v99, v47, v48, v49, v50, v51));
  }
  long long v116 = 0u;
  long long v117 = 0u;
  long long v115 = 0u;
  v52 = *(void **)(*(void *)(a1 + 32) + 456);
  if (v52)
  {
    [v52 transform];
    v52 = *(void **)(*(void *)(a1 + 32) + 456);
  }
  long long v53 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v112 = *MEMORY[0x1E4F1DAB8];
  long long v113 = v53;
  long long v114 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v52 setTransform:&v112];
  [*(id *)(*(void *)(a1 + 32) + 456) frame];
  double x = v122.origin.x;
  double v55 = v122.origin.y;
  double v56 = v122.size.width;
  double v57 = v122.size.height;
  v126.origin.CGFloat y = y;
  v126.origin.double x = v110;
  v126.size.CGFloat height = height;
  v126.size.CGFloat width = width;
  if (CGRectEqualToRect(v122, v126))
  {
    UIRoundToViewScale(*(void **)(a1 + 32));
    double v59 = v58;
    [*(id *)(*(void *)(a1 + 32) + 448) bounds];
    double v61 = v60;
    double v109 = v15;
    double v111 = v9;
    double v63 = v62;
    double v65 = v64;
    double v107 = v13;
    double v67 = v66;
    [*(id *)(a1 + 32) _currentScreenScale];
    UIRectCenteredXInRectScale(x, v55, v59, 10.0, v61, v63, v65, v67, v68);
    double v105 = v69;
    double v71 = v70;
    double v73 = v72;
    double v75 = v74;
    [*(id *)(*(void *)(a1 + 32) + 448) bounds];
    double v77 = v76;
    double v79 = v78;
    double v81 = v80;
    double v82 = v14;
    double v84 = v83;
    [*(id *)(a1 + 32) _currentScreenScale];
    double v85 = v77;
    double v86 = v79;
    double v15 = v109;
    double v9 = v111;
    double v87 = v81;
    double v13 = v107;
    double v88 = v84;
    double v14 = v82;
    double x = UIRectCenteredYInRectScale(v105, v71, v73, v75, v85, v86, v87, v88, v89);
    double v56 = v90;
    double v57 = v91;
    double v55 = v92 + -10.0;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setFrame:", x, v55, v56, v57);
  v93 = *(void **)(*(void *)(a1 + 32) + 456);
  long long v112 = v115;
  long long v113 = v116;
  long long v114 = v117;
  [v93 setTransform:&v112];
  [*(id *)(*(void *)(a1 + 32) + 472) frame];
  double v95 = v94;
  UICeilToViewScale(*(void **)(a1 + 32));
  double v97 = v103 + v96 + 27.0 + 5.0;
  v123.origin.double x = v13;
  v123.origin.CGFloat y = v14;
  v123.size.CGFloat width = v15;
  v123.size.CGFloat height = v9;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 472), "setFrame:", CGRectGetMinX(v123) + 10.0, v97, v15 + -20.0, v95);
  uint64_t result = [*(id *)(a1 + 32) _updateTimeOffsetOfRelevantLayers];
  *(unsigned char *)(*(void *)(a1 + 32) + 481) = 0;
  return result;
}

uint64_t __45___UIRefreshControlModernContentView__reveal__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  [v2 setInstanceAlphaOffset:0.0];

  double v3 = *(void **)(*(void *)(a1 + 32) + 448);
  return [v3 setAlpha:1.0];
}

void __60___UIRefreshControlModernContentView__resetToRevealingState__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
  double v2 = *(void **)(*(void *)(a1 + 32) + 448);
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v22 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)buf = *MEMORY[0x1E4F1DAB8];
  long long v25 = v21;
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v26 = v20;
  [v2 setTransform:buf];
  double v3 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  [v3 removeAllAnimations];

  double v4 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  CATransform3DMakeRotation(&v23, 0.785398163, 0.0, 0.0, 1.0);
  [v4 setInstanceTransform:&v23];

  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v6 = *(void *)(a1 + 32);
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      double v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_3)+ 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
    }
  }
  double v7 = +[UITraitCollection _currentTraitCollectionIfExists]();
  double v8 = [*(id *)(a1 + 32) traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v8];

  double v9 = (void *)_UISetCurrentFallbackEnvironment(*(void **)(a1 + 32));
  double v10 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  id v11 = [*(id *)(a1 + 32) _effectiveTintColorWithAlpha:1.0];
  objc_msgSend(v10, "setInstanceColor:", objc_msgSend(v11, "CGColor"));

  _UIRestorePreviousFallbackEnvironment(v9);
  +[UITraitCollection setCurrentTraitCollection:v7];
  double v12 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
  LODWORD(v13) = -1.0;
  [v12 setInstanceAlphaOffset:v13];

  [*(id *)(a1 + 32) _setUnbloomedAppearance];
  double v14 = *(void **)(*(void *)(a1 + 32) + 440);
  *(_OWORD *)buf = v22;
  long long v25 = v21;
  long long v26 = v20;
  [v14 setTransform:buf];
  double v15 = *(void **)(a1 + 32);
  BOOL v16 = (void *)v15[57];
  uint64_t v17 = [v15 _effectiveTintColor];
  [v16 setBackgroundColor:v17];
}

uint64_t __46___UIRefreshControlModernContentView__unbloom__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUnbloomedAppearance];
}

uint64_t __44___UIRefreshControlModernContentView__bloom__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setBloomedAppearance];
}

uint64_t __44___UIRefreshControlModernContentView__bloom__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unbloom];
}

uint64_t __43___UIRefreshControlModernContentView__spin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSpunAppearance];
}

uint64_t __43___UIRefreshControlModernContentView__tick__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F143A8];
  double v3 = 0.0;
  int v4 = 8;
  do
  {
    v6[0] = v2;
    v6[1] = 3221225472;
    v6[2] = __43___UIRefreshControlModernContentView__tick__block_invoke_2;
    v6[3] = &unk_1E52D9F70;
    v6[4] = *(void *)(a1 + 32);
    uint64_t result = +[UIView addKeyframeWithRelativeStartTime:v6 relativeDuration:v3 animations:0.125];
    double v3 = v3 + 0.125;
    --v4;
  }
  while (v4);
  return result;
}

uint64_t __43___UIRefreshControlModernContentView__tick__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 448);
  if (v1) {
    [*(id *)(*(void *)(a1 + 32) + 448) transform];
  }
  else {
    memset(&v3, 0, sizeof(v3));
  }
  CGAffineTransformRotate(&v4, &v3, 0.785398163);
  return [v1 setTransform:&v4];
}

uint64_t __45___UIRefreshControlModernContentView__goAway__block_invoke(uint64_t a1)
{
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 0.001, 0.001);
  memset(&v10, 0, sizeof(v10));
  uint64_t v2 = *(void *)(a1 + 32);
  CGAffineTransform v3 = *(void **)(v2 + 448);
  if (v3)
  {
    [v3 transform];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    memset(&v9, 0, sizeof(v9));
  }
  CGAffineTransformRotate(&v10, &v9, 3.13159265);
  CGAffineTransform t1 = v11;
  memset(&v8, 0, sizeof(v8));
  CGAffineTransform v6 = v10;
  CGAffineTransformConcat(&v8, &t1, &v6);
  CGAffineTransform v4 = *(void **)(v2 + 448);
  CGAffineTransform t1 = v8;
  [v4 setTransform:&t1];
  return [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:0.0];
}

@end