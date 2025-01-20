@interface DayNavigationWeekScrollView
- (BOOL)_isDateWeekend:(id)a3;
- (BOOL)canAnimateToDate:(id)a3;
- (BOOL)dayNavigationCellShouldEnableSpringLoading;
- (BOOL)eventSpringLoadingEnabled;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)showsMultiDay;
- (CGSize)cellSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (DayNavigationViewCellFactory)cellFactory;
- (DayNavigationWeekScrollView)initWithFrame:(CGRect)a3 calendar:(id)a4 selectedDate:(id)a5 cellFactory:(id)a6 eventSpringLoadingEnabled:(BOOL)a7;
- (DayNavigationWeekScrollViewDelegate)navDelegate;
- (NSDate)selectedDate;
- (NSDate)startDateOfSelectedWeek;
- (NSDate)today;
- (double)_alignXToPage:(double)a3;
- (double)_calculateCellWidth;
- (double)_offsetAllViews:(double)a3;
- (id)_badgeDataForDate:(id)a3 outIsLoading:(BOOL *)a4;
- (id)_selectedDateAsCalendarDate;
- (id)_weekStartForDate:(id)a3;
- (id)multiDayHighlightView;
- (id)selectedDateAfterScrollingToPoint:(CGPoint)a3;
- (id)visibleCellBadgeColors;
- (id)visibleCellBadgeLocales;
- (id)visibleCellDayTypes;
- (int64_t)_cellIndexForX:(double)a3;
- (int64_t)_firstVisibleIndex;
- (int64_t)_firstVisibleIndexInView;
- (int64_t)_indexForDate:(id)a3;
- (int64_t)_indexOfCellToScrollToForDateAndBuildIfNeeded:(id)a3;
- (int64_t)_lastVisibleIndex;
- (int64_t)_loadedBufferViewsRight;
- (int64_t)cellsDisplayed;
- (int64_t)firstVisibleDayOffsetFromSelectedDay;
- (int64_t)maxBufferViews;
- (int64_t)sideViews;
- (void)_addNewCellToSide:(BOOL)a3;
- (void)_adjustCellsIfNeeded;
- (void)_adjustContentOffsetIfNeeded;
- (void)_createSubviewsWithFirstVisibleDate:(id)a3;
- (void)_didFinishDecelerating;
- (void)_layoutCells;
- (void)_setCell:(id)a3 highlight:(BOOL)a4 animated:(BOOL)a5;
- (void)_setCell:(id)a3 toDate:(id)a4;
- (void)_setOffscreenCellsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateBadgeForCell:(id)a3 forDate:(id)a4;
- (void)_updateCellWidthIfNeeded;
- (void)cancelScrollingAnimation;
- (void)contentSizeCategoryChanged;
- (void)dayNavigationCellTouchUpOccurred:(id)a3;
- (void)didFinishScrolling;
- (void)didScroll;
- (void)layoutSubviews;
- (void)pulseToday;
- (void)setBackgroundColor:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setEventSpringLoadingEnabled:(BOOL)a3;
- (void)setFirstVisibleDate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNavDelegate:(id)a3;
- (void)setSelectedDate:(id)a3 animated:(BOOL)a4;
- (void)setSelectedDateWithoutScrolling:(id)a3;
- (void)setShowsMultiDay:(BOOL)a3;
- (void)setToSelectedDateAtLocation:(CGPoint)a3;
- (void)setToday:(id)a3;
- (void)significantTimeChangeOccurred;
- (void)sizeToFit;
- (void)stopPulsingToday;
- (void)updateDayBadges;
- (void)updateHighlightIfNeeded;
- (void)updateMultiDayHighlightViewAnimated:(BOOL)a3;
- (void)updateOverlays;
- (void)willBeginDragging;
- (void)willEndDraggingTargetX:(double)a3;
- (void)willTransitionToSize;
@end

@implementation DayNavigationWeekScrollView

- (void)setShowsMultiDay:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsMultiDay = a3;
  v5 = [(DayNavigationWeekScrollView *)self multiDayHighlightView];
  id v7 = v5;
  if (v3)
  {
    [(DayNavigationWeekScrollView *)self addSubview:v5];

    v6 = [(DayNavigationWeekScrollView *)self multiDayHighlightView];
    [(DayNavigationWeekScrollView *)self sendSubviewToBack:v6];

    [(DayNavigationWeekScrollView *)self updateMultiDayHighlightViewAnimated:0];
  }
  else
  {
    [v5 removeFromSuperview];
  }
}

- (id)_weekStartForDate:(id)a3
{
  calendar = self->_calendar;
  id v5 = a3;
  [(NSCalendar *)calendar setFirstWeekday:CUIKOneIndexedWeekStart()];
  v6 = [(NSCalendar *)self->_calendar components:24578 fromDate:v5];

  id v7 = [(NSCalendar *)self->_calendar dateFromComponents:v6];

  return v7;
}

- (id)multiDayHighlightView
{
  multiDayHighlightView = self->_multiDayHighlightView;
  if (!multiDayHighlightView)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    id v5 = self->_multiDayHighlightView;
    self->_multiDayHighlightView = v4;

    -[UIView setFrame:](self->_multiDayHighlightView, "setFrame:", 0.0, 0.0, 50.0, 50.0);
    v6 = +[UIColor tertiarySystemFillColor];
    id v7 = [v6 colorWithAlphaComponent:0.12];
    [(UIView *)self->_multiDayHighlightView setBackgroundColor:v7];

    v8 = [(UIView *)self->_multiDayHighlightView layer];
    [v8 setMasksToBounds:1];

    multiDayHighlightView = self->_multiDayHighlightView;
  }

  return multiDayHighlightView;
}

- (void)stopPulsingToday
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_cells;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isToday", (void)v8))
        {
          [v7 stopPulsing];
          goto LABEL_11;
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (int64_t)_indexOfCellToScrollToForDateAndBuildIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_cells firstObject];
  v6 = [(NSMutableArray *)self->_cells lastObject];
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  if (IsLeftToRight) {
    long long v8 = v5;
  }
  else {
    long long v8 = v6;
  }
  if (IsLeftToRight) {
    long long v9 = v6;
  }
  else {
    long long v9 = v5;
  }
  long long v10 = [v8 date];
  long long v11 = [v9 date];
  if ([v4 compare:v10] == (id)-1 || objc_msgSend(v4, "compare:", v11) == (id)1)
  {
    uint64_t v12 = [(DayNavigationWeekScrollView *)self _firstVisibleIndex];
    uint64_t v13 = [(DayNavigationWeekScrollView *)self _lastVisibleIndex];
    if (v12 < 0 || v12 >= (uint64_t)[(NSMutableArray *)self->_cells count])
    {
      uint64_t v14 = 0;
      if (v13 < 0) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v14 = [(NSMutableArray *)self->_cells objectAtIndex:v12];
      if (v13 < 0) {
        goto LABEL_16;
      }
    }
    if (v13 < (uint64_t)[(NSMutableArray *)self->_cells count])
    {
      uint64_t v15 = [(NSMutableArray *)self->_cells objectAtIndex:v13];
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v15 = 0;
LABEL_17:
    if (IsLeftToRight) {
      v16 = (void *)v14;
    }
    else {
      v16 = (void *)v15;
    }
    v44 = (void *)v14;
    if (IsLeftToRight) {
      uint64_t v14 = v15;
    }
    uint64_t v17 = [v16 date];
    v18 = (void *)v14;
    v19 = (void *)v17;
    uint64_t v20 = [v18 date];
    v21 = (void *)v20;
    v46 = (void *)v15;
    if (!v19 || v20)
    {
      if (!v19 && v20)
      {
        id v25 = objc_alloc_init((Class)NSDateComponents);
        [v25 setDay:1 - self->_weekLength];
        [(NSCalendar *)self->_calendar dateByAddingComponents:v25 toDate:v21 options:0];
        uint64_t v27 = v26 = v21;

        v19 = (void *)v27;
        v21 = v26;
      }
      if (!v19) {
        goto LABEL_32;
      }
      v24 = v21;
    }
    else
    {
      v22 = v19;
      id v23 = objc_alloc_init((Class)NSDateComponents);
      [v23 setDay:self->_weekLength - 1];
      v24 = [(NSCalendar *)self->_calendar dateByAddingComponents:v23 toDate:v22 options:0];

      v19 = v22;
    }
    if ([v4 compare:v19] == (id)-1)
    {
      v45 = v19;
      v32 = [(NSCalendar *)self->_calendar components:16 fromDate:v4 toDate:v19 options:0];
      id v33 = [v32 day];

      goto LABEL_38;
    }
    v21 = v24;
LABEL_32:
    v45 = v19;
    if (v21)
    {
      v24 = v21;
      v28 = [(NSCalendar *)self->_calendar components:16 fromDate:v21 toDate:v4 options:0];
      id v29 = [v28 day];

      if ((uint64_t)v29 > self->_weekLength)
      {
        int64_t v30 = -1;
        v6 = v43;
        v31 = v44;
LABEL_54:

        goto LABEL_55;
      }
      v6 = v43;
      if ([v4 compare:v11] == (id)1)
      {
        do
        {
          if (IsLeftToRight)
          {
            [(DayNavigationWeekScrollView *)self _addNewCellToSide:0];
            v37 = [(NSMutableArray *)self->_cells lastObject];
            v38 = v6;
            v6 = v37;
          }
          else
          {
            [(DayNavigationWeekScrollView *)self _addNewCellToSide:1];
            v37 = [(NSMutableArray *)self->_cells firstObject];
            v38 = v5;
            uint64_t v5 = v37;
          }

          uint64_t v39 = [v37 date];

          long long v11 = (void *)v39;
        }
        while ([v4 compare:v39] == (id)1);
        long long v11 = (void *)v39;
      }
      goto LABEL_52;
    }
    v24 = 0;
    id v33 = 0;
LABEL_38:
    v6 = v43;
    if ((uint64_t)v33 > self->_weekLength)
    {
      int64_t v30 = -1;
LABEL_53:
      v31 = v44;
      goto LABEL_54;
    }
    if ([v4 compare:v10] == (id)-1)
    {
      do
      {
        if (IsLeftToRight)
        {
          [(DayNavigationWeekScrollView *)self _addNewCellToSide:1];
          v34 = [(NSMutableArray *)self->_cells firstObject];
          v35 = v5;
          uint64_t v5 = v34;
        }
        else
        {
          [(DayNavigationWeekScrollView *)self _addNewCellToSide:0];
          v34 = [(NSMutableArray *)self->_cells lastObject];
          v35 = v6;
          v6 = v34;
        }

        uint64_t v36 = [v34 date];

        long long v10 = (void *)v36;
      }
      while ([v4 compare:v36] == (id)-1);
      long long v10 = (void *)v36;
    }
LABEL_52:
    v40 = [(NSMutableArray *)self->_cells firstObject];

    [v40 frame];
    self->_firstCellX = v41;
    int64_t v30 = [(DayNavigationWeekScrollView *)self _indexForDate:v4];
    uint64_t v5 = v40;
    goto LABEL_53;
  }
  int64_t v30 = [(DayNavigationWeekScrollView *)self _indexForDate:v4];
LABEL_55:

  return v30;
}

- (DayNavigationWeekScrollView)initWithFrame:(CGRect)a3 calendar:(id)a4 selectedDate:(id)a5 cellFactory:(id)a6 eventSpringLoadingEnabled:(BOOL)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v27.receiver = self;
  v27.super_class = (Class)DayNavigationWeekScrollView;
  v19 = -[DayNavigationWeekScrollView initWithFrame:](&v27, "initWithFrame:", x, y, width, height);
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_calendar, a4);
    [(NSCalendar *)v20->_calendar rangeOfUnit:512 inUnit:4096 forDate:v17];
    v20->_weekLength = v21;
    if (v21 >= 0) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = v21 + 1;
    }
    v20->_sideViews = v22 >> 1;
    v20->_maxBufferViews = v20->_weekLength;
    objc_storeStrong((id *)&v20->_cellFactory, a6);
    v20->_eventSpringLoadingEnabled = a7;
    [(DayNavigationWeekScrollView *)v20 setShowsHorizontalScrollIndicator:0];
    id v23 = +[UIColor whiteColor];
    [(DayNavigationWeekScrollView *)v20 setBackgroundColor:v23];

    [(DayNavigationWeekScrollView *)v20 setPagingEnabled:1];
    v24 = [(DayNavigationWeekScrollView *)v20 panGestureRecognizer];
    [v24 setDelaysTouchesBegan:1];

    [(DayNavigationWeekScrollView *)v20 setContentInsetAdjustmentBehavior:2];
    id v25 = [(DayNavigationWeekScrollView *)v20 _weekStartForDate:v17];
    [(DayNavigationWeekScrollView *)v20 _createSubviewsWithFirstVisibleDate:v25];
    -[DayNavigationWeekScrollView setFrame:](v20, "setFrame:", x, y, v20->_cellWidth * (double)((2 * [(DayNavigationWeekScrollView *)v20 sideViews]) | 1), height);
    [(DayNavigationWeekScrollView *)v20 setSelectedDate:v17 animated:0];
  }
  return v20;
}

- (void)_updateCellWidthIfNeeded
{
  [(DayNavigationWeekScrollView *)self _calculateCellWidth];
  double v4 = v3;
  if (vabdd_f64(v3, self->_cellWidth) >= 2.22044605e-16)
  {
    self->_cellWidth = v3;
    uint64_t v5 = [(DayNavigationWeekScrollView *)self navDelegate];

    if (v5)
    {
      id v6 = [(DayNavigationWeekScrollView *)self navDelegate];
      [v6 dayNavigationWeekScrollView:self didChangeCellWidth:v4];
    }
  }
}

- (double)_calculateCellWidth
{
  [(DayNavigationWeekScrollView *)self bounds];
  if (fabs(v3) >= 2.22044605e-16)
  {
    [(DayNavigationWeekScrollView *)self bounds];
    CalRoundToScreenScale();
  }
  else
  {
    if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy())
    {
      if (qword_1002169D0 != -1) {
        dispatch_once(&qword_1002169D0, &stru_1001D54E0);
      }
      double v4 = (void *)qword_1002169C8;
    }
    else
    {
      if (qword_1002169E0 != -1) {
        dispatch_once(&qword_1002169E0, &stru_1001D5500);
      }
      double v4 = (void *)qword_1002169D8;
    }
    AnchoredValueCurrentWindowWidth(self);
    [v4 valueForSize:];
  }
  return result;
}

- (void)_layoutCells
{
  double cellWidth = self->_cellWidth;
  [(DayNavigationWeekScrollView *)self _updateCellWidthIfNeeded];
  double v4 = self->_cellWidth;
  self->_pageAlignment = v4 * (double)((2 * [(DayNavigationWeekScrollView *)self sideViews]) | 1);
  if (cellWidth == 0.0)
  {
    id v7 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _layoutCells: oldCellWidth was 0 in division.", buf, 2u);
    }
    double v5 = self->_cellWidth;
    double v6 = 0.0;
  }
  else
  {
    double v5 = self->_cellWidth;
    double v6 = self->_firstCellX / cellWidth * v5;
  }
  [(DayNavigationWeekScrollView *)self bounds];
  double v9 = v8;
  self->_firstCellX = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v10 = self->_cells;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v15 setFrame:v6, 0.0, v5, v9, v17];
        [v15 setNeedsLayout];
        double v6 = v6 + self->_cellWidth;
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v12);
  }

  self->_needToLayoutCells = 0;
  double v16 = self->_firstCellX + self->_contentOffsetBeforeResizeInCellWidths * self->_cellWidth;
  self->_contentOffsetBeforeResizeInCellWidths = 0.0;
  -[DayNavigationWeekScrollView setContentOffset:](self, "setContentOffset:", v16, 0.0);
  if (vabdd_f64(cellWidth, self->_cellWidth) >= 2.22044605e-16) {
    [(DayNavigationWeekScrollView *)self _adjustContentOffsetIfNeeded];
  }
  -[DayNavigationWeekScrollView _setOffscreenCellsHidden:animated:](self, "_setOffscreenCellsHidden:animated:", 1, 0, (void)v17);
}

- (void)layoutSubviews
{
  if (self->_needToLayoutCells) {
    [(DayNavigationWeekScrollView *)self _layoutCells];
  }
  [(DayNavigationWeekScrollView *)self _adjustCellsIfNeeded];

  [(DayNavigationWeekScrollView *)self updateMultiDayHighlightViewAnimated:0];
}

- (void)_adjustCellsIfNeeded
{
  if (!self->_recentering && self->_cells)
  {
    [(DayNavigationWeekScrollView *)self contentOffset];
    double v4 = v3;
    [(DayNavigationWeekScrollView *)self frame];
    double v6 = v4 + v5;
    double firstCellX = self->_firstCellX;
    double v8 = [(NSMutableArray *)self->_cells lastObject];
    [v8 frame];
    double MaxX = CGRectGetMaxX(v16);
    while (v4 < firstCellX)
    {
      [(DayNavigationWeekScrollView *)self _addNewCellToSide:1];
      long long v10 = [(NSMutableArray *)self->_cells firstObject];
      [v10 frame];
      double firstCellX = v11;
    }
    if (v6 <= MaxX)
    {
      id v14 = v8;
    }
    else
    {
      do
      {
        [(DayNavigationWeekScrollView *)self _addNewCellToSide:0];
        id v14 = [(NSMutableArray *)self->_cells lastObject];

        [v14 frame];
        double v8 = v14;
      }
      while (v6 > CGRectGetMaxX(v17));
    }
    id v12 = [(NSMutableArray *)self->_cells firstObject];
    [v12 frame];
    self->_double firstCellX = v13;
  }
}

- (void)_setOffscreenCellsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_isScrolling)
  {
    double targetX = self->_targetX;
  }
  else
  {
    [(DayNavigationWeekScrollView *)self contentOffset];
    double targetX = v8;
  }
  [(DayNavigationWeekScrollView *)self bounds];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100011B8C;
  v13[3] = &unk_1001D5548;
  v13[4] = self;
  BOOL v14 = a3;
  *(double *)&v13[5] = targetX;
  *(double *)&v13[6] = targetX + CGRectGetWidth(v15);
  double v9 = objc_retainBlock(v13);
  long long v10 = v9;
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000FDCCC;
    v11[3] = &unk_1001D3038;
    id v12 = v9;
    +[UIView animateWithDuration:v11 animations:0.3];
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }
}

- (void)updateMultiDayHighlightViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  selectedIndedouble x = self->_selectedIndex;
  if (selectedIndex < (uint64_t)[(NSMutableArray *)self->_cells count])
  {
    double v6 = [(NSMutableArray *)self->_cells objectAtIndexedSubscript:self->_selectedIndex];
    [v6 dayCircleFrame];
    uint64_t v22 = v7;
    double v9 = v8;
    double cellWidth = self->_cellWidth;
    double v12 = (cellWidth - v11) * 0.5;
    double firstCellX = self->_firstCellX;
    int64_t v14 = self->_selectedIndex;
    double v15 = cellWidth + cellWidth + v12 * -2.0;
    if (CalTimeDirectionIsLeftToRight()) {
      double v16 = v12 + firstCellX + (double)v14 * cellWidth + -1.0;
    }
    else {
      double v16 = fmax(v12 + self->_firstCellX + (double)(self->_selectedIndex - 1) * self->_cellWidth + -5.0 + -1.0, 0.0);
    }
    double v17 = v15 + 2.0;
    double v18 = v9 + 2.0;
    long long v19 = [(DayNavigationWeekScrollView *)self traitCollection];
    int v20 = EKUIUsesRoundedRectsInsteadOfCircles();

    uint64_t v21 = [(UIView *)self->_multiDayHighlightView layer];
    if (v20) {
      [v21 setCornerRadius:8.0];
    }
    else {
      [v21 setCornerRadius:v18 * 0.5 + 1.0];
    }

    if (v3)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100023C50;
      v24[3] = &unk_1001D29C8;
      v24[4] = self;
      *(double *)&v24[5] = v16;
      *(double *)&v24[6] = v23 + -1.0;
      *(double *)&v24[7] = v17 + 5.0;
      *(double *)&v24[8] = v18;
      +[UIView animateWithDuration:0 delay:v24 usingSpringWithDamping:0 initialSpringVelocity:0.8 options:0.0 animations:0.6 completion:0.0];
    }
    else
    {
      -[UIView setFrame:](self->_multiDayHighlightView, "setFrame:", v16, v23 + -1.0, v17 + 5.0, v18);
    }
  }
}

- (void)_createSubviewsWithFirstVisibleDate:(id)a3
{
  id v4 = a3;
  cells = self->_cells;
  if (cells)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    double v6 = cells;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v48;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v48 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v47 + 1) + 8 * i) removeFromSuperview];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v8);
    }

    double v11 = self->_cells;
    self->_cells = 0;
  }
  [(DayNavigationWeekScrollView *)self _updateCellWidthIfNeeded];
  uint64_t v42 = 2 * [(DayNavigationWeekScrollView *)self sideViews];
  uint64_t v12 = v42 + 3;
  [(DayNavigationWeekScrollView *)self bounds];
  -[DayNavigationWeekScrollView setContentSize:](self, "setContentSize:", 40000.0, v13);
  double cellWidth = self->_cellWidth;
  uint64_t v15 = 1;
  self->_pageAlignment = cellWidth * (double)((2 * [(DayNavigationWeekScrollView *)self sideViews]) | 1);
  [(DayNavigationWeekScrollView *)self bounds];
  -[DayNavigationWeekScrollView setBounds:](self, "setBounds:");
  double v16 = self->_calendar;
  v45 = [(NSCalendar *)v16 components:30 fromDate:v4];
  double v17 = -[NSCalendar dateFromComponents:](v16, "dateFromComponents:");

  id v18 = objc_alloc_init((Class)NSDateComponents);
  [v18 setHour:4];
  uint64_t v19 = [(NSCalendar *)v16 dateByAddingComponents:v18 toDate:v17 options:0];

  char IsLeftToRight = CalTimeDirectionIsLeftToRight();
  [v18 setHour:0];
  [v18 setDay:-1];
  v43 = (void *)v19;
  v44 = v18;
  uint64_t v21 = [(NSCalendar *)v16 dateByAddingComponents:v18 toDate:v19 options:0];
  v46 = v16;
  uint64_t v22 = [(NSCalendar *)v16 timeZone];
  double v23 = +[EKCalendarDate calendarDateWithDate:v21 timeZone:v22];

  if ((IsLeftToRight & 1) == 0)
  {
    uint64_t v24 = [v23 calendarDateByAddingDays:v42 + 2];

    uint64_t v15 = -1;
    double v23 = (void *)v24;
  }
  id v25 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v12];
  v26 = self->_cells;
  self->_cells = v25;

  [(DayNavigationWeekScrollView *)self contentSize];
  double v28 = v27 * 0.5;
  uint64_t v29 = [(DayNavigationWeekScrollView *)self sideViews];
  double v30 = self->_cellWidth;
  double v31 = v28 - (double)v29 * v30 - v30 * 0.5;
  [(DayNavigationWeekScrollView *)self bounds];
  double v33 = v32;
  [(DayNavigationWeekScrollView *)self _alignXToPage:v31];
  double v35 = v34 - self->_cellWidth;
  self->_double firstCellX = v35;
  if (v12 < 1)
  {
    v40 = v23;
  }
  else
  {
    do
    {
      uint64_t v36 = -[DayNavigationViewCellFactory createCellWithFrame:](self->_cellFactory, "createCellWithFrame:", v35, 0.0, v30, v33);
      v37 = [(DayNavigationWeekScrollView *)self backgroundColor];
      [v36 setBackgroundColor:v37];

      v38 = [v23 calendarDateForDay];
      uint64_t v39 = [v38 date];
      [(DayNavigationWeekScrollView *)self _setCell:v36 toDate:v39];

      [v36 setDelegate:self];
      [(DayNavigationWeekScrollView *)self addSubview:v36];
      [(NSMutableArray *)self->_cells addObject:v36];
      v40 = [v23 calendarDateByAddingDays:v15];

      double v35 = v35 + self->_cellWidth;
      [v36 layoutSubviews];

      double v23 = v40;
      --v12;
    }
    while (v12);
  }
  double v41 = [(NSMutableArray *)self->_cells objectAtIndex:1];
  self->_needToLayoutCells = 0;
  self->_contentOffsetBeforeResizeInCellWidths = 0.0;
  [v41 frame];
  -[DayNavigationWeekScrollView setContentOffset:](self, "setContentOffset:");
  [(DayNavigationWeekScrollView *)self _setOffscreenCellsHidden:1 animated:0];
}

- (void)_setCell:(id)a3 toDate:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  [v16 setDate:v6];
  id v7 = [(DayNavigationWeekScrollView *)self _selectedDateAsCalendarDate];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 calendarDateForDay];
    long long v10 = [v9 date];

    double v11 = [v8 calendarDateForEndOfDay];
    uint64_t v12 = [v11 date];

    BOOL v13 = [v10 compare:v6] != (id)1 && [v12 compare:v6] != (id)-1;
    [v16 setCircled:v13 animated:1];
  }
  int64_t v14 = [(DayNavigationWeekScrollView *)self today];
  unsigned int v15 = [v6 isEqualToDate:v14];

  if (v15) {
    [v16 setIsToday:1];
  }
  if ([(DayNavigationWeekScrollView *)self _isDateWeekend:v6]) {
    [v16 setIsWeekend:1];
  }
  [v16 setOverlayShowsMonth:[self->_calendar component:512 fromDate:v6] == CUIKOneIndexedWeekStart() animated:0];
  [(DayNavigationWeekScrollView *)self _updateBadgeForCell:v16 forDate:v6];
  [v16 setAlpha:1.0];
}

- (NSDate)today
{
  todadouble y = self->_today;
  if (!today)
  {
    CUIKTodayDate();
    id v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_today;
    self->_todadouble y = v4;

    todadouble y = self->_today;
  }

  return today;
}

- (id)_selectedDateAsCalendarDate
{
  if (self->_selectedDate)
  {
    BOOL v3 = [(NSCalendar *)self->_calendar timeZone];
    if (v3) {
      id v4 = [objc_alloc((Class)EKCalendarDate) initWithDate:self->_selectedDate timeZone:v3];
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_isDateWeekend:(id)a3
{
  id v4 = a3;
  double v5 = +[CUIKPreferences sharedPreferences];
  unsigned int v6 = [v5 overrideLocaleWeekends];

  calendar = self->_calendar;
  if (v6)
  {
    id v8 = [(NSCalendar *)calendar components:512 fromDate:v4];

    id v9 = [v8 weekday];
    unsigned __int8 v11 = v9 == (id)1 || v9 == (id)7;
    id v4 = v8;
  }
  else
  {
    unsigned __int8 v11 = [(NSCalendar *)calendar isDateInWeekend:v4];
  }

  return v11;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (double)((2 * [(DayNavigationWeekScrollView *)self sideViews]) | 1);
  [(DayNavigationWeekScrollView *)self sideViews];
  CalRoundToScreenScale();
  double v9 = v8 * v7;
  [(DayNavigationWeekScrollView *)self frame];
  if (vabdd_f64(v9, v10) >= 2.22044605e-16
    || ([(DayNavigationWeekScrollView *)self frame], vabdd_f64(height, v11) >= 2.22044605e-16))
  {
    if (!self->_needToLayoutCells)
    {
      if (self->_cellWidth == 0.0)
      {
        BOOL v13 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView setFrame: _cellWidth was 0 in division.", buf, 2u);
        }
      }
      else
      {
        [(DayNavigationWeekScrollView *)self contentOffset];
        self->_contentOffsetBeforeResizeInCellWidths = (v12 - self->_firstCellX) / self->_cellWidth;
      }
      self->_needToLayoutCells = 1;
      [(DayNavigationWeekScrollView *)self setNeedsLayout];
    }
  }
  [(DayNavigationWeekScrollView *)self frame];
  if (vabdd_f64(height, v14) >= 2.22044605e-16)
  {
    [(DayNavigationWeekScrollView *)self contentSize];
    -[DayNavigationWeekScrollView setContentSize:](self, "setContentSize:");
  }
  v15.receiver = self;
  v15.super_class = (Class)DayNavigationWeekScrollView;
  -[DayNavigationWeekScrollView setFrame:](&v15, "setFrame:", x, y, v9, height);
}

- (int64_t)sideViews
{
  return self->_sideViews;
}

- (void)updateDayBadges
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_cells;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        double v9 = [v8 date];
        [(DayNavigationWeekScrollView *)self _updateBadgeForCell:v8 forDate:v9];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_updateBadgeForCell:(id)a3 forDate:(id)a4
{
  id v6 = a3;
  char v12 = 0;
  double v7 = [(DayNavigationWeekScrollView *)self _badgeDataForDate:a4 outIsLoading:&v12];
  double v8 = v7;
  if (!v12)
  {
    double v9 = [v7 color];
    [v6 setBadgeColor:v9];

    if (v8) {
      id v10 = [v8 dayType];
    }
    else {
      id v10 = 0;
    }
    [v6 setBadgeType:v10];
    long long v11 = [v8 locale];
    [v6 setBadgeLocale:v11];
  }
}

- (id)_badgeDataForDate:(id)a3 outIsLoading:(BOOL *)a4
{
  id v6 = a3;
  double v7 = [(DayNavigationWeekScrollView *)self navDelegate];

  if (v7)
  {
    double v8 = [(DayNavigationWeekScrollView *)self navDelegate];
    unsigned __int8 v9 = [v8 dayNavigationWeekScrollViewIsLoadingSpecialDayData:self];

    if (a4) {
      *a4 = v9;
    }
    id v10 = [(DayNavigationWeekScrollView *)self navDelegate];
    long long v11 = [v10 dayNavigationWeekScrollView:self dayDataForDate:v6];
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (DayNavigationWeekScrollViewDelegate)navDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navDelegate);

  return (DayNavigationWeekScrollViewDelegate *)WeakRetained;
}

- (CGSize)cellSize
{
  -[DayNavigationWeekScrollView sizeThatFits:](self, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double cellWidth = self->_cellWidth;
  result.double height = v3;
  result.double width = cellWidth;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  id v5 = [(DayNavigationWeekScrollView *)self traitCollection];
  int v6 = EKUIUsesRoundedRectsInsteadOfCircles();

  if (v6)
  {
    [(DayNavigationViewCellFactory *)self->_cellFactory roundedRectHeight];
    double v8 = v7;
  }
  else if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy())
  {
    unsigned __int8 v9 = CUIKGetOverlayCalendar();
    BOOL v10 = v9 == 0;

    double v8 = dbl_1001C1730[v10];
  }
  else
  {
    double v8 = 45.0;
  }
  double v11 = width;
  result.double height = v8;
  result.CGFloat width = v11;
  return result;
}

- (void)setSelectedDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  self->_decelerationWasLastInput = 0;
  if (v6)
  {
    double v7 = v6;
    double v8 = [(NSCalendar *)self->_calendar components:30 fromDate:v6];
    unsigned __int8 v9 = [(NSCalendar *)self->_calendar dateFromComponents:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }
  p_selectedDate = &self->_selectedDate;
  selectedDate = self->_selectedDate;
  if (([(NSDate *)selectedDate isEqual:v9] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedDate, v9);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    char v12 = self->_cells;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          [(DayNavigationWeekScrollView *)self _setCell:*(void *)(*((void *)&v29 + 1) + 8 * i) highlight:0 animated:v4];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }

    if (*p_selectedDate)
    {
      uint64_t v17 = [(DayNavigationWeekScrollView *)self _indexOfCellToScrollToForDateAndBuildIfNeeded:v9];
      if (v17 < 0
        || (int64_t v18 = v17, v17 >= (uint64_t)[(NSMutableArray *)self->_cells count])
        || ([(NSMutableArray *)self->_cells objectAtIndex:v18],
            (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        self->_isScrolling = 0;
        v26 = [(DayNavigationWeekScrollView *)self _weekStartForDate:v9];
        [(DayNavigationWeekScrollView *)self _createSubviewsWithFirstVisibleDate:v26];
        double v27 = *p_selectedDate;
        *p_selectedDate = 0;

        [(DayNavigationWeekScrollView *)self setSelectedDate:v9 animated:0];
        int v20 = 0;
        goto LABEL_21;
      }
      int v20 = (void *)v19;
      if (v18 < [(DayNavigationWeekScrollView *)self _firstVisibleIndex]
        || v18 > [(DayNavigationWeekScrollView *)self _lastVisibleIndex])
      {
        [v20 frame];
        [(DayNavigationWeekScrollView *)self _alignXToPage:CGRectGetMidX(v34)];
        self->_double targetX = v21;
        if (v4)
        {
          self->_isScrolling = 1;
          [(DayNavigationWeekScrollView *)self _setOffscreenCellsHidden:1 animated:1];
          springAnimationDuration();
          double v23 = v22;
          uint64_t v24 = +[SpringFactory sharedFactory];
          v28[5] = _NSConcreteStackBlock;
          v28[6] = 3221225472;
          v28[7] = sub_1000FC534;
          v28[8] = &unk_1001D2740;
          v28[9] = self;
          id v25 = dayViewScrollAnimationsPreferringFRR();
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_1000FC590;
          v28[3] = &unk_1001D27D8;
          v28[4] = self;
          +[UIView _animateWithDuration:393216 delay:v24 options:v25 factory:v28 animations:v23 completion:0.0];

          self->_needToHighlightCellAfterScrolling = 1;
          [(DayNavigationWeekScrollView *)self updateHighlightIfNeeded];
LABEL_26:
          self->_selectedIndedouble x = v18;
          [(DayNavigationWeekScrollView *)self updateMultiDayHighlightViewAnimated:1];
          if (!selectedDate) {
            goto LABEL_22;
          }
          v26 = +[UIImpactFeedbackGenerator feedbackGeneratorWithStyle:0 forView:v20];
          [v26 impactOccurred];
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
        -[DayNavigationWeekScrollView setContentOffset:](self, "setContentOffset:");
        [(DayNavigationWeekScrollView *)self _setOffscreenCellsHidden:1 animated:0];
      }
      [(DayNavigationWeekScrollView *)self _setCell:v20 highlight:1 animated:v4];
      [(DayNavigationWeekScrollView *)self _setOffscreenCellsHidden:1 animated:0];
      goto LABEL_26;
    }
  }
LABEL_23:
}

- (void)_setCell:(id)a3 highlight:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  [v7 setCircled:v6 animated:v5];
  [v7 setUserInteractionEnabled:v6 ^ 1];
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DayNavigationWeekScrollView;
  [(DayNavigationWeekScrollView *)&v14 setBackgroundColor:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v5 = self->_cells;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setBackgroundColor:v4 v10];
        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (int64_t)_indexForDate:(id)a3
{
  BOOL v5 = self->_calendar;
  id v6 = [(NSCalendar *)v5 components:30 fromDate:a3];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = self->_cells;
  uint64_t v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    unsigned __int8 v9 = v8;
    long long v10 = 0;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      long long v12 = 0;
      long long v13 = &v9[(void)v10];
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        objc_super v14 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v12) date:v22];
        uint64_t v15 = [(NSCalendar *)v5 components:30 fromDate:v14];

        id v16 = [v6 day];
        if (v16 == [v15 day])
        {
          id v17 = [v6 month];
          if (v17 == [v15 month])
          {
            id v18 = [v6 year];
            if (v18 == [v15 year])
            {
              id v19 = [v6 era];
              if (v19 == [v15 era])
              {

                int64_t v20 = (int64_t)&v12[(void)v10];
                goto LABEL_14;
              }
            }
          }
        }

        ++v12;
      }
      while (v9 != v12);
      unsigned __int8 v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      long long v10 = v13;
      if (v9) {
        continue;
      }
      break;
    }
  }
  int64_t v20 = -1;
LABEL_14:

  return v20;
}

- (void)_adjustContentOffsetIfNeeded
{
  [(DayNavigationWeekScrollView *)self contentSize];
  double v4 = v3 * 0.5;
  [(DayNavigationWeekScrollView *)self bounds];
  double v6 = v4 - v5 * 0.5;
  [(DayNavigationWeekScrollView *)self contentSize];
  double v8 = v7 * 0.25;
  [(DayNavigationWeekScrollView *)self contentOffset];
  if (v8 < vabdd_f64(v6, v9))
  {
    self->_recentering = 1;
    [(DayNavigationWeekScrollView *)self _alignXToPage:v6 - v9];
    -[DayNavigationWeekScrollView _offsetAllViews:](self, "_offsetAllViews:");
    [(DayNavigationWeekScrollView *)self _alignXToPage:v6 + v10];
    double v12 = v11;
    id v14 = [(NSMutableArray *)self->_cells objectAtIndex:0];
    [v14 frame];
    self->_double firstCellX = v13;
    -[DayNavigationWeekScrollView setContentOffset:](self, "setContentOffset:", v12, 0.0);
    self->_recentering = 0;
  }
}

- (void)setNavDelegate:(id)a3
{
}

- (void)didScroll
{
  self->_decelerationWasLastInput = 0;
}

- (void)cancelScrollingAnimation
{
  [(DayNavigationWeekScrollView *)self _removeAllAnimations:0];
  if (self->_isScrolling)
  {
    [(DayNavigationWeekScrollView *)self didFinishScrolling];
  }
}

- (int64_t)_lastVisibleIndex
{
  [(DayNavigationWeekScrollView *)self contentOffset];
  double v4 = v3;
  double firstCellX = self->_firstCellX;
  [(DayNavigationWeekScrollView *)self bounds];
  double cellWidth = self->_cellWidth;
  if (cellWidth != 0.0) {
    return vcvtmd_u64_f64((v4 - firstCellX + v6 + cellWidth * -0.5) / cellWidth);
  }
  double v9 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _lastVisibleIndex: _cellWidth was 0 in division.", v10, 2u);
  }
  return 0;
}

- (int64_t)_firstVisibleIndex
{
  [(DayNavigationWeekScrollView *)self contentOffset];
  double cellWidth = self->_cellWidth;
  if (cellWidth != 0.0) {
    return vcvtmd_u64_f64((v3 - self->_firstCellX + 0.5) / cellWidth);
  }
  double v6 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _firstVisibleIndex: _cellWidth was 0 in division.", v7, 2u);
  }
  return 0;
}

- (double)_alignXToPage:(double)a3
{
  CalRoundToScreenScale();
  double v5 = v4;
  double pageAlignment = self->_pageAlignment;
  if (pageAlignment != 0.0) {
    return pageAlignment * floor(v5 / pageAlignment);
  }
  double v7 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _alignXToPage: _pageAlignment was 0 in division.", v9, 2u);
  }
  return v5;
}

- (void)updateOverlays
{
  double v3 = [(DayNavigationWeekScrollView *)self superview];
  [v3 setNeedsLayout];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v4 = self->_cells;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) updateOverlay:v9];
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (int64_t)maxBufferViews
{
  return self->_maxBufferViews;
}

- (int64_t)_loadedBufferViewsRight
{
  id v3 = [(NSMutableArray *)self->_cells count];
  return (int64_t)v3
       + ~(unint64_t)[(DayNavigationWeekScrollView *)self _lastVisibleIndex];
}

- (NSDate)selectedDate
{
  return self->_selectedDate;
}

- (NSDate)startDateOfSelectedWeek
{
  return (NSDate *)[(DayNavigationWeekScrollView *)self _weekStartForDate:self->_selectedDate];
}

- (int64_t)cellsDisplayed
{
  return self->_weekLength;
}

- (DayNavigationViewCellFactory)cellFactory
{
  return self->_cellFactory;
}

- (void)setSelectedDateWithoutScrolling:(id)a3
{
  id v5 = a3;
  p_selectedDate = &self->_selectedDate;
  objc_storeStrong((id *)&self->_selectedDate, a3);
  uint64_t v7 = [(DayNavigationWeekScrollView *)self _indexOfCellToScrollToForDateAndBuildIfNeeded:v5];
  if (v7 < 0 || (int64_t v8 = v7, v7 >= (uint64_t)[(NSMutableArray *)self->_cells count]))
  {
    id v16 = [(DayNavigationWeekScrollView *)self _weekStartForDate:v5];
    [(DayNavigationWeekScrollView *)self _createSubviewsWithFirstVisibleDate:v16];
    id v17 = *p_selectedDate;
    *p_selectedDate = 0;

    [(DayNavigationWeekScrollView *)self setSelectedDate:v5 animated:0];
  }
  else
  {
    long long v9 = [(NSMutableArray *)self->_cells objectAtIndex:v8];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v10 = self->_cells;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v14);
          if (v15 != v9 || (objc_msgSend(v9, "circled", (void)v18) & 1) == 0) {
            -[DayNavigationWeekScrollView _setCell:highlight:animated:](self, "_setCell:highlight:animated:", v15, 0, 1, (void)v18);
          }
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [(DayNavigationWeekScrollView *)self _setCell:v9 highlight:1 animated:1];
    self->_selectedIndedouble x = v8;
  }
}

- (void)updateHighlightIfNeeded
{
  if (self->_needToHighlightCellAfterScrolling)
  {
    self->_needToHighlightCellAfterScrolling = 0;
    uint64_t v3 = [(DayNavigationWeekScrollView *)self _indexForDate:self->_selectedDate];
    if ((v3 & 0x8000000000000000) == 0)
    {
      uint64_t v4 = v3;
      if (v3 < (uint64_t)[(NSMutableArray *)self->_cells count])
      {
        uint64_t v5 = [(NSMutableArray *)self->_cells objectAtIndex:v4];
        if (v5)
        {
          id v6 = (id)v5;
          [(DayNavigationWeekScrollView *)self _setCell:v5 highlight:1 animated:1];
        }
      }
    }
  }
}

- (void)pulseToday
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_cells;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isToday", (void)v8))
        {
          [v7 pulseToday];
          goto LABEL_11;
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
  id v5 = a3;
  todadouble y = self->_today;
  self->_todadouble y = 0;

  id v7 = [(DayNavigationWeekScrollView *)self _weekStartForDate:self->_selectedDate];

  [(DayNavigationWeekScrollView *)self _createSubviewsWithFirstVisibleDate:v7];
}

- (void)setFirstVisibleDate:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_cells;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) removeFromSuperview];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  cells = self->_cells;
  self->_cells = 0;

  [(DayNavigationWeekScrollView *)self _createSubviewsWithFirstVisibleDate:v4];
}

- (void)setToSelectedDateAtLocation:(CGPoint)a3
{
  uint64_t v4 = -[DayNavigationWeekScrollView _cellIndexForX:](self, "_cellIndexForX:", a3.x, a3.y);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = v4;
    if (v4 < (uint64_t)[(NSMutableArray *)self->_cells count])
    {
      id v7 = [(NSMutableArray *)self->_cells objectAtIndex:v5];
      id v6 = [v7 date];
      [(DayNavigationWeekScrollView *)self setSelectedDate:v6 animated:1];
    }
  }
}

- (BOOL)canAnimateToDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DayNavigationWeekScrollView *)self _firstVisibleIndex];
  uint64_t v6 = [(DayNavigationWeekScrollView *)self _lastVisibleIndex];
  if (v5 < 0 || v5 >= (uint64_t)[(NSMutableArray *)self->_cells count])
  {
    id v7 = 0;
    if (v6 < 0)
    {
LABEL_8:
      uint64_t v8 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    id v7 = [(NSMutableArray *)self->_cells objectAtIndex:v5];
    if (v6 < 0) {
      goto LABEL_8;
    }
  }
  if (v6 >= (uint64_t)[(NSMutableArray *)self->_cells count]) {
    goto LABEL_8;
  }
  uint64_t v8 = [(NSMutableArray *)self->_cells objectAtIndex:v6];
LABEL_9:
  long long v9 = [v7 date];
  uint64_t v10 = [v8 date];
  long long v11 = (void *)v10;
  if (!v9 || v10)
  {
    if (v9 || !v10) {
      goto LABEL_16;
    }
    id v12 = objc_alloc_init((Class)NSDateComponents);
    [v12 setDay:1 - self->_weekLength];
    long long v9 = [(NSCalendar *)self->_calendar dateByAddingComponents:v12 toDate:v11 options:0];
  }
  else
  {
    id v12 = objc_alloc_init((Class)NSDateComponents);
    [v12 setDay:self->_weekLength - 1];
    long long v11 = [(NSCalendar *)self->_calendar dateByAddingComponents:v12 toDate:v9 options:0];
  }

LABEL_16:
  BOOL v17 = 0;
  if (v9 && v11)
  {
    if ([v9 compare:v4] != (id)1 && objc_msgSend(v11, "compare:", v4) != (id)-1
      || ([v4 compare:v9] == (id)-1 ? (id v13 = v4, v14 = v9) : (id v13 = v11, v14 = v4),
          -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v13, v14, 0), uint64_t v15 = objc_claimAutoreleasedReturnValue(), v16 = [v15 day], v15, (uint64_t)v16 <= self->_weekLength))
    {
      BOOL v17 = 1;
    }
  }

  return v17;
}

- (void)significantTimeChangeOccurred
{
  id v3 = CUIKTodayDate();
  id v4 = self->_calendar;
  uint64_t v5 = [(NSCalendar *)v4 components:30 fromDate:v3];
  uint64_t v6 = [(NSCalendar *)v4 dateFromComponents:v5];

  p_todadouble y = &self->_today;
  if (self->_today != v6)
  {
    objc_storeStrong((id *)&self->_today, v6);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = self->_cells;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v14 = [v13 date];
          [v13 setIsToday:[v14 isEqualToDate:*p_today]];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)contentSizeCategoryChanged
{
  id v3 = [(DayNavigationWeekScrollView *)self _weekStartForDate:self->_selectedDate];
  [(DayNavigationWeekScrollView *)self _createSubviewsWithFirstVisibleDate:v3];
}

- (BOOL)showsMultiDay
{
  return self->_showsMultiDay;
}

- (id)selectedDateAfterScrollingToPoint:(CGPoint)a3
{
  double x = a3.x;
  double weekLength = (double)self->_weekLength;
  [(DayNavigationWeekScrollView *)self cellSize];
  double v7 = v6 * weekLength;
  selectedIndedouble x = self->_selectedIndex;
  if (selectedIndex < 0 || selectedIndex >= (uint64_t)[(NSMutableArray *)self->_cells count])
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [(NSMutableArray *)self->_cells objectAtIndexedSubscript:self->_selectedIndex];
  }
  [v9 frame];
  double v11 = v10;
  [v9 bounds];
  [(DayNavigationWeekScrollView *)self _alignXToPage:v11 + CGRectGetWidth(v25) * 0.5];
  double v13 = v7 + v12 + -0.0001;
  if (x >= v12 + -0.0001 && x < v13)
  {
    long long v21 = self->_selectedDate;
  }
  else
  {
    if (x >= v13) {
      double v12 = v7 + v12;
    }
    double v15 = x - v12;
    if (v15 < 0.0) {
      double v15 = -v15;
    }
    unint64_t v16 = llround(v15 / v7);
    if (x < v13) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = v16 + 1;
    }
    int IsLeftToRight = CalTimeDirectionIsLeftToRight();
    uint64_t v19 = 1;
    if (!IsLeftToRight) {
      uint64_t v19 = -1;
    }
    uint64_t v20 = -1;
    if (!IsLeftToRight) {
      uint64_t v20 = 1;
    }
    if (x < v13) {
      uint64_t v19 = v20;
    }
    long long v21 = [(NSCalendar *)self->_calendar dateByAddingUnit:0x2000 value:v17 * v19 toDate:self->_selectedDate options:0];
  }
  long long v22 = v21;

  return v22;
}

- (int64_t)_cellIndexForX:(double)a3
{
  double cellWidth = self->_cellWidth;
  if (cellWidth != 0.0) {
    return vcvtmd_s64_f64((a3 - self->_firstCellX) / cellWidth);
  }
  uint64_t v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _cellIndexForX: _cellWidth was 0 in division.", v6, 2u);
  }
  return 0;
}

- (void)sizeToFit
{
  [(DayNavigationWeekScrollView *)self _updateCellWidthIfNeeded];
  double cellWidth = self->_cellWidth;
  self->_double pageAlignment = cellWidth * (double)((2 * [(DayNavigationWeekScrollView *)self sideViews]) | 1);
  [(DayNavigationWeekScrollView *)self bounds];

  -[DayNavigationWeekScrollView setBounds:](self, "setBounds:");
}

- (void)setEventSpringLoadingEnabled:(BOOL)a3
{
  if (self->_eventSpringLoadingEnabled != a3)
  {
    self->_eventSpringLoadingEnabled = a3;
    id v5 = [(NSMutableArray *)self->_cells objectAtIndexedSubscript:[(DayNavigationWeekScrollView *)self _firstVisibleIndex]];
    id v4 = [v5 date];
    [(DayNavigationWeekScrollView *)self _createSubviewsWithFirstVisibleDate:v4];
  }
}

- (int64_t)firstVisibleDayOffsetFromSelectedDay
{
  id v3 = [(DayNavigationWeekScrollView *)self selectedDate];
  int64_t v4 = [(DayNavigationWeekScrollView *)self _indexForDate:v3];

  return [(DayNavigationWeekScrollView *)self _firstVisibleIndexInView] - v4;
}

- (id)visibleCellDayTypes
{
  id v3 = +[NSMutableArray array];
  int64_t v4 = [(DayNavigationWeekScrollView *)self _firstVisibleIndex];
  if (v4 <= [(DayNavigationWeekScrollView *)self _lastVisibleIndex])
  {
    do
    {
      id v5 = [(NSMutableArray *)self->_cells objectAtIndexedSubscript:v4];
      double v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 badgeType]);
      [v3 addObject:v6];
    }
    while (v4++ < [(DayNavigationWeekScrollView *)self _lastVisibleIndex]);
  }

  return v3;
}

- (id)visibleCellBadgeColors
{
  id v3 = +[NSMutableArray array];
  int64_t v4 = [(DayNavigationWeekScrollView *)self _firstVisibleIndex];
  if (v4 <= [(DayNavigationWeekScrollView *)self _lastVisibleIndex])
  {
    do
    {
      id v5 = [(NSMutableArray *)self->_cells objectAtIndexedSubscript:v4];
      double v6 = [v5 badgeColor];
      if (v6) {
        [v5 badgeColor];
      }
      else {
      double v7 = +[UIColor clearColor];
      }
      [v3 addObject:v7];
    }
    while (v4++ < [(DayNavigationWeekScrollView *)self _lastVisibleIndex]);
  }

  return v3;
}

- (id)visibleCellBadgeLocales
{
  id v3 = +[NSLocale currentLocale];
  int64_t v4 = [v3 localeIdentifier];

  id v5 = +[NSMutableArray array];
  int64_t v6 = [(DayNavigationWeekScrollView *)self _firstVisibleIndex];
  if (v6 <= [(DayNavigationWeekScrollView *)self _lastVisibleIndex])
  {
    do
    {
      double v7 = [(NSMutableArray *)self->_cells objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 badgeLocale];
      if (v8)
      {
        id v9 = [v7 badgeLocale];
        [v5 addObject:v9];
      }
      else
      {
        [v5 addObject:v4];
      }
    }
    while (v6++ < [(DayNavigationWeekScrollView *)self _lastVisibleIndex]);
  }

  return v5;
}

- (void)willTransitionToSize
{
  self->_rotatedDuringAnimation = 1;
}

- (void)_didFinishDecelerating
{
  if (self->_decelerationWasLastInput || self->_rotatedDuringAnimation) {
    [(DayNavigationWeekScrollView *)self didFinishScrolling];
  }
}

- (void)willBeginDragging
{
  self->_isScrolling = 1;
  [(DayNavigationWeekScrollView *)self _setOffscreenCellsHidden:0 animated:1];
}

- (void)willEndDraggingTargetX:(double)a3
{
  self->_double targetX = a3;
  [(DayNavigationWeekScrollView *)self _setOffscreenCellsHidden:1 animated:1];
}

- (void)didFinishScrolling
{
  self->_isScrolling = 0;
  [(DayNavigationWeekScrollView *)self _adjustContentOffsetIfNeeded];
  int64_t weekLength = self->_weekLength;
  if (weekLength >= 1)
  {
    selectedIndedouble x = self->_selectedIndex;
    uint64_t v5 = selectedIndex + weekLength;
    int64_t v6 = selectedIndex - weekLength;
    do
    {
      uint64_t v7 = v5;
      int64_t v8 = [(DayNavigationWeekScrollView *)self _firstVisibleIndex];
      uint64_t v5 = v7 + weekLength;
      v6 += weekLength;
    }
    while (v6 < v8);
    do
      v7 -= weekLength;
    while (v7 > [(DayNavigationWeekScrollView *)self _lastVisibleIndex]);
    if ((v7 & 0x8000000000000000) == 0
      && self->_selectedIndex != v7
      && v7 < (uint64_t)[(NSMutableArray *)self->_cells count])
    {
      id v9 = [(NSMutableArray *)self->_cells objectAtIndex:v7];
      double v10 = [v9 date];
      [(DayNavigationWeekScrollView *)self setSelectedDate:v10 animated:1];

      double v11 = [(DayNavigationWeekScrollView *)self navDelegate];

      if (v11)
      {
        double v12 = [(DayNavigationWeekScrollView *)self navDelegate];
        double v13 = [v9 date];
        [v12 dayNavigationWeekScrollView:self selectedDateChanged:v13];
      }
    }
    [(DayNavigationWeekScrollView *)self _setOffscreenCellsHidden:1 animated:1];
  }
}

- (void)_addNewCellToSide:(BOOL)a3
{
  BOOL v3 = a3;
  cells = self->_cells;
  if (a3)
  {
    id v38 = [(NSMutableArray *)cells objectAtIndex:0];
    [v38 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v38 frame];
    double v15 = v7 - v14;
    uint64_t v16 = [(DayNavigationWeekScrollView *)self _loadedBufferViewsRight];
    unint64_t v17 = (char *)[(NSMutableArray *)self->_cells count] - 1;
  }
  else
  {
    id v38 = [(NSMutableArray *)cells lastObject];
    [v38 frame];
    double v19 = v18;
    double v9 = v20;
    double v11 = v21;
    double v13 = v22;
    [v38 frame];
    double v15 = v19 + v23;
    uint64_t v16 = [(DayNavigationWeekScrollView *)self _loadedBufferViewsLeft];
    unint64_t v17 = 0;
  }
  id v24 = objc_alloc_init((Class)NSDateComponents);
  CGRect v25 = [v38 date];
  [v24 setHour:4];
  v26 = [(NSCalendar *)self->_calendar dateByAddingComponents:v24 toDate:v25 options:0];

  BOOL v37 = v3;
  if (!CalTimeDirectionIsLeftToRight() || v3)
  {
    if ((v3 & ~CalTimeDirectionIsLeftToRight()) != 0) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = -1;
    }
  }
  else
  {
    uint64_t v27 = 1;
  }
  double v28 = [(NSCalendar *)self->_calendar timeZone];
  long long v29 = +[EKCalendarDate calendarDateWithDate:v26 timeZone:v28];

  long long v30 = [v29 calendarDateByAddingDays:v27];

  long long v31 = [v30 calendarDateForDay];

  long long v32 = [v31 date];
  if (v16 < [(DayNavigationWeekScrollView *)self maxBufferViews]
    || (char *)self->_selectedIndex == v17)
  {
    double v33 = -[DayNavigationViewCellFactory createCellWithFrame:](self->_cellFactory, "createCellWithFrame:", v15, v9, v11, v13);
    CGRect v34 = [(DayNavigationWeekScrollView *)self backgroundColor];
    [v33 setBackgroundColor:v34];

    [v33 setDelegate:self];
    [(DayNavigationWeekScrollView *)self addSubview:v33];
  }
  else
  {
    double v33 = [(NSMutableArray *)self->_cells objectAtIndex:v17];
    [(NSMutableArray *)self->_cells removeObjectAtIndex:v17];
    [v33 prepareForReuse];
    [v33 setFrame:v15, v9, v11, v13];
    selectedIndedouble x = self->_selectedIndex;
    if (selectedIndex > (uint64_t)v17) {
      self->_selectedIndedouble x = selectedIndex - 1;
    }
  }
  [(DayNavigationWeekScrollView *)self _setCell:v33 toDate:v32];
  double v35 = self->_cells;
  if (v37)
  {
    [(NSMutableArray *)v35 insertObject:v33 atIndex:0];
    ++self->_selectedIndex;
  }
  else
  {
    [(NSMutableArray *)v35 addObject:v33];
  }
}

- (void)setToday:(id)a3
{
  uint64_t v5 = self->_calendar;
  double v6 = [(NSCalendar *)v5 components:30 fromDate:a3];
  double v7 = [(NSCalendar *)v5 dateFromComponents:v6];
  todadouble y = self->_today;
  self->_todadouble y = v7;
  double v9 = v7;
}

- (double)_offsetAllViews:(double)a3
{
  double cellWidth = self->_cellWidth;
  if (cellWidth == 0.0)
  {
    double v7 = kCalUILogHandle;
    double v6 = 0.0;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _offsetAllViews: _cellWidth was 0 in division.", buf, 2u);
    }
  }
  else
  {
    double v6 = cellWidth * round(a3 / cellWidth);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v8 = self->_cells;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v13 frame:v16];
        [v13 setFrame:v6 + v14];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }

  return v6 - a3;
}

- (int64_t)_firstVisibleIndexInView
{
  double cellWidth = self->_cellWidth;
  if (cellWidth <= 0.0)
  {
    double v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _firstVisibleIndexInView: _cellWidth was 0 in division.", v10, 2u);
    }
    return 0;
  }
  double v4 = cellWidth + self->_firstCellX + -0.5;
  [(DayNavigationWeekScrollView *)self contentOffset];
  if (v4 >= v5) {
    return 0;
  }
  int64_t v6 = 0;
  do
  {
    double v4 = v4 + self->_cellWidth;
    ++v6;
    [(DayNavigationWeekScrollView *)self contentOffset];
  }
  while (v4 < v7);
  return v6;
}

- (void)dayNavigationCellTouchUpOccurred:(id)a3
{
  id v4 = a3;
  double v5 = [(DayNavigationWeekScrollView *)self navDelegate];

  if (v5)
  {
    int64_t v6 = [(DayNavigationWeekScrollView *)self navDelegate];
    unsigned int v7 = [v6 dayNavigationWeekScrollViewAllowedToChangeSelectedDate];

    if (v7)
    {
      double v8 = [v4 date];
      [(DayNavigationWeekScrollView *)self setSelectedDate:v8 animated:1];

      CalAnalyticsSendEventLazy();
      id v9 = [(DayNavigationWeekScrollView *)self navDelegate];
      id v10 = [v4 date];
      [v9 dayNavigationWeekScrollView:self selectedDateChanged:v10];
    }
    else
    {
      uint64_t v11 = [(DayNavigationWeekScrollView *)self navDelegate];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000FE15C;
      v12[3] = &unk_1001D28A8;
      v12[4] = self;
      id v13 = v4;
      [v11 dayNavigationWeekScrollViewFailedToSelectDate:v12];
    }
  }
}

- (BOOL)dayNavigationCellShouldEnableSpringLoading
{
  return [(DayNavigationWeekScrollView *)self eventSpringLoadingEnabled];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DayNavigationWeekScrollView *)self navDelegate];
  if (v5
    && (int64_t v6 = (void *)v5,
        [(DayNavigationWeekScrollView *)self navDelegate],
        unsigned int v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 dayNavigationWeekScrollViewAllowedToChangeSelectedDate],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    id v10 = [(DayNavigationWeekScrollView *)self navDelegate];
    [v10 dayNavigationWeekScrollViewFailedToSelectDate:0];

    BOOL v9 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DayNavigationWeekScrollView;
    if ([(DayNavigationWeekScrollView *)&v13 respondsToSelector:"gestureRecognizerShouldBegin:"])
    {
      v12.receiver = self;
      v12.super_class = (Class)DayNavigationWeekScrollView;
      BOOL v9 = [(DayNavigationWeekScrollView *)&v12 gestureRecognizerShouldBegin:v4];
    }
    else
    {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (BOOL)eventSpringLoadingEnabled
{
  return self->_eventSpringLoadingEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navDelegate);
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_multiDayHighlightView, 0);
  objc_storeStrong((id *)&self->_cells, 0);

  objc_storeStrong((id *)&self->_cellFactory, 0);
}

@end