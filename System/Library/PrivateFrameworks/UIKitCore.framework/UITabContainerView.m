@interface UITabContainerView
@end

@implementation UITabContainerView

void __37___UITabContainerView_floatingTabBar__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    id v10 = objc_loadWeakRetained(WeakRetained + 75);
    [v10 tabBarContainerDidLayoutFloatingTabBar:v11];

    objc_msgSend(v11, "_updateSidebarContentMarginsWithTabBarContentFrame:", a2, a3, a4, a5);
    [v11 _updateFloatingTabBarFrame];
    WeakRetained = v11;
  }
}

void __74___UITabContainerView__updateSidebarContentMarginsWithTabBarContentFrame___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) outlineView];
  -[_UITabOutlineView setAdditionalEditingInsets:]((uint64_t)v5, v1, v2, v3, v4);
}

void __43___UITabContainerView__sidebarToggleAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v1 = [WeakRetained sidebar];
  int v2 = [v1 isHidden];

  double v3 = [WeakRetained sidebar];
  -[UITabBarControllerSidebar _setHidden:source:]((uint64_t)v3, v2 ^ 1, 1);
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    [WeakRetained[51] removeFromSuperview];
    id v2 = v10[51];
    v10[51] = 0;

    id v3 = v10[52];
    v10[52] = 0;

    id v4 = v10[53];
    v10[53] = 0;

    id v5 = v10[54];
    v10[54] = 0;

    v6 = [v10 outlineView];
    [v6 setHidden:0];

    v7 = [v10 floatingTabBar];
    [v7 setHidden:0];

    v8 = [v10 floatingTabBar];
    [v8 transitionDidEnd];

    v9 = [v10 outlineView];
    if (v9) {
      v9[411] = 0;
    }

    [v10 _updateVisibleBarAnimated:0];
    id WeakRetained = v10;
  }
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_30(uint64_t a1)
{
  [*(id *)(a1 + 32) increment];
  id v2 = [[_UITabSidebarTransitionAnimator alloc] initWithContainerView:*(void *)(a1 + 40) duration:0.5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2;
  v8[3] = &unk_1E52DCB30;
  v8[4] = *(void *)(a1 + 40);
  v9 = v2;
  id v10 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_3;
  v4[3] = &unk_1E52DAF68;
  id v5 = *(id *)(a1 + 48);
  v6 = v9;
  id v7 = *(id *)(a1 + 32);
  id v3 = v9;
  +[UIView animateWithDuration:0 delay:v8 usingSpringWithDamping:v4 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:0.0];
}

uint64_t __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) floatingTabBarHost];
  [v2 tabBarContainerWillChangeFloatingTabBarVisibility:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 updateContentLayoutForSidebarAppearanceWithTransitionCoordinator:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) runAnimations];
  id v4 = *(void **)(a1 + 40);
  return [v4 runAnimations];
}

uint64_t __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) runCompletions];
  [*(id *)(a1 + 40) runCompletions];
  id v2 = *(void **)(a1 + 48);
  return [v2 complete];
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 459) = *(unsigned char *)(a1 + 336) ^ 1;
  [*(id *)(a1 + 40) increment];
  id v2 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3254779904;
  v9[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_5;
  v9[3] = &unk_1ED0E74C8;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  char v21 = *(unsigned char *)(a1 + 336);
  __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v14, (id *)(a1 + 88));
  long long v3 = *(_OWORD *)(a1 + 256);
  long long v15 = *(_OWORD *)(a1 + 240);
  long long v16 = v3;
  long long v4 = *(_OWORD *)(a1 + 288);
  long long v17 = *(_OWORD *)(a1 + 272);
  long long v5 = *(_OWORD *)(a1 + 304);
  long long v6 = *(_OWORD *)(a1 + 320);
  long long v18 = v4;
  long long v19 = v5;
  long long v20 = v6;
  id v13 = *(id *)(a1 + 72);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_33;
  v7[3] = &unk_1E52DA9D0;
  id v8 = *(id *)(a1 + 40);
  +[UIView _animateUsingSpringBehavior:v2 tracking:0 animations:v9 completion:v7];
  if (*(unsigned char *)(a1 + 337)) {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  uint64_t v26 = v3;
  uint64_t v27 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  [*(id *)(a1 + 32) center];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  id v12 = [*(id *)(a1 + 40) layer];
  [v12 position];
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  long long v17 = [*(id *)(a1 + 48) layer];
  [v17 position];
  uint64_t v19 = v18;
  uint64_t v21 = v20;

  if (*(unsigned char *)(a1 + 312))
  {
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 96);
    uint64_t v14 = *(void *)(a1 + 112);
    long long v22 = *(_OWORD *)(a1 + 232);
    v44[0] = *(_OWORD *)(a1 + 216);
    v44[1] = v22;
    v44[2] = *(_OWORD *)(a1 + 248);
    [*(id *)(a1 + 48) setTransform:v44];
    long long v23 = *(_OWORD *)(a1 + 280);
    v43[0] = *(_OWORD *)(a1 + 264);
    v43[1] = v23;
    v43[2] = *(_OWORD *)(a1 + 296);
    [*(id *)(a1 + 40) setTransform:v43];
    uint64_t v19 = v14;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 88);
    uint64_t v11 = *(void *)(a1 + 104);
    uint64_t v16 = *(void *)(a1 + 120);
    uint64_t v21 = v16;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_6;
  v28[3] = &unk_1E53063B0;
  id v29 = *(id *)(a1 + 32);
  uint64_t v33 = v9;
  uint64_t v34 = v11;
  uint64_t v35 = v27;
  uint64_t v36 = v26;
  uint64_t v37 = v5;
  uint64_t v38 = v7;
  id v30 = *(id *)(a1 + 56);
  id v31 = *(id *)(a1 + 40);
  uint64_t v39 = v14;
  uint64_t v40 = v16;
  id v32 = *(id *)(a1 + 48);
  uint64_t v41 = v19;
  uint64_t v42 = v21;
  +[UIView _modifyAnimationsByDecomposingGeometricTypes:1 animations:v28];
  [*(id *)(a1 + 48) setAlpha:0.0];
  v24 = [*(id *)(a1 + 48) layer];
  [v24 setValue:&unk_1ED3F2608 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  v25 = [*(id *)(a1 + 40) layer];
  [v25 setValue:&unk_1ED3F25F8 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  double v2 = *(double *)(a1 + 112);
  double v3 = *(double *)(a1 + 120);
  uint64_t v4 = [*(id *)(a1 + 48) layer];
  objc_msgSend(v4, "setPosition:", v2, v3);

  double v5 = *(double *)(a1 + 128);
  double v6 = *(double *)(a1 + 136);
  id v7 = [*(id *)(a1 + 56) layer];
  objc_msgSend(v7, "setPosition:", v5, v6);
}

uint64_t __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) complete];
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_36(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  double v39 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v40 = *MEMORY[0x1E4F1DAD8];
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", *(void *)(a1 + 40));
  uint64_t v11 = v10;
  double v13 = v12;
  if (*(unsigned char *)(a1 + 536)) {
    double v14 = -[_UITabOutlineView sidebarButtonOrigin](*(void **)(a1 + 48));
  }
  else {
    [*(id *)(a1 + 56) sidebarButtonOrigin];
  }
  double v16 = v14;
  uint64_t v17 = v15;
  if (!*(unsigned char *)(a1 + 536) && [*(id *)(a1 + 40) _isTabBarHidden])
  {
    [*(id *)(a1 + 56) frame];
    double v13 = v13 - CGRectGetMaxY(v72);
  }
  double v41 = v13;
  [*(id *)(a1 + 64) bounds];
  if (!CGRectEqualToRect(v73, *(CGRect *)(a1 + 136)))
  {
    uint64_t v18 = [*(id *)(a1 + 72) subviews];
    uint64_t v19 = [v18 objectAtIndex:0];

    [*(id *)(a1 + 64) bounds];
    double v20 = v16;
    uint64_t v21 = v7;
    uint64_t v22 = v3;
    double v24 = v23;
    uint64_t v38 = v11;
    uint64_t v25 = v17;
    uint64_t v26 = v9;
    uint64_t v27 = v5;
    double v29 = v28;
    [*(id *)(a1 + 56) sidebarButtonOrigin];
    double v32 = v24;
    uint64_t v3 = v22;
    uint64_t v7 = v21;
    double v16 = v20;
    double v33 = v29;
    uint64_t v5 = v27;
    uint64_t v9 = v26;
    uint64_t v17 = v25;
    uint64_t v11 = v38;
    objc_msgSend(v19, "setFrame:", v40 - v30, v39 - v31, v32, v33);
    [v19 bounds];
    objc_msgSend(*(id *)(a1 + 72), "setBounds:");
  }
  [*(id *)(a1 + 80) increment];
  id v34 = *(id *)(a1 + 432);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3254779904;
  v50[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2_37;
  v50[3] = &unk_1ED0E7538;
  id v51 = *(id *)(a1 + 88);
  uint64_t v57 = v11;
  double v58 = v41;
  uint64_t v59 = v3;
  uint64_t v60 = v5;
  uint64_t v61 = v7;
  uint64_t v62 = v9;
  id v52 = *(id *)(a1 + 96);
  id v53 = *(id *)(a1 + 104);
  double v63 = v16;
  uint64_t v64 = v17;
  id v54 = *(id *)(a1 + 72);
  id v55 = *(id *)(a1 + 112);
  long long v35 = *(_OWORD *)(a1 + 456);
  long long v65 = *(_OWORD *)(a1 + 440);
  long long v66 = v35;
  long long v67 = *(_OWORD *)(a1 + 472);
  id v56 = *(id *)(a1 + 120);
  long long v36 = *(_OWORD *)(a1 + 504);
  long long v68 = *(_OWORD *)(a1 + 488);
  long long v69 = v36;
  long long v70 = *(_OWORD *)(a1 + 520);
  __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v71, (id *)(a1 + 288));
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_40;
  v48[3] = &unk_1E52DA9D0;
  id v49 = *(id *)(a1 + 80);
  +[UIView _animateUsingSpringBehavior:v34 tracking:0 animations:v50 completion:v48];
  [*(id *)(a1 + 80) increment];
  uint64_t v37 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.8 response:0.2];

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3254779904;
  v44[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2_41;
  _OWORD v44[3] = &unk_1ED0E7570;
  id v45 = *(id *)(a1 + 88);
  __copy_constructor_8_8_t0w64_s64_s72_t80w64_s144((uint64_t)v47, (id *)(a1 + 288));
  id v46 = *(id *)(a1 + 96);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_43;
  v42[3] = &unk_1E52DA9D0;
  id v43 = *(id *)(a1 + 80);
  +[UIView _animateUsingSpringBehavior:v37 tracking:0 animations:v44 completion:v42];
  if (!*(unsigned char *)(a1 + 537)) {
    (*(void (**)(void))(*(void *)(a1 + 128) + 16))();
  }
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2_37(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_3_38;
  v7[3] = &unk_1E53063D8;
  id v8 = *(id *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 96);
  long long v12 = *(_OWORD *)(a1 + 80);
  long long v13 = v2;
  long long v14 = *(_OWORD *)(a1 + 112);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  long long v15 = *(_OWORD *)(a1 + 128);
  id v11 = *(id *)(a1 + 56);
  +[UIView _modifyAnimationsByDecomposingGeometricTypes:1 animations:v7];
  long long v3 = *(_OWORD *)(a1 + 160);
  v6[0] = *(_OWORD *)(a1 + 144);
  v6[1] = v3;
  v6[2] = *(_OWORD *)(a1 + 176);
  [*(id *)(a1 + 64) setTransform:v6];
  long long v4 = *(_OWORD *)(a1 + 208);
  v5[0] = *(_OWORD *)(a1 + 192);
  v5[1] = v4;
  v5[2] = *(_OWORD *)(a1 + 224);
  [*(id *)(a1 + 72) setTransform:v5];
  [*(id *)(a1 + 72) setAlpha:1.0];
  [*(id *)(a1 + 40) setEffect:*(void *)(a1 + 304)];
  [*(id *)(a1 + 312) applyToView:*(void *)(a1 + 32)];
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_3_38(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  double v2 = *(double *)(a1 + 112);
  double v3 = *(double *)(a1 + 120);
  long long v4 = [*(id *)(a1 + 48) layer];
  objc_msgSend(v4, "setPosition:", v2, v3);

  double v5 = *(double *)(a1 + 112);
  double v6 = *(double *)(a1 + 120);
  id v7 = [*(id *)(a1 + 56) layer];
  objc_msgSend(v7, "setPosition:", v5, v6);
}

uint64_t __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_40(uint64_t a1)
{
  return [*(id *)(a1 + 32) complete];
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_2_41(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 144);
  v13[0] = *(_OWORD *)(a1 + 128);
  v13[1] = v2;
  long long v3 = *(_OWORD *)(a1 + 176);
  v13[2] = *(_OWORD *)(a1 + 160);
  v13[3] = v3;
  long long v4 = [*(id *)(a1 + 32) layer];
  [v4 setCornerRadii:v13];

  long long v5 = *(_OWORD *)(a1 + 144);
  long long v9 = *(_OWORD *)(a1 + 128);
  long long v10 = v5;
  long long v6 = *(_OWORD *)(a1 + 176);
  long long v11 = *(_OWORD *)(a1 + 160);
  long long v12 = v6;
  id v7 = [*(id *)(a1 + 40) layer];
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  v8[3] = v12;
  [v7 setCornerRadii:v8];
}

uint64_t __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_43(uint64_t a1)
{
  return [*(id *)(a1 + 32) complete];
}

void __74___UITabContainerView__updateSidebarAppearanceForMorphTransitionAnimated___block_invoke_45(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [a1[4] complete];
  long long v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (id)*((void *)WeakRetained + 56);
    if (v3 == a1[5])
    {
      *((void *)WeakRetained + 56) = 0;

      long long v2 = WeakRetained;
    }
  }
}

uint64_t __56___UITabContainerView_updateEditModeAppearanceAnimated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(a1 + 32) setAlpha:v2];
  if (*(unsigned char *)(a1 + 57)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [*(id *)(a1 + 40) setAlpha:v3];
  [*(id *)(a1 + 40) updateBarForEditingState];
  if (*(unsigned char *)(a1 + 58)) {
    long long v4 = (const UIEdgeInsets *)(*(void *)(a1 + 48) + 464);
  }
  else {
    long long v4 = &UIEdgeInsetsZero;
  }
  double bottom = v4->bottom;
  double right = v4->right;
  double top = v4->top;
  double left = v4->left;
  uint64_t v9 = *(void *)(a1 + 32);
  return -[_UITabOutlineView setAdditionalEditingInsets:](v9, top, left, bottom, right);
}

uint64_t __56___UITabContainerView_updateEditModeAppearanceAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) complete];
}

void __49___UITabContainerView__configuredGroupCompletion__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = (void *)WeakRetained[55];
    WeakRetained[55] = 0;
    id v3 = WeakRetained;

    [v3 _updateVisibleBarAnimated:0];
    [v3 _finalizeEditingState];
    id WeakRetained = v3;
  }
}

void __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) canShowFloatingUI] & 1) == 0)
  {
    double v2 = [*(id *)(*(void *)(a1 + 32) + 632) superview];

    if (!v2)
    {
      [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 632)];
      if (*(unsigned char *)(a1 + 64)) {
        [*(id *)(*(void *)(a1 + 32) + 632) layoutIfNeeded];
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 458) = 1;
    }
  }
  if (*(unsigned char *)(a1 + 65))
  {
    id v3 = [*(id *)(a1 + 40) superview];

    if (!v3)
    {
      [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
      if (*(void *)(a1 + 48)) {
        objc_msgSend(*(id *)(a1 + 32), "addSubview:");
      }
      [*(id *)(a1 + 32) _updateOutlineViewFrame];
      if (*(unsigned char *)(a1 + 64)) {
        [*(id *)(a1 + 40) layoutIfNeeded];
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 458) = 1;
    }
  }
  if (*(unsigned char *)(a1 + 66))
  {
    long long v4 = [*(id *)(a1 + 56) superview];

    if (!v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 600));
      [WeakRetained tabBarContainerWillChangeFloatingTabBarVisibility:*(void *)(a1 + 32)];

      [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 56)];
      [*(id *)(a1 + 32) _updateFloatingTabBarFrame];
      [*(id *)(a1 + 56) updateEditingStateIfNeeded];
      if (*(unsigned char *)(a1 + 64)) {
        [*(id *)(a1 + 56) layoutIfNeeded];
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 458) = 1;
    }
  }
  int v6 = [*(id *)(a1 + 32) wantsHostingNavigationBarPlaceholder];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 608);
  if (v6)
  {
    if (v8)
    {
      *(void *)(v7 + 608) = 0;
    }
  }
  else
  {
    *(void *)(v7 + 608) = 0;

    if (!v8) {
      return;
    }
  }
  id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 600));
  [v9 tabBarContainerWillChangeFloatingTabBarVisibility:*(void *)(a1 + 32)];
}

uint64_t __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 56)];
  long long v2 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v2;
  v8[2] = *(_OWORD *)(a1 + 96);
  [*(id *)(a1 + 32) setAdditionalTransform:v8];
  long long v3 = *(_OWORD *)(a1 + 128);
  v7[0] = *(_OWORD *)(a1 + 112);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 144);
  [*(id *)(a1 + 40) setTransform:v7];
  long long v4 = *(_OWORD *)(a1 + 128);
  v6[0] = *(_OWORD *)(a1 + 112);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 144);
  return [*(id *)(a1 + 48) setTransform:v6];
}

void __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!*((void *)WeakRetained + 55))
    {
      long long v13 = WeakRetained;
      uint64_t v3 = [WeakRetained _currentVisibleComponents];
      id WeakRetained = v13;
      if (v3 == *(void *)(a1 + 56))
      {
        int v4 = v13[458];
        if ((v3 & 2) != 0)
        {
          BOOL v6 = v4 != 0;
        }
        else
        {
          long long v5 = [*(id *)(a1 + 32) superview];

          BOOL v6 = v4 != 0;
          if (v5)
          {
            id v7 = objc_loadWeakRetained((id *)v13 + 75);
            [v7 tabBarContainerWillChangeFloatingTabBarVisibility:v13];

            [*(id *)(a1 + 32) removeFromSuperview];
            BOOL v6 = 1;
          }
        }
        if ((v3 & 4) == 0)
        {
          id v8 = [*(id *)(a1 + 40) superview];

          if (v8)
          {
            [*(id *)(a1 + 40) removeFromSuperview];
            id v9 = [v13 _borderView];
            [v9 removeFromSuperview];

            BOOL v6 = 1;
          }
        }
        long long v10 = [v13 tabBar];
        if ([v13 canShowFloatingUI]
          && ([v10 superview], long long v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
        {
          [v10 removeFromSuperview];
        }
        else if (!v6)
        {
LABEL_16:

          id WeakRetained = v13;
          goto LABEL_17;
        }
        long long v12 = [v13 delegate];
        [v12 didUpdateVisibleAppearance];

        v13[458] = 0;
        goto LABEL_16;
      }
    }
  }
LABEL_17:
}

uint64_t __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_4(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) delegate];
  [v2 updateContentLayoutForSidebarAppearanceWithTransitionCoordinator:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) runAnimations];
  uint64_t v3 = *(void **)(a1 + 48);
  return [v3 runAnimations];
}

uint64_t __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) runCompletions];
  long long v2 = *(void **)(a1 + 40);
  return [v2 runCompletions];
}

uint64_t __81___UITabContainerView__updateVisibleBarAnimated_requireLayout_updateDimmingView___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(a1 + 64))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  long long v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

uint64_t __49___UITabContainerView_updateDimmingViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __49___UITabContainerView_updateDimmingViewAnimated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    if (!*(unsigned char *)(result + 40)) {
      return [*(id *)(result + 32) removeFromSuperview];
    }
  }
  return result;
}

id __55___UITabContainerView_dropInteraction_sessionDidEnter___block_invoke(uint64_t a1)
{
  return +[_UIFloatingTabBarItemView dragPreviewForItem:*(void *)(a1 + 32) userInterfaceStyle:*(void *)(a1 + 40)];
}

@end