@interface UINavigationBarTransitionContextZoom
@end

@implementation UINavigationBarTransitionContextZoom

void __48___UINavigationBarTransitionContextZoom_prepare__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  id v12 = [v11 snapshotViewAfterScreenUpdates:0];
  [v11 setHidden:1];

  objc_msgSend(v12, "setFrame:", a3, a4, a5, a6);
  [*(id *)(*(void *)(a1 + 32) + 8) addSubview:v12];
  [*(id *)(a1 + 32) _addTemporaryView:v12];
}

void __48___UINavigationBarTransitionContextZoom_prepare__block_invoke_2(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11 = a2;
  id v20 = [v11 snapshotViewAfterScreenUpdates:0];
  [v11 setHidden:1];

  v22.origin.double x = a3;
  v22.origin.double y = a4;
  v22.size.double width = a5;
  v22.size.double height = a6;
  CGRect v23 = CGRectOffset(v22, 0.0, *(CGFloat *)(a1 + 40));
  double x = v23.origin.x;
  double y = v23.origin.y;
  double width = v23.size.width;
  double height = v23.size.height;
  [v20 frame];
  if (a5 == v17 && a6 == v16)
  {
    objc_msgSend(v20, "setFrame:", x, y, width, height);
    [*(id *)(*(void *)(a1 + 32) + 64) addSubview:v20];
  }
  else
  {
    v19 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", x, y, width, height);
    [(UIView *)v19 setClipsToBounds:1];
    [(UIView *)v19 addSubview:v20];

    id v20 = v19;
    [*(id *)(*(void *)(a1 + 32) + 64) addSubview:v19];
  }
  [*(id *)(a1 + 32) _addTemporaryView:v20];
}

void __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v1) {
    v1 = (void *)v1[30];
  }
  v2 = v1;
  [v2 setAlpha:0.0];
}

void __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v2) {
    v2 = (void *)v2[30];
  }
  v3 = v2;
  [v3 setAlpha:1.0];

  double v4 = -[_UINavigationBarLayout searchBarLayoutFrame](*(void **)(*(void *)(a1 + 32) + 80));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v11) {
    id v11 = (void *)v11[30];
  }
  id v12 = v11;
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

void __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v1) {
    v1 = (void *)v1[30];
  }
  v2 = v1;
  [v2 setAlpha:0.0];
}

void __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v1) {
    v1 = (void *)v1[30];
  }
  v2 = v1;
  [v2 setAlpha:1.0];
}

uint64_t __103___UINavigationBarTransitionContextZoom__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id __63___UINavigationBarTransitionContextZoom__animateBackgroundView__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UINavigationBarTransitionContextZoom;
  return objc_msgSendSuper2(&v2, sel__animateBackgroundView);
}

void __48___UINavigationBarTransitionContextZoom_animate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _animateContentView];
  [*(id *)(a1 + 32) _animateLargeTitleView];
  [*(id *)(a1 + 32) _animateSearchBar];
  -[_UINavigationBarTransitionContext _animatePalettes](*(void **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_WORD *)(v2 + 160))
  {
    [(id)v2 _insertTemporaryBackgroundForLayout:*(void *)(v2 + 80)];
    [*(id *)(*(void *)(a1 + 32) + 8) frame];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v5 + 80);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48___UINavigationBarTransitionContextZoom_animate__block_invoke_2;
    v8[3] = &unk_1E52DE738;
    v8[5] = v6;
    v8[4] = v5;
    v3 = v8;
  }
  else
  {
    v3 = &__block_literal_global_279;
    uint64_t v4 = *(void *)(v2 + 80);
  }
  -[_UINavigationBarLayout iterateLayoutViews:](v4, v3);
  double v7 = [*(id *)(*(void *)(a1 + 32) + 64) layer];
  [v7 setAllowsHitTesting:0];
}

void __48___UINavigationBarTransitionContextZoom_animate__block_invoke_2(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11 = a2;
  id v12 = [[_UIPortalView alloc] initWithSourceView:v11];
  [v11 setHidden:0];

  v14.origin.double x = a3;
  v14.origin.double y = a4;
  v14.size.double width = a5;
  v14.size.double height = a6;
  CGRect v15 = CGRectOffset(v14, 0.0, *(CGFloat *)(a1 + 40));
  -[_UIPortalView setFrame:](v12, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  [(_UIPortalView *)v12 setHidesSourceView:1];
  [(_UIPortalView *)v12 setAllowsHitTesting:1];
  [(_UIPortalView *)v12 setForwardsClientHitTestingToSourceView:1];
  [(UIView *)v12 setClipsToBounds:1];
  [*(id *)(*(void *)(a1 + 32) + 64) addSubview:v12];
  [*(id *)(a1 + 32) _addTemporaryView:v12];
}

uint64_t __48___UINavigationBarTransitionContextZoom_animate__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setHidden:0];
}

uint64_t __63___UINavigationBarTransitionContextZoom_prepareForInterruption__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _cleanupZoomContent];
}

uint64_t __60___UINavigationBarTransitionContextZoom__cleanupZoomContent__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidden:0];
}

uint64_t __60___UINavigationBarTransitionContextZoom__cleanupZoomContent__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setHidden:0];
}

@end