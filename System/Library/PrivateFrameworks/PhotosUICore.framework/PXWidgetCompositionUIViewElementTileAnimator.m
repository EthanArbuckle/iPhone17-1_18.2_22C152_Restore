@interface PXWidgetCompositionUIViewElementTileAnimator
- (void)animateTile:(id)a3 toGeometry:(PXTileGeometry *)a4 userData:(id)a5 withOptions:(id)a6 completionHandler:(id)a7;
- (void)prepareTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5;
@end

@implementation PXWidgetCompositionUIViewElementTileAnimator

- (void)animateTile:(id)a3 toGeometry:(PXTileGeometry *)a4 userData:(id)a5 withOptions:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  long long v14 = *(_OWORD *)&a4->contentSize.height;
  long long v45 = *(_OWORD *)&a4->hidden;
  long long v46 = v14;
  long long v15 = *(_OWORD *)&a4->contentsRect.size.height;
  long long v47 = *(_OWORD *)&a4->contentsRect.origin.y;
  long long v48 = v15;
  long long v16 = *(_OWORD *)&a4->transform.c;
  long long v41 = *(_OWORD *)&a4->transform.a;
  long long v42 = v16;
  long long v17 = *(_OWORD *)&a4->alpha;
  long long v43 = *(_OWORD *)&a4->transform.tx;
  long long v44 = v17;
  CGSize size = a4->frame.size;
  CGPoint origin = a4->frame.origin;
  CGSize v38 = size;
  CGSize v19 = a4->size;
  CGPoint center = a4->center;
  CGSize v40 = v19;
  id v20 = a6;
  id v21 = a5;
  v22 = [v12 _willAnimateTileToGeometry:&origin withOptions:v20];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __110__PXWidgetCompositionUIViewElementTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke;
  v33[3] = &unk_1E5DD0E78;
  id v34 = v12;
  id v35 = v22;
  id v36 = v13;
  v32.receiver = self;
  v32.super_class = (Class)PXWidgetCompositionUIViewElementTileAnimator;
  long long v23 = *(_OWORD *)&a4->contentSize.height;
  long long v45 = *(_OWORD *)&a4->hidden;
  long long v46 = v23;
  long long v24 = *(_OWORD *)&a4->contentsRect.size.height;
  long long v47 = *(_OWORD *)&a4->contentsRect.origin.y;
  long long v48 = v24;
  long long v25 = *(_OWORD *)&a4->transform.c;
  long long v41 = *(_OWORD *)&a4->transform.a;
  long long v42 = v25;
  long long v26 = *(_OWORD *)&a4->alpha;
  long long v43 = *(_OWORD *)&a4->transform.tx;
  long long v44 = v26;
  CGSize v27 = a4->frame.size;
  CGPoint origin = a4->frame.origin;
  CGSize v38 = v27;
  CGSize v28 = a4->size;
  CGPoint center = a4->center;
  CGSize v40 = v28;
  id v29 = v13;
  id v30 = v22;
  id v31 = v12;
  [(PXBasicUIViewTileAnimator *)&v32 animateTile:v31 toGeometry:&origin userData:v21 withOptions:v20 completionHandler:v33];

  [v31 _didAnimateTileWithContext:v30];
}

uint64_t __110__PXWidgetCompositionUIViewElementTileAnimator_animateTile_toGeometry_userData_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _didCompleteTileAnimationWithContext:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)prepareTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5
{
  long long v8 = *(_OWORD *)&a4->contentSize.height;
  long long v32 = *(_OWORD *)&a4->hidden;
  long long v33 = v8;
  long long v9 = *(_OWORD *)&a4->contentsRect.size.height;
  long long v34 = *(_OWORD *)&a4->contentsRect.origin.y;
  long long v35 = v9;
  long long v10 = *(_OWORD *)&a4->transform.c;
  long long v28 = *(_OWORD *)&a4->transform.a;
  long long v29 = v10;
  long long v11 = *(_OWORD *)&a4->alpha;
  long long v30 = *(_OWORD *)&a4->transform.tx;
  long long v31 = v11;
  CGSize size = a4->frame.size;
  CGPoint origin = a4->frame.origin;
  CGSize v25 = size;
  CGSize v13 = a4->size;
  CGPoint center = a4->center;
  CGSize v27 = v13;
  id v14 = a5;
  id v15 = a3;
  long long v16 = [v15 _willAnimateTileToGeometry:&origin withOptions:0];
  v23.receiver = self;
  v23.super_class = (Class)PXWidgetCompositionUIViewElementTileAnimator;
  long long v17 = *(_OWORD *)&a4->contentSize.height;
  long long v32 = *(_OWORD *)&a4->hidden;
  long long v33 = v17;
  long long v18 = *(_OWORD *)&a4->contentsRect.size.height;
  long long v34 = *(_OWORD *)&a4->contentsRect.origin.y;
  long long v35 = v18;
  long long v19 = *(_OWORD *)&a4->transform.c;
  long long v28 = *(_OWORD *)&a4->transform.a;
  long long v29 = v19;
  long long v20 = *(_OWORD *)&a4->alpha;
  long long v30 = *(_OWORD *)&a4->transform.tx;
  long long v31 = v20;
  CGSize v21 = a4->frame.size;
  CGPoint origin = a4->frame.origin;
  CGSize v25 = v21;
  CGSize v22 = a4->size;
  CGPoint center = a4->center;
  CGSize v27 = v22;
  [(PXBasicUIViewTileAnimator *)&v23 prepareTile:v15 withGeometry:&origin userData:v14];

  [v15 _didAnimateTileWithContext:v16];
  [v15 _didCompleteTileAnimationWithContext:v16];
}

@end