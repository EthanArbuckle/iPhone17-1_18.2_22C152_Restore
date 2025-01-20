@interface _UISheetAnimationController
- (BOOL)_allowKeyboardToAnimateAlongside:(id)a3;
- (BOOL)isForward;
- (BOOL)isInInitialLayout;
- (BOOL)isReversed;
- (BOOL)scalesDownForwardView;
- (CGPoint)attachmentPoint;
- (CGRect)forwardViewFullFrame;
- (CGRect)interactiveFrame;
- (CGRect)sourceFrame;
- (NSMutableArray)allNoninteractiveAnimations;
- (NSMutableArray)allNoninteractiveCompletions;
- (UIView)forwardView;
- (UIView)sourceView;
- (UIViewControllerContextTransitioning)transitionContext;
- (UIViewPropertyAnimator)propertyAnimator;
- (_UISheetAnimationController)init;
- (_UISheetPresentationMetrics)metrics;
- (id)defaultSourceFrameProvider;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (id)noninteractiveAnimations;
- (id)noninteractiveCompletion;
- (void)addNoninteractiveAnimations:(id)a3;
- (void)addNoninteractiveCompletion:(id)a3;
- (void)animateTransition:(id)a3;
- (void)layoutTransitionViews;
- (void)runNoninteractiveAnimationsIfPossible;
- (void)setAllNoninteractiveAnimations:(id)a3;
- (void)setAllNoninteractiveCompletions:(id)a3;
- (void)setAttachmentPoint:(CGPoint)a3;
- (void)setDefaultSourceFrameProvider:(id)a3;
- (void)setForwardView:(id)a3;
- (void)setForwardViewFullFrame:(CGRect)a3;
- (void)setInteractiveFrame:(CGRect)a3;
- (void)setIsInInitialLayout:(BOOL)a3;
- (void)setIsReversed:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setNoninteractiveAnimations:(id)a3;
- (void)setNoninteractiveCompletion:(id)a3;
- (void)setPropertyAnimator:(id)a3;
- (void)setScalesDownForwardView:(BOOL)a3;
- (void)setSourceFrame:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setTransitionContext:(id)a3;
@end

@implementation _UISheetAnimationController

- (_UISheetAnimationController)init
{
  v13.receiver = self;
  v13.super_class = (Class)_UISheetAnimationController;
  v2 = [(_UISheetAnimationController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    CGPoint v4 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v2->_sourceFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v2->_sourceFrame.size = v5;
    v2->_interactiveFrame.origin = v4;
    v2->_interactiveFrame.size = v5;
    v2->_isInInitialLayout = 1;
    uint64_t v6 = _UIFallbackSheetMetrics();
    metrics = v3->_metrics;
    v3->_metrics = (_UISheetPresentationMetrics *)v6;

    uint64_t v8 = objc_opt_new();
    allNoninteractiveAnimations = v3->_allNoninteractiveAnimations;
    v3->_allNoninteractiveAnimations = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    allNoninteractiveCompletions = v3->_allNoninteractiveCompletions;
    v3->_allNoninteractiveCompletions = (NSMutableArray *)v10;
  }
  return v3;
}

- (id)noninteractiveAnimations
{
  return (id)[(NSMutableArray *)self->_allNoninteractiveAnimations firstObject];
}

- (void)setNoninteractiveAnimations:(id)a3
{
  id aBlock = a3;
  [(NSMutableArray *)self->_allNoninteractiveAnimations removeAllObjects];
  CGPoint v4 = aBlock;
  if (aBlock)
  {
    allNoninteractiveAnimations = self->_allNoninteractiveAnimations;
    uint64_t v6 = _Block_copy(aBlock);
    [(NSMutableArray *)allNoninteractiveAnimations addObject:v6];

    CGPoint v4 = aBlock;
  }
}

- (id)noninteractiveCompletion
{
  return (id)[(NSMutableArray *)self->_allNoninteractiveCompletions firstObject];
}

- (void)setNoninteractiveCompletion:(id)a3
{
  id aBlock = a3;
  [(NSMutableArray *)self->_allNoninteractiveCompletions removeAllObjects];
  CGPoint v4 = aBlock;
  if (aBlock)
  {
    allNoninteractiveCompletions = self->_allNoninteractiveCompletions;
    uint64_t v6 = _Block_copy(aBlock);
    [(NSMutableArray *)allNoninteractiveCompletions addObject:v6];

    CGPoint v4 = aBlock;
  }
}

- (void)addNoninteractiveAnimations:(id)a3
{
  allNoninteractiveAnimations = self->_allNoninteractiveAnimations;
  id v4 = _Block_copy(a3);
  [(NSMutableArray *)allNoninteractiveAnimations addObject:v4];
}

- (void)addNoninteractiveCompletion:(id)a3
{
  allNoninteractiveCompletions = self->_allNoninteractiveCompletions;
  id v4 = _Block_copy(a3);
  [(NSMutableArray *)allNoninteractiveCompletions addObject:v4];
}

- (BOOL)isForward
{
  return ![(_UISheetAnimationController *)self isReversed];
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id v6 = a3;
  v7 = [(_UISheetAnimationController *)self propertyAnimator];

  if (!v7)
  {
    uint64_t v8 = [UIViewPropertyAnimator alloc];
    [(_UISheetAnimationController *)self transitionDuration:v6];
    double v10 = v9;
    v11 = _UISheetTransitionTimingCurve();
    v12 = [(UIViewPropertyAnimator *)v8 initWithDuration:v11 timingParameters:v10];
    [(_UISheetAnimationController *)self setPropertyAnimator:v12];

    [(_UISheetAnimationController *)self setTransitionContext:v6];
    objc_super v13 = [v6 viewForKey:@"UITransitionContextToView"];
    v14 = [v6 viewForKey:@"UITransitionContextFromView"];
    if ([(_UISheetAnimationController *)self isForward]) {
      v15 = v13;
    }
    else {
      v15 = v14;
    }
    [(_UISheetAnimationController *)self setForwardView:v15];
    v16 = [v6 viewControllerForKey:@"UITransitionContextFromViewController"];
    v17 = [v6 viewControllerForKey:@"UITransitionContextToViewController"];
    [v6 finalFrameForViewController:v17];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [v6 initialFrameForViewController:v16];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    BOOL v34 = [(_UISheetAnimationController *)self isForward];
    if (v34) {
      double v35 = v19;
    }
    else {
      double v35 = v27;
    }
    if (v34) {
      double v36 = v21;
    }
    else {
      double v36 = v29;
    }
    if (v34) {
      double v37 = v23;
    }
    else {
      double v37 = v31;
    }
    if (v34) {
      double v38 = v25;
    }
    else {
      double v38 = v33;
    }
    -[_UISheetAnimationController setForwardViewFullFrame:](self, "setForwardViewFullFrame:", v35, v36, v37, v38);
    v39 = [(_UISheetAnimationController *)self sourceView];
    [(_UISheetAnimationController *)self sourceFrame];
    if (CGRectIsNull(v85))
    {
      if (!v39)
      {
        v41 = [(_UISheetAnimationController *)self defaultSourceFrameProvider];
        if (v41)
        {
          v3 = [(_UISheetAnimationController *)self defaultSourceFrameProvider];
          v3[2]();
        }
        else
        {
          [(_UISheetAnimationController *)self forwardViewFullFrame];
        }
        -[_UISheetAnimationController setSourceFrame:](self, "setSourceFrame:");
        if (v41) {

        }
        goto LABEL_22;
      }
      [v39 bounds];
      -[_UISheetAnimationController setSourceFrame:](self, "setSourceFrame:");
    }
    else if (!v39)
    {
      goto LABEL_23;
    }
    v40 = [v39 _viewControllerForAncestor];
    v41 = [v40 _existingPresentationControllerImmediate:0 effective:1 includesRoot:1];

    [(_UISheetAnimationController *)self sourceFrame];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    v50 = [v41 presentedView];
    objc_msgSend(v39, "convertRect:toView:", v50, v43, v45, v47, v49);
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    CGFloat v58 = v57;

    [v41 frameOfPresentedViewInContainerView];
    CGFloat v60 = v59;
    CGFloat v62 = v61;
    v86.origin.x = v52;
    v86.origin.y = v54;
    v86.size.width = v56;
    v86.size.height = v58;
    CGRect v87 = CGRectOffset(v86, v60, v62);
    -[_UISheetAnimationController setSourceFrame:](self, "setSourceFrame:", v87.origin.x, v87.origin.y, v87.size.width, v87.size.height);
LABEL_22:

LABEL_23:
    v63 = [(_UISheetAnimationController *)self forwardView];

    if (v63)
    {
      if (!v13)
      {
LABEL_26:
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke;
        v83[3] = &unk_1E52D9F70;
        v83[4] = self;
        +[UIView performWithoutAnimation:v83];
        [(_UISheetAnimationController *)self setIsInInitialLayout:0];
        v65 = [(_UISheetAnimationController *)self metrics];
        v66 = [(_UISheetAnimationController *)self propertyAnimator];
        [v65 addAlongsideAnimations:v66 forSheetTransition:self context:v6];

        if ([v6 isInteractive])
        {
          v67 = [(_UISheetAnimationController *)self propertyAnimator];
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_2;
          v81[3] = &unk_1E52D9F70;
          id v82 = v6;
          [v67 addAnimations:v81];
        }
        else
        {
          objc_initWeak(&location, self);
          v68 = [(_UISheetAnimationController *)self propertyAnimator];
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_3;
          v78[3] = &unk_1E52DC308;
          objc_copyWeak(&v79, &location);
          [v68 addAnimations:v78];

          objc_destroyWeak(&v79);
          objc_destroyWeak(&location);
        }
        v69 = [(_UISheetAnimationController *)self propertyAnimator];
        uint64_t v73 = MEMORY[0x1E4F143A8];
        uint64_t v74 = 3221225472;
        v75 = __66___UISheetAnimationController_interruptibleAnimatorForTransition___block_invoke_5;
        v76 = &unk_1E52DC698;
        id v77 = v6;
        [v69 addCompletion:&v73];

        goto LABEL_30;
      }
    }
    else
    {
      v72 = [MEMORY[0x1E4F28B00] currentHandler];
      [v72 handleFailureInMethod:a2 object:self file:@"_UISheetTransitioning.m" lineNumber:147 description:@"Attempted to run _UISheetAnimationController without a forwardView."];

      if (!v13) {
        goto LABEL_26;
      }
    }
    objc_msgSend(v13, "_setFrameIgnoringLayerTransform:", v19, v21, v23, v25);
    v64 = [v6 containerView];
    [v64 addSubview:v13];

    goto LABEL_26;
  }
LABEL_30:
  v70 = [(_UISheetAnimationController *)self propertyAnimator];

  return v70;
}

- (void)animateTransition:(id)a3
{
  id v3 = [(_UISheetAnimationController *)self interruptibleAnimatorForTransition:a3];
  [v3 startAnimation];
}

- (void)layoutTransitionViews
{
  id v3 = [(_UISheetAnimationController *)self transitionContext];
  if (!v3) {
    goto LABEL_30;
  }
  id v4 = [(_UISheetAnimationController *)self forwardView];
  [(_UISheetAnimationController *)self forwardViewFullFrame];
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(_UISheetAnimationController *)self interactiveFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  int v21 = [v3 isInteractive];
  v64.origin.x = v14;
  v64.origin.y = v16;
  v64.size.width = v18;
  v64.size.height = v20;
  BOOL IsNull = CGRectIsNull(v64);
  BOOL v23 = IsNull;
  CGFloat v52 = v12;
  CGFloat v53 = v10;
  if (!IsNull)
  {
    CGFloat v12 = v20;
    CGFloat v10 = v18;
  }
  CGFloat v51 = v8;
  if (IsNull)
  {
    double v24 = v6;
  }
  else
  {
    CGFloat v8 = v16;
    double v24 = v14;
  }
  CGFloat v54 = v6;
  CGFloat recta = v24;
  [(_UISheetAnimationController *)self sourceFrame];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  BOOL v33 = ([v3 transitionWasCancelled] & 1) != 0
     || [(_UISheetAnimationController *)self isInInitialLayout];
  if ([(_UISheetAnimationController *)self isForward])
  {
    int v34 = v21 | !v33;
    if (v34) {
      double v35 = v12;
    }
    else {
      double v35 = v20;
    }
    if ((v34 & 1) == 0)
    {
      double v36 = v28;
      double v37 = v32;
      double v38 = v30;
      double v39 = v26;
      if (v23) {
        goto LABEL_23;
      }
    }
  }
  else
  {
    if (v21 | v33) {
      double v35 = v12;
    }
    else {
      double v35 = v20;
    }
    if (((v21 | v33) & 1) == 0)
    {
      double v36 = v28;
      double v37 = v32;
      double v38 = v30;
      double v39 = v26;
      if (v23) {
        goto LABEL_23;
      }
    }
  }
  double v36 = v8;
  double v37 = v35;
  double v38 = v10;
  double v39 = recta;
LABEL_23:
  objc_msgSend(v4, "_setFrameIgnoringLayerTransform:", v39, v36, v38, v37, v35);
  long long v40 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v63.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v63.c = v40;
  *(_OWORD *)&v63.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (v21)
  {
    if ([(_UISheetAnimationController *)self scalesDownForwardView])
    {
      v65.origin.x = v26;
      v65.origin.y = v28;
      v65.size.width = v30;
      v65.size.height = v32;
      double Width = CGRectGetWidth(v65);
      v66.size.width = v53;
      v66.origin.x = v54;
      v66.origin.y = v51;
      v66.size.height = v52;
      if (Width < CGRectGetWidth(v66))
      {
        v67.origin.x = recta;
        v67.origin.y = v8;
        v67.size.width = v10;
        v67.size.height = v12;
        double MinY = CGRectGetMinY(v67);
        v68.origin.x = v54;
        v68.size.height = v52;
        v68.origin.y = v51;
        v68.size.width = v53;
        CGFloat recta = MinY - CGRectGetMinY(v68);
        v69.origin.x = v26;
        v69.origin.y = v28;
        v69.size.width = v30;
        v69.size.height = v32;
        double v43 = CGRectGetMinY(v69);
        v70.origin.x = v54;
        v70.origin.y = v51;
        v70.size.width = v53;
        v70.size.height = v52;
        double v44 = recta / (v43 - CGRectGetMinY(v70));
        v71.origin.x = v26;
        v71.origin.y = v28;
        v71.size.width = v30;
        v71.size.height = v32;
        double v45 = CGRectGetWidth(v71);
        [(_UISheetAnimationController *)self forwardViewFullFrame];
        double v46 = v45 / CGRectGetWidth(v72);
        if (v46 < 0.8) {
          double v46 = 0.8;
        }
        CGFloat v47 = 1.0 - v44 + v44 * v46;
        [(_UISheetAnimationController *)self attachmentPoint];
        v73.origin.x = v54;
        v73.origin.y = v51;
        v73.size.width = v53;
        v73.size.height = v52;
        [(_UISheetAnimationController *)self attachmentPoint];
        double v49 = v48;
        v74.origin.x = v54;
        v74.origin.y = v51;
        v74.size.width = v53;
        v74.size.height = v52;
        CGFloat Height = CGRectGetHeight(v74);
        memset(&v62, 0, sizeof(v62));
        CGAffineTransformMakeTranslation(&v62, 0.0, v49 + Height * -0.5);
        memset(&v61, 0, sizeof(v61));
        CGAffineTransformMakeScale(&v61, v47, v47);
        CGAffineTransform t1 = v62;
        memset(&v60, 0, sizeof(v60));
        CGAffineTransformInvert(&v60, &t1);
        CGAffineTransform t1 = v60;
        CGAffineTransform t2 = v61;
        CGAffineTransformConcat(&v58, &t1, &t2);
        CGAffineTransform t1 = v62;
        CGAffineTransformConcat(&v63, &v58, &t1);
      }
    }
  }
  CGAffineTransform rect_8 = v63;
  [v4 setTransform:&rect_8];

LABEL_30:
}

- (void)runNoninteractiveAnimationsIfPossible
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = self->_allNoninteractiveAnimations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  CGFloat v8 = self->_allNoninteractiveCompletions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        +[UIView _addCompletion:](UIView, "_addCompletion:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (BOOL)_allowKeyboardToAnimateAlongside:(id)a3
{
  return 0;
}

- (BOOL)isReversed
{
  return self->_isReversed;
}

- (void)setIsReversed:(BOOL)a3
{
  self->_isReversed = a3;
}

- (CGRect)sourceFrame
{
  double x = self->_sourceFrame.origin.x;
  double y = self->_sourceFrame.origin.y;
  double width = self->_sourceFrame.size.width;
  double height = self->_sourceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceFrame:(CGRect)a3
{
  self->_sourceFrame = a3;
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (void)setSourceView:(id)a3
{
}

- (UIViewControllerContextTransitioning)transitionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  return (UIViewControllerContextTransitioning *)WeakRetained;
}

- (void)setTransitionContext:(id)a3
{
}

- (UIView)forwardView
{
  return self->_forwardView;
}

- (void)setForwardView:(id)a3
{
}

- (CGRect)forwardViewFullFrame
{
  double x = self->_forwardViewFullFrame.origin.x;
  double y = self->_forwardViewFullFrame.origin.y;
  double width = self->_forwardViewFullFrame.size.width;
  double height = self->_forwardViewFullFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setForwardViewFullFrame:(CGRect)a3
{
  self->_forwardViewFullFrame = a3;
}

- (BOOL)isInInitialLayout
{
  return self->_isInInitialLayout;
}

- (void)setIsInInitialLayout:(BOOL)a3
{
  self->_isInInitialLayout = a3;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  return self->_propertyAnimator;
}

- (void)setPropertyAnimator:(id)a3
{
}

- (_UISheetPresentationMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (BOOL)scalesDownForwardView
{
  return self->_scalesDownForwardView;
}

- (void)setScalesDownForwardView:(BOOL)a3
{
  self->_scalesDownForwardView = a3;
}

- (NSMutableArray)allNoninteractiveAnimations
{
  return self->_allNoninteractiveAnimations;
}

- (void)setAllNoninteractiveAnimations:(id)a3
{
}

- (NSMutableArray)allNoninteractiveCompletions
{
  return self->_allNoninteractiveCompletions;
}

- (void)setAllNoninteractiveCompletions:(id)a3
{
}

- (id)defaultSourceFrameProvider
{
  return self->_defaultSourceFrameProvider;
}

- (void)setDefaultSourceFrameProvider:(id)a3
{
}

- (CGRect)interactiveFrame
{
  double x = self->_interactiveFrame.origin.x;
  double y = self->_interactiveFrame.origin.y;
  double width = self->_interactiveFrame.size.width;
  double height = self->_interactiveFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInteractiveFrame:(CGRect)a3
{
  self->_interactiveFrame = a3;
}

- (CGPoint)attachmentPoint
{
  double x = self->_attachmentPoint.x;
  double y = self->_attachmentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAttachmentPoint:(CGPoint)a3
{
  self->_attachmentPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultSourceFrameProvider, 0);
  objc_storeStrong((id *)&self->_allNoninteractiveCompletions, 0);
  objc_storeStrong((id *)&self->_allNoninteractiveAnimations, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_forwardView, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_destroyWeak((id *)&self->_sourceView);
}

@end