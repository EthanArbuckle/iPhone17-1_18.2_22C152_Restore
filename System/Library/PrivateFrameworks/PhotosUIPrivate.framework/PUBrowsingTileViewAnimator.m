@interface PUBrowsingTileViewAnimator
- (BOOL)isAnimating;
- (void)animateTileController:(id)a3 toLayoutInfo:(id)a4 withOptions:(id)a5 completionHandler:(id)a6;
@end

@implementation PUBrowsingTileViewAnimator

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)animateTileController:(id)a3 toLayoutInfo:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PUBrowsingTileViewAnimator.m", 21, @"Invalid parameter not satisfying: %@", @"[tileController isKindOfClass:[PUTileViewController class]]" object file lineNumber description];
  }
  id v15 = v11;
  id v16 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 kind] == 101)
  {
    id v17 = [v15 view];
    v18 = [v17 snapshotViewAfterScreenUpdates:0];
    v19 = [v17 layer];
    v20 = [v19 presentationLayer];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    objc_msgSend(v18, "setFrame:", v22, v24, v26, v28);
    v29 = [v17 superview];
    [v29 addSubview:v18];

    if (v18)
    {
      v39[0] = v18;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    }
    else
    {
      v30 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v31 = (void *)MEMORY[0x1E4FB1EB0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __95__PUBrowsingTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_2;
    v37[3] = &unk_1E5F2D990;
    id v38 = v14;
    id v32 = v14;
    [v31 performSystemAnimation:0 onViews:v30 options:0 animations:&__block_literal_global_16317 completion:v37];
    [v15 applyLayoutInfo:v12];
  }
  else
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __95__PUBrowsingTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_3;
    v35[3] = &unk_1E5F2EBA0;
    id v36 = v14;
    v34.receiver = self;
    v34.super_class = (Class)PUBrowsingTileViewAnimator;
    id v17 = v14;
    [(PUTileViewAnimator *)&v34 animateTileController:v15 toLayoutInfo:v12 withOptions:v16 completionHandler:v35];
    v18 = v36;
  }
}

uint64_t __95__PUBrowsingTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __95__PUBrowsingTileViewAnimator_animateTileController_toLayoutInfo_withOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end