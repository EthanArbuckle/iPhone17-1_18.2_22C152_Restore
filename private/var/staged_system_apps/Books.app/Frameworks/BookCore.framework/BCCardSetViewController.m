@interface BCCardSetViewController
- (BCCardSetDataSource)dataSource;
- (BCCardSetDelegate)delegate;
- (BCCardSetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BCCardSetViewControllerViewState)viewState;
- (BCCardStackConfiguration)configuration;
- (BCCardViewController)currentCardViewController;
- (BCStatusBarBackgroundController)statusBarBackgroundController;
- (BOOL)_isRTL;
- (BOOL)accessibilityDismissCardSetView:(id)a3;
- (BOOL)bc_analyticsVisibilityOfChild:(id)a3;
- (BOOL)canBecomeFirstResponder;
- (BOOL)cardViewControllerCanCloseAsset:(id)a3;
- (BOOL)cardsAppendedDuringTransition;
- (BOOL)covered;
- (BOOL)expanded;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isDragging;
- (BOOL)isInTransitionUpdateMode;
- (BOOL)isPresentationTransitionCompleted;
- (BOOL)itemPushedOnCardAtIndex:(unint64_t)a3;
- (BOOL)needLayoutCards;
- (CGAffineTransform)contractedTransform;
- (CGAffineTransform)expandedTransform;
- (CGRect)_frameForCardAtIndex:(int64_t)a3;
- (CGRect)_frameForPageAtIndex:(int64_t)a3;
- (CGRect)frameForCardAtIndex:(int64_t)a3 inCoordinatesOfCardAtIndex:(int64_t)a4;
- (CGRect)initialFrame;
- (CGSize)cardSize;
- (NSMapTable)scrollingAssertions;
- (NSMapTable)suspendedCardsScrollingAssertions;
- (NSMutableDictionary)displayedCardViewControllers;
- (NSMutableDictionary)suspendedCardViewControllers;
- (NSNumber)hoveringCardIndex;
- (NSNumber)incomingCardIndex;
- (NSNumber)lastKnownScrollEndCardIndex;
- (NSNumber)outgoingCardIndex;
- (NSNumber)scrollStartCardIndex;
- (UIButton)leftArrowButton;
- (UIButton)rightArrowButton;
- (UIEdgeInsets)contentInset;
- (UIPercentDrivenInteractiveTransition)percentDrivenInteractiveTransition;
- (UIScreenEdgePanGestureRecognizer)edgePanGestureRecognizer;
- (UIScrollView)scrollView;
- (UITapGestureRecognizer)tapToDismissGestureRecognizer;
- (UIView)navigationSkrimView;
- (_NSRange)_visibleCardRangePassingTest:(id)a3;
- (_NSRange)visibleCardRange;
- (double)_cardSeparation;
- (double)_cardWidthForContainerWidth:(double)a3 usingConfiguration:(id)a4;
- (double)_debugDragCoefficient;
- (double)_flipScrollViewOffsetIfNeeded:(double)a3 width:(double)a4;
- (double)_xOffsetForHiddenSideCardOnLeadingSide:(BOOL)a3;
- (double)cutoffToDismissScrollView:(id)a3;
- (double)distanceToDismiss;
- (double)distanceToExpand;
- (double)pagingWidth;
- (double)scaleOffset:(double)a3 withTransform:(CGAffineTransform *)a4;
- (double)scaledContractedOffset;
- (double)scrollToTopVelocity;
- (id)accessibilityScrollStatusForWideTouchScrollView:(id)a3;
- (id)additionalAccessibilityElementsForCardSetView;
- (id)animatorForExpandingTransformingView:(id)a3 duration:(double)a4;
- (id)animatorForExpandingTransformingView:(id)a3 timingParameter:(id)a4 duration:(double)a5;
- (id)animatorForInteractiveDismiss;
- (id)animatorForUnexpandingTransformingView:(id)a3 timingParameter:(id)a4 duration:(double)a5;
- (id)cardViewControllerAtIndex:(unint64_t)a3;
- (id)endExpandedBlock;
- (id)expandedCardViewController;
- (id)im_visibleChildViewControllers;
- (id)keyCommands;
- (int64_t)_currentIndexFromScrollViewBounds;
- (int64_t)lastNavigationType;
- (unint64_t)cardCount;
- (unint64_t)currentIndex;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_didBecomeVisibleContentScrollView;
- (void)_didCommitDismissWithVelocity:(double)a3 interactiveAnimator:(id)a4;
- (void)_goContractedCommon;
- (void)_goContractedCommonTransformingView:(id)a3;
- (void)_goToNextCardWithKeyCommand:(id)a3;
- (void)_goToPreviousCardWithKeyCommand:(id)a3;
- (void)_layoutCards;
- (void)_scrollViewDidEndScrolling;
- (void)_updateCurrentIndexIfNeeded;
- (void)_updateFramesToSize:(CGSize)a3;
- (void)animationCompletedExpanded:(BOOL)a3;
- (void)backgroundTapped:(id)a3;
- (void)beginTransitionUpdateModeForCardsAtRange:(_NSRange)a3;
- (void)cardLayoutDidChange:(BOOL)a3;
- (void)cardTapped:(id)a3;
- (void)cardViewControllerDidTapCard:(id)a3;
- (void)cardViewControllerDidTapCloseAllCards:(id)a3;
- (void)cardViewControllerDidTapCloseAsset:(id)a3;
- (void)cardViewControllerDidTapScrollView:(id)a3;
- (void)clearSavedContentOffsetsForCardAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)didBecomeTopCardSet;
- (void)dismissAllCardsAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissCardSetAnimated;
- (void)dismissCardStackAnimated:(BOOL)a3;
- (void)edgePanGesture:(id)a3;
- (void)endTransitionUpdateMode;
- (void)enumerateAllCardsUsingBlock:(id)a3;
- (void)goContracted;
- (void)goContractedInteractive:(BOOL)a3;
- (void)goContractedInteractive:(BOOL)a3 withTiming:(id)a4;
- (void)goContractedWithBounce:(double)a3;
- (void)goExpanded;
- (void)goExpandedInteractive:(BOOL)a3;
- (void)goToNextCard;
- (void)goToPreviousCard;
- (void)loadView;
- (void)prepareForDismiss;
- (void)presentationTransitionDidComplete;
- (void)resumeAndRebuildForReason:(id)a3;
- (void)scrollCurrentCardToTop;
- (void)scrollToTopCardAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setCardSize:(CGSize)a3;
- (void)setCardsAppendedDuringTransition:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContractedTransform:(CGAffineTransform *)a3;
- (void)setCovered:(BOOL)a3;
- (void)setCovered:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedCardViewControllers:(id)a3;
- (void)setDistanceToDismiss:(double)a3;
- (void)setDistanceToExpand:(double)a3;
- (void)setEdgePanGestureRecognizer:(id)a3;
- (void)setEndExpandedBlock:(id)a3;
- (void)setExpandedTransform:(CGAffineTransform *)a3;
- (void)setFocusedIndex:(unint64_t)a3;
- (void)setFocusedIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setHoveringCardIndex:(id)a3;
- (void)setIncomingCardIndex:(id)a3;
- (void)setInitialFrame:(CGRect)a3;
- (void)setIsDragging:(BOOL)a3;
- (void)setIsInTransitionUpdateMode:(BOOL)a3;
- (void)setLastKnownScrollEndCardIndex:(id)a3;
- (void)setLastNavigationType:(int64_t)a3;
- (void)setLeftArrowButton:(id)a3;
- (void)setNavigationSkrimView:(id)a3;
- (void)setNeedLayoutCards:(BOOL)a3;
- (void)setOutgoingCardIndex:(id)a3;
- (void)setPagingWidth:(double)a3;
- (void)setPercentDrivenInteractiveTransition:(id)a3;
- (void)setRightArrowButton:(id)a3;
- (void)setScaledContractedOffset:(double)a3;
- (void)setScrollStartCardIndex:(id)a3;
- (void)setScrollToTopVelocity:(double)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollingAssertions:(id)a3;
- (void)setStatusBarBackgroundController:(id)a3;
- (void)setSuspendedCardViewControllers:(id)a3;
- (void)setSuspendedCardsScrollingAssertions:(id)a3;
- (void)setTapToDismissGestureRecognizer:(id)a3;
- (void)setViewState:(id)a3;
- (void)suspendAndTeardownForReason:(id)a3;
- (void)updateCards;
- (void)updateContractedTransform;
- (void)updateWithAppendedCards;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (void)zoomingAnimationCompletedAtPosition:(int64_t)a3;
@end

@implementation BCCardSetViewController

- (BCCardSetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)BCCardSetViewController;
  v4 = [(BCCardSetViewController *)&v12 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_currentIndex = -1;
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    suspendedCardViewControllers = v5->_suspendedCardViewControllers;
    v5->_suspendedCardViewControllers = v6;

    uint64_t v8 = +[NSMapTable mapTableWithStrongToStrongObjects];
    suspendedCardsScrollingAssertions = v5->_suspendedCardsScrollingAssertions;
    v5->_suspendedCardsScrollingAssertions = (NSMapTable *)v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v5 selector:"_applicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
    [v10 addObserver:v5 selector:"_applicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];
  [v3 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)BCCardSetViewController;
  [(BCCardSetViewController *)&v4 dealloc];
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  objc_super v4 = [(BCCardSetViewController *)self viewState];

  if (v4)
  {
    v5 = [(BCCardSetViewController *)self view];
    [v5 size];
    double v7 = v6;
    double v9 = v8;
    v10 = [(BCCardSetViewController *)self viewState];
    [v10 viewSize];
    double v12 = v11;
    double v14 = v13;

    if (v7 == v12 && v9 == v14)
    {
      v15 = [(BCCardSetViewController *)self viewState];
      unsigned int v16 = [v15 isExpanded];
      unsigned int v17 = [(BCCardSetViewController *)self expanded];

      if (v16 != v17)
      {
        if ([(BCCardSetViewController *)self expanded]) {
          [(BCCardSetViewController *)self goContracted];
        }
        else {
          [(BCCardSetViewController *)self goExpanded];
        }
      }
    }
    [(BCCardSetViewController *)self setViewState:0];
  }
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  objc_super v4 = [(BCCardSetViewController *)self viewState];

  if (!v4)
  {
    v5 = [BCCardSetViewControllerViewState alloc];
    BOOL v6 = [(BCCardSetViewController *)self expanded];
    id v8 = [(BCCardSetViewController *)self view];
    [v8 size];
    double v7 = -[BCCardSetViewControllerViewState initWithIsExpanded:viewSize:](v5, "initWithIsExpanded:viewSize:", v6);
    [(BCCardSetViewController *)self setViewState:v7];
  }
}

- (id)expandedCardViewController
{
  if ([(BCCardSetViewController *)self expanded])
  {
    v3 = [(BCCardSetViewController *)self currentCardViewController];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BCCardViewController)currentCardViewController
{
  v3 = [(BCCardSetViewController *)self displayedCardViewControllers];
  objc_super v4 = +[NSNumber numberWithUnsignedInteger:[(BCCardSetViewController *)self currentIndex]];
  v5 = [v3 objectForKeyedSubscript:v4];

  return (BCCardViewController *)v5;
}

- (unint64_t)cardCount
{
  v3 = [(BCCardSetViewController *)self dataSource];
  if (v3)
  {
    objc_super v4 = [(BCCardSetViewController *)self dataSource];
    id v5 = [v4 cardCountForCardSet:self];
  }
  else
  {
    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    double v7 = [(BCCardSetViewController *)self displayedCardViewControllers];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_560D8;
    v8[3] = &unk_2C59B0;
    v8[4] = self;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

- (void)setLastNavigationType:(int64_t)a3
{
  self->_lastNavigationType = a3;
  id v5 = (char *)[(BCCardSetViewController *)self visibleCardRange];
  if (v6)
  {
    double v7 = v5;
    uint64_t v8 = v6;
    do
    {
      double v9 = [(BCCardSetViewController *)self cardViewControllerAtIndex:v7];
      v10 = [v9 topContentViewController];
      double v11 = BUProtocolCast();

      [v11 cardSetViewController:self willUpdateWithNavigationType:a3];
      ++v7;
      --v8;
    }
    while (v8);
  }
}

- (int64_t)lastNavigationType
{
  return self->_lastNavigationType;
}

- (double)_cardSeparation
{
  v3 = [(BCCardSetViewController *)self view];
  [v3 bounds];
  double Width = CGRectGetWidth(v12);

  id v5 = [(BCCardSetViewController *)self configuration];
  [v5 cardGapForContainerWidth:Width];
  double v7 = v6;
  uint64_t v8 = [(BCCardSetViewController *)self configuration];
  [v8 cardContractedScale];
  double v10 = v7 / v9;

  return v10;
}

- (double)cutoffToDismissScrollView:(id)a3
{
  [a3 frame];
  double Height = CGRectGetHeight(v7);
  [(BCCardSetViewController *)self distanceToExpand];
  return floor((Height - v5) * 0.2);
}

- (double)scaleOffset:(double)a3 withTransform:(CGAffineTransform *)a4
{
  CGRect v7 = [(BCCardSetViewController *)self view];
  [v7 bounds];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  long long v16 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v25.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v25.c = v16;
  *(_OWORD *)&v25.tx = *(_OWORD *)&a4->tx;
  uint64_t v17 = v9;
  *(void *)&long long v16 = v11;
  uint64_t v18 = v13;
  uint64_t v19 = v15;
  CGRect v26 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v16 - 8), &v25);
  double height = v26.size.height;
  v21 = [(BCCardSetViewController *)self view];
  [v21 bounds];
  double v23 = (a3 + (v22 - height) * -0.5) / a4->d;

  return v23;
}

- (void)updateContractedTransform
{
  v3 = [(BCCardSetViewController *)self configuration];
  [v3 cardContractedScale];
  CGFloat v5 = v4;
  double v6 = [(BCCardSetViewController *)self configuration];
  [v6 cardContractedScale];
  CGAffineTransformMakeScale(&v27, v5, v7);
  CGAffineTransform v26 = v27;
  [(BCCardSetViewController *)self setContractedTransform:&v26];

  uint64_t v8 = [(BCCardSetViewController *)self configuration];
  [v8 cardUnexpandedTopOffset];
  double v10 = v9;
  [(BCCardSetViewController *)self contractedTransform];
  [(BCCardSetViewController *)self scaleOffset:&v25 withTransform:v10];
  double v12 = v11;

  uint64_t v13 = [(BCCardSetViewController *)self scrollView];
  [v13 bounds];
  double Height = CGRectGetHeight(v28);

  uint64_t v15 = [(BCCardSetViewController *)self configuration];
  [v15 cardUnexpandedTopOffset];
  double v17 = v16;
  uint64_t v18 = [(BCCardSetViewController *)self configuration];
  [v18 cardExpandedTopOffset];
  [(BCCardSetViewController *)self setDistanceToExpand:v17 - v19];

  [(BCCardSetViewController *)self distanceToExpand];
  double v21 = Height - v20;
  double v22 = [(BCCardSetViewController *)self configuration];
  [v22 cardContractedScale];
  [(BCCardSetViewController *)self setDistanceToDismiss:v21 / v23];

  [(BCCardSetViewController *)self setScaledContractedOffset:v12];
  v24 = [(BCCardSetViewController *)self configuration];
  [v24 cardsCanExpand];
}

- (void)cardTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardSetViewController *)self currentCardViewController];

  if (v5 != v4)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    double v6 = [(BCCardSetViewController *)self displayedCardViewControllers];
    uint64_t v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    double v10 = sub_56628;
    double v11 = &unk_2C59D8;
    id v12 = v4;
    uint64_t v13 = &v14;
    [v6 enumerateKeysAndObjectsUsingBlock:&v8];

    uint64_t v7 = v15[3];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      -[BCCardSetViewController setFocusedIndex:animated:](self, "setFocusedIndex:animated:", v7, 1, v8, v9, v10, v11);
    }

    _Block_object_dispose(&v14, 8);
  }
}

- (void)dismissCardStackAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BCCardSetViewController *)self cardStackViewController];
  [v4 popCardsAnimated:v3];
}

- (void)dismissAllCardsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(BCCardSetViewController *)self cardStackViewController];
  [v7 popAllCardsAnimated:v4 completion:v6];
}

- (void)backgroundTapped:(id)a3
{
  if ([a3 state] == (char *)&def_7D91C + 3)
  {
    [(BCCardSetViewController *)self dismissCardStackAnimated:1];
  }
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)BCCardSetViewController;
  [(BCCardSetViewController *)&v5 loadView];
  BOOL v3 = [BCCardSetView alloc];
  [(BCCardSetViewController *)self initialFrame];
  BOOL v4 = -[BCCardSetView initWithFrame:](v3, "initWithFrame:");
  [(BCCardSetView *)v4 setAutoresizingMask:18];
  [(BCCardSetView *)v4 setAccessibilityDelegate:self];
  [(BCCardSetViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)BCCardSetViewController;
  [(BCCardSetViewController *)&v26 viewDidLoad];
  BOOL v3 = +[UIColor clearColor];
  BOOL v4 = [(BCCardSetViewController *)self view];
  [v4 setBackgroundColor:v3];

  objc_super v5 = [(BCCardSetViewController *)self view];
  [v5 setAccessibilityViewIsModal:1];

  id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"backgroundTapped:"];
  [v6 setDelegate:self];
  id v7 = [(BCCardSetViewController *)self view];
  [v7 addGestureRecognizer:v6];

  [(BCCardSetViewController *)self setTapToDismissGestureRecognizer:v6];
  uint64_t v8 = -[BCCardSetWideTouchScrollView initWithFrame:]([BCCardSetWideTouchScrollView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(BCCardSetWideTouchScrollView *)v8 setAccessibilityDelegate:self];
  [(BCCardSetViewController *)self setScrollView:v8];
  uint64_t v9 = [(BCCardSetViewController *)self scrollView];
  [v9 setPagingEnabled:1];

  double v10 = [(BCCardSetViewController *)self scrollView];
  [v10 setClipsToBounds:0];

  double v11 = [(BCCardSetViewController *)self scrollView];
  [v11 setShowsHorizontalScrollIndicator:0];

  id v12 = [(BCCardSetViewController *)self scrollView];
  [v12 setShowsVerticalScrollIndicator:0];

  uint64_t v13 = [(BCCardSetViewController *)self view];
  [v13 bounds];
  -[BCCardSetViewController _updateFramesToSize:](self, "_updateFramesToSize:", v14, v15);

  [(BCCardSetViewController *)self _frameForPageAtIndex:0];
  double v17 = v16;
  double v19 = v18;
  double v20 = [(BCCardSetViewController *)self scrollView];
  [v20 setContentOffset:0 animated:v17, v19];

  double v21 = [(BCCardSetViewController *)self view];
  double v22 = [(BCCardSetViewController *)self scrollView];
  [v21 addSubview:v22];

  long long v23 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v25[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v25[1] = v23;
  v25[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(BCCardSetViewController *)self setExpandedTransform:v25];
  [(BCCardSetViewController *)self updateContractedTransform];
  [(BCCardSetViewController *)self updateCards];
  [(BCCardSetViewController *)self goContracted];
  v24 = [(BCCardSetViewController *)self scrollView];
  [v24 setDelegate:self];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCCardSetViewController;
  [(BCCardSetViewController *)&v4 viewDidAppear:a3];
  [(BCCardSetViewController *)self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCCardSetViewController;
  [(BCCardSetViewController *)&v4 viewWillDisappear:a3];
  [(BCCardSetViewController *)self resignFirstResponder];
}

- (BOOL)expanded
{
  v2 = [(BCCardSetViewController *)self currentCardViewController];
  unsigned __int8 v3 = [v2 expanded];

  return v3;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_dataSource, obj);
    id v6 = obj;
  }
}

- (void)setCovered:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5
{
  if (self->_covered != a3)
  {
    BOOL v6 = a4;
    self->_covered = a3;
    uint64_t v8 = [(BCCardSetViewController *)self view];
    [v8 bounds];
    double v10 = v9;
    double v11 = [(BCCardSetViewController *)self scrollView];
    [v11 frame];
    double v13 = ceil(v10 + floor(v12) * -0.5);
    [(BCCardSetViewController *)self _cardSeparation];
    double v15 = v14 + v13;

    double v16 = [(BCCardSetViewController *)self configuration];
    [v16 cardContractedScale];
    double v18 = v15 / v17;

    unint64_t v19 = [(BCCardSetViewController *)self cardCount];
    uint64_t v20 = [(BCCardSetViewController *)self currentIndex];
    if (v20 <= 0) {
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v21 = v20 - 1;
    }
    if (v20 + 1 < v19) {
      uint64_t v22 = v20 + 1;
    }
    else {
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    }
    unsigned int v23 = [(BCCardSetViewController *)self _isRTL];
    if (v23) {
      uint64_t v24 = v21;
    }
    else {
      uint64_t v24 = v22;
    }
    if (v23) {
      uint64_t v21 = v22;
    }
    if (self->_covered)
    {
      uint64_t v25 = [(BCCardSetViewController *)self displayedCardViewControllers];
      objc_super v26 = +[NSNumber numberWithInteger:v21];
      CGAffineTransform v27 = [v25 objectForKeyedSubscript:v26];

      CGRect v28 = [(BCCardSetViewController *)self displayedCardViewControllers];
      v29 = +[NSNumber numberWithInteger:v24];
      v30 = [v28 objectForKeyedSubscript:v29];

      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_5717C;
      v63[3] = &unk_2C5A00;
      v63[4] = self;
      BOOL v66 = v6;
      id v31 = v27;
      id v64 = v31;
      id v32 = v30;
      id v65 = v32;
      v33 = objc_retainBlock(v63);
      if (v6)
      {
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_57220;
        v57[3] = &unk_2C5A28;
        id v58 = v31;
        double v61 = v18;
        id v59 = v32;
        v60 = self;
        double v62 = a5;
        +[UIView animateWithDuration:v57 animations:v33 completion:a5];
      }
      else
      {
        v45 = [(BCCardSetViewController *)self currentCardViewController];
        [v45 setScrimAlpha:0 animated:0.2 duration:a5];

        ((void (*)(void *, uint64_t))v33[2])(v33, 1);
      }
    }
    else
    {
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_572EC;
      v56[3] = &unk_2C3C50;
      v56[4] = self;
      +[UIView performWithoutAnimation:v56];
      if (v6)
      {
        v34 = [(BCCardSetViewController *)self displayedCardViewControllers];
        v35 = +[NSNumber numberWithInteger:v21];
        v36 = [v34 objectForKeyedSubscript:v35];

        v37 = [(BCCardSetViewController *)self displayedCardViewControllers];
        v38 = +[NSNumber numberWithInteger:v24];
        v39 = [v37 objectForKeyedSubscript:v38];

        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_57344;
        v52[3] = &unk_2C4CB8;
        id v40 = v36;
        id v53 = v40;
        double v55 = v18;
        id v41 = v39;
        id v54 = v41;
        +[UIView performWithoutAnimation:v52];
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_573E8;
        v49[3] = &unk_2C3AF8;
        id v50 = v40;
        id v51 = v41;
        id v42 = v41;
        id v43 = v40;
        +[UIView animateWithDuration:v49 animations:a5];
        v44 = [(BCCardSetViewController *)self currentCardViewController];
        [v44 setScrimAlpha:1 animated:0.0 duration:a5];
      }
      else
      {
        id v43 = [(BCCardSetViewController *)self currentCardViewController];
        [v43 setScrimAlpha:0 animated:0.0 duration:a5];
      }
    }
    v46 = [(BCCardSetViewController *)self displayedCardViewControllers];
    v47 = +[NSNumber numberWithUnsignedInteger:[(BCCardSetViewController *)self currentIndex]];
    v48 = [v46 objectForKeyedSubscript:v47];

    [v48 setIsCurrentCard:!self->_covered];
  }
}

- (void)didBecomeTopCardSet
{
  unsigned __int8 v3 = [(BCCardSetViewController *)self configuration];
  unsigned int v4 = [v3 cardsCanExpand];

  if (v4)
  {
    [(BCCardSetViewController *)self _didBecomeVisibleContentScrollView];
  }
}

- (void)_didBecomeVisibleContentScrollView
{
  id v3 = [(BCCardSetViewController *)self currentCardViewController];
  v2 = [v3 topContentViewController];
  [v2 didBecomeVisibleContentScrollView];
}

- (void)setFocusedIndex:(unint64_t)a3
{
}

- (void)setFocusedIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(BCCardSetViewController *)self dataSource];
  if (v7)
  {
    id v23 = v7;
    unint64_t v8 = [(BCCardSetViewController *)self currentIndex];
    double v9 = [(BCCardSetViewController *)self scrollStartCardIndex];

    if (!v9 && v4)
    {
      double v10 = +[NSNumber numberWithInteger:v8];
      [(BCCardSetViewController *)self setScrollStartCardIndex:v10];
    }
    if ((v8 & 0x8000000000000000) == 0 && v8 != a3)
    {
      double v11 = [(BCCardSetViewController *)self displayedCardViewControllers];
      double v12 = +[NSNumber numberWithInteger:v8];
      double v13 = [v11 objectForKeyedSubscript:v12];

      [v13 setIsCurrentCard:0];
    }
    double v14 = (char *)[v23 cardCountForCardSet:self];
    if ((unint64_t)(v14 - 1) < a3) {
      a3 = (unint64_t)(v14 - 1);
    }
    [(BCCardSetViewController *)self _frameForPageAtIndex:a3];
    double v16 = v15;
    double v18 = v17;
    unint64_t v19 = [(BCCardSetViewController *)self scrollView];
    [v19 setContentOffset:v4 animated:v16];

    [(BCCardSetViewController *)self _updateCurrentIndexIfNeeded];
    id v7 = v23;
    if (v8 != a3)
    {
      uint64_t v20 = [(BCCardSetViewController *)self displayedCardViewControllers];
      uint64_t v21 = +[NSNumber numberWithUnsignedInteger:a3];
      uint64_t v22 = [v20 objectForKeyedSubscript:v21];

      [v22 setIsCurrentCard:[self covered] ^ 1];
      id v7 = v23;
    }
  }
}

- (BOOL)itemPushedOnCardAtIndex:(unint64_t)a3
{
  objc_super v5 = [(BCCardSetViewController *)self suspendedCardViewControllers];
  BOOL v6 = +[NSNumber numberWithUnsignedInteger:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];

  unint64_t v8 = [(BCCardSetViewController *)self cardViewControllerAtIndex:a3];
  if ([v7 itemPushedOnCard]) {
    unsigned __int8 v9 = 1;
  }
  else {
    unsigned __int8 v9 = [v8 itemPushedOnCard];
  }

  return v9;
}

- (void)clearSavedContentOffsetsForCardAtIndex:(unint64_t)a3
{
  BOOL v4 = [(BCCardSetViewController *)self suspendedCardViewControllers];
  objc_super v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  [v6 clearSavedContentOffsets];
}

- (void)scrollToTopCardAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(BCCardSetViewController *)self suspendedCardViewControllers];
  unint64_t v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v10 = [v7 objectForKeyedSubscript:v8];

  unsigned __int8 v9 = [(BCCardSetViewController *)self cardViewControllerAtIndex:a3];
  [v10 scrollToTop:0];
  [v9 scrollToTop:v4];
  [(BCCardSetViewController *)self setScrollToTopVelocity:0.0];
}

- (id)cardViewControllerAtIndex:(unint64_t)a3
{
  BOOL v4 = [(BCCardSetViewController *)self displayedCardViewControllers];
  objc_super v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (void)enumerateAllCardsUsingBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BCCardSetViewController *)self displayedCardViewControllers];
  [v5 enumerateKeysAndObjectsUsingBlock:v4];

  id v6 = [(BCCardSetViewController *)self suspendedCardViewControllers];
  [v6 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)cardLayoutDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(BCCardSetViewController *)self focusedIndex];
  id v6 = [(BCCardSetViewController *)self view];
  [v6 bounds];
  -[BCCardSetViewController _updateFramesToSize:](self, "_updateFramesToSize:", v7, v8);

  [(BCCardSetViewController *)self updateContractedTransform];
  unsigned __int8 v9 = [(BCCardSetViewController *)self dataSource];
  unsigned int v10 = [v9 isTopCardSetViewController:self];

  double v11 = [(BCCardSetViewController *)self configuration];
  unsigned __int8 v12 = [v11 cardsCanExpand];

  if (v12)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    if (v3)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_57D28;
      v17[3] = &unk_2C5A70;
      v17[4] = self;
      v17[5] = &v19;
      char v18 = v10;
      [(BCCardSetViewController *)self enumerateAllCardsUsingBlock:v17];
    }
    if (v10 && !*((unsigned char *)v20 + 24))
    {
      if (v3)
      {
        [(BCCardSetViewController *)self goContracted];
      }
      else if (![(BCCardSetViewController *)self expanded])
      {
        [(BCCardSetViewController *)self _goContractedCommon];
      }
    }
    else
    {
      [(BCCardSetViewController *)self goExpanded];
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    [(BCCardSetViewController *)self goContracted];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_57CCC;
    v23[3] = &unk_2C5A48;
    BOOL v24 = v3;
    [(BCCardSetViewController *)self enumerateAllCardsUsingBlock:v23];
  }
  uint64_t v13 = [(BCCardSetViewController *)self expanded] ^ 1;
  double v14 = [(BCCardSetViewController *)self scrollView];
  [v14 setScrollEnabled:v13];

  double v15 = [(BCCardSetViewController *)self currentCardViewController];
  [v15 setRawCurrentCardOffset:0.0];

  [(BCCardSetViewController *)self updateCards];
  [(BCCardSetViewController *)self setFocusedIndex:v5];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_57E64;
  block[3] = &unk_2C3C50;
  block[4] = self;
  dispatch_after(0, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BCCardSetViewController;
  id v7 = a3;
  [(BCCardSetViewController *)&v26 willTransitionToTraitCollection:v7 withTransitionCoordinator:v6];
  double v8 = [(BCCardSetViewController *)self traitCollection];
  id v9 = [v8 horizontalSizeClass];
  id v10 = [v7 horizontalSizeClass];

  if (v9 != v10)
  {
    if ([(BCCardSetViewController *)self currentIndex]) {
      double v11 = (char *)[(BCCardSetViewController *)self currentIndex] - 1;
    }
    else {
      double v11 = 0;
    }
    unsigned __int8 v12 = (char *)[(BCCardSetViewController *)self currentIndex] + 1;
    uint64_t v13 = +[NSMutableArray arrayWithCapacity:2];
    double v14 = [(BCCardSetViewController *)self displayedCardViewControllers];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_58064;
    v22[3] = &unk_2C5A98;
    BOOL v24 = v11;
    uint64_t v25 = v12;
    id v15 = v13;
    id v23 = v15;
    [v14 enumerateKeysAndObjectsUsingBlock:v22];

    double v16 = [(BCCardSetViewController *)self configuration];
    unsigned __int8 v17 = [v16 cardsCanExpand];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_58104;
    v19[3] = &unk_2C5AC0;
    v19[4] = self;
    id v20 = v15;
    unsigned __int8 v21 = v17;
    id v18 = v15;
    [v6 animateAlongsideTransition:0 completion:v19];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BCCardSetViewController;
  id v7 = a4;
  -[BCCardSetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_583C8;
  v8[3] = &unk_2C5AE8;
  v8[4] = self;
  *(double *)&void v8[5] = width;
  *(double *)&v8[6] = height;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)viewWillLayoutSubviews
{
  if (self->_needLayoutCards && ![(BCCardSetViewController *)self isInTransitionUpdateMode])
  {
    [(BCCardSetViewController *)self _layoutCards];
    self->_needLayoutCards = 0;
  }
  BOOL v3 = [(BCCardSetViewController *)self displayedCardViewControllers];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_58654;
  v5[3] = &unk_2C59B0;
  v5[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];

  v4.receiver = self;
  v4.super_class = (Class)BCCardSetViewController;
  [(BCCardSetViewController *)&v4 viewWillLayoutSubviews];
}

- (void)prepareForDismiss
{
  BOOL v3 = [(BCCardSetViewController *)self scrollView];
  [v3 _stopScrollingAndZoomingAnimations];

  id v4 = [(BCCardSetViewController *)self displayedCardViewControllers];
  [v4 enumerateKeysAndObjectsUsingBlock:&stru_2C5B28];
}

- (void)dismissCardSetAnimated
{
}

- (void)goToPreviousCard
{
}

- (void)goToNextCard
{
}

- (double)_xOffsetForHiddenSideCardOnLeadingSide:(BOOL)a3
{
  int v3 = a3;
  unsigned int v4 = [(BCCardSetViewController *)self _isRTL];
  double result = 50.0;
  if (v4 != v3) {
    return -50.0;
  }
  return result;
}

- (double)_cardWidthForContainerWidth:(double)a3 usingConfiguration:(id)a4
{
  id v5 = a4;
  if (([v5 cardsCanExpand] & 1) == 0)
  {
    [v5 contractedCardWidthForContainerWidth:a3];
    a3 = v6;
  }

  return a3;
}

- (void)_updateFramesToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(BCCardSetViewController *)self configuration];
  [(BCCardSetViewController *)self _cardWidthForContainerWidth:v6 usingConfiguration:width];
  double v8 = v7;

  -[BCCardSetViewController setCardSize:](self, "setCardSize:", v8, height);
  [(BCCardSetViewController *)self _cardSeparation];
  double v10 = v8 + v9;
  [(BCCardSetViewController *)self setPagingWidth:v10];
  double v11 = [(BCCardSetViewController *)self view];
  UIRoundToViewScale();

  CGRectMakeWithOriginSize();
  CGRectGetCenterNoRounding();
  double v13 = v12;
  double v15 = v14;
  double v16 = [(BCCardSetViewController *)self scrollView];
  [v16 setCenter:v13, v15];

  unsigned __int8 v17 = [(BCCardSetViewController *)self scrollView];
  [v17 bounds];
  CGRectMakeWithOriginSize();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  objc_super v26 = [(BCCardSetViewController *)self scrollView];
  [v26 setBounds:v19, v21, v23, v25];

  double v27 = v10 * (double)[(BCCardSetViewController *)self cardCount];
  id v28 = [(BCCardSetViewController *)self scrollView];
  [v28 setContentSize:v27 height];
}

- (double)_debugDragCoefficient
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"BCCardStackTransitionAnimatorSlowModeEnabled"];

  if (v3) {
    double v4 = 3.0;
  }
  else {
    double v4 = 1.0;
  }
  UIAnimationDragCoefficient();
  return v4 * v5;
}

- (void)animationCompletedExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = !a3;
  double v6 = [(BCCardSetViewController *)self scrollView];
  [v6 setScrollEnabled:v5];

  double v7 = [(BCCardSetViewController *)self currentCardViewController];
  double v8 = v7;
  if (v5) {
    [v7 configureChromeForContracted];
  }
  else {
    [v7 configureChromeForExpanded];
  }

  double v9 = [(BCCardSetViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(BCCardSetViewController *)self delegate];
    [v11 cardSetViewController:self animationCompletedExpanded:v3];
  }
}

- (void)zoomingAnimationCompletedAtPosition:(int64_t)a3
{
  id v4 = [(BCCardSetViewController *)self currentCardViewController];
  [v4 animationCompletedAtPosition:a3];
}

- (id)animatorForExpandingTransformingView:(id)a3 duration:(double)a4
{
  return [(BCCardSetViewController *)self animatorForExpandingTransformingView:a3 timingParameter:0 duration:a4];
}

- (id)animatorForExpandingTransformingView:(id)a3 timingParameter:(id)a4 duration:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc((Class)UIViewPropertyAnimator);
  if (v9) {
    id v11 = [v10 initWithDuration:v9 timingParameters:0.0];
  }
  else {
    id v11 = [v10 initWithDuration:2 curve:0 animations:a5];
  }
  double v12 = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_58CCC;
  v15[3] = &unk_2C3AF8;
  id v16 = v8;
  unsigned __int8 v17 = self;
  id v13 = v8;
  [v12 addAnimations:v15];

  return v12;
}

- (void)goExpandedInteractive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(BCCardSetViewController *)self traitCollection];
  double v6 = [v5 traitCollectionByModifyingTraits:&stru_2C5B68];

  char v7 = isPad();
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(BCCardSetViewController *)self currentCardViewController];
    id v10 = [v9 topContentViewController];
    id v8 = [v10 viewIfLoaded];
  }
  id v11 = [v8 backgroundColor];
  double v12 = v11;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_590E0;
  v41[4] = sub_590F0;
  id v42 = 0;
  if (v11)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_590F8;
    v38[3] = &unk_2C39F0;
    id v40 = v41;
    id v39 = v11;
    [v6 performAsCurrentTraitCollection:v38];
  }
  if (v12) {
    char v13 = v7 ^ 1;
  }
  else {
    char v13 = 0;
  }
  int v14 = _os_feature_enabled_impl();
  double v15 = [(BCCardSetViewController *)self cardStackViewController];
  id v16 = [v15 statusBarBackgroundController];
  [v16 setOpacity:(double)(v14 ^ 1u)];

  unsigned __int8 v17 = [(BCCardSetViewController *)self scrollView];
  double v18 = [(BCCardSetViewController *)self animatorForExpandingTransformingView:v17 duration:0.2];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_5915C;
  v33[3] = &unk_2C5BB8;
  v33[4] = self;
  char v36 = v13;
  id v19 = v8;
  id v34 = v19;
  v35 = v41;
  char v37 = v14;
  [v18 addAnimations:v33];
  double v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  objc_super v26 = sub_593B0;
  double v27 = &unk_2C5BE0;
  char v32 = v13;
  id v28 = self;
  uint64_t v31 = 0;
  id v20 = v19;
  id v29 = v20;
  id v21 = v12;
  id v30 = v21;
  [v18 addCompletion:&v24];
  [v18 setInterruptible:1 v24, v25, v26, v27, v28];
  double v22 = [(BCCardSetViewController *)self delegate];
  [v22 cardSetViewController:self animatorForExpanding:v18];

  if (v3) {
    [v18 pauseAnimation];
  }
  double v23 = [(BCCardSetViewController *)self currentCardViewController];
  [v23 setAnimator:v18];

  if (!v3) {
    [v18 startAnimation];
  }

  _Block_object_dispose(v41, 8);
}

- (void)goContractedInteractive:(BOOL)a3
{
  BOOL v3 = a3;
  [(BCCardSetViewController *)self scrollToTopVelocity];
  if (v5 == 0.0)
  {
    [(BCCardSetViewController *)self goContractedInteractive:v3 withTiming:0];
  }
  else
  {
    [(BCCardSetViewController *)self scrollToTopVelocity];
    double v7 = v6;
    [(BCCardSetViewController *)self setScrollToTopVelocity:0.0];
    [(BCCardSetViewController *)self goContractedWithBounce:v7];
  }
}

- (void)goContractedWithBounce:(double)a3
{
  double v4 = fabs(a3 * 1000000000.0 / 1000000.0);
  [(BCCardSetViewController *)self distanceToExpand];
  id v6 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:100.0 damping:80.0 initialVelocity:v4 / v5];
  [(BCCardSetViewController *)self goContractedInteractive:1 withTiming:v6];
}

- (id)animatorForUnexpandingTransformingView:(id)a3 timingParameter:(id)a4 duration:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc((Class)UIViewPropertyAnimator);
  if (v9) {
    id v11 = [v10 initWithDuration:v9 timingParameters:0.0];
  }
  else {
    id v11 = [v10 initWithDuration:2 curve:0 animations:a5];
  }
  double v12 = v11;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  if (v8) {
    [v8 transform];
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_59720;
  v21[3] = &unk_2C3AF8;
  v21[4] = self;
  id v13 = v8;
  id v22 = v13;
  [v12 addAnimations:v21];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  long long v18 = v23;
  long long v19 = v24;
  v16[2] = sub_5977C;
  v16[3] = &unk_2C5C08;
  long long v20 = v25;
  id v17 = v13;
  id v14 = v13;
  [v12 addCompletion:v16];

  return v12;
}

- (void)goContractedInteractive:(BOOL)a3 withTiming:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(BCCardSetViewController *)self traitCollection];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_59BAC;
  v41[3] = &unk_2C5C28;
  v41[4] = 1;
  id v8 = [v7 traitCollectionByModifyingTraits:v41];

  char v9 = isPad();
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [(BCCardSetViewController *)self currentCardViewController];
    double v12 = [v11 topContentViewController];
    id v10 = [v12 viewIfLoaded];
  }
  id v13 = [v10 backgroundColor];
  id v14 = v13;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_590E0;
  v39[4] = sub_590F0;
  id v40 = 0;
  if (v13)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_59BB8;
    v36[3] = &unk_2C39F0;
    v38 = v39;
    id v37 = v13;
    [v8 performAsCurrentTraitCollection:v36];
  }
  if (v14) {
    char v15 = v9 ^ 1;
  }
  else {
    char v15 = 0;
  }
  id v16 = [(BCCardSetViewController *)self scrollView];
  id v17 = [(BCCardSetViewController *)self animatorForUnexpandingTransformingView:v16 timingParameter:v6 duration:0.2];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_59C1C;
  v32[3] = &unk_2C5C78;
  v32[4] = self;
  char v35 = v15;
  id v18 = v10;
  id v33 = v18;
  id v34 = v39;
  [v17 addAnimations:v32];
  long long v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  long long v25 = sub_59E78;
  objc_super v26 = &unk_2C5BE0;
  char v31 = v15;
  double v27 = self;
  uint64_t v30 = 1;
  id v19 = v18;
  id v28 = v19;
  id v20 = v14;
  id v29 = v20;
  [v17 addCompletion:&v23];
  [v17 setInterruptible:1 v23, v24, v25, v26, v27];
  id v21 = [(BCCardSetViewController *)self delegate];
  [v21 cardSetViewController:self animatorForUnexpanding:v17];

  if (v4) {
    [v17 pauseAnimation];
  }
  id v22 = [(BCCardSetViewController *)self currentCardViewController];
  [v22 setAnimator:v17];

  if (!v4) {
    [v17 startAnimation];
  }

  _Block_object_dispose(v39, 8);
}

- (void)_goContractedCommon
{
  id v3 = [(BCCardSetViewController *)self scrollView];
  [(BCCardSetViewController *)self _goContractedCommonTransformingView:v3];
}

- (void)_goContractedCommonTransformingView:(id)a3
{
  id v4 = a3;
  [(BCCardSetViewController *)self contractedTransform];
  v5[0] = v5[3];
  v5[1] = v5[4];
  v5[2] = v5[5];
  [v4 setTransform:v5];
}

- (void)goContracted
{
  [(BCCardSetViewController *)self _goContractedCommon];
  id v3 = [(BCCardSetViewController *)self currentCardViewController];
  [v3 goContracted];
}

- (void)goExpanded
{
  id v2 = [(BCCardSetViewController *)self currentCardViewController];
  [v2 goExpanded];
}

- (id)animatorForInteractiveDismiss
{
  id v3 = objc_alloc_init(BCCardStackInteractiveDismissAnimator);
  id v4 = [(BCCardSetViewController *)self displayedCardViewControllers];
  [(BCCardStackInteractiveDismissAnimator *)v3 setDisplayedCardViewControllers:v4];

  [(BCCardStackInteractiveDismissAnimator *)v3 setFocusedIndex:[(BCCardSetViewController *)self currentIndex]];
  [(BCCardSetViewController *)self distanceToDismiss];
  -[BCCardStackInteractiveDismissAnimator setMaxSlideDistance:](v3, "setMaxSlideDistance:");
  [(BCCardSetViewController *)self distanceToDismiss];
  double v6 = v5;
  double v7 = [(BCCardSetViewController *)self configuration];
  [v7 cardContractedScale];
  [(BCCardStackInteractiveDismissAnimator *)v3 setMaxTitleSlideDistance:v6 * v8];

  char v9 = [(BCCardSetViewController *)self delegate];
  [v9 cardSetViewController:self animatorForInteractiveDismiss:v3];

  [(BCCardStackInteractiveDismissAnimator *)v3 setupForInteractiveDismiss];

  return v3;
}

- (void)scrollCurrentCardToTop
{
  id v3 = [(BCCardSetViewController *)self currentCardViewController];
  id v7 = [v3 scrollView];

  [v7 contentOffset];
  double v5 = v4;
  [v7 adjustedContentInset];
  [(BCCardSetViewController *)self setScrollToTopVelocity:(v5 + v6) / 300.0];
  [(BCCardSetViewController *)self scrollToTopCardAtIndex:[(BCCardSetViewController *)self focusedIndex] animated:1];
}

- (id)accessibilityScrollStatusForWideTouchScrollView:(id)a3
{
  double v4 = objc_opt_new();
  double v5 = [(BCCardSetViewController *)self currentCardViewController];
  double v6 = [v5 topContentViewController];

  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 accessibilityCardContentSummary];
    if ([v7 length]) {
      [v4 addObject:v7];
    }
  }
  unint64_t v8 = [(BCCardSetViewController *)self currentIndex];
  unint64_t v9 = [(BCCardSetViewController *)self cardCount];
  id v10 = IMCommonCoreBundle();
  id v11 = [v10 localizedStringForKey:@"%1$lu of %2$lu" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  double v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v8 + 1, v9);
  [v4 addObject:v12];

  id v13 = [v4 componentsJoinedByString:@", "];

  return v13;
}

- (BOOL)accessibilityDismissCardSetView:(id)a3
{
  return 1;
}

- (id)additionalAccessibilityElementsForCardSetView
{
  return &__NSArray0__struct;
}

- (BOOL)_isRTL
{
  return [UIApp userInterfaceLayoutDirection] == (char *)&def_7D91C + 1;
}

- (double)_flipScrollViewOffsetIfNeeded:(double)a3 width:(double)a4
{
  if ([(BCCardSetViewController *)self _isRTL])
  {
    id v7 = [(BCCardSetViewController *)self scrollView];
    [v7 contentSize];
    a3 = v8 - a3 - a4;
  }
  return a3;
}

- (CGRect)_frameForPageAtIndex:(int64_t)a3
{
  [(BCCardSetViewController *)self pagingWidth];
  double v6 = v5 * (double)a3;
  [(BCCardSetViewController *)self pagingWidth];
  [(BCCardSetViewController *)self _flipScrollViewOffsetIfNeeded:v6 width:v7];
  double v9 = v8;
  [(BCCardSetViewController *)self pagingWidth];
  double v11 = v10;
  double v12 = [(BCCardSetViewController *)self view];
  [v12 bounds];
  CGFloat Height = CGRectGetHeight(v18);

  double v14 = 0.0;
  double v15 = v9;
  double v16 = v11;
  double v17 = Height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGRect)_frameForCardAtIndex:(int64_t)a3
{
  [(BCCardSetViewController *)self cardSize];
  double v6 = v5;
  [(BCCardSetViewController *)self pagingWidth];
  double v8 = v7;
  [(BCCardSetViewController *)self _cardSeparation];
  [(BCCardSetViewController *)self _flipScrollViewOffsetIfNeeded:v9 * 0.5 + (double)a3 * v8 width:v6];

  CGRectMakeWithOriginSize();
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)frameForCardAtIndex:(int64_t)a3 inCoordinatesOfCardAtIndex:(int64_t)a4
{
  [(BCCardSetViewController *)self cardSize];
  [(BCCardSetViewController *)self _isRTL];
  [(BCCardSetViewController *)self pagingWidth];

  CGRectMakeWithOriginSize();
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (int64_t)_currentIndexFromScrollViewBounds
{
  id v3 = [(BCCardSetViewController *)self dataSource];

  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v4 = [(BCCardSetViewController *)self cardCount];
  double v5 = [(BCCardSetViewController *)self scrollView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = vcvtmd_s64_f64(v7 / v9 + 0.5);
  int64_t v11 = v4 - 1;
  uint64_t v12 = v10 & ~(v10 >> 63);
  if (v11 >= v12) {
    int64_t v13 = v12;
  }
  else {
    int64_t v13 = v11;
  }
  if ([(BCCardSetViewController *)self _isRTL]) {
    return v11 - v13;
  }
  else {
    return v13;
  }
}

- (void)_updateCurrentIndexIfNeeded
{
  [(BCCardSetViewController *)self _frameForPageAtIndex:[(BCCardSetViewController *)self currentIndex]];
  double MinX = CGRectGetMinX(v25);
  unint64_t v4 = [(BCCardSetViewController *)self scrollView];
  [v4 contentOffset];
  double v6 = v5;
  *(double *)v7.i64 = v5 - MinX;
  int8x16_t v22 = v7;

  [(BCCardSetViewController *)self pagingWidth];
  double v9 = vabdd_f64(v6, MinX) / v8;
  id v23 = [(BCCardSetViewController *)self cardViewControllerAtIndex:[(BCCardSetViewController *)self currentIndex]];
  unint64_t v10 = [(BCCardSetViewController *)self currentIndex];
  v11.i64[0] = 1.0;
  v12.f64[0] = NAN;
  v12.f64[1] = NAN;
  int64_t v13 = [(BCCardSetViewController *)self cardViewControllerAtIndex:(uint64_t)(*(double *)vbslq_s8((int8x16_t)vnegq_f64(v12), v11, v22).i64 + (double)v10)];
  if (([v23 itemPushedOnCard] & 1) == 0)
  {
    double v14 = [v23 auxiliaryNavigationBarView];
    [v14 setAlpha:1.0 - v9];
  }
  if ((objc_msgSend(v13, "itemPushedOnCard", *(_OWORD *)&v22) & 1) == 0)
  {
    double v15 = [v13 auxiliaryNavigationBarView];
    [v15 setAlpha:v9];
  }
  unint64_t v16 = [(BCCardSetViewController *)self _currentIndexFromScrollViewBounds];
  unint64_t v17 = [(BCCardSetViewController *)self currentIndex];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL && v17 != v16)
  {
    CGRect v18 = [(BCCardSetViewController *)self scrollView];
    if ([v18 isTracking])
    {
    }
    else
    {
      id v19 = [(BCCardSetViewController *)self scrollView];
      unsigned int v20 = [v19 isDragging];

      if (!v20) {
        goto LABEL_15;
      }
    }
    if ([(BCCardSetViewController *)self currentIndex] < v16)
    {
      uint64_t v21 = 3;
LABEL_14:
      [(BCCardSetViewController *)self setLastNavigationType:v21];
      goto LABEL_15;
    }
    if ([(BCCardSetViewController *)self currentIndex] > v16)
    {
      uint64_t v21 = 2;
      goto LABEL_14;
    }
LABEL_15:
    [(BCCardSetViewController *)self updateCards];
  }
}

- (BCStatusBarBackgroundController)statusBarBackgroundController
{
  return self->_statusBarBackgroundController;
}

- (void)updateCards
{
  if (!self->_needLayoutCards)
  {
    self->_needLayoutCards = 1;
    id v2 = [(BCCardSetViewController *)self view];
    [v2 setNeedsLayout];
  }
}

- (void)updateWithAppendedCards
{
  if ([(BCCardSetViewController *)self isInTransitionUpdateMode])
  {
    [(BCCardSetViewController *)self setCardsAppendedDuringTransition:1];
  }
  else
  {
    id v3 = [(BCCardSetViewController *)self view];
    [v3 bounds];
    -[BCCardSetViewController _updateFramesToSize:](self, "_updateFramesToSize:", v4, v5);

    [(BCCardSetViewController *)self _frameForPageAtIndex:[(BCCardSetViewController *)self currentIndex]];
    double v7 = v6;
    double v9 = v8;
    unint64_t v10 = [(BCCardSetViewController *)self scrollView];
    [v10 setContentOffset:0 animated:v7];

    [(BCCardSetViewController *)self _updateCurrentIndexIfNeeded];
    [(BCCardSetViewController *)self updateCards];
  }
}

- (void)_layoutCards
{
  id v3 = [(BCCardSetViewController *)self dataSource];
  double v4 = v3;
  if (v3)
  {
    [v3 cardCountForCardSet:self];
    int64_t v5 = [(BCCardSetViewController *)self _currentIndexFromScrollViewBounds];
    [(BCCardSetViewController *)self setCurrentIndex:v5];
    if (![(BCCardSetViewController *)self covered])
    {
      double v6 = [(BCCardSetViewController *)self configuration];
      [v6 cardBufferCount];
    }
    double v7 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:");
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    double v9 = [(BCCardSetViewController *)self displayedCardViewControllers];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_5ABC4;
    v24[3] = &unk_2C5CA0;
    id v25 = v7;
    id v10 = v8;
    id v26 = v10;
    double v27 = self;
    id v11 = v7;
    [v9 enumerateKeysAndObjectsUsingBlock:v24];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v13 = [WeakRetained cardNavigationControllerForCardSet:self];

    double v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    unint64_t v17 = sub_5AD04;
    CGRect v18 = &unk_2C5CC8;
    id v19 = v10;
    unsigned int v20 = self;
    int64_t v22 = v5;
    id v23 = v13;
    id v21 = v4;
    id v14 = v10;
    [v11 enumerateIndexesUsingBlock:&v15];
    -[BCCardSetViewController setDisplayedCardViewControllers:](self, "setDisplayedCardViewControllers:", v14, v15, v16, v17, v18);
  }
}

- (_NSRange)_visibleCardRangePassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BCCardSetViewController *)self cardCount];
  if (v5)
  {
    double v6 = [(BCCardSetViewController *)self view];
    [v6 bounds];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;

    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_5B5C4;
    uint64_t v24 = &unk_2C5CF0;
    id v25 = self;
    uint64_t v27 = v8;
    uint64_t v28 = v10;
    uint64_t v29 = v12;
    uint64_t v30 = v14;
    id v26 = v4;
    double v15 = objc_retainBlock(&v21);
    uint64_t v16 = (uint64_t)[(BCCardSetViewController *)self currentIndex] + 1;
    while (1)
    {
      uint64_t v17 = v16 - 2;
      if (v16 - 2 < 0) {
        break;
      }
      --v16;
      if ((((uint64_t (*)(void ***, uint64_t))v15[2])(v15, v17) & 1) == 0) {
        goto LABEL_8;
      }
    }
    uint64_t v16 = 0;
LABEL_8:
    CGRect v18 = (char *)[(BCCardSetViewController *)self currentIndex] - 1;
    while ((uint64_t)(v18 + 2) < v5)
    {
      ++v18;
      if ((((uint64_t (*)(void ***))v15[2])(v15) & 1) == 0) {
        goto LABEL_13;
      }
    }
    CGRect v18 = (char *)(v5 - 1);
LABEL_13:
    uint64_t v5 = (uint64_t)&v18[-v16 + 1];
  }
  else
  {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v19 = v16;
  NSUInteger v20 = v5;
  result.length = v20;
  result.location = v19;
  return result;
}

- (_NSRange)visibleCardRange
{
  id v2 = [(BCCardSetViewController *)self _visibleCardRangePassingTest:&stru_2C5D30];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)beginTransitionUpdateModeForCardsAtRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(BCCardSetViewController *)self setIsInTransitionUpdateMode:1];
  double v6 = [(BCCardSetViewController *)self displayedCardViewControllers];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5B778;
  v7[3] = &unk_2C5D50;
  v7[4] = location;
  v7[5] = length;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)endTransitionUpdateMode
{
  [(BCCardSetViewController *)self setIsInTransitionUpdateMode:0];
  NSUInteger v3 = [(BCCardSetViewController *)self displayedCardViewControllers];
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_2C5D70];

  if ([(BCCardSetViewController *)self cardsAppendedDuringTransition])
  {
    [(BCCardSetViewController *)self updateWithAppendedCards];
    [(BCCardSetViewController *)self setCardsAppendedDuringTransition:0];
  }
}

- (void)presentationTransitionDidComplete
{
  if (!self->_isPresentationTransitionCompleted)
  {
    self->_isPresentationTransitionCompleted = 1;
    [(BCCardSetViewController *)self enumerateAllCardsUsingBlock:&stru_2C5D90];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id v5 = [(BCCardSetViewController *)self scrollView];

  if (v5 == v4)
  {
    double v6 = +[NSMapTable strongToStrongObjectsMapTable];
    [(BCCardSetViewController *)self setScrollingAssertions:v6];

    unint64_t v7 = [(BCCardSetViewController *)self currentIndex];
    uint64_t v8 = [(BCCardSetViewController *)self scrollStartCardIndex];
    id v9 = [v8 integerValue];

    if (v9 != (id)v7) {
      sub_5BA04(self);
    }
    uint64_t v10 = +[NSNumber numberWithInteger:v7];
    [(BCCardSetViewController *)self setScrollStartCardIndex:v10];

    [(BCCardSetViewController *)self setIsDragging:1];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardSetViewController *)self scrollView];

  if (v5 == v4)
  {
    [(BCCardSetViewController *)self _updateCurrentIndexIfNeeded];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(BCCardSetViewController *)self scrollView];

  if (v7 == v6)
  {
    sub_5BA04(self);
    if (!a4)
    {
      [(BCCardSetViewController *)self _scrollViewDidEndScrolling];
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardSetViewController *)self scrollView];

  if (v5 == v4)
  {
    [(BCCardSetViewController *)self _scrollViewDidEndScrolling];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardSetViewController *)self scrollView];

  if (v5 == v4)
  {
    [(BCCardSetViewController *)self _scrollViewDidEndScrolling];
  }
}

- (void)_scrollViewDidEndScrolling
{
  kdebug_trace();
  sub_5BA04(self);
  NSUInteger v3 = [(BCCardSetViewController *)self scrollStartCardIndex];

  if (v3)
  {
    [(BCCardSetViewController *)self setScrollingAssertions:0];
    [(BCCardSetViewController *)self setScrollStartCardIndex:0];
  }

  [(BCCardSetViewController *)self setIsDragging:0];
}

- (id)im_visibleChildViewControllers
{
  unint64_t v3 = [(BCCardSetViewController *)self currentIndex];
  if (v3 == -1)
  {
    id v16 = &__NSArray0__struct;
  }
  else
  {
    unint64_t v4 = v3;
    id v5 = [(BCCardSetViewController *)self displayedCardViewControllers];
    id v6 = +[NSNumber numberWithUnsignedInteger:v4];
    id v7 = [v5 objectForKeyedSubscript:v6];

    uint64_t v8 = [(BCCardSetViewController *)self displayedCardViewControllers];
    id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);

    [v9 addObject:v7];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [(BCCardSetViewController *)self displayedCardViewControllers];
    uint64_t v11 = [v10 allValues];

    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          if (*(void **)(*((void *)&v18 + 1) + 8 * i) != v7) {
            [v9 addObject:];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    id v16 = [v9 copy];
  }

  return v16;
}

- (BOOL)bc_analyticsVisibilityOfChild:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardSetViewController *)self currentCardViewController];

  return v5 == v4;
}

- (void)cardViewControllerDidTapCard:(id)a3
{
}

- (void)cardViewControllerDidTapScrollView:(id)a3
{
}

- (BOOL)cardViewControllerCanCloseAsset:(id)a3
{
  unint64_t v3 = [(BCCardSetViewController *)self presentingViewController];
  unsigned __int8 v4 = [v3 bc_canCloseAsset];

  return v4;
}

- (void)cardViewControllerDidTapCloseAllCards:(id)a3
{
  id v5 = [(BCCardSetViewController *)self presentingViewController];
  if (objc_msgSend(v5, "bc_canCloseAsset"))
  {
    unsigned __int8 v4 = [(BCCardSetViewController *)self cardStackViewController];
    [v5 bc_closeToAssetWithCardStackViewController:v4 completion:&stru_2C5DB0];
  }
  else
  {
    [(BCCardSetViewController *)self dismissAllCardsAnimated:1 completion:0];
  }
}

- (void)cardViewControllerDidTapCloseAsset:(id)a3
{
  id v5 = [(BCCardSetViewController *)self presentingViewController];
  unsigned __int8 v4 = [(BCCardSetViewController *)self cardStackViewController];
  [v5 bc_closeAssetWithCardStackViewController:v4 completion:&stru_2C5DD0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  id v6 = [v5 view];
  id v7 = [(BCCardSetViewController *)self view];
  if (v6 == v7)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v8 = [v5 view];
    id v9 = [(BCCardSetViewController *)self scrollView];
    char v10 = v8 == v9;
  }
  return v10;
}

- (void)edgePanGesture:(id)a3
{
  id v19 = a3;
  unsigned __int8 v4 = [v19 view];
  [v19 translationInView:v4];
  double v6 = v5;

  id v7 = [v19 view];
  [v7 bounds];
  double Width = CGRectGetWidth(v21);

  double v9 = v6 / Width;
  switch((unint64_t)[v19 state])
  {
    case 1uLL:
      id v10 = objc_alloc_init((Class)UIPercentDrivenInteractiveTransition);
      [(BCCardSetViewController *)self setPercentDrivenInteractiveTransition:v10];

      uint64_t v11 = [(BCCardSetViewController *)self currentCardViewController];
      id v12 = [v11 cardNavigationController];
      id v13 = [v12 popViewControllerAnimated:1];

      goto LABEL_7;
    case 2uLL:
      uint64_t v11 = [(BCCardSetViewController *)self percentDrivenInteractiveTransition];
      [v11 updateInteractiveTransition:v9];
LABEL_7:

      break;
    case 3uLL:
      uint64_t v14 = [v19 view];
      [v19 velocityInView:v14];
      double v16 = v15;

      uint64_t v17 = [(BCCardSetViewController *)self percentDrivenInteractiveTransition];
      long long v18 = v17;
      if (v9 <= 0.5 && v16 <= 0.0) {
        goto LABEL_9;
      }
      [v17 finishInteractiveTransition];
      goto LABEL_11;
    case 4uLL:
      uint64_t v17 = [(BCCardSetViewController *)self percentDrivenInteractiveTransition];
      long long v18 = v17;
LABEL_9:
      [v17 cancelInteractiveTransition];
LABEL_11:

      [(BCCardSetViewController *)self setPercentDrivenInteractiveTransition:0];
      break;
    default:
      break;
  }
}

- (void)_didCommitDismissWithVelocity:(double)a3 interactiveAnimator:(id)a4
{
  id v6 = a4;
  id v7 = [(BCCardSetViewController *)self delegate];
  [v7 cardSetViewController:self didCommitDismissWithVelocity:v6 interactiveAnimator:a3];
}

- (void)suspendAndTeardownForReason:(id)a3
{
  id v4 = a3;
  double v5 = [(BCCardSetViewController *)self displayedCardViewControllers];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5C554;
  v7[3] = &unk_2C59B0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)resumeAndRebuildForReason:(id)a3
{
  id v4 = a3;
  double v5 = [(BCCardSetViewController *)self displayedCardViewControllers];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5C610;
  v7[3] = &unk_2C59B0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (id)keyCommands
{
  id v2 = +[UIKeyCommand keyCommandWithInput:UIKeyInputLeftArrow modifierFlags:0x100000 action:"_goToPreviousCardWithKeyCommand:"];
  [v2 setAllowsAutomaticMirroring:1];
  unint64_t v3 = +[UIKeyCommand keyCommandWithInput:UIKeyInputRightArrow modifierFlags:0x100000 action:"_goToNextCardWithKeyCommand:"];
  [v3 setAllowsAutomaticMirroring:1];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (void)_goToPreviousCardWithKeyCommand:(id)a3
{
  uint64_t v4 = [(BCCardSetViewController *)self currentIndex];
  uint64_t v5 = v4 - 1;
  if (v4 >= 1)
  {
    id v6 = [(BCCardSetViewController *)self scrollStartCardIndex];

    if (!v6)
    {
      [(BCCardSetViewController *)self setFocusedIndex:v5 animated:1];
    }
  }
}

- (void)_goToNextCardWithKeyCommand:(id)a3
{
  uint64_t v4 = (char *)[(BCCardSetViewController *)self currentIndex] + 1;
  if (v4 < (char *)[(BCCardSetViewController *)self cardCount])
  {
    uint64_t v5 = [(BCCardSetViewController *)self scrollStartCardIndex];

    if (!v5)
    {
      [(BCCardSetViewController *)self setFocusedIndex:v4 animated:1];
    }
  }
}

- (double)scrollToTopVelocity
{
  return self->_scrollToTopVelocity;
}

- (void)setScrollToTopVelocity:(double)a3
{
  self->_scrollToTopVelocity = a3;
}

- (UIView)navigationSkrimView
{
  return self->_navigationSkrimView;
}

- (void)setNavigationSkrimView:(id)a3
{
}

- (CGAffineTransform)expandedTransform
{
  long long v3 = *(_OWORD *)&self[7].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].d;
  return self;
}

- (void)setExpandedTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_expandedTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_expandedTransform.c = v4;
  *(_OWORD *)&self->_expandedTransform.tx = v3;
}

- (UIPercentDrivenInteractiveTransition)percentDrivenInteractiveTransition
{
  return self->_percentDrivenInteractiveTransition;
}

- (void)setPercentDrivenInteractiveTransition:(id)a3
{
}

- (UITapGestureRecognizer)tapToDismissGestureRecognizer
{
  return self->_tapToDismissGestureRecognizer;
}

- (void)setTapToDismissGestureRecognizer:(id)a3
{
  self->_tapToDismissGestureRecognizer = (UITapGestureRecognizer *)a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (CGAffineTransform)contractedTransform
{
  long long v3 = *(_OWORD *)&self[8].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[8].d;
  return self;
}

- (void)setContractedTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contractedTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contractedTransform.c = v4;
  *(_OWORD *)&self->_contractedTransform.tx = v3;
}

- (BOOL)isInTransitionUpdateMode
{
  return self->_isInTransitionUpdateMode;
}

- (void)setIsInTransitionUpdateMode:(BOOL)a3
{
  self->_isInTransitionUpdateMode = a3;
}

- (BOOL)covered
{
  return self->_covered;
}

- (void)setCovered:(BOOL)a3
{
  self->_covered = a3;
}

- (UIScreenEdgePanGestureRecognizer)edgePanGestureRecognizer
{
  return self->_edgePanGestureRecognizer;
}

- (void)setEdgePanGestureRecognizer:(id)a3
{
}

- (BCCardSetDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (BCCardSetDataSource *)WeakRetained;
}

- (BCCardSetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCCardSetDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BCCardStackConfiguration)configuration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);

  return (BCCardStackConfiguration *)WeakRetained;
}

- (void)setConfiguration:(id)a3
{
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)scaledContractedOffset
{
  return self->_scaledContractedOffset;
}

- (void)setScaledContractedOffset:(double)a3
{
  self->_scaledContractedOffset = a3;
}

- (CGRect)initialFrame
{
  double x = self->_initialFrame.origin.x;
  double y = self->_initialFrame.origin.y;
  double width = self->_initialFrame.size.width;
  double height = self->_initialFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (NSMutableDictionary)displayedCardViewControllers
{
  return self->_displayedCardViewControllers;
}

- (void)setDisplayedCardViewControllers:(id)a3
{
}

- (NSMutableDictionary)suspendedCardViewControllers
{
  return self->_suspendedCardViewControllers;
}

- (void)setSuspendedCardViewControllers:(id)a3
{
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndedouble x = a3;
}

- (double)pagingWidth
{
  return self->_pagingWidth;
}

- (void)setPagingWidth:(double)a3
{
  self->_pagingdouble Width = a3;
}

- (double)distanceToDismiss
{
  return self->_distanceToDismiss;
}

- (void)setDistanceToDismiss:(double)a3
{
  self->_distanceToDismiss = a3;
}

- (id)endExpandedBlock
{
  return self->_endExpandedBlock;
}

- (void)setEndExpandedBlock:(id)a3
{
}

- (double)distanceToExpand
{
  return self->_distanceToExpand;
}

- (void)setDistanceToExpand:(double)a3
{
  self->_distanceToExpand = a3;
}

- (NSMapTable)scrollingAssertions
{
  return self->_scrollingAssertions;
}

- (void)setScrollingAssertions:(id)a3
{
}

- (NSMapTable)suspendedCardsScrollingAssertions
{
  return self->_suspendedCardsScrollingAssertions;
}

- (void)setSuspendedCardsScrollingAssertions:(id)a3
{
}

- (BOOL)needLayoutCards
{
  return self->_needLayoutCards;
}

- (void)setNeedLayoutCards:(BOOL)a3
{
  self->_needLayoutCards = a3;
}

- (BOOL)cardsAppendedDuringTransition
{
  return self->_cardsAppendedDuringTransition;
}

- (void)setCardsAppendedDuringTransition:(BOOL)a3
{
  self->_cardsAppendedDuringTransition = a3;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (NSNumber)scrollStartCardIndex
{
  return self->_scrollStartCardIndex;
}

- (void)setScrollStartCardIndex:(id)a3
{
}

- (NSNumber)lastKnownScrollEndCardIndex
{
  return self->_lastKnownScrollEndCardIndex;
}

- (void)setLastKnownScrollEndCardIndex:(id)a3
{
}

- (UIButton)leftArrowButton
{
  return self->_leftArrowButton;
}

- (void)setLeftArrowButton:(id)a3
{
}

- (UIButton)rightArrowButton
{
  return self->_rightArrowButton;
}

- (void)setRightArrowButton:(id)a3
{
}

- (NSNumber)hoveringCardIndex
{
  return self->_hoveringCardIndex;
}

- (void)setHoveringCardIndex:(id)a3
{
  self->_hoveringCardIndedouble x = (NSNumber *)a3;
}

- (NSNumber)incomingCardIndex
{
  return self->_incomingCardIndex;
}

- (void)setIncomingCardIndex:(id)a3
{
  self->_incomingCardIndedouble x = (NSNumber *)a3;
}

- (NSNumber)outgoingCardIndex
{
  return self->_outgoingCardIndex;
}

- (void)setOutgoingCardIndex:(id)a3
{
  self->_outgoingCardIndedouble x = (NSNumber *)a3;
}

- (BCCardSetViewControllerViewState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
}

- (void)setStatusBarBackgroundController:(id)a3
{
}

- (CGSize)cardSize
{
  double width = self->_cardSize.width;
  double height = self->_cardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCardSize:(CGSize)a3
{
  self->_cardSize = a3;
}

- (BOOL)isPresentationTransitionCompleted
{
  return self->_isPresentationTransitionCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarBackgroundController, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_rightArrowButton, 0);
  objc_storeStrong((id *)&self->_leftArrowButton, 0);
  objc_storeStrong((id *)&self->_lastKnownScrollEndCardIndex, 0);
  objc_storeStrong((id *)&self->_scrollStartCardIndex, 0);
  objc_storeStrong((id *)&self->_suspendedCardsScrollingAssertions, 0);
  objc_storeStrong((id *)&self->_scrollingAssertions, 0);
  objc_storeStrong(&self->_endExpandedBlock, 0);
  objc_storeStrong((id *)&self->_suspendedCardViewControllers, 0);
  objc_storeStrong((id *)&self->_displayedCardViewControllers, 0);
  objc_destroyWeak((id *)&self->_configuration);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_edgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_percentDrivenInteractiveTransition, 0);

  objc_storeStrong((id *)&self->_navigationSkrimView, 0);
}

@end