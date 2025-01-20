@interface PREditorCombinedRootViewController
- (PREditingLookViewProviding)views;
- (int64_t)_windowInterfaceOrientation;
- (void)_updateCounterRotationLayout;
- (void)_updateScrollViewClipping:(BOOL)a3;
- (void)loadView;
- (void)setViews:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PREditorCombinedRootViewController

- (void)loadView
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)PREditorCombinedRootViewController;
  [(PREditorRootViewController *)&v40 loadView];
  v3 = [(PREditorCombinedRootViewController *)self view];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  v12 = objc_alloc_init(PREditorLookViews);
  [(PREditorCombinedRootViewController *)self setViews:v12];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __46__PREditorCombinedRootViewController_loadView__block_invoke;
  v39[3] = &__block_descriptor_64_e27_v24__0__UIView_8__UIView_16l;
  v39[4] = v5;
  v39[5] = v7;
  v39[6] = v9;
  v39[7] = v11;
  v13 = (void *)MEMORY[0x192F91830](v39);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __46__PREditorCombinedRootViewController_loadView__block_invoke_2;
  v37[3] = &unk_1E54DB8E8;
  v37[4] = self;
  id v14 = v13;
  id v38 = v14;
  [(PREditorLookViews *)v12 enumerateViewsUsingBlock:v37];
  v15 = [(PREditorRootViewController *)self contentOverlayView];
  [v15 removeFromSuperview];

  v16 = [(PREditorRootViewController *)self contentOverlayView];
  v31 = self;
  v17 = [(PREditorRootViewController *)self contentOverlayContainerView];
  v29 = v14;
  (*((void (**)(id, void *, void *))v14 + 2))(v14, v16, v17);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v30 = v12;
  id obj = [(PREditorLookViews *)v12 contentViews];
  uint64_t v18 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    uint64_t v21 = *MEMORY[0x1E4F39FA0];
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v33 + 1) + 8 * v22);
        v24 = [MEMORY[0x1E4F39C00] animation];
        v25 = [v3 layer];
        [v24 setSourceLayer:v25];

        [v24 setDuration:INFINITY];
        [v24 setFillMode:v21];
        [v24 setRemovedOnCompletion:0];
        [v24 setUsesNormalizedCoordinates:1];
        [v24 setAppliesY:1];
        [v24 setAppliesX:1];
        v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.5, 0.5);
        v41 = v26;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
        [v24 setSourcePoints:v27];

        v28 = [v23 layer];
        [v28 addAnimation:v24 forKey:@"match-move"];

        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v19);
  }

  [(PREditorCombinedRootViewController *)v31 _updateCounterRotationLayout];
}

void __46__PREditorCombinedRootViewController_loadView__block_invoke(double *a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F4F8D0];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)objc_msgSend([v5 alloc], "initWithFrame:", a1[4], a1[5], a1[6], a1[7]);
  [v8 setCounterTransformView:1];
  [v8 addContentView:v7];

  [v6 addSubview:v8];
}

void __46__PREditorCombinedRootViewController_loadView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  switch(a3)
  {
    case 2:
      uint64_t v5 = [*(id *)(a1 + 32) floatingContainerView];
      goto LABEL_7;
    case 1:
      uint64_t v5 = [*(id *)(a1 + 32) foregroundContainerView];
      goto LABEL_7;
    case 0:
      uint64_t v5 = [*(id *)(a1 + 32) backgroundContainerView];
LABEL_7:
      id v6 = (void *)v5;
      goto LABEL_9;
  }
  id v6 = 0;
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PREditorCombinedRootViewController;
  [(PREditorCombinedRootViewController *)&v4 viewWillAppear:a3];
  [(PREditorCombinedRootViewController *)self _updateCounterRotationLayout];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PREditorCombinedRootViewController;
  [(PREditorRootViewController *)&v4 viewDidAppear:a3];
  [(PREditorRootViewController *)self updateReticleViewFrames];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(PREditorCombinedRootViewController *)self _updateScrollViewClipping:0];
  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__PREditorCombinedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E54DB6A0;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__PREditorCombinedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_1E54DB6A0;
  [v7 animateAlongsideTransition:v10 completion:v9];
  v8.receiver = self;
  v8.super_class = (Class)PREditorCombinedRootViewController;
  -[PREditorRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __89__PREditorCombinedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateReticleViewFrames];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateCounterRotationLayout];
}

uint64_t __89__PREditorCombinedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateScrollViewClipping:1];
}

- (void)_updateCounterRotationLayout
{
  if (PUIDynamicRotationIsActive()) {
    int64_t v3 = [(PREditorCombinedRootViewController *)self _windowInterfaceOrientation];
  }
  else {
    int64_t v3 = 1;
  }
  objc_super v4 = [(PREditorCombinedRootViewController *)self view];
  [v4 bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__PREditorCombinedRootViewController__updateCounterRotationLayout__block_invoke;
  v19[3] = &__block_descriptor_72_e16_v16__0__UIView_8l;
  v19[4] = v6;
  v19[5] = v8;
  v19[6] = v10;
  v19[7] = v12;
  v19[8] = v3;
  v13 = (void *)MEMORY[0x192F91830](v19);
  id v14 = [(PREditorCombinedRootViewController *)self views];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__PREditorCombinedRootViewController__updateCounterRotationLayout__block_invoke_2;
  v17[3] = &unk_1E54DB8E8;
  v17[4] = self;
  id v18 = v13;
  v15 = v13;
  [v14 enumerateViewsUsingBlock:v17];

  v16 = [(PREditorRootViewController *)self contentOverlayContainerView];
  v15[2](v15, v16);
}

void __66__PREditorCombinedRootViewController__updateCounterRotationLayout__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 subviews];
  objc_super v4 = [v3 firstObject];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  objc_msgSend(v8, "setFrame:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  [v8 setContentOrientation:1];
  [v8 setContainerOrientation:*(void *)(a1 + 64)];
}

void __66__PREditorCombinedRootViewController__updateCounterRotationLayout__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  switch(a3)
  {
    case 2:
      uint64_t v5 = [*(id *)(a1 + 32) floatingContainerView];
      goto LABEL_7;
    case 1:
      uint64_t v5 = [*(id *)(a1 + 32) foregroundContainerView];
      goto LABEL_7;
    case 0:
      uint64_t v5 = [*(id *)(a1 + 32) backgroundContainerView];
LABEL_7:
      id v6 = (void *)v5;
      goto LABEL_9;
  }
  id v6 = 0;
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateScrollViewClipping:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PREditorRootViewController *)self scrollView];
  [v4 setClipsToBounds:v3];
}

- (int64_t)_windowInterfaceOrientation
{
  BOOL v3 = [(PREditorCombinedRootViewController *)self view];
  id v4 = [v3 window];
  uint64_t v5 = v4;
  if (!v4) {
    id v4 = (void *)[(PREditorCombinedRootViewController *)self performSelector:sel__window];
  }
  id v6 = v4;

  int64_t v7 = [v6 _windowInterfaceOrientation];
  return v7;
}

- (PREditingLookViewProviding)views
{
  return self->_views;
}

- (void)setViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end