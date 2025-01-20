@interface BCCardStackTransitionContext
- (BCCardStackTransitionContext)initWithFromViewController:(id)a3 toViewController:(id)a4 push:(BOOL)a5;
- (BOOL)isAnimated;
- (BOOL)isInteractive;
- (BOOL)transitionWasCancelled;
- (CGAffineTransform)targetTransform;
- (CGRect)appearingFromRect;
- (CGRect)appearingToRect;
- (CGRect)finalFrameForViewController:(id)a3;
- (CGRect)initialFrameForViewController:(id)a3;
- (NSDictionary)viewControllers;
- (UIView)containerView;
- (UIViewControllerContextTransitioning)outerContext;
- (id)completionBlock;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)presentationStyle;
- (void)completeTransition:(BOOL)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setAppearingFromRect:(CGRect)a3;
- (void)setAppearingToRect:(CGRect)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setInnerContainerView:(id)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setOuterContext:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)setViewControllers:(id)a3;
@end

@implementation BCCardStackTransitionContext

- (BCCardStackTransitionContext)initWithFromViewController:(id)a3 toViewController:(id)a4 push:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v51.receiver = self;
  v51.super_class = (Class)BCCardStackTransitionContext;
  v10 = [(BCCardStackTransitionContext *)&v51 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_30;
  }
  [(BCCardStackTransitionContext *)v10 setPresentationStyle:4];
  if (!v8)
  {
    v49 = [v9 parentViewController];
    v50 = [v49 view];
    [(BCCardStackTransitionContext *)v11 setContainerView:v50];

    v14 = objc_opt_new();
    if (!v9) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v12 = [v8 parentViewController];
  v13 = [v12 view];
  [(BCCardStackTransitionContext *)v11 setContainerView:v13];

  v14 = objc_opt_new();
  [v14 setObject:v8 forKeyedSubscript:UITransitionContextFromViewControllerKey];
  if (v9) {
LABEL_4:
  }
    [v14 setObject:v9 forKeyedSubscript:UITransitionContextToViewControllerKey];
LABEL_5:
  id v15 = [v14 copy];
  [(BCCardStackTransitionContext *)v11 setViewControllers:v15];

  v16 = [(BCCardStackTransitionContext *)v11 containerView];
  [v16 bounds];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  v25 = [(BCCardStackTransitionContext *)v11 containerView];
  [v25 bounds];
  CGFloat Height = CGRectGetHeight(v52);
  v53.origin.double x = v18;
  v53.origin.double y = v20;
  v53.size.double width = v22;
  v53.size.height = v24;
  CGRect v54 = CGRectOffset(v53, 0.0, Height);
  double x = v54.origin.x;
  double y = v54.origin.y;
  double width = v54.size.width;
  double v30 = v54.size.height;

  v31 = [(BCCardStackTransitionContext *)v11 containerView];
  [v31 bounds];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  if (v5) {
    double v40 = v30;
  }
  else {
    double v40 = v39;
  }
  if (v5) {
    double v41 = width;
  }
  else {
    double v41 = v37;
  }
  if (v5) {
    double v42 = y;
  }
  else {
    double v42 = v35;
  }
  if (v5) {
    double v43 = x;
  }
  else {
    double v43 = v33;
  }
  -[BCCardStackTransitionContext setAppearingFromRect:](v11, "setAppearingFromRect:", v43, v42, v41, v40);
  if (v5) {
    double v44 = v39;
  }
  else {
    double v44 = v30;
  }
  if (v5) {
    double v45 = v37;
  }
  else {
    double v45 = width;
  }
  if (v5) {
    double v46 = v35;
  }
  else {
    double v46 = y;
  }
  if (v5) {
    double v47 = v33;
  }
  else {
    double v47 = x;
  }
  -[BCCardStackTransitionContext setAppearingToRect:](v11, "setAppearingToRect:", v47, v46, v45, v44);

LABEL_30:
  return v11;
}

- (void)setBackgroundView:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setInnerContainerView:(id)a3
{
}

- (id)viewForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:UITransitionContextFromViewKey])
  {
    BOOL v5 = &UITransitionContextFromViewControllerKey;
LABEL_5:
    v6 = [(BCCardStackTransitionContext *)self viewControllerForKey:*v5];
    v7 = [v6 view];

    goto LABEL_13;
  }
  if ([v4 isEqualToString:UITransitionContextToViewKey])
  {
    BOOL v5 = &UITransitionContextToViewControllerKey;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"BCUITransitionContextBackgroundViewKey"])
  {
    backgroundView = (UILabel *)self->_backgroundView;
LABEL_12:
    v7 = backgroundView;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"BCUITransitionContextTitleLabelKey"])
  {
    backgroundView = self->_titleLabel;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"BCUITransitionContextClippedCoverContainerViewKey"])
  {
    backgroundView = (UILabel *)self->_innerContainerView;
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (id)viewControllerForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BCCardStackTransitionContext *)self viewControllers];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (BOOL)transitionWasCancelled
{
  return 0;
}

- (void)completeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(BCCardStackTransitionContext *)self outerContext];
  [v5 completeTransition:v3];

  [(BCCardStackTransitionContext *)self setOuterContext:0];
  v6 = [(BCCardStackTransitionContext *)self completionBlock];
  if (v6)
  {
    id v7 = v6;
    v6[2](v6, v3);
    v6 = (void (**)(void, void))v7;
  }
}

- (CGAffineTransform)targetTransform
{
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (CGRect)initialFrameForViewController:(id)a3
{
  [(BCCardStackTransitionContext *)self appearingFromRect];
  result.size.height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  [(BCCardStackTransitionContext *)self appearingToRect];
  result.size.height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (UIViewControllerContextTransitioning)outerContext
{
  return self->_outerContext;
}

- (void)setOuterContext:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (NSDictionary)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
}

- (CGRect)appearingFromRect
{
  double x = self->_appearingFromRect.origin.x;
  double y = self->_appearingFromRect.origin.y;
  double width = self->_appearingFromRect.size.width;
  double height = self->_appearingFromRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAppearingFromRect:(CGRect)a3
{
  self->_appearingFromRect = a3;
}

- (CGRect)appearingToRect
{
  double x = self->_appearingToRect.origin.x;
  double y = self->_appearingToRect.origin.y;
  double width = self->_appearingToRect.size.width;
  double height = self->_appearingToRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAppearingToRect:(CGRect)a3
{
  self->_appearingToRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_outerContext, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_innerContainerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end