@interface PULayoutAnimationsHelper
+ (double)stackedTransitionAnimationPreferredDurationUsingSpringAnimations:(BOOL)a3;
+ (double)zoomTransitionAnimationPreferredDurationWhenZoomingIn:(BOOL)a3;
+ (id)stackedTransitionAnimationsForReusableView:(id)a3 toLayoutAttributes:(id)a4 shouldUseSpringAnimations:(BOOL)a5;
- (BOOL)shouldAnimateTemporaryImageView;
- (PULayoutAnimationsHelper)initWithSectionedGridLayout:(id)a3;
- (PUSectionedGridLayout)layout;
- (id)_adjustAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5;
- (id)_adjustCellAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5;
- (id)_adjustDecorationViewAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5;
- (id)_adjustRenderedStripAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5;
- (id)_adjustSectionHeaderAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5;
- (id)_createDefaultZoomingInAnimationForKeyPath:(id)a3 ofReusableView:(id)a4 toLayoutAttributes:(id)a5;
- (id)_createDefaultZoomingOutAnimationForKeyPath:(id)a3 ofReusableView:(id)a4 toLayoutAttributes:(id)a5;
- (id)_defaultAnimationForKeyPath:(id)a3 ofReusableView:(id)a4 toLayoutAttributes:(id)a5;
- (id)animationsForReusableView:(id)a3 toLayoutAttributes:(id)a4;
- (void)_applyDefaultLayoutAttributes:(id)a3 toView:(id)a4;
- (void)_configureAnimationsForReusableView:(id)a3 toLayoutAttributes:(id)a4 withCompletionBlock:(id)a5;
- (void)didFinishLayoutTransitionAnimations:(BOOL)a3 transitionIsAppearing:(BOOL)a4;
- (void)setShouldAnimateTemporaryImageView:(BOOL)a3;
@end

@implementation PULayoutAnimationsHelper

- (void).cxx_destruct
{
}

- (void)setShouldAnimateTemporaryImageView:(BOOL)a3
{
  self->_shouldAnimateTemporaryImageView = a3;
}

- (BOOL)shouldAnimateTemporaryImageView
{
  return self->_shouldAnimateTemporaryImageView;
}

- (PUSectionedGridLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PUSectionedGridLayout *)WeakRetained;
}

- (void)_applyDefaultLayoutAttributes:(id)a3 toView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4FB1EB0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PULayoutAnimationsHelper__applyDefaultLayoutAttributes_toView___block_invoke;
  v10[3] = &unk_1E5F2ECC8;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 performWithoutAnimation:v10];
}

void __65__PULayoutAnimationsHelper__applyDefaultLayoutAttributes_toView___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) center];
  objc_msgSend(v2, "setCenter:");
  [*(id *)(a1 + 32) bounds];
  double v4 = v3;
  double v6 = v5;
  [*(id *)(a1 + 40) size];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v4, v6, v7, v8);
  id v9 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) alpha];
  objc_msgSend(v9, "setAlpha:");
  v10 = [*(id *)(a1 + 32) layer];
  id v11 = *(void **)(a1 + 40);
  if (v11) {
    [v11 transform3D];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  [v10 setTransform:v12];
}

- (void)_configureAnimationsForReusableView:(id)a3 toLayoutAttributes:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  id v11 = [v8 layer];
  [v9 center];
  double v13 = v12;
  double v15 = v14;
  [v8 center];
  BOOL v18 = v15 != v17 || v13 != v16;
  if (v18)
  {
    v19 = [(PULayoutAnimationsHelper *)self _defaultAnimationForKeyPath:@"position" ofReusableView:v8 toLayoutAttributes:v9];
    v20 = [(PULayoutAnimationsHelper *)self _adjustAnimation:v19 forReusableView:v8 toLayoutAttributes:v9];

    id v21 = objc_alloc_init(MEMORY[0x1E4F8A5D0]);
    [v21 setCompletion:v10];
    [v20 setDelegate:v21];

    [v11 addAnimation:v20 forKey:@"positionAnimation"];
  }
  [v9 size];
  double v23 = v22;
  double v25 = v24;
  [v8 bounds];
  if (v23 != v27 || v25 != v26)
  {
    v28 = [(PULayoutAnimationsHelper *)self _defaultAnimationForKeyPath:@"bounds" ofReusableView:v8 toLayoutAttributes:v9];
    v29 = [(PULayoutAnimationsHelper *)self _adjustAnimation:v28 forReusableView:v8 toLayoutAttributes:v9];

    if (!v18)
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F8A5D0]);
      [v30 setCompletion:v10];
      [v29 setDelegate:v30];
    }
    [v11 addAnimation:v29 forKey:@"boundsAnimation"];

    LOBYTE(v18) = 1;
  }
  [v9 alpha];
  double v32 = v31;
  [v8 alpha];
  if (v32 != v33)
  {
    v34 = [(PULayoutAnimationsHelper *)self _defaultAnimationForKeyPath:@"opacity" ofReusableView:v8 toLayoutAttributes:v9];
    v35 = [(PULayoutAnimationsHelper *)self _adjustAnimation:v34 forReusableView:v8 toLayoutAttributes:v9];

    if (!v18)
    {
      id v36 = objc_alloc_init(MEMORY[0x1E4F8A5D0]);
      [v36 setCompletion:v10];
      [v35 setDelegate:v36];
    }
    [v11 addAnimation:v35 forKey:@"opacityAnimation"];

    LOBYTE(v18) = 1;
  }
  if (v9) {
    [v9 transform3D];
  }
  else {
    memset(&a, 0, sizeof(a));
  }
  v37 = [v8 layer];
  v38 = v37;
  if (v37) {
    [v37 transform];
  }
  else {
    memset(&b, 0, sizeof(b));
  }
  BOOL v39 = CATransform3DEqualToTransform(&a, &b);

  if (!v39)
  {
    v40 = [(PULayoutAnimationsHelper *)self _defaultAnimationForKeyPath:@"transform" ofReusableView:v8 toLayoutAttributes:v9];
    v41 = [(PULayoutAnimationsHelper *)self _adjustAnimation:v40 forReusableView:v8 toLayoutAttributes:v9];

    if (!v18)
    {
      id v42 = objc_alloc_init(MEMORY[0x1E4F8A5D0]);
      [v42 setCompletion:v10];
      [v41 setDelegate:v42];
    }
    [v11 addAnimation:v41 forKey:@"transformAnimation"];

    LOBYTE(v18) = 1;
  }
  if ([(PULayoutAnimationsHelper *)self shouldAnimateTemporaryImageView])
  {
    if (![v9 representedElementCategory])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v120 = v11;
        id v43 = v8;
        v44 = [v43 temporaryPhotoContentView];
        v45 = [v43 transitionFillerView];
        v118 = [v44 layer];
        v113 = v45;
        v110 = [v45 layer];
        v46 = [v43 photoContentView];
        v47 = [v46 contentHelper];
        v48 = [v47 badgeContainerView];
        v112 = [v48 layer];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
        int v50 = [WeakRetained transitionZoomingOut];

        v116 = v44;
        int v115 = v50;
        if (v44)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ([v9 exists] & 1) != 0 || !v50)
          {
            v51 = [(PULayoutAnimationsHelper *)self _defaultAnimationForKeyPath:@"opacity" ofReusableView:v43 toLayoutAttributes:v9];
            v52 = NSNumber;
            v53 = v118;
            v54 = [v118 presentationLayer];
            if (v54)
            {
              [v118 presentationLayer];
              v56 = id v55 = v43;
              [v56 opacity];
              v57 = objc_msgSend(v52, "numberWithFloat:");

              id v43 = v55;
              v53 = v118;
            }
            else
            {
              [v118 opacity];
              v57 = objc_msgSend(v52, "numberWithFloat:");
            }

            [v51 setFromValue:v57];
            [v51 setRemovedOnCompletion:0];
            [v53 addAnimation:v51 forKey:@"opacity"];
            v58 = (void *)MEMORY[0x1E4FB1EB0];
            v133[0] = MEMORY[0x1E4F143A8];
            v133[1] = 3221225472;
            v133[2] = __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke;
            v133[3] = &unk_1E5F2ED10;
            id v134 = v116;
            [v58 performWithoutAnimation:v133];

            int v50 = v115;
          }
        }
        if (v50) {
          double v59 = 0.275;
        }
        else {
          double v59 = 0.055;
        }
        UIAnimationDragCoefficient();
        float v61 = v60;
        UIAnimationDragCoefficient();
        float v63 = v62;
        [v43 fillerEdgeInsets];
        CGFloat v65 = fabs(v64);
        [v43 bounds];
        v114 = v43;
        if (v65 >= CGRectGetWidth(v137))
        {
          if (v50)
          {
            +[PULayoutAnimationsHelper zoomTransitionAnimationPreferredDurationWhenZoomingIn:0];
            double v69 = v68;
            UIAnimationDragCoefficient();
            double v71 = v70;
          }
          else
          {
            UIAnimationDragCoefficient();
            double v69 = v72;
            double v71 = 0.18;
          }
          double v67 = v69 * v71;
          double v66 = 0.0;
        }
        else
        {
          double v66 = v59 * v61;
          double v67 = v63 * 0.1;
        }
        v73 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
        v74 = NSNumber;
        [v110 opacity];
        v75 = objc_msgSend(v74, "numberWithFloat:");
        [v73 setFromValue:v75];

        [v73 setDuration:v67];
        [v110 convertTime:0 fromLayer:CACurrentMediaTime()];
        [v73 setBeginTime:v66 + v76];
        uint64_t v109 = *MEMORY[0x1E4F3A480];
        v77 = objc_msgSend(MEMORY[0x1E4F39C10], "functionWithName:");
        [v73 setTimingFunction:v77];

        uint64_t v78 = *MEMORY[0x1E4F39FA0];
        [v73 setFillMode:*MEMORY[0x1E4F39FA0]];
        [v73 setRemovedOnCompletion:0];
        [v110 addAnimation:v73 forKey:@"opacity"];
        v79 = (void *)MEMORY[0x1E4FB1EB0];
        v130[0] = MEMORY[0x1E4F143A8];
        v130[1] = 3221225472;
        v130[2] = __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_2;
        v130[3] = &unk_1E5F2E120;
        id v111 = v110;
        id v131 = v111;
        char v132 = v115;
        [v79 performWithoutAnimation:v130];
        v80 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
        v81 = NSNumber;
        [v112 opacity];
        v82 = objc_msgSend(v81, "numberWithFloat:");
        [v80 setFromValue:v82];

        if (v115) {
          double v83 = 0.24;
        }
        else {
          double v83 = 0.18;
        }
        UIAnimationDragCoefficient();
        [v80 setDuration:v83 * v84];
        v85 = [MEMORY[0x1E4F39C10] functionWithName:v109];
        [v80 setTimingFunction:v85];

        [v80 setFillMode:v78];
        [v80 setRemovedOnCompletion:0];
        [v112 addAnimation:v80 forKey:@"opacity"];
        v86 = (void *)MEMORY[0x1E4FB1EB0];
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_3;
        v127[3] = &unk_1E5F2E120;
        id v128 = v112;
        char v129 = v115;
        id v87 = v112;
        [v86 performWithoutAnimation:v127];

        id v11 = v120;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v88 = v8;
    v89 = [v88 itemIndexPaths];
    uint64_t v90 = [v89 count];
    uint64_t v91 = [v88 numberOfColumns];

    if (v90 == v91) {
      uint64_t v92 = 2;
    }
    else {
      uint64_t v92 = 1;
    }
    [v88 setContentExtenderType:v92];
    if ([v88 extendsToTop])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v93 = [v88 topContentView];
        v119 = [v93 layer];

        +[PULayoutAnimationsHelper zoomTransitionAnimationPreferredDurationWhenZoomingIn:0];
        double v95 = v94;
        UIAnimationDragCoefficient();
        double v97 = v95 * v96;
        v98 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
        [v98 setFromValue:&unk_1F078BE70];
        [v98 setDuration:v97];
        v122 = v10;
        uint64_t v99 = *MEMORY[0x1E4F3A480];
        v100 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
        [v98 setTimingFunction:v100];

        uint64_t v101 = *MEMORY[0x1E4F39FA0];
        [v98 setFillMode:*MEMORY[0x1E4F39FA0]];
        [v98 setRemovedOnCompletion:1];
        [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
        v102 = v121 = v11;
        v103 = (void *)MEMORY[0x1E4F29238];
        CATransform3DMakeScale(&v126, 1.0, 0.0, 1.0);
        v117 = [v103 valueWithCATransform3D:&v126];
        [v102 setFromValue:v117];
        [v102 setDuration:v97];
        uint64_t v104 = v99;
        v10 = v122;
        v105 = [MEMORY[0x1E4F39C10] functionWithName:v104];
        [v102 setTimingFunction:v105];

        [v102 setFillMode:v101];
        [v102 setRemovedOnCompletion:1];
        [v119 addAnimation:v98 forKey:@"opacity"];
        [v119 addAnimation:v102 forKey:@"transform"];
        v106 = (void *)MEMORY[0x1E4FB1EB0];
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_37;
        v123[3] = &unk_1E5F2ECC8;
        id v124 = v88;
        id v125 = v119;
        id v107 = v119;
        [v106 performWithoutAnimation:v123];

        id v11 = v121;
      }
    }
  }
  [(PULayoutAnimationsHelper *)self _applyDefaultLayoutAttributes:v9 toView:v8];
  if (v10) {
    char v108 = v18;
  }
  else {
    char v108 = 1;
  }
  if ((v108 & 1) == 0) {
    v10[2](v10, 1);
  }
}

uint64_t __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) alpha];
  double v3 = 1.0 - v2;
  double v4 = *(void **)(a1 + 32);
  return [v4 setAlpha:v3];
}

uint64_t __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    *(float *)&double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setOpacity:v1];
}

uint64_t __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    *(float *)&double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setOpacity:v1];
}

uint64_t __103__PULayoutAnimationsHelper__configureAnimationsForReusableView_toLayoutAttributes_withCompletionBlock___block_invoke_37(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) topContentView];
  [v2 setAlpha:0.699999988];

  memset(&v6, 0, sizeof(v6));
  CATransform3DMakeScale(&v6, 1.0, -1.0, 1.0);
  double v3 = *(void **)(a1 + 40);
  CATransform3D v5 = v6;
  return [v3 setTransform:&v5];
}

- (id)_adjustDecorationViewAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  return a3;
}

- (id)_adjustRenderedStripAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 keyPath];
  int v12 = [v11 isEqualToString:@"opacity"];

  double v13 = [(PULayoutAnimationsHelper *)self layout];
  int v14 = [v13 transitionIsAppearing];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (char v15 = [v10 exists], ((v14 | v12 ^ 1) & 1) != 0)
    || (v15 & 1) != 0)
  {
    id v21 = v8;
  }
  else
  {
    double v16 = [v9 layer];
    UIAnimationDragCoefficient();
    double v18 = v17 * 0.18;
    UIAnimationDragCoefficient();
    double v20 = v19 * 0.0;
    id v21 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    double v22 = [v16 presentationLayer];
    if (v22)
    {
      double v23 = [v16 presentationLayer];
      double v24 = [v23 valueForKeyPath:@"opacity"];
    }
    else
    {
      double v24 = [v16 valueForKeyPath:@"opacity"];
    }

    [v21 setFromValue:v24];
    [v21 setDuration:v18];
    [v16 convertTime:0 fromLayer:CACurrentMediaTime()];
    [v21 setBeginTime:v20 + v25];
    LODWORD(v26) = 1048165965;
    LODWORD(v27) = 1002897197;
    LODWORD(v28) = 1062925553;
    LODWORD(v29) = *(_DWORD *)"R\n:?";
    id v30 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v26 :v27 :v28 :v29];
    [v21 setTimingFunction:v30];

    [v21 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v21 setRemovedOnCompletion:0];
  }
  return v21;
}

- (id)_adjustSectionHeaderAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 indexPath];
  uint64_t v12 = [v11 section];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v13 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
    char v15 = [WeakRetained transitionLayout];

    uint64_t v16 = [v15 visualSectionForRealSection:v12];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v17 = v16, [v15 mainRealSectionForVisualSection:v16] != v12))
    {
      BOOL v13 = 0;
    }
    else
    {
      [v9 frame];
      [v15 frameForSectionHeaderAtVisualSection:v17];
      UIDistanceBetweenPoints();
      BOOL v13 = v18 < 3.0;
    }
  }
  float v19 = [(PULayoutAnimationsHelper *)self layout];
  int v20 = [v19 transitionIsAppearing];

  id v21 = [v8 keyPath];
  int v22 = [v21 isEqualToString:@"opacity"];

  if (v22 && ([v10 floating] & 1) == 0)
  {
    double v23 = [v9 layer];
    if ((v20 ^ 1 | v13))
    {
      if (v13)
      {
LABEL_21:

        goto LABEL_22;
      }
      double v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      double v25 = [v23 presentationLayer];
      if (v25)
      {
        double v26 = [v23 presentationLayer];
        double v27 = [v26 valueForKeyPath:@"opacity"];
      }
      else
      {
        double v27 = [v23 valueForKeyPath:@"opacity"];
      }

      [v24 setFromValue:v27];
      UIAnimationDragCoefficient();
      [v24 setDuration:v36 * 0.18];
    }
    else
    {
      double v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      double v28 = [v23 presentationLayer];
      if (v28)
      {
        double v29 = [v23 presentationLayer];
        double v27 = [v29 valueForKeyPath:@"opacity"];
      }
      else
      {
        double v27 = [v23 valueForKeyPath:@"opacity"];
      }

      [v24 setFromValue:v27];
      UIAnimationDragCoefficient();
      [v24 setDuration:v30 * 0.18];
      [v23 convertTime:0 fromLayer:CACurrentMediaTime()];
      [v24 setBeginTime:v31 + 0.2];
    }
    LODWORD(v32) = 1048165965;
    LODWORD(v33) = 1002897197;
    LODWORD(v34) = 1062925553;
    LODWORD(v35) = *(_DWORD *)"R\n:?";
    v37 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v32 :v33 :v34 :v35];
    [v24 setTimingFunction:v37];

    [v24 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v24 setRemovedOnCompletion:0];

    id v8 = v24;
    goto LABEL_21;
  }
LABEL_22:

  return v8;
}

- (id)_adjustCellAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 keyPath];
  int v12 = [v11 isEqualToString:@"opacity"];

  BOOL v13 = [(PULayoutAnimationsHelper *)self layout];
  int v14 = [v13 transitionIsAppearing];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (char v15 = [v10 exists], v12) && (v15 & 1) == 0)
  {
    uint64_t v16 = [v9 layer];
    UIAnimationDragCoefficient();
    double v18 = v17;
    double v19 = 0.18;
    if (v14) {
      double v19 = 0.24;
    }
    double v20 = v19 * v18;
    UIAnimationDragCoefficient();
    double v22 = v21 * 0.0;
    double v23 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    double v24 = [v16 presentationLayer];
    if (v24)
    {
      double v25 = [v16 presentationLayer];
      double v26 = [v25 valueForKeyPath:@"opacity"];
    }
    else
    {
      double v26 = [v16 valueForKeyPath:@"opacity"];
    }

    [v23 setFromValue:v26];
    [v23 setDuration:v20];
    [v16 convertTime:0 fromLayer:CACurrentMediaTime()];
    [v23 setBeginTime:v22 + v27];
    LODWORD(v28) = 1048165965;
    LODWORD(v29) = 1002897197;
    LODWORD(v30) = 1062925553;
    LODWORD(v31) = *(_DWORD *)"R\n:?";
    double v32 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v28 :v29 :v30 :v31];
    [v23 setTimingFunction:v32];

    [v23 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v23 setRemovedOnCompletion:0];
  }
  else
  {
    double v23 = v8;
  }

  return v23;
}

- (id)_adjustAnimation:(id)a3 forReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 representedElementCategory];
  int v12 = [v10 representedElementKind];
  if (v11 == 2)
  {
    uint64_t v13 = [(PULayoutAnimationsHelper *)self _adjustDecorationViewAnimation:v8 forReusableView:v9 toLayoutAttributes:v10];
  }
  else if (v11 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
    char v15 = [WeakRetained sectionHeaderElementKind];
    int v16 = [v12 isEqualToString:v15];

    if (v16)
    {
      uint64_t v13 = [(PULayoutAnimationsHelper *)self _adjustSectionHeaderAnimation:v8 forReusableView:v9 toLayoutAttributes:v10];
    }
    else
    {
      id v17 = objc_loadWeakRetained((id *)&self->_layout);
      double v18 = [v17 renderedStripsElementKind];
      int v19 = [v12 isEqualToString:v18];

      if (!v19) {
        goto LABEL_11;
      }
      uint64_t v13 = [(PULayoutAnimationsHelper *)self _adjustRenderedStripAnimation:v8 forReusableView:v9 toLayoutAttributes:v10];
    }
  }
  else
  {
    if (v11) {
      goto LABEL_11;
    }
    uint64_t v13 = [(PULayoutAnimationsHelper *)self _adjustCellAnimation:v8 forReusableView:v9 toLayoutAttributes:v10];
  }
  double v20 = (void *)v13;

  id v8 = v20;
LABEL_11:

  return v8;
}

- (id)_defaultAnimationForKeyPath:(id)a3 ofReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  p_layout = &self->_layout;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_layout);
  int v13 = [WeakRetained transitionZoomingOut];

  if (v13) {
    [(PULayoutAnimationsHelper *)self _createDefaultZoomingOutAnimationForKeyPath:v11 ofReusableView:v10 toLayoutAttributes:v9];
  }
  else {
  int v14 = [(PULayoutAnimationsHelper *)self _createDefaultZoomingInAnimationForKeyPath:v11 ofReusableView:v10 toLayoutAttributes:v9];
  }

  return v14;
}

- (id)_createDefaultZoomingInAnimationForKeyPath:(id)a3 ofReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v6 = a3;
  double v7 = [a4 layer];
  UIAnimationDragCoefficient();
  float v9 = v8;
  id v10 = [v7 presentationLayer];
  if (v10)
  {
    id v11 = [v7 presentationLayer];
    int v12 = [v11 valueForKeyPath:v6];
  }
  else
  {
    int v12 = [v7 valueForKeyPath:v6];
  }

  int v13 = [MEMORY[0x1E4F39C90] animationWithKeyPath:v6];
  [v13 setFromValue:v12];
  +[PULayoutAnimationsHelper zoomTransitionAnimationPreferredDurationWhenZoomingIn:1];
  double v15 = v14;
  UIAnimationDragCoefficient();
  [v13 setDuration:v15 * v16];
  [v13 setMass:1.0];
  [v13 setStiffness:250.0 / (float)(v9 * v9)];
  double v17 = v9;
  [v13 setDamping:22.0 / v17];
  [v13 setVelocity:0.0 / v17];
  [v13 setFillMode:*MEMORY[0x1E4F39FA0]];

  return v13;
}

- (id)_createDefaultZoomingOutAnimationForKeyPath:(id)a3 ofReusableView:(id)a4 toLayoutAttributes:(id)a5
{
  id v6 = a3;
  double v7 = [a4 layer];
  UIAnimationDragCoefficient();
  float v9 = v8;
  id v10 = [v7 presentationLayer];
  if (v10)
  {
    id v11 = [v7 presentationLayer];
    int v12 = [v11 valueForKeyPath:v6];
  }
  else
  {
    int v12 = [v7 valueForKeyPath:v6];
  }

  int v13 = [MEMORY[0x1E4F39C90] animationWithKeyPath:v6];
  [v13 setFromValue:v12];
  [v13 setMass:0.899999976];
  [v13 setStiffness:(float)(300.0 / (float)(v9 * v9))];
  [v13 setDamping:(float)(400.0 / v9)];
  [v13 setVelocity:(float)(0.0 / v9)];
  +[PULayoutAnimationsHelper zoomTransitionAnimationPreferredDurationWhenZoomingIn:0];
  double v15 = v14;
  UIAnimationDragCoefficient();
  [v13 setDuration:v15 * v16];
  LODWORD(v17) = 1048165965;
  LODWORD(v18) = 1002897197;
  LODWORD(v19) = 1062925553;
  LODWORD(v20) = *(_DWORD *)"R\n:?";
  float v21 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v17 :v18 :v19 :v20];
  [v13 setTimingFunction:v21];

  [v13 setFillMode:*MEMORY[0x1E4F39FA0]];
  return v13;
}

- (void)didFinishLayoutTransitionAnimations:(BOOL)a3 transitionIsAppearing:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
    CATransform3D v5 = objc_msgSend(WeakRetained, "collectionView", 0);
    id v6 = [v5 subviews];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v12 = [v11 layer];
            [v12 removeAllAnimations];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v13 = [v11 transitionFillerView];
              double v14 = [v13 layer];
              [v14 removeAllAnimations];
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v11 setExtendsToTop:0];
              [v11 setContentExtenderType:0];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
}

- (id)animationsForReusableView:(id)a3 toLayoutAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PULayoutAnimationsHelper_animationsForReusableView_toLayoutAttributes___block_invoke;
  aBlock[3] = &unk_1E5F270B8;
  aBlock[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = _Block_copy(v10);

  return v11;
}

void __73__PULayoutAnimationsHelper_animationsForReusableView_toLayoutAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PULayoutAnimationsHelper_animationsForReusableView_toLayoutAttributes___block_invoke_2;
  aBlock[3] = &unk_1E5F2D990;
  id v7 = v3;
  id v4 = v3;
  CATransform3D v5 = _Block_copy(aBlock);
  [*(id *)(a1 + 32) _configureAnimationsForReusableView:*(void *)(a1 + 40) toLayoutAttributes:*(void *)(a1 + 48) withCompletionBlock:v5];
}

uint64_t __73__PULayoutAnimationsHelper_animationsForReusableView_toLayoutAttributes___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (PULayoutAnimationsHelper)initWithSectionedGridLayout:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PULayoutAnimationsHelper;
  CATransform3D v5 = [(PULayoutAnimationsHelper *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_layout, v4);
    id v7 = v6;
  }

  return v6;
}

+ (double)stackedTransitionAnimationPreferredDurationUsingSpringAnimations:(BOOL)a3
{
  if (!a3) {
    return 0.3;
  }
  objc_msgSend(MEMORY[0x1E4FB1EB0], "pu_springOscillationRootAtIndex:forMass:stiffness:damping:initialVelocity:", 2, 1.0, 200.0, 22.0, 0.0);
  return result;
}

+ (id)stackedTransitionAnimationsForReusableView:(id)a3 toLayoutAttributes:(id)a4 shouldUseSpringAnimations:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke;
  aBlock[3] = &unk_1E5F270E0;
  id v15 = v7;
  id v16 = v8;
  BOOL v17 = a5;
  id v9 = v8;
  id v10 = v7;
  id v11 = _Block_copy(aBlock);
  int v12 = _Block_copy(v11);

  return v12;
}

void __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke_2;
  aBlock[3] = &unk_1E5F2D1C0;
  id v18 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  uint64_t v20 = v5;
  uint64_t v21 = v7;
  uint64_t v22 = v9;
  uint64_t v23 = v11;
  int v12 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke_3;
  v15[3] = &unk_1E5F2D990;
  id v13 = v3;
  id v16 = v13;
  id v14 = _Block_copy(v15);
  if (*(unsigned char *)(a1 + 48)) {
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:5 delay:v12 options:v14 mass:0.3 stiffness:0.0 damping:1.0 initialVelocity:200.0 animations:22.0 completion:0.0];
  }
  else {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:5 delay:v12 options:v14 animations:0.3 completion:0.0];
  }
}

void __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) center];
  objc_msgSend(v2, "setCenter:");
  id v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) alpha];
  objc_msgSend(v3, "setAlpha:");
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  [*(id *)(a1 + 40) size];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v4, v5, v6, v7);
  uint64_t v8 = [*(id *)(a1 + 32) layer];
  uint64_t v9 = *(void **)(a1 + 40);
  if (v9) {
    [v9 transform3D];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  [v8 setTransform:v10];
}

uint64_t __116__PULayoutAnimationsHelper_stackedTransitionAnimationsForReusableView_toLayoutAttributes_shouldUseSpringAnimations___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (double)zoomTransitionAnimationPreferredDurationWhenZoomingIn:(BOOL)a3
{
  if (!a3) {
    return 0.6;
  }
  objc_msgSend(MEMORY[0x1E4FB1EB0], "pu_springOscillationRootAtIndex:forMass:stiffness:damping:initialVelocity:", 2, 1.0, 250.0, 22.0, 0.0);
  return result;
}

@end