@interface BKAssetPresentationController
- (BKAssetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (BOOL)shouldPresentInFullscreen;
- (BOOL)shouldRemovePresentersView;
- (BOOL)useEndOfBookExperience;
- (BOOL)useUIPFluidOpenTransition;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setUseEndOfBookExperience:(BOOL)a3;
- (void)setUseUIPFluidOpenTransition:(BOOL)a3;
@end

@implementation BKAssetPresentationController

- (BKAssetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BKAssetPresentationController;
  v4 = [(BKAssetPresentationController *)&v6 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4) {
    v4->_useUIPFluidOpenTransition = +[BKUIPFeatures useUIPFluidBookOpenTransition];
  }
  return v4;
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)shouldRemovePresentersView
{
  return 1;
}

- (void)presentationTransitionWillBegin
{
  if ([(BKAssetPresentationController *)self useUIPFluidOpenTransition])
  {
    v3 = +[AETestDriver shared];
    [v3 postEvent:kBETestDriverOpenAnimationZoomStart sender:self];
  }
  v5.receiver = self;
  v5.super_class = (Class)BKAssetPresentationController;
  [(BKAssetPresentationController *)&v5 presentationTransitionWillBegin];
  v4 = [(BKAssetPresentationController *)self assetPresenter];
  [v4 setStateShouldOpen:1];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKAssetPresentationController *)self useUIPFluidOpenTransition])
  {
    objc_super v5 = +[AETestDriver shared];
    [v5 postEvent:kBETestDriverOpenAnimationZoomEnd sender:self];

    objc_super v6 = +[AETestDriver shared];
    [v6 postEvent:kBETestDriverOpenAnimationRevealStart sender:self];
  }
  v7 = [(BKAssetPresentationController *)self assetPresenter];
  [v7 setStateShouldClose:v3 ^ 1];

  v9.receiver = self;
  v9.super_class = (Class)BKAssetPresentationController;
  [(BKAssetPresentationController *)&v9 presentationTransitionDidEnd:v3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B480C;
  v8[3] = &unk_100A43D60;
  v8[4] = self;
  [UIApp _performBlockAfterCATransactionCommits:v8];
}

- (void)dismissalTransitionWillBegin
{
  if ([(BKAssetPresentationController *)self useUIPFluidOpenTransition])
  {
    BOOL v3 = +[AETestDriver shared];
    [v3 postEvent:kBETestDriverOpenAnimationSetupEnd sender:self];

    v4 = +[AETestDriver shared];
    [v4 postEvent:kBETestDriverOpenAnimationRevealStart sender:self];

    objc_super v5 = +[AETestDriver shared];
    [v5 postEvent:kBETestDriverOpenAnimationRevealEnd sender:self];

    objc_super v6 = +[AETestDriver shared];
    [v6 postEvent:kBETestDriverOpenAnimationZoomStart sender:self];
  }
  v10.receiver = self;
  v10.super_class = (Class)BKAssetPresentationController;
  [(BKAssetPresentationController *)&v10 dismissalTransitionWillBegin];
  unsigned __int8 v7 = [(BKAssetPresentationController *)self useUIPFluidOpenTransition];
  v8 = [(BKAssetPresentationController *)self assetPresenter];
  objc_super v9 = v8;
  if (v7) {
    [v8 assetPresenterDismissalTransitionWillBegin];
  }
  else {
    [v8 assetPresenterPrepareForDismissal];
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKAssetPresentationController *)self useUIPFluidOpenTransition])
  {
    objc_super v5 = +[AETestDriver shared];
    [v5 postEvent:kBETestDriverOpenAnimationZoomEnd sender:self];

    if (v3)
    {
      objc_super v6 = [(BKAssetPresentationController *)self assetPresenter];
      [v6 assetPresenterPrepareForDismissal];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)BKAssetPresentationController;
  [(BKAssetPresentationController *)&v9 dismissalTransitionDidEnd:v3];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B4AF4;
  v7[3] = &unk_100A44E60;
  v7[4] = self;
  BOOL v8 = v3;
  [UIApp _performBlockAfterCATransactionCommits:v7];
}

- (BOOL)useEndOfBookExperience
{
  return self->_useEndOfBookExperience;
}

- (void)setUseEndOfBookExperience:(BOOL)a3
{
  self->_useEndOfBookExperience = a3;
}

- (BOOL)useUIPFluidOpenTransition
{
  return self->_useUIPFluidOpenTransition;
}

- (void)setUseUIPFluidOpenTransition:(BOOL)a3
{
  self->_useUIPFluidOpenTransition = a3;
}

@end