@interface BCCardSetContractedState
- (BOOL)cardViewController:(id)a3 dismissPanShouldBegin:(id)a4 cardData:(id)a5;
- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4;
- (double)cardViewController:(id)a3 cardScrollViewOffsetForContentScrollView:(id)a4 cardData:(id)a5;
- (double)cardViewControllerStatusBarBackgroundOpacity:(id)a3;
- (void)cardViewController:(id)a3 accessibilityWantsToScrollToOffset:(CGPoint)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidScroll:(id)a5 contentScrollView:(id)a6;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillEndDragging:(id)a5 withVelocity:(CGPoint)a6 targetContentOffset:(CGPoint *)a7 contentScrollView:(id)a8;
- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 repositionOffsetsWithContentScrollView:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 scrollToTopAnimated:(BOOL)a4 cardData:(id)a5;
- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5;
- (void)updateScrollViewsWhenCantExpandCardViewController:(id)a3 cardScrollView:(id)a4 contentScrollView:(id)a5;
@end

@implementation BCCardSetContractedState

- (double)cardViewControllerStatusBarBackgroundOpacity:(id)a3
{
  return 0.0;
}

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)BCCardSetContractedState;
  id v8 = a5;
  id v9 = a3;
  [(BCCardSetState *)&v11 didBecomeCurrentStateCardViewController:v9 previousState:a4 cardData:v8];
  v10 = [v9 contentScrollView];
  [(BCCardSetContractedState *)self cardViewController:v9 contentScrollViewDidChange:v10 cardData:v8];
}

- (void)updateScrollViewsWhenCantExpandCardViewController:(id)a3 cardScrollView:(id)a4 contentScrollView:(id)a5
{
  id v18 = a4;
  id v7 = a5;
  id v8 = a3;
  [v18 contentOffset];
  double v10 = v9;
  [v18 adjustedContentInset];
  double v12 = v11;

  [v18 contentSize];
  double v14 = v13;
  v15 = [v8 topContentViewController];

  LODWORD(v8) = [v15 prefersAdditionalSafeAreaInsetsForInsetting];
  if (v8) {
    [v7 adjustedContentInset];
  }
  else {
    [v7 contentInset];
  }
  double v17 = v10 + v12;
  if (v10 + v12 >= v14) {
    double v17 = v14;
  }
  [v7 setContentOffset:0.0, v17 - v16];
}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = [v8 contentScrollView];
  [(BCCardSetContractedState *)self cardViewController:v8 repositionOffsetsWithContentScrollView:v9 cardData:v7];

  id v12 = [v7 configuration];

  uint64_t v10 = [v12 cardsCanExpand] ^ 1;
  double v11 = [v8 scrollView];

  [v11 setShowsVerticalScrollIndicator:v10];
}

- (void)cardViewController:(id)a3 repositionOffsetsWithContentScrollView:(id)a4 cardData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v10 configuration];
  unsigned int v12 = [v11 cardsCanExpand];

  if (v12)
  {
    v14.receiver = self;
    v14.super_class = (Class)BCCardSetContractedState;
    [(BCCardSetState *)&v14 cardViewController:v8 repositionOffsetsWithContentScrollView:v9 cardData:v10];
  }
  else if (v9)
  {
    double v13 = [v8 scrollView];
    [(BCCardSetContractedState *)self updateScrollViewsWhenCantExpandCardViewController:v8 cardScrollView:v13 contentScrollView:v9];
  }
}

- (double)cardViewController:(id)a3 cardScrollViewOffsetForContentScrollView:(id)a4 cardData:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  double v11 = [v9 configuration];
  unsigned int v12 = [v11 cardsCanExpand];

  if (v12)
  {
    v21.receiver = self;
    v21.super_class = (Class)BCCardSetContractedState;
    [(BCCardSetState *)&v21 cardViewController:v10 cardScrollViewOffsetForContentScrollView:v8 cardData:v9];
    double v14 = v13;
  }
  else
  {
    v15 = [v10 topContentViewController];

    unsigned int v16 = [v15 prefersAdditionalSafeAreaInsetsForInsetting];
    [v8 contentOffset];
    double v18 = v17;
    if (v16) {
      [v8 adjustedContentInset];
    }
    else {
      [v8 contentInset];
    }
    double v14 = v18 + v19;
  }

  return v14;
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidScroll:(id)a5 contentScrollView:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v12 contentOffset];
  double v15 = v14;
  [v12 adjustedContentInset];
  double v17 = v15 + v16;
  double v18 = [v10 topContentViewController];
  unsigned int v19 = [v18 shouldOnlyAllowDismiss];

  if (v19 && v17 > 0.0)
  {
    [v12 contentOffset];
    double v21 = v20;
    [v12 adjustedContentInset];
    [v12 setContentOffset:v21, v22];
  }
  else
  {
    v23 = [v10 view];
    v24 = v23;
    if (v23)
    {
      [v23 transform];
      double v25 = *((double *)&v36 + 1);
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
      double v25 = 0.0;
    }
    [v11 setRawCurrentCardOffset:v25, v34, v35, v36];

    if (v17 <= 0.0)
    {
      [v12 setShowsVerticalScrollIndicator:0];
      if (([v12 isDecelerating] & 1) == 0)
      {
        v30 = +[BCCardSetState dismissingState];
        [v11 setCurrentState:v30];

        v31 = [v11 currentState];
        [v31 cardViewController:v10 cardData:v11 scrollViewDidScroll:v12 contentScrollView:v13];
      }
      v32 = [v10 contentScrollView];
      v33 = [v10 scrollView];
      [(BCCardSetState *)self updateCardViewController:v10 contentScrollView:v32 basedOnCardScrollView:v33 cardData:v11];
    }
    else
    {
      [v12 setShowsVerticalScrollIndicator:1];
      v26 = [v11 configuration];
      unsigned int v27 = [v26 cardsCanExpand];

      if (v27)
      {
        v28 = +[BCCardSetState expandingState];
        [v11 setCurrentState:v28];

        v29 = [v11 currentState];
        [v29 cardViewController:v10 cardData:v11 scrollViewDidScroll:v12 contentScrollView:v13];
      }
      else
      {
        [(BCCardSetContractedState *)self updateScrollViewsWhenCantExpandCardViewController:v10 cardScrollView:v12 contentScrollView:v13];
      }
    }
  }
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillEndDragging:(id)a5 withVelocity:(CGPoint)a6 targetContentOffset:(CGPoint *)a7 contentScrollView:(id)a8
{
  double y = a6.y;
  double x = a6.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  unsigned int v19 = [v16 configuration];
  unsigned int v20 = [v19 cardsCanExpand];

  if (v20)
  {
    v21.receiver = self;
    v21.super_class = (Class)BCCardSetContractedState;
    -[BCCardSetState cardViewController:cardData:scrollViewWillEndDragging:withVelocity:targetContentOffset:contentScrollView:](&v21, "cardViewController:cardData:scrollViewWillEndDragging:withVelocity:targetContentOffset:contentScrollView:", v15, v16, v17, a7, v18, x, y);
  }
}

- (void)cardViewController:(id)a3 scrollToTopAnimated:(BOOL)a4 cardData:(id)a5
{
  BOOL v5 = a4;
  id v7 = [a3 contentScrollView];
  [(BCCardSetState *)self _scrollScrollViewToTopForCardViewController:v7 animated:v5];
}

- (void)cardViewController:(id)a3 accessibilityWantsToScrollToOffset:(CGPoint)a4 cardData:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  if (y >= 0.0)
  {
    id v11 = [v9 configuration];
    unsigned int v12 = [v11 cardsCanExpand];

    if (v12)
    {
      id v13 = [v9 cardSetViewController];
      [v13 scaledContractedOffset];
      double v15 = v14;
      id v16 = [v9 configuration];
      [v16 cardExpandedTopOffset];
      double v18 = v15 - v17;

      unsigned int v19 = [v9 contentScrollView];
      [v19 adjustedContentInset];
      double v21 = v18 - v20;

      double v22 = +[BCCardSetState expandingState];
      [v9 setCurrentState:v22];

      v23 = [v9 scrollView];
      v24 = [v9 animator];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_157ED8;
      v30[3] = &unk_2C3CC8;
      id v31 = v23;
      uint64_t v32 = 0;
      double v33 = v21;
      id v25 = v23;
      [v24 addAnimations:v30];

      v26 = [v9 animator];
      [v26 startAnimation];
    }
    else
    {
      unsigned int v27 = [v9 scrollView];
      [v27 setContentOffset:CGPointMake(x, y)];

      v28 = [v9 scrollView];
      v29 = [v9 contentScrollView];
      [(BCCardSetContractedState *)self updateScrollViewsWhenCantExpandCardViewController:v9 cardScrollView:v28 contentScrollView:v29];
    }
  }
}

- (BOOL)cardViewController:(id)a3 dismissPanShouldBegin:(id)a4 cardData:(id)a5
{
  BOOL v5 = [a3 configuration];
  if ([v5 cardsCanExpand]) {
    char v6 = _os_feature_enabled_impl();
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4
{
  id v4 = a3;
  BOOL v5 = [v4 cardNavigationController];
  char v6 = [v5 viewControllers];
  double v7 = 0.0;
  if ((unint64_t)[v6 count] <= 1)
  {
    id v8 = [v4 cardSetViewController];
    id v9 = [v8 currentCardViewController];
    if (v9 == v4) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
  }
  return v7;
}

@end