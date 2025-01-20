@interface UIFlocker
@end

@implementation UIFlocker

void __21___UIFlocker_install__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v86 = 0u;
  v4 = [*(id *)(a1 + 32) containerView];
  id v5 = v3;
  id v6 = v4;
  [v5 size];
  double v8 = v7;
  double v10 = v9;
  v84 = [v5 target];
  [v84 center];
  double v12 = v11;
  double v14 = v13;
  v15 = [v5 target];
  id v16 = [v15 container];
  id v17 = v6;
  v18 = [v16 traitCollection];
  v19 = _UIContextMenuGetPlatformMetrics([v18 userInterfaceIdiom]);
  v20 = [v19 convertPointBetweenViews];

  if (v20)
  {
    double v21 = ((double (**)(void, id, id, double, double))v20)[2](v20, v16, v17, v12, v14);
    double v23 = v22;
    goto LABEL_25;
  }
  v80 = v15;
  id v24 = v16;
  id v25 = v17;
  v26 = [v24 layer];
  v83 = v25;
  v27 = [v25 layer];
  v82 = v26;
  uint64_t v28 = [v26 presentationLayer];
  v81 = v27;
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [v27 presentationLayer];
    if (!v30 || (_UILayerAncestorsHaveAllBeenCommitted(v26) & 1) == 0)
    {

      goto LABEL_9;
    }
    id v76 = v24;
    int HaveAllBeenCommitted = _UILayerAncestorsHaveAllBeenCommitted(v81);

    if (HaveAllBeenCommitted)
    {
      uint64_t v32 = [v26 presentationLayer];

      [v81 presentationLayer];
      v81 = v29 = v81;
      v82 = (void *)v32;
      id v24 = v76;
LABEL_9:

      goto LABEL_10;
    }
    id v24 = v76;
  }
LABEL_10:
  v33 = [v24 _window];
  v34 = [v83 _window];
  v35 = [v33 windowScene];
  uint64_t v36 = [v34 windowScene];
  v78 = v35;
  v79 = v33;
  if (v33 == v34)
  {
    v50 = v81;
    v49 = v82;
    uint64_t v51 = a1;
    v52 = v34;
    v53 = (void *)v36;
    objc_msgSend(v82, "convertPoint:toLayer:", v81, v12, v14);
    v48 = v53;
    v34 = v52;
    a1 = v51;
    double v21 = v54;
    double v23 = v55;
    goto LABEL_24;
  }
  id v77 = v24;
  if (!v36 || !v35 || v35 == (void *)v36)
  {
    v56 = objc_msgSend(v33, "layer", v36);
    v57 = [v34 layer];
    v74 = v56;
    uint64_t v58 = [v56 presentationLayer];
    if (v58)
    {
      v59 = (void *)v58;
      [v57 presentationLayer];
      v61 = v60 = v57;

      if (!v61)
      {
        v64 = v74;
        id v24 = v77;
        v49 = v82;
        v57 = v60;
        goto LABEL_23;
      }
      uint64_t v62 = [v74 presentationLayer];

      uint64_t v63 = [v60 presentationLayer];

      v64 = (void *)v62;
      v57 = (void *)v63;
      id v24 = v77;
    }
    else
    {
      v64 = v56;
      id v24 = v77;
    }
    v49 = v82;
LABEL_23:
    v75 = v64;
    [v49 convertPoint:v12 toLayer:v14];
    v50 = v81;
    objc_msgSend(v81, "convertPoint:fromLayer:", v57);
    double v21 = v65;
    double v23 = v66;

    v48 = v73;
    goto LABEL_24;
  }
  v37 = (void *)v36;
  v38 = [v35 screen];
  v39 = [v38 fixedCoordinateSpace];
  objc_msgSend(v39, "convertPoint:fromCoordinateSpace:", v77, v12, v14);
  double v41 = v40;
  double v43 = v42;

  v44 = [v37 screen];
  v45 = [v44 fixedCoordinateSpace];
  objc_msgSend(v83, "convertPoint:fromCoordinateSpace:", v45, v41, v43);
  double v21 = v46;
  double v23 = v47;

  id v24 = v77;
  v48 = v37;
  v50 = v81;
  v49 = v82;
LABEL_24:

  v15 = v80;
LABEL_25:

  v67 = [v5 target];
  v68 = v67;
  if (v67)
  {
    [v67 transform];
  }
  else
  {
    long long v90 = 0u;
    long long v91 = 0u;
    long long v89 = 0u;
  }
  long long v86 = v89;
  long long v87 = v90;
  long long v88 = v91;

  v69 = [v5 view];
  [v69 setCollapsedShadowStyle:0];
  [v69 setExpandedShadowStyle:1];
  objc_msgSend(v69, "setBounds:", 0.0, 0.0, v8, v10);
  -[UIView _setCenter3D:](v69, v21, v23, 0.0);
  v85[0] = v86;
  v85[1] = v87;
  v85[2] = v88;
  [v69 setTransform:v85];
  v70 = [*(id *)(a1 + 32) containerView];
  [v70 insertSubview:v69 belowSubview:*(void *)(a1 + 40)];

  [v69 setNeedsLayout];
  [v69 layoutIfNeeded];
  v71 = *(void **)(a1 + 32);
  v72 = [v69 collapsedPreview];
  [v71 _installGhostPortalForPreview:v72];
}

uint64_t __19___UIFlocker_flock__block_invoke(void *a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __19___UIFlocker_flock__block_invoke_2;
  v3[3] = &unk_1E52DD178;
  v3[4] = a1[4];
  v3[5] = a1[5];
  v3[6] = a1[6];
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void __19___UIFlocker_flock__block_invoke_2(uint64_t a1)
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _primaryPlatterView];
  [v2 setExpandedShadowIntensity:*(double *)(a1 + 40)];
  [v2 setExpanded:1];
  [v2 layoutIfNeeded];
  id v3 = [*(id *)(a1 + 32) containerView];
  [v3 bounds];
  double v81 = v4;
  double v82 = v5;
  double v7 = v6;
  double v84 = v8;
  id v9 = [*(id *)(a1 + 32) containerView];
  [v9 safeAreaInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [v9 traitCollection];
  uint64_t v19 = [v18 verticalSizeClass];

  if (v19 == 1)
  {
    double v20 = v11;
  }
  else
  {
    double v17 = v17 + 0.0;
    double v15 = v15 + 20.0;
    double v13 = v13 + 0.0;
    double v20 = v11 + 20.0;
  }
  id v21 = v9;
  double v22 = [v21 traitCollection];
  uint64_t v23 = [v22 userInterfaceIdiom];

  id v24 = _UIContextMenuGetPlatformMetrics(v23);
  +[UIViewController _horizontalContentMarginForView:v21];
  double v26 = v25;
  uint64_t v27 = [v24 contentSpacingForContainer];
  uint64_t v28 = (void *)v27;
  if (v27) {
    double v26 = (*(double (**)(uint64_t, id))(v27 + 16))(v27, v21);
  }

  double v29 = fmax(v20, 20.0);
  double v30 = fmax(v13, v26);

  double v31 = v82 - (v30 + fmax(v17, v26));
  double v32 = v84 - (fmax(v15, 20.0) + v29);

  v33 = [v2 traitCollection];
  uint64_t v34 = [v33 userInterfaceIdiom];

  LODWORD(v33) = [*(id *)(a1 + 32) settings] & 1;
  [v2 bounds];
  double v85 = v81 + v30;
  double v35 = v7 + v29;
  double v36 = v7 + v29;
  double v37 = v31;
  double v38 = v32;
  _randomPlatterTransform((uint64_t)v99, 0, (int)v33, v34, v39, v40, v41, v42, v85, v36, v31, v32);
  v98[0] = v99[0];
  v98[1] = v99[1];
  v98[2] = v99[2];
  [v2 setTransform:v98];
  double v43 = [v2 layer];
  [v43 zPosition];
  double v45 = v44;

  unint64_t v46 = [*(id *)(a1 + 32) itemCount];
  unsigned int v47 = 5;
  if (v46 < 5) {
    unsigned int v47 = v46;
  }
  double v48 = (double)(v47 >> 1) * 3.0;
  if (v45 > 0.0)
  {
    v49 = [v2 layer];
    [v49 setZPosition:v45 + v48];
  }
  v50 = [*(id *)(a1 + 32) secondaryPlatterViews];
  uint64_t v51 = [v50 count];

  if (v51)
  {
    unint64_t v52 = 0;
    int v53 = 0;
    double v83 = v45 - v48;
    do
    {
      double v54 = [*(id *)(a1 + 32) secondaryPlatterViews];
      double v55 = [v54 objectAtIndexedSubscript:v52];
      v56 = [v55 view];

      [v56 setExpandedShadowIntensity:*(double *)(a1 + 40)];
      [v56 setExpanded:1];
      [v2 center];
      objc_msgSend(v56, "setCenter:");
      [v56 bounds];
      CGFloat v58 = v57;
      CGFloat v60 = v59;
      CGFloat v62 = v61;
      CGFloat v64 = v63;
      double v65 = [v56 traitCollection];
      _randomPlatterTransform((uint64_t)v97, 1, 1, [v65 userInterfaceIdiom], v58, v60, v62, v64, v85, v35, v37, v38);
      v96[0] = v97[0];
      v96[1] = v97[1];
      v96[2] = v97[2];
      [v56 setTransform:v96];

      unint64_t v66 = *(void *)(a1 + 48);
      if (v66 < 6 || v52 < 3 || v66 - 2 <= v52)
      {
        [v56 layoutIfNeeded];
        if (v45 > 0.0)
        {
          v68 = [v56 layer];
          [v68 setZPosition:v83 + (double)v53 * 3.0];
        }
        ++v53;
      }
      else
      {
        [v56 setAlpha:0.0];
        if (v45 > 0.0)
        {
          v67 = [v56 layer];
          [v67 setZPosition:v45];
        }
      }

      ++v52;
      v69 = [*(id *)(a1 + 32) secondaryPlatterViews];
      unint64_t v70 = [v69 count];
    }
    while (v70 > v52);
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v71 = [*(id *)(a1 + 32) ghostPortals];
  uint64_t v72 = [v71 countByEnumeratingWithState:&v92 objects:v100 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v73; ++i)
      {
        if (*(void *)v93 != v74) {
          objc_enumerationMutation(v71);
        }
        [*(id *)(*((void *)&v92 + 1) + 8 * i) setAlpha:0.5];
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v92 objects:v100 count:16];
    }
    while (v73);
  }

  id v76 = [*(id *)(a1 + 32) badge];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __19___UIFlocker_flock__block_invoke_3;
  v87[3] = &unk_1E52DC3F8;
  uint64_t v77 = *(void *)(a1 + 32);
  id v88 = v76;
  uint64_t v89 = v77;
  BOOL v91 = v45 > 0.0;
  id v90 = v2;
  id v78 = v2;
  id v79 = v76;
  +[UIView performWithoutAnimation:v87];
  long long v80 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v86[0] = *MEMORY[0x1E4F1DAB8];
  v86[1] = v80;
  v86[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v79 setTransform:v86];
  [v79 setAlpha:1.0];
}

void __19___UIFlocker_flock__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 40) _badgeCenter];
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = [*(id *)(a1 + 48) layer];
    [v2 zPosition];
    double v4 = v3 + 3.0;
    double v5 = [*(id *)(a1 + 32) layer];
    [v5 setZPosition:v4];
  }
  double v6 = [*(id *)(a1 + 48) shadowSettings];

  if (v6)
  {
    double v7 = [*(id *)(a1 + 48) layer];
    uint64_t v8 = [v7 shadowColor];
    id v9 = [*(id *)(a1 + 32) layer];
    [v9 setShadowColor:v8];

    double v10 = [*(id *)(a1 + 48) layer];
    [v10 shadowOffset];
    double v12 = v11;
    double v14 = v13;
    double v15 = [*(id *)(a1 + 32) layer];
    objc_msgSend(v15, "setShadowOffset:", v12, v14);

    double v16 = [*(id *)(a1 + 48) layer];
    [v16 shadowRadius];
    double v18 = v17;
    uint64_t v19 = [*(id *)(a1 + 32) layer];
    [v19 setShadowRadius:v18];

    id v27 = [*(id *)(a1 + 48) layer];
    [v27 shadowOpacity];
    LODWORD(v18) = v20;
    id v21 = [*(id *)(a1 + 32) layer];
    LODWORD(v22) = LODWORD(v18);
    [v21 setShadowOpacity:v22];
  }
  else
  {
    uint64_t v23 = [*(id *)(a1 + 32) layer];
    objc_msgSend(v23, "setShadowOffset:", 0.0, 1.0);

    id v24 = [*(id *)(a1 + 32) layer];
    [v24 setShadowRadius:2.0];

    double v25 = [*(id *)(a1 + 32) layer];
    LODWORD(v26) = 1050253722;
    id v27 = v25;
    [v25 setShadowOpacity:v26];
  }
}

void __37___UIFlocker_unflockToDrag_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  double v5 = [v13 view];
  double v6 = [*(id *)(a1 + 32) unflockPreviewProvider];
  ((void (**)(void, id, uint64_t))v6)[2](v6, v13, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    uint64_t v8 = 2 * *(unsigned __int8 *)(a1 + 48);
  }
  else
  {
    id v7 = v13;
    uint64_t v8 = 1;
  }
  id v9 = [v5 collapsedPreview];
  double v10 = [v9 view];
  double v11 = [v10 _getGhostPortal];
  double v12 = +[_UIUnflockItemAnimation animationWithPlatterView:v5 destination:v7 positionReferenceView:v11 type:v8];

  [*(id *)(a1 + 40) addObject:v12];
}

void __37___UIFlocker_unflockToDrag_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _primaryPlatterView];
  [v2 didTearOffForDrag];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = objc_msgSend(*(id *)(a1 + 32), "secondaryPlatterViews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) view];
        [v8 didTearOffForDrag];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id v9 = [*(id *)(a1 + 32) badge];
  [v9 setHidden:1];
}

void __37___UIFlocker_unflockToDrag_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) makeObjectsPerformSelector:sel_play];
  CGAffineTransformMakeScale(&v5, 0.0, 0.0);
  v2 = [*(id *)(a1 + 40) badge];
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];

  double v3 = [*(id *)(a1 + 40) badge];
  [v3 setAlpha:0.0];
}

uint64_t __37___UIFlocker_unflockToDrag_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) makeObjectsPerformSelector:sel_removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  return [v2 makeObjectsPerformSelector:sel_complete];
}

uint64_t __37___UIFlocker_unflockToDrag_animated___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __37___UIFlocker_unflockToDrag_animated___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) complete];
}

@end