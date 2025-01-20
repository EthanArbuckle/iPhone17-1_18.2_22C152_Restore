@interface SUUIOnboardingAffiliationCirclesViewController
- (CGSize)_circleSizeForAffinityCount:(int64_t)a3;
- (NSArray)affiliationItems;
- (SUUIClientContext)clientContext;
- (SUUIOnboardingAffiliationCirclesDelegate)delegate;
- (SUUIOnboardingInstructionsView)instructionsView;
- (UIView)footerView;
- (double)_circleImageAlphaForAffinityCount:(int64_t)a3;
- (double)_topLayoutMargin;
- (double)maximumCircleDiameter;
- (id)circlesView:(id)a3 circleForIndex:(int64_t)a4;
- (int64_t)_titlePositionForAffinityCount:(int64_t)a3;
- (int64_t)numberOfCirclesInCircleView:(id)a3;
- (void)_cancelDeletionTimer;
- (void)_completeDeletionForCircleAtIndex:(int64_t)a3;
- (void)_reloadRepellors;
- (void)_sendAffilationItemsDidChange;
- (void)addAffiliationItems:(id)a3;
- (void)circleView:(id)a3 didBeginLongPressForCircleAtIndex:(int64_t)a4;
- (void)circleView:(id)a3 didEndLongPressForCircleAtIndex:(int64_t)a4;
- (void)circleView:(id)a3 didTapCircleAtIndex:(int64_t)a4;
- (void)dealloc;
- (void)loadView;
- (void)performFinishAnimationWithCompletionBlock:(id)a3;
- (void)removeAffiliationItemsInIndexSet:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)resetWithAffiliationItems:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)setAffiliationItems:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setFooterView:(id)a3 animated:(BOOL)a4;
- (void)setImage:(id)a3 forAffiliationItem:(id)a4;
- (void)setUserAffinityCount:(int64_t)a3 forAffiliationItemAtIndex:(int64_t)a4 animated:(BOOL)a5 completionBlock:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUUIOnboardingAffiliationCirclesViewController

- (void)dealloc
{
  deletionTimer = self->_deletionTimer;
  if (deletionTimer) {
    dispatch_source_cancel(deletionTimer);
  }
  [(SUUIPhysicalCirclesView *)self->_circlesView setDataSource:0];
  [(SUUIPhysicalCirclesView *)self->_circlesView setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)SUUIOnboardingAffiliationCirclesViewController;
  [(SUUIOnboardingAffiliationCirclesViewController *)&v4 dealloc];
}

- (void)addAffiliationItems:(id)a3
{
  affiliationItems = self->_affiliationItems;
  id v5 = a3;
  [(NSMutableArray *)affiliationItems addObjectsFromArray:v5];
  circlesView = self->_circlesView;
  uint64_t v7 = [v5 count];

  [(SUUIPhysicalCirclesView *)circlesView addCirclesWithCount:v7];
}

- (SUUIOnboardingInstructionsView)instructionsView
{
  instructionsView = self->_instructionsView;
  if (!instructionsView)
  {
    objc_super v4 = [SUUIOnboardingInstructionsView alloc];
    [(SUUIPhysicalCirclesView *)self->_circlesView bounds];
    id v5 = -[SUUIOnboardingInstructionsView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_instructionsView;
    self->_instructionsView = v5;

    [(SUUIOnboardingInstructionsView *)self->_instructionsView setAutoresizingMask:18];
    uint64_t v7 = self->_instructionsView;
    v8 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIOnboardingInstructionsView *)v7 setBackgroundColor:v8];

    [(SUUIOnboardingInstructionsView *)self->_instructionsView setContentPosition:1];
    [(SUUIOnboardingInstructionsView *)self->_instructionsView setUserInteractionEnabled:0];
    instructionsView = self->_instructionsView;
  }
  return instructionsView;
}

- (double)maximumCircleDiameter
{
  v2 = [(SUUIOnboardingAffiliationCirclesViewController *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return dbl_2568A08E0[v3];
}

- (void)performFinishAnimationWithCompletionBlock:(id)a3
{
  objc_super v4 = (void (**)(id, id))a3;
  id v5 = objc_alloc_init(MEMORY[0x263F089C8]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  affiliationItems = self->_affiliationItems;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke;
  v38[3] = &unk_265400AA0;
  id v8 = v5;
  id v39 = v8;
  id v9 = v6;
  id v40 = v9;
  [(NSMutableArray *)affiliationItems enumerateObjectsUsingBlock:v38];
  if (self->_didPerformFinishAnimation)
  {
    if (v4) {
      v4[2](v4, v9);
    }
  }
  else
  {
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v11 = (void *)MEMORY[0x263F82E00];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_2;
    v37[3] = &unk_265400980;
    v37[4] = self;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_3;
    v35[3] = &unk_265400AC8;
    v12 = v10;
    v36 = v12;
    [v11 animateWithDuration:v37 animations:v35 completion:0.25];
    if ([v9 count])
    {
      [(UIView *)self->_footerView frame];
      *(float *)&double v14 = v14 + v13 * 0.5;
      double v15 = floorf(*(float *)&v14);
      *(float *)&double v14 = v17 + v16 * 0.5;
      double v18 = floorf(*(float *)&v14);
      circlesView = self->_circlesView;
      v20 = [(UIView *)self->_footerView superview];
      -[SUUIPhysicalCirclesView convertPoint:fromView:](circlesView, "convertPoint:fromView:", v20, v15, v18);
      double v22 = v21;
      double v24 = v23;

      dispatch_group_enter(v12);
      v25 = self->_circlesView;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_4;
      v33[3] = &unk_265400AC8;
      v34 = v12;
      -[SUUIPhysicalCirclesView removeCirclesInIndexSet:byAnimatingToPoint:delay:completionBlock:](v25, "removeCirclesInIndexSet:byAnimatingToPoint:delay:completionBlock:", v8, v33, v22, v24, 0.25);
    }
    dispatch_group_enter(v12);
    v26 = self->_circlesView;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_5;
    v31[3] = &unk_265400AC8;
    v32 = v12;
    v27 = v12;
    [(SUUIPhysicalCirclesView *)v26 removeAllCirclesAnimated:1 completionBlock:v31];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_6;
    block[3] = &unk_265400AF0;
    v30 = v4;
    id v29 = v9;
    dispatch_group_notify(v27, MEMORY[0x263EF83A0], block);
    self->_didPerformFinishAnimation = 1;
  }
}

void __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 userAffinityCount] >= 1)
  {
    [*(id *)(a1 + 32) addIndex:a3];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

uint64_t __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1040) setAlpha:0.0];
}

void __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_3(uint64_t a1)
{
}

void __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_4(uint64_t a1)
{
}

void __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_5(uint64_t a1)
{
}

uint64_t __92__SUUIOnboardingAffiliationCirclesViewController_performFinishAnimationWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)removeAffiliationItemsInIndexSet:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  affiliationItems = self->_affiliationItems;
  id v9 = a5;
  id v10 = a3;
  [(NSMutableArray *)affiliationItems removeObjectsAtIndexes:v10];
  [(SUUIPhysicalCirclesView *)self->_circlesView removeCirclesInIndexSet:v10 animated:v5 completionBlock:v9];
}

- (void)resetWithAffiliationItems:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (self->_didPerformFinishAnimation)
  {
    if (v9) {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    circlesView = self->_circlesView;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __101__SUUIOnboardingAffiliationCirclesViewController_resetWithAffiliationItems_animated_completionBlock___block_invoke;
    v12[3] = &unk_265400B18;
    objc_copyWeak(&v15, &location);
    id v13 = v8;
    id v14 = v10;
    [(SUUIPhysicalCirclesView *)circlesView removeAllCirclesAnimated:v6 completionBlock:v12];
    self->_didPerformFinishAnimation = 1;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

uint64_t __101__SUUIOnboardingAffiliationCirclesViewController_resetWithAffiliationItems_animated_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (*(void *)(a1 + 32)) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = MEMORY[0x263EFFA68];
  }
  [WeakRetained setAffiliationItems:v4];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)setAffiliationItems:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  affiliationItems = self->_affiliationItems;
  if (affiliationItems != v4)
  {
    BOOL v6 = v4;
    if (v4)
    {
      uint64_t v4 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v4 copyItems:1];
      affiliationItems = self->_affiliationItems;
    }
    self->_affiliationItems = v4;

    [(SUUIPhysicalCirclesView *)self->_circlesView reloadData];
    self->_didPerformFinishAnimation = 0;
    uint64_t v4 = v6;
  }
}

- (void)setFooterView:(id)a3
{
}

- (void)setFooterView:(id)a3 animated:(BOOL)a4
{
  BOOL v6 = (UIView *)a3;
  p_footerView = &self->_footerView;
  footerView = self->_footerView;
  id v10 = v6;
  if (footerView != v6)
  {
    [(UIView *)footerView removeFromSuperview];
    objc_storeStrong((id *)&self->_footerView, a3);
    if (*p_footerView)
    {
      id v9 = [(SUUIOnboardingAffiliationCirclesViewController *)self view];
      [v9 addSubview:*p_footerView];
      [v9 setNeedsLayout];
    }
  }
}

- (void)setImage:(id)a3 forAffiliationItem:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableArray *)self->_affiliationItems indexOfObject:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(SUUIPhysicalCirclesView *)self->_circlesView circleViewAtIndex:v7];
    [v8 setBackgroundImage:v12];
    images = self->_images;
    if (v12)
    {
      if (!images)
      {
        id v10 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
        v11 = self->_images;
        self->_images = v10;

        images = self->_images;
      }
      -[NSMapTable setObject:forKey:](images, "setObject:forKey:");
    }
    else
    {
      [(NSMapTable *)images removeObjectForKey:v6];
    }
  }
}

- (void)setUserAffinityCount:(int64_t)a3 forAffiliationItemAtIndex:(int64_t)a4 animated:(BOOL)a5 completionBlock:(id)a6
{
  id v10 = a6;
  v11 = [(NSMutableArray *)self->_affiliationItems objectAtIndex:a4];
  [v11 setUserAffinityCount:a3];
  [(SUUIOnboardingAffiliationCirclesViewController *)self _circleSizeForAffinityCount:a3];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  -[SUUIPhysicalCirclesView setSize:forCircleAtIndex:](self->_circlesView, "setSize:forCircleAtIndex:", a4);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__SUUIOnboardingAffiliationCirclesViewController_setUserAffinityCount_forAffiliationItemAtIndex_animated_completionBlock___block_invoke;
  aBlock[3] = &unk_265400B40;
  aBlock[4] = self;
  aBlock[5] = a4;
  aBlock[6] = v13;
  aBlock[7] = v15;
  aBlock[8] = a3;
  double v16 = _Block_copy(aBlock);
  double v17 = v16;
  if (a5)
  {
    double v18 = +[SUUISimpleAnimationFactory backOutTimingFunction];
    v19 = +[SUUISimpleAnimationFactory factoryWithTimingFunction:v18];

    v20 = (void *)MEMORY[0x263F82E00];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __122__SUUIOnboardingAffiliationCirclesViewController_setUserAffinityCount_forAffiliationItemAtIndex_animated_completionBlock___block_invoke_2;
    v21[3] = &unk_265400B68;
    id v22 = v10;
    [v20 _animateWithDuration:0 delay:v19 options:v17 factory:v21 animations:0.3 completion:0.1];
  }
  else
  {
    (*((void (**)(void *))v16 + 2))(v16);
  }
}

void __122__SUUIOnboardingAffiliationCirclesViewController_setUserAffinityCount_forAffiliationItemAtIndex_animated_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 984) circleViewAtIndex:*(void *)(a1 + 40)];
  [v2 bounds];
  objc_msgSend(v2, "setBounds:");
  objc_msgSend(v2, "setTitlePosition:", objc_msgSend(*(id *)(a1 + 32), "_titlePositionForAffinityCount:", *(void *)(a1 + 64)));
  [*(id *)(a1 + 32) _circleImageAlphaForAffinityCount:*(void *)(a1 + 64)];
  objc_msgSend(v2, "setBackgroundImageAlpha:");
  [v2 layoutIfNeeded];
  [v2 setNeedsDisplay];
}

uint64_t __122__SUUIOnboardingAffiliationCirclesViewController_setUserAffinityCount_forAffiliationItemAtIndex_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  uint64_t v4 = [MEMORY[0x263F825C8] whiteColor];
  [v3 setBackgroundColor:v4];

  if (!self->_circlesView)
  {
    BOOL v5 = objc_alloc_init(SUUIPhysicalCirclesView);
    circlesView = self->_circlesView;
    self->_circlesView = v5;

    [(SUUIPhysicalCirclesView *)self->_circlesView setAutoresizingMask:18];
    uint64_t v7 = self->_circlesView;
    id v8 = [MEMORY[0x263F825C8] whiteColor];
    [(SUUIPhysicalCirclesView *)v7 setBackgroundColor:v8];

    [(SUUIPhysicalCirclesView *)self->_circlesView setDataSource:self];
    [(SUUIPhysicalCirclesView *)self->_circlesView setDelegate:self];
    self->_needsReloadOnDidAppear = 1;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [(SUUIOnboardingAffiliationCirclesViewController *)self traitCollection];
  SUUIPhysicalCircleConstantsWithTraitCollection(v9, (uint64_t)&v16);

  [(SUUIOnboardingAffiliationCirclesViewController *)self _circleSizeForAffinityCount:0];
  *((void *)&v17 + 1) = v10;
  [(SUUIOnboardingAffiliationCirclesViewController *)self _circleSizeForAffinityCount:2];
  *(void *)&long long v17 = v11;
  uint64_t v12 = self->_circlesView;
  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  v15[3] = v19;
  [(SUUIPhysicalCirclesView *)v12 setConstants:v15];
  uint64_t v13 = self->_circlesView;
  [v3 bounds];
  -[SUUIPhysicalCirclesView setFrame:](v13, "setFrame:");
  [v3 addSubview:self->_circlesView];
  uint64_t v14 = [(SUUIOnboardingAffiliationCirclesViewController *)self instructionsView];
  [v3 bounds];
  objc_msgSend(v14, "setFrame:");
  [v3 addSubview:v14];
  [(SUUIOnboardingAffiliationCirclesViewController *)self setView:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIOnboardingAffiliationCirclesViewController *)self _reloadRepellors];
  [(SUUIPhysicalCirclesView *)self->_circlesView startPhysics];
  self->_didPerformFinishAnimation = 0;
  if (self->_needsReloadOnDidAppear)
  {
    [(SUUIPhysicalCirclesView *)self->_circlesView reloadData];
    self->_needsReloadOnDidAppear = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SUUIOnboardingAffiliationCirclesViewController;
  [(SUUIOnboardingAffiliationCirclesViewController *)&v5 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIPhysicalCirclesView *)self->_circlesView stopPhysics];
  v5.receiver = self;
  v5.super_class = (Class)SUUIOnboardingAffiliationCirclesViewController;
  [(SUUIOnboardingAffiliationCirclesViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  BOOL v3 = [(SUUIOnboardingAffiliationCirclesViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(SUUIOnboardingAffiliationCirclesViewController *)self _topLayoutMargin];
  double v9 = v8;
  footerView = self->_footerView;
  if (footerView)
  {
    [(UIView *)footerView frame];
    -[UIView sizeThatFits:](self->_footerView, "sizeThatFits:", v5, 1.79769313e308);
    double v12 = v11;
    double v14 = fmax(v13, 375.0);
    if (v5 >= 375.0) {
      double v15 = v14;
    }
    else {
      double v15 = v5;
    }
    float v16 = (v5 - v15) * 0.5;
    double v17 = floorf(v16);
    double v18 = v7 + -20.0 - v11;
    long long v19 = self->_footerView;
    CGRect v21 = CGRectIntegral(*(CGRect *)(&v12 - 3));
    -[UIView setFrame:](v19, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  }
  -[SUUIOnboardingInstructionsView setContentInset:](self->_instructionsView, "setContentInset:", v9, 20.0, 20.0, 20.0);
  [(SUUIOnboardingAffiliationCirclesViewController *)self _reloadRepellors];
  v20.receiver = self;
  v20.super_class = (Class)SUUIOnboardingAffiliationCirclesViewController;
  [(SUUIOnboardingAffiliationCirclesViewController *)&v20 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIOnboardingInstructionsView *)self->_instructionsView setAlpha:1.0];
  v5.receiver = self;
  v5.super_class = (Class)SUUIOnboardingAffiliationCirclesViewController;
  [(SUUIOnboardingAffiliationCirclesViewController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SUUIOnboardingAffiliationCirclesViewController *)self transitionCoordinator];

  self->_needsReloadOnDidAppear = v5 != 0;
  v6.receiver = self;
  v6.super_class = (Class)SUUIOnboardingAffiliationCirclesViewController;
  [(SUUIOnboardingAffiliationCirclesViewController *)&v6 viewWillDisappear:v3];
}

- (id)circlesView:(id)a3 circleForIndex:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(NSMutableArray *)self->_affiliationItems objectAtIndex:a4];
  uint64_t v8 = [v7 userAffinityCount];
  [(SUUIOnboardingAffiliationCirclesViewController *)self _circleSizeForAffinityCount:v8];
  double v11 = -[SUUIOnboardingCircleView initWithFrame:]([SUUIOnboardingCircleView alloc], "initWithFrame:", 0.0, 0.0, v9, v10);
  double v12 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIOnboardingCircleView *)v11 setBackgroundColor:v12];

  -[SUUIOnboardingCircleView setEdgeInsets:](v11, "setEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
  [(SUUIOnboardingAffiliationCirclesViewController *)self _circleSizeForAffinityCount:0];
  -[SUUIOnboardingCircleView setMinimumDiameter:](v11, "setMinimumDiameter:");
  [(SUUIOnboardingCircleView *)v11 setTitlePosition:[(SUUIOnboardingAffiliationCirclesViewController *)self _titlePositionForAffinityCount:v8]];
  double v13 = [v7 fillColor];
  if (v13)
  {
    [(SUUIOnboardingCircleView *)v11 setFillColor:v13];
  }
  else
  {
    double v14 = [v6 tintColor];
    [(SUUIOnboardingCircleView *)v11 setFillColor:v14];
  }
  [(SUUIOnboardingAffiliationCirclesViewController *)self _circleImageAlphaForAffinityCount:v8];
  -[SUUIOnboardingCircleView setBackgroundImageAlpha:](v11, "setBackgroundImageAlpha:");
  double v15 = [(NSMapTable *)self->_images objectForKey:v7];
  [(SUUIOnboardingCircleView *)v11 setBackgroundImage:v15];

  float v16 = [(SUUIOnboardingCircleView *)v11 titleLabel];
  double v17 = [v7 title];
  [v16 setText:v17];

  return v11;
}

- (int64_t)numberOfCirclesInCircleView:(id)a3
{
  return [(NSMutableArray *)self->_affiliationItems count];
}

- (void)circleView:(id)a3 didBeginLongPressForCircleAtIndex:(int64_t)a4
{
  [(SUUIOnboardingAffiliationCirclesViewController *)self _cancelDeletionTimer];
  id v6 = self->_instructionsView;
  [(SUUIOnboardingInstructionsView *)v6 pushLabelState];
  double v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  deletionTimer = self->_deletionTimer;
  self->_deletionTimer = v7;

  dispatch_source_set_timer((dispatch_source_t)self->_deletionTimer, 0, 0x3B9ACA00uLL, 0);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 2;
  objc_initWeak(&location, self);
  double v9 = self->_deletionTimer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __95__SUUIOnboardingAffiliationCirclesViewController_circleView_didBeginLongPressForCircleAtIndex___block_invoke;
  v11[3] = &unk_265400B90;
  double v13 = v16;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a4;
  v11[4] = self;
  double v12 = v6;
  double v10 = v6;
  dispatch_source_set_event_handler(v9, v11);
  dispatch_resume((dispatch_object_t)self->_deletionTimer);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(v16, 8);
}

void __95__SUUIOnboardingAffiliationCirclesViewController_circleView_didBeginLongPressForCircleAtIndex___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id WeakRetained = objc_alloc_init(MEMORY[0x263F08A30]);
    [WeakRetained setNumberStyle:1];
    id v2 = *(void **)(*(void *)(a1 + 32) + 992);
    if (v2) {
      [v2 localizedStringForKey:@"REMOVE_ITEM_%@" inTable:@"Onboarding"];
    }
    else {
    BOOL v3 = +[SUUIClientContext localizedStringForKey:@"REMOVE_ITEM_%@" inBundles:0 inTable:@"Onboarding"];
    }
    double v4 = NSString;
    objc_super v5 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    id v6 = [WeakRetained stringFromNumber:v5];
    double v7 = [v4 stringWithValidatedFormat:v3, @"%@", 0, v6 validFormatSpecifiers error];

    uint64_t v8 = [*(id *)(a1 + 40) titleLabel];
    double v9 = [(id)objc_opt_class() titleAttributedStringWithString:v7];
    [v8 setAttributedText:v9];

    [*(id *)(a1 + 40) setNeedsLayout];
    --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _completeDeletionForCircleAtIndex:*(void *)(a1 + 64)];
  }
}

- (void)circleView:(id)a3 didEndLongPressForCircleAtIndex:(int64_t)a4
{
  [(SUUIOnboardingInstructionsView *)self->_instructionsView popLabelState];
  objc_super v5 = [(SUUIOnboardingAffiliationCirclesViewController *)self view];
  [v5 setNeedsLayout];

  [(SUUIOnboardingAffiliationCirclesViewController *)self _cancelDeletionTimer];
}

- (void)circleView:(id)a3 didTapCircleAtIndex:(int64_t)a4
{
  id v9 = [(SUUIOnboardingAffiliationCirclesViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();
  double v7 = [(NSMutableArray *)self->_affiliationItems objectAtIndex:a4];
  uint64_t v8 = v7;
  if (v6)
  {
    [v9 onboardingCircles:self didSelectAffiliationItem:v7 atIndex:a4];
  }
  else
  {
    -[SUUIOnboardingAffiliationCirclesViewController setUserAffinityCount:forAffiliationItemAtIndex:animated:completionBlock:](self, "setUserAffinityCount:forAffiliationItemAtIndex:animated:completionBlock:", ([v7 userAffinityCount] + 1) % 3, a4, 1, 0);
    [(SUUIOnboardingAffiliationCirclesViewController *)self _reloadRepellors];
    [(SUUIOnboardingAffiliationCirclesViewController *)self _sendAffilationItemsDidChange];
  }
}

- (void)_cancelDeletionTimer
{
  deletionTimer = self->_deletionTimer;
  if (deletionTimer)
  {
    dispatch_source_cancel(deletionTimer);
    double v4 = self->_deletionTimer;
    self->_deletionTimer = 0;
  }
}

- (double)_circleImageAlphaForAffinityCount:(int64_t)a3
{
  double result = 0.0;
  if (a3 == 1) {
    double result = 0.5;
  }
  if (a3 == 2) {
    return 1.0;
  }
  return result;
}

- (CGSize)_circleSizeForAffinityCount:(int64_t)a3
{
  double v4 = [(SUUIOnboardingAffiliationCirclesViewController *)self traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  if (v5 == 2)
  {
    if (a3 == 2)
    {
      double v6 = 180.0;
      goto LABEL_11;
    }
    if (a3 != 1)
    {
      double v6 = 120.0;
      goto LABEL_11;
    }
LABEL_8:
    double v6 = 150.0;
    goto LABEL_11;
  }
  if (a3 == 2) {
    goto LABEL_8;
  }
  if (a3 == 1) {
    double v6 = 110.0;
  }
  else {
    double v6 = 78.0;
  }
LABEL_11:
  double v7 = v6;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_completeDeletionForCircleAtIndex:(int64_t)a3
{
  -[NSMutableArray objectAtIndex:](self->_affiliationItems, "objectAtIndex:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_images, "removeObjectForKey:");
  [(NSMutableArray *)self->_affiliationItems removeObjectAtIndex:a3];
  [(SUUIPhysicalCirclesView *)self->_circlesView removeCircleAtIndex:a3 animated:1 completionBlock:0];
  [(SUUIOnboardingInstructionsView *)self->_instructionsView popLabelState];
  uint64_t v5 = [(SUUIOnboardingAffiliationCirclesViewController *)self view];
  [v5 setNeedsLayout];

  [(SUUIOnboardingAffiliationCirclesViewController *)self _cancelDeletionTimer];
  double v6 = [(SUUIOnboardingAffiliationCirclesViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 onboardingCircles:self didRemoveAffiliationItem:v7];
  }
  [(SUUIOnboardingAffiliationCirclesViewController *)self _sendAffilationItemsDidChange];
}

- (void)_reloadRepellors
{
  [(SUUIPhysicalCirclesView *)self->_circlesView bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SUUIPhysicalCirclesView *)self->_circlesView removeAllRepellors];
  footerView = self->_footerView;
  if (footerView)
  {
    [(UIView *)footerView frame];
    if (v12 > 0.00000011920929)
    {
      double v13 = v12;
      v37.origin.x = v4;
      v37.origin.y = v6;
      v37.size.width = v8;
      v37.size.height = v10;
      double v14 = floor(CGRectGetWidth(v37) * 0.5);
      v38.origin.x = v4;
      v38.origin.y = v6;
      v38.size.width = v8;
      v38.size.height = v10;
      double Height = CGRectGetHeight(v38);
      float v16 = [(SUUIOnboardingAffiliationCirclesViewController *)self bottomLayoutGuide];
      [v16 length];
      double v18 = Height - v17 + 90.0;

      id v19 = -[SUUIPhysicalCirclesView addRepellorWithCenter:radius:bufferSize:](self->_circlesView, "addRepellorWithCenter:radius:bufferSize:", v14, v18, ceil(v13 * 0.600000024), 20.0);
    }
  }
  v39.origin.x = v4;
  v39.origin.y = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  double v35 = ceil(CGRectGetWidth(v39) * 1.79999995);
  objc_super v20 = [(SUUIOnboardingInstructionsView *)self->_instructionsView explanationLabel];
  [v20 frame];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat rect = v10;
  CGFloat v27 = v4;
  CGFloat v29 = v28;

  v40.origin.x = v22;
  v40.origin.y = v24;
  v40.size.width = v26;
  v40.size.height = v29;
  CGFloat Width = CGRectGetWidth(v40);
  *(float *)&CGFloat Width = v35 * v35 - Width * 0.5 * (Width * 0.5);
  CGFloat v31 = v8;
  double v32 = sqrtf(*(float *)&Width);
  v41.origin.x = v22;
  v41.origin.y = v24;
  v41.size.width = v26;
  v41.size.height = v29;
  CGFloat v33 = CGRectGetMaxY(v41) - v32;
  v42.origin.x = v27;
  v42.origin.y = v6;
  v42.size.width = v31;
  v42.size.height = rect;
  id v34 = -[SUUIPhysicalCirclesView addRepellorWithCenter:radius:bufferSize:](self->_circlesView, "addRepellorWithCenter:radius:bufferSize:", floor(CGRectGetWidth(v42) * 0.5), v33, v35, 20.0);
}

- (void)_sendAffilationItemsDidChange
{
  id v3 = [(SUUIOnboardingAffiliationCirclesViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 onboardingCirclesDidChangeAffiliationItems:self];
  }
}

- (int64_t)_titlePositionForAffinityCount:(int64_t)a3
{
  return a3 != 0;
}

- (double)_topLayoutMargin
{
  id v2 = [(SUUIOnboardingAffiliationCirclesViewController *)self navigationController];
  double v3 = 13.0;
  if (v2)
  {
    CGFloat v4 = +[SUUINavigationControllerAssistant existingAssistantForNavigationController:v2];
    if (v4)
    {
      double v5 = v4;
      int v6 = [v4 hidesShadow];

      if (v6) {
        double v3 = 0.0;
      }
      else {
        double v3 = 13.0;
      }
    }
  }

  return v3;
}

- (NSArray)affiliationItems
{
  return &self->_affiliationItems->super;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIOnboardingAffiliationCirclesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIOnboardingAffiliationCirclesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsView, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_deletionTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_circlesView, 0);
  objc_storeStrong((id *)&self->_affiliationItems, 0);
}

@end