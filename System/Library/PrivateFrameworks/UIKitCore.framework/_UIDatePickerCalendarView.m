@interface _UIDatePickerCalendarView
- (BOOL)_shouldDisplayCalendarView;
- (BOOL)_shouldDisplayTimeView;
- (BOOL)_shouldUpdateDataForComponents:(id)a3 date:(id)a4;
- (BOOL)_shouldUpdateTimeViewForSelectedTime:(id)a3;
- (BOOL)dateSelection:(id)a3 canSelectDate:(id)a4;
- (BOOL)hasDefaultSize;
- (BOOL)usesAutoLayout;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)_sizeThatFits:(CGSize)a3;
- (CGSize)defaultSize;
- (UIDatePicker)datePicker;
- (UIEdgeInsets)appliedInsetsToEdgeOfContent;
- (_UIDatePickerCalendarView)initWithFrame:(CGRect)a3;
- (_UIDatePickerDataModel)data;
- (id)createDatePickerForTimeView:(id)a3;
- (id)primaryFirstResponder;
- (int64_t)datePickerStyle;
- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize;
- (void)_reload;
- (void)_reloadCalendarView;
- (void)_reloadDateRange;
- (void)_reloadTimeView;
- (void)_setEnabled:(BOOL)a3;
- (void)_setNeedsUpdateDateAnimated:(BOOL)a3;
- (void)_updateContentSizeLimitations;
- (void)_updateCustomFonts;
- (void)_updateDataForComponents:(id)a3;
- (void)_updateDate;
- (void)_updateDateIfNeeded;
- (void)_updateEnabledStyling;
- (void)_updateLayoutMargins;
- (void)_updateModuleVisibility;
- (void)_updateSelectedDay:(id)a3 animated:(BOOL)a4 notify:(BOOL)a5;
- (void)_updateSelectedDay:(id)a3 time:(id)a4 animated:(BOOL)a5 notify:(BOOL)a6;
- (void)_updateSelectedTime:(id)a3 notify:(BOOL)a4;
- (void)_updateTimeViewForSelectedDate:(id)a3 animated:(BOOL)a4;
- (void)_workaround66574039_datePickerDidUpdateLayoutMargins;
- (void)dateSelection:(id)a3 didSelectDate:(id)a4;
- (void)didChangeDateFrom:(id)a3 animated:(BOOL)a4;
- (void)didChangeMinuteInterval;
- (void)didChangeMode;
- (void)didChangeRoundsToMinuteInterval;
- (void)displaySelectedDateAnimated:(BOOL)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setData:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)timeView:(id)a3 didSelectTime:(id)a4;
- (void)timeViewDidBeginEditing:(id)a3;
- (void)timeViewDidEndEditing:(id)a3;
@end

@implementation _UIDatePickerCalendarView

- (_UIDatePickerCalendarView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_UIDatePickerCalendarView;
  v3 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 traitCollection];
    uint64_t v6 = +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v5 userInterfaceIdiom]);
    visualStyle = v4->_visualStyle;
    v4->_visualStyle = (_UIDatePickerStyle *)v6;

    v8 = (UICalendarView *)objc_opt_new();
    v9 = [[UICalendarSelectionSingleDate alloc] initWithDelegate:v4];
    [(UICalendarSelectionSingleDate *)v9 set_selectionFollowsMonthSelection:1];
    [(UIView *)v8 setClipsToBounds:0];
    [(UICalendarView *)v8 setSelectionBehavior:v9];
    calendarView = v4->_calendarView;
    v4->_calendarView = v8;
    v11 = v8;

    selection = v4->_selection;
    v4->_selection = v9;
    v13 = v9;

    v14 = (_UIDatePickerCalendarTimeView *)objc_opt_new();
    [(UIView *)v14 setAutoresizingMask:50];
    [(_UIDatePickerCalendarTimeView *)v14 setDelegate:v4];
    timeView = v4->_timeView;
    v4->_timeView = v14;

    [(_UIDatePickerCalendarView *)v4 _updateLayoutMargins];
    [(_UIDatePickerCalendarView *)v4 _updateContentSizeLimitations];
  }
  return v4;
}

- (void)_workaround66574039_datePickerDidUpdateLayoutMargins
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  [WeakRetained layoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setLayoutMargins:](self->_calendarView, "setLayoutMargins:", v5, v7, v9, v11);
  -[UIView setLayoutMargins:](self->_timeView, "setLayoutMargins:", v5, v7, v9, v11);
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)_updateLayoutMargins
{
  [(UIView *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  [(_UIDatePickerStyle *)self->_visualStyle inlineDatePickerMinimumMargin];
  double v8 = v7;
  int64_t v9 = [(_UIDatePickerDataModel *)self->_data datePickerMode];
  double v10 = 0.0;
  if (v9 != 1)
  {
    [(_UIDatePickerStyle *)self->_visualStyle inlineDatePickerMinimumMargin];
    double v10 = v11 * 0.5;
  }
  -[UIView setLayoutMargins:](self, "setLayoutMargins:", v8, v4, v10, v6);
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerCalendarView;
  [(UIView *)&v3 layoutMarginsDidChange];
  [(_UIDatePickerCalendarView *)self _updateContentSizeLimitations];
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)_UIDatePickerCalendarView;
  [(UIView *)&v50 layoutSubviews];
  objc_super v3 = self->_calendarView;
  double v4 = self->_timeView;
  if ([(_UIDatePickerCalendarView *)self _shouldDisplayTimeView]) {
    [(_UIDatePickerCalendarView *)self _shouldDisplayCalendarView];
  }
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  visualStyle = self->_visualStyle;
  v14 = [(_UIDatePickerCalendarView *)self datePicker];
  [v14 layoutMargins];
  [(_UIDatePickerStyle *)visualStyle maximumWidthOverhangForProposedLayoutMargins:"maximumWidthOverhangForProposedLayoutMargins:"];
  double v16 = v15;
  double v18 = v17;

  [(_UIDatePickerStyle *)self->_visualStyle inlineDatePickerMaximumWidth];
  double v20 = v18 + v16 + v19;
  v51.origin.double x = v6;
  v51.origin.double y = v8;
  v51.size.double width = v10;
  v51.size.double height = v12;
  double v21 = fmin(v20, CGRectGetWidth(v51));
  [(UIView *)self bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [(UIView *)self traitCollection];
  [v30 displayScale];
  UIRectCenteredXInRectScale(v6, v8, v21, v12, v23, v25, v27, v29, v31);
  double x = v32;
  double y = v34;
  double width = v36;
  double height = v38;
  remainder.origin.double x = v32;
  remainder.origin.double y = v34;
  remainder.size.double width = v36;
  remainder.size.double height = v38;

  CGSize v40 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v40;
  -[UICalendarView sizeThatFits:](v3, "sizeThatFits:", width, height);
  CGFloat v42 = v41;
  -[UIView systemLayoutSizeFittingSize:](v4, "systemLayoutSizeFittingSize:", width, height);
  CGFloat v44 = v43;
  int64_t v45 = [(_UIDatePickerDataModel *)self->_data datePickerMode];
  v46 = v3;
  switch(v45)
  {
    case 0:
    case 3:
      v46 = v4;
      goto LABEL_9;
    case 1:
      goto LABEL_9;
    case 2:
      v53.origin.double x = x;
      v53.origin.double y = y;
      v53.size.double width = width;
      v53.size.double height = height;
      CGRectDivide(v53, &slice, &remainder, v42, CGRectMinYEdge);
      -[UICalendarView setFrame:](v3, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      remainder.origin.double y = remainder.origin.y + -4.0;
      remainder.size.double height = remainder.size.height + 4.0;
      CGRectDivide(remainder, &slice, &remainder, v44, CGRectMinYEdge);
      double x = slice.origin.x;
      double y = slice.origin.y;
      v46 = v4;
      goto LABEL_8;
    default:
      if (v45 != 4272) {
        goto LABEL_10;
      }
      v52.origin.double x = x;
      v52.origin.double y = y;
      v52.size.double width = width;
      v52.size.double height = height;
      CGRectDivide(v52, &slice, &remainder, v44, CGRectMinYEdge);
      -[UIView setFrame:](v4, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      [(_UIDatePickerStyle *)self->_visualStyle inlineTimeAndDateSpacing];
      remainder.origin.double y = v47 + remainder.origin.y;
      remainder.size.double height = remainder.size.height - v47;
      CGRectDivide(remainder, &slice, &remainder, v42, CGRectMinYEdge);
      double x = slice.origin.x;
      double y = slice.origin.y;
      v46 = v3;
LABEL_8:
      double width = slice.size.width;
      double height = slice.size.height;
LABEL_9:
      objc_msgSend(v46, "setFrame:", x, y, width, height);
LABEL_10:
      [(_UIDatePickerCalendarView *)self _updateDateIfNeeded];

      return;
  }
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(_UIDatePickerCalendarView *)self _shouldDisplayCalendarView];
  BOOL v7 = [(_UIDatePickerCalendarView *)self _shouldDisplayTimeView];
  visualStyle = self->_visualStyle;
  if (v6) {
    [(_UIDatePickerStyle *)visualStyle inlineDateViewMinimumWidth];
  }
  else {
    [(_UIDatePickerStyle *)visualStyle inlineTimeViewMinimumWidth];
  }
  double v10 = v9;
  double v11 = self->_visualStyle;
  double v12 = [(_UIDatePickerCalendarView *)self datePicker];
  [v12 layoutMargins];
  [(_UIDatePickerStyle *)v11 maximumWidthOverhangForProposedLayoutMargins:"maximumWidthOverhangForProposedLayoutMargins:"];
  double v14 = v13;
  double v16 = v15;

  [(_UIDatePickerStyle *)self->_visualStyle inlineDatePickerMaximumWidth];
  double v18 = v16 + v14 + v17;
  double v19 = fmin(v18, width);
  if (width == 3.40282347e38) {
    double v20 = 320.0;
  }
  else {
    double v20 = v19;
  }
  if (!v6)
  {
    if (v7)
    {
      -[UIView systemLayoutSizeFittingSize:](self->_timeView, "systemLayoutSizeFittingSize:", v20, height);
      double v20 = v29;
      double height = v30;
    }
    goto LABEL_13;
  }
  -[UICalendarView sizeThatFits:](self->_calendarView, "sizeThatFits:", v20, height);
  double v23 = v21;
  double v24 = v22;
  if (!v7)
  {
    double height = v22;
    double v20 = v21;
LABEL_13:
    double v27 = fmax(v10, fmin(v20, v18));
    goto LABEL_14;
  }
  -[UIView systemLayoutSizeFittingSize:](self->_timeView, "systemLayoutSizeFittingSize:", v20, height);
  double v26 = v24 + v25 + -4.0;
  double v27 = fmax(v10, fmin(v23, v18));
  [(UIView *)self layoutMargins];
  double height = v26 + v28;
LABEL_14:
  double v31 = v27;
  double v32 = height;
  result.double height = v32;
  result.double width = v31;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerCalendarView;
  -[UIView setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y);
  _alertForMinimumWidthErrorIfNecessary(self, width);
  if (self->_lastSize.width != width || self->_lastSize.height != height)
  {
    self->_lastSize.double width = width;
    self->_lastSize.double height = height;
    [(_UIDatePickerCalendarView *)self _updateContentSizeLimitations];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerCalendarView;
  -[UIView setBounds:](&v7, sel_setBounds_, a3.origin.x, a3.origin.y);
  _alertForMinimumWidthErrorIfNecessary(self, width);
  if (self->_lastSize.width != width || self->_lastSize.height != height)
  {
    self->_lastSize.double width = width;
    self->_lastSize.double height = height;
    [(_UIDatePickerCalendarView *)self _updateContentSizeLimitations];
  }
}

- (void)_updateContentSizeLimitations
{
  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v7);
  if (Width < 330.0
    && [(_UIDatePickerDataModel *)self->_data datePickerMode]
    && [(_UIDatePickerDataModel *)self->_data datePickerMode] != 3)
  {
    double v4 = (id *)&UIContentSizeCategoryExtraExtraExtraLarge;
    if (Width < 280.0) {
      double v4 = (id *)&UIContentSizeCategoryExtraExtraLarge;
    }
  }
  else
  {
    double v4 = (id *)&UIContentSizeCategoryAccessibilityMedium;
  }
  id v5 = *v4;
  [(UIView *)self->_timeView setMaximumContentSizeCategory:v5];
  [(_UIDatePickerCalendarView *)self _workaround66574039_datePickerDidUpdateLayoutMargins];
}

- (void)_setNeedsUpdateDateAnimated:(BOOL)a3
{
  if (a3) {
    char v3 = 3;
  }
  else {
    char v3 = 1;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFC | v3;
  [(UIView *)self setNeedsLayout];
}

- (void)_updateDateIfNeeded
{
  if (*(unsigned char *)&self->_flags) {
    [(_UIDatePickerCalendarView *)self _updateDate];
  }
}

- (void)_updateDate
{
  *(unsigned char *)&self->_flags &= ~1u;
  id v11 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  char v3 = [(_UIDatePickerDataModel *)self->_data dateRange];
  id v4 = [v3 dateInRangeForDate:v11];

  id v5 = [_UIDatePickerCalendarDay alloc];
  BOOL v6 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  CGRect v7 = [(_UIDatePickerCalendarDay *)v5 initWithDate:v4 calendar:v6];

  double v8 = [_UIDatePickerCalendarTime alloc];
  double v9 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  double v10 = [(_UIDatePickerCalendarDateComponent *)v8 initWithDate:v4 calendar:v9];

  [(_UIDatePickerCalendarView *)self _updateSelectedDay:v7 time:v10 animated:(*(unsigned char *)&self->_flags >> 1) & 1 notify:v11 != v4];
}

- (void)_reloadDateRange
{
  char v3 = [(_UIDatePickerDataModel *)self->_data dateRange];
  id v4 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  char v5 = [v3 containsDate:v4];

  if ((v5 & 1) == 0)
  {
    [(_UIDatePickerCalendarView *)self _setNeedsUpdateDateAnimated:0];
  }
}

- (void)_reloadTimeView
{
  timeView = self->_timeView;
  id v6 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  id v4 = [(_UIDatePickerDataModel *)self->_data effectiveLocale];
  char v5 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  [(_UIDatePickerCalendarTimeView *)timeView reloadWithCalendar:v6 locale:v4 selectedDate:v5 followsSystemHourCycle:[(_UIDatePickerDataModel *)self->_data followsSystemHourCycle]];
}

- (void)_reloadCalendarView
{
  id v22 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  char v3 = [(_UIDatePickerDataModel *)self->_data dateRange];
  id v4 = [v3 startDate];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  CGRect v7 = v6;

  double v8 = [(_UIDatePickerDataModel *)self->_data dateRange];
  double v9 = [v8 endDate];
  double v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  double v12 = v11;

  [(UICalendarView *)self->_calendarView setCalendar:v22];
  double v13 = [(_UIDatePickerDataModel *)self->_data effectiveLocale];
  [(UICalendarView *)self->_calendarView setLocale:v13];

  double v14 = [(_UIDatePickerDataModel *)self->_data timeZone];
  [(UICalendarView *)self->_calendarView setTimeZone:v14];

  uint64_t v15 = [(_UIDatePickerDataModel *)self->_data customFontDesign];
  double v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = *(void *)off_1E52D6B80;
  }
  [(UICalendarView *)self->_calendarView setFontDesign:v17];

  double v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v12];
  [(UICalendarView *)self->_calendarView setAvailableDateRange:v18];

  double v19 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  double v20 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  double v21 = [v19 components:1048606 fromDate:v20];
  [(UICalendarSelectionSingleDate *)self->_selection setSelectedDate:v21];
}

- (void)_reload
{
  [(_UIDatePickerCalendarView *)self _reloadDateRange];
  [(_UIDatePickerCalendarView *)self _updateDateIfNeeded];
  [(_UIDatePickerCalendarView *)self _reloadCalendarView];
  [(_UIDatePickerCalendarView *)self _reloadTimeView];
  [(_UIDatePickerCalendarView *)self _updateLayoutMargins];
  [(_UIDatePickerCalendarView *)self _updateModuleVisibility];
  [(_UIDatePickerCalendarView *)self _updateCustomFonts];
  [(_UIDatePickerCalendarView *)self _updateEnabledStyling];
  char v3 = [_UIDatePickerCalendarDay alloc];
  id v4 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  char v5 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  double v10 = [(_UIDatePickerCalendarDay *)v3 initWithDate:v4 calendar:v5];

  id v6 = [_UIDatePickerCalendarTime alloc];
  CGRect v7 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  double v8 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  double v9 = [(_UIDatePickerCalendarDateComponent *)v6 initWithDate:v7 calendar:v8];

  [(_UIDatePickerCalendarView *)self _updateSelectedDay:v10 time:v9 animated:0 notify:0];
}

- (void)_updateEnabledStyling
{
  $0F83C0DF395938ED1DDB4892095D3BA2 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    [(UIView *)self setTintColor:0];
    double v4 = 1.0;
  }
  else
  {
    char v5 = +[UIColor secondaryLabelColor];
    [(UIView *)self setTintColor:v5];

    double v4 = 0.3;
  }
  [(UIView *)self setAlpha:v4];
  [(UIView *)self setUserInteractionEnabled:(*(unsigned int *)&flags >> 2) & 1];
}

- (BOOL)_shouldDisplayCalendarView
{
  int64_t v2 = [(_UIDatePickerDataModel *)self->_data datePickerMode];
  return (unint64_t)(v2 - 1) < 2 || v2 == 4272;
}

- (BOOL)_shouldDisplayTimeView
{
  unint64_t v2 = [(_UIDatePickerDataModel *)self->_data datePickerMode];
  return v2 <= 3 && v2 != 1 || v2 == 4272;
}

- (void)_updateModuleVisibility
{
  BOOL v4 = [(_UIDatePickerCalendarView *)self _shouldDisplayCalendarView];
  BOOL v5 = [(_UIDatePickerCalendarView *)self _shouldDisplayTimeView];
  BOOL v6 = v5;
  if (!v4 && !v5)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UIDatePickerCalendarView.m" lineNumber:390 description:@"Unsupported configuration"];
  }
  CGRect v7 = [(UIView *)self->_calendarView superview];

  if (v4)
  {
    if (!v7) {
      [(UIView *)self addSubview:self->_calendarView];
    }
  }
  else if (v7)
  {
    [(UIView *)self->_calendarView removeFromSuperview];
  }
  double v8 = [(UIView *)self->_timeView superview];

  if (v6)
  {
    if (!v8) {
      [(UIView *)self addSubview:self->_timeView];
    }
  }
  else
  {
    if (v8) {
      [(UIView *)self->_timeView removeFromSuperview];
    }
    BOOL v4 = 0;
  }
  timeView = self->_timeView;
  [(_UIDatePickerCalendarTimeView *)timeView setShouldShowTimeLabel:v4];
}

- (void)_updateCustomFonts
{
  uint64_t v3 = [(_UIDatePickerDataModel *)self->_data customFontDesign];
  id v5 = (id)v3;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = *(void *)off_1E52D6B80;
  }
  [(UICalendarView *)self->_calendarView setFontDesign:v4];
  [(_UIDatePickerCalendarTimeView *)self->_timeView setCustomFontDesign:v5];
}

- (BOOL)_shouldUpdateDataForComponents:(id)a3 date:(id)a4
{
  data = self->_data;
  id v5 = a4;
  BOOL v6 = [(_UIDatePickerDataModel *)data effectiveDate];
  char v7 = [v6 isEqualToDate:v5];

  return v7 ^ 1;
}

- (void)_updateDataForComponents:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [(_UIDatePickerDataModel *)data setDate:0];
  [(_UIDatePickerDataModel *)self->_data setLastSelectedDateComponents:v5];
}

- (BOOL)_shouldUpdateTimeViewForSelectedTime:(id)a3
{
  timeView = self->_timeView;
  id v4 = a3;
  id v5 = [(_UIDatePickerCalendarTimeView *)timeView selectedTime];
  char v6 = [v5 isEqual:v4];

  return v6 ^ 1;
}

- (void)_updateTimeViewForSelectedDate:(id)a3 animated:(BOOL)a4
{
}

- (void)_updateSelectedDay:(id)a3 time:(id)a4 animated:(BOOL)a5 notify:(BOOL)a6
{
  BOOL v31 = a5;
  BOOL v32 = a6;
  id v8 = a4;
  id v33 = (id)[a3 copyWithAssignedMonth:0];
  double v9 = [v33 components];
  double v10 = [v8 components];
  id v11 = v9;
  double v12 = objc_opt_new();
  for (uint64_t i = 1; i != 64; ++i)
  {
    uint64_t v14 = [v11 valueForComponent:1 << i];
    uint64_t v15 = [v10 valueForComponent:1 << i];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v30 = [MEMORY[0x1E4F28B00] currentHandler];
      double v29 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDateComponents * _Nonnull _UIDatePickerCombinedDateComponents(NSDateComponents * _Nonnull __strong, NSDateComponents * _Nonnull __strong)");
      [v30 handleFailureInFunction:v29, @"_UIDatePickerCalendarDateComponent.h", 68, @"Error combining %@ and %@. Both components contain values for NSCalendarUnit %lu", v11, v10, 1 << i file lineNumber description];

LABEL_9:
      [v12 setValue:v14 forComponent:1 << i];
      continue;
    }
    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_9;
    }
    uint64_t v14 = v15;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_9;
    }
  }

  uint64_t v17 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  [v12 setCalendar:v17];

  double v18 = [v12 date];
  double v19 = [_UIDatePickerCalendarDay alloc];
  double v20 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  double v21 = [(_UIDatePickerCalendarDay *)v19 initWithDate:v18 calendar:v20];

  id v22 = [_UIDatePickerCalendarTime alloc];
  double v23 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  double v24 = [(_UIDatePickerCalendarDateComponent *)v22 initWithDate:v18 calendar:v23];

  BOOL v25 = [(_UIDatePickerCalendarView *)self _shouldUpdateDataForComponents:v12 date:v18];
  if (v25) {
    [(_UIDatePickerCalendarView *)self _updateDataForComponents:v12];
  }
  selection = self->_selection;
  double v27 = [v33 components];
  [(UICalendarSelectionSingleDate *)selection setSelectedDate:v27 animated:v31];

  if ([(_UIDatePickerCalendarView *)self _shouldUpdateTimeViewForSelectedTime:v24])
  {
    [(_UIDatePickerCalendarView *)self _updateTimeViewForSelectedDate:v18 animated:v31];
  }
  if (v25 && v32)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
    [WeakRetained _emitValueChanged];
  }
}

- (void)_updateSelectedDay:(id)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  timeView = self->_timeView;
  id v9 = a3;
  id v10 = [(_UIDatePickerCalendarTimeView *)timeView selectedTime];
  [(_UIDatePickerCalendarView *)self _updateSelectedDay:v9 time:v10 animated:v6 notify:v5];
}

- (void)_updateSelectedTime:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [_UIDatePickerCalendarDay alloc];
  id v8 = [(UICalendarSelectionSingleDate *)self->_selection selectedDate];
  id v9 = [v8 date];
  id v10 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  id v11 = [(_UIDatePickerCalendarDay *)v7 initWithDate:v9 calendar:v10];

  [(_UIDatePickerCalendarView *)self _updateSelectedDay:v11 time:v6 animated:0 notify:v4];
}

- (void)dateSelection:(id)a3 didSelectDate:(id)a4
{
  id v12 = a4;
  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIDatePickerCalendarView.m", 493, @"Invalid parameter not satisfying: %@", @"selectedDate" object file lineNumber description];
  }
  id v6 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  char v7 = [v6 dateFromComponents:v12];

  id v8 = [_UIDatePickerCalendarDay alloc];
  id v9 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  id v10 = [(_UIDatePickerCalendarDay *)v8 initWithDate:v7 calendar:v9];

  [(_UIDatePickerCalendarView *)self _updateSelectedDay:v10 animated:0 notify:1];
}

- (BOOL)dateSelection:(id)a3 canSelectDate:(id)a4
{
  return a4 != 0;
}

- (void)timeView:(id)a3 didSelectTime:(id)a4
{
}

- (void)timeViewDidBeginEditing:(id)a3
{
  id v3 = [(_UIDatePickerCalendarView *)self datePicker];
  [v3 _emitBeginEditing];
}

- (void)timeViewDidEndEditing:(id)a3
{
  [(_UIDatePickerCalendarView *)self _reloadTimeView];
  id v4 = [(_UIDatePickerCalendarView *)self datePicker];
  [v4 _emitEndEditing];
}

- (id)createDatePickerForTimeView:(id)a3
{
  id v4 = [(_UIDatePickerDataModel *)self->_data createDatePickerRepresentingDataModelForMode:0 style:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  id v6 = [WeakRetained tintColor];
  [v4 setTintColor:v6];

  return v4;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
  [(_UIDatePickerCalendarView *)self didChangeMinuteInterval];
  [(_UIDatePickerCalendarView *)self didChangeRoundsToMinuteInterval];
  [(_UIDatePickerCalendarView *)self _reload];
}

- (int64_t)datePickerStyle
{
  return 3;
}

- (void)didChangeMode
{
  [(_UIDatePickerCalendarView *)self _updateLayoutMargins];
  [(_UIDatePickerCalendarView *)self _updateModuleVisibility];
  [(_UIDatePickerCalendarView *)self _updateContentSizeLimitations];
  id v3 = [(_UIDatePickerCalendarView *)self datePicker];
  [v3 invalidateIntrinsicContentSize];
}

- (void)didChangeDateFrom:(id)a3 animated:(BOOL)a4
{
}

- (void)displaySelectedDateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  calendarView = self->_calendarView;
  id v5 = [(UICalendarSelectionSingleDate *)self->_selection selectedDate];
  [(UICalendarView *)calendarView setVisibleDateComponents:v5 animated:v3];
}

- (void)didChangeMinuteInterval
{
  int64_t v3 = [(_UIDatePickerDataModel *)self->_data minuteInterval];
  timeView = self->_timeView;
  [(_UIDatePickerCalendarTimeView *)timeView setMinuteInterval:v3];
}

- (void)didChangeRoundsToMinuteInterval
{
  BOOL v3 = [(_UIDatePickerDataModel *)self->_data roundsToMinuteInterval];
  timeView = self->_timeView;
  [(_UIDatePickerCalendarTimeView *)timeView setRoundsToMinuteInterval:v3];
}

- (UIEdgeInsets)appliedInsetsToEdgeOfContent
{
  if ([(_UIDatePickerDataModel *)self->_data datePickerMode] == 1)
  {
    [(_UIDatePickerStyle *)self->_visualStyle inlineDatePickerMinimumMargin];
    double v4 = v3;
  }
  else
  {
    [(UIView *)self layoutMargins];
    double v4 = v5;
  }
  [(UIView *)self layoutMargins];
  double v7 = v6;
  p_datePicker = &self->_datePicker;
  id WeakRetained = objc_loadWeakRetained((id *)p_datePicker);
  [WeakRetained layoutMargins];
  double v11 = v10;
  id v12 = objc_loadWeakRetained((id *)p_datePicker);
  [v12 layoutMargins];
  double v14 = v13;

  double v15 = v7;
  double v16 = v11;
  double v17 = v4;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (BOOL)usesAutoLayout
{
  return 1;
}

- (CGSize)_sizeThatFits:(CGSize)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)defaultSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)hasDefaultSize
{
  return 0;
}

- (void)_setEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$0F83C0DF395938ED1DDB4892095D3BA2 flags = *(unsigned char *)&self->_flags & 0xFB | v3;
  [(_UIDatePickerCalendarView *)self _updateEnabledStyling];
}

- (id)primaryFirstResponder
{
  timeView = self->_timeView;
  if (timeView)
  {
    double v4 = [timeView superview];
    if (v4 && ([(UIView *)self->_timeView alpha], v5 == 1.0))
    {
      BOOL v6 = [(UIView *)self->_timeView isHidden];

      if (!v6)
      {
        timeView = [(_UIDatePickerCalendarTimeView *)self->_timeView primaryFirstResponder];
        goto LABEL_8;
      }
    }
    else
    {
    }
    timeView = 0;
  }
LABEL_8:
  return timeView;
}

- (UIDatePicker)datePicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  return (UIDatePicker *)WeakRetained;
}

- (void)setDatePicker:(id)a3
{
}

- (_UIDatePickerDataModel)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_datePicker);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_calendarView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

@end