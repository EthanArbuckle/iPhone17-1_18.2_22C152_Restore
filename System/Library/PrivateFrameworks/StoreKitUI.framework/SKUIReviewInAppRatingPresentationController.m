@interface SKUIReviewInAppRatingPresentationController
- (BOOL)constraintsPrepared;
- (BOOL)shouldRemovePresentersView;
- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3;
- (SKUIReviewInAppRatingPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UIView)dimmingView;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (int64_t)adaptivePresentationStyle;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)_prepareConstraintsIfNecessary;
- (void)_prepareDimmingViewIfNecessary;
- (void)containerViewDidLayoutSubviews;
- (void)containerViewWillLayoutSubviews;
- (void)presentationTransitionWillBegin;
- (void)setConstraintsPrepared:(BOOL)a3;
- (void)setDimmingView:(id)a3;
@end

@implementation SKUIReviewInAppRatingPresentationController

- (SKUIReviewInAppRatingPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIReviewInAppRatingPresentationController;
  v4 = [(SKUIReviewInAppRatingPresentationController *)&v7 initWithPresentedViewController:a3 presentingViewController:a4];
  v5 = v4;
  if (v4) {
    [(SKUIReviewInAppRatingPresentationController *)v4 setDelegate:v4];
  }
  return v5;
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (void)containerViewWillLayoutSubviews
{
  [(SKUIReviewInAppRatingPresentationController *)self _prepareDimmingViewIfNecessary];

  [(SKUIReviewInAppRatingPresentationController *)self _prepareConstraintsIfNecessary];
}

- (void)containerViewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SKUIReviewInAppRatingPresentationController;
  [(SKUIReviewInAppRatingPresentationController *)&v14 containerViewDidLayoutSubviews];
  v3 = [(SKUIReviewInAppRatingPresentationController *)self dimmingView];

  if (v3)
  {
    v4 = [(SKUIReviewInAppRatingPresentationController *)self containerView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(SKUIReviewInAppRatingPresentationController *)self dimmingView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  }
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  [a3 bounds];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_prepareDimmingViewIfNecessary
{
  id v10 = [(SKUIReviewInAppRatingPresentationController *)self presentedViewController];
  double v3 = [(SKUIReviewInAppRatingPresentationController *)self dimmingView];

  double v4 = v10;
  if (!v3 && v10)
  {
    double v5 = [(SKUIReviewInAppRatingPresentationController *)self containerView];
    double v6 = [(SKUIReviewInAppRatingPresentationController *)self dimmingView];
    [v6 removeFromSuperview];

    id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
    [v8 setBackgroundColor:v9];

    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SKUIReviewInAppRatingPresentationController *)self setDimmingView:v8];
    [v5 insertSubview:v8 atIndex:0];
    [v5 sendSubviewToBack:v8];

    double v4 = v10;
  }
}

- (void)presentationTransitionWillBegin
{
  id v4 = [(SKUIReviewInAppRatingPresentationController *)self containerView];
  double v3 = [(SKUIReviewInAppRatingPresentationController *)self presentedView];
  [v4 addSubview:v3];

  [(SKUIReviewInAppRatingPresentationController *)self _prepareDimmingViewIfNecessary];
  [(SKUIReviewInAppRatingPresentationController *)self _prepareConstraintsIfNecessary];
}

- (void)_prepareConstraintsIfNecessary
{
  if (![(SKUIReviewInAppRatingPresentationController *)self constraintsPrepared])
  {
    double v3 = [(SKUIReviewInAppRatingPresentationController *)self presentedViewController];
    id v4 = [v3 view];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v5 = [(SKUIReviewInAppRatingPresentationController *)self containerView];
    if ([v4 isDescendantOfView:v5])
    {
      [(SKUIReviewInAppRatingPresentationController *)self setConstraintsPrepared:1];
      double v6 = [MEMORY[0x1E4F1CA48] array];
      id v7 = (void *)MEMORY[0x1E4FB1EB0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __77__SKUIReviewInAppRatingPresentationController__prepareConstraintsIfNecessary__block_invoke;
      v9[3] = &unk_1E64225B0;
      id v10 = v4;
      id v11 = v5;
      id v12 = v6;
      id v8 = v6;
      [v7 performWithoutAnimation:v9];
    }
  }
}

uint64_t __77__SKUIReviewInAppRatingPresentationController__prepareConstraintsIfNecessary__block_invoke(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DC8];
  double v3 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(a1 + 32) attribute:9 relatedBy:0 toItem:*(void *)(a1 + 40) attribute:9 multiplier:1.0 constant:0.0];
  v13[0] = v3;
  id v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(a1 + 32) attribute:10 relatedBy:0 toItem:*(void *)(a1 + 40) attribute:10 multiplier:1.0 constant:0.0];
  v13[1] = v4;
  double v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(a1 + 32) attribute:7 relatedBy:0 toItem:*(void *)(a1 + 40) attribute:7 multiplier:1.0 constant:0.0];
  v13[2] = v5;
  double v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(a1 + 32) attribute:8 relatedBy:0 toItem:*(void *)(a1 + 40) attribute:8 multiplier:1.0 constant:0.0];
  v13[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  [v2 activateConstraints:v7];

  id v8 = *(void **)(a1 + 48);
  double v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(a1 + 32) attribute:3 relatedBy:1 toItem:*(void *)(a1 + 40) attribute:3 multiplier:1.0 constant:0.0];
  [v8 addObject:v9];

  id v10 = *(void **)(a1 + 48);
  id v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(a1 + 32) attribute:4 relatedBy:-1 toItem:*(void *)(a1 + 40) attribute:4 multiplier:1.0 constant:0.0];
  [v10 addObject:v11];

  return [*(id *)(a1 + 40) addConstraints:*(void *)(a1 + 48)];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  return 0;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (BOOL)constraintsPrepared
{
  return self->_constraintsPrepared;
}

- (void)setConstraintsPrepared:(BOOL)a3
{
  self->_constraintsPrepared = a3;
}

- (void).cxx_destruct
{
}

@end