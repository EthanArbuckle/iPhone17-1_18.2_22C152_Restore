@interface RoutePlanningTransitionController
- (BOOL)_isClosestToFullHeight:(double)a3;
- (BOOL)_shouldDragCardForPanEvent;
- (BOOL)isCardDragEnabled;
- (BOOL)isTransitioning;
- (BOOL)showMaximumContentWhenExpanding;
- (ContaineeProtocol)delegate;
- (RoutePlanningTransitionContext)currentTransitionContext;
- (RoutePlanningTransitionController)initWithScrollView:(id)a3;
- (UIScrollView)scrollView;
- (double)_pinnedScrollY;
- (double)_scrollYForFullHeight;
- (double)_scrollYForMediumHeight;
- (double)_tableHeight;
- (void)_getScrollY:(double *)a3 forTableHeight:(double)a4;
- (void)_initiateCardDragIfNeededWithInitialVerticalTranslation:(double)a3;
- (void)_panGestureRecognizerAction:(id)a3;
- (void)_resetValuesToStartTransitionFromTableHeight:(double)a3;
- (void)_terminateCardDragIfNeeded;
- (void)_updateScrollYForFullHeightIfNeeded;
- (void)_updateScrollYForMediumHeightIfNeeded:(BOOL)a3;
- (void)dealloc;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCardDragEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setForceMinimumScrollViewHeight:(BOOL)a3;
- (void)setShowMaximumContentWhenExpanding:(BOOL)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)startTransition;
- (void)stopTransition;
- (void)updateTransitionWithHeight:(double)a3;
@end

@implementation RoutePlanningTransitionController

- (void)dealloc
{
  [(RoutePlanningTransitionController *)self stopTransition];
  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningTransitionController;
  [(RoutePlanningTransitionController *)&v3 dealloc];
}

- (RoutePlanningTransitionController)initWithScrollView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RoutePlanningTransitionController;
  v5 = [(RoutePlanningTransitionController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_showMaximumContentWhenExpanding = 1;
    objc_storeWeak((id *)&v5->_scrollView, v4);
    if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v6->_scrollView);
      v8 = [WeakRetained panGestureRecognizer];
      [v8 addTarget:v6 action:"_panGestureRecognizerAction:"];
    }
    v9 = v6;
  }

  return v6;
}

- (RoutePlanningTransitionContext)currentTransitionContext
{
  return self->_context;
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    if (a3) {
      [(RoutePlanningTransitionController *)self startTransition];
    }
    else {
      [(RoutePlanningTransitionController *)self stopTransition];
    }
  }
}

- (void)setCardDragEnabled:(BOOL)a3
{
  if (self->_cardDragEnabled != a3)
  {
    self->_cardDragEnabled = a3;
    if (!a3) {
      [(RoutePlanningTransitionController *)self _terminateCardDragIfNeeded];
    }
  }
}

- (double)_tableHeight
{
  objc_super v3 = [(RoutePlanningTransitionController *)self scrollView];
  [v3 bounds];
  double Height = CGRectGetHeight(v9);
  v5 = [(RoutePlanningTransitionController *)self scrollView];
  [v5 contentInset];
  double v7 = Height - v6;

  return v7;
}

- (double)_scrollYForMediumHeight
{
  scrollYForMediumdouble Height = self->_scrollYForMediumHeight;
  objc_super v3 = [(RoutePlanningTransitionController *)self scrollView];
  [v3 contentInset];
  double v5 = scrollYForMediumHeight - v4;

  return v5;
}

- (double)_scrollYForFullHeight
{
  scrollYForFulldouble Height = self->_scrollYForFullHeight;
  objc_super v3 = [(RoutePlanningTransitionController *)self scrollView];
  [v3 contentInset];
  double v5 = scrollYForFullHeight - v4;

  return v5;
}

- (double)_pinnedScrollY
{
  double pinnedScrollY = self->_pinnedScrollY;
  objc_super v3 = [(RoutePlanningTransitionController *)self scrollView];
  [v3 contentInset];
  double v5 = pinnedScrollY - v4;

  return v5;
}

- (void)startTransition
{
  objc_super v3 = [(RoutePlanningTransitionController *)self delegate];
  double v4 = [v3 transitionContextForTransitionController:self];
  context = self->_context;
  self->_context = v4;

  double v6 = [(RoutePlanningTransitionController *)self delegate];
  [v6 transitionControllerWillStart:self];

  [(RoutePlanningTransitionController *)self _tableHeight];
  -[RoutePlanningTransitionController _resetValuesToStartTransitionFromTableHeight:](self, "_resetValuesToStartTransitionFromTableHeight:");
  char Card = -[ContainerViewController delaysFirstCardPresentation]_0();
  v8 = [(RoutePlanningTransitionController *)self scrollView];
  CGRect v9 = [v8 heightAnchor];
  v10 = v9;
  double heightOfRowToKeepVisible = self->_heightOfRowToKeepVisible;
  if (Card)
  {
    v12 = [v9 constraintEqualToConstant:heightOfRowToKeepVisible];
    scrollViewMinimumHeightConstraint = self->_scrollViewMinimumHeightConstraint;
    self->_scrollViewMinimumHeightConstraint = v12;
  }
  else
  {
    v14 = [v9 constraintGreaterThanOrEqualToConstant:heightOfRowToKeepVisible];
    v15 = self->_scrollViewMinimumHeightConstraint;
    self->_scrollViewMinimumHeightConstraint = v14;

    [(NSLayoutConstraint *)self->_scrollViewMinimumHeightConstraint setActive:1];
  }
  v16 = sub_100628884();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = self->_context;
    int v18 = 138412290;
    v19 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Starting transition with %@", (uint8_t *)&v18, 0xCu);
  }
}

- (void)stopTransition
{
  if (self->_context)
  {
    objc_super v3 = sub_100628884();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Stopping transition", (uint8_t *)&v23, 2u);
    }

    [(NSLayoutConstraint *)self->_scrollViewMinimumHeightConstraint setActive:0];
    scrollViewMinimumHeightConstraint = self->_scrollViewMinimumHeightConstraint;
    self->_scrollViewMinimumHeightConstraint = 0;

    double v5 = [(RoutePlanningTransitionController *)self delegate];
    [v5 transitionControllerWillFinish:self];

    if (self->_isPanningTable) {
      goto LABEL_5;
    }
    [(RoutePlanningTransitionController *)self _tableHeight];
    double v8 = v7;
    if (![(RoutePlanningTransitionContext *)self->_context initiatedFromFullLayout]
      || ![(RoutePlanningTransitionController *)self _isClosestToFullHeight:v8])
    {
      [(RoutePlanningTransitionController *)self _updateScrollYForMediumHeightIfNeeded:0];
      if ([(RoutePlanningTransitionController *)self _isClosestToFullHeight:v8]) {
        [(RoutePlanningTransitionController *)self _scrollYForFullHeight];
      }
      else {
        [(RoutePlanningTransitionController *)self _scrollYForMediumHeight];
      }
      double v10 = v9;
      objc_super v11 = [(RoutePlanningTransitionController *)self scrollView];
      [v11 contentOffset];
      double v13 = v12;

      v14 = [(RoutePlanningTransitionController *)self scrollView];
      double v15 = vabdd_f64(v13, v10);
      v16 = [v14 traitCollection];
      [v16 displayScale];
      double v17 = 1.0;
      if (v18 >= 1.0)
      {
        v19 = [v14 traitCollection];
        [v19 displayScale];
        double v17 = v20;
      }
      if (v15 > 1.0 / v17)
      {
        v21 = sub_100628884();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          int v23 = 134218240;
          double v24 = v10;
          __int16 v25 = 2048;
          double v26 = v13;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Setting final offset: %#.5lf (current: %#.5lf)", (uint8_t *)&v23, 0x16u);
        }

        v22 = [(RoutePlanningTransitionController *)self scrollView];
        [v22 setContentOffset:1 animated:0.0 v10];
      }
LABEL_5:
      context = self->_context;
      self->_context = 0;
    }
  }
}

- (void)_updateScrollYForMediumHeightIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  [(RoutePlanningTransitionContext *)self->_context currentFrameOrigin];
  double v6 = v5;
  if (self->_scrollYForMediumHeight != v5)
  {
    double v7 = sub_100628884();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      scrollYForMediumdouble Height = self->_scrollYForMediumHeight;
      int v14 = 134218240;
      double v15 = scrollYForMediumHeight;
      __int16 v16 = 2048;
      double v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Updating scrollYForMediumHeight (prev: %#.5lf, new: %#.5lf)", (uint8_t *)&v14, 0x16u);
    }

    self->_scrollYForMediumdouble Height = v6;
    [(RoutePlanningTransitionController *)self _updateScrollYForFullHeightIfNeeded];
    if (v3)
    {
      unsigned int v9 = [(RoutePlanningTransitionContext *)self->_context initiatedFromFullLayout];
      uint64_t v10 = 24;
      if (v9) {
        uint64_t v10 = 32;
      }
      double v11 = *(double *)((char *)&self->super.isa + v10);
      if (vabdd_f64(v11, self->_pinnedScrollY) > 2.22044605e-16)
      {
        double v12 = sub_100628884();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          double pinnedScrollY = self->_pinnedScrollY;
          int v14 = 134218240;
          double v15 = pinnedScrollY;
          __int16 v16 = 2048;
          double v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Updating pinnedScrollY (prev: %#.5lf, new: %#.5lf)", (uint8_t *)&v14, 0x16u);
        }

        self->_double pinnedScrollY = v11;
      }
    }
  }
}

- (void)updateTransitionWithHeight:(double)a3
{
  if (self->_isPinningScrollY)
  {
    if (![(RoutePlanningTransitionContext *)self->_context initiatedFromFullLayout]
      || !self->_isPanningTable
      || [(RoutePlanningTransitionController *)self _shouldDragCardForPanEvent])
    {
      double v4 = [(RoutePlanningTransitionController *)self scrollView];
      [v4 layoutIfNeeded];

      double v5 = sub_100628884();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        double pinnedScrollY = self->_pinnedScrollY;
        *(_DWORD *)buf = 134217984;
        double v28 = pinnedScrollY;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Update. Setting contentOffset to pinnedScrollY: %#.5lf", buf, 0xCu);
      }

      [(RoutePlanningTransitionController *)self _pinnedScrollY];
      double v8 = v7;
      unsigned int v9 = [(RoutePlanningTransitionController *)self scrollView];
      [v9 setContentOffset:0.0 v8];
    }
  }
  else
  {
    [(RoutePlanningTransitionController *)self _tableHeight];
    uint64_t v26 = 0;
    -[RoutePlanningTransitionController _getScrollY:forTableHeight:](self, "_getScrollY:forTableHeight:", &v26);
    uint64_t v10 = [(RoutePlanningTransitionController *)self scrollView];
    UIRoundToViewScale();
    double v12 = v11;

    double v13 = [(RoutePlanningTransitionController *)self scrollView];
    [v13 contentOffset];
    double v15 = v14;

    __int16 v16 = [(RoutePlanningTransitionController *)self scrollView];
    double v17 = vabdd_f64(v12, v15);
    double v18 = [v16 traitCollection];
    [v18 displayScale];
    double v19 = 1.0;
    if (v20 >= 1.0)
    {
      v21 = [v16 traitCollection];
      [v21 displayScale];
      double v19 = v22;
    }
    int v23 = sub_100628884();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (v17 <= 1.0 / v19)
    {
      if (v24)
      {
        *(_DWORD *)buf = 134218240;
        double v28 = v12;
        __int16 v29 = 2048;
        uint64_t v30 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Update. No change to contentOffset.y: %#.5lf (unrounded: %#.5lf)", buf, 0x16u);
      }
    }
    else
    {
      if (v24)
      {
        *(_DWORD *)buf = 134218496;
        double v28 = v12;
        __int16 v29 = 2048;
        uint64_t v30 = v26;
        __int16 v31 = 2048;
        double v32 = v15;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Update. Setting contentOffset to %#.5lf (unrounded: %#.5lf, previous: %#.5lf)", buf, 0x20u);
      }

      __int16 v25 = [(RoutePlanningTransitionController *)self scrollView];
      [v25 layoutIfNeeded];

      int v23 = [(RoutePlanningTransitionController *)self scrollView];
      -[NSObject setContentOffset:](v23, "setContentOffset:", 0.0, v12);
    }
  }
}

- (void)setForceMinimumScrollViewHeight:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    scrollViewMinimumHeightConstraint = self->_scrollViewMinimumHeightConstraint;
    [(NSLayoutConstraint *)scrollViewMinimumHeightConstraint setActive:v3];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v8 = a3;
  if (![(RoutePlanningTransitionController *)self isTransitioning])
  {
    unsigned int v9 = +[MKMapService sharedService];
    if (y <= 0.0) {
      uint64_t v10 = 7;
    }
    else {
      uint64_t v10 = 8;
    }
    double v11 = [(RoutePlanningTransitionController *)self delegate];
    [v9 captureUserAction:v10 onTarget:[v11 currentUITargetForAnalytics] eventValue:0];
  }
  if ([(RoutePlanningTransitionController *)self isTransitioning] && a5 && self->_isPinningScrollY)
  {
    [(RoutePlanningTransitionController *)self _pinnedScrollY];
    CGFloat v13 = v12;
    [v8 setContentOffset:0.0 v12];
    a5->x = 0.0;
    a5->double y = v13;
    double v14 = sub_100628884();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      double pinnedScrollY = self->_pinnedScrollY;
      int v16 = 134217984;
      double v17 = pinnedScrollY;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Will end dragging. Providing target offset of pinnedScrollY: %#.5lf", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4 = a3;
  if ([(RoutePlanningTransitionController *)self isTransitioning] && self->_isPinningScrollY)
  {
    [v4 stopScrollingAndZooming];
    double v5 = sub_100628884();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double pinnedScrollY = self->_pinnedScrollY;
      int v8 = 134217984;
      double v9 = pinnedScrollY;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Decelerating. Setting contentOffset to pinnedScrollY: %#.5lf", (uint8_t *)&v8, 0xCu);
    }

    [(RoutePlanningTransitionController *)self _pinnedScrollY];
    [v4 setContentOffset:0.0 v7];
  }
}

- (void)_resetValuesToStartTransitionFromTableHeight:(double)a3
{
  [(RoutePlanningTransitionContext *)self->_context heightToFrame];
  self->_double heightOfRowToKeepVisible = v4;
  [(RoutePlanningTransitionContext *)self->_context currentFrameOrigin];
  self->_scrollYForMediumdouble Height = v5;
  [(RoutePlanningTransitionContext *)self->_context tableViewHeightForFullLayout];
  self->_double scrollViewHeightForFullLayout = v6;
  if ([(RoutePlanningTransitionContext *)self->_context initiatedFromFullLayout])
  {
    [(RoutePlanningTransitionContext *)self->_context initialOffsetY];
    self->_scrollYForFulldouble Height = v7;
  }
  else
  {
    [(RoutePlanningTransitionController *)self _updateScrollYForFullHeightIfNeeded];
  }
  unsigned int v8 = [(RoutePlanningTransitionContext *)self->_context initiatedFromFullLayout];
  uint64_t v9 = 24;
  if (v8) {
    uint64_t v9 = 32;
  }
  *(void *)&self->_double pinnedScrollY = *(Class *)((char *)&self->super.isa + v9);
  uint64_t v10 = sub_100628884();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double heightOfRowToKeepVisible = self->_heightOfRowToKeepVisible;
    double scrollViewHeightForFullLayout = self->_scrollViewHeightForFullLayout;
    scrollYForMediumdouble Height = self->_scrollYForMediumHeight;
    unsigned int v14 = [(RoutePlanningTransitionContext *)self->_context initiatedFromFullLayout];
    double v15 = @"NO";
    if (v14) {
      double v15 = @"YES";
    }
    int v16 = v15;
    scrollYForFulldouble Height = self->_scrollYForFullHeight;
    double pinnedScrollY = self->_pinnedScrollY;
    int v19 = 134219266;
    double v20 = heightOfRowToKeepVisible;
    __int16 v21 = 2048;
    double v22 = scrollYForMediumHeight;
    __int16 v23 = 2048;
    double v24 = scrollViewHeightForFullLayout;
    __int16 v25 = 2112;
    uint64_t v26 = v16;
    __int16 v27 = 2048;
    double v28 = scrollYForFullHeight;
    __int16 v29 = 2048;
    double v30 = pinnedScrollY;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Reset values: heightOfRowToKeepVisible: %#.5lf, scrollYForMediumHeight: %#.5lf, scrollViewHeightForFullLayout: %#.5lf, initiatedFromFullLayout: %@, scrollYForFullHeight: %#.5lf, pinnedScrollY: %#.5lf", (uint8_t *)&v19, 0x3Eu);
  }
}

- (void)_updateScrollYForFullHeightIfNeeded
{
  if (![(RoutePlanningTransitionContext *)self->_context initiatedFromFullLayout])
  {
    scrollYForMediumdouble Height = self->_scrollYForMediumHeight;
    if (self->_showMaximumContentWhenExpanding)
    {
      double scrollViewHeightForFullLayout = self->_scrollViewHeightForFullLayout;
      double v5 = scrollYForMediumHeight + self->_heightOfRowToKeepVisible;
      double v6 = v5 - scrollViewHeightForFullLayout;
      BOOL v7 = v5 > scrollViewHeightForFullLayout;
      scrollYForMediumdouble Height = 0.0;
      if (v7) {
        scrollYForMediumdouble Height = v6;
      }
    }
    self->_scrollYForFulldouble Height = scrollYForMediumHeight;
  }
}

- (void)_getScrollY:(double *)a3 forTableHeight:(double)a4
{
  if (a3)
  {
    [(RoutePlanningTransitionController *)self _updateScrollYForMediumHeightIfNeeded:1];
    double heightOfRowToKeepVisible = self->_heightOfRowToKeepVisible;
    if (heightOfRowToKeepVisible <= a4)
    {
      double scrollViewHeightForFullLayout = self->_scrollViewHeightForFullLayout;
      if (scrollViewHeightForFullLayout > heightOfRowToKeepVisible)
      {
        double v17 = (a4 - heightOfRowToKeepVisible) / (scrollViewHeightForFullLayout - heightOfRowToKeepVisible);
        double v18 = sub_100628884();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          double v19 = self->_heightOfRowToKeepVisible;
          double v20 = self->_scrollViewHeightForFullLayout;
          int v29 = 134219008;
          double v30 = v17 * 100.0;
          __int16 v31 = 2048;
          double v32 = a4;
          __int16 v33 = 2048;
          double v34 = v19;
          __int16 v35 = 2048;
          double v36 = v20;
          __int16 v37 = 2048;
          double v38 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "percentMediumToFull (table is taller): percentMediumToFull: %3.1lf%% | [(%#.5lf - %1.5lf) / (%#.5lf - %#.5lf)]", (uint8_t *)&v29, 0x34u);
        }

        [(RoutePlanningTransitionController *)self _scrollYForMediumHeight];
        double v22 = v21;
        [(RoutePlanningTransitionController *)self _scrollYForFullHeight];
        double v24 = v23;
        *a3 = v22 + v17 * (v23 - v22);
        uint64_t v9 = sub_100628884();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_19;
        }
        double v25 = *a3;
        int v29 = 134219008;
        double v30 = v25;
        __int16 v31 = 2048;
        double v32 = v22;
        __int16 v33 = 2048;
        double v34 = v17;
        __int16 v35 = 2048;
        double v36 = v24;
        __int16 v37 = 2048;
        double v38 = v22;
        double v11 = "scrollY (table is taller): scrollY: %#.5lf | [%#.5lf + %1.2lf * (%#.5lf - %#.5lf)]";
        double v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
        uint32_t v26 = 52;
        goto LABEL_18;
      }
      [(RoutePlanningTransitionController *)self _scrollYForMediumHeight];
      *(void *)a3 = v27;
      uint64_t v9 = sub_100628884();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        double v28 = *a3;
        int v29 = 134217984;
        double v30 = v28;
        double v11 = "scrollY (table is taller, but scrollViewHeight is smaller than heightToKeepVisible): %#.5lf";
        double v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_FAULT;
        goto LABEL_17;
      }
    }
    else
    {
      [(RoutePlanningTransitionController *)self _scrollYForMediumHeight];
      *(void *)a3 = v8;
      uint64_t v9 = sub_100628884();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        double v10 = *a3;
        int v29 = 134217984;
        double v30 = v10;
        double v11 = "scrollY (cell is taller): %#.5lf";
        double v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
LABEL_17:
        uint32_t v26 = 12;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v29, v26);
      }
    }
LABEL_19:

    return;
  }
  unsigned int v14 = sub_1005762E4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v29 = 136315650;
    double v30 = COERCE_DOUBLE("-[RoutePlanningTransitionController _getScrollY:forTableHeight:]");
    __int16 v31 = 2080;
    double v32 = COERCE_DOUBLE("RoutePlanningTransitionController.m");
    __int16 v33 = 1024;
    LODWORD(v34) = 324;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    uint64_t v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v15 = +[NSThread callStackSymbols];
      int v29 = 138412290;
      double v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
    }
    goto LABEL_19;
  }
}

- (BOOL)_isClosestToFullHeight:(double)a3
{
  return self->_heightOfRowToKeepVisible
       + (self->_scrollViewHeightForFullLayout - self->_heightOfRowToKeepVisible) * 0.5 <= a3;
}

- (void)_panGestureRecognizerAction:(id)a3
{
  id v7 = a3;
  double v4 = (char *)[v7 state];
  if ((unint64_t)(v4 - 3) < 2)
  {
    self->_isPanningTable = 0;
    goto LABEL_9;
  }
  if (v4 == (char *)2)
  {
    if ([(RoutePlanningTransitionController *)self _shouldDragCardForPanEvent])
    {
LABEL_8:
      double v5 = [(RoutePlanningTransitionController *)self scrollView];
      [v7 translationInView:v5];
      [(RoutePlanningTransitionController *)self _initiateCardDragIfNeededWithInitialVerticalTranslation:v6];

      goto LABEL_10;
    }
LABEL_9:
    [(RoutePlanningTransitionController *)self _terminateCardDragIfNeeded];
    goto LABEL_10;
  }
  if (v4 == (char *)1)
  {
    self->_isPanningTable = 1;
    if ([(RoutePlanningTransitionController *)self _shouldDragCardForPanEvent]) {
      goto LABEL_8;
    }
  }
LABEL_10:
}

- (void)_initiateCardDragIfNeededWithInitialVerticalTranslation:(double)a3
{
  if (!self->_isPinningScrollY)
  {
    self->_isPinningScrollY = 1;
    self->_scrollViewPanGestureTranslationBeforeCardDrag = a3;
    double v4 = [(RoutePlanningTransitionController *)self scrollView];
    unsigned int v5 = [v4 showsVerticalScrollIndicator];

    if (v5)
    {
      id v6 = [(RoutePlanningTransitionController *)self scrollView];
      [v6 setShowsVerticalScrollIndicator:0];
    }
  }
}

- (void)_terminateCardDragIfNeeded
{
  if (self->_isPinningScrollY)
  {
    self->_isPinningScrollY = 0;
    self->_scrollViewPanGestureTranslationBeforeCardDrag = 0.0;
    BOOL v3 = [(RoutePlanningTransitionController *)self scrollView];
    unsigned __int8 v4 = [v3 showsVerticalScrollIndicator];

    if ((v4 & 1) == 0)
    {
      id v5 = [(RoutePlanningTransitionController *)self scrollView];
      [v5 setShowsVerticalScrollIndicator:1];
    }
  }
}

- (BOOL)_shouldDragCardForPanEvent
{
  if (![(RoutePlanningTransitionController *)self isCardDragEnabled]) {
    return 0;
  }
  [(RoutePlanningTransitionController *)self _tableHeight];
  id v5 = [(RoutePlanningTransitionController *)self scrollView];
  UIRoundToViewScale();
  double v7 = v6;

  unsigned int v8 = [(RoutePlanningTransitionController *)self isTransitioning];
  char v9 = v8;
  if (!v8)
  {
    v2 = [(RoutePlanningTransitionController *)self delegate];
    BOOL v3 = [v2 transitionContextForTransitionController:self];
    [v3 tableViewHeightForFullLayout];
  }
  double v10 = [(RoutePlanningTransitionController *)self scrollView];
  UIRoundToViewScale();
  double v12 = v11;

  if ((v9 & 1) == 0)
  {
  }
  if (v7 < v12)
  {
    if (v7 != 0.0) {
      return 1;
    }
    os_log_type_t v13 = [(RoutePlanningTransitionController *)self scrollView];
    unsigned int v14 = [v13 panGestureRecognizer];
    double v15 = [(RoutePlanningTransitionController *)self scrollView];
    [v14 translationInView:v15];
    double v17 = v16;

    goto LABEL_11;
  }
  double v18 = [(RoutePlanningTransitionController *)self scrollView];
  double v19 = [v18 panGestureRecognizer];
  double v20 = [(RoutePlanningTransitionController *)self scrollView];
  [v19 translationInView:v20];
  double v22 = v21;

  if (v22 <= 0.0) {
    return 0;
  }
  os_log_type_t v13 = [(RoutePlanningTransitionController *)self scrollView];
  [v13 contentOffset];
  double v17 = v23;
LABEL_11:
  BOOL v24 = v17 <= 0.0;

  return v24;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  return (UIScrollView *)WeakRetained;
}

- (BOOL)isCardDragEnabled
{
  return self->_cardDragEnabled;
}

- (BOOL)showMaximumContentWhenExpanding
{
  return self->_showMaximumContentWhenExpanding;
}

- (void)setShowMaximumContentWhenExpanding:(BOOL)a3
{
  self->_showMaximumContentWhenExpanding = a3;
}

- (ContaineeProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ContaineeProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_scrollViewMinimumHeightConstraint, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end