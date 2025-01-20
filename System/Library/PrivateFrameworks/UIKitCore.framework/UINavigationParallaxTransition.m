@interface UINavigationParallaxTransition
@end

@implementation UINavigationParallaxTransition

uint64_t __73___UINavigationParallaxTransition_animatePreemptionSnapshotsWithContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 40) + 136) fromViewControllerHandoffData];
  [v2 targetFrame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  v3 = *(void **)(a1 + 32);
  return [v3 setAlpha:0.9];
}

uint64_t __73___UINavigationParallaxTransition_animatePreemptionSnapshotsWithContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

id __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke(uint64_t a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_2;
  v11[3] = &unk_1E52EA898;
  id v12 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  id v13 = v2;
  uint64_t v14 = v3;
  uint64_t v22 = *(void *)(a1 + 112);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 120);
  id v15 = v5;
  uint64_t v23 = v6;
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 128);
  id v16 = v7;
  uint64_t v24 = v8;
  id v17 = *(id *)(a1 + 72);
  long long v25 = *(_OWORD *)(a1 + 136);
  char v31 = *(unsigned char *)(a1 + 232);
  long long v26 = *(_OWORD *)(a1 + 152);
  id v18 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 88);
  long long v27 = *(_OWORD *)(a1 + 168);
  long long v28 = *(_OWORD *)(a1 + 184);
  long long v29 = *(_OWORD *)(a1 + 200);
  id v20 = *(id *)(a1 + 96);
  id v21 = *(id *)(a1 + 104);
  char v32 = *(unsigned char *)(a1 + 233);
  long long v30 = *(_OWORD *)(a1 + 216);
  +[UIView performWithoutAnimation:v11];
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 200) + 8) + 40);

  return v9;
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setInCustomTransition:1];
  [*(id *)(a1 + 40) _setInCustomTransition:1];
  [*(id *)(*(void *)(a1 + 48) + 96) setBackgroundColor:0];
  [*(id *)(*(void *)(a1 + 48) + 88) setBackgroundColor:0];
  [*(id *)(*(void *)(a1 + 48) + 56) initialFrameForViewController:*(void *)(a1 + 32)];
  id v2 = *(void **)(*(void *)(a1 + 112) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  if (CGRectEqualToRect(*(CGRect *)(*(void *)(*(void *)(a1 + 112) + 8) + 32), *MEMORY[0x1E4F1DB28]))
  {
    [*(id *)(a1 + 56) frame];
    id v7 = *(void **)(*(void *)(a1 + 112) + 8);
    v7[4] = v8;
    v7[5] = v9;
    v7[6] = v10;
    v7[7] = v11;
  }
  [*(id *)(*(void *)(a1 + 48) + 56) finalFrameForViewController:*(void *)(a1 + 40)];
  id v12 = *(void **)(*(void *)(a1 + 120) + 8);
  v12[4] = v13;
  v12[5] = v14;
  v12[6] = v15;
  v12[7] = v16;
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 56));
  [*(id *)(a1 + 72) bounds];
  id v17 = *(void **)(*(void *)(a1 + 128) + 8);
  v17[4] = v18;
  v17[5] = v19;
  v17[6] = v20;
  v17[7] = v21;
  uint64_t v22 = *(void *)(*(void *)(a1 + 136) + 8);
  uint64_t v23 = *(void *)(*(void *)(a1 + 128) + 8);
  long long v24 = *(_OWORD *)(v23 + 48);
  *(_OWORD *)(v22 + 32) = *(_OWORD *)(v23 + 32);
  *(_OWORD *)(v22 + 48) = v24;
  [*(id *)(a1 + 48) gapBetweenViews];
  *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = v25;
  [*(id *)(a1 + 48) parallaxOffset];
  uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 48);
  int v28 = *(unsigned __int8 *)(a1 + 232);
  uint64_t v29 = *(void *)(*(void *)(a1 + 152) + 8);
  uint64_t v30 = *(void *)(*(void *)(a1 + 128) + 8);
  long long v31 = *(_OWORD *)(v30 + 48);
  *(_OWORD *)(v29 + 32) = *(_OWORD *)(v30 + 32);
  *(_OWORD *)(v29 + 48) = v31;
  uint64_t v32 = *(void *)(*(void *)(a1 + 152) + 8);
  double v33 = *(double *)(v32 + 48);
  if (v27 != 2)
  {
    double v41 = v33 - v26 + *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
    double v42 = *(double *)(v32 + 32);
    if (!v28)
    {
      *(double *)(v32 + 32) = v42 - v41;
      uint64_t v51 = *(void *)(*(void *)(a1 + 160) + 8);
      uint64_t v52 = *(void *)(*(void *)(a1 + 136) + 8);
      long long v53 = *(_OWORD *)(v52 + 48);
      *(_OWORD *)(v51 + 32) = *(_OWORD *)(v52 + 32);
      *(_OWORD *)(v51 + 48) = v53;
      uint64_t v39 = *(void *)(*(void *)(a1 + 160) + 8);
      double v40 = *(double *)(v39 + 48);
      goto LABEL_11;
    }
    *(double *)(v32 + 32) = v42 + v41;
    uint64_t v43 = *(void *)(*(void *)(a1 + 160) + 8);
    uint64_t v44 = *(void *)(*(void *)(a1 + 136) + 8);
    long long v45 = *(_OWORD *)(v44 + 48);
    *(_OWORD *)(v43 + 32) = *(_OWORD *)(v44 + 32);
    *(_OWORD *)(v43 + 48) = v45;
    uint64_t v39 = *(void *)(*(void *)(a1 + 160) + 8);
    double v46 = *(double *)(v39 + 48);
LABEL_9:
    double v50 = *(double *)(v39 + 32) - (v46 + *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24));
    goto LABEL_12;
  }
  double v34 = v33 + *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
  double v35 = *(double *)(v32 + 32);
  if (!v28)
  {
    *(double *)(v32 + 32) = v35 + v34;
    uint64_t v47 = *(void *)(*(void *)(a1 + 160) + 8);
    uint64_t v48 = *(void *)(*(void *)(a1 + 136) + 8);
    long long v49 = *(_OWORD *)(v48 + 48);
    *(_OWORD *)(v47 + 32) = *(_OWORD *)(v48 + 32);
    *(_OWORD *)(v47 + 48) = v49;
    uint64_t v39 = *(void *)(*(void *)(a1 + 160) + 8);
    double v46 = *(double *)(v39 + 48) - v26;
    goto LABEL_9;
  }
  *(double *)(v32 + 32) = v35 - v34;
  uint64_t v36 = *(void *)(*(void *)(a1 + 160) + 8);
  uint64_t v37 = *(void *)(*(void *)(a1 + 136) + 8);
  long long v38 = *(_OWORD *)(v37 + 48);
  *(_OWORD *)(v36 + 32) = *(_OWORD *)(v37 + 32);
  *(_OWORD *)(v36 + 48) = v38;
  uint64_t v39 = *(void *)(*(void *)(a1 + 160) + 8);
  double v40 = *(double *)(v39 + 48) - v26;
LABEL_11:
  double v50 = *(double *)(v39 + 32) + v40 + *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
LABEL_12:
  *(double *)(v39 + 32) = v50;
  v54 = *(void **)(a1 + 80);
  if (v54)
  {
    [v54 frame];
  }
  else
  {
    v59 = *(double **)(*(void *)(a1 + 128) + 8);
    double v55 = v59[4];
    double v56 = v59[5];
    double v57 = v59[6];
    double v58 = v59[7];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 88), "setFrame:", v55, v56, v57, v58);
  v60 = *(void **)(a1 + 88);
  if (v60)
  {
    [v60 frame];
  }
  else
  {
    v65 = *(double **)(*(void *)(a1 + 160) + 8);
    double v61 = v65[4];
    double v62 = v65[5];
    double v63 = v65[6];
    double v64 = v65[7];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 96), "setFrame:", v61, v62, v63, v64);
  uint64_t v66 = *(void *)(a1 + 48);
  if (*(void *)(v66 + 112)) {
    goto LABEL_31;
  }
  v67 = [_UIParallaxDimmingView alloc];
  v68 = *(double **)(*(void *)(a1 + 136) + 8);
  v69 = [*(id *)(a1 + 48) overrideDimmingColor];
  uint64_t v70 = -[_UIParallaxDimmingView initWithFrame:overrideDimmingColor:](v67, "initWithFrame:overrideDimmingColor:", v69, v68[4], v68[5], v68[6], v68[7]);
  uint64_t v71 = *(void *)(a1 + 48);
  v72 = *(void **)(v71 + 80);
  *(void *)(v71 + 80) = v70;

  if (*(void *)(*(void *)(a1 + 48) + 48) == 2)
  {
    v73 = *(void **)(a1 + 88);
    if (!v73)
    {
      double v74 = 1.0;
      goto LABEL_24;
    }
LABEL_23:
    [v73 dimmingAmount];
LABEL_24:
    *(double *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) = v74;
    double v75 = 1.0;
    if (*(void *)(*(void *)(a1 + 48) + 48) == 2) {
      double v75 = 0.0;
    }
    goto LABEL_28;
  }
  v73 = *(void **)(a1 + 80);
  if (v73) {
    goto LABEL_23;
  }
  double v75 = 1.0;
LABEL_28:
  *(double *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) = v75;
  double v76 = *(double *)(*(void *)(*(void *)(a1 + 168) + 8) + 24);
  v77 = [*(id *)(a1 + 48) contentDimmingView];
  [v77 setBackgroundDimmingAmount:v76];

  v78 = [_UIParallaxDimmingView alloc];
  uint64_t v79 = 64;
  if (*(void *)(*(void *)(a1 + 48) + 48) == 2) {
    uint64_t v79 = 56;
  }
  uint64_t v80 = [(_UIParallaxDimmingView *)v78 initViewWrappingView:*(void *)(a1 + v79) withLeftBorder:*(unsigned __int8 *)(a1 + 232) shouldReverseLayoutDirection:9.0];
  uint64_t v81 = *(void *)(a1 + 48);
  v82 = *(void **)(v81 + 72);
  *(void *)(v81 + 72) = v80;

  *(void *)(*(void *)(*(void *)(a1 + 184) + 8) + 24) = 0x3FF0000000000000;
  *(void *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) = 0;
  uint64_t v66 = *(void *)(a1 + 48);
LABEL_31:
  [*(id *)(v66 + 72) _updateLeftEdgeFade:*(unsigned __int8 *)(a1 + 232)];
  uint64_t v83 = *(void *)(a1 + 48);
  if (*(void *)(v83 + 48) == 2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 200) + 8) + 40), *(id *)(a1 + 64));
    uint64_t v84 = *(void *)(a1 + 48);
    uint64_t v85 = *(void *)(v84 + 112);
    v86 = (id *)(v84 + 72);
    if (v85) {
      v86 = (id *)(a1 + 56);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 208) + 8) + 40), *v86);
    [*(id *)(a1 + 96) insertSubview:*(void *)(*(void *)(*(void *)(a1 + 200) + 8) + 40) atIndex:0];
    [*(id *)(a1 + 104) insertSubview:*(void *)(*(void *)(*(void *)(a1 + 208) + 8) + 40) atIndex:0];
    [*(id *)(a1 + 72) addSubview:*(void *)(*(void *)(a1 + 48) + 96)];
    v87 = *(void **)(a1 + 48);
    if (!v87[14])
    {
      [*(id *)(a1 + 72) addSubview:v87[10]];
      v87 = *(void **)(a1 + 48);
    }
    v88 = v87 + 11;
  }
  else
  {
    uint64_t v89 = *(void *)(v83 + 112);
    v90 = (id *)(v83 + 72);
    if (v89) {
      v90 = (id *)(a1 + 64);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 200) + 8) + 40), *v90);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 208) + 8) + 40), *(id *)(a1 + 56));
    [*(id *)(a1 + 96) insertSubview:*(void *)(*(void *)(*(void *)(a1 + 200) + 8) + 40) atIndex:0];
    [*(id *)(a1 + 104) insertSubview:*(void *)(*(void *)(*(void *)(a1 + 208) + 8) + 40) atIndex:0];
    [*(id *)(a1 + 72) addSubview:*(void *)(*(void *)(a1 + 48) + 88)];
    v91 = *(void **)(a1 + 48);
    if (!v91[14])
    {
      [*(id *)(a1 + 72) addSubview:v91[10]];
      v91 = *(void **)(a1 + 48);
    }
    v88 = v91 + 12;
  }
  [*(id *)(a1 + 72) addSubview:*v88];
  uint64_t v92 = *(void *)(a1 + 48);
  if ((*(unsigned char *)(a1 + 233) || *(unsigned char *)(v92 + 40)) && !*(void *)(v92 + 112))
  {
    uint64_t v93 = *(void *)(v92 + 48);
    [*(id *)(a1 + 72) bounds];
    v94 = *(void **)(*(void *)(a1 + 216) + 8);
    v94[4] = v95;
    v94[5] = v96;
    v94[6] = v97;
    v94[7] = v98;
    if (v93 == 2)
    {
      *(CGFloat *)(*(void *)(*(void *)(a1 + 216) + 8) + 48) = CGRectGetMinX(*(CGRect *)(*(void *)(*(void *)(a1 + 128) + 8)
                                                                                              + 32));
      if (*(unsigned char *)(a1 + 232)) {
        *(void *)(*(void *)(*(void *)(a1 + 216) + 8) + 32) = *(void *)(*(void *)(*(void *)(a1 + 136)
      }
                                                                                             + 8)
                                                                                 + 48);
      [*(id *)(a1 + 72) bounds];
      v99 = *(void **)(*(void *)(a1 + 224) + 8);
      v99[4] = v100;
      v99[5] = v101;
      v99[6] = v102;
      v99[7] = v103;
      v104 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", *(double *)(*(void *)(*(void *)(a1 + 216) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 216) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 216) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 216) + 8) + 56));
      uint64_t v105 = *(void *)(a1 + 48);
      v106 = *(void **)(v105 + 104);
      *(void *)(v105 + 104) = v104;

      [*(id *)(a1 + 72) insertSubview:*(void *)(*(void *)(a1 + 48) + 104) belowSubview:*(void *)(*(void *)(a1 + 48) + 96)];
      [*(id *)(*(void *)(a1 + 48) + 104) addSubview:*(void *)(*(void *)(a1 + 48) + 96)];
      if (*(unsigned char *)(a1 + 232))
      {
        [*(id *)(*(void *)(a1 + 48) + 96) frame];
        [*(id *)(*(void *)(a1 + 48) + 96) setFrame:v107 - v108];
      }
    }
    else
    {
      *(CGFloat *)(*(void *)(*(void *)(a1 + 216) + 8) + 48) = CGRectGetMinX(*(CGRect *)(*(void *)(*(void *)(a1 + 160) + 8)
                                                                                              + 32));
      [*(id *)(a1 + 72) bounds];
      v109 = *(void **)(*(void *)(a1 + 224) + 8);
      v109[4] = v110;
      v109[5] = v111;
      v109[6] = v112;
      v109[7] = v113;
      *(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 48) = 0;
      if (*(unsigned char *)(a1 + 232)) {
        *(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 32) = *(void *)(*(void *)(*(void *)(a1 + 128)
      }
                                                                                             + 8)
                                                                                 + 48);
      v114 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", *(double *)(*(void *)(*(void *)(a1 + 216) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 216) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 216) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 216) + 8) + 56));
      uint64_t v115 = *(void *)(a1 + 48);
      v116 = *(void **)(v115 + 104);
      *(void *)(v115 + 104) = v114;

      [*(id *)(a1 + 72) insertSubview:*(void *)(*(void *)(a1 + 48) + 104) belowSubview:*(void *)(*(void *)(a1 + 48) + 88)];
      [*(id *)(*(void *)(a1 + 48) + 104) addSubview:*(void *)(*(void *)(a1 + 48) + 88)];
      if (*(unsigned char *)(a1 + 232)) {
        *(double *)(*(void *)(*(void *)(a1 + 152) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 152)
      }
                                                                                             + 8)
                                                                                 + 32)
                                                                     - *(double *)(*(void *)(*(void *)(a1 + 152)
                                                                                             + 8)
                                                                                 + 48);
    }
    [*(id *)(*(void *)(a1 + 48) + 104) addSubview:*(void *)(*(void *)(a1 + 48) + 80)];
    [*(id *)(*(void *)(a1 + 48) + 104) setClipsToBounds:1];
  }
  v117 = -[UIViewController _parentViewController](*(id **)(a1 + 40));

  if (v117)
  {
    [*(id *)(*(void *)(a1 + 48) + 56) finalFrameForViewController:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 40), "_updateContentOverlayInsetsFromParentForNavigationTransitionWithFinalRectInParent:");
  }
  [*(id *)(a1 + 104) bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 144), "setFrame:");
  [*(id *)(a1 + 104) addSubview:*(void *)(*(void *)(a1 + 48) + 144)];
  [*(id *)(a1 + 96) bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 152), "setFrame:");
  v118 = *(void **)(a1 + 96);
  uint64_t v119 = *(void *)(*(void *)(a1 + 48) + 152);
  return [v118 addSubview:v119];
}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_3(uint64_t a1)
{
  CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v12.minimum;
  float maximum = v12.maximum;
  float preferred = v12.preferred;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_4;
  v9[3] = &unk_1E52EA8E8;
  v9[4] = *(void *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v8;
  long long v10 = v8;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048616, v9, COERCE_DOUBLE(__PAIR64__(DWORD1(v8), LODWORD(minimum))), v6, v7);
}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56));
  id v2 = *(id **)(a1 + 32);
  if (v2[13])
  {
    objc_msgSend(v2[13], "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 56));
    id v2 = *(id **)(a1 + 32);
  }
  uint64_t v3 = [v2 contentDimmingView];
  [v3 crossFade];

  uint64_t v4 = [*(id *)(a1 + 32) borderDimmingView];
  [v4 crossFade];

  id v5 = [*(id *)(a1 + 40) _hostingNavigationBar];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) _hostingNavigationBar];
    [v6 setNeedsLayout];
  }
}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_5(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) transitionWasCancelled];
  if (v2)
  {
    uint64_t v3 = *(double **)(*(void *)(a1 + 88) + 8);
    uint64_t v4 = v3 + 4;
    id v5 = v3 + 5;
    id v6 = v3 + 6;
    double v7 = v3 + 7;
    long long v8 = (id *)(a1 + 40);
  }
  else
  {
    uint64_t v9 = *(double **)(*(void *)(a1 + 96) + 8);
    uint64_t v4 = v9 + 4;
    id v5 = v9 + 5;
    id v6 = v9 + 6;
    double v7 = v9 + 7;
    long long v8 = (id *)(a1 + 48);
  }
  objc_msgSend(*v8, "setFrame:", *v4, *v5, *v6, *v7);
  long long v10 = [*(id *)(a1 + 40) layer];
  LODWORD(v11) = 1.0;
  [v10 setSpeed:v11];

  CAFrameRateRange v12 = [*(id *)(a1 + 48) layer];
  LODWORD(v13) = 1.0;
  [v12 setSpeed:v13];

  [*(id *)(a1 + 56) _setInCustomTransition:0];
  [*(id *)(a1 + 64) _setInCustomTransition:0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_6;
  v24[3] = &unk_1E52DCB30;
  id v25 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 40);
  uint64_t v15 = *(void **)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 80);
  id v26 = v14;
  uint64_t v27 = v16;
  id v17 = [v15 _window];
  uint64_t v18 = [v17 windowScene];
  +[UIView _performBlockWithoutAutomaticallyUpdatingFirstResponder:forScene:]((uint64_t)UIView, v24, v18);

  uint64_t v19 = [*(id *)(a1 + 48) _safeAreaInsetsFrozen];
  if (v2 && _UIViewDirtiesDelegateContentInsetsForGeometryChange()) {
    [*(id *)(a1 + 48) _setSafeAreaInsetsFrozen:1];
  }
  [*(id *)(a1 + 72) insertSubview:*(void *)(a1 + 48) belowSubview:*(void *)(*(void *)(a1 + 80) + 96)];
  [*(id *)(*(void *)(a1 + 80) + 96) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 80) + 88) removeFromSuperview];
  uint64_t v20 = *(void **)(a1 + 80);
  if (!v20[14])
  {
    uint64_t v21 = [v20 contentDimmingView];
    [v21 removeFromSuperview];

    uint64_t v22 = [*(id *)(a1 + 80) borderDimmingView];
    [v22 removeFromSuperview];

    uint64_t v23 = *(id **)(a1 + 80);
    if (v23[13])
    {
      [v23[13] removeFromSuperview];
      uint64_t v23 = *(id **)(a1 + 80);
    }
    [v23 setClipUnderView:0];
    [*(id *)(a1 + 80) setBorderDimmingView:0];
    [*(id *)(a1 + 80) setContentDimmingView:0];
  }
  [*(id *)(a1 + 32) completeTransition:v2 ^ 1u];
  [*(id *)(a1 + 80) setTransitionContext:0];
  [*(id *)(a1 + 48) _setSafeAreaInsetsFrozen:v19 updateForUnfreeze:0];
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertSubview:*(void *)(a1 + 40) belowSubview:*(void *)(*(void *)(a1 + 48) + 88)];
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_7(uint64_t a1, double a2)
{
  CAFrameRateRange v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_8;
  v7[3] = &unk_1E52EA938;
  double v14 = a2;
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v9 = v4;
  long long v5 = *(_OWORD *)(a1 + 80);
  long long v10 = *(_OWORD *)(a1 + 64);
  long long v11 = v5;
  long long v12 = *(_OWORD *)(a1 + 96);
  uint64_t v13 = *(void *)(a1 + 112);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048616, v7, *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);
}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_8(uint64_t a1)
{
  double v46 = *(double *)(a1 + 120);
  int v2 = *(CGFloat **)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(double **)(*(void *)(a1 + 48) + 8);
  CGFloat v4 = v2[4];
  CGFloat v5 = v2[5];
  CGFloat v6 = v2[6];
  v67.size.height = v2[7];
  CGFloat v7 = v3[4];
  CGFloat v8 = v3[5];
  CGFloat rect = v67.size.height;
  CGFloat v9 = v3[6];
  CGFloat v10 = v3[7];
  CGFloat v59 = v7;
  CGFloat v62 = v10;
  v67.origin.x = v4;
  v67.origin.y = v5;
  v67.size.width = v6;
  double MinX = CGRectGetMinX(v67);
  v68.origin.x = v7;
  v68.origin.y = v8;
  v68.size.width = v9;
  v68.size.height = v10;
  double v51 = (1.0 - v46) * MinX + v46 * CGRectGetMinX(v68);
  v69.origin.x = v4;
  v69.origin.y = v5;
  v69.size.width = v6;
  v69.size.height = rect;
  double MinY = CGRectGetMinY(v69);
  v70.origin.x = v7;
  v70.origin.y = v8;
  v70.size.width = v9;
  v70.size.height = v10;
  double v50 = (1.0 - v46) * MinY + v46 * CGRectGetMinY(v70);
  v71.origin.x = v4;
  v71.origin.y = v5;
  v71.size.width = v6;
  v71.size.height = rect;
  double Width = CGRectGetWidth(v71);
  v72.origin.x = v7;
  v72.origin.y = v8;
  v72.size.width = v9;
  v72.size.height = v10;
  double v13 = (1.0 - v46) * Width + v46 * CGRectGetWidth(v72);
  v73.origin.x = v4;
  v73.origin.y = v5;
  v73.size.width = v6;
  v73.size.height = rect;
  double Height = CGRectGetHeight(v73);
  v74.origin.y = v8;
  v74.origin.x = v59;
  v74.size.width = v9;
  v74.size.height = v62;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setFrame:", v51, v50, v13, (1.0 - v46) * Height + v46 * CGRectGetHeight(v74));
  CAFrameRateRange v15 = *(CGFloat **)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(double **)(*(void *)(a1 + 64) + 8);
  CGFloat v18 = v15[4];
  CGFloat v17 = v15[5];
  v75.size.width = v15[6];
  CGFloat v19 = v15[7];
  CGFloat v60 = v75.size.width;
  CGFloat v20 = v16[4];
  CGFloat v21 = v16[5];
  CGFloat v23 = v16[6];
  CGFloat v22 = v16[7];
  double v63 = *(double *)(a1 + 120);
  v75.origin.x = v18;
  v75.origin.y = v17;
  v75.size.height = v19;
  CGFloat v47 = v19;
  double v24 = CGRectGetMinX(v75);
  v76.origin.x = v20;
  CGFloat v45 = v21;
  v76.origin.y = v21;
  v76.size.width = v23;
  v76.size.height = v22;
  double v57 = (1.0 - v63) * v24 + v63 * CGRectGetMinX(v76);
  v77.origin.x = v18;
  v77.origin.y = v17;
  v77.size.width = v60;
  v77.size.height = v19;
  double v25 = CGRectGetMinY(v77);
  v78.origin.x = v20;
  v78.origin.y = v21;
  v78.size.width = v23;
  v78.size.height = v22;
  double recta = (1.0 - v63) * v25 + v63 * CGRectGetMinY(v78);
  v79.origin.x = v18;
  v79.origin.y = v17;
  v79.size.width = v60;
  v79.size.height = v47;
  double v26 = CGRectGetWidth(v79);
  v80.origin.x = v20;
  v80.origin.y = v21;
  v80.size.width = v23;
  v80.size.height = v22;
  double v52 = (1.0 - v63) * v26 + v63 * CGRectGetWidth(v80);
  v81.origin.x = v18;
  v81.origin.y = v17;
  v81.size.width = v60;
  v81.size.height = v47;
  double v27 = CGRectGetHeight(v81);
  v82.origin.x = v20;
  v82.origin.y = v21;
  v82.size.width = v23;
  v82.size.height = v22;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "setFrame:", v57, recta, v52, (1.0 - v63) * v27 + v63 * CGRectGetHeight(v82));
  int v28 = *(void **)(a1 + 32);
  if (v28[13])
  {
    uint64_t v29 = *(CGFloat **)(*(void *)(a1 + 72) + 8);
    uint64_t v30 = *(double **)(*(void *)(a1 + 80) + 8);
    CGFloat v32 = v29[4];
    CGFloat v31 = v29[5];
    v83.size.width = v29[6];
    CGFloat v33 = v29[7];
    CGFloat v61 = v83.size.width;
    CGFloat v34 = v30[4];
    CGFloat v35 = v30[5];
    CGFloat v37 = v30[6];
    CGFloat v36 = v30[7];
    double v64 = *(double *)(a1 + 120);
    v83.origin.x = v32;
    v83.origin.y = v31;
    v83.size.height = v33;
    CGFloat v48 = v33;
    double v38 = CGRectGetMinX(v83);
    v84.origin.x = v34;
    CGFloat v45 = v35;
    v84.origin.y = v35;
    v84.size.width = v37;
    v84.size.height = v36;
    double v58 = (1.0 - v64) * v38 + v64 * CGRectGetMinX(v84);
    v85.origin.x = v32;
    v85.origin.y = v31;
    v85.size.width = v61;
    v85.size.height = v33;
    double v39 = CGRectGetMinY(v85);
    v86.origin.x = v34;
    v86.origin.y = v35;
    v86.size.width = v37;
    v86.size.height = v36;
    double rectb = (1.0 - v64) * v39 + v64 * CGRectGetMinY(v86);
    v87.origin.x = v32;
    v87.origin.y = v31;
    v87.size.width = v61;
    v87.size.height = v48;
    double v40 = CGRectGetWidth(v87);
    v88.origin.x = v34;
    v88.origin.y = v35;
    v88.size.width = v37;
    v88.size.height = v36;
    double v53 = (1.0 - v64) * v40 + v64 * CGRectGetWidth(v88);
    v89.origin.x = v32;
    v89.origin.y = v31;
    v89.size.width = v61;
    v89.size.height = v48;
    double v41 = CGRectGetHeight(v89);
    v90.origin.x = v34;
    v90.origin.y = v35;
    v90.size.width = v37;
    v90.size.height = v36;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "setFrame:", v58, rectb, v53, (1.0 - v64) * v41 + v64 * CGRectGetHeight(v90));
    int v28 = *(void **)(a1 + 32);
  }
  double v42 = (1.0 - *(double *)(a1 + 120)) * *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)
      + *(double *)(a1 + 120) * *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  uint64_t v43 = objc_msgSend(v28, "contentDimmingView", *(void *)&v45);
  [v43 setBackgroundDimmingAmount:v42];

  double v44 = (1.0 - *(double *)(a1 + 120)) * *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)
      + *(double *)(a1 + 120) * *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
  id v65 = [*(id *)(a1 + 32) borderDimmingView];
  [v65 setBackgroundDimmingAmount:v44];
}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_9(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_10;
  v8[3] = &unk_1E52D9F70;
  id v9 = *(id *)(a1 + 32);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048616, v8, v5, v6, v7);
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", 100.0, 0.0, 1.0, 1.0);
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  self;
  if (fluidPresentationTransitionsEnabled == 1)
  {
    [*(id *)(a1 + 32) transitionDuration:*(void *)(a1 + 40)];
    CGFloat v8 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:v7];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_14;
    v9[3] = &unk_1E52E8F50;
    id v10 = v5;
    +[UIView _animateUsingSpringBehavior:v8 tracking:0 animations:v6 completion:v9];

    id v6 = v10;
  }
  else
  {
    [*(id *)(a1 + 32) transitionDuration:*(void *)(a1 + 40)];
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", *(void *)(a1 + 48), v6, v5);
  }
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_15(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

uint64_t __61___UINavigationParallaxTransition__stopTransitionImmediately__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishAnimationAtPosition:0];
}

@end