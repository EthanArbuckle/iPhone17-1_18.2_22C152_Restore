@interface InfiniteScrollViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)_view:(id)a3 containsCalendarDate:(id)a4;
- (BOOL)isDateVisible:(id)a3;
- (BOOL)isRelayingOut;
- (BOOL)isUserFingerDown;
- (BOOL)shouldAnimateScrollToDate:(id)a3 fromClosestDate:(id)a4;
- (BOOL)shouldUpdatePreferredReloadDates;
- (BOOL)shouldUpdateSelectedDateWithCentralView;
- (BOOL)suppressViewAdjustments;
- (BOOL)viewIsVisible;
- (CGPoint)nearestMajorBoundaryForPoint:(CGPoint)a3;
- (CGPoint)nearestMajorBoundaryForPoint:(CGPoint)a3 date:(id *)a4;
- (CGSize)_visibleSize;
- (InfiniteScrollViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5;
- (NSString)description;
- (UIScrollView)scrollView;
- (double)heightForSubviewWithCalendarDate:(id)a3;
- (double)showDateVerticalOffsetForDate:(id)a3;
- (double)subviewBufferExtensionMultiplier;
- (double)topInsetForSubviewWithCalendarDate:(id)a3;
- (double)unobstructedScrollViewHeight;
- (id)_addNewBottomView;
- (id)_addNewTopView;
- (id)_lastViewOnScreen;
- (id)allViews;
- (id)calendarDateForSubviewAboveSubviewWithCalendarDate:(id)a3;
- (id)calendarDateForSubviewBelowSubviewWithCalendarDate:(id)a3;
- (id)centerViewOnScreen;
- (id)createInitialViewForDate:(id)a3;
- (id)dateOfCenterViewInBuffer;
- (id)dateOfCenterViewOnScreen;
- (id)dateOfViewInBufferIndexRelativeToCenter:(int64_t)a3;
- (id)dequeueReusableView;
- (id)firstView;
- (id)firstViewOnScreen;
- (id)futureMajorBoundaryCalendarDateForCalendarDate:(id)a3;
- (id)newBottomViewBelowViewWithCalendarDate:(id)a3;
- (id)newTopViewAboveViewWithCalendarDate:(id)a3;
- (id)pastMajorBoundaryCalendarDateForCalendarDate:(id)a3;
- (id)subviewForDate:(id)a3;
- (id)subviewForPoint:(CGPoint)a3;
- (int64_t)subviewCount;
- (unint64_t)maximumCachedReusableViews;
- (void)_layoutInitialSubviews;
- (void)_recenterContentIfNeeded;
- (void)_recenterContentIfNeededWithForce:(BOOL)a3;
- (void)_removeBottomView;
- (void)_removeTopView;
- (void)_setUpInitialViewWithDate:(id)a3;
- (void)_updateSelectedDateWithTopView;
- (void)adjustLoadedViewRange;
- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4;
- (void)didEndScrolling;
- (void)enumerateScrollViewSubviews:(id)a3;
- (void)insertViews:(id)a3;
- (void)loadView;
- (void)reinitializeAllViewsWithCalendarDate:(id)a3;
- (void)reloadDataForAllViews;
- (void)reloadDataForViews:(id)a3;
- (void)resizeAllViews;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewSafeAreasDidChange;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setIsUserFingerDown:(BOOL)a3;
- (void)setSuppressViewAdjustments:(BOOL)a3;
- (void)showDate:(id)a3 animated:(BOOL)a4;
- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)showSelectedDateIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation InfiniteScrollViewController

- (InfiniteScrollViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)InfiniteScrollViewController;
  v10 = [(MainViewController *)&v15 initWithWindow:a5 model:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_startingDate, a3);
    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    reusableViews = v11->_reusableViews;
    v11->_reusableViews = v12;
  }
  return v11;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)InfiniteScrollViewController;
  v3 = [(InfiniteScrollViewController *)&v10 description];
  startingDate = self->_startingDate;
  v5 = [(MainViewController *)self model];
  v6 = +[NSNumber numberWithUnsignedInteger:[(NSMutableArray *)self->_views count]];
  v7 = +[NSNumber numberWithUnsignedInteger:[(NSMutableArray *)self->_reusableViews count]];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@; startingDate: [%@], model: [%@], views: [%@], _reusableViews: [%@]",
    v3,
    startingDate,
    v5,
    v6,
  v8 = v7);

  return (NSString *)v8;
}

- (id)allViews
{
  return self->_views;
}

- (void)loadView
{
  id v10 = objc_alloc_init((Class)UIView);
  [v10 setAutoresizingMask:18];
  [(InfiniteScrollViewController *)self setView:v10];
  v3 = objc_alloc_init(_InfiniteScrollViewController);
  [(_InfiniteScrollViewController *)v3 setDelegate:self];
  v4 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  v6 = [(InfiniteScrollViewController *)self scrollView];
  [v6 setAutoresizingMask:18];

  v7 = [(InfiniteScrollViewController *)self scrollView];
  [(_InfiniteScrollViewController *)v3 setView:v7];

  [(InfiniteScrollViewController *)self addChildViewController:v3];
  v8 = [(InfiniteScrollViewController *)self view];
  id v9 = [(InfiniteScrollViewController *)self scrollView];
  [v8 addSubview:v9];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)InfiniteScrollViewController;
  [(InfiniteScrollViewController *)&v12 viewDidLoad];
  v3 = [(InfiniteScrollViewController *)self scrollView];
  [v3 setClipsToBounds:0];

  v4 = [(InfiniteScrollViewController *)self scrollView];
  [v4 setContentSize:200.0, 400000.0];

  v5 = [(InfiniteScrollViewController *)self scrollView];
  [v5 setShowsHorizontalScrollIndicator:0];

  v6 = [(InfiniteScrollViewController *)self scrollView];
  [v6 setShowsVerticalScrollIndicator:0];

  v7 = [(InfiniteScrollViewController *)self scrollView];
  [v7 setScrollsToTop:0];

  v8 = +[UIColor systemBackgroundColor];
  id v9 = [(InfiniteScrollViewController *)self scrollView];
  [v9 setBackgroundColor:v8];

  id v10 = [(InfiniteScrollViewController *)self scrollView];
  [v10 setBounces:0];

  v11 = [(InfiniteScrollViewController *)self scrollView];
  [v11 setDelegate:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)InfiniteScrollViewController;
  [(InfiniteScrollViewController *)&v7 viewWillAppear:a3];
  v4 = [(InfiniteScrollViewController *)self scrollView];
  v5 = [v4 subviews];
  id v6 = [v5 count];

  if (!v6) {
    [(InfiniteScrollViewController *)self _setUpInitialViewWithDate:self->_startingDate];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  self->_viewIsVisible = 1;
  v3.receiver = self;
  v3.super_class = (Class)InfiniteScrollViewController;
  [(MainViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)InfiniteScrollViewController;
  [(InfiniteScrollViewController *)&v4 viewWillDisappear:a3];
  self->_viewIsVisible = 0;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  self->_futureSize = a3;
  self->_useFutureSize = 1;
  id v7 = a4;
  if ([(InfiniteScrollViewController *)self isViewLoaded])
  {
    v8 = [(InfiniteScrollViewController *)self view];
    id v9 = [v8 window];

    if (v9) {
      [(InfiniteScrollViewController *)self adjustLoadedViewRange];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)InfiniteScrollViewController;
  -[MainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000563C0;
  v11[3] = &unk_1001D2E40;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000564C8;
  v10[3] = &unk_1001D2E40;
  [v7 animateAlongsideTransition:v11 completion:v10];
}

- (void)_setUpInitialViewWithDate:(id)a3
{
  id v4 = a3;
  v5 = [v4 timeZone];
  id v6 = [(MainViewController *)self model];
  id v7 = [v6 calendar];
  v8 = [v7 timeZone];
  unsigned __int8 v9 = [v5 isEqualToTimeZone:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_super v12 = [v4 timeZone];
      v13 = [v12 name];
      v14 = [(MainViewController *)self model];
      objc_super v15 = [v14 calendar];
      v16 = [v15 timeZone];
      v17 = [v16 name];
      *(_DWORD *)buf = 138412546;
      v56 = v13;
      __int16 v57 = 2112;
      v58 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fixing mismatched timezone on date for reloading infinite scroll view (received %@, UI showing %@).", buf, 0x16u);
    }
    v18 = [v4 date];
    v19 = [(MainViewController *)self model];
    v20 = [v19 calendar];
    v21 = [v20 timeZone];
    uint64_t v22 = +[EKCalendarDate calendarDateWithDate:v18 timeZone:v21];

    id v4 = (id)v22;
  }
  uint64_t v23 = [(InfiniteScrollViewController *)self view];
  if (v23)
  {
    v24 = (void *)v23;
    id v25 = [(NSMutableArray *)self->_views count];

    if (v25)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v26 = self->_views;
      id v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v51;
        do
        {
          v30 = 0;
          do
          {
            if (*(void *)v51 != v29) {
              objc_enumerationMutation(v26);
            }
            [*(id *)(*((void *)&v50 + 1) + 8 * (void)v30) removeFromSuperview];
            v30 = (char *)v30 + 1;
          }
          while (v28 != v30);
          id v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v28);
      }

      views = self->_views;
      self->_views = 0;

      [(NSMutableArray *)self->_reusableViews removeAllObjects];
    }
  }
  v32 = [(InfiniteScrollViewController *)self scrollView];
  [v32 contentSize];
  double v34 = v33 * 0.5;
  v35 = [(InfiniteScrollViewController *)self scrollView];
  [v35 setContentOffset:0.0 v34];

  v36 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  v37 = self->_views;
  self->_views = v36;

  v38 = [(InfiniteScrollViewController *)self createInitialViewForDate:v4];
  v39 = [(InfiniteScrollViewController *)self scrollView];
  [v39 addSubview:v38];

  [(NSMutableArray *)self->_views addObject:v38];
  [v38 setAutoresizingMask:2];
  [v38 setHidden:0];
  v40 = [(InfiniteScrollViewController *)self scrollView];
  [v40 bounds];
  [v38 sizeThatFits:v41, v42];
  double v44 = v43;
  double v46 = v45;

  [v38 frame];
  [v38 setFrame:CGPointZero.x, CGPointZero.y, v44, v46];
  id v47 = [(InfiniteScrollViewController *)self _addNewTopView];
  id v48 = [(InfiniteScrollViewController *)self _addNewBottomView];
  [(InfiniteScrollViewController *)self reloadDataForAllViews];
  [(InfiniteScrollViewController *)self _layoutInitialSubviews];
  v49 = [(EKCalendarDate *)self->_startingDate date];
  [(InfiniteScrollViewController *)self showDate:v49 animated:0];
}

- (void)_layoutInitialSubviews
{
  if ([(NSMutableArray *)self->_views count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    objc_super v3 = self->_views;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v35;
      double v7 = 0.0;
      char v8 = 1;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v35 != v6) {
            objc_enumerationMutation(v3);
          }
          id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          [v10 frame];
          double v12 = v11;
          double v14 = v13;
          double v16 = v15;
          double v17 = v7;
          if ((v8 & 1) == 0)
          {
            [v10 topInset];
            double v17 = v7 - v18;
          }
          [v10 setFrame:v12, v17, v14, v16];
          [v10 frame];
          double v20 = v19;
          double v21 = 0.0;
          if ((v8 & 1) == 0) {
            [v10 topInset];
          }
          char v8 = 0;
          double v7 = v7 + v20 - v21;
        }
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
        char v8 = 0;
      }
      while (v5);
    }

    uint64_t v22 = [(InfiniteScrollViewController *)self scrollView];
    [v22 contentOffset];

    uint64_t v23 = [(NSMutableArray *)self->_views objectAtIndex:(unint64_t)[(NSMutableArray *)self->_views count] >> 1];
    [v23 frame];
    [v23 frame];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v24 = self->_views;
    id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v31;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
          [v29 frame:v30];
          [v29 setFrame:];
        }
        id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v26);
    }
  }
}

- (void)resizeAllViews
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = self->_views;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) sizeToFit:v8];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(InfiniteScrollViewController *)self _layoutInitialSubviews];
}

- (void)reinitializeAllViewsWithCalendarDate:(id)a3
{
  id v4 = (EKCalendarDate *)a3;
  id v5 = [(InfiniteScrollViewController *)self view];
  uint64_t v6 = [v5 window];

  if (v6) {
    goto LABEL_2;
  }
  long long v8 = [(InfiniteScrollViewController *)self navigationController];
  long long v9 = [v8 view];
  id v12 = [v9 window];

  if (!v12)
  {
LABEL_2:
    id v12 = 0;
    char v7 = 1;
  }
  else
  {
    EKUIPushFallbackSizingContextWithViewHierarchy();
    char v7 = 0;
  }
  [(NSMutableArray *)self->_reusableViews removeAllObjects];
  startingDate = self->_startingDate;
  self->_startingDate = v4;
  long long v11 = v4;

  [(InfiniteScrollViewController *)self _setUpInitialViewWithDate:v11];
  [(InfiniteScrollViewController *)self adjustLoadedViewRange];
  if ((v7 & 1) == 0) {
    EKUIPopFallbackSizingContextWithViewHierarchy();
  }
}

- (void)_recenterContentIfNeeded
{
}

- (void)_recenterContentIfNeededWithForce:(BOOL)a3
{
  if (![(InfiniteScrollViewController *)self suppressViewAdjustments])
  {
    id v5 = [(InfiniteScrollViewController *)self scrollView];
    [v5 contentOffset];
    double v7 = v6;
    double v9 = v8;

    long long v10 = [(InfiniteScrollViewController *)self scrollView];
    [v10 contentSize];
    double v12 = v11;

    double v13 = [(InfiniteScrollViewController *)self scrollView];
    [v13 bounds];
    double v15 = (v12 - v14) * 0.5;

    if (a3 || vabdd_f64(v9, v15) > v12 * 0.25)
    {
      double v16 = [(InfiniteScrollViewController *)self scrollView];
      [v16 setContentOffset:v7, v15];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      double v17 = self->_views;
      id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v24;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            [v22 center:v23];
            [v22 setCenter:];
          }
          id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v19);
      }
    }
  }
}

- (void)adjustLoadedViewRange
{
  if (![(InfiniteScrollViewController *)self suppressViewAdjustments])
  {
    objc_super v3 = [(InfiniteScrollViewController *)self scrollView];
    [(InfiniteScrollViewController *)self _visibleSize];
    double v5 = v4;
    [(InfiniteScrollViewController *)self subviewBufferExtensionMultiplier];
    double v7 = v6;
    [v3 contentOffset];
    double v9 = v8;
    [v3 contentOffset];
    double v11 = v10;
    id v12 = objc_alloc_init((Class)NSMutableSet);
    double v13 = [(NSMutableArray *)self->_views firstObject];
    double v14 = [(NSMutableArray *)self->_views lastObject];
    if (!v13) {
      goto LABEL_37;
    }
    double v15 = v9 - v5 * v7;
    double v16 = v5 * v7 + v5 + v11;
    [v13 frame];
    double MinY = CGRectGetMinY(v67);
    [v14 frame];
    double MaxY = CGRectGetMaxY(v68);
    if (v16 < MinY)
    {
      id v19 = [v13 calendarDate:MaxY];
      [v13 frame];
      double v21 = v20;
      [v13 topInset];
      double v23 = v22;
      double v24 = MinY;
      goto LABEL_7;
    }
    if (v15 > MaxY)
    {
      id v19 = [v14 calendarDate];
      [v14 frame];
      double v21 = v25;
      [v14 topInset];
      double v23 = v26;
      [v14 frame];
      double v24 = CGRectGetMinY(v69);
      do
      {
        while (1)
        {
LABEL_7:
          if (v16 >= MinY) {
            [(InfiniteScrollViewController *)self calendarDateForSubviewBelowSubviewWithCalendarDate:v19];
          }
          else {
          uint64_t v27 = [(InfiniteScrollViewController *)self calendarDateForSubviewAboveSubviewWithCalendarDate:v19];
          }

          [(InfiniteScrollViewController *)self heightForSubviewWithCalendarDate:v27];
          double v29 = v28;
          [(InfiniteScrollViewController *)self topInsetForSubviewWithCalendarDate:v27];
          double v31 = v23 + v24 - v29;
          double v32 = v21 + v24 - v30;
          double v24 = v16 >= MinY ? v21 + v24 - v30 : v23 + v24 - v29;
          if (v16 >= MinY) {
            break;
          }
          id v19 = v27;
          double v23 = v30;
          double v21 = v29;
          if (v31 <= v15) {
            goto LABEL_17;
          }
        }
        id v19 = v27;
        double v23 = v30;
        double v21 = v29;
      }
      while (v29 + v32 < v16);
LABEL_17:
      if ([(NSMutableArray *)self->_views count])
      {
        v58 = v14;
        v59 = v13;
        v60 = v3;
        unint64_t v33 = [(InfiniteScrollViewController *)self maximumCachedReusableViews];
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v34 = self->_views;
        id v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v62 objects:v66 count:16];
        if (v35)
        {
          id v36 = v35;
          uint64_t v37 = *(void *)v63;
          do
          {
            for (i = 0; i != v36; i = (char *)i + 1)
            {
              if (*(void *)v63 != v37) {
                objc_enumerationMutation(v34);
              }
              v39 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              if ((unint64_t)[(NSMutableArray *)self->_reusableViews count] <= v33)
              {
                [(NSMutableArray *)self->_reusableViews addObject:v39];
                [v39 setHidden:1];
              }
              else
              {
                [v39 removeFromSuperview];
              }
            }
            id v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v62 objects:v66 count:16];
          }
          while (v36);
        }

        v40 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
        views = self->_views;
        self->_views = v40;

        objc_super v3 = v60;
        double v14 = v58;
        double v13 = v59;
      }
      double v42 = [(InfiniteScrollViewController *)self createInitialViewForDate:v27];
      [v42 setHidden:0];
      [(NSMutableArray *)self->_views addObject:v42];
      [v3 addSubview:v42];
      [(InfiniteScrollViewController *)self _visibleSize];
      [v42 sizeThatFits:];
      [v3 frame];
      [v42 setFrame:];
      id v43 = v42;

      double v14 = v43;
      double v13 = v43;
    }
    if (v13 && v14)
    {
      [v13 frame];
      if (CGRectGetMinY(v70) > v15)
      {
        while (1)
        {
          double v44 = v13;
          double v45 = [(InfiniteScrollViewController *)self _addNewTopView];
          double v13 = [(NSMutableArray *)self->_views firstObject];

          if (!v45) {
            break;
          }
          [v45 frame];
          if (v46 < 0.0001) {
            break;
          }
          [v12 addObject:v45];

          [v13 frame];
          if (CGRectGetMinY(v71) <= v15) {
            goto LABEL_40;
          }
        }
      }
LABEL_40:
      [v14 frame];
      if (CGRectGetMaxY(v72) < v16)
      {
        while (1)
        {
          id v48 = v14;
          v49 = [(InfiniteScrollViewController *)self _addNewBottomView];
          double v14 = [(NSMutableArray *)self->_views lastObject];

          if (!v49) {
            break;
          }
          [v49 frame];
          if (v50 < 0.0001) {
            break;
          }
          [v12 addObject:v49];

          [v14 frame];
          if (CGRectGetMaxY(v73) >= v16) {
            goto LABEL_46;
          }
        }
      }
LABEL_46:
      if (!self->_isRelayingOut)
      {
        if (!self->_viewCullingDisabledForScrollAnimation)
        {
          long long v51 = [(NSMutableArray *)self->_views firstObject];

          if ([(NSMutableArray *)self->_views count])
          {
            while (1)
            {
              [v51 frame];
              if (CGRectGetMaxY(v74) >= v15) {
                break;
              }
              [(InfiniteScrollViewController *)self _removeTopView];
              double v13 = [(NSMutableArray *)self->_views firstObject];

              long long v51 = v13;
              if (![(NSMutableArray *)self->_views count]) {
                goto LABEL_56;
              }
            }
          }
          double v13 = v51;
LABEL_56:
          long long v52 = [(NSMutableArray *)self->_views lastObject];

          if ([(NSMutableArray *)self->_views count])
          {
            while (1)
            {
              [v52 frame];
              if (CGRectGetMinY(v75) <= v16) {
                break;
              }
              [(InfiniteScrollViewController *)self _removeBottomView];
              double v14 = [(NSMutableArray *)self->_views lastObject];

              long long v52 = v14;
              if (![(NSMutableArray *)self->_views count]) {
                goto LABEL_61;
              }
            }
          }
          double v14 = v52;
LABEL_61:
          if (self->_viewIsVisible
            && [(InfiniteScrollViewController *)self shouldUpdatePreferredReloadDates]&& (objc_opt_respondsToSelector() & 1) != 0)
          {
            long long v53 = [v13 calendarDate];
            v54 = [v53 date];

            v55 = [v14 endCalendarDate];
            v56 = [v55 date];

            __int16 v57 = [(MainViewController *)self model];
            [v57 setPreferredReloadStartDate:v54 endDate:v56];
          }
        }
        [(InfiniteScrollViewController *)self reloadDataForViews:v12];
        [(InfiniteScrollViewController *)self didScroll];
      }
    }
    else
    {
LABEL_37:
      id v47 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Didn't load required views in _adjustLoadedViewRange. It is possible that we are being torn down while reloading.", buf, 2u);
      }
    }
  }
}

- (BOOL)shouldUpdatePreferredReloadDates
{
  return 1;
}

- (void)reloadDataForAllViews
{
}

- (void)reloadDataForViews:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 reloadData];
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)viewDidLayoutSubviews
{
  [(UIScrollView *)self->_scrollView contentSize];
  double v4 = v3;
  [(UIScrollView *)self->_scrollView frame];
  if (vabdd_f64(v4, v5) >= 2.22044605e-16)
  {
    [(UIScrollView *)self->_scrollView contentSize];
    double v7 = v6;
    [(UIScrollView *)self->_scrollView frame];
    scrollView = self->_scrollView;
    -[UIScrollView setContentSize:](scrollView, "setContentSize:", v8, v7);
  }
}

- (void)scrollViewSafeAreasDidChange
{
}

- (void)didEndScrolling
{
  [(InfiniteScrollViewController *)self _recenterContentIfNeeded];
  if (self->_viewIsVisible
    && [(InfiniteScrollViewController *)self shouldUpdateSelectedDateWithCentralView])
  {
    [(InfiniteScrollViewController *)self _updateSelectedDateWithTopView];
  }
}

- (void)_updateSelectedDateWithTopView
{
  double v3 = [(InfiniteScrollViewController *)self firstViewOnScreen];
  if (v3)
  {
    id v7 = v3;
    double v4 = [v3 calendarDate];
    [(CUIKCalendarModel *)self->super._model setSelectedDate:v4];

    double v5 = [v7 calendarDate];
    lastKnownShownDate = self->_lastKnownShownDate;
    self->_lastKnownShownDate = v5;

    double v3 = v7;
  }
}

- (BOOL)shouldUpdateSelectedDateWithCentralView
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (![(InfiniteScrollViewController *)self suppressViewAdjustments])
  {
    [(InfiniteScrollViewController *)self didScroll];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(InfiniteScrollViewController *)self setIsUserFingerDown:1];

  [(InfiniteScrollViewController *)self willBeginDragging];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  [(InfiniteScrollViewController *)self setIsUserFingerDown:0];
  [(InfiniteScrollViewController *)self didEndDraggingWillDecelerate:v4];
  if (!v4)
  {
    [(InfiniteScrollViewController *)self didEndScrolling];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  if (![(InfiniteScrollViewController *)self suppressViewAdjustments])
  {
    self->_viewCullingDisabledForScrollAnimation = 0;
    [(InfiniteScrollViewController *)self didEndScrolling];
  }
}

- (void)viewWillLayoutSubviews
{
  if ([(InfiniteScrollViewController *)self isViewLoaded])
  {
    if (!self->_views)
    {
      [(InfiniteScrollViewController *)self _setUpInitialViewWithDate:self->_startingDate];
      [(InfiniteScrollViewController *)self didLoadInitialViews];
    }
    v3.receiver = self;
    v3.super_class = (Class)InfiniteScrollViewController;
    [(InfiniteScrollViewController *)&v3 viewWillLayoutSubviews];
  }
}

- (CGSize)_visibleSize
{
  if (self->_useFutureSize)
  {
    CGFloat width = self->_futureSize.width;
    CGFloat height = self->_futureSize.height;
  }
  else
  {
    BOOL v4 = [(InfiniteScrollViewController *)self scrollView];
    [v4 bounds];
    CGFloat width = v5;
    CGFloat height = v6;
  }
  double v7 = width;
  double v8 = height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)insertViews:(id)a3
{
  BOOL v4 = +[NSMutableArray arrayWithArray:a3];
  views = self->_views;
  self->_views = v4;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v6 = self->_views;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v11 setHidden:0];
        long long v12 = [(InfiniteScrollViewController *)self scrollView];
        [v12 addSubview:v11];
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)_addNewTopView
{
  objc_super v3 = [(NSMutableArray *)self->_views firstObject];
  BOOL v4 = [v3 calendarDate];
  id v5 = [(InfiniteScrollViewController *)self newTopViewAboveViewWithCalendarDate:v4];
  [v5 setAutoresizingMask:2];
  double v6 = [v5 superview];

  id v7 = [(InfiniteScrollViewController *)self scrollView];
  id v8 = v7;
  if (v6) {
    [v7 sendSubviewToBack:v5];
  }
  else {
    [v7 insertSubview:v5 atIndex:0];
  }

  [v5 setHidden:0];
  uint64_t v9 = [(InfiniteScrollViewController *)self scrollView];
  [v9 bounds];
  [v5 sizeThatFits:v10, v11];
  double v13 = v12;
  double v15 = v14;

  [v5 frame];
  [v3 frame];
  CGFloat v16 = CGRectGetMinY(v20) - v15;
  [v3 topInset];
  [v5 setFrame:CGRectMake(0.0, v16 + v17, v13, v15)];
  [(NSMutableArray *)self->_views insertObject:v5 atIndex:0];

  return v5;
}

- (id)_addNewBottomView
{
  objc_super v3 = [(NSMutableArray *)self->_views lastObject];
  BOOL v4 = [v3 calendarDate];
  id v5 = [(InfiniteScrollViewController *)self newBottomViewBelowViewWithCalendarDate:v4];
  [v5 setAutoresizingMask:2];
  if (v5)
  {
    double v6 = [v5 superview];

    id v7 = [(InfiniteScrollViewController *)self scrollView];
    id v8 = v7;
    if (v6) {
      [v7 bringSubviewToFront:v5];
    }
    else {
      [v7 addSubview:v5];
    }

    [v5 setHidden:0];
    uint64_t v9 = [(InfiniteScrollViewController *)self scrollView];
    [v9 bounds];
    [v5 sizeThatFits:v10, v11];
    double v13 = v12;
    double v15 = v14;

    [v5 frame];
    [v3 frame];
    double MaxY = CGRectGetMaxY(v20);
    [v5 topInset];
    [v5 setFrame:CGRectMake(0.0, MaxY - v17, v13, v15)];
    [(NSMutableArray *)self->_views addObject:v5];
  }

  return v5;
}

- (void)_removeTopView
{
  id v4 = [(NSMutableArray *)self->_views firstObject];
  id v3 = [(NSMutableArray *)self->_reusableViews count];
  if (v3 <= (id)[(InfiniteScrollViewController *)self maximumCachedReusableViews]) {
    [(NSMutableArray *)self->_reusableViews addObject:v4];
  }
  else {
    [v4 removeFromSuperview];
  }
  [(NSMutableArray *)self->_views removeObjectAtIndex:0];
  [v4 setHidden:1];
}

+ (BOOL)_view:(id)a3 containsCalendarDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 calendarDate];
  id v8 = [v7 compare:v6];

  if (v8 == (id)1)
  {
    BOOL v9 = 0;
  }
  else
  {
    double v10 = [v5 endCalendarDate];
    BOOL v9 = [v10 compare:v6] != (id)-1;
  }
  return v9;
}

- (void)_removeBottomView
{
  id v4 = [(NSMutableArray *)self->_views lastObject];
  id v3 = [(NSMutableArray *)self->_reusableViews count];
  if (v3 <= (id)[(InfiniteScrollViewController *)self maximumCachedReusableViews]) {
    [(NSMutableArray *)self->_reusableViews addObject:v4];
  }
  else {
    [v4 removeFromSuperview];
  }
  [(NSMutableArray *)self->_views removeLastObject];
  [v4 setHidden:1];
}

- (BOOL)isDateVisible:(id)a3
{
  id v4 = a3;
  id v5 = [(InfiniteScrollViewController *)self firstViewOnScreen];
  id v6 = [(InfiniteScrollViewController *)self _lastViewOnScreen];
  id v7 = [v5 calendarDate];
  id v8 = [v6 endCalendarDate];
  BOOL v9 = [v8 calendarDateForEndOfDay];

  [v7 absoluteTime];
  double v11 = v10;
  [v9 absoluteTime];
  double v13 = v12;
  [v4 timeIntervalSinceReferenceDate];
  double v15 = v14;
  CGFloat v16 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    double v17 = v16;
    id v18 = [v7 date];
    id v19 = [v9 date];
    int v22 = 138412802;
    id v23 = v4;
    __int16 v24 = 2112;
    double v25 = v18;
    __int16 v26 = 2112;
    uint64_t v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Infinite scroll view determining if date %@ is visible. Onscreen dates: %@ - %@", (uint8_t *)&v22, 0x20u);
  }
  BOOL v20 = v15 <= v13 && v11 <= v15;

  return v20;
}

- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4
{
  id v11 = [(InfiniteScrollViewController *)self firstViewOnScreen];
  id v7 = [(InfiniteScrollViewController *)self _lastViewOnScreen];
  id v8 = [v11 calendarDate];
  BOOL v9 = [v7 endCalendarDate];
  double v10 = [v9 calendarDateForEndOfDay];

  if (a3)
  {
    *a3 = [v8 date];
  }
  if (a4)
  {
    *a4 = [v10 date];
  }
}

- (int64_t)subviewCount
{
  return (int64_t)[(NSMutableArray *)self->_views count];
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = (void (**)(id, void))a5;
  double v10 = &objc_retain_x2_ptr;
  id v11 = [(MainViewController *)self model];
  double v12 = [v11 eventStore];
  double v13 = [v12 timeZone];
  double v14 = +[EKCalendarDate calendarDateWithDate:v8 timeZone:v13];

  if ([(InfiniteScrollViewController *)self isViewLoaded])
  {
    views = self->_views;
    if (views)
    {
      CGRect v73 = v8;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      CGFloat v16 = views;
      id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v78 objects:v90 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v79;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v79 != v18) {
              objc_enumerationMutation(v16);
            }
            BOOL v20 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            if ([(id)objc_opt_class() _view:v20 containsCalendarDate:v14])
            {
              id v17 = v20;
              goto LABEL_15;
            }
          }
          id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v78 objects:v90 count:16];
          if (v17) {
            continue;
          }
          break;
        }
LABEL_15:
        double v10 = &objc_retain_x2_ptr;
      }

      uint64_t v21 = +[NSMutableArray array];
      int v22 = (void *)v21;
      if (v17)
      {
        int v23 = 0;
        goto LABEL_55;
      }
      CGRect v72 = (void *)v21;
      BOOL v69 = v6;
      __int16 v24 = [(NSMutableArray *)self->_views firstObject];
      double v25 = [(NSMutableArray *)self->_views lastObject];
      __int16 v26 = [v24 calendarDate];
      uint64_t v27 = [v26 date];

      double v28 = [v25 calendarDate];
      uint64_t v29 = [v28 date];

      CGRect v71 = (void *)v27;
      id v30 = [v73 compare:v27];
      CGRect v70 = v9;
      CGRect v67 = v25;
      CGRect v68 = v24;
      if (v30 == (id)1)
      {
        long long v34 = (void *)v29;
        if ([v73 compare:v29] == (id)-1)
        {
          double v31 = v72;
          double v45 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v83 = v73;
            __int16 v84 = 2112;
            v85 = v71;
            __int16 v86 = 2112;
            uint64_t v87 = v29;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Target view is not loaded. No view for date %@ in range %@ to %@", buf, 0x20u);
          }
          goto LABEL_46;
        }
        double v31 = v72;
        id v35 = [v25 calendarDate];
        unsigned int v36 = [(InfiniteScrollViewController *)self shouldAnimateScrollToDate:v14 fromClosestDate:v35];

        if (!v36)
        {
LABEL_46:
          if (self->_reinitializingViewsForNewDate)
          {
            if ([(NSMutableArray *)self->_views count])
            {
              id v17 = [(NSMutableArray *)self->_views objectAtIndexedSubscript:(unint64_t)[(NSMutableArray *)self->_views count] >> 1];
            }
            else
            {
              id v17 = 0;
            }
            double v46 = (void *)kCalUILogHandle;
            BOOL v9 = v70;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
            {
              id v47 = v46;
              id v48 = [v17 calendarDate];
              v49 = [v48 date];
              *(_DWORD *)buf = 138544130;
              v83 = v73;
              __int16 v84 = 2114;
              v85 = v71;
              __int16 v86 = 2114;
              uint64_t v87 = (uint64_t)v34;
              __int16 v88 = 2114;
              v89 = v49;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "No view for date %{public}@. Loaded range is %{public}@ to %{public}@. Not reinitalizing views because we were already doing that, so scrolling to %{public}@ instead", buf, 0x2Au);

              double v10 = &objc_retain_x2_ptr;
            }
            int v23 = 0;
            BOOL v6 = v69;
            int v22 = v72;
          }
          else
          {
            self->_reinitializingViewsForNewDate = 1;
            [(InfiniteScrollViewController *)self reinitializeAllViewsWithCalendarDate:v14];
            int v23 = 0;
            id v17 = 0;
            self->_reinitializingViewsForNewDate = 0;
            int v22 = v31;
            BOOL v9 = v70;
            BOOL v6 = v69;
          }
          goto LABEL_54;
        }
      }
      else
      {
        double v31 = v72;
        double v32 = [v24 calendarDate];
        unsigned __int8 v33 = [(InfiniteScrollViewController *)self shouldAnimateScrollToDate:v14 fromClosestDate:v32];

        long long v34 = (void *)v29;
        if ((v33 & 1) == 0) {
          goto LABEL_46;
        }
      }
      v66 = v34;
      uint64_t v37 = 0;
      do
      {
        if (v30 == (id)1)
        {
          v38 = [(InfiniteScrollViewController *)self _addNewBottomView];
          [v38 endCalendarDate];
        }
        else
        {
          v38 = [(InfiniteScrollViewController *)self _addNewTopView];
          [v38 calendarDate];
        v39 = };

        if (v38) {
          [v31 addObject:v38];
        }
        unsigned int v40 = [(id)objc_opt_class() _view:v38 containsCalendarDate:v14];
        id v41 = [v14 compare:v39];
        BOOL v42 = v41 == (id)-1 && v30 == (id)1;

        if (v41 == (id)1 && v30 != (id)1) {
          break;
        }
        if (!v41) {
          break;
        }
        if (v42) {
          break;
        }
        uint64_t v37 = v39;
      }
      while (!v40);
      double v44 = self->_views;
      BOOL v6 = v69;
      if (v30 == (id)1) {
        [(NSMutableArray *)v44 lastObject];
      }
      else {
      id v17 = [(NSMutableArray *)v44 firstObject];
      }
      int v22 = v31;
      long long v34 = v66;

      int v23 = 1;
      BOOL v9 = v70;
      double v10 = &objc_retain_x2_ptr;
LABEL_54:

      if (!v17)
      {
        if (v9) {
          v9[2](v9, 0);
        }
        id v17 = 0;
        goto LABEL_74;
      }
LABEL_55:
      [v17 frame];
      double v51 = v50;
      [(InfiniteScrollViewController *)self showDateVerticalOffsetForDate:v14];
      long long v52 = [(InfiniteScrollViewController *)self scrollView];
      [v52 safeAreaInsets];

      CalRoundToScreenScale();
      double v54 = v53;
      v55 = [(InfiniteScrollViewController *)self scrollView];
      [v55 contentOffset];
      double v57 = v54 - v56;

      double v58 = -v57;
      if (v57 >= 0.0) {
        double v58 = v57;
      }
      if (v6 && v58 < 1.0)
      {
        v59 = v10[320];
        v60 = CUIKTodayDate();
        v61 = [(CUIKCalendarModel *)self->super._model calendar];
        long long v62 = [v61 timeZone];
        long long v63 = [v59 calendarDateWithDate:v60 timeZone:v62];

        long long v64 = [(InfiniteScrollViewController *)self subviewForDate:v63];
        if (objc_opt_respondsToSelector()) {
          [v64 pulseTodayCircle];
        }
        if (v9) {
          v9[2](v9, 1);
        }
      }
      else
      {
        if (!v6)
        {
          long long v65 = [(InfiniteScrollViewController *)self scrollView];
          [v65 setContentOffset:0 animated:v51];

          [(InfiniteScrollViewController *)self adjustLoadedViewRange];
          id v8 = v73;
          if (v9) {
            v9[2](v9, 1);
          }
          [(InfiniteScrollViewController *)self didEndScrolling];
          [(InfiniteScrollViewController *)self reloadDataForViews:v22];
          goto LABEL_75;
        }
        if (v23) {
          self->_viewCullingDisabledForScrollAnimation = 1;
        }
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_100058CDC;
        v77[3] = &unk_1001D2A18;
        v77[4] = self;
        *(double *)&v77[5] = v51;
        *(double *)&v77[6] = v54;
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472;
        v74[2] = sub_100058D34;
        v74[3] = &unk_1001D3010;
        v74[4] = self;
        v76 = v9;
        id v75 = v22;
        +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v77 completion:v74];
      }
LABEL_74:
      id v8 = v73;
LABEL_75:
      objc_storeStrong((id *)&self->_lastKnownShownDate, v14);

      goto LABEL_76;
    }
  }
  objc_storeStrong((id *)&self->_startingDate, v14);
  if (v9) {
    v9[2](v9, 0);
  }
LABEL_76:
}

- (id)subviewForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(InfiniteScrollViewController *)self scrollView];
  id v7 = [(InfiniteScrollViewController *)self view];
  [v6 convertPoint:v7 fromView:x, y];
  CalRoundPointToScreenScale();
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v12 = self->_views;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        CGFloat v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v16 frame:v18];
        v24.double x = v9;
        v24.double y = v11;
        if (CGRectContainsPoint(v25, v24))
        {
          id v13 = v16;
          goto LABEL_11;
        }
      }
      id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v13;
}

- (id)subviewForDate:(id)a3
{
  id v4 = a3;
  id v5 = [(InfiniteScrollViewController *)self view];
  [v5 layoutIfNeeded];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v6 = self->_views;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)objc_opt_class(), "_view:containsCalendarDate:", v11, v4, (void)v14))
        {
          id v12 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (id)centerViewOnScreen
{
  id v3 = [(InfiniteScrollViewController *)self view];
  [v3 bounds];
  id v5 = -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v4 * 0.5);

  return v5;
}

- (id)firstViewOnScreen
{
  id v3 = [(InfiniteScrollViewController *)self scrollView];
  [v3 adjustedContentInset];
  double v5 = v4;

  return -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v5);
}

- (id)_lastViewOnScreen
{
  id v3 = [(InfiniteScrollViewController *)self scrollView];
  [v3 frame];
  double v5 = v4;

  BOOL v6 = [(InfiniteScrollViewController *)self scrollView];
  [v6 adjustedContentInset];
  double v8 = v5 - v7;

  return -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v8);
}

- (id)firstView
{
  return [(NSMutableArray *)self->_views firstObject];
}

- (id)dateOfCenterViewOnScreen
{
  id v3 = [(InfiniteScrollViewController *)self centerViewOnScreen];
  double v4 = [v3 calendarDate];
  if (!v4)
  {
    double v5 = [(InfiniteScrollViewController *)self firstViewOnScreen];
    double v4 = [v5 calendarDate];

    if (!v4) {
      double v4 = self->_startingDate;
    }
  }

  return v4;
}

- (id)dateOfCenterViewInBuffer
{
  id v3 = [(InfiniteScrollViewController *)self dateOfViewInBufferIndexRelativeToCenter:0];
  if (!v3) {
    id v3 = self->_startingDate;
  }

  return v3;
}

- (id)dateOfViewInBufferIndexRelativeToCenter:(int64_t)a3
{
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_views count];
  if (v5
    && ([(NSMutableArray *)self->_views objectAtIndex:a3 + (v5 >> 1)],
        (BOOL v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v7 = v6;
    double v8 = [v6 calendarDate];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)enumerateScrollViewSubviews:(id)a3
{
  double v4 = (void (**)(id, uint64_t, char *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v5 = self->_views;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (unint64_t)maximumCachedReusableViews
{
  return 0;
}

- (id)dequeueReusableView
{
  if ([(NSMutableArray *)self->_reusableViews count])
  {
    id v3 = [(NSMutableArray *)self->_reusableViews firstObject];
    [(NSMutableArray *)self->_reusableViews removeObjectAtIndex:0];
    if (objc_opt_respondsToSelector()) {
      [v3 prepareForReuse];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)showSelectedDateIfNeeded
{
  id v3 = [(MainViewController *)self model];
  double v4 = [v3 selectedDate];
  unsigned __int8 v5 = [v4 isEqual:self->_lastKnownShownDate];

  if ((v5 & 1) == 0)
  {
    id v8 = [(MainViewController *)self model];
    id v6 = [v8 selectedDate];
    id v7 = [v6 date];
    [(InfiniteScrollViewController *)self showDate:v7 animated:0];
  }
}

- (CGPoint)nearestMajorBoundaryForPoint:(CGPoint)a3
{
  -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", 0, a3.x, a3.y);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)nearestMajorBoundaryForPoint:(CGPoint)a3 date:(id *)a4
{
  double y = a3.y;
  CGFloat x = a3.x;
  id v7 = [(InfiniteScrollViewController *)self scrollView];
  [v7 safeAreaInsets];
  double v9 = v8;

  double v10 = 0.0;
  char v11 = -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v9);
  long long v12 = [(InfiniteScrollViewController *)self scrollView];
  long long v13 = [(InfiniteScrollViewController *)self view];
  [v12 convertPoint:v13 fromView:0.0, v9];
  double v15 = v14;

  LOBYTE(v16) = v15 > y;
  if (!v11)
  {
    views = self->_views;
    if (v15 <= y) {
      [(NSMutableArray *)views lastObject];
    }
    else {
    char v11 = [(NSMutableArray *)views firstObject];
    }
  }
  double v54 = a4;
  long long v18 = [v11 calendarDate];
  [v11 frame];
  double MinY = CGRectGetMinY(v62);
  [v11 frame];
  double MaxY = CGRectGetMaxY(v63);
  double v56 = v11;
  [v11 topInset];
  double v22 = v21;
  int v23 = 0;
  CGPoint v24 = 0;
  char v25 = 0;
LABEL_7:
  if (y >= MinY && y <= MaxY)
  {
    uint64_t v28 = [(InfiniteScrollViewController *)self pastMajorBoundaryCalendarDateForCalendarDate:v18];

    uint64_t v29 = [(InfiniteScrollViewController *)self futureMajorBoundaryCalendarDateForCalendarDate:v18];

    LOBYTE(v16) = 1;
    CGPoint v24 = (void *)v28;
    int v23 = (void *)v29;
    goto LABEL_15;
  }
  if (v16)
  {
    if (y <= MaxY)
    {
      char v27 = 0;
LABEL_28:
      unsigned int v36 = [(InfiniteScrollViewController *)self calendarDateForSubviewAboveSubviewWithCalendarDate:v18];
      int v16 = 1;
      goto LABEL_32;
    }
    uint64_t v51 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v18;
      id v48 = "Major boundary calculation failsafe triggered while searching upward.  Subview frame exceeds target point.  "
            "subviewCalendarDate: [%@]";
      goto LABEL_60;
    }
    goto LABEL_62;
  }
  if (y < MinY)
  {
    uint64_t v51 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v18;
      id v48 = "Major boundary calculation failsafe triggered while searching downward.  Subview frame exceeds target point."
            "  subviewCalendarDate: [%@]";
LABEL_60:
      v49 = v51;
      uint32_t v50 = 12;
LABEL_61:
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
    }
LABEL_62:
    id v43 = 0;
LABEL_63:
    id v41 = v18;
LABEL_64:
    double v46 = v56;
    goto LABEL_65;
  }
  char v27 = 0;
  while (1)
  {
    unsigned int v36 = [(InfiniteScrollViewController *)self calendarDateForSubviewBelowSubviewWithCalendarDate:v18];
    int v16 = 0;
LABEL_32:
    [(InfiniteScrollViewController *)self heightForSubviewWithCalendarDate:v36];
    double v38 = v37;
    [(InfiniteScrollViewController *)self topInsetForSubviewWithCalendarDate:v36];
    double v40 = v39;
    if (v16) {
      double MinY = v22 + MinY - v38;
    }
    else {
      double MinY = MaxY - v39;
    }
    id v41 = v36;

    if ((uint64_t)[v41 year] > 9999 || (uint64_t)objc_msgSend(v41, "year") <= -10000)
    {
      BOOL v42 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v41;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Major boundary calculation failsafe triggered while trying to find the subview matching a nearest major boundary calendar date. It is possible that nextSubviewHeight is negative, or other unexpected case happened. subviewCalendarDate: [%@]", buf, 0xCu);
      }

      id v43 = 0;
      goto LABEL_64;
    }
    double MaxY = v38 + MinY;

    double v22 = v40;
    long long v18 = v41;
    if ((v27 & 1) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    if (v25)
    {
      char v25 = 1;
    }
    else if ((id v30 = [v24 month], v30 == objc_msgSend(v18, "month")) {
           && (id v31 = [v24 day], v31 == objc_msgSend(v18, "day"))
    }
           || (id v32 = [v24 compare:v18]) == 0)
    {
      LOBYTE(v16) = 0;
      char v25 = 1;
      double v10 = MinY;
    }
    else
    {
      if (v32 == (id)1)
      {
        uint64_t v47 = kCalUILogHandle;
        if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR)) {
          goto LABEL_62;
        }
        *(_DWORD *)buf = 138412546;
        id v58 = v24;
        __int16 v59 = 2112;
        v60 = v18;
        id v48 = "Major boundary calculation failsafe triggered while trying to find the subview matching a past major bound"
              "ary calendar date.  pastMajorBoundaryCalendarDate: [%@] subviewCalendarDate: [%@]";
LABEL_53:
        v49 = v47;
        uint32_t v50 = 22;
        goto LABEL_61;
      }
      char v25 = 0;
    }
    id v33 = [v23 month];
    if (v33 == [v18 month])
    {
      id v34 = [v23 day];
      if (v34 == [v18 day]) {
        break;
      }
    }
    id v35 = [v23 compare:v18];
    if (!v35) {
      break;
    }
    if (v35 == (id)-1)
    {
      uint64_t v47 = kCalUILogHandle;
      if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      *(_DWORD *)buf = 138412546;
      id v58 = v23;
      __int16 v59 = 2112;
      v60 = v18;
      id v48 = "Major boundary calculation failsafe triggered while trying to find the subview matching a future major bound"
            "ary calendar date.  futureMajorBoundaryCalendarDate: [%@] subviewCalendarDate: [%@]";
      goto LABEL_53;
    }
    char v27 = 1;
    if (v16) {
      goto LABEL_28;
    }
  }
  if (y - v10 <= MinY - y) {
    double v44 = v24;
  }
  else {
    double v44 = v23;
  }
  if (y - v10 > MinY - y) {
    double v10 = MinY;
  }
  id v43 = v44;
  [(InfiniteScrollViewController *)self showDateVerticalOffsetForDate:v43];
  double y = v10 - v9 + v45;
  if (!v54) {
    goto LABEL_63;
  }
  double v46 = v56;
  if (v43)
  {
    id v43 = v43;
    id *v54 = v43;
  }
  id v41 = v18;
LABEL_65:

  double v52 = x;
  double v53 = y;
  result.double y = v53;
  result.CGFloat x = v52;
  return result;
}

- (BOOL)shouldAnimateScrollToDate:(id)a3 fromClosestDate:(id)a4
{
  return 0;
}

- (double)showDateVerticalOffsetForDate:(id)a3
{
  return 0.0;
}

- (double)subviewBufferExtensionMultiplier
{
  return 0.0;
}

- (double)unobstructedScrollViewHeight
{
  double v3 = [(InfiniteScrollViewController *)self scrollView];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(InfiniteScrollViewController *)self scrollView];
  [v8 bounds];
  double v9 = CGRectGetHeight(v11) - v5 - v7;

  return v9;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (BOOL)isUserFingerDown
{
  return self->_isUserFingerDown;
}

- (void)setIsUserFingerDown:(BOOL)a3
{
  self->_isUserFingerDown = a3;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (BOOL)isRelayingOut
{
  return self->_isRelayingOut;
}

- (BOOL)suppressViewAdjustments
{
  return self->_suppressViewAdjustments;
}

- (void)setSuppressViewAdjustments:(BOOL)a3
{
  self->_suppressViewAdjustments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_lastKnownShownDate, 0);
  objc_storeStrong((id *)&self->_reusableViews, 0);
  objc_storeStrong((id *)&self->_startingDate, 0);

  objc_storeStrong((id *)&self->_views, 0);
}

- (id)pastMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  return 0;
}

- (id)futureMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  return 0;
}

- (id)createInitialViewForDate:(id)a3
{
  return 0;
}

- (id)newTopViewAboveViewWithCalendarDate:(id)a3
{
  return 0;
}

- (id)newBottomViewBelowViewWithCalendarDate:(id)a3
{
  return 0;
}

- (id)calendarDateForSubviewAboveSubviewWithCalendarDate:(id)a3
{
  return 0;
}

- (id)calendarDateForSubviewBelowSubviewWithCalendarDate:(id)a3
{
  return 0;
}

- (double)heightForSubviewWithCalendarDate:(id)a3
{
  return 0.0;
}

- (double)topInsetForSubviewWithCalendarDate:(id)a3
{
  return 0.0;
}

@end