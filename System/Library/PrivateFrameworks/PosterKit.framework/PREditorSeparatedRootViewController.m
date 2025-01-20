@interface PREditorSeparatedRootViewController
- (UIScrollView)timeContainerScrollView;
- (UIView)backgroundForegroundContainerViewsZStackView;
- (UIView)floatingContainerViewsZStackView;
- (UIView)looksDividerView;
- (id)currentLookViews;
- (id)viewsForLook:(id)a3;
- (int64_t)_windowInterfaceOrientation;
- (void)_enumerateContainerViewsWithBlock:(id)a3;
- (void)_updateContainerViewClipping:(BOOL)a3;
- (void)_updateContainerViewFrames;
- (void)_updateCounterRotationLayout;
- (void)_updateLooksDividerViewForTransitionToSize:(CGSize)a3 startingTransition:(BOOL)a4;
- (void)loadView;
- (void)looksDidChange;
- (void)looksWillChange;
- (void)setBackgroundForegroundContainerViewsZStackView:(id)a3;
- (void)setFloatingContainerViewsZStackView:(id)a3;
- (void)setLooksDividerView:(id)a3;
- (void)setTimeContainerScrollView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PREditorSeparatedRootViewController

- (void)loadView
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)PREditorSeparatedRootViewController;
  [(PREditorRootViewController *)&v30 loadView];
  v3 = [(PREditorSeparatedRootViewController *)self view];
  uint64_t v4 = [(PREditorRootViewController *)self scrollView];
  id v29 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(PREditorSeparatedRootViewController *)self setBackgroundForegroundContainerViewsZStackView:v29];
  id v27 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(PREditorSeparatedRootViewController *)self setFloatingContainerViewsZStackView:v27];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v6 = [MEMORY[0x1E4FB1618] systemBlackColor];
  [v5 setBackgroundColor:v6];

  v24 = v5;
  [(PREditorSeparatedRootViewController *)self setLooksDividerView:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F8E0]);
  [v7 setPagingEnabled:1];
  [v7 setShowsVerticalScrollIndicator:0];
  [v7 setShowsHorizontalScrollIndicator:0];
  [v7 setScrollsToTop:0];
  [v7 setBounces:0];
  [v7 _setAutoScrollEnabled:0];
  v8 = [v7 layer];
  [v8 setHitTestsAsOpaque:1];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PREditorSeparatedRootViewController *)self setTimeContainerScrollView:v7];
  v28 = [(PREditorRootViewController *)self timeContainerView];
  [v7 addSubview:v28];
  v25 = [(PREditorRootViewController *)self reticleVibrancyView];
  v23 = [(PREditorRootViewController *)self sidebarReticleVibrancyView];
  v26 = (void *)v4;
  [v3 insertSubview:v29 belowSubview:v4];
  [v3 insertSubview:v27 belowSubview:v4];
  [v3 insertSubview:v25 belowSubview:v4];
  [v3 insertSubview:v7 belowSubview:v4];
  [v3 insertSubview:v23 belowSubview:v4];
  [v3 insertSubview:v5 aboveSubview:v4];
  v17 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [v7 topAnchor];
  v21 = [v3 topAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v31[0] = v20;
  v19 = [v7 bottomAnchor];
  v18 = [v3 bottomAnchor];
  v16 = [v19 constraintEqualToAnchor:v18];
  v31[1] = v16;
  v9 = [v7 leadingAnchor];
  v10 = [v3 leadingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v31[2] = v11;
  v12 = [v7 trailingAnchor];
  v13 = [v3 trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v31[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v17 activateConstraints:v15];

  [(PREditorSeparatedRootViewController *)self _updateCounterRotationLayout];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PREditorSeparatedRootViewController;
  [(PREditorSeparatedRootViewController *)&v4 viewWillAppear:a3];
  [(PREditorSeparatedRootViewController *)self _updateContainerViewFrames];
  [(PREditorSeparatedRootViewController *)self _updateCounterRotationLayout];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PREditorSeparatedRootViewController;
  [(PREditorRootViewController *)&v4 viewDidAppear:a3];
  [(PREditorRootViewController *)self updateReticleViewFrames];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PREditorSeparatedRootViewController;
  [(PREditorSeparatedRootViewController *)&v3 viewWillLayoutSubviews];
  [(PREditorSeparatedRootViewController *)self _updateCounterRotationLayout];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(PREditorSeparatedRootViewController *)self _updateContainerViewClipping:0];
  -[PREditorSeparatedRootViewController _updateLooksDividerViewForTransitionToSize:startingTransition:](self, "_updateLooksDividerViewForTransitionToSize:startingTransition:", 1, width, height);
  v8 = [(PREditorSeparatedRootViewController *)self timeContainerScrollView];
  [v8 setClipsToBounds:0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__PREditorSeparatedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E54DB6A0;
  v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__PREditorSeparatedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_1E54DB7D8;
  v10[4] = self;
  *(double *)&v10[5] = width;
  *(double *)&v10[6] = height;
  [v7 animateAlongsideTransition:v11 completion:v10];
  v9.receiver = self;
  v9.super_class = (Class)PREditorSeparatedRootViewController;
  -[PREditorRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __90__PREditorSeparatedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateContainerViewFrames];
  [*(id *)(a1 + 32) updateReticleViewFrames];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateCounterRotationLayout];
}

void __90__PREditorSeparatedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateContainerViewClipping:1];
  objc_msgSend(*(id *)(a1 + 32), "_updateLooksDividerViewForTransitionToSize:startingTransition:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v2 = [*(id *)(a1 + 32) timeContainerScrollView];
  [v2 setClipsToBounds:1];
}

- (void)_updateContainerViewClipping:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PREditorSeparatedRootViewController__updateContainerViewClipping___block_invoke;
  v3[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  BOOL v4 = a3;
  [(PREditorSeparatedRootViewController *)self _enumerateContainerViewsWithBlock:v3];
}

uint64_t __68__PREditorSeparatedRootViewController__updateContainerViewClipping___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setClipsToBounds:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_updateContainerViewFrames
{
  objc_super v3 = [(PREditorSeparatedRootViewController *)self view];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PREditorSeparatedRootViewController__updateContainerViewFrames__block_invoke;
  v12[3] = &__block_descriptor_64_e16_v16__0__UIView_8l;
  v12[4] = v5;
  v12[5] = v7;
  v12[6] = v9;
  v12[7] = v11;
  [(PREditorSeparatedRootViewController *)self _enumerateContainerViewsWithBlock:v12];
}

uint64_t __65__PREditorSeparatedRootViewController__updateContainerViewFrames__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_updateCounterRotationLayout
{
  if (PUIDynamicRotationIsActive()) {
    int64_t v3 = [(PREditorSeparatedRootViewController *)self _windowInterfaceOrientation];
  }
  else {
    int64_t v3 = 1;
  }
  uint64_t v4 = [(PREditorSeparatedRootViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  if (PUIDynamicRotationIsActive())
  {
    double v13 = v10;
    double v14 = v12;
    if ((unint64_t)(v3 - 3) <= 1)
    {
      BSSizeSwap();
      double v13 = v15;
      double v14 = v16;
    }
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__PREditorSeparatedRootViewController__updateCounterRotationLayout__block_invoke;
  v19[3] = &__block_descriptor_72_e16_v16__0__UIView_8l;
  *(double *)&v19[4] = v6;
  *(double *)&v19[5] = v8;
  *(double *)&v19[6] = v10;
  *(double *)&v19[7] = v12;
  v19[8] = v3;
  [(PREditorSeparatedRootViewController *)self _enumerateContainerViewsWithBlock:v19];
  v17 = [(PREditorSeparatedRootViewController *)self backgroundForegroundContainerViewsZStackView];
  v18 = [(PREditorSeparatedRootViewController *)self floatingContainerViewsZStackView];
  objc_msgSend(v17, "setFrame:", v6, v8, v13, v14);
  objc_msgSend(v18, "setFrame:", v6, v8, v13, v14);
}

void __67__PREditorSeparatedRootViewController__updateCounterRotationLayout__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 subviews];
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  id v8 = v7;

  objc_msgSend(v8, "setFrame:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  [v8 setContentOrientation:1];
  [v8 setContainerOrientation:*(void *)(a1 + 64)];
}

- (void)_updateLooksDividerViewForTransitionToSize:(CGSize)a3 startingTransition:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.width;
  id v8 = [(PREditorSeparatedRootViewController *)self looksDividerView];
  if (v4)
  {
    double v7 = [(PREditorRootViewController *)self scrollView];
    if (([v7 isDragging] & 1) == 0)
    {
      [v8 setHidden:1];
      [v8 frame];
      [v8 setFrame:width];
    }
  }
  else
  {
    [v8 setHidden:0];
  }
}

- (int64_t)_windowInterfaceOrientation
{
  int64_t v3 = [(PREditorSeparatedRootViewController *)self view];
  BOOL v4 = [v3 window];
  uint64_t v5 = v4;
  if (!v4) {
    BOOL v4 = (void *)[(PREditorSeparatedRootViewController *)self performSelector:sel__window];
  }
  id v6 = v4;

  int64_t v7 = [v6 _windowInterfaceOrientation];
  return v7;
}

- (void)_enumerateContainerViewsWithBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(PREditorSeparatedRootViewController *)self backgroundForegroundContainerViewsZStackView];
  id v6 = [v5 subviews];

  int64_t v7 = [(PREditorSeparatedRootViewController *)self floatingContainerViewsZStackView];
  id v8 = [v7 subviews];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v4[2](v4, *(void *)(*((void *)&v23 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        v4[2](v4, *(void *)(*((void *)&v19 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void)looksWillChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PREditorSeparatedRootViewController;
  [(PREditorRootViewController *)&v13 looksWillChange];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int64_t v3 = self->_viewsForLook;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[NSMutableDictionary objectForKey:](self->_viewsForLook, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 enumerateViewsUsingBlock:&__block_literal_global_1385];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_viewsForLook removeAllObjects];
  [(PREditorSeparatedRootViewController *)self _enumerateContainerViewsWithBlock:&__block_literal_global_1387];
}

uint64_t __54__PREditorSeparatedRootViewController_looksWillChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

uint64_t __54__PREditorSeparatedRootViewController_looksWillChange__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)looksDidChange
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)PREditorSeparatedRootViewController;
  [(PREditorRootViewController *)&v42 looksDidChange];
  if (!self->_viewsForLook)
  {
    int64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    viewsForLook = self->_viewsForLook;
    self->_viewsForLook = v3;
  }
  uint64_t v5 = [(PREditorSeparatedRootViewController *)self view];
  v33 = [(PREditorSeparatedRootViewController *)self backgroundForegroundContainerViewsZStackView];
  v32 = [(PREditorSeparatedRootViewController *)self floatingContainerViewsZStackView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v27 = v5;
  uint64_t v31 = [v5 effectiveUserInterfaceLayoutDirection];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [(PREditorRootViewController *)self looks];
  uint64_t v34 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v34)
  {
    uint64_t v14 = 0;
    uint64_t v30 = *(void *)v39;
    do
    {
      uint64_t v15 = 0;
      uint64_t v28 = v14;
      uint64_t v16 = -v14;
      do
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * v15);
        uint64_t v18 = __53__PREditorSeparatedRootViewController_looksDidChange__block_invoke(v7, v9, v11, v13);
        long long v19 = __53__PREditorSeparatedRootViewController_looksDidChange__block_invoke(v7, v9, v11, v13);
        long long v20 = [v18 subviews];
        long long v21 = [v20 firstObject];

        long long v22 = [v19 subviews];
        long long v23 = [v22 firstObject];

        long long v24 = objc_alloc_init(PREditorLookViews);
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __53__PREditorSeparatedRootViewController_looksDidChange__block_invoke_2;
        v35[3] = &unk_1E54DB8A0;
        id v36 = v23;
        id v37 = v21;
        id v25 = v21;
        id v26 = v23;
        [(PREditorLookViews *)v24 enumerateViewsUsingBlock:v35];
        if (v16 != v15)
        {
          [v18 setHidden:1];
          [v19 setHidden:1];
        }
        if (v31)
        {
          [v33 addSubview:v18];
          [v32 addSubview:v19];
        }
        else
        {
          [v33 insertSubview:v18 atIndex:0];
          [v32 insertSubview:v19 atIndex:0];
        }
        [(NSMutableDictionary *)self->_viewsForLook setObject:v24 forKey:v17];

        ++v15;
      }
      while (v34 != v15);
      uint64_t v14 = v28 + v34;
      uint64_t v34 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v34);
  }
}

id __53__PREditorSeparatedRootViewController_looksDidChange__block_invoke(double a1, double a2, double a3, double a4)
{
  double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", a1, a2, a3, a4);
  [v8 setClipsToBounds:1];
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8D0]), "initWithFrame:", a1, a2, a3, a4);
  [v9 setCounterTransformView:1];
  [v8 addSubview:v9];

  return v8;
}

uint64_t __53__PREditorSeparatedRootViewController_looksDidChange__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 40;
  if (a3 == 2) {
    uint64_t v3 = 32;
  }
  return [*(id *)(a1 + v3) addContentView:a2];
}

- (id)viewsForLook:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_viewsForLook objectForKey:a3];
}

- (id)currentLookViews
{
  uint64_t v3 = [(PREditorRootViewController *)self currentLook];
  uint64_t v4 = [(PREditorSeparatedRootViewController *)self viewsForLook:v3];

  return v4;
}

- (UIView)looksDividerView
{
  return self->_looksDividerView;
}

- (void)setLooksDividerView:(id)a3
{
}

- (UIView)backgroundForegroundContainerViewsZStackView
{
  return self->_backgroundForegroundContainerViewsZStackView;
}

- (void)setBackgroundForegroundContainerViewsZStackView:(id)a3
{
}

- (UIView)floatingContainerViewsZStackView
{
  return self->_floatingContainerViewsZStackView;
}

- (void)setFloatingContainerViewsZStackView:(id)a3
{
}

- (UIScrollView)timeContainerScrollView
{
  return self->_timeContainerScrollView;
}

- (void)setTimeContainerScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeContainerScrollView, 0);
  objc_storeStrong((id *)&self->_floatingContainerViewsZStackView, 0);
  objc_storeStrong((id *)&self->_backgroundForegroundContainerViewsZStackView, 0);
  objc_storeStrong((id *)&self->_looksDividerView, 0);
  objc_storeStrong((id *)&self->_viewsForLook, 0);
}

@end