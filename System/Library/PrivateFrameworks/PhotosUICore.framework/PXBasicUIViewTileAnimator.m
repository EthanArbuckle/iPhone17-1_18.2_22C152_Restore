@interface PXBasicUIViewTileAnimator
+ (void)animateWithOptions:(id)a3 animations:(id)a4 completion:(id)a5;
- (void)_applyGeometry:(PXTileGeometry *)a3 toTile:(id)a4;
- (void)_applyGeometry:(PXTileGeometry *)a3 userData:(id)a4 toTile:(id)a5;
- (void)animateTile:(id)a3 toGeometry:(PXTileGeometry *)a4 userData:(id)a5 withOptions:(id)a6 completionHandler:(id)a7;
- (void)prepareTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5;
- (void)resumeAnimationsForTile:(id)a3;
- (void)suspendAnimationsForTile:(id)a3;
@end

@implementation PXBasicUIViewTileAnimator

+ (void)animateWithOptions:(id)a3 animations:(id)a4 completion:(id)a5
{
  id v15 = a3;
  v7 = (void (**)(void))a4;
  v8 = (void (**)(id, uint64_t))a5;
  if (v15)
  {
    uint64_t v9 = [v15 style];
    if (v9 == 2)
    {
      v11 = (void *)MEMORY[0x1E4FB1EB0];
      [v15 delay];
      objc_msgSend(v11, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 2, v7, v8);
    }
    else
    {
      v10 = (void *)MEMORY[0x1E4FB1EB0];
      if (v9 == 3)
      {
        [v15 duration];
        objc_msgSend(v10, "px_animateUsingDefaultDampedEaseInEaseOutWithDuration:animations:completion:", v7, v8);
      }
      else
      {
        [v15 duration];
        double v13 = v12;
        [v15 delay];
        [v10 animateWithDuration:2 delay:v7 options:v8 animations:v13 completion:v14];
      }
    }
  }
  else
  {
    v7[2](v7);
    if (v8) {
      v8[2](v8, 1);
    }
  }
}

- (void).cxx_destruct
{
}

- (void)_applyGeometry:(PXTileGeometry *)a3 userData:(id)a4 toTile:(id)a5
{
  long long v8 = *(_OWORD *)&a3->contentSize.height;
  long long v30 = *(_OWORD *)&a3->hidden;
  long long v31 = v8;
  long long v9 = *(_OWORD *)&a3->contentsRect.size.height;
  long long v32 = *(_OWORD *)&a3->contentsRect.origin.y;
  long long v33 = v9;
  long long v10 = *(_OWORD *)&a3->transform.c;
  long long v26 = *(_OWORD *)&a3->transform.a;
  long long v27 = v10;
  long long v11 = *(_OWORD *)&a3->alpha;
  long long v28 = *(_OWORD *)&a3->transform.tx;
  long long v29 = v11;
  CGSize size = a3->frame.size;
  CGPoint origin = a3->frame.origin;
  CGSize v23 = size;
  CGSize v13 = a3->size;
  CGPoint center = a3->center;
  CGSize v25 = v13;
  id v14 = a5;
  id v15 = a4;
  [(PXBasicUIViewTileAnimator *)self _applyGeometry:&origin toTile:v14];
  long long v16 = *(_OWORD *)&a3->contentSize.height;
  long long v30 = *(_OWORD *)&a3->hidden;
  long long v31 = v16;
  long long v17 = *(_OWORD *)&a3->contentsRect.size.height;
  long long v32 = *(_OWORD *)&a3->contentsRect.origin.y;
  long long v33 = v17;
  long long v18 = *(_OWORD *)&a3->transform.c;
  long long v26 = *(_OWORD *)&a3->transform.a;
  long long v27 = v18;
  long long v19 = *(_OWORD *)&a3->alpha;
  long long v28 = *(_OWORD *)&a3->transform.tx;
  long long v29 = v19;
  CGSize v20 = a3->frame.size;
  CGPoint origin = a3->frame.origin;
  CGSize v23 = v20;
  CGSize v21 = a3->size;
  CGPoint center = a3->center;
  CGSize v25 = v21;
  [v14 didApplyGeometry:&origin withUserData:v15];
}

- (void)_applyGeometry:(PXTileGeometry *)a3 toTile:(id)a4
{
  v5 = [a4 view];
  objc_msgSend(v5, "setCenter:", a3->center.x, a3->center.y);
  objc_msgSend(v5, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3->size.width, a3->size.height);
  [v5 setAlpha:a3->alpha];
  [v5 setHidden:a3->hidden];
  long long v6 = *(_OWORD *)&a3->transform.c;
  v8[0] = *(_OWORD *)&a3->transform.a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->transform.tx;
  [v5 setTransform:v8];
  v7 = [v5 layer];
  [v7 setZPosition:a3->zPosition + -11000000.0];

  if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled]) {
    [v5 layoutIfNeeded];
  }
}

- (void)resumeAnimationsForTile:(id)a3
{
}

- (void)suspendAnimationsForTile:(id)a3
{
  id v4 = a3;
  suspendedTiles = self->_suspendedTiles;
  id v8 = v4;
  if (!suspendedTiles)
  {
    long long v6 = [MEMORY[0x1E4F28BD0] set];
    v7 = self->_suspendedTiles;
    self->_suspendedTiles = v6;

    id v4 = v8;
    suspendedTiles = self->_suspendedTiles;
  }
  [(NSCountedSet *)suspendedTiles addObject:v4];
}

- (void)animateTile:(id)a3 toGeometry:(PXTileGeometry *)a4 userData:(id)a5 withOptions:(id)a6 completionHandler:(id)a7
{
  v94[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(void))a7;
  if ([(NSCountedSet *)self->_suspendedTiles containsObject:v12])
  {
    v15[2](v15);
  }
  else
  {
    int v16 = [v14 shouldNotifyTiles];
    char v17 = v16;
    if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      long long v18 = *(_OWORD *)&a4->contentSize.height;
      v93[8] = *(_OWORD *)&a4->hidden;
      v93[9] = v18;
      long long v19 = *(_OWORD *)&a4->contentsRect.size.height;
      v93[10] = *(_OWORD *)&a4->contentsRect.origin.y;
      v93[11] = v19;
      long long v20 = *(_OWORD *)&a4->transform.c;
      v93[4] = *(_OWORD *)&a4->transform.a;
      v93[5] = v20;
      long long v21 = *(_OWORD *)&a4->alpha;
      v93[6] = *(_OWORD *)&a4->transform.tx;
      v93[7] = v21;
      CGSize size = a4->frame.size;
      v93[0] = a4->frame.origin;
      v93[1] = size;
      CGSize v23 = a4->size;
      v93[2] = a4->center;
      v93[3] = v23;
      [v12 willAnimateToGeometry:v93 toUserData:v13 withOptions:v14];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    long long v24 = *(_OWORD *)&a4->contentSize.height;
    long long v89 = *(_OWORD *)&a4->hidden;
    long long v90 = v24;
    long long v25 = *(_OWORD *)&a4->contentsRect.size.height;
    long long v91 = *(_OWORD *)&a4->contentsRect.origin.y;
    long long v92 = v25;
    long long v26 = *(_OWORD *)&a4->transform.c;
    long long v85 = *(_OWORD *)&a4->transform.a;
    long long v86 = v26;
    long long v27 = *(_OWORD *)&a4->alpha;
    long long v87 = *(_OWORD *)&a4->transform.tx;
    long long v88 = v27;
    CGSize v28 = a4->frame.size;
    CGPoint origin = a4->frame.origin;
    CGSize v82 = v28;
    CGSize v29 = a4->size;
    CGPoint center = a4->center;
    aBlock[2] = __91__PXBasicUIViewTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5DC20E0;
    aBlock[4] = self;
    CGSize v84 = v29;
    id v30 = v13;
    id v79 = v30;
    id v31 = v12;
    id v80 = v31;
    long long v32 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v57 = MEMORY[0x1E4F143A8];
    uint64_t v58 = 3221225472;
    v59 = __91__PXBasicUIViewTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke_2;
    v60 = &unk_1E5DC2108;
    char v77 = v17;
    id v33 = v31;
    id v61 = v33;
    long long v34 = *(_OWORD *)&a4->contentSize.height;
    long long v73 = *(_OWORD *)&a4->hidden;
    long long v74 = v34;
    long long v35 = *(_OWORD *)&a4->contentsRect.size.height;
    long long v75 = *(_OWORD *)&a4->contentsRect.origin.y;
    long long v76 = v35;
    long long v36 = *(_OWORD *)&a4->transform.c;
    long long v69 = *(_OWORD *)&a4->transform.a;
    long long v70 = v36;
    long long v37 = *(_OWORD *)&a4->alpha;
    long long v71 = *(_OWORD *)&a4->transform.tx;
    long long v72 = v37;
    CGSize v38 = a4->frame.size;
    CGPoint v65 = a4->frame.origin;
    CGSize v66 = v38;
    CGSize v39 = a4->size;
    CGPoint v67 = a4->center;
    CGSize v68 = v39;
    id v62 = v30;
    id v40 = v14;
    id v63 = v40;
    v41 = v15;
    id v64 = v41;
    v42 = _Block_copy(&v57);
    if (v40)
    {
      if (objc_msgSend(v40, "style", v57, v58, v59, v60, v61, v62, v63) == 1)
      {
        v43 = [v33 view];
        v44 = [v43 snapshotViewAfterScreenUpdates:0];
        v45 = [v43 layer];
        v46 = [v45 presentationLayer];
        [v46 frame];
        double v48 = v47;
        double v50 = v49;
        double v52 = v51;
        double v54 = v53;

        objc_msgSend(v44, "setFrame:", v48, v50, v52, v54);
        v55 = [v43 superview];
        [v55 addSubview:v44];

        if (v44)
        {
          v94[0] = v44;
          v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:1];
        }
        else
        {
          v56 = (void *)MEMORY[0x1E4F1CBF0];
        }
        [MEMORY[0x1E4FB1EB0] performSystemAnimation:0 onViews:v56 options:0 animations:0 completion:v42];
        v32[2](v32);
      }
      else
      {
        [(id)objc_opt_class() animateWithOptions:v40 animations:v32 completion:v42];
      }
    }
    else
    {
      v32[2](v32);
      v41[2](v41);
    }
  }
}

uint64_t __91__PXBasicUIViewTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 200);
  v11[8] = *(_OWORD *)(a1 + 184);
  v11[9] = v4;
  long long v5 = *(_OWORD *)(a1 + 232);
  v11[10] = *(_OWORD *)(a1 + 216);
  v11[11] = v5;
  long long v6 = *(_OWORD *)(a1 + 136);
  v11[4] = *(_OWORD *)(a1 + 120);
  v11[5] = v6;
  long long v7 = *(_OWORD *)(a1 + 168);
  v11[6] = *(_OWORD *)(a1 + 152);
  v11[7] = v7;
  long long v8 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v8;
  long long v9 = *(_OWORD *)(a1 + 104);
  v11[2] = *(_OWORD *)(a1 + 88);
  v11[3] = v9;
  return [v2 _applyGeometry:v11 userData:v1 toTile:v3];
}

uint64_t __91__PXBasicUIViewTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 256) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    long long v5 = *(_OWORD *)(a1 + 208);
    v12[8] = *(_OWORD *)(a1 + 192);
    v12[9] = v5;
    long long v6 = *(_OWORD *)(a1 + 240);
    v12[10] = *(_OWORD *)(a1 + 224);
    v12[11] = v6;
    long long v7 = *(_OWORD *)(a1 + 144);
    v12[4] = *(_OWORD *)(a1 + 128);
    v12[5] = v7;
    long long v8 = *(_OWORD *)(a1 + 176);
    v12[6] = *(_OWORD *)(a1 + 160);
    v12[7] = v8;
    long long v9 = *(_OWORD *)(a1 + 80);
    v12[0] = *(_OWORD *)(a1 + 64);
    v12[1] = v9;
    long long v10 = *(_OWORD *)(a1 + 112);
    v12[2] = *(_OWORD *)(a1 + 96);
    v12[3] = v10;
    [v2 didAnimateToGeometry:v12 toUserData:v3 withOptions:v4];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)prepareTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = (void *)MEMORY[0x1E4FB1EB0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  long long v11 = *(_OWORD *)&a4->contentSize.height;
  long long v30 = *(_OWORD *)&a4->hidden;
  long long v31 = v11;
  long long v12 = *(_OWORD *)&a4->contentsRect.size.height;
  long long v32 = *(_OWORD *)&a4->contentsRect.origin.y;
  long long v33 = v12;
  long long v13 = *(_OWORD *)&a4->transform.a;
  long long v27 = *(_OWORD *)&a4->transform.c;
  long long v14 = *(_OWORD *)&a4->alpha;
  long long v28 = *(_OWORD *)&a4->transform.tx;
  long long v29 = v14;
  CGSize size = a4->frame.size;
  CGPoint origin = a4->frame.origin;
  CGSize v23 = size;
  CGSize v16 = a4->size;
  CGPoint center = a4->center;
  v19[2] = __63__PXBasicUIViewTileAnimator_prepareTile_withGeometry_userData___block_invoke;
  v19[3] = &unk_1E5DC20E0;
  CGSize v25 = v16;
  long long v26 = v13;
  v19[4] = self;
  id v20 = v9;
  id v21 = v8;
  id v17 = v8;
  id v18 = v9;
  [v10 performWithoutAnimation:v19];
}

void __63__PXBasicUIViewTileAnimator_prepareTile_withGeometry_userData___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 200);
  v12[8] = *(_OWORD *)(a1 + 184);
  v12[9] = v5;
  long long v6 = *(_OWORD *)(a1 + 232);
  v12[10] = *(_OWORD *)(a1 + 216);
  v12[11] = v6;
  long long v7 = *(_OWORD *)(a1 + 136);
  v12[4] = *(_OWORD *)(a1 + 120);
  v12[5] = v7;
  long long v8 = *(_OWORD *)(a1 + 168);
  v12[6] = *(_OWORD *)(a1 + 152);
  v12[7] = v8;
  long long v9 = *(_OWORD *)(a1 + 72);
  v12[0] = *(_OWORD *)(a1 + 56);
  v12[1] = v9;
  long long v10 = *(_OWORD *)(a1 + 104);
  v12[2] = *(_OWORD *)(a1 + 88);
  v12[3] = v10;
  [v2 _applyGeometry:v12 userData:v3 toTile:v4];
  long long v11 = [*(id *)(a1 + 48) view];
  [v11 layoutIfNeeded];
}

@end