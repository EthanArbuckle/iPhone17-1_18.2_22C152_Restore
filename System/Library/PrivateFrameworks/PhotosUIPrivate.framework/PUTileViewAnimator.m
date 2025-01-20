@interface PUTileViewAnimator
- (NSMapTable)_synchronizedAnimationGroupsByTransition;
- (PUTileViewAnimator)init;
- (void)_performAnimations:(id)a3 withOptions:(id)a4;
- (void)animateTileController:(id)a3 toLayoutInfo:(id)a4 withOptions:(id)a5 completionHandler:(id)a6;
- (void)prepareTileControllerForAnimation:(id)a3 withInitialLayoutInfo:(id)a4;
- (void)transition:(id)a3 didComplete:(BOOL)a4;
- (void)updateAnimationForTileController:(id)a3 withRepositionedTargetLayoutInfo:(id)a4;
@end

@implementation PUTileViewAnimator

- (void).cxx_destruct
{
}

- (NSMapTable)_synchronizedAnimationGroupsByTransition
{
  return self->__synchronizedAnimationGroupsByTransition;
}

- (void)transition:(id)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUTileViewAnimator;
  [(PUTileAnimator *)&v19 transition:v6 didComplete:v4];
  if (v4)
  {
    v7 = [(PUTileViewAnimator *)self _synchronizedAnimationGroupsByTransition];
    v8 = [v7 objectForKey:v6];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13++), "finishImmediately", (void)v15);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }
  }
  v14 = [(PUTileViewAnimator *)self _synchronizedAnimationGroupsByTransition];
  [v14 removeObjectForKey:v6];
}

- (void)_performAnimations:(id)a3 withOptions:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  v8 = [(PUTileAnimator *)self currentTransition];
  if (v8 && ([v7 isSynchronizedWithTransition] & 1) != 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__PUTileViewAnimator__performAnimations_withOptions___block_invoke;
    v13[3] = &unk_1E5F2EBA0;
    v14 = v6;
    id v9 = +[PUAnimationGroup animationGroupWithAnimations:v13];
    if (v9)
    {
      uint64_t v10 = [(PUTileViewAnimator *)self _synchronizedAnimationGroupsByTransition];
      uint64_t v11 = [v10 objectForKey:v8];

      if (!v11)
      {
        uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v12 = [(PUTileViewAnimator *)self _synchronizedAnimationGroupsByTransition];
        [v12 setObject:v11 forKey:v8];
      }
      [v11 addObject:v9];
    }
  }
  else
  {
    v6[2](v6);
  }
}

uint64_t __53__PUTileViewAnimator__performAnimations_withOptions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateAnimationForTileController:(id)a3 withRepositionedTargetLayoutInfo:(id)a4
{
}

- (void)animateTileController:(id)a3 toLayoutInfo:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2, self, @"PUTileViewAnimator.m", 60, @"Invalid parameter not satisfying: %@", @"[tileController isKindOfClass:[PUTileViewController class]]" object file lineNumber description];
  }
  uint64_t v15 = [v12 kind];
  [v12 duration];
  uint64_t v17 = v16;
  [v12 delay];
  uint64_t v19 = v18;
  v20 = [v12 completionGroup];
  char v21 = [v12 shouldFadeOutSnapshotAfterCompletionGroup];
  v22 = [v14 view];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5F2ECC8;
  id v23 = v14;
  id v123 = v23;
  id v24 = v11;
  id v124 = v24;
  v25 = _Block_copy(aBlock);
  if ([v12 highFrameRateReason]
    && [MEMORY[0x1E4F91238] highFramerateRequiresReasonAndRange])
  {
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_2;
    v119[3] = &unk_1E5F2EA60;
    id v120 = v12;
    id v121 = v25;
    v25 = _Block_copy(v119);
  }
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_4;
  v114[3] = &unk_1E5F2C638;
  id v57 = v20;
  id v115 = v57;
  id v56 = v13;
  id v117 = v56;
  char v118 = v21;
  id v26 = v22;
  id v116 = v26;
  v27 = _Block_copy(v114);
  switch(v15)
  {
    case 1000:
      [v12 springDampingRatio];
      uint64_t v29 = v28;
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_9;
      v102[3] = &unk_1E5F2C688;
      id v30 = v26;
      id v103 = v30;
      uint64_t v104 = v17;
      uint64_t v105 = v19;
      uint64_t v106 = v29;
      uint64_t v107 = 6;
      v31 = _Block_copy(v102);
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_10;
      v95[3] = &unk_1E5F2C6B0;
      id v96 = v30;
      uint64_t v98 = v17;
      uint64_t v99 = v19;
      uint64_t v100 = v29;
      uint64_t v101 = 6;
      id v97 = v25;
      v32 = _Block_copy(v95);

      id v33 = v103;
      break;
    case 1001:
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_11;
      v91[3] = &unk_1E5F2C6D8;
      id v34 = v26;
      id v92 = v34;
      uint64_t v93 = v19;
      uint64_t v94 = 6;
      v31 = _Block_copy(v91);
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_12;
      v86[3] = &unk_1E5F2C700;
      id v87 = v34;
      uint64_t v89 = v19;
      uint64_t v90 = 6;
      id v88 = v25;
      v32 = _Block_copy(v86);

      id v33 = v92;
      break;
    case 1002:
      [v12 springMass];
      double v36 = v35;
      [v12 springStiffness];
      double v38 = v37;
      [v12 springDampingRatio];
      double v40 = v39 + v39;
      PXFloatSqrt();
      double v42 = v40 * v41;
      uint64_t v43 = [v12 springNumberOfOscillations];
      objc_msgSend(MEMORY[0x1E4FB1EB0], "pu_springOscillationRootAtIndex:forMass:stiffness:damping:initialVelocity:", v43 + 1, v36, v38, v42, 0.0);
      uint64_t v45 = v44;
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_13;
      v78[3] = &unk_1E5F2C728;
      id v46 = v26;
      id v79 = v46;
      uint64_t v80 = v45;
      uint64_t v81 = v19;
      uint64_t v82 = 6;
      double v83 = v36;
      double v84 = v38;
      double v85 = v42;
      v31 = _Block_copy(v78);
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_14;
      v69[3] = &unk_1E5F2C750;
      id v70 = v46;
      uint64_t v72 = v45;
      uint64_t v73 = v19;
      uint64_t v74 = 6;
      double v75 = v36;
      double v76 = v38;
      double v77 = v42;
      id v71 = v25;
      v32 = _Block_copy(v69);

      id v33 = v79;
      break;
    case 1003:
      v47 = [v12 customViewAnimatorBlock];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_15;
      v66[3] = &unk_1E5F2C778;
      id v67 = v47;
      id v68 = v25;
      id v33 = v47;
      v32 = _Block_copy(v66);

      goto LABEL_14;
    default:
      if (v15)
      {
        id v33 = [MEMORY[0x1E4F28B00] currentHandler];
        v48 = [NSNumber numberWithInteger:v15];
        [v33 handleFailureInMethod:a2, self, @"PUTileViewAnimator.m", 169, @"unknown animation kind %@", v48 object file lineNumber description];

        v32 = 0;
LABEL_14:
        v31 = 0;
      }
      else
      {
        v108[0] = MEMORY[0x1E4F143A8];
        v108[1] = 3221225472;
        v108[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_8;
        v108[3] = &unk_1E5F2C660;
        id v109 = v26;
        uint64_t v111 = v17;
        uint64_t v112 = v19;
        uint64_t v113 = 6;
        id v110 = v25;
        v32 = _Block_copy(v108);

        v31 = 0;
        id v33 = v109;
      }
      break;
  }

  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_16;
  v59[3] = &unk_1E5F2C7C8;
  id v60 = v12;
  id v61 = v23;
  id v62 = v24;
  id v63 = v27;
  id v64 = v31;
  id v65 = v32;
  id v49 = v12;
  id v50 = v27;
  id v51 = v31;
  id v52 = v23;
  id v53 = v24;
  id v54 = v32;
  [(PUTileViewAnimator *)self _performAnimations:v59 withOptions:v49];
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyLayoutInfo:*(void *)(a1 + 40)];
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  PXFrameRateRangeTypeGetCAFrameRateRange();
  int v4 = v3;
  int v6 = v5;
  int v8 = v7;
  uint64_t v9 = [*(id *)(a1 + 32) highFrameRateReason];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_3;
  v13[3] = &unk_1E5F2EBA0;
  id v14 = *(id *)(a1 + 40);
  LODWORD(v10) = v4;
  LODWORD(v11) = v6;
  LODWORD(v12) = v8;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v9, v13, v10, v11, v12);
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_4(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_5;
    block[3] = &unk_1E5F2C610;
    char v8 = *(unsigned char *)(a1 + 56);
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    dispatch_group_notify(v2, MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      int v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v7 = *(void *)(a1 + 32);
  int v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  objc_msgSend(v3, "pu_animateViews:withDuration:delay:options:animations:completion:", v6, *(void *)(a1 + 64), *(void *)(a1 + 40), v5, *(double *)(a1 + 48), *(double *)(a1 + 56), v7, v8);
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_9(double *a1, _OWORD *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18 = *((void *)a1 + 4);
  double v19 = a1[5];
  double v20 = a1[6];
  uint64_t v21 = *((void *)a1 + 7);
  uint64_t v22 = *((void *)a1 + 8);
  long long v23 = a2[1];
  v25[0] = *a2;
  v25[1] = v23;
  v25[2] = a2[2];
  return objc_msgSend(MEMORY[0x1E4FB1EB0], "pu_animateView:toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:", v18, v25, v22, a3, a4, a5, a6, a7, a8, a9, v19, v20, v21, a15, a16, a17);
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v7 = *(void *)(a1 + 32);
  int v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  objc_msgSend(v3, "pu_animateViews:withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v6, *(void *)(a1 + 72), *(void *)(a1 + 40), v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 0.0, v7, v8);
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_11(double *a1, _OWORD *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18 = *((void *)a1 + 4);
  double v19 = a1[5];
  uint64_t v20 = *((void *)a1 + 6);
  long long v21 = a2[1];
  v23[0] = *a2;
  v23[1] = v21;
  v23[2] = a2[2];
  return objc_msgSend(MEMORY[0x1E4FB1EB0], "pu_animateView:toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:", v18, v23, v20, a3, a4, a5, a6, a7, a8, a9, v19, a15, a16, a17);
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v7 = *(void *)(a1 + 32);
  int v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  objc_msgSend(v3, "pu_animateViews:usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", v6, *(void *)(a1 + 56), *(void *)(a1 + 40), v5, *(double *)(a1 + 48), 0.0, v7, v8);
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_13(uint64_t a1, _OWORD *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18 = *(void *)(a1 + 32);
  double v19 = *(double *)(a1 + 40);
  double v20 = *(double *)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 56);
  long long v22 = *(_OWORD *)(a1 + 64);
  uint64_t v23 = *(void *)(a1 + 80);
  long long v24 = a2[1];
  v26[0] = *a2;
  v26[1] = v24;
  v26[2] = a2[2];
  return objc_msgSend(MEMORY[0x1E4FB1EB0], "pu_animateView:toCenter:bounds:transform:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:completion:", v18, v26, v21, a3, a4, a5, a6, a7, a8, a9, v19, v20, v22, v23, a15, a16,
           a17);
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v7 = *(void *)(a1 + 32);
  int v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  objc_msgSend(v3, "pu_animateViews:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", v6, *(void *)(a1 + 64), *(void *)(a1 + 40), v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), 0.0, v7, v8);
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) initialVelocity];
  double v6 = v5;
  double v7 = v2;
  double v8 = v3;
  double v9 = v4;
  if (v5 == 0.0 && v2 == 0.0 && v3 == 0.0 && v4 == 0.0
    || (+[PUTilingViewSettings sharedInstance],
        double v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 carryOverVelocities],
        v10,
        !v11))
  {
    id v30 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v30();
  }
  else
  {
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    char v47 = 1;
    double v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_17;
    block[3] = &unk_1E5F2DB98;
    id v44 = *(id *)(a1 + 56);
    uint64_t v45 = v46;
    dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);
    if (*(void *)(a1 + 64))
    {
      id v13 = [*(id *)(a1 + 40) tilingView];
      [*(id *)(a1 + 48) center];
      double v15 = v14;
      double v17 = v16;
      uint64_t v18 = [*(id *)(a1 + 48) coordinateSystem];
      double v19 = [v13 contentCoordinateSystem];
      double v20 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v18, v19, v15, v17);
      double v22 = v21;

      [*(id *)(a1 + 48) size];
      double v34 = v24;
      double v35 = v23;
      long long v49 = 0u;
      long long v50 = 0u;
      *(_OWORD *)buf = 0u;
      v25 = *(void **)(a1 + 48);
      if (v25) {
        [v25 transform];
      }
      double v26 = *MEMORY[0x1E4F1DAD8];
      double v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      dispatch_group_enter(v12);
      uint64_t v28 = *(void *)(a1 + 64);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_18;
      v40[3] = &unk_1E5F2C7A0;
      double v42 = v46;
      double v41 = v12;
      uint64_t v29 = *(void (**)(uint64_t, _OWORD *, void *, double, double, double, double, double, double))(v28 + 16);
      v39[0] = *(_OWORD *)buf;
      v39[1] = v49;
      v39[2] = v50;
      v29(v28, v39, v40, v20, v22, v26, v27, v35, v34);
    }
    else
    {
      id v13 = PLUIGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [NSString stringWithFormat:@"{x:%0.1f, y:%0.1f, s:%0.3f, r:%0.2f}", *(void *)&v6, *(void *)&v7, *(void *)&v8, *(void *)&v9];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v31;
        _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEFAULT, "initial velocity ignored (%@)", buf, 0xCu);
      }
    }

    uint64_t v32 = *(void *)(a1 + 72);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_28;
    v36[3] = &unk_1E5F2C7A0;
    double v38 = v46;
    id v33 = v12;
    double v37 = v33;
    (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v36);

    _Block_object_dispose(v46, 8);
  }
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_18(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_28(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    double v2 = [*(id *)(a1 + 32) snapshotViewAfterScreenUpdates:0];
  }
  else
  {
    double v2 = 0;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  if (*(unsigned char *)(a1 + 48))
  {
    double v4 = [*(id *)(a1 + 32) layer];
    double v5 = [v4 presentationLayer];

    [v5 frame];
    objc_msgSend(v2, "setFrame:");
    if (v5)
    {
      [v5 transform];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
    }
    double v6 = [v2 layer];
    v16[4] = v21;
    v16[5] = v22;
    v16[6] = v23;
    v16[7] = v24;
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    v16[3] = v20;
    [v6 setTransform:v16];

    [v5 zPosition];
    double v8 = v7;
    double v9 = [v2 layer];
    [v9 setZPosition:v8];

    double v10 = [*(id *)(a1 + 32) superview];
    [v10 insertSubview:v2 aboveSubview:*(void *)(a1 + 32)];

    int v11 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_6;
    v14[3] = &unk_1E5F2ED10;
    id v15 = v2;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_7;
    v12[3] = &unk_1E5F2CEE8;
    id v13 = v15;
    [v11 animateWithDuration:v14 animations:v12 completion:0.5];
  }
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __87__PUTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareTileControllerForAnimation:(id)a3 withInitialLayoutInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUTileViewAnimator.m", 44, @"Invalid parameter not satisfying: %@", @"[tileController isKindOfClass:[PUTileViewController class]]" object file lineNumber description];
  }
  id v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUTileViewAnimator.m", 46, @"Invalid parameter not satisfying: %@", @"[tileViewController isKindOfClass:[PUTileViewController class]]" object file lineNumber description];
  }
  [MEMORY[0x1E4F39CF8] begin];
  [v9 removeAllAnimations];
  double v10 = (void *)MEMORY[0x1E4FB1EB0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PUTileViewAnimator_prepareTileControllerForAnimation_withInitialLayoutInfo___block_invoke;
  v15[3] = &unk_1E5F2DEB0;
  id v16 = v8;
  long long v17 = self;
  id v18 = v9;
  SEL v19 = a2;
  id v11 = v9;
  id v12 = v8;
  [v10 performWithoutAnimation:v15];
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __78__PUTileViewAnimator_prepareTileControllerForAnimation_withInitialLayoutInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) center];
  if (!CGFloatIsValid() || (CGFloatIsValid() & 1) == 0)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"PUTileViewAnimator.m", 51, @"Invalid parameter not satisfying: %@", @"PUPointIsValid(initialLayoutInfo.center)" object file lineNumber description];
  }
  double v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 applyLayoutInfo:v3];
}

- (PUTileViewAnimator)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUTileViewAnimator;
  double v2 = [(PUTileViewAnimator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    synchronizedAnimationGroupsByTransition = v2->__synchronizedAnimationGroupsByTransition;
    v2->__synchronizedAnimationGroupsByTransition = (NSMapTable *)v3;
  }
  return v2;
}

@end