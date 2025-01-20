@interface PXGViewControllerTransition
+ (PXGViewControllerTransition)transitionWithDetailViewController:(id)a3;
+ (id)_createTransitionWithSummaryViewController:(id)a3 presentedViewController:(id)a4 detailViewController:(id)a5;
+ (id)_transitionWithDetailViewController:(id)a3 createIfNeeded:(BOOL)a4 verticalOnly:(BOOL)a5;
+ (id)interactiveDismissalOfDetailViewController:(id)a3;
+ (void)prepareDismissalOfDetailViewController:(id)a3;
+ (void)prepareTransitionFromSummaryViewController:(id)a3 toPresentedViewController:(id)a4 detailViewController:(id)a5;
- (BOOL)_isContentViewControllerHidden:(id)a3;
- (BOOL)_isTransitionAllowedWithKind:(int64_t)a3;
- (BOOL)isEnding;
- (BOOL)isInteractive;
- (BOOL)isVerticalOnly;
- (CGRect)_rectInContainerView:(id)a3 fromRect:(CGRect)a4 inCoordinateSpace:(id)a5 inContentViewController:(id)a6;
- (NSArray)endPointInfos;
- (NSMutableArray)alongsideAnimationBlocks;
- (PXDisplayLink)displayLink;
- (PXGItemPlacement)detailItemOriginalPlacement;
- (PXGItemPlacement)detailItemPlacementOverride;
- (PXGItemPlacement)summaryItemOriginalPlacement;
- (PXGItemPlacement)summaryItemPlacementOverride;
- (PXGViewControllerItemPlacementInterpolator)itemPlacementInterpolator;
- (PXGViewControllerTransition)init;
- (PXGViewControllerTransitionEndPoint)detailEndPoint;
- (PXGViewControllerTransitionEndPoint)summaryEndPoint;
- (UIPercentDrivenInteractiveTransition)interactiveTransition;
- (UIView)fromContentView;
- (UIView)toContentView;
- (UIViewController)detailViewController;
- (UIViewController)presentedViewController;
- (UIViewController)presentingViewController;
- (UIViewController)summaryViewController;
- (UIViewControllerContextTransitioning)transitionContext;
- (_PXGTransitionEndPointInfo)detailEndPointInfo;
- (_PXGTransitionEndPointInfo)summaryEndPointInfo;
- (double)_progressForFractionCompleted:(double)a3;
- (double)fractionCompleted;
- (double)transitionDuration;
- (double)transitionDuration:(id)a3;
- (id)_initWithSummaryViewController:(id)a3 presentedViewController:(id)a4 detailViewController:(id)a5;
- (id)_transitionViewControllerForContentViewController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)animationUpdateBlock;
- (id)completionHandler;
- (id)interactionControllerForDismissal:(id)a3;
- (id)interactionControllerForPresentation:(id)a3;
- (int64_t)transitionKind;
- (void)_endTransitionAnimation:(BOOL)a3;
- (void)_handleDisplayLink:(id)a3;
- (void)_notifyAlongsideAnimationBlocks:(double)a3;
- (void)_prepareTransitionAnimationWithReadinessHandler:(id)a3 completionHandler:(id)a4;
- (void)_transitionDidEnd:(BOOL)a3;
- (void)_transitionDidUpdateWithTransitionTime:(double)a3;
- (void)_transitionWillBegin;
- (void)_willDismissWithoutTransition;
- (void)animateAlongside:(id)a3;
- (void)animateTransition:(id)a3;
- (void)cancel;
- (void)finish;
- (void)installCompletionHandler:(id)a3;
- (void)performChanges:(id)a3;
- (void)setAnimationUpdateBlock:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDetailItemOriginalPlacement:(id)a3;
- (void)setDetailItemPlacementOverride:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setEndPointInfos:(id)a3;
- (void)setFractionCompleted:(double)a3;
- (void)setFromContentView:(id)a3;
- (void)setInteractiveTransition:(id)a3;
- (void)setIsEnding:(BOOL)a3;
- (void)setIsInteractive:(BOOL)a3;
- (void)setIsVerticalOnly:(BOOL)a3;
- (void)setItemPlacementInterpolator:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSummaryItemOriginalPlacement:(id)a3;
- (void)setSummaryItemPlacementOverride:(id)a3;
- (void)setToContentView:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setTransitionDuration:(double)a3;
- (void)setTransitionKind:(int64_t)a3;
@end

@implementation PXGViewControllerTransition

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_detailEndPoint);
  objc_destroyWeak((id *)&self->_summaryEndPoint);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_endPointInfos, 0);
  objc_storeStrong((id *)&self->_alongsideAnimationBlocks, 0);
  objc_storeStrong((id *)&self->_itemPlacementInterpolator, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_animationUpdateBlock, 0);
  objc_storeStrong((id *)&self->_toContentView, 0);
  objc_storeStrong((id *)&self->_fromContentView, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_interactiveTransition, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_storeStrong((id *)&self->_detailItemOriginalPlacement, 0);
  objc_storeStrong((id *)&self->_summaryItemOriginalPlacement, 0);
  objc_destroyWeak((id *)&self->_detailViewController);
  objc_destroyWeak((id *)&self->_summaryViewController);
  objc_storeStrong((id *)&self->_detailItemPlacementOverride, 0);
  objc_storeStrong((id *)&self->_summaryItemPlacementOverride, 0);
}

- (void)setIsInteractive:(BOOL)a3
{
  self->_isInteractive = a3;
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (PXGViewControllerTransitionEndPoint)detailEndPoint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailEndPoint);
  return (PXGViewControllerTransitionEndPoint *)WeakRetained;
}

- (PXGViewControllerTransitionEndPoint)summaryEndPoint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_summaryEndPoint);
  return (PXGViewControllerTransitionEndPoint *)WeakRetained;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setEndPointInfos:(id)a3
{
}

- (NSArray)endPointInfos
{
  return self->_endPointInfos;
}

- (NSMutableArray)alongsideAnimationBlocks
{
  return self->_alongsideAnimationBlocks;
}

- (void)setItemPlacementInterpolator:(id)a3
{
}

- (PXGViewControllerItemPlacementInterpolator)itemPlacementInterpolator
{
  return self->_itemPlacementInterpolator;
}

- (void)setDisplayLink:(id)a3
{
}

- (PXDisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setAnimationUpdateBlock:(id)a3
{
}

- (id)animationUpdateBlock
{
  return self->_animationUpdateBlock;
}

- (void)setToContentView:(id)a3
{
}

- (UIView)toContentView
{
  return self->_toContentView;
}

- (void)setFromContentView:(id)a3
{
}

- (UIView)fromContentView
{
  return self->_fromContentView;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionContext:(id)a3
{
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (UIPercentDrivenInteractiveTransition)interactiveTransition
{
  return self->_interactiveTransition;
}

- (void)setIsEnding:(BOOL)a3
{
  self->_isEnding = a3;
}

- (BOOL)isEnding
{
  return self->_isEnding;
}

- (void)setTransitionKind:(int64_t)a3
{
  self->_transitionKind = a3;
}

- (int64_t)transitionKind
{
  return self->_transitionKind;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (UIViewController)presentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  return (UIViewController *)WeakRetained;
}

- (BOOL)isVerticalOnly
{
  return self->_isVerticalOnly;
}

- (PXGItemPlacement)detailItemOriginalPlacement
{
  return self->_detailItemOriginalPlacement;
}

- (PXGItemPlacement)summaryItemOriginalPlacement
{
  return self->_summaryItemOriginalPlacement;
}

- (UIViewController)detailViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailViewController);
  return (UIViewController *)WeakRetained;
}

- (UIViewController)summaryViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_summaryViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setDetailItemPlacementOverride:(id)a3
{
}

- (PXGItemPlacement)detailItemPlacementOverride
{
  return self->_detailItemPlacementOverride;
}

- (void)setSummaryItemPlacementOverride:(id)a3
{
}

- (PXGItemPlacement)summaryItemPlacementOverride
{
  return self->_summaryItemPlacementOverride;
}

- (void)setFractionCompleted:(double)a3
{
  self->fractionCompleted = a3;
}

- (double)fractionCompleted
{
  return self->fractionCompleted;
}

- (double)transitionDuration:(id)a3
{
  v3 = objc_msgSend(off_1E5DA9658, "sharedInstance", a3);
  [v3 viewControllerTransitionDuration];
  double v5 = v4;

  return v5;
}

- (void)animateTransition:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  PXGTungstenGetLog();
}

void __49__PXGViewControllerTransition_animateTransition___block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  PXGTungstenGetLog();
}

void __49__PXGViewControllerTransition_animateTransition___block_invoke_2()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  PXGTungstenGetLog();
}

void __49__PXGViewControllerTransition_animateTransition___block_invoke_108(uint64_t a1)
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double v4 = *(double *)(v3 + 24);
  if (v4 == 0.0)
  {
    *(double *)(v3 + 24) = v2;
    double v4 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  double v5 = v2 - v4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _transitionDidUpdateWithTransitionTime:v5];
}

- (id)interactionControllerForDismissal:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  PXGTungstenGetLog();
}

- (id)animationControllerForDismissedController:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  PXGTungstenGetLog();
}

- (id)interactionControllerForPresentation:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  PXGTungstenGetLog();
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  PXGTungstenGetLog();
}

- (double)_progressForFractionCompleted:(double)a3
{
  int64_t v4 = [(PXGViewControllerTransition *)self transitionKind];
  if (v4 != 1)
  {
    if (v4 == 2)
    {
      return 1.0 - a3;
    }
    else
    {
      if (!v4)
      {
        v6 = [MEMORY[0x1E4F28B00] currentHandler];
        id v7 = [NSString stringWithUTF8String:"-[PXGViewControllerTransition _progressForFractionCompleted:]"];
        [v6 handleFailureInFunction:v7 file:@"PXGViewControllerTransition.m" lineNumber:662 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      return 0.0;
    }
  }
  return a3;
}

- (void)_notifyAlongsideAnimationBlocks:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(PXGViewControllerTransition *)self _progressForFractionCompleted:a3];
  double v5 = v4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(PXGViewControllerTransition *)self alongsideAnimationBlocks];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(double))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))(v5);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_willDismissWithoutTransition
{
  id v4 = [(PXGViewControllerTransition *)self detailEndPoint];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(PXGViewControllerTransition *)self summaryEndPoint];
    [v4 willDismissWithoutTransitionToEndPoint:v3];
  }
}

- (void)_transitionDidEnd:(BOOL)a3
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  PXGTungstenGetLog();
}

void __49__PXGViewControllerTransition__transitionDidEnd___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  PXGTungstenGetLog();
}

- (void)_transitionDidUpdateWithTransitionTime:(double)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(PXGViewControllerTransition *)self isInteractive];
  if (v5)
  {
    [(PXGViewControllerTransition *)self fractionCompleted];
    double v7 = v6;
  }
  else
  {
    [(PXGViewControllerTransition *)self transitionDuration];
    double v7 = a3 / v8;
  }
  if (![(PXGViewControllerTransition *)self isEnding])
  {
    uint64_t v9 = [(PXGViewControllerTransition *)self interactiveTransition];
    [v9 updateInteractiveTransition:v7];
  }
  int64_t v10 = [(PXGViewControllerTransition *)self transitionKind];
  switch(v10)
  {
    case 1:
      long long v13 = [(PXGViewControllerTransition *)self toContentView];
      long long v14 = v13;
      double v15 = v7;
LABEL_12:
      [v13 setAlpha:v15];

      break;
    case 2:
      long long v13 = [(PXGViewControllerTransition *)self fromContentView];
      long long v14 = v13;
      double v15 = 1.0 - v7;
      goto LABEL_12;
    case 0:
      long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v12 = [NSString stringWithUTF8String:"-[PXGViewControllerTransition _transitionDidUpdateWithTransitionTime:]"];
      [v11 handleFailureInFunction:v12 file:@"PXGViewControllerTransition.m" lineNumber:530 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  if (v5)
  {
    uint64_t v16 = [(PXGViewControllerTransition *)self summaryEndPointInfo];
    v17 = [(PXGViewControllerTransition *)self summaryItemPlacementOverride];
    __70__PXGViewControllerTransition__transitionDidUpdateWithTransitionTime___block_invoke(v16, v17);

    v18 = [(PXGViewControllerTransition *)self detailEndPointInfo];
    v19 = [(PXGViewControllerTransition *)self detailItemPlacementOverride];
    __70__PXGViewControllerTransition__transitionDidUpdateWithTransitionTime___block_invoke(v18, v19);
  }
  else
  {
    v20 = [(PXGViewControllerTransition *)self itemPlacementInterpolator];
    v18 = v20;
    if (v20)
    {
      [v20 setTime:a3];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v21 = [(PXGViewControllerTransition *)self endPointInfos];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v44 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v27 = [v26 originalItemPlacement];
            v28 = [v18 adjustedPlacement:v27];

            v29 = [v26 itemReference];
            if (v29)
            {
              v30 = [v26 itemPlacementController];
              [v30 setPlacementOverride:v28 forItemReference:v29];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v23);
      }
    }
  }

  if (a3 == 0.0)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v31 = [(PXGViewControllerTransition *)self endPointInfos];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [*(id *)(*((void *)&v39 + 1) + 8 * j) tungstenViewCoordinator];
          v37 = [v36 tungstenView];
          [v37 forceUpdate];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v33);
    }
  }
  [(PXGViewControllerTransition *)self _notifyAlongsideAnimationBlocks:v7];
  char v38 = v7 < 1.0 || v5;
  if ((v38 & 1) == 0 && ![(PXGViewControllerTransition *)self isEnding]) {
    PXGTungstenGetLog();
  }
}

void __70__PXGViewControllerTransition__transitionDidUpdateWithTransitionTime___block_invoke(void *a1, void *a2)
{
  id v7 = a1;
  id v3 = a2;
  uint64_t v4 = [v7 itemReference];
  BOOL v5 = (void *)v4;
  if (v3 && v4)
  {
    double v6 = [v7 itemPlacementController];
    [v6 setPlacementOverride:v3 forItemReference:v5];
  }
}

- (id)_transitionViewControllerForContentViewController:(id)a3
{
  id v5 = a3;
  id v6 = [(PXGViewControllerTransition *)self detailViewController];

  if (v6 == v5)
  {
    uint64_t v8 = [(PXGViewControllerTransition *)self presentedViewController];
  }
  else
  {
    id v7 = [(PXGViewControllerTransition *)self summaryViewController];

    if (v7 != v5)
    {
      long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"PXGViewControllerTransition.m", 511, @"unknown view controller %@", v5 object file lineNumber description];

      abort();
    }
    uint64_t v8 = [(PXGViewControllerTransition *)self presentingViewController];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

- (BOOL)_isContentViewControllerHidden:(id)a3
{
  id v3 = [(PXGViewControllerTransition *)self _transitionViewControllerForContentViewController:a3];
  uint64_t v4 = [v3 view];
  [v4 alpha];
  BOOL v6 = v5 == 0.0;

  return v6;
}

- (CGRect)_rectInContainerView:(id)a3 fromRect:(CGRect)a4 inCoordinateSpace:(id)a5 inContentViewController:(id)a6
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  [(PXGViewControllerTransition *)self _transitionViewControllerForContentViewController:a6];
  if (!objc_claimAutoreleasedReturnValue()) {
    PXAssertGetLog();
  }
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
}

- (void)_transitionWillBegin
{
  uint64_t v4 = [(PXGViewControllerTransition *)self transitionContext];
  if (!v4)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PXGViewControllerTransition.m", 395, @"Invalid parameter not satisfying: %@", @"transitionContext != nil" object file lineNumber description];
  }
  long long v39 = v4;
  double v5 = [v4 containerView];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  id v7 = [(PXGViewControllerTransition *)self summaryEndPoint];
  uint64_t v8 = [(PXGViewControllerTransition *)self detailEndPoint];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 summaryItemReferenceForTransitionWithSummaryEndPoint:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    long long v40 = [v8 detailItemReferenceForTransitionWithSummaryEndPoint:v7];
  }
  else
  {
    long long v40 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    if ([(PXGViewControllerTransition *)self transitionKind] == 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    [v7 willBeginTransition:self withEndPoint:v8 anchorItemReference:v10];
  }
  if (objc_opt_respondsToSelector()) {
    [v8 willBeginTransition:self withEndPoint:v7 anchorItemReference:0];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXGViewControllerTransition__transitionWillBegin__block_invoke;
  aBlock[3] = &unk_1E5DB7A68;
  aBlock[4] = self;
  id v11 = v5;
  long long v12 = v7;
  id v13 = v11;
  id v49 = v11;
  id v14 = v6;
  id v50 = v14;
  id v15 = v8;
  id v51 = v15;
  SEL v52 = a2;
  uint64_t v16 = (void (**)(void *, void *, void *, void, uint64_t, id *))_Block_copy(aBlock);
  v17 = [(PXGViewControllerTransition *)self summaryViewController];
  id v47 = 0;
  v37 = v12;
  char v38 = (void *)v9;
  v16[2](v16, v17, v12, 0, v9, &v47);
  id v18 = v47;

  v19 = [(PXGViewControllerTransition *)self detailViewController];
  id v46 = 0;
  v16[2](v16, v19, v15, 1, (uint64_t)v40, &v46);
  id v20 = v46;

  int64_t v21 = [(PXGViewControllerTransition *)self transitionKind];
  v36 = v15;
  if (v21 == 1)
  {
    uint64_t v27 = -1;
    v28 = v18;
    v29 = v20;
    goto LABEL_22;
  }
  if (v21 == 2)
  {
    uint64_t v27 = 1;
    v28 = v20;
    v29 = v18;
LABEL_22:
    id v23 = v28;
    id v22 = v29;
    if (v22)
    {
      v30 = [PXGViewControllerItemPlacementInterpolator alloc];
      [(PXGViewControllerTransition *)self transitionDuration];
      uint64_t v24 = -[PXGViewControllerItemPlacementInterpolator initWithSourcePlacement:targetPlacement:layering:containerView:duration:](v30, "initWithSourcePlacement:targetPlacement:layering:containerView:duration:", v23, v22, v27, v13);
    }
    else
    {
      uint64_t v24 = 0;
    }
    goto LABEL_25;
  }
  id v22 = 0;
  id v23 = 0;
  uint64_t v24 = 0;
  if (!v21)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = [NSString stringWithUTF8String:"-[PXGViewControllerTransition _transitionWillBegin]"];
    [v25 handleFailureInFunction:v26 file:@"PXGViewControllerTransition.m" lineNumber:470 description:@"Code which should be unreachable has been reached"];

    abort();
  }
LABEL_25:
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __51__PXGViewControllerTransition__transitionWillBegin__block_invoke_94;
  v41[3] = &unk_1E5DB7A90;
  v41[4] = self;
  id v42 = v14;
  long long v43 = v24;
  id v44 = v18;
  id v45 = v20;
  id v31 = v20;
  id v32 = v18;
  uint64_t v33 = v24;
  id v34 = v14;
  [(PXGViewControllerTransition *)self performChanges:v41];
}

void __51__PXGViewControllerTransition__transitionWillBegin__block_invoke(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  id v13 = +[PXGViewCoordinator tungstenViewCoordinatorInContainerViewController:v10];
  id v14 = v13;
  if (v13)
  {
    id v15 = objc_msgSend(v13, "tungstenView", a6, v11);
    [v15 ensureUpdatedLayout];
    uint64_t v16 = (void *)a1[4];
    uint64_t v17 = a1[5];
    [v15 bounds];
    objc_msgSend(v16, "_rectInContainerView:fromRect:inCoordinateSpace:inContentViewController:", v17, v15, v10);
    [v14 contentLayout];
    [(id)objc_claimAutoreleasedReturnValue() visibleRect];
    PXPointSubtract();
  }
  if ((id)a1[7] == v11) {
    PXAssertGetLog();
  }
  if (a6) {
    *a6 = 0;
  }
}

uint64_t __51__PXGViewControllerTransition__transitionWillBegin__block_invoke_94(uint64_t a1)
{
  [*(id *)(a1 + 32) setEndPointInfos:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setItemPlacementInterpolator:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setSummaryItemOriginalPlacement:*(void *)(a1 + 56)];
  uint64_t v2 = *(void *)(a1 + 64);
  id v3 = *(void **)(a1 + 32);
  return [v3 setDetailItemOriginalPlacement:v2];
}

uint64_t __51__PXGViewControllerTransition__transitionWillBegin__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) forceUpdate];
  double v2 = *(double *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  return [v3 setAlpha:v2];
}

- (void)_endTransitionAnimation:(BOOL)a3
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  PXGTungstenGetLog();
}

- (void)_handleDisplayLink:(id)a3
{
  uint64_t v3 = [(PXGViewControllerTransition *)self animationUpdateBlock];
  v3[2]();
}

- (void)_prepareTransitionAnimationWithReadinessHandler:(id)a3 completionHandler:(id)a4
{
  id v7 = (void (**)(id))a3;
  id v8 = a4;
  uint64_t v9 = [(PXGViewControllerTransition *)self transitionContext];
  if (!v9)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PXGViewControllerTransition.m", 318, @"Invalid parameter not satisfying: %@", @"transitionContext != nil" object file lineNumber description];
  }
  id v10 = [v9 containerView];
  uint64_t v11 = [v9 viewForKey:*MEMORY[0x1E4FB30C0]];
  id v12 = [v9 viewForKey:*MEMORY[0x1E4FB30D0]];
  id v13 = [v9 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  id v14 = [v9 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  [v9 finalFrameForViewController:v14];
  objc_msgSend(v12, "setFrame:");
  id v34 = v13;
  id v15 = [v13 view];
  uint64_t v16 = [v14 view];
  [(PXGViewControllerTransition *)self setFromContentView:v15];
  [(PXGViewControllerTransition *)self setToContentView:v16];
  int64_t v17 = [(PXGViewControllerTransition *)self transitionKind];
  id v18 = v12;
  switch(v17)
  {
    case 1:
      goto LABEL_8;
    case 2:
      [v10 addSubview:v12];
      id v18 = (void *)v11;
LABEL_8:
      [v10 addSubview:v18];
      break;
    case 0:
      v19 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v12);
      id v20 = [NSString stringWithUTF8String:"-[PXGViewControllerTransition _prepareTransitionAnimationWithReadinessHandler:completionHandler:]"];
      int64_t v21 = v19;
      id v22 = v20;
      uint64_t v23 = 334;
      goto LABEL_13;
  }
  objc_msgSend(v10, "layoutBelowIfNeeded", v18);
  v7[2](v7);
  int64_t v24 = [(PXGViewControllerTransition *)self transitionKind];
  id v32 = (void *)v11;
  uint64_t v33 = v7;
  switch(v24)
  {
    case 1:
      [v10 bringSubviewToFront:v12];
      [v16 setAlpha:0.0];
      break;
    case 2:
      [v10 bringSubviewToFront:v11];
      break;
    case 0:
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      id v20 = [NSString stringWithUTF8String:"-[PXGViewControllerTransition _prepareTransitionAnimationWithReadinessHandler:completionHandler:]"];
      int64_t v21 = v19;
      id v22 = v20;
      uint64_t v23 = 351;
LABEL_13:
      [v21 handleFailureInFunction:v22 file:@"PXGViewControllerTransition.m" lineNumber:v23 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, -1000.0, 50.0, 50.0);
  [v10 addSubview:v25];
  v26 = (void *)MEMORY[0x1E4FB1EB0];
  [(PXGViewControllerTransition *)self transitionDuration];
  double v28 = v27;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __97__PXGViewControllerTransition__prepareTransitionAnimationWithReadinessHandler_completionHandler___block_invoke;
  v38[3] = &unk_1E5DD36F8;
  id v39 = v25;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __97__PXGViewControllerTransition__prepareTransitionAnimationWithReadinessHandler_completionHandler___block_invoke_2;
  v35[3] = &unk_1E5DCD158;
  id v36 = v39;
  id v37 = v8;
  id v29 = v8;
  id v30 = v39;
  [v26 animateWithDuration:v38 animations:v35 completion:v28];
}

uint64_t __97__PXGViewControllerTransition__prepareTransitionAnimationWithReadinessHandler_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  CGRect v6 = CGRectOffset(v5, 50.0, 0.0);
  double v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

uint64_t __97__PXGViewControllerTransition__prepareTransitionAnimationWithReadinessHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (BOOL)_isTransitionAllowedWithKind:(int64_t)a3
{
  if ([(PXGViewControllerTransition *)self transitionKind]) {
    PXGTungstenGetLog();
  }
  CGRect v5 = [(PXGViewControllerTransition *)self summaryEndPoint];
  CGRect v6 = [(PXGViewControllerTransition *)self detailEndPoint];
  BOOL v7 = v6
    && (a3 == 1
     || a3 == 2 && [(PXGViewControllerTransition *)self isInteractive]
     || ((objc_opt_respondsToSelector() & 1) == 0
      || v5 && [v6 allowsTransition:self withEndPoint:v5])
     && ((objc_opt_respondsToSelector() & 1) == 0
      || [v5 allowsTransition:self withEndPoint:v6]));

  return v7;
}

- (id)_initWithSummaryViewController:(id)a3 presentedViewController:(id)a4 detailViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PXGViewControllerTransition;
  uint64_t v11 = [(PXGViewControllerTransition *)&v20 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_summaryViewController, v8);
    objc_storeWeak((id *)&v12->_presentedViewController, v9);
    objc_storeWeak((id *)&v12->_detailViewController, v10);
    id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    alongsideAnimationBlocks = v12->_alongsideAnimationBlocks;
    v12->_alongsideAnimationBlocks = v13;

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_summaryViewController);
    uint64_t v16 = __107__PXGViewControllerTransition__initWithSummaryViewController_presentedViewController_detailViewController___block_invoke(WeakRetained);
    objc_storeWeak((id *)&v12->_summaryEndPoint, v16);

    id v17 = objc_loadWeakRetained((id *)&v12->_detailViewController);
    id v18 = __107__PXGViewControllerTransition__initWithSummaryViewController_presentedViewController_detailViewController___block_invoke(v17);
    objc_storeWeak((id *)&v12->_detailEndPoint, v18);
  }
  return v12;
}

id __107__PXGViewControllerTransition__initWithSummaryViewController_presentedViewController_detailViewController___block_invoke(void *a1)
{
  id v1 = a1;
  if ([v1 conformsToProtocol:&unk_1F0449A58]) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)finish
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  PXGTungstenGetLog();
}

- (void)cancel
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  PXGTungstenGetLog();
}

- (void)installCompletionHandler:(id)a3
{
  id v4 = a3;
  CGRect v5 = [(PXGViewControllerTransition *)self completionHandler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PXGViewControllerTransition_installCompletionHandler___block_invoke;
  v8[3] = &unk_1E5DB7A40;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(PXGViewControllerTransition *)self setCompletionHandler:v8];
}

uint64_t __56__PXGViewControllerTransition_installCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)setInteractiveTransition:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  PXGTungstenGetLog();
}

- (void)setIsVerticalOnly:(BOOL)a3
{
  self->_isVerticalOnly = a3;
}

- (void)animateAlongside:(id)a3
{
  id v4 = a3;
  id v6 = [(PXGViewControllerTransition *)self alongsideAnimationBlocks];
  CGRect v5 = _Block_copy(v4);

  [v6 addObject:v5];
}

- (void)setDetailItemOriginalPlacement:(id)a3
{
  id v8 = (PXGItemPlacement *)a3;
  id v4 = self->_detailItemOriginalPlacement;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(PXGItemPlacement *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (PXGItemPlacement *)[(PXGItemPlacement *)v8 copy];
      detailItemOriginalPlacement = self->_detailItemOriginalPlacement;
      self->_detailItemOriginalPlacement = v6;

      [(PXGViewControllerTransition *)self signalChange:2];
    }
  }
}

- (void)setSummaryItemOriginalPlacement:(id)a3
{
  id v8 = (PXGItemPlacement *)a3;
  id v4 = self->_summaryItemOriginalPlacement;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(PXGItemPlacement *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (PXGItemPlacement *)[(PXGItemPlacement *)v8 copy];
      summaryItemOriginalPlacement = self->_summaryItemOriginalPlacement;
      self->_summaryItemOriginalPlacement = v6;

      [(PXGViewControllerTransition *)self signalChange:1];
    }
  }
}

- (_PXGTransitionEndPointInfo)detailEndPointInfo
{
  uint64_t v2 = [(PXGViewControllerTransition *)self endPointInfos];
  id v3 = [v2 lastObject];

  return (_PXGTransitionEndPointInfo *)v3;
}

- (_PXGTransitionEndPointInfo)summaryEndPointInfo
{
  uint64_t v2 = [(PXGViewControllerTransition *)self endPointInfos];
  id v3 = [v2 firstObject];

  return (_PXGTransitionEndPointInfo *)v3;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXGViewControllerTransition;
  [(PXGViewControllerTransition *)&v3 performChanges:a3];
}

- (PXGViewControllerTransition)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGViewControllerTransition.m", 176, @"%s is not available as initializer", "-[PXGViewControllerTransition init]");

  abort();
}

+ (id)interactiveDismissalOfDetailViewController:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 _transitionWithDetailViewController:a3 createIfNeeded:1 verticalOnly:1];
  objc_claimAutoreleasedReturnValue();
  PXGTungstenGetLog();
}

+ (void)prepareDismissalOfDetailViewController:(id)a3
{
  id v3 = (id)[a1 _transitionWithDetailViewController:a3 createIfNeeded:1 verticalOnly:0];
}

+ (id)_transitionWithDetailViewController:(id)a3 createIfNeeded:(BOOL)a4 verticalOnly:(BOOL)a5
{
  BOOL v5 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(id)_transitionsByPresentedViewController objectEnumerator];
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v8) {
    goto LABEL_13;
  }
  uint64_t v9 = *(void *)v16;
  while (1)
  {
    for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      id v12 = [v11 detailViewController];

      if (v12 == v6)
      {
        id v13 = [v6 presentingViewController];
        if (v13) {
          [v11 setPresentingViewController:v13];
        }
        id v8 = v11;

LABEL_13:
        if (!v8 && v5)
        {
          [v6 presentingViewController];
          [(id)objc_claimAutoreleasedReturnValue() presentedViewController];
          objc_claimAutoreleasedReturnValue();
          PXGTungstenGetLog();
        }
        PXGTungstenGetLog();
      }
    }
    id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v8) {
      goto LABEL_13;
    }
  }
}

+ (PXGViewControllerTransition)transitionWithDetailViewController:(id)a3
{
  return (PXGViewControllerTransition *)[a1 _transitionWithDetailViewController:a3 createIfNeeded:0 verticalOnly:0];
}

+ (id)_createTransitionWithSummaryViewController:(id)a3 presentedViewController:(id)a4 detailViewController:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [objc_alloc((Class)a1) _initWithSummaryViewController:v10 presentedViewController:v8 detailViewController:v9];

  [v8 setTransitioningDelegate:v11];
  id v12 = (void *)_transitionsByPresentedViewController;
  if (!_transitionsByPresentedViewController)
  {
    uint64_t v13 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    id v14 = (void *)_transitionsByPresentedViewController;
    _transitionsByPresentedViewController = v13;

    id v12 = (void *)_transitionsByPresentedViewController;
  }
  [v12 setObject:v11 forKey:v8];
  PXGTungstenGetLog();
}

+ (void)prepareTransitionFromSummaryViewController:(id)a3 toPresentedViewController:(id)a4 detailViewController:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  PXGTungstenGetLog();
}

@end