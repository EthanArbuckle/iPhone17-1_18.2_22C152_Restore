@interface BCCardSetState
+ (BCCardSetContractedState)contractedState;
+ (BCCardSetContractingState)contractingState;
+ (BCCardSetDismissingState)dismissingState;
+ (BCCardSetExpandedState)expandedState;
+ (BCCardSetExpandingState)expandingState;
+ (BCCardSetPushedContractedState)pushedContractedState;
+ (BCCardSetPushedState)pushedState;
+ (id)cardViewControllerContractedState:(id)a3;
+ (id)cardViewControllerExpandedState:(id)a3;
- (BOOL)cardViewController:(id)a3 dismissPanShouldBegin:(id)a4 cardData:(id)a5;
- (BOOL)contentOffsetUpdatesSuspended;
- (BOOL)ignoreContentOffsetForCardViewController:(id)a3;
- (BOOL)prefersStatusBarBackgroundHidden;
- (BOOL)transitioning;
- (BOOL)useContentInsetForContentForScrollIndicatorInsets;
- (CGSize)_adjustedContentSizeForCardViewController:(id)a3 contentSize:(CGSize)a4 includeDistanceToExpand:(BOOL)a5;
- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4;
- (double)_extraGripperOffsetForViewController:(id)a3;
- (double)cardViewController:(id)a3 cardScrollViewOffsetForContentScrollView:(id)a4 cardData:(id)a5;
- (double)cardViewController:(id)a3 cardYPositionInScreenFromCardScrollView:(id)a4 cardData:(id)a5;
- (double)cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4;
- (double)cardViewControllerStatusBarBackgroundOpacity:(id)a3;
- (double)yInScreenFromYInScrollView:(double)a3 cardViewController:(id)a4 cardData:(id)a5;
- (double)yInScrollView:(id)a3 cardViewController:(id)a4;
- (void)_scrollScrollViewToTopForCardViewController:(id)a3 animated:(BOOL)a4;
- (void)adjustScrollView:(id)a3 newContentOffset:(double)a4 allowRecursion:(BOOL)a5 cardData:(id)a6;
- (void)adjustScrollView:(id)a3 newContentOffset:(double)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 accessibilityWantsToScrollToOffset:(CGPoint)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6;
- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillEndDragging:(id)a5 withVelocity:(CGPoint)a6 targetContentOffset:(CGPoint *)a7 contentScrollView:(id)a8;
- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 dismissPan:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 positionAuxiliaryNavigationBarView:(id)a4 cardDate:(id)a5;
- (void)cardViewController:(id)a3 positionCardScrollViewBasedOnContentScrollView:(id)a4 cardDate:(id)a5;
- (void)cardViewController:(id)a3 repositionOffsetsWithContentScrollView:(id)a4 cardData:(id)a5;
- (void)cardViewController:(id)a3 updateContentSize:(CGSize)a4;
- (void)cardViewController:(id)a3 willDismissWithCardData:(id)a4;
- (void)cardViewControllerUpdateCardSize:(id)a3;
- (void)setContentOffsetUpdatesSuspended:(BOOL)a3;
- (void)updateCardSize:(id)a3 addExtra:(BOOL)a4;
- (void)updateCardViewController:(id)a3 contentScrollView:(id)a4 basedOnCardScrollView:(id)a5 cardData:(id)a6;
@end

@implementation BCCardSetState

- (BOOL)ignoreContentOffsetForCardViewController:(id)a3
{
  return [(BCCardSetState *)self contentOffsetUpdatesSuspended];
}

+ (BCCardSetExpandedState)expandedState
{
  if (qword_3493D0 != -1) {
    dispatch_once(&qword_3493D0, &stru_2CA278);
  }
  v2 = (void *)qword_3493C8;

  return (BCCardSetExpandedState *)v2;
}

+ (BCCardSetContractedState)contractedState
{
  if (qword_3493E0 != -1) {
    dispatch_once(&qword_3493E0, &stru_2CA298);
  }
  v2 = (void *)qword_3493D8;

  return (BCCardSetContractedState *)v2;
}

+ (BCCardSetExpandingState)expandingState
{
  if (qword_3493F0 != -1) {
    dispatch_once(&qword_3493F0, &stru_2CA2B8);
  }
  v2 = (void *)qword_3493E8;

  return (BCCardSetExpandingState *)v2;
}

+ (BCCardSetContractingState)contractingState
{
  if (qword_349400 != -1) {
    dispatch_once(&qword_349400, &stru_2CA2D8);
  }
  v2 = (void *)qword_3493F8;

  return (BCCardSetContractingState *)v2;
}

+ (BCCardSetDismissingState)dismissingState
{
  if (qword_349410 != -1) {
    dispatch_once(&qword_349410, &stru_2CA2F8);
  }
  v2 = (void *)qword_349408;

  return (BCCardSetDismissingState *)v2;
}

+ (BCCardSetPushedState)pushedState
{
  if (qword_349420 != -1) {
    dispatch_once(&qword_349420, &stru_2CA318);
  }
  v2 = (void *)qword_349418;

  return (BCCardSetPushedState *)v2;
}

+ (BCCardSetPushedContractedState)pushedContractedState
{
  if (qword_349430 != -1) {
    dispatch_once(&qword_349430, &stru_2CA338);
  }
  v2 = (void *)qword_349428;

  return (BCCardSetPushedContractedState *)v2;
}

+ (id)cardViewControllerExpandedState:(id)a3
{
  v4 = [a3 cardNavigationController];
  v5 = [v4 childViewControllers];
  if ((unint64_t)[v5 count] > 1) {
    [a1 pushedState];
  }
  else {
  v6 = [a1 expandedState];
  }

  return v6;
}

+ (id)cardViewControllerContractedState:(id)a3
{
  v4 = [a3 cardNavigationController];
  v5 = [v4 childViewControllers];
  if ((unint64_t)[v5 count] > 1) {
    [a1 pushedContractedState];
  }
  else {
  v6 = [a1 contractedState];
  }

  return v6;
}

- (double)cardViewControllerStatusBarBackgroundOpacity:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v5 = [v3 cardNavigationController];
    if ([v5 isNavigationBarHidden]) {
      double v4 = 1.0;
    }
    else {
      double v4 = 0.0;
    }
  }
  return v4;
}

- (double)cardViewController:(id)a3 cardYPositionInScreenFromCardScrollView:(id)a4 cardData:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(BCCardSetState *)self yInScrollView:a4 cardViewController:v9];
  -[BCCardSetState yInScreenFromYInScrollView:cardViewController:cardData:](self, "yInScreenFromYInScrollView:cardViewController:cardData:", v9, v8);
  double v11 = v10;

  return v11;
}

- (BOOL)transitioning
{
  return 0;
}

- (BOOL)useContentInsetForContentForScrollIndicatorInsets
{
  return 0;
}

- (double)yInScrollView:(id)a3 cardViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 contentOffset];
  double v8 = v7;
  [v5 adjustedContentInset];
  double v10 = v8 + v9;

  double v11 = [v6 cardSetViewController];

  [v11 scaledContractedOffset];
  double v13 = v12 - v10;

  return v13;
}

- (double)yInScreenFromYInScrollView:(double)a3 cardViewController:(id)a4 cardData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  double v9 = [v7 cardSetData];
  double v10 = [v9 scrollView];
  double v11 = [v10 layer];

  double v12 = [v11 presentationLayer];
  if (v12)
  {
    double v13 = [v7 animator];
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  v15 = [v8 cardSetViewController];

  v16 = [v15 view];
  v17 = [v16 layer];

  if (v14)
  {
    uint64_t v18 = [v17 presentationLayer];

    uint64_t v19 = [v11 presentationLayer];

    double v11 = (void *)v19;
    v17 = (void *)v18;
  }
  [v11 convertPoint:v17 toLayer:0.0, a3];
  double v21 = v20;

  return v21;
}

- (void)cardViewController:(id)a3 repositionOffsetsWithContentScrollView:(id)a4 cardData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 scrollView];
  [(BCCardSetState *)self updateCardViewController:v10 contentScrollView:v9 basedOnCardScrollView:v11 cardData:v8];
}

- (void)updateCardViewController:(id)a3 contentScrollView:(id)a4 basedOnCardScrollView:(id)a5 cardData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = [v13 configuration];
  [v14 cardExpandedTopOffset];
  double v16 = v15;

  v17 = [v13 cardSetData];
  uint64_t v18 = [v17 scrollView];
  uint64_t v19 = [v18 layer];

  double v20 = [v19 presentationLayer];
  if (v20)
  {
    double v21 = [v13 animator];
    BOOL v22 = v21 != 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  v23 = [v10 cardSetViewController];
  v24 = [v23 view];
  v25 = [v24 layer];

  if (v22)
  {
    uint64_t v26 = [v25 presentationLayer];

    uint64_t v27 = [v19 presentationLayer];

    v25 = (void *)v26;
    uint64_t v19 = (void *)v27;
  }
  [v25 frame];
  [v19 convertRect:v25 fromLayer:];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  [(BCCardSetState *)self yInScrollView:v12 cardViewController:v10];
  double v37 = v36;
  v71.origin.x = v29;
  v71.origin.y = v31;
  v71.size.width = v33;
  v71.size.height = v35;
  double v38 = CGRectGetMinY(v71) - v37;
  [v25 convertPoint:v19 toLayer:0.0];
  double v40 = fmin(v38, -v39);
  id v41 = v12;
  v42 = [v10 topContentViewController];
  unsigned int v43 = [v42 prefersAdditionalSafeAreaInsetsForInsetting];

  [v41 contentOffset];
  double v45 = v44;
  if (v43) {
    [v41 adjustedContentInset];
  }
  else {
    [v41 contentInset];
  }
  double v47 = v46;

  if (v40 <= 0.0)
  {
    long long v48 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v70.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v70.c = v48;
    *(_OWORD *)&v70.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    CGAffineTransformMakeTranslation(&v70, 0.0, v40);
  }
  double v49 = fmax(v38 - v40, 0.0);
  double v50 = v45 + v47;
  v51 = [v10 cardNavigationController];
  v52 = [v51 view];
  CGAffineTransform v69 = v70;
  [v52 setTransform:&v69];

  v53 = [v10 cardNavigationController];
  v54 = [v53 view];
  v55 = v54;
  if (v54)
  {
    [v54 transform];
  }
  else
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v66 = 0u;
  }
  v56 = [v10 auxiliaryNavigationBarView];
  v65[0] = v66;
  v65[1] = v67;
  v65[2] = v68;
  [v56 setTransform:v65];

  CGAffineTransformMakeTranslation(&v64, 0.0, -(v50 - v49));
  v57 = [v10 cardView];
  CGAffineTransform v63 = v64;
  [v57 setTransform:&v63];

  double v58 = fmax(v38, 0.0);
  v59 = [v10 topContentViewController];
  unsigned int v60 = [v59 prefersAdditionalSafeAreaInsetsForInsetting];

  if (v60) {
    [v11 adjustedContentInset];
  }
  else {
    [v11 contentInset];
  }
  double v62 = v58 - v61;
  [(BCCardSetState *)self setContentOffsetUpdatesSuspended:1];
  [v11 setContentOffset:0.0 v62];
  [(BCCardSetState *)self setContentOffsetUpdatesSuspended:0];
}

- (double)cardViewController:(id)a3 cardScrollViewOffsetForContentScrollView:(id)a4 cardData:(id)a5
{
  id v5 = [a3 scrollView];
  [v5 contentOffset];
  double v7 = v6;

  return v7;
}

- (CGSize)_adjustedContentSizeForCardViewController:(id)a3 contentSize:(CGSize)a4 includeDistanceToExpand:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  id v7 = a3;
  id v8 = v7;
  if (v5)
  {
    id v9 = [v7 cardSetViewController];
    [v9 scaledContractedOffset];
    double height = height + v10;
  }
  id v11 = [v8 view];
  [v11 bounds];
  double v13 = v12;

  double v14 = v13;
  double v15 = height;
  result.double height = v15;
  result.width = v14;
  return result;
}

- (void)cardViewController:(id)a3 updateContentSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [v7 configuration];
  -[BCCardSetState _adjustedContentSizeForCardViewController:contentSize:includeDistanceToExpand:](self, "_adjustedContentSizeForCardViewController:contentSize:includeDistanceToExpand:", v7, [v8 cardsCanExpand], width, height);
  double v10 = v9;
  double v12 = v11;

  id v13 = [v7 scrollView];

  [v13 setContentSize:v10, v12];
}

- (void)updateCardSize:(id)a3 addExtra:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = [v5 view];
  [v6 bounds];
  CGRectMakeWithSize();
  double v8 = v7;

  if (v4)
  {
    double v9 = [v5 configuration];
    unsigned int v10 = [v9 cardsCanExpand];

    double v11 = v8;
    if (v10)
    {
      double v12 = [v5 configuration];
      [v12 cardExpandedTopOffset];
      double v11 = v8 - v13;
    }
    double v14 = [v5 configuration];
    [v14 cardCornerRadius];
    double v16 = v11 + v15;

    if (v16 <= 0.0)
    {
      uint64_t v18 = BCCardModelLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v55 = 134217984;
        double v56 = v16;
        _os_log_impl(&def_7D91C, v18, OS_LOG_TYPE_DEFAULT, "In updateCardSize, addExtra:YES. Resulting height (%f) is <= 0, so not adjusting frame.", (uint8_t *)&v55, 0xCu);
      }
    }
    else
    {
      v17 = [v5 cardSetViewController];
      [v17 scaledContractedOffset];
    }
  }
  CGRectGetCenterNoRounding();
  double v21 = v19;
  double v22 = v20;
  v23 = [v5 cardView];
  [v23 setCenter:v21, v22];

  v24 = [v5 cardView];
  [v24 bounds];
  CGRectMakeWithOriginSize();
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  CGFloat v33 = [v5 cardView];
  [v33 setBounds:v26, v28, v30, v32];

  double v34 = [v5 configuration];
  if (![v34 cardsCanExpand])
  {

    goto LABEL_15;
  }
  unsigned __int8 v35 = [v5 expanded];

  if (v35)
  {
LABEL_15:
    double v36 = [v5 view];
    [v36 bounds];
    CGRectMakeWithSize();
    goto LABEL_16;
  }
  double v36 = [v5 cardSetViewController];
  [v36 scaledContractedOffset];
LABEL_16:

  CGRectGetCenterNoRounding();
  double v38 = v37;
  double v40 = v39;
  id v41 = [v5 cardNavigationController];
  v42 = [v41 view];
  [v42 setCenter:v38, v40];

  unsigned int v43 = [v5 cardNavigationController];
  double v44 = [v43 view];
  [v44 bounds];
  CGRectMakeWithOriginSize();
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  v53 = [v5 cardNavigationController];
  v54 = [v53 view];
  [v54 setBounds:v46, v48, v50, v52];
}

- (void)cardViewControllerUpdateCardSize:(id)a3
{
}

- (void)adjustScrollView:(id)a3 newContentOffset:(double)a4 cardData:(id)a5
{
}

- (void)adjustScrollView:(id)a3 newContentOffset:(double)a4 allowRecursion:(BOOL)a5 cardData:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  [v9 contentOffset];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_156B58;
  v15[3] = &unk_2C3CC8;
  id v16 = v9;
  uint64_t v17 = v11;
  double v18 = a4;
  id v12 = v9;
  double v13 = objc_retainBlock(v15);
  double v14 = (void (**)(void))v13;
  if (a5)
  {
    ((void (*)(void *))v13[2])(v13);
  }
  else
  {
    [v10 setSettingContentOffset:1];
    v14[2](v14);
    [v10 setSettingContentOffset:0];
  }
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6
{
  id v7 = a6;
  [a4 animator];

  id v8 = [v7 delegate];
  [v8 scrollViewWillBeginDragging:v7];
}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"must override %s", "-[BCCardSetState cardViewController:contentScrollViewDidChange:cardData:]");
  id v11 = +[NSException exceptionWithName:@"abstract base class" reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillEndDragging:(id)a5 withVelocity:(CGPoint)a6 targetContentOffset:(CGPoint *)a7 contentScrollView:(id)a8
{
  double y = a6.y;
  id v52 = a3;
  id v12 = a4;
  id v13 = a5;
  double v14 = [v52 cardNavigationController];
  double v15 = [v14 viewControllers];
  id v16 = [v15 count];

  if ((unint64_t)v16 <= 1)
  {
    double v17 = a7->y;
    [v13 adjustedContentInset];
    double v19 = v17 - v18;
    double v20 = [v52 cardSetViewController];
    [v20 scaledContractedOffset];
    double v22 = v21;

    v23 = [v12 cardSetData];
    v24 = [v23 scrollView];
    double v25 = [v24 layer];

    double v26 = [v25 presentationLayer];
    if (v26)
    {
      double v27 = [v12 animator];
      BOOL v28 = v27 != 0;
    }
    else
    {
      BOOL v28 = 0;
    }
    double v29 = v22 - v19;

    double v30 = [v52 cardSetViewController];
    double v31 = [v30 view];
    double v32 = [v31 layer];

    if (v28)
    {
      uint64_t v33 = [v32 presentationLayer];

      uint64_t v34 = [v25 presentationLayer];

      double v32 = (void *)v33;
      double v25 = (void *)v34;
    }
    [v25 convertPoint:v32 toLayer:0.0 v29];
    double v36 = v35;
    double v37 = [v12 configuration];
    [v37 cardExpandedTopOffset];
    if (v36 <= v38)
    {

      goto LABEL_15;
    }
    double v39 = [v12 configuration];
    [v39 cardUnexpandedTopOffset];
    double v41 = v40;

    if (v36 >= v41)
    {
LABEL_15:

      goto LABEL_16;
    }
    BOOL v42 = y <= 0.0;
    if (y == 0.0)
    {
      double v43 = 0.0;
      if (v36 <= 0.0) {
        goto LABEL_11;
      }
    }
    else
    {
      double v43 = 0.0;
      if (!v42)
      {
LABEL_11:
        double v44 = [v52 cardSetViewController];
        [v44 scaledContractedOffset];
        double v46 = v45;
        double v47 = [v52 configuration];
        [v47 cardExpandedTopOffset];
        double v43 = v46 - v48 + 1.0;

        [v13 bounds];
        double v49 = v43 + CGRectGetHeight(v54);
        [v13 contentSize];
        if (v49 > v50) {
          double v43 = 0.0;
        }
      }
    }
    [v13 adjustedContentInset];
    a7->double y = v43 + v51;
    goto LABEL_15;
  }
LABEL_16:
}

- (void)cardViewController:(id)a3 willDismissWithCardData:(id)a4
{
  id v4 = a4;
  [v4 setDismissing:1];
  id v5 = [v4 scrollView];

  [v5 _stopScrollingAndZoomingAnimations];
}

- (void)_scrollScrollViewToTopForCardViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  double y = CGPointZero.y;
  [v7 adjustedContentInset];
  [v7 setContentOffset:CGPointZero.x, y - v6];
}

- (void)cardViewController:(id)a3 accessibilityWantsToScrollToOffset:(CGPoint)a4 cardData:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [a3 scrollView];
  [v7 setContentOffset:CGPointMake(x, y)];
}

- (BOOL)cardViewController:(id)a3 dismissPanShouldBegin:(id)a4 cardData:(id)a5
{
  return 0;
}

- (void)cardViewController:(id)a3 dismissPan:(id)a4 cardData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 scrollView];
  [v10 setScrollEnabled:0];

  id v11 = [v9 scrollView];
  [v11 _stopScrollingAndZoomingAnimations];

  id v12 = +[BCCardSetState dismissingState];
  [v7 setCurrentState:v12];

  id v13 = [v7 currentState];
  [v13 cardViewController:v9 dismissPan:v8 cardData:v7];
}

- (void)cardViewController:(id)a3 positionCardScrollViewBasedOnContentScrollView:(id)a4 cardDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 scrollView];
  [v11 contentOffset];
  double v13 = v12;

  [(BCCardSetState *)self cardViewController:v10 cardScrollViewOffsetForContentScrollView:v9 cardData:v8];
  double v15 = v14;

  id v16 = [v10 scrollView];

  [v16 setContentOffset:v13, v15];
}

- (double)_extraGripperOffsetForViewController:(id)a3
{
  return 0.0;
}

- (void)cardViewController:(id)a3 positionAuxiliaryNavigationBarView:(id)a4 cardDate:(id)a5
{
  id v43 = a3;
  id v7 = a5;
  id v8 = [v7 configuration];
  [v8 cardExpandedTopOffset];
  double v10 = v9;

  id v11 = [v43 scrollView];
  double v12 = [v7 cardSetData];
  double v13 = [v12 scrollView];
  double v14 = [v13 layer];

  double v15 = [v14 presentationLayer];
  if (v15)
  {
    id v16 = [v7 animator];
    BOOL v17 = v16 != 0;
  }
  else
  {
    BOOL v17 = 0;
  }

  double v18 = [v43 cardSetViewController];
  double v19 = [v18 view];
  double v20 = [v19 layer];

  if (v17)
  {
    uint64_t v21 = [v20 presentationLayer];

    uint64_t v22 = [v14 presentationLayer];

    double v20 = (void *)v21;
    double v14 = (void *)v22;
  }
  [v20 frame];
  [v14 convertRect:v20 fromLayer:];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [(BCCardSetState *)self yInScrollView:v11 cardViewController:v43];
  double v32 = v31;
  v45.origin.double x = v24;
  v45.origin.double y = v26;
  v45.size.double width = v28;
  v45.size.double height = v30;
  double v33 = CGRectGetMinY(v45) - v32;
  [v20 convertPoint:v14 toLayer:0.0];
  double v35 = fmin(v33, -v34);
  [(BCCardSetState *)self _extraGripperOffsetForViewController:v43];
  double v37 = -v36;
  if (v36 + v35 < v36) {
    double v36 = v36 + v35;
  }
  if (v35 <= v37) {
    double v38 = 0.0;
  }
  else {
    double v38 = v36;
  }
  if (_os_feature_enabled_impl())
  {
    double v39 = [v7 auxiliaryNavigationBarTopConstraint];
    [v39 setConstant:v38];
  }
  else
  {
    double v39 = [v43 configuration];
    [v39 auxiliaryNavigationBarVerticalInset];
    double v41 = v38 + v40;
    BOOL v42 = [v7 auxiliaryNavigationBarTopConstraint];
    [v42 setConstant:v41];
  }
}

- (double)cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4
{
  [(BCCardSetState *)self _cardViewControllerAuxiliaryNavigationBarAlpha:a3 cardData:a4];
  return result;
}

- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4
{
  return 1.0;
}

- (BOOL)prefersStatusBarBackgroundHidden
{
  return self->_prefersStatusBarBackgroundHidden;
}

- (BOOL)contentOffsetUpdatesSuspended
{
  return self->_contentOffsetUpdatesSuspended;
}

- (void)setContentOffsetUpdatesSuspended:(BOOL)a3
{
  self->_contentOffsetUpdatesSuspended = a3;
}

@end