@interface DayNavigationViewController
- (BOOL)canAnimateToDate:(id)a3;
- (BOOL)dayNavigationViewAllowedToChangeSelectedDate;
- (BOOL)dayNavigationViewIsLoadingSpecialDayData:(id)a3;
- (BOOL)eventSpringLoadingEnabled;
- (BOOL)showsMultiDay;
- (DayNavigationViewCellFactory)cellFactory;
- (DayNavigationViewController)initWithModel:(id)a3;
- (DayNavigationViewControllerDelegate)delegate;
- (DayNavigationWeekScrollView)weekScrollView;
- (UIEdgeInsets)paletteSafeAreaInsets;
- (id)dayNavigationView:(id)a3 dayDataForDate:(id)a4;
- (id)visibleCellBadgeColors;
- (id)visibleCellBadgeLocales;
- (id)visibleCellDayTypes;
- (void)_cachedOccurrencesChanged:(id)a3;
- (void)_contentSizeCategoryChanged;
- (void)_localeChanged:(id)a3;
- (void)_timeZoneChanged:(id)a3;
- (void)dayNavigationView:(id)a3 didChangeCellWidth:(double)a4;
- (void)dayNavigationView:(id)a3 selectedDateChanged:(id)a4;
- (void)dayNavigationViewFailedToSelectDate:(id)a3;
- (void)loadView;
- (void)pulseToday;
- (void)setCellFactory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventSpringLoadingEnabled:(BOOL)a3;
- (void)setPaletteSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setSelectedDate:(id)a3 animated:(BOOL)a4;
- (void)setShowsMultiDay:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)significantTimeChangeOccurred;
- (void)timeZoneChanged;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DayNavigationViewController

- (DayNavigationViewController)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DayNavigationViewController;
  v6 = [(DayNavigationViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (void)dayNavigationView:(id)a3 didChangeCellWidth:(double)a4
{
  v6 = [(DayNavigationViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(DayNavigationViewController *)self delegate];
    [v8 dayNavigationViewController:self didChangeCellWidth:a4];
  }
}

- (DayNavigationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DayNavigationViewControllerDelegate *)WeakRetained;
}

- (void)loadView
{
  id v14 = [(CUIKCalendarModel *)self->_model calendar];
  v3 = [(CUIKCalendarModel *)self->_model selectedDate];
  v4 = [v3 date];

  id v5 = [DayNavigationView alloc];
  v6 = [(DayNavigationViewController *)self cellFactory];
  char v7 = [(DayNavigationView *)v5 initWithCalendar:v14 selectedDate:v4 cellFactory:v6 eventSpringLoadingEnabled:self->_eventSpringLoadingEnabled];
  navigationView = self->_navigationView;
  self->_navigationView = v7;

  [(DayNavigationView *)self->_navigationView setDelegate:self];
  [(DayNavigationView *)self->_navigationView setShowsMultiDay:self->_showsMultiDay];
  [(DayNavigationViewController *)self setView:self->_navigationView];
  objc_super v9 = [(DayNavigationView *)self->_navigationView weekScrollView];
  [v9 updateDayBadges];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"_timeZoneChanged:" name:CUIKCalendarModelTimeZoneChangedNotification object:self->_model];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"_contentSizeCategoryChanged" name:UIContentSizeCategoryDidChangeNotification object:0];

  v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_cachedOccurrencesChanged:" name:CUIKCalendarModelCachedOccurrencesChangedNotification object:self->_model];
}

- (id)dayNavigationView:(id)a3 dayDataForDate:(id)a4
{
  id v5 = a4;
  if (_os_feature_enabled_impl())
  {
    if ([(CUIKCalendarModel *)self->_model cachedOccurrencesAreLoaded])
    {
      char v12 = 0;
      id v6 = [(CUIKCalendarModel *)self->_model sectionForCachedOccurrencesOnDate:v5 sectionExistsForDay:&v12];
      if (v12)
      {
        char v7 = [(CUIKCalendarModel *)self->_model cachedSpecialDayDataForSection:v6];
        goto LABEL_10;
      }
    }
    else if (!self->_loadingOccurrenceCache)
    {
      self->_loadingOccurrenceCache = 1;
      if (qword_100216A28 != -1) {
        dispatch_once(&qword_100216A28, &stru_1001D56D8);
      }
      id v8 = qword_100216A20;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100023C70;
      block[3] = &unk_1001D28A8;
      block[4] = self;
      id v11 = v5;
      dispatch_async(v8, block);
    }
  }
  char v7 = 0;
LABEL_10:

  return v7;
}

- (BOOL)dayNavigationViewIsLoadingSpecialDayData:(id)a3
{
  return self->_loadingOccurrenceCache;
}

- (DayNavigationWeekScrollView)weekScrollView
{
  return [(DayNavigationView *)self->_navigationView weekScrollView];
}

- (void)setSelectedDate:(id)a3 animated:(BOOL)a4
{
}

- (void)setPaletteSafeAreaInsets:(UIEdgeInsets)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setCellFactory:(id)a3
{
}

- (DayNavigationViewCellFactory)cellFactory
{
  return self->_cellFactory;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
}

- (void)dayNavigationView:(id)a3 selectedDateChanged:(id)a4
{
  id v7 = a4;
  id v5 = [(DayNavigationViewController *)self delegate];

  if (v5)
  {
    id v6 = [(DayNavigationViewController *)self delegate];
    [v6 dayNavigationViewController:self didSelectDate:v7];
  }
}

- (void)dayNavigationViewFailedToSelectDate:(id)a3
{
  id v7 = a3;
  v4 = [(DayNavigationViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DayNavigationViewController *)self delegate];
    [v6 dayNavigationViewControllerFailedToChangeDate:v7];
  }
}

- (BOOL)dayNavigationViewAllowedToChangeSelectedDate
{
  v3 = [(DayNavigationViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  char v5 = [(DayNavigationViewController *)self delegate];
  unsigned __int8 v6 = [v5 dayNavigationViewControllerAllowedToChangeSelectedDate];

  return v6;
}

- (void)_localeChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100103630;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_timeZoneChanged:(id)a3
{
  id v4 = [(CUIKCalendarModel *)self->_model calendar];
  [(DayNavigationView *)self->_navigationView setCalendar:v4];
}

- (void)_contentSizeCategoryChanged
{
  v3 = [(DayNavigationViewController *)self cellFactory];
  [v3 contentSizeCategoryChanged];

  [(DayNavigationView *)self->_navigationView contentSizeCategoryChanged];
  id v5 = [(DayNavigationViewController *)self view];
  id v4 = [v5 superview];
  [v4 setNeedsLayout];
}

- (void)_cachedOccurrencesChanged:(id)a3
{
  if (_os_feature_enabled_impl())
  {
    id v4 = [(DayNavigationView *)self->_navigationView weekScrollView];
    [v4 updateDayBadges];
  }
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DayNavigationViewController *)self view];
  [v4 setHidden:v3 ^ 1];
  [v4 setUserInteractionEnabled:v3];
}

- (BOOL)canAnimateToDate:(id)a3
{
  return [(DayNavigationView *)self->_navigationView canAnimateToDate:a3];
}

- (void)significantTimeChangeOccurred
{
}

- (void)timeZoneChanged
{
  navigationView = self->_navigationView;
  id v4 = [(CUIKCalendarModel *)self->_model calendar];
  [(DayNavigationView *)navigationView setCalendar:v4];

  id v5 = self->_navigationView;

  [(DayNavigationView *)v5 significantTimeChangeOccurred];
}

- (void)pulseToday
{
}

- (BOOL)eventSpringLoadingEnabled
{
  return self->_eventSpringLoadingEnabled;
}

- (void)setEventSpringLoadingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_eventSpringLoadingEnabled = a3;
  id v4 = [(DayNavigationViewController *)self weekScrollView];
  [v4 setEventSpringLoadingEnabled:v3];
}

- (UIEdgeInsets)paletteSafeAreaInsets
{
  [(DayNavigationView *)self->_navigationView paletteSafeAreaInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)visibleCellDayTypes
{
  double v2 = [(DayNavigationView *)self->_navigationView weekScrollView];
  double v3 = [v2 visibleCellDayTypes];

  return v3;
}

- (id)visibleCellBadgeColors
{
  double v2 = [(DayNavigationView *)self->_navigationView weekScrollView];
  double v3 = [v2 visibleCellBadgeColors];

  return v3;
}

- (id)visibleCellBadgeLocales
{
  double v2 = [(DayNavigationView *)self->_navigationView weekScrollView];
  double v3 = [v2 visibleCellBadgeLocales];

  return v3;
}

- (void)setShowsMultiDay:(BOOL)a3
{
  self->_showsMultiDay = a3;
  -[DayNavigationView setShowsMultiDay:](self->_navigationView, "setShowsMultiDay:");
}

- (BOOL)showsMultiDay
{
  return self->_showsMultiDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationView, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end