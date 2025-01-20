@interface YearMultipleMonthView
+ (BOOL)_headerEligibleForCalendarDate:(id)a3;
+ (BOOL)useUIKitLayoutMargins;
+ (Class)headerClass;
+ (Class)monthClass;
+ (double)_heightForViewWithVisibleHeader:(BOOL)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5 orientation:(int64_t)a6;
+ (double)heightForViewWithCalendarDate:(id)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5 orientation:(int64_t)a6;
+ (double)leftMarginForWindowSize:(CGSize)a3;
+ (double)rightMarginForWindowSize:(CGSize)a3;
+ (double)topInset;
- (BOOL)containsLastMonthOfYear;
- (BOOL)eligibleToShowYearNumber;
- (BOOL)pointIsAboveMonthNameBaseline:(CGPoint)a3;
- (CGRect)insetBounds;
- (CGSize)monthViewSubviewSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKCalendarDate)calendarDate;
- (EKCalendarDate)endCalendarDate;
- (EKUIOverlayCalendarSignificantDatesProvider)overlaySignificantDatesProvider;
- (UIEdgeInsets)_yearLayoutMargins;
- (double)_leftMarginWithOriginalValue:(double)a3;
- (double)_rightMarginWithOriginalValue:(double)a3;
- (double)leftMarginAdjustment;
- (double)rightMarginAdjustment;
- (double)topInset;
- (id)description;
- (id)initCalendarDate:(id)a3 calendar:(id)a4 maximumNumberOfMonths:(unint64_t)a5;
- (id)monthViewForCalendarDate:(id)a3;
- (id)startOfMonthForPoint:(CGPoint)a3;
- (unint64_t)maximumNumberOfMonths;
- (void)_initializeHeaderView;
- (void)_initializeMonthViews;
- (void)_reloadHeaderView;
- (void)_reloadMonthViews;
- (void)didMoveToWindow;
- (void)hideYearNumberAnimated:(BOOL)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)localeChanged;
- (void)overlaySignificantDatesChangedInRange:(id)a3;
- (void)pulseTodayCircle;
- (void)setCalendarDate:(id)a3;
- (void)setEndCalendarDate:(id)a3;
- (void)setOverlaySignificantDatesProvider:(id)a3;
- (void)showYearNumberAnimated:(BOOL)a3;
- (void)updateToday;
@end

@implementation YearMultipleMonthView

- (id)initCalendarDate:(id)a3 calendar:(id)a4 maximumNumberOfMonths:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)YearMultipleMonthView;
  v10 = [(YearMultipleMonthView *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 calendarDateForMonth];
    calendarDate = v10->_calendarDate;
    v10->_calendarDate = (EKCalendarDate *)v11;

    objc_storeStrong((id *)&v10->_calendar, a4);
    v10->_maximumNumberOfMonths = a5;
    v10->_needToCalculateEligibleToShowYearNumber = 1;
    if ([(id)objc_opt_class() useUIKitLayoutMargins]) {
      [(YearMultipleMonthView *)v10 setPreservesSuperviewLayoutMargins:1];
    }
    [(YearMultipleMonthView *)v10 _initializeHeaderView];
    [(YearMultipleMonthView *)v10 _initializeMonthViews];
  }

  return v10;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)YearMultipleMonthView;
  v3 = [(YearMultipleMonthView *)&v8 description];
  v4 = [(YearMultipleMonthView *)self calendarDate];
  v5 = [(YearMultipleMonthView *)self endCalendarDate];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@; calendarDate: [%@]; endCalendarDate: [%@]",
    v3,
    v4,
  v6 = v5);

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = [(YearMultipleMonthView *)self window];
  if (v5)
  {
    v6 = [(YearMultipleMonthView *)self window];
    [v6 mainContentSize];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    EKUICurrentWindowSize();
    double v8 = v11;
    double v10 = v12;
  }

  BOOL v13 = [(YearMultipleMonthView *)self eligibleToShowYearNumber];
  objc_super v14 = objc_opt_class();
  uint64_t v15 = EKUIHeightSizeClassForViewHierarchy();
  [v14 _heightForViewWithVisibleHeader:v13 windowSize:v15 heightSizeClass:EKUIInterfaceOrientationForViewHierarchy() orientation:v8 v10];
  double v17 = v16;
  if ([(YearMultipleMonthView *)self containsLastMonthOfYear])
  {
    EKUICurrentWindowSize();
    if (EKUIWindowSizeParadigmForWindowSize() == 0x1000000) {
      double v17 = v17 + 7.0;
    }
  }
  double v18 = width;
  double v19 = v17;
  result.height = v19;
  result.CGFloat width = v18;
  return result;
}

- (double)_leftMarginWithOriginalValue:(double)a3
{
  v5 = objc_opt_class();
  EKUICurrentWindowSize();
  [v5 leftMarginForWindowSize:];
  if (result < 0.0)
  {
    [(YearMultipleMonthView *)self leftMarginAdjustment];
    return v7 + a3;
  }
  return result;
}

- (double)_rightMarginWithOriginalValue:(double)a3
{
  v5 = objc_opt_class();
  EKUICurrentWindowSize();
  [v5 rightMarginForWindowSize:];
  if (result < 0.0)
  {
    [(YearMultipleMonthView *)self rightMarginAdjustment];
    return v7 + a3;
  }
  return result;
}

- (UIEdgeInsets)_yearLayoutMargins
{
  if ([(id)objc_opt_class() useUIKitLayoutMargins])
  {
    [(YearMultipleMonthView *)self layoutMargins];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    [(YearMultipleMonthView *)self bounds];
    EKUILayoutMarginsForFullscreenLayoutRectWithSize();
    double v5 = v10;
    double v9 = v11;
    double v13 = v12;
    [(YearMultipleMonthView *)self _leftMarginWithOriginalValue:v14];
    double v7 = v15;
    [(YearMultipleMonthView *)self _rightMarginWithOriginalValue:v13];
    double v3 = v16;
  }
  double v17 = v5;
  double v18 = v7;
  double v19 = v9;
  result.right = v3;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (CGRect)insetBounds
{
  [(YearMultipleMonthView *)self _yearLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  [(YearMultipleMonthView *)self bounds];

  return CGRectInset(*(CGRect *)&v7, v6 + v4, 0.0);
}

- (void)didMoveToWindow
{
  if (self->_layoutWhenJoiningViewHierarchy)
  {
    double v3 = [(YearMultipleMonthView *)self window];

    if (v3)
    {
      [(YearMultipleMonthView *)self layoutSubviews];
      self->_layoutWhenJoiningViewHierarchy = 0;
    }
  }
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)YearMultipleMonthView;
  [(YearMultipleMonthView *)&v44 layoutSubviews];
  double v4 = [(YearMultipleMonthView *)self window];

  if (!v4)
  {
    self->_layoutWhenJoiningViewHierarchy = 1;
    return;
  }
  [(YearMultipleMonthView *)self _yearLayoutMargins];
  double v6 = v5;
  double v8 = v7;
  [(YearMultipleMonthView *)self insetBounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if ([(YearMultipleMonthView *)self eligibleToShowYearNumber])
  {
    -[YearViewYearHeader sizeThatFits:](self->_header, "sizeThatFits:", v12, v14);
    double v16 = v15;
    -[YearViewYearHeader setFrame:](self->_header, "setFrame:", v6, v10, v8 + v6 + v12, v15);
    double v10 = v10 + v16;
  }
  unint64_t v17 = [(YearMultipleMonthView *)self maximumNumberOfMonths];
  uint64_t v18 = EKUICurrentWindowSizeParadigmForViewHierarchy();
  if (EKUICurrentWindowInterfaceParadigm() != 8) {
    goto LABEL_24;
  }
  char v19 = 0;
  if (v18 <= 0x1FFFFFF)
  {
    if (v18 != 0x80000 && v18 != 0x800000) {
      goto LABEL_13;
    }
  }
  else if (v18 != 0x2000000 && v18 != 0x8000000 && v18 != 0x20000000)
  {
LABEL_13:
    v2 = [(YearMultipleMonthView *)self traitCollection];
    char v19 = EKUIUsesLargeTextYearView() ^ 1;
  }
  if (v18 > 0x1FFFFFF)
  {
    if (v18 != 0x2000000 && v18 != 0x8000000 && v18 != 0x20000000) {
      goto LABEL_23;
    }
LABEL_21:
    if ((v19 & 1) == 0) {
      goto LABEL_24;
    }
LABEL_22:
    double v20 = 45.0;
    goto LABEL_27;
  }
  if (v18 == 0x80000 || v18 == 0x800000) {
    goto LABEL_21;
  }
LABEL_23:

  if (v19) {
    goto LABEL_22;
  }
LABEL_24:
  [(YearMultipleMonthView *)self monthViewSubviewSize];
  double v22 = v21;
  if ([(YearMultipleMonthView *)self maximumNumberOfMonths])
  {
    [(YearMultipleMonthView *)self _yearLayoutMargins];
    double v24 = v23;
    double v26 = v25;
    [(YearMultipleMonthView *)self bounds];
    double v28 = v27 - v24 - v26 - v22 * (double)[(YearMultipleMonthView *)self maximumNumberOfMonths];
    double v20 = v28 / (double)([(YearMultipleMonthView *)self maximumNumberOfMonths] - 1);
  }
  else
  {
    double v20 = 0.0;
  }
LABEL_27:
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x4010000000;
  v40 = &unk_1001B5939;
  CGSize size = CGRectZero.size;
  double v41 = v6;
  double v42 = v10;
  [(YearMultipleMonthView *)self monthViewSubviewSize];
  v29 = v38;
  v38[6] = v30;
  v29[7] = v31;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  BOOL v32 = CalTimeDirectionIsLeftToRight() == 0;
  monthViews = self->_monthViews;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000AC6FC;
  v35[3] = &unk_1001D4160;
  if (v32) {
    uint64_t v34 = 2;
  }
  else {
    uint64_t v34 = 0;
  }
  v35[4] = &v37;
  v35[5] = v36;
  v35[6] = v17;
  *(double *)&v35[7] = v20;
  [(NSArray *)monthViews enumerateObjectsWithOptions:v34 usingBlock:v35];
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v37, 8);
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)YearMultipleMonthView;
  [(YearMultipleMonthView *)&v3 layoutMarginsDidChange];
  if ([(id)objc_opt_class() useUIKitLayoutMargins]) {
    [(YearMultipleMonthView *)self setNeedsLayout];
  }
}

- (EKCalendarDate)endCalendarDate
{
  endCalendarDate = self->_endCalendarDate;
  if (!endCalendarDate)
  {
    double v4 = [(NSArray *)self->_monthViews lastObject];
    double v5 = [v4 calendarDate];
    double v6 = [v5 calendarDateForEndOfMonth];
    double v7 = self->_endCalendarDate;
    self->_endCalendarDate = v6;

    endCalendarDate = self->_endCalendarDate;
  }

  return endCalendarDate;
}

- (double)topInset
{
  v2 = objc_opt_class();

  [v2 topInset];
  return result;
}

- (void)pulseTodayCircle
{
  CUIKTodayDate();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [(NSCalendar *)self->_calendar timeZone];
  double v4 = +[EKCalendarDate calendarDateWithDate:v6 timeZone:v3];
  double v5 = [(YearMultipleMonthView *)self monthViewForCalendarDate:v4];
  [v5 pulseTodayCircle];
}

- (void)updateToday
{
}

- (void)setOverlaySignificantDatesProvider:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_overlaySignificantDatesProvider, a3);
  monthViews = self->_monthViews;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ACA1C;
  v8[3] = &unk_1001D4188;
  id v9 = v5;
  id v7 = v5;
  [(NSArray *)monthViews enumerateObjectsUsingBlock:v8];
}

- (void)overlaySignificantDatesChangedInRange:(id)a3
{
  id v4 = a3;
  monthViews = self->_monthViews;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ACAC8;
  v7[3] = &unk_1001D4188;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)monthViews enumerateObjectsUsingBlock:v7];
}

- (void)localeChanged
{
  [(YearViewYearHeader *)self->_header localeChanged];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  objc_super v3 = self->_monthViews;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) localeChanged:(void)v8];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (double)topInset
{
  return 0.0;
}

- (double)leftMarginAdjustment
{
  return 0.0;
}

- (double)rightMarginAdjustment
{
  return 0.0;
}

+ (double)leftMarginForWindowSize:(CGSize)a3
{
  return -1.0;
}

+ (double)rightMarginForWindowSize:(CGSize)a3
{
  return -1.0;
}

+ (BOOL)useUIKitLayoutMargins
{
  return 0;
}

+ (double)heightForViewWithCalendarDate:(id)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5 orientation:(int64_t)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() _headerEligibleForCalendarDate:v10];

  double v12 = objc_opt_class();

  [v12 _heightForViewWithVisibleHeader:v11 windowSize:a5 heightSizeClass:a6 orientation:width height:height];
  return result;
}

- (BOOL)containsLastMonthOfYear
{
  return self->_containsLastMonthOfYear;
}

- (BOOL)pointIsAboveMonthNameBaseline:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = self;
  uint64_t v6 = [(NSArray *)self->_monthViews firstObject];
  [v6 convertPoint:v5 fromView:x, y];
  LOBYTE(v5) = [v6 pointIsAboveMonthNameBaseline:];

  return (char)v5;
}

- (void)setCalendarDate:(id)a3
{
  id v4 = [a3 calendarDateForMonth];
  p_calendarDate = &self->_calendarDate;
  if (self->_calendarDate != v4)
  {
    id v7 = v4;
    objc_storeStrong((id *)p_calendarDate, v4);
    endCalendarDate = self->_endCalendarDate;
    self->_endCalendarDate = 0;

    self->_needToCalculateEligibleToShowYearNumber = 1;
    [(YearMultipleMonthView *)self _reloadHeaderView];
    p_calendarDate = (EKCalendarDate **)[(YearMultipleMonthView *)self _reloadMonthViews];
    id v4 = v7;
  }

  _objc_release_x1(p_calendarDate, v4);
}

- (id)startOfMonthForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_monthViews;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 frame:v11];
        v17.CGFloat x = x;
        v17.CGFloat y = y;
        if (CGRectContainsPoint(v18, v17))
        {
          id v6 = [v9 calendarDate];
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)monthViewForCalendarDate:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_monthViews;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsCalendarDate:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)eligibleToShowYearNumber
{
  if (self->_needToCalculateEligibleToShowYearNumber)
  {
    objc_super v3 = objc_opt_class();
    id v4 = [(YearMultipleMonthView *)self calendarDate];
    self->_eligibleToShowYearNumber = [v3 _headerEligibleForCalendarDate:v4];

    self->_needToCalculateEligibleToShowYearNumber = 0;
  }
  return self->_eligibleToShowYearNumber;
}

- (void)hideYearNumberAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(YearMultipleMonthView *)self eligibleToShowYearNumber])
  {
    id v5 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      header = self->_header;
      uint64_t v7 = v5;
      long long v8 = [(YearViewYearHeader *)header calendarDate];
      *(_DWORD *)buf = 134217984;
      id v11 = [v8 year];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Hiding year number: [%lu]", buf, 0xCu);
    }
    if (v3)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000AD220;
      v9[3] = &unk_1001D2740;
      v9[4] = self;
      +[UIView animateWithDuration:v9 animations:0.3];
    }
    else
    {
      [(YearViewYearHeader *)self->_header setAlpha:0.0];
    }
  }
}

- (void)showYearNumberAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(YearMultipleMonthView *)self eligibleToShowYearNumber])
  {
    id v5 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      header = self->_header;
      uint64_t v7 = v5;
      long long v8 = [(YearViewYearHeader *)header calendarDate];
      *(_DWORD *)buf = 134217984;
      id v11 = [v8 year];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Showing year number: [%lu]", buf, 0xCu);
    }
    if (v3)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000AD3A0;
      v9[3] = &unk_1001D2740;
      v9[4] = self;
      +[UIView animateWithDuration:v9 animations:0.3];
    }
    else
    {
      [(YearViewYearHeader *)self->_header setAlpha:1.0];
    }
  }
}

+ (double)_heightForViewWithVisibleHeader:(BOOL)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5 orientation:(int64_t)a6
{
  double height = a4.height;
  double width = a4.width;
  BOOL v8 = a3;
  objc_msgSend(objc_msgSend((id)objc_opt_class(), "monthClass"), "heightForInterfaceOrientation:windowSize:heightSizeClass:", a6, a5, a4.width, a4.height);
  double v10 = v9;
  if (v8)
  {
    objc_msgSend(objc_msgSend((id)objc_opt_class(), "headerClass"), "heightForWindowSize:", width, height);
    return v10 + v11;
  }
  return v10;
}

+ (BOOL)_headerEligibleForCalendarDate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 year];
  id v5 = [v3 calendarDateByAddingMonths:-1];

  LOBYTE(v3) = [v5 year] != v4;
  return (char)v3;
}

- (CGSize)monthViewSubviewSize
{
  id v3 = [(NSArray *)self->_monthViews lastObject];
  [(YearMultipleMonthView *)self insetBounds];
  [v3 sizeThatFits:v4, v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_initializeHeaderView
{
  if (self->_header)
  {
    v2 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "The header already been initialized.", v8, 2u);
    }
  }
  else
  {
    id v4 = objc_alloc((Class)[(id)objc_opt_class() headerClass]);
    double v5 = [(YearMultipleMonthView *)self calendarDate];
    double v6 = (YearViewYearHeader *)[v4 initWithCalendarDate:v5];
    header = self->_header;
    self->_header = v6;

    self->_headerIsInViewHierarchCGFloat y = 0;
    [(YearMultipleMonthView *)self _reloadHeaderView];
  }
}

- (void)_initializeMonthViews
{
  if (self->_monthViews)
  {
    v2 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Month views have already been initialized.", buf, 2u);
    }
  }
  else
  {
    id v4 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    id v11 = [(YearMultipleMonthView *)self calendarDate];
    double v5 = (objc_class *)[(id)objc_opt_class() monthClass];
    if (v5)
    {
      double v6 = v5;
      unint64_t v7 = [(YearMultipleMonthView *)self maximumNumberOfMonths];
      if (v7)
      {
        unint64_t v8 = v7;
        do
        {
          id v9 = [[v6 alloc] initWithCalendarDate:v11 calendar:self->_calendar];
          [(YearMultipleMonthView *)self addSubview:v9];
          [(NSArray *)v4 addObject:v9];

          --v8;
        }
        while (v8);
      }
    }
    monthViews = self->_monthViews;
    self->_monthViews = v4;

    [(YearMultipleMonthView *)self _reloadMonthViews];
  }
}

- (void)_reloadHeaderView
{
  if ([(YearMultipleMonthView *)self eligibleToShowYearNumber])
  {
    id v3 = [(YearMultipleMonthView *)self calendarDate];
    [(YearViewYearHeader *)self->_header setCalendarDate:v3];

    [(YearViewYearHeader *)self->_header setHidden:0];
    if (self->_headerIsInViewHierarchy) {
      return;
    }
    [(YearMultipleMonthView *)self addSubview:self->_header];
    self->_headerIsInViewHierarchCGFloat y = 1;
  }
  else
  {
    [(YearViewYearHeader *)self->_header setHidden:1];
    [(YearViewYearHeader *)self->_header removeFromSuperview];
    self->_headerIsInViewHierarchCGFloat y = 0;
  }

  [(YearMultipleMonthView *)self setNeedsLayout];
}

- (void)_reloadMonthViews
{
  id v3 = [(YearMultipleMonthView *)self calendarDate];
  id v4 = [v3 year];
  self->_containsLastMonthOfYear = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = self->_monthViews;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
        if (v8)
        {
          BOOL v8 = 1;
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) setHidden:1];
        }
        else
        {
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) setHidden:0 v14];
          [v11 setCalendarDate:v3];
          long long v12 = [v3 calendarDateByAddingMonths:1];
          id v13 = [v12 year];
          BOOL v8 = v13 != v4;
          if (v13 != v4) {
            self->_containsLastMonthOfYear = 1;
          }

          id v3 = v12;
        }
        double v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (EKCalendarDate)calendarDate
{
  return self->_calendarDate;
}

- (EKUIOverlayCalendarSignificantDatesProvider)overlaySignificantDatesProvider
{
  return self->_overlaySignificantDatesProvider;
}

- (void)setEndCalendarDate:(id)a3
{
}

- (unint64_t)maximumNumberOfMonths
{
  return self->_maximumNumberOfMonths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endCalendarDate, 0);
  objc_storeStrong((id *)&self->_overlaySignificantDatesProvider, 0);
  objc_storeStrong((id *)&self->_calendarDate, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_monthViews, 0);
}

+ (Class)headerClass
{
  return 0;
}

+ (Class)monthClass
{
  return 0;
}

@end