@interface WeekGroupView
- (BOOL)asyncLoading;
- (BOOL)containsDate:(id)a3;
- (BOOL)isInUse;
- (BOOL)isMultiDayView;
- (BOOL)scrollerIsParentOfView:(id)a3 isAllDay:(BOOL)a4;
- (BOOL)showsTimeMarker;
- (BOOL)weekViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4;
- (CGPoint)pointAtDate:(id)a3 isAllDay:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSCalendar)calendar;
- (NSDate)lastSecondOfWeek;
- (NSDateComponents)highlightedDateComponents;
- (NSDateComponents)weekStartDate;
- (NSString)description;
- (NSTimeZone)timeZone;
- (WeekGroupView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6 isMultiDayView:(BOOL)a7;
- (WeekGroupViewDelegate)delegate;
- (WeekView)weekView;
- (double)gutterWidth;
- (id)_castedDayOccurrenceViewFromGenericView:(id)a3;
- (id)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4 requireAllDayRegionInsistence:(BOOL)a5;
- (id)dateForXOffset:(double)a3;
- (id)highlightedCalendarDateComponents;
- (id)occurrenceViewAtPoint:(CGPoint)a3;
- (id)occurrenceViewAtPoint:(CGPoint)a3 ignoreSelectedCopyView:(BOOL)a4;
- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4;
- (id)presentationControllerForEditMenu;
- (id)selectedEventsForEditMenu;
- (id)weekViewForWeekAfter:(id)a3;
- (id)weekViewForWeekBefore:(id)a3;
- (int64_t)_secondAtPosition:(double)a3;
- (int64_t)week;
- (void)addViewToScroller:(id)a3 isAllDay:(BOOL)a4;
- (void)adjustForVisibleRect:(CGRect)a3;
- (void)emptySpaceClick;
- (void)emptySpaceClickedOnDate:(id)a3;
- (void)layoutSubviews;
- (void)loadDataAsyncWithCompletion:(id)a3 reverse:(BOOL)a4;
- (void)reloadData;
- (void)setAsyncLoading:(BOOL)a3;
- (void)setCalendar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightedDateComponents:(id)a3;
- (void)setHourHeightScale:(double)a3;
- (void)setIsInUse:(BOOL)a3;
- (void)setIsMultiDayView:(BOOL)a3;
- (void)setShowsTimeMarker:(BOOL)a3;
- (void)setTimeZone:(id)a3;
- (void)setWeek:(int64_t)a3;
- (void)setWeekStartDate:(id)a3;
- (void)shouldAnnotateAppEntitiesChanged;
- (void)showOverlayMonthInCellAtOffset:(double)a3 animated:(BOOL)a4;
- (void)weekView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5 dateSelected:(id)a6;
- (void)weekView:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5;
- (void)weekView:(id)a3 receivedTapInAllDayAreaOnDate:(id)a4;
- (void)weekViewAllDaySectionDidScroll:(id)a3;
- (void)weekViewDidBeginDragging:(id)a3;
- (void)weekViewDidEndDecelerating:(id)a3;
- (void)weekViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)weekViewDidLayout:(id)a3;
- (void)weekViewDidScroll:(id)a3;
- (void)weekViewFirstVisibleSecondChanged:(int64_t)a3;
- (void)weekViewOccurrenceLayoutDidChange:(id)a3;
@end

@implementation WeekGroupView

- (WeekGroupView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6 isMultiDayView:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a5;
  id v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)WeekGroupView;
  v17 = -[WeekGroupView initWithFrame:](&v28, "initWithFrame:", x, y, width, height);
  v18 = v17;
  if (v17)
  {
    v17->_isMultiDayView = v7;
    if (v7)
    {
      v19 = off_1001D1C70;
      v20 = -[MultiDayWeekView initWithFrame:sizeClass:targetWindow:rightClickDelegate:]([MultiDayWeekView alloc], "initWithFrame:sizeClass:targetWindow:rightClickDelegate:", a4, v15, v16, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      weekView = v18->_weekView;
      v18->_weekView = &v20->super;
    }
    else
    {
      v19 = off_1001D20D0;
      v22 = -[WeekView initWithFrame:sizeClass:targetWindow:rightClickDelegate:]([WeekView alloc], "initWithFrame:sizeClass:targetWindow:rightClickDelegate:", a4, v15, v16, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v23 = v18->_weekView;
      v18->_weekView = v22;

      [(WeekView *)v18->_weekView setAccessibilityIdentifier:@"weekView"];
    }
    [(WeekView *)v18->_weekView setDelegate:v18];
    [(WeekView *)v18->_weekView setAutoresizingMask:16];
    [(WeekGroupView *)v18 addSubview:v18->_weekView];
    v24 = (UIView *)objc_alloc_init((Class)UIView);
    gutterView = v18->_gutterView;
    v18->_gutterView = v24;

    v26 = [(__objc2_class *)*v19 weekSeparatorColor];
    [(UIView *)v18->_gutterView setBackgroundColor:v26];

    [(UIView *)v18->_gutterView setAutoresizingMask:16];
    [(WeekGroupView *)v18 addSubview:v18->_gutterView];
    [(WeekGroupView *)v18 setAutoresizingMask:16];
  }

  return v18;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  [(WeekGroupView *)self frame];
  v4 = NSStringFromRect(v14);
  v5 = [(WeekGroupView *)self weekStartDate];
  v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 month]);
  BOOL v7 = [(WeekGroupView *)self weekStartDate];
  v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 day]);
  v9 = [(WeekGroupView *)self weekStartDate];
  v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 year]);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; frame = %@, weekStartDate = (%@ / %@ / %@)>",
    v3,
    self,
    v4,
    v6,
    v8,
  v11 = v10);

  return (NSString *)v11;
}

- (void)layoutSubviews
{
  [(WeekGroupView *)self frame];
  double v4 = v3;
  -[WeekView sizeThatFits:](self->_weekView, "sizeThatFits:", v5, v3);
  -[WeekView setFrame:](self->_weekView, "setFrame:", 0.0, 0.0, v6, v4);
  EKUISeparatorLineThickness();
  double v8 = v7;
  [(WeekView *)self->_weekView frame];
  gutterView = self->_gutterView;

  -[UIView setFrame:](gutterView, "setFrame:", v9, 0.0, v8, v4);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(WeekGroupView *)self frame];
  double v9 = vabdd_f64(width, v8);
  v10.receiver = self;
  v10.super_class = (Class)WeekGroupView;
  -[WeekGroupView setFrame:](&v10, "setFrame:", x, y, width, height);
  if (v9 >= 2.22044605e-16) {
    [(WeekView *)self->_weekView updateDayWidth];
  }
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  if (self->_showsTimeMarker != a3)
  {
    self->_showsTimeMarker = a3;
    -[WeekView setShowsTimeMarker:](self->_weekView, "setShowsTimeMarker:");
  }
}

- (void)showOverlayMonthInCellAtOffset:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(WeekView *)self->_weekView frame];
  double v7 = a3 - CGRectGetMinX(v10);
  weekView = self->_weekView;

  [(WeekView *)weekView showOverlayMonthInCellAtOffset:v4 animated:v7];
}

- (double)gutterWidth
{
  [(UIView *)self->_gutterView frame];
  return v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  [(WeekView *)self->_weekView frame];
  double v6 = v5;
  [(UIView *)self->_gutterView frame];
  double v8 = v6 + v7;
  double v9 = height;
  result.CGFloat height = v9;
  result.double width = v8;
  return result;
}

- (void)adjustForVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(WeekView *)self->_weekView frame];
  double v9 = width - v8;
  weekView = self->_weekView;
  if (v9 >= 0.0) {
    double v11 = v9;
  }
  else {
    double v11 = 0.0;
  }

  -[WeekView adjustForVisibleRect:](weekView, "adjustForVisibleRect:", x, y, v11, height);
}

- (void)weekViewDidBeginDragging:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekGroupDidBeginDragging:self];
  }
}

- (void)weekViewDidScroll:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekGroupDidScroll:self];
  }
}

- (void)weekViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 weekGroupDidEndDragging:self willDecelerate:v4];
  }
}

- (void)weekViewDidEndDecelerating:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekGroupDidEndDecelerating:self];
  }
}

- (void)weekViewAllDaySectionDidScroll:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekGroupAllDaySectionDidScroll:self];
  }
}

- (void)weekView:(id)a3 receivedTapInAllDayAreaOnDate:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 weekGroup:self didReceiveTapForDate:v8];
  }
}

- (id)weekViewForWeekBefore:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && (id v7 = objc_loadWeakRetained((id *)p_delegate),
        [v7 weekGroupForWeekBefore:self],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    id v9 = [v8 weekView];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)weekViewForWeekAfter:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && (id v7 = objc_loadWeakRetained((id *)p_delegate),
        [v7 weekGroupForWeekAfter:self],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    id v9 = [v8 weekView];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)presentationControllerForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = [WeakRetained presentationControllerForEditMenu];

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = [WeakRetained selectedEventsForEditMenu];

  return v3;
}

- (void)setWeekStartDate:(id)a3
{
}

- (NSDateComponents)weekStartDate
{
  return [(WeekView *)self->_weekView weekStartDate];
}

- (NSDate)lastSecondOfWeek
{
  return [(WeekView *)self->_weekView lastSecondOfWeek];
}

- (void)setHighlightedDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedDateComponents, a3);
  id v5 = a3;
  [(WeekView *)self->_weekView setHighlightedDateComponents:v5];
}

- (id)highlightedCalendarDateComponents
{
  return [(WeekView *)self->_weekView highlightedDateComponents];
}

- (void)setCalendar:(id)a3
{
}

- (NSCalendar)calendar
{
  return [(WeekView *)self->_weekView calendar];
}

- (void)setTimeZone:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return [(WeekView *)self->_weekView timeZone];
}

- (void)reloadData
{
}

- (void)loadDataAsyncWithCompletion:(id)a3 reverse:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  weekView = self->_weekView;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007EFF4;
  v9[3] = &unk_1001D2808;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(WeekView *)weekView loadDataAsyncWithCompletion:v9 reverse:v4];
}

- (void)weekView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5 dateSelected:(id)a6
{
  BOOL v7 = a5;
  id v13 = a4;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 weekGroup:self didSelectEvent:v13 userInitiated:v7 dateSelected:v9];
  }
}

- (void)weekView:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 weekGroup:self didSelectEvents:v10 userInitiated:v5];
  }
}

- (void)shouldAnnotateAppEntitiesChanged
{
}

- (BOOL)weekViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v9 = [v8 weekGroupViewShouldAnnotateAppEntities:self onDayStarting:v5];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (int64_t)_secondAtPosition:(double)a3
{
  BOOL v4 = [(WeekView *)self->_weekView content];
  id v5 = [v4 grid];
  int v6 = [v5 secondAtPosition:a3];

  if (v6 >= 86399) {
    int v7 = 86399;
  }
  else {
    int v7 = v6;
  }
  return v7 & ~(v7 >> 31);
}

- (id)dateForXOffset:(double)a3
{
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  double MinX = 0.0;
  if (IsLeftToRight)
  {
    [(WeekView *)self->_weekView frame];
    double MinX = CGRectGetMinX(v11);
  }
  double v7 = a3 - MinX;
  weekView = self->_weekView;

  return [(WeekView *)weekView dateForXOffset:v7];
}

- (id)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4 requireAllDayRegionInsistence:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  unsigned __int8 v9 = [(WeekGroupView *)self dateForXOffset:a3.x];
  id v10 = [(WeekView *)self->_weekView calendar];
  CGRect v11 = [v10 timeZone];
  id v12 = +[EKCalendarDate calendarDateWithDateComponents:v9 timeZone:v11];

  id v13 = [(WeekView *)self->_weekView scrollView];
  [v13 frame];
  double v15 = y - v14;

  id v16 = [(WeekView *)self->_weekView allDayView];
  [v16 frame];
  double v18 = v17 + (double)v5 * -10.0;

  if (y < v18
    || ([(WeekView *)self->_weekView scrollView],
        v19 = objc_claimAutoreleasedReturnValue(),
        [v19 frame],
        double v21 = v20,
        v19,
        v15 <= v21))
  {
    v23 = [(WeekView *)self->_weekView scrollView];
    [v23 contentOffset];
    int64_t v22 = [(WeekGroupView *)self _secondAtPosition:fmax(v15, 0.0) + v24];
  }
  else
  {
    int64_t v22 = 86399;
  }
  v25 = [v12 calendarDateByComponentwiseAddingSeconds:v22];
  if (a4) {
    *a4 = y < v18;
  }

  return v25;
}

- (BOOL)containsDate:(id)a3
{
  return [(WeekView *)self->_weekView containsDate:a3];
}

- (CGPoint)pointAtDate:(id)a3 isAllDay:(BOOL)a4
{
  [(WeekView *)self->_weekView pointAtDate:a3 isAllDay:a4];
  weekView = self->_weekView;

  -[WeekView convertPoint:toView:](weekView, "convertPoint:toView:", self);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (void)addViewToScroller:(id)a3 isAllDay:(BOOL)a4
{
}

- (BOOL)scrollerIsParentOfView:(id)a3 isAllDay:(BOOL)a4
{
  return [(WeekView *)self->_weekView scrollerIsParentOfView:a3 isAllDay:a4];
}

- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4
{
  return [(WeekView *)self->_weekView occurrenceViewForEvent:a3 occurrenceDate:a4];
}

- (id)occurrenceViewAtPoint:(CGPoint)a3
{
  return -[WeekGroupView occurrenceViewAtPoint:ignoreSelectedCopyView:](self, "occurrenceViewAtPoint:ignoreSelectedCopyView:", 0, a3.x, a3.y);
}

- (id)occurrenceViewAtPoint:(CGPoint)a3 ignoreSelectedCopyView:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = -[WeekGroupView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  double v18 = sub_10007F6D4;
  v19 = sub_10007F6E4;
  id v20 = [(WeekGroupView *)self _castedDayOccurrenceViewFromGenericView:v8];
  if (v4 && [(id)v16[5] isSelectedCopyView])
  {
    unsigned __int8 v9 = [(id)v16[5] superview];
    id v10 = (void *)v16[5];
    v16[5] = 0;

    CGRect v11 = [v9 subviews];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007F6EC;
    v14[3] = &unk_1001D3880;
    *(CGFloat *)&v14[6] = x;
    *(CGFloat *)&v14[7] = y;
    v14[4] = self;
    v14[5] = &v15;
    [v11 enumerateObjectsWithOptions:2 usingBlock:v14];

    id v12 = (id)v16[5];
  }
  else
  {
    id v12 = (id)v16[5];
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (id)_castedDayOccurrenceViewFromGenericView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    BOOL v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 occurrenceView];
    goto LABEL_5;
  }
  BOOL v5 = 0;
LABEL_7:

  return v5;
}

- (void)setHourHeightScale:(double)a3
{
}

- (void)emptySpaceClick
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 emptySpaceClick];
  }
}

- (void)emptySpaceClickedOnDate:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 emptySpaceClickedOnDate:v8];
  }
}

- (void)weekViewDidLayout:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekGroupViewDidLayout:self];
  }
}

- (void)weekViewOccurrenceLayoutDidChange:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekGroupViewOccurrenceLayoutDidChange:self];
  }
}

- (void)weekViewFirstVisibleSecondChanged:(int64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekGroupViewFirstVisibleSecondChanged:a3];
  }
}

- (BOOL)isMultiDayView
{
  return self->_isMultiDayView;
}

- (void)setIsMultiDayView:(BOOL)a3
{
  self->_isMultiDayView = a3;
}

- (WeekGroupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WeekGroupViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WeekView)weekView
{
  return self->_weekView;
}

- (BOOL)showsTimeMarker
{
  return self->_showsTimeMarker;
}

- (int64_t)week
{
  return self->_week;
}

- (void)setWeek:(int64_t)a3
{
  self->_week = a3;
}

- (NSDateComponents)highlightedDateComponents
{
  return self->_highlightedDateComponents;
}

- (BOOL)asyncLoading
{
  return self->_asyncLoading;
}

- (void)setAsyncLoading:(BOOL)a3
{
  self->_asyncLoading = a3;
}

- (BOOL)isInUse
{
  return self->_isInUse;
}

- (void)setIsInUse:(BOOL)a3
{
  self->_isInUse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedDateComponents, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gutterView, 0);

  objc_storeStrong((id *)&self->_weekView, 0);
}

@end