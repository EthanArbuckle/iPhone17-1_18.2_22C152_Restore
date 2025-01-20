@interface BSUICardNavigationController
- (BOOL)accessibilityPerformEscape;
- (BOOL)isCurrentCard;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (int64_t)_topFeedLiveResizeOptions;
- (void)_updateNavigationTypeForViewController:(id)a3;
- (void)notifyFeedDidBecomeCurrent;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setIsCurrentCard:(BOOL)a3;
- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation BSUICardNavigationController

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  unsigned int v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BSUICardNavigationController;
  [(BSUICardNavigationController *)&v26 setNavigationBarHidden:a3 animated:a4];
  v6 = [(BSUICardNavigationController *)self cardStackViewController];
  v7 = [v6 topCardSetViewController];
  v8 = [v7 currentCardViewController];

  v9 = [v8 topContentViewController];
  unsigned int v10 = [v9 _appearState];

  v11 = [v6 statusBarBackgroundController];
  [v11 opacity];
  uint64_t v13 = v12;

  if ((v10 & 0xFFFFFFFD) == 1) {
    unsigned int v4 = [v8 prefersStatusBarBackgroundHidden] ^ 1;
  }
  int v14 = _os_feature_enabled_impl();
  if ([v8 expanded])
  {
    double v15 = (double)(v4 & (v14 ^ 1));
    v16 = [v8 topContentViewController];
    v17 = [v16 transitionCoordinator];

    if (v17)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_128F8;
      v23[3] = &unk_38E690;
      id v24 = v6;
      double v25 = v15;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1294C;
      v19[3] = &unk_38E6B8;
      id v20 = v24;
      uint64_t v21 = v13;
      double v22 = v15;
      [v17 animateAlongsideTransition:v23 completion:v19];

      id v18 = v24;
    }
    else
    {
      id v18 = [v6 statusBarBackgroundController];
      [v18 setOpacity:v15];
    }
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(BSUICardNavigationController *)self _updateNavigationTypeForViewController:v6];
  v7.receiver = self;
  v7.super_class = (Class)BSUICardNavigationController;
  [(BSUINavigationController *)&v7 pushViewController:v6 animated:v4];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(BSUICardNavigationController *)self viewControllers];
  if ((unint64_t)[v5 count] <= 1)
  {
    [(BSUICardNavigationController *)self _updateNavigationTypeForViewController:0];
  }
  else
  {
    id v6 = [(BSUICardNavigationController *)self viewControllers];
    objc_super v7 = [(BSUICardNavigationController *)self viewControllers];
    v8 = [v6 objectAtIndexedSubscript:[v7 count] - 2];
    [(BSUICardNavigationController *)self _updateNavigationTypeForViewController:v8];
  }
  v11.receiver = self;
  v11.super_class = (Class)BSUICardNavigationController;
  v9 = [(BSUINavigationController *)&v11 popViewControllerAnimated:v3];
  [(BSUIFeedNavigationController *)self updateTopFeedLiveResizeOptions];

  return v9;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(BSUICardNavigationController *)self _updateNavigationTypeForViewController:v6];
  v9.receiver = self;
  v9.super_class = (Class)BSUICardNavigationController;
  objc_super v7 = [(BSUINavigationController *)&v9 popToViewController:v6 animated:v4];

  [(BSUIFeedNavigationController *)self updateTopFeedLiveResizeOptions];

  return v7;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(BSUICardNavigationController *)self viewControllers];
  id v6 = [v5 firstObject];
  [(BSUICardNavigationController *)self _updateNavigationTypeForViewController:v6];

  v9.receiver = self;
  v9.super_class = (Class)BSUICardNavigationController;
  objc_super v7 = [(BSUINavigationController *)&v9 popToRootViewControllerAnimated:v3];
  [(BSUIFeedNavigationController *)self updateTopFeedLiveResizeOptions];

  return v7;
}

- (void)setIsCurrentCard:(BOOL)a3
{
  if (*(&self->super._isCoveredByCardStack + 1) != a3)
  {
    *(&self->super._isCoveredByCardStack + 1) = a3;
    [(BSUIFeedNavigationController *)self updateTopFeedLiveResizeOptions];
    [(BSUICardNavigationController *)self notifyFeedDidBecomeCurrent];
  }
}

- (void)notifyFeedDidBecomeCurrent
{
  if ([(BSUICardNavigationController *)self isCurrentCard])
  {
    BOOL v3 = [(BSUIFeedNavigationController *)self currentFeedViewController];
    [v3 didBecomeCurrentFeed];

    BOOL v4 = [(BSUICardNavigationController *)self topViewController];
    BUProtocolCast();
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    [v5 didBecomeVisibleContentScrollView];
  }
}

- (int64_t)_topFeedLiveResizeOptions
{
  return [(BSUICardNavigationController *)self isCurrentCard] ^ 1;
}

- (void)_updateNavigationTypeForViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(BSUICardNavigationController *)self cardStackViewController];
  id v7 = [v5 topCardSetViewController];

  id v6 = BUProtocolCast();

  [v6 cardSetViewController:v7 willUpdateWithNavigationType:[v7 lastNavigationType]];
}

- (BOOL)accessibilityPerformEscape
{
  BOOL v3 = [(BSUICardNavigationController *)self viewControllers];
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2)
  {
    id v6 = [(BSUICardNavigationController *)self cardStackViewController];
    [v6 popCardsAnimated:1];
  }
  else
  {
    id v5 = [(BSUICardNavigationController *)self popViewControllerAnimated:1];
  }
  return 1;
}

- (BOOL)isCurrentCard
{
  return *(&self->super._isCoveredByCardStack + 1);
}

@end