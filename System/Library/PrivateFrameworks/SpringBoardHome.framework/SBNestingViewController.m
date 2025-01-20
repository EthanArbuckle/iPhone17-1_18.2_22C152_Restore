@interface SBNestingViewController
- (BOOL)_shouldAddTransitioningViewControllerAfterCurrentTransitionCompletes;
- (BOOL)isTransitioning;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)wantsModalPresentation;
- (CGRect)frameForNestedViewController:(id)a3 afterOperation:(int64_t)a4 withParentContainerSize:(CGSize)a5;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NSArray)nestedViewControllers;
- (NSHashTable)transitionObservers;
- (SBNestingViewController)deepestNestedDescendantViewController;
- (SBNestingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBNestingViewController)nestedViewController;
- (SBNestingViewController)parentNestingViewController;
- (SBNestingViewController)viewControllerCurrentlyDrivingTransition;
- (SBNestingViewControllerDelegate)delegate;
- (SBViewControllerTransitionContext)currentTransition;
- (id)_descriptionForOperation:(int64_t)a3;
- (id)clientOperationCompletion;
- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6;
- (id)nestingViewController:(id)a3 interactionControllerForAnimationController:(id)a4;
- (id)nestingViewController:(id)a3 sourceViewForPresentingViewController:(id)a4;
- (id)transitionCoordinator;
- (int64_t)currentTransitionOperation;
- (void)_handleAddChildViewController:(id)a3;
- (void)_handleRemoveChildViewController:(id)a3;
- (void)_handleWillAddChildViewController:(id)a3;
- (void)_handleWillRemoveChildViewController:(id)a3;
- (void)_performOperation:(int64_t)a3 onViewController:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6;
- (void)_setFinalStateForTransitioningViewController:(id)a3;
- (void)_updateStateForTransitioningViewController:(id)a3;
- (void)addNestedViewController:(id)a3;
- (void)addTransitionObserver:(id)a3;
- (void)addViewToHierarchyForNestedViewController:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6;
- (void)nestingViewController:(id)a3 willPresentViewController:(id)a4;
- (void)popNestedViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)pushNestedViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)removeNestedViewController:(id)a3;
- (void)removeTransitionObserver:(id)a3;
- (void)removeViewFromHierarchyForNestedViewController:(id)a3;
- (void)setClientOperationCompletion:(id)a3;
- (void)setCurrentTransition:(id)a3;
- (void)setCurrentTransitionOperation:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setNestedViewController:(id)a3;
- (void)setNestedViewControllers:(id)a3 withCompletion:(id)a4;
- (void)setParentNestingViewController:(id)a3;
- (void)setTransitionObservers:(id)a3;
- (void)transitionDidFinish:(id)a3;
- (void)transitionDidReverse:(id)a3;
- (void)transitionWillFinish:(id)a3;
- (void)transitionWillReverse:(id)a3;
- (void)traverseNestedViewControllersWithBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 forOperation:(int64_t)a4 withTransitionCoordinator:(id)a5;
@end

@implementation SBNestingViewController

- (SBNestingViewController)nestedViewController
{
  return self->_nestedViewController;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 forOperation:(int64_t)a4 withTransitionCoordinator:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v19 = a5;
  v9 = [(SBNestingViewController *)self nestedViewController];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 view];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;

    -[SBNestingViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v10, width, height);
    if (v13 != v17 || v15 != v16) {
      objc_msgSend(v10, "viewWillTransitionToSize:forOperation:withTransitionCoordinator:", a4, v19);
    }
  }
}

- (SBNestingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBNestingViewControllerDelegate *)WeakRetained;
}

- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  double v12 = [(SBNestingViewController *)self delegate];
  if (v12 == self || (objc_opt_respondsToSelector() & 1) == 0)
  {
    double v13 = 0;
  }
  else
  {
    double v13 = [(SBNestingViewController *)v12 nestingViewController:v10 animationControllerForOperation:a4 onViewController:v11 animated:v6];
  }

  return v13;
}

- (void)transitionWillFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(SBNestingViewController *)self currentTransition];

  if (v5 == v4)
  {
    id v6 = [(SBNestingViewController *)self nestedViewController];
    [(SBNestingViewController *)self _setFinalStateForTransitioningViewController:v6];
  }
}

- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  double v13 = [(SBNestingViewController *)self delegate];
  if (v13 != self && (objc_opt_respondsToSelector() & 1) != 0) {
    [(SBNestingViewController *)v13 nestingViewController:v10 willPerformOperation:a4 onViewController:v11 withTransitionCoordinator:v12];
  }
  v21 = v13;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v14 = [(SBNestingViewController *)self transitionObservers];
  double v15 = (void *)[v14 copy];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(id *)(*((void *)&v22 + 1) + 8 * v19);
        if (objc_opt_respondsToSelector()) {
          [v20 nestingViewController:v10 willPerformOperation:a4 onViewController:v11 withTransitionCoordinator:v12];
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }
}

- (NSHashTable)transitionObservers
{
  return self->_transitionObservers;
}

- (void)_setFinalStateForTransitioningViewController:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(SBNestingViewController *)self _shouldAddTransitioningViewControllerAfterCurrentTransitionCompletes];
  id v5 = [v9 view];
  id v6 = [(SBNestingViewController *)self view];
  int v7 = [v5 isDescendantOfView:v6];

  if (v4)
  {
    if ((v7 & 1) == 0) {
      [(SBNestingViewController *)self addViewToHierarchyForNestedViewController:v9];
    }
    [v9 endAppearanceTransition];
    [(SBNestingViewController *)self _handleAddChildViewController:v9];
    v8 = [(SBNestingViewController *)self currentTransition];
    if ([v8 transitionWasCancelled]) {
      [v8 initialFrameForViewController:v9];
    }
    else {
      [v8 finalFrameForViewController:v9];
    }
    objc_msgSend(v5, "setFrame:");
  }
  else
  {
    if (v7) {
      [(SBNestingViewController *)self removeViewFromHierarchyForNestedViewController:v9];
    }
    [v9 endAppearanceTransition];
    [(SBNestingViewController *)self _handleRemoveChildViewController:v9];
    [v9 setDelegate:0];
    [v9 setParentNestingViewController:0];
    [(SBNestingViewController *)self setNestedViewController:0];
  }
}

- (BOOL)_shouldAddTransitioningViewControllerAfterCurrentTransitionCompletes
{
  v3 = [(SBNestingViewController *)self currentTransition];
  char v4 = [v3 transitionWasCancelled];

  int64_t v5 = [(SBNestingViewController *)self currentTransitionOperation];
  if ((v4 & 1) != 0 || v5 != 1)
  {
    if (v5 == 2) {
      LOBYTE(v5) = v4;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (SBViewControllerTransitionContext)currentTransition
{
  return self->_currentTransition;
}

- (int64_t)currentTransitionOperation
{
  return self->_currentTransitionOperation;
}

- (void)_performOperation:(int64_t)a3 onViewController:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = (SBNestingViewController *)a4;
  id v11 = a6;
  id v12 = v11;
  if (a3)
  {
    if (a3 == 1 && [(SBNestingViewController *)v10 wantsModalPresentation])
    {
      [(SBNestingViewController *)v10 setDelegate:self];
      [(SBNestingViewController *)v10 setParentNestingViewController:self];
      [(SBNestingViewController *)self nestingViewController:self willPresentViewController:v10];
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __86__SBNestingViewController__performOperation_onViewController_animated_withCompletion___block_invoke;
      v78[3] = &unk_1E6AAD4C8;
      id v79 = v12;
      [(SBNestingViewController *)self presentViewController:v10 animated:v7 completion:v78];
    }
    else
    {
      double v13 = [(SBNestingViewController *)self nestingViewController:self animationControllerForOperation:a3 onViewController:v10 animated:v7];
      double v14 = 0;
      if (v13 && v7)
      {
        double v14 = [(SBNestingViewController *)self nestingViewController:self interactionControllerForAnimationController:v13];
      }
      double v15 = objc_alloc_init(SBViewControllerTransitionContext);
      [(SBViewControllerTransitionContext *)v15 setDelegate:self];
      uint64_t v16 = [(SBNestingViewController *)self view];
      [(SBViewControllerTransitionContext *)v15 setContainerView:v16];

      [(SBViewControllerTransitionContext *)v15 setWantsAnimation:v7];
      [(SBViewControllerTransitionContext *)v15 setAnimator:v13];
      [(SBViewControllerTransitionContext *)v15 setInteractor:v14];
      uint64_t v17 = *MEMORY[0x1E4FB30B8];
      if (a3 == 1)
      {
        [(SBViewControllerTransitionContext *)v15 setViewController:self forKey:v17];
        [(SBViewControllerTransitionContext *)v15 setViewController:v10 forKey:*MEMORY[0x1E4FB30C8]];
        uint64_t v18 = [(SBNestingViewController *)v10 view];
        [(SBViewControllerTransitionContext *)v15 setView:v18 forKey:*MEMORY[0x1E4FB30D0]];

        uint64_t v19 = [(SBNestingViewController *)self view];
        [v19 bounds];
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;

        -[SBNestingViewController frameForNestedViewController:afterOperation:withParentContainerSize:](self, "frameForNestedViewController:afterOperation:withParentContainerSize:", v10, 2, v25, v27);
        double v74 = v29;
        double v76 = v28;
        double v70 = v31;
        double v72 = v30;
        -[SBNestingViewController frameForNestedViewController:afterOperation:withParentContainerSize:](self, "frameForNestedViewController:afterOperation:withParentContainerSize:", v10, 1, v25, v27);
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;
        -[SBViewControllerTransitionContext setInitialFrame:forViewController:](v15, "setInitialFrame:forViewController:", self, v21, v23, v25, v27);
        -[SBViewControllerTransitionContext setFinalFrame:forViewController:](v15, "setFinalFrame:forViewController:", self, v21, v23, v25, v27);
        -[SBViewControllerTransitionContext setInitialFrame:forViewController:](v15, "setInitialFrame:forViewController:", v10, v76, v74, v72, v70);
        v40 = v15;
        double v41 = v33;
        double v42 = v35;
        double v43 = v37;
        double v44 = v39;
        v45 = v10;
      }
      else
      {
        [(SBViewControllerTransitionContext *)v15 setViewController:v10 forKey:v17];
        [(SBViewControllerTransitionContext *)v15 setViewController:self forKey:*MEMORY[0x1E4FB30C8]];
        v46 = [(SBNestingViewController *)v10 view];
        [(SBViewControllerTransitionContext *)v15 setView:v46 forKey:*MEMORY[0x1E4FB30C0]];

        v47 = [(SBNestingViewController *)self view];
        [v47 bounds];
        double v75 = v49;
        double v77 = v48;
        double v51 = v50;
        double v53 = v52;

        -[SBNestingViewController frameForNestedViewController:afterOperation:withParentContainerSize:](self, "frameForNestedViewController:afterOperation:withParentContainerSize:", v10, 1, v51, v53);
        double v71 = v55;
        double v73 = v54;
        double v57 = v56;
        double v59 = v58;
        -[SBNestingViewController frameForNestedViewController:afterOperation:withParentContainerSize:](self, "frameForNestedViewController:afterOperation:withParentContainerSize:", v10, 2, v51, v53);
        double v61 = v60;
        double v63 = v62;
        double v65 = v64;
        double v67 = v66;
        -[SBViewControllerTransitionContext setInitialFrame:forViewController:](v15, "setInitialFrame:forViewController:", v10, v73, v71, v57, v59);
        -[SBViewControllerTransitionContext setFinalFrame:forViewController:](v15, "setFinalFrame:forViewController:", v10, v61, v63, v65, v67);
        -[SBViewControllerTransitionContext setInitialFrame:forViewController:](v15, "setInitialFrame:forViewController:", self, v77, v75, v51, v53);
        v40 = v15;
        double v41 = v77;
        double v42 = v75;
        double v43 = v51;
        double v44 = v53;
        v45 = self;
      }
      -[SBViewControllerTransitionContext setFinalFrame:forViewController:](v40, "setFinalFrame:forViewController:", v45, v41, v42, v43, v44);
      [(SBNestingViewController *)self nestingViewController:self willPerformOperation:a3 onViewController:v10 withTransitionCoordinator:v15];
      [(SBNestingViewController *)self setCurrentTransitionOperation:a3];
      [(SBNestingViewController *)self setCurrentTransition:v15];
      [(SBNestingViewController *)self setClientOperationCompletion:v12];
      [(SBNestingViewController *)self _updateStateForTransitioningViewController:v10];
      [(SBViewControllerTransitionContext *)v15 finalFrameForViewController:v10];
      -[SBNestingViewController viewWillTransitionToSize:forOperation:withTransitionCoordinator:](v10, "viewWillTransitionToSize:forOperation:withTransitionCoordinator:", a3, v15, v68, v69);
      [(SBViewControllerTransitionContext *)v15 startTransition];
    }
  }
  else if (v11)
  {
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
  }
}

- (CGRect)frameForNestedViewController:(id)a3 afterOperation:(int64_t)a4 withParentContainerSize:(CGSize)a5
{
  if (a4 == 1)
  {
    BSRectWithSize();
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)wantsModalPresentation
{
  return 0;
}

- (void)transitionDidFinish:(id)a3
{
  id v7 = a3;
  id v4 = [(SBNestingViewController *)self currentTransition];
  if (v4 == v7)
  {
    [(SBNestingViewController *)self setCurrentTransitionOperation:0];
    [v7 setDelegate:0];
    [(SBNestingViewController *)self setCurrentTransition:0];
    int v5 = [v7 transitionWasCancelled];
    double v6 = [(SBNestingViewController *)self clientOperationCompletion];
    if (v6)
    {
      [(SBNestingViewController *)self setClientOperationCompletion:0];
      v6[2](v6, v5 ^ 1u);
    }
  }
}

- (void)setCurrentTransitionOperation:(int64_t)a3
{
  self->_currentTransitionOperation = a3;
}

- (void)setCurrentTransition:(id)a3
{
}

- (void)setClientOperationCompletion:(id)a3
{
}

- (id)clientOperationCompletion
{
  return self->_clientOperationCompletion;
}

- (void)_updateStateForTransitioningViewController:(id)a3
{
  id v6 = a3;
  id v4 = [(SBNestingViewController *)self currentTransition];
  uint64_t v5 = [v4 isAnimated];

  if ([(SBNestingViewController *)self _shouldAddTransitioningViewControllerAfterCurrentTransitionCompletes])
  {
    [(SBNestingViewController *)self _handleWillAddChildViewController:v6];
    [v6 beginAppearanceTransition:1 animated:v5];
    [v6 setDelegate:self];
    [v6 setParentNestingViewController:self];
    [(SBNestingViewController *)self setNestedViewController:v6];
  }
  else
  {
    [(SBNestingViewController *)self _handleWillRemoveChildViewController:v6];
    [v6 beginAppearanceTransition:0 animated:v5];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setParentNestingViewController:(id)a3
{
}

- (void)setNestedViewController:(id)a3
{
}

- (void)_handleWillAddChildViewController:(id)a3
{
  id v5 = a3;
  id v4 = [v5 parentViewController];

  if (v4 == self) {
    [v5 willMoveToParentViewController:self];
  }
  else {
    [(SBNestingViewController *)self addChildViewController:v5];
  }
}

- (void)_handleAddChildViewController:(id)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBNestingViewController;
  [(SBNestingViewController *)&v5 viewDidDisappear:a3];
  id v4 = [(SBNestingViewController *)self nestedViewController];
  [v4 endAppearanceTransition];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBNestingViewController;
  -[SBNestingViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  objc_super v5 = [(SBNestingViewController *)self nestedViewController];
  [v5 beginAppearanceTransition:0 animated:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBNestingViewController;
  [(SBNestingViewController *)&v5 viewDidAppear:a3];
  id v4 = [(SBNestingViewController *)self nestedViewController];
  [v4 endAppearanceTransition];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBNestingViewController;
  -[SBNestingViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  objc_super v5 = [(SBNestingViewController *)self nestedViewController];
  [v5 beginAppearanceTransition:1 animated:v3];
}

- (SBNestingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBNestingViewController;
  id v4 = [(SBNestingViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    transitionObservers = v4->_transitionObservers;
    v4->_transitionObservers = (NSHashTable *)v5;
  }
  return v4;
}

- (void)pushNestedViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  objc_super v8 = (void (**)(id, void))a5;
  id v9 = [(SBNestingViewController *)self parentNestingViewController];

  if (v9)
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot modify the nested view controller stack via a non-root view controller" userInfo:0];
    objc_exception_throw(v14);
  }
  if ([(SBNestingViewController *)self isTransitioning])
  {
    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    uint64_t v10 = [(SBNestingViewController *)self deepestNestedDescendantViewController];
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (SBNestingViewController *)v10;
    }
    else {
      id v12 = self;
    }
    double v13 = v12;

    [(SBNestingViewController *)v13 _performOperation:1 onViewController:v15 animated:v6 withCompletion:v8];
  }
}

- (SBNestingViewController)parentNestingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNestingViewController);
  return (SBNestingViewController *)WeakRetained;
}

- (BOOL)isTransitioning
{
  v2 = [(SBNestingViewController *)self viewControllerCurrentlyDrivingTransition];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SBNestingViewController)deepestNestedDescendantViewController
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = __Block_byref_object_copy__23;
  id v9 = __Block_byref_object_dispose__23;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SBNestingViewController_deepestNestedDescendantViewController__block_invoke;
  v4[3] = &unk_1E6AB50B0;
  v4[4] = &v5;
  [(SBNestingViewController *)self traverseNestedViewControllersWithBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SBNestingViewController *)v2;
}

- (SBNestingViewController)viewControllerCurrentlyDrivingTransition
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__23;
  id v12 = __Block_byref_object_dispose__23;
  if ([(SBNestingViewController *)self currentTransitionOperation]) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }
  double v13 = v3;
  id v4 = (void *)v9[5];
  if (!v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__SBNestingViewController_viewControllerCurrentlyDrivingTransition__block_invoke;
    v7[3] = &unk_1E6AB50B0;
    v7[4] = &v8;
    [(SBNestingViewController *)self traverseNestedViewControllersWithBlock:v7];
    id v4 = (void *)v9[5];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (SBNestingViewController *)v5;
}

- (void)traverseNestedViewControllersWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  char v8 = 0;
  uint64_t v5 = [(SBNestingViewController *)self nestedViewController];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    do
    {
      v4[2](v4, v6, &v8);
      if (v8) {
        break;
      }
      uint64_t v7 = [v6 nestedViewController];

      BOOL v6 = (void *)v7;
    }
    while (v7);
  }
}

- (void)popNestedViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  BOOL v6 = [(SBNestingViewController *)self parentNestingViewController];

  if (v6)
  {
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot modify the nested view controller stack via a non-root view controller" userInfo:0];
    objc_exception_throw(v10);
  }
  if ([(SBNestingViewController *)self isTransitioning])
  {
    uint64_t v7 = v11;
    if (!v11) {
      goto LABEL_7;
    }
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  else
  {
    char v8 = [(SBNestingViewController *)self deepestNestedDescendantViewController];
    id v9 = [v8 parentNestingViewController];
    [v9 _performOperation:2 onViewController:v8 animated:v4 withCompletion:v11];
  }
  uint64_t v7 = v11;
LABEL_7:
}

- (void)setNestedViewControllers:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  char v8 = [(SBNestingViewController *)self parentNestingViewController];

  if (v8)
  {
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot modify the nested view controller stack via a non-root view controller" userInfo:0];
    objc_exception_throw(v25);
  }
  if (![(SBNestingViewController *)self isTransitioning])
  {
    id v9 = [(SBNestingViewController *)self nestedViewControllers];
    unint64_t v10 = [v9 count];
    unint64_t v11 = [v6 count];
    if (v10 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      for (unint64_t i = 0; i < v12; ++i)
      {
        id v14 = [v9 objectAtIndex:i];
        id v15 = [v6 objectAtIndex:i];
        int v16 = [v14 isEqual:v15];

        if (!v16) {
          unint64_t v12 = i;
        }
      }
    }
    uint64_t v17 = [v9 count];
    unint64_t v18 = v17 - v12;
    if (v17 == v12)
    {
      if (v12 >= [v6 count])
      {
        if (v7) {
          v7[2](v7, 1);
        }
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      unint64_t v20 = 1;
      do
      {
        v29[0] = v19;
        v29[1] = 3221225472;
        v29[2] = __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_3;
        v29[3] = &unk_1E6AB5038;
        v29[4] = self;
        LODWORD(v17) = __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke(v17, v29);
        if (!v17) {
          break;
        }
      }
      while (v20++ < v18);
      if (!v17)
      {
        BOOL v23 = 0;
        if (!v7)
        {
LABEL_28:

          goto LABEL_29;
        }
LABEL_27:
        v7[2](v7, v23);
        goto LABEL_28;
      }
    }
    do
    {
      unint64_t v22 = [v6 count];
      BOOL v23 = v12 >= v22;
      if (v12 >= v22) {
        break;
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_4;
      v26[3] = &unk_1E6AB5060;
      v26[4] = self;
      id v27 = v6;
      unint64_t v28 = v12;
      BOOL v24 = __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke((uint64_t)v27, v26);

      ++v12;
    }
    while (v24);
    if (!v7) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v7) {
    v7[2](v7, 0);
  }
LABEL_29:
}

BOOL __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_2;
  v5[3] = &unk_1E6AB13A8;
  v5[4] = &v6;
  v2[2](v2, v5);
  BOOL v3 = *((_DWORD *)v7 + 6) == 1;
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) popNestedViewControllerAnimated:0 withCompletion:a2];
}

void __67__SBNestingViewController_setNestedViewControllers_withCompletion___block_invoke_4(void *a1, void *a2)
{
  id v2 = (void *)a1[4];
  BOOL v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  id v5 = a2;
  id v6 = [v3 objectAtIndex:v4];
  [v2 pushNestedViewController:v6 animated:0 withCompletion:v5];
}

- (NSArray)nestedViewControllers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SBNestingViewController_nestedViewControllers__block_invoke;
  v7[3] = &unk_1E6AB5088;
  id v8 = v3;
  id v4 = v3;
  [(SBNestingViewController *)self traverseNestedViewControllersWithBlock:v7];
  id v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

uint64_t __48__SBNestingViewController_nestedViewControllers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __64__SBNestingViewController_deepestNestedDescendantViewController__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  id v6 = [v7 nestedViewController];

  if (!v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)addTransitionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SBNestingViewController *)self transitionObservers];
  [v5 addObject:v4];
}

- (void)removeTransitionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SBNestingViewController *)self transitionObservers];
  [v5 removeObject:v4];
}

void __67__SBNestingViewController_viewControllerCurrentlyDrivingTransition__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 currentTransitionOperation])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)addNestedViewController:(id)a3
{
  id v4 = a3;
  [(SBNestingViewController *)self _handleWillAddChildViewController:v4];
  [v4 setDelegate:self];
  [v4 setParentNestingViewController:self];
}

- (void)removeNestedViewController:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:0];
  [v4 setParentNestingViewController:0];
  [(SBNestingViewController *)self _handleRemoveChildViewController:v4];
}

- (void)addViewToHierarchyForNestedViewController:(id)a3
{
  id v4 = a3;
  id v6 = [(SBNestingViewController *)self view];
  id v5 = [v4 view];

  [v6 addSubview:v5];
}

- (void)removeViewFromHierarchyForNestedViewController:(id)a3
{
  id v3 = [a3 view];
  [v3 removeFromSuperview];
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[SBNestingViewController frameForNestedViewController:afterOperation:withParentContainerSize:](self, "frameForNestedViewController:afterOperation:withParentContainerSize:", v7, 1, width, height);
    double width = v8;
    double height = v9;
  }

  double v10 = width;
  double v11 = height;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (id)transitionCoordinator
{
  id v2 = [(SBNestingViewController *)self viewControllerCurrentlyDrivingTransition];
  id v3 = [v2 currentTransition];

  return v3;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__SBNestingViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_1E6AB50D8;
  BOOL v11 = v4;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)SBNestingViewController;
  id v7 = v6;
  [(SBNestingViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

uint64_t __68__SBNestingViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nestedViewController];

  if (v2) {
    [*(id *)(a1 + 32) popNestedViewControllerAnimated:*(unsigned __int8 *)(a1 + 48) withCompletion:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)nestingViewController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(SBNestingViewController *)self delegate];
  if (v8 == self || (objc_opt_respondsToSelector() & 1) == 0)
  {
    double v9 = 0;
  }
  else
  {
    double v9 = [(SBNestingViewController *)v8 nestingViewController:v6 interactionControllerForAnimationController:v7];
  }

  return v9;
}

- (void)nestingViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5 = a4;
  id v7 = [(SBNestingViewController *)self nestingViewController:self sourceViewForPresentingViewController:v5];
  id v6 = [v5 popoverPresentationController];

  [v6 setSourceView:v7];
  [v7 bounds];
  objc_msgSend(v6, "setSourceRect:");
  [v6 setCanOverlapSourceViewRect:1];
}

- (id)nestingViewController:(id)a3 sourceViewForPresentingViewController:(id)a4
{
  return (id)[a3 view];
}

- (void)transitionWillReverse:(id)a3
{
  id v9 = a3;
  id v4 = [(SBNestingViewController *)self currentTransition];

  id v5 = v9;
  if (v4 == v9)
  {
    int v6 = [v9 isCancelled];
    id v5 = v9;
    if (v6)
    {
      id v7 = [v9 animator];
      objc_super v8 = [(SBNestingViewController *)self nestingViewController:self interactionControllerForAnimationController:v7];

      [v9 setInteractor:v8];
      id v5 = v9;
    }
  }
}

- (void)transitionDidReverse:(id)a3
{
  id v4 = a3;
  id v5 = [(SBNestingViewController *)self currentTransition];

  if (v5 == v4)
  {
    id v6 = [(SBNestingViewController *)self nestedViewController];
    [(SBNestingViewController *)self _updateStateForTransitioningViewController:v6];
  }
}

uint64_t __86__SBNestingViewController__performOperation_onViewController_animated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_handleWillRemoveChildViewController:(id)a3
{
}

- (void)_handleRemoveChildViewController:(id)a3
{
  id v5 = a3;
  id v4 = [v5 parentViewController];

  if (v4 == self) {
    [v5 removeFromParentViewController];
  }
  else {
    [v5 didMoveToParentViewController:0];
  }
}

- (id)_descriptionForOperation:(int64_t)a3
{
  id v3 = @"none";
  if (a3 == 2) {
    id v3 = @"pop";
  }
  if (a3 == 1) {
    return @"push";
  }
  else {
    return v3;
  }
}

- (void)setTransitionObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionObservers, 0);
  objc_storeStrong(&self->_clientOperationCompletion, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_nestedViewController, 0);
  objc_destroyWeak((id *)&self->_parentNestingViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end