@interface UIDatePicker
+ (id)_styleForIdiom:(int64_t)a3;
+ (void)_prepareStyleStorageIfNecessary;
+ (void)_registerStyle:(id)a3 forIdiom:(int64_t)a4;
- (BOOL)_allowsZeroCountDownDuration;
- (BOOL)_allowsZeroTimeInterval;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth;
- (BOOL)_displaysTimeZone;
- (BOOL)_drawsBackground;
- (BOOL)_isTimeIntervalMode;
- (BOOL)_selectionBarIgnoresInset;
- (BOOL)_useCurrentDateDuringDecoding;
- (BOOL)_usesBlackChrome;
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)roundsToMinuteInterval;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSCalendar)calendar;
- (NSDate)_dateUnderSelectionBar;
- (NSDate)date;
- (NSDate)maximumDate;
- (NSDate)minimumDate;
- (NSDictionary)_overrideCompactTextAttributes;
- (NSInteger)minuteInterval;
- (NSLocale)locale;
- (NSString)_customFontDesign;
- (NSTimeZone)timeZone;
- (UIColor)_highlightColor;
- (UIColor)_magnifierLineColor;
- (UIColor)_textColor;
- (UIColor)_textShadowColor;
- (UIDatePicker)initWithCoder:(id)a3;
- (UIDatePicker)initWithFrame:(CGRect)a3;
- (UIDatePickerMode)datePickerMode;
- (UIDatePickerStyle)datePickerStyle;
- (UIDatePickerStyle)preferredDatePickerStyle;
- (UIEdgeInsets)_appliedInsetsToEdgeOfContent;
- (_UIDatePickerCompactStyleDelegate)_compactStyleDelegate;
- (_UIDatePickerOverlayPresentation)_overlayPresentation;
- (_UIDatePickerStyle)_style;
- (double)_contentWidth;
- (double)timeInterval;
- (id)_labelTextForCalendarUnit:(unint64_t)a3;
- (id)_lastSelectedDateComponents;
- (id)_selectedTextForCalendarUnit:(unint64_t)a3;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)dateComponents;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)hour;
- (int)minute;
- (int)second;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_commonInit;
- (void)_compactStyleSetActiveComponent:(int64_t)a3;
- (void)_datePickerReset:(id)a3;
- (void)_emitBeginEditing;
- (void)_emitEndEditing;
- (void)_emitValueChanged;
- (void)_installPickerView:(id)a3 updatingSize:(BOOL)a4;
- (void)_performScrollTest:(id)a3 withIterations:(int64_t)a4 rowsToScroll:(int64_t)a5 inComponent:(int64_t)a6;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_registerObservers;
- (void)_setAllowsZeroCountDownDuration:(BOOL)a3;
- (void)_setAllowsZeroTimeInterval:(BOOL)a3;
- (void)_setCompactStyleDelegate:(id)a3;
- (void)_setCustomFontDesign:(id)a3;
- (void)_setDisplaysTimeZone:(BOOL)a3;
- (void)_setHidesLabels:(BOOL)a3;
- (void)_setHighlightColor:(id)a3;
- (void)_setHighlightsToday:(BOOL)a3;
- (void)_setMagnifierLineColor:(id)a3;
- (void)_setOverrideCompactTextAttributes:(id)a3;
- (void)_setSelectionBarIgnoresInset:(BOOL)a3;
- (void)_setTextColor:(id)a3;
- (void)_setTextShadowColor:(id)a3;
- (void)_setUpInitialValues;
- (void)_setUseCurrentDateDuringDecoding:(BOOL)a3;
- (void)_todayChanged:(id)a3;
- (void)_updatePickerDateFromOldDate:(id)a3 animated:(BOOL)a4;
- (void)_updatePickerViewIfNecessary;
- (void)_workaround66574039_updateLayoutMargins;
- (void)awakeFromNib;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutMarginsDidChange;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setContentHorizontalAlignment:(int64_t)a3;
- (void)setDate:(NSDate *)date;
- (void)setDate:(NSDate *)date animated:(BOOL)animated;
- (void)setDatePickerMode:(UIDatePickerMode)datePickerMode;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLocale:(NSLocale *)locale;
- (void)setMaximumDate:(NSDate *)maximumDate;
- (void)setMinimumDate:(NSDate *)minimumDate;
- (void)setMinuteInterval:(NSInteger)minuteInterval;
- (void)setPreferredDatePickerStyle:(UIDatePickerStyle)preferredDatePickerStyle;
- (void)setRoundsToMinuteInterval:(BOOL)roundsToMinuteInterval;
- (void)setTimeInterval:(double)a3;
- (void)setTimeZone:(NSTimeZone *)timeZone;
- (void)set_overlayPresentation:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIDatePicker

- (UIDatePicker)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (dyld_program_sdk_at_least())
  {
    v8 = (_UIDatePickerView *)objc_msgSend(objc_alloc((Class)_UIDatePickerClassForStyleAndMode(0, 2)), "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
    [(UIView *)v8 frame];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v13 = +[UIDevice currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];

    if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      +[UIPickerView sizeForMainScreenTraitsThatFits:](_UIDatePickerView, "sizeForMainScreenTraitsThatFits:", width, height);
    }
    else {
      +[UIPickerView defaultSizeForMainScreenTraits];
    }
    double v10 = v15;
    double v12 = v16;
    v17 = [_UIDatePickerView alloc];
    [(UIView *)self bounds];
    v8 = -[_UIDatePickerView initWithFrame:](v17, "initWithFrame:");
  }
  v22.receiver = self;
  v22.super_class = (Class)UIDatePicker;
  v18 = -[UIControl initWithFrame:](&v22, sel_initWithFrame_, x, y, v10, v12);
  if (v18)
  {
    uint64_t v19 = objc_opt_new();
    data = v18->_data;
    v18->_data = (_UIDatePickerDataModel *)v19;

    [(UIDatePicker *)v18 _installPickerView:v8 updatingSize:1];
    [(UIDatePicker *)v18 _setUpInitialValues];
    [(UIDatePicker *)v18 _commonInit];
  }

  return v18;
}

- (UIDatePicker)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UIDatePicker;
  v5 = [(UIControl *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    data = v5->_data;
    v5->_data = (_UIDatePickerDataModel *)v6;

    v5->_preferredDatePickerStyle = [v4 decodeIntegerForKey:@"UIPickerStyle"];
    if ([v4 containsValueForKey:@"UIDatePickerMode"]) {
      int64_t v8 = [v4 decodeIntegerForKey:@"UIDatePickerMode"];
    }
    else {
      int64_t v8 = 2;
    }
    id v9 = objc_alloc((Class)_UIDatePickerClassForStyleAndMode(v5->_preferredDatePickerStyle, v8));
    [(UIView *)v5 bounds];
    double v10 = objc_msgSend(v9, "initWithFrame:");
    [(UIDatePicker *)v5 _installPickerView:v10 updatingSize:0];
    [(UIDatePicker *)v5 setDatePickerMode:v8];
    double v11 = [v4 decodeObjectForKey:@"UILocale"];
    [(UIDatePicker *)v5 setLocale:v11];

    double v12 = [v4 decodeObjectForKey:@"UITimeZone"];
    [(UIDatePicker *)v5 setTimeZone:v12];

    v13 = [v4 decodeObjectForKey:@"UICalendar"];
    [(UIDatePicker *)v5 setCalendar:v13];

    if ([v4 containsValueForKey:@"UIMinuteInterval"]) {
      uint64_t v14 = [v4 decodeIntegerForKey:@"UIMinuteInterval"];
    }
    else {
      uint64_t v14 = 1;
    }
    [(UIDatePicker *)v5 setMinuteInterval:v14];
    if ([(UIDatePicker *)v5 _isTimeIntervalMode])
    {
      [v4 decodeFloatForKey:@"UICountDownDuration"];
      [(UIDatePicker *)v5 setTimeInterval:v15];
    }
    else
    {
      double v16 = [v4 decodeObjectForKey:@"UIMinimumDate"];
      [(UIDatePicker *)v5 setMinimumDate:v16];

      v17 = [v4 decodeObjectForKey:@"UIMaximumDate"];
      [(UIDatePicker *)v5 setMaximumDate:v17];

      v18 = [v4 decodeObjectForKey:@"UIDate"];
      [(UIDatePicker *)v5 setDate:v18];
    }
    [(UIDatePicker *)v5 _setUpInitialValues];
    if ([v4 containsValueForKey:@"UIDatePickerUseCurrentDateDuringDecoding"]) {
      -[UIDatePicker _setUseCurrentDateDuringDecoding:](v5, "_setUseCurrentDateDuringDecoding:", [v4 decodeBoolForKey:@"UIDatePickerUseCurrentDateDuringDecoding"]);
    }
    [(UIDatePicker *)v5 _commonInit];
    uint64_t v19 = v5;
  }
  return v5;
}

- (void)_commonInit
{
  v5[3] = *MEMORY[0x1E4F143B8];
  [(UIDatePicker *)self _registerObservers];
  if (dyld_program_sdk_at_least())
  {
    v5[0] = 0x1ED3F5A30;
    v5[1] = 0x1ED3F5A90;
    v5[2] = 0x1ED3F5AA8;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
    id v4 = [(UIView *)self _registerForTraitTokenChanges:v3 withTarget:self action:sel_invalidateIntrinsicContentSize];
  }
}

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)UIDatePicker;
  [&v4 awakeFromNib];
  if ([(UIDatePicker *)self _useCurrentDateDuringDecoding])
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [(UIDatePicker *)self setDate:v3];
  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIDatePicker;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  if (self->_pickerView) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIDatePicker;
  [(UIControl *)&v20 encodeWithCoder:v4];
  int64_t preferredDatePickerStyle = self->_preferredDatePickerStyle;
  if (preferredDatePickerStyle) {
    [v4 encodeInteger:preferredDatePickerStyle forKey:@"UIPickerStyle"];
  }
  if ([(UIDatePicker *)self datePickerMode] != UIDatePickerModeDateAndTime) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIDatePicker datePickerMode](self, "datePickerMode"), @"UIDatePickerMode");
  }
  uint64_t v6 = [(_UIDatePickerDataModel *)self->_data locale];

  if (v6)
  {
    v7 = [(_UIDatePickerDataModel *)self->_data locale];
    [v4 encodeObject:v7 forKey:@"UILocale"];
  }
  int64_t v8 = [(UIDatePicker *)self timeZone];

  if (v8)
  {
    id v9 = [(UIDatePicker *)self timeZone];
    [v4 encodeObject:v9 forKey:@"UITimeZone"];
  }
  double v10 = [(_UIDatePickerDataModel *)self->_data calendar];

  if (v10)
  {
    double v11 = [(_UIDatePickerDataModel *)self->_data calendar];
    [v4 encodeObject:v11 forKey:@"UICalendar"];
  }
  if ([(UIDatePicker *)self _isTimeIntervalMode])
  {
    [(UIDatePicker *)self timeInterval];
    if (v12 != 0.0)
    {
      [(UIDatePicker *)self timeInterval];
      *(float *)&double v13 = v13;
      [v4 encodeFloat:@"UICountDownDuration" forKey:v13];
    }
  }
  else
  {
    uint64_t v14 = [(UIDatePicker *)self date];

    if (v14)
    {
      float v15 = [(UIDatePicker *)self date];
      [v4 encodeObject:v15 forKey:@"UIDate"];
    }
    double v16 = [(UIDatePicker *)self minimumDate];

    if (v16)
    {
      v17 = [(UIDatePicker *)self minimumDate];
      [v4 encodeObject:v17 forKey:@"UIMinimumDate"];
    }
    v18 = [(UIDatePicker *)self maximumDate];

    if (v18)
    {
      uint64_t v19 = [(UIDatePicker *)self maximumDate];
      [v4 encodeObject:v19 forKey:@"UIMaximumDate"];
    }
  }
  if ([(UIDatePicker *)self minuteInterval] != 1) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIDatePicker minuteInterval](self, "minuteInterval"), @"UIMinuteInterval");
  }
  if (![(UIDatePicker *)self _useCurrentDateDuringDecoding]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[UIDatePicker _useCurrentDateDuringDecoding](self, "_useCurrentDateDuringDecoding"), @"UIDatePickerUseCurrentDateDuringDecoding");
  }
}

- (void)_setUpInitialValues
{
  v3 = [(UIDatePicker *)self date];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [(UIDatePicker *)self setDate:v4];
  }
  objc_super v5 = [(UIView *)self traitCollection];
  +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v5 userInterfaceIdiom]);
  uint64_t v6 = (_UIDatePickerStyle *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  self->_style = v6;

  self->_ignoresEmitValueChanged = 0;
  [(UIDatePicker *)self _setUseCurrentDateDuringDecoding:1];
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self setPreservesSuperviewLayoutMargins:1];
  }
}

- (void)_registerObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__datePickerReset_ name:0x1ED1585A0 object:0];
  [v3 addObserver:self selector:sel__todayChanged_ name:0x1ED15CFC0 object:UIApp];
}

- (void)_datePickerReset:(id)a3
{
  [(_UIDatePickerDataModel *)self->_data resetForCurrentLocaleOrCalendarChange];
  [(_UIDatePickerViewComponent *)self->_pickerView didReset];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__UIDatePicker__datePickerReset___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __33__UIDatePicker__datePickerReset___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 472) calendar];

  if (!v2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 464);
    [v3 didChangeCalendar];
  }
}

- (void)_todayChanged:(id)a3
{
}

- (void)_updatePickerViewIfNecessary
{
  id v3 = _UIDatePickerClassForStyleAndMode(self->_preferredDatePickerStyle, [(_UIDatePickerDataModel *)self->_data datePickerMode]);
  if (v3 != (id)objc_opt_class())
  {
    [(_UIDatePickerViewComponent *)self->_pickerView removeFromSuperview];
    id v4 = (id)objc_opt_new();
    [(UIDatePicker *)self _installPickerView:v4 updatingSize:1];
    [(UIDatePicker *)self _setUpInitialValues];
    [(UIView *)self setNeedsLayout];
    [(UIDatePicker *)self invalidateIntrinsicContentSize];
  }
}

- (void)_installPickerView:(id)a3 updatingSize:(BOOL)a4
{
  BOOL v4 = a4;
  v28[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  p_pickerView = &self->_pickerView;
  objc_storeStrong((id *)&self->_pickerView, a3);
  [(_UIDatePickerViewComponent *)self->_pickerView setDatePicker:self];
  if (!self->_data)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"UIDatePicker.m" lineNumber:391 description:@"Installing picker view before data model has been created"];
  }
  -[_UIDatePickerDataModel setDatePickerStyle:](self->_data, "setDatePickerStyle:", [v8 datePickerStyle]);
  [(_UIDatePickerViewComponent *)*p_pickerView setData:self->_data];
  [(_UIDatePickerViewComponent *)*p_pickerView _setEnabled:[(UIControl *)self isEnabled]];
  [(UIDatePicker *)self _workaround66574039_updateLayoutMargins];
  [(UIView *)self addSubview:*p_pickerView];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(_UIDatePickerViewComponent *)*p_pickerView usesAutoLayout] & 1) != 0)
  {
    [(_UIDatePickerViewComponent *)*p_pickerView setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v20 = (void *)MEMORY[0x1E4F5B268];
    v25 = [(_UIDatePickerViewComponent *)*p_pickerView leadingAnchor];
    v24 = [(UIView *)self leadingAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v28[0] = v23;
    objc_super v22 = [(_UIDatePickerViewComponent *)*p_pickerView trailingAnchor];
    objc_super v21 = [(UIView *)self trailingAnchor];
    double v10 = [v22 constraintEqualToAnchor:v21];
    v28[1] = v10;
    double v11 = [(_UIDatePickerViewComponent *)*p_pickerView topAnchor];
    double v12 = [(UIView *)self topAnchor];
    [v11 constraintEqualToAnchor:v12];
    double v13 = v26 = v4;
    v28[2] = v13;
    uint64_t v14 = [(_UIDatePickerViewComponent *)*p_pickerView bottomAnchor];
    float v15 = [(UIView *)self bottomAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15];
    v28[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v20 activateConstraints:v17];

    BOOL v4 = v26;
  }
  else
  {
    v18 = *p_pickerView;
    [(UIView *)self bounds];
    -[_UIDatePickerViewComponent setFrame:](v18, "setFrame:");
    [(_UIDatePickerViewComponent *)*p_pickerView setAutoresizingMask:18];
  }
  v27.receiver = self;
  v27.super_class = (Class)UIDatePicker;
  [(UIView *)&v27 invalidateIntrinsicContentSize];
  if (v4) {
    [(UIView *)self sizeToFit];
  }
}

- (UIDatePickerMode)datePickerMode
{
  return [(_UIDatePickerDataModel *)self->_data datePickerMode];
}

- (void)setDatePickerMode:(UIDatePickerMode)datePickerMode
{
  if ([(_UIDatePickerDataModel *)self->_data datePickerMode] != datePickerMode)
  {
    [(_UIDatePickerDataModel *)self->_data setDatePickerMode:datePickerMode];
    [(UIDatePicker *)self _updatePickerViewIfNecessary];
    [(_UIDatePickerViewComponent *)self->_pickerView didChangeMode];
    if (dyld_program_sdk_at_least())
    {
      [(UIDatePicker *)self invalidateIntrinsicContentSize];
    }
  }
}

- (NSLocale)locale
{
  v2 = [(_UIDatePickerDataModel *)self->_data locale];
  id v3 = _UIDatePickerUserLocaleForLocale(v2);

  return (NSLocale *)v3;
}

- (void)setLocale:(NSLocale *)locale
{
  BOOL v4 = _UIDatePickerStoredLocaleForLocale(locale);
  objc_super v5 = [(_UIDatePickerDataModel *)self->_data locale];
  id v8 = v4;
  id v6 = v5;
  if (v8 == v6)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v8 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(_UIDatePickerDataModel *)self->_data setLocale:v8];
    [(_UIDatePickerViewComponent *)self->_pickerView didChangeLocale];
  }
LABEL_9:
}

- (NSCalendar)calendar
{
  v2 = [(_UIDatePickerDataModel *)self->_data calendar];
  id v3 = _UIDatePickerUserCalendarForCalendar(v2);

  return (NSCalendar *)v3;
}

- (void)setCalendar:(NSCalendar *)calendar
{
  BOOL v4 = _UIDatePickerStoredCalendarForCalendar(calendar);
  id v5 = [(_UIDatePickerDataModel *)self->_data calendar];
  id v6 = v4;
  id v8 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(_UIDatePickerDataModel *)self->_data setCalendar:v8];
    [(_UIDatePickerViewComponent *)self->_pickerView didChangeCalendar];
  }
LABEL_9:
}

- (NSTimeZone)timeZone
{
  return [(_UIDatePickerDataModel *)self->_data timeZone];
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  BOOL v4 = timeZone;
  id v5 = [(_UIDatePickerDataModel *)self->_data timeZone];
  id v6 = v4;
  id v8 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSTimeZone *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(_UIDatePickerDataModel *)self->_data setTimeZone:v8];
    [(_UIDatePickerViewComponent *)self->_pickerView didChangeTimeZone];
  }
LABEL_9:
}

- (NSDate)date
{
  return [(_UIDatePickerDataModel *)self->_data effectiveDate];
}

- (void)setDate:(NSDate *)date
{
  id v6 = date;
  BOOL v4 = [(UIView *)self window];
  BOOL v5 = v4 != 0;

  [(UIDatePicker *)self setDate:v6 animated:v5];
}

- (NSDate)minimumDate
{
  return [(_UIDatePickerDataModel *)self->_data minimumDate];
}

- (void)setMinimumDate:(NSDate *)minimumDate
{
  BOOL v4 = minimumDate;
  BOOL v5 = [(_UIDatePickerDataModel *)self->_data minimumDate];
  id v6 = v4;
  double v12 = v6;
  if (v5 == v6)
  {

    id v9 = v12;
LABEL_10:

    id v8 = v12;
    goto LABEL_11;
  }
  if (!v6 || !v5)
  {

LABEL_8:
    id v9 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
    [(_UIDatePickerDataModel *)self->_data setMinimumDate:v12];
    [(_UIDatePickerViewComponent *)self->_pickerView didChangeMinimumDate];
    double v10 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
    char v11 = [v9 isEqualToDate:v10];

    if ((v11 & 1) == 0) {
      [(UIDatePicker *)self _updatePickerDateFromOldDate:v9 animated:0];
    }
    goto LABEL_10;
  }
  char v7 = [(NSDate *)v5 isEqual:v6];

  id v8 = v12;
  if ((v7 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_11:
}

- (NSDate)maximumDate
{
  return [(_UIDatePickerDataModel *)self->_data maximumDate];
}

- (void)setMaximumDate:(NSDate *)maximumDate
{
  BOOL v4 = maximumDate;
  BOOL v5 = [(_UIDatePickerDataModel *)self->_data maximumDate];
  id v6 = v4;
  double v12 = v6;
  if (v5 == v6)
  {

    id v9 = v12;
LABEL_10:

    id v8 = v12;
    goto LABEL_11;
  }
  if (!v6 || !v5)
  {

LABEL_8:
    id v9 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
    [(_UIDatePickerDataModel *)self->_data setMaximumDate:v12];
    [(_UIDatePickerViewComponent *)self->_pickerView didChangeMaximumDate];
    double v10 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
    char v11 = [v9 isEqualToDate:v10];

    if ((v11 & 1) == 0) {
      [(UIDatePicker *)self _updatePickerDateFromOldDate:v9 animated:0];
    }
    goto LABEL_10;
  }
  char v7 = [(NSDate *)v5 isEqual:v6];

  id v8 = v12;
  if ((v7 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_11:
}

- (NSInteger)minuteInterval
{
  return [(_UIDatePickerDataModel *)self->_data minuteInterval];
}

- (void)setMinuteInterval:(NSInteger)minuteInterval
{
  if ([(_UIDatePickerDataModel *)self->_data minuteInterval] != minuteInterval)
  {
    [(_UIDatePickerDataModel *)self->_data setMinuteInterval:minuteInterval];
    pickerView = self->_pickerView;
    [(_UIDatePickerViewComponent *)pickerView didChangeMinuteInterval];
  }
}

- (void)setDate:(NSDate *)date animated:(BOOL)animated
{
  BOOL v4 = animated;
  id v6 = date;
  char v7 = [(_UIDatePickerDataModel *)self->_data date];
  id v8 = v6;
  double v13 = v8;
  if (v7 == v8)
  {
  }
  else
  {
    if (!v8 || !v7)
    {

LABEL_9:
      double v10 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
      [(_UIDatePickerDataModel *)self->_data setDate:v13];
      char v11 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
      char v12 = [v10 isEqualToDate:v11];

      if (v12) {
        [(_UIDatePickerViewComponent *)self->_pickerView displaySelectedDateAnimated:v4];
      }
      else {
        [(UIDatePicker *)self _updatePickerDateFromOldDate:v10 animated:v4];
      }

      goto LABEL_13;
    }
    char v9 = [(NSDate *)v7 isEqual:v8];

    if ((v9 & 1) == 0) {
      goto LABEL_9;
    }
  }
  [(_UIDatePickerViewComponent *)self->_pickerView displaySelectedDateAnimated:v4];
LABEL_13:
}

- (void)setPreferredDatePickerStyle:(UIDatePickerStyle)preferredDatePickerStyle
{
  if (self->_preferredDatePickerStyle != preferredDatePickerStyle)
  {
    self->_int64_t preferredDatePickerStyle = preferredDatePickerStyle;
    [(UIDatePicker *)self _updatePickerViewIfNecessary];
  }
}

- (UIDatePickerStyle)datePickerStyle
{
  return [(_UIDatePickerDataModel *)self->_data datePickerStyle];
}

- (BOOL)roundsToMinuteInterval
{
  return [(_UIDatePickerDataModel *)self->_data roundsToMinuteInterval];
}

- (void)setRoundsToMinuteInterval:(BOOL)roundsToMinuteInterval
{
  BOOL v3 = roundsToMinuteInterval;
  if ([(_UIDatePickerDataModel *)self->_data roundsToMinuteInterval] != roundsToMinuteInterval)
  {
    [(_UIDatePickerDataModel *)self->_data setRoundsToMinuteInterval:v3];
    pickerView = self->_pickerView;
    [(_UIDatePickerViewComponent *)pickerView didChangeRoundsToMinuteInterval];
  }
}

- (BOOL)_selectionBarIgnoresInset
{
  return self->_datePickerViewFlags.selectionBarIgnoresInset != 0;
}

- (void)_setSelectionBarIgnoresInset:(BOOL)a3
{
  if (self->_datePickerViewFlags.selectionBarIgnoresInset != a3)
  {
    BOOL v3 = a3;
    self->_datePickerViewFlags.selectionBarIgnoresInset = a3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      pickerView = self->_pickerView;
      [(_UIDatePickerViewComponent *)pickerView _setSelectionBarIgnoresInset:v3];
    }
  }
}

- (NSString)_customFontDesign
{
  return [(_UIDatePickerDataModel *)self->_data customFontDesign];
}

- (void)_setCustomFontDesign:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDatePickerDataModel *)self->_data customFontDesign];
  id v6 = v4;
  id v8 = v6;
  if (v5 == v6)
  {

    goto LABEL_10;
  }
  if (v6 && v5)
  {
    char v7 = [v5 isEqual:v6];

    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  [(_UIDatePickerDataModel *)self->_data setCustomFontDesign:v8];
  if (objc_opt_respondsToSelector()) {
    [(_UIDatePickerViewComponent *)self->_pickerView didChangeCustomFontDesign];
  }
LABEL_10:
}

- (UIEdgeInsets)_appliedInsetsToEdgeOfContent
{
  [(_UIDatePickerViewComponent *)self->_pickerView appliedInsetsToEdgeOfContent];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_useCurrentDateDuringDecoding
{
  return self->_useCurrentDateDuringDecoding;
}

- (void)_setUseCurrentDateDuringDecoding:(BOOL)a3
{
  self->_useCurrentDateDuringDecoding = a3;
}

- (double)_contentWidth
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(_UIDatePickerViewComponent *)self->_pickerView usesAutoLayout] & 1) != 0
    || ![(_UIDatePickerViewComponent *)self->_pickerView hasDefaultSize])
  {
    [(UIView *)self bounds];
    return v5;
  }
  else
  {
    pickerView = self->_pickerView;
    [(_UIDatePickerViewComponent *)pickerView contentWidth];
  }
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return [(_UIDatePickerViewComponent *)self->_pickerView _contentHuggingDefault_isUsuallyFixedHeight];
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return [(_UIDatePickerViewComponent *)self->_pickerView _contentHuggingDefault_isUsuallyFixedWidth];
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(_UIDatePickerViewComponent *)self->_pickerView usesAutoLayout] & 1) != 0)
  {
    double v6 = -1.0;
    double v7 = -1.0;
  }
  else
  {
    int v8 = [(_UIDatePickerViewComponent *)self->_pickerView hasDefaultSize];
    pickerView = self->_pickerView;
    if (v8)
    {
      [(_UIDatePickerViewComponent *)pickerView defaultSize];
    }
    else
    {
      -[_UIDatePickerViewComponent _sizeThatFits:](pickerView, "_sizeThatFits:", width, height);
    }
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(_UIDatePickerViewComponent *)self->_pickerView usesAutoLayout])
  {
    pickerView = self->_pickerView;
    -[_UIDatePickerViewComponent systemLayoutSizeFittingSize:](pickerView, "systemLayoutSizeFittingSize:", width, height);
  }
  else
  {
    -[UIDatePicker _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", width, height);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  [(_UIDatePickerViewComponent *)self->_pickerView invalidateIntrinsicContentSize];
  v3.receiver = self;
  v3.super_class = (Class)UIDatePicker;
  [(UIView *)&v3 invalidateIntrinsicContentSize];
}

- (void)traitCollectionDidChange:(id)a3
{
  if (dyld_program_sdk_at_least())
  {
    [(UIDatePicker *)self invalidateIntrinsicContentSize];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (UIViewIgnoresTouchEvents(self))
  {
    double v8 = 0;
  }
  else
  {
    double v8 = -[_UIDatePickerViewComponent hitTest:withEvent:](self->_pickerView, "hitTest:withEvent:", v7, x, y);
  }

  return v8;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UIDatePicker;
  [(UIView *)&v3 layoutMarginsDidChange];
  [(UIDatePicker *)self _workaround66574039_updateLayoutMargins];
}

- (void)_workaround66574039_updateLayoutMargins
{
  if (objc_opt_respondsToSelector())
  {
    pickerView = self->_pickerView;
    [(_UIDatePickerViewComponent *)pickerView _workaround66574039_datePickerDidUpdateLayoutMargins];
  }
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIDatePicker;
  -[UIControl setContentHorizontalAlignment:](&v7, sel_setContentHorizontalAlignment_);
  double v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(_UIDatePickerViewComponent *)self->_pickerView setContentHorizontalAlignment:a3];
  }
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((dyld_program_sdk_at_least() & 1) == 0
    && self->_pickerView
    && ((objc_opt_respondsToSelector() & 1) == 0
     || ([(_UIDatePickerViewComponent *)self->_pickerView usesAutoLayout] & 1) == 0))
  {
    -[_UIDatePickerViewComponent _sizeThatFits:](self->_pickerView, "_sizeThatFits:", width, height);
    double width = v8;
    double height = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)UIDatePicker;
  -[UIView setFrame:](&v10, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((dyld_program_sdk_at_least() & 1) == 0
    && self->_pickerView
    && ((objc_opt_respondsToSelector() & 1) == 0
     || ([(_UIDatePickerViewComponent *)self->_pickerView usesAutoLayout] & 1) == 0))
  {
    -[_UIDatePickerViewComponent _sizeThatFits:](self->_pickerView, "_sizeThatFits:", width, height);
    double width = v8;
    double height = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)UIDatePicker;
  -[UIView setBounds:](&v10, sel_setBounds_, x, y, width, height);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIDatePicker;
  -[UIControl setEnabled:](&v5, sel_setEnabled_);
  [(_UIDatePickerViewComponent *)self->_pickerView _setEnabled:v3];
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (void)_emitBeginEditing
{
}

- (void)_emitValueChanged
{
  if (!self->_ignoresEmitValueChanged) {
    [(UIControl *)self sendActionsForControlEvents:4096];
  }
}

- (void)_emitEndEditing
{
}

- (void)_updatePickerDateFromOldDate:(id)a3 animated:(BOOL)a4
{
  self->_ignoresEmitValueChanged = 1;
  [(_UIDatePickerViewComponent *)self->_pickerView didChangeDateFrom:a3 animated:a4];
  self->_ignoresEmitValueChanged = 0;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  BOOL v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x10) != 0)
  {
    objc_super v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDatePicker;
    objc_super v5 = [(UIControl *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (BOOL)becomeFirstResponder
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(_UIDatePickerViewComponent *)self->_pickerView primaryFirstResponder],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v4 = v3;
    char v5 = [v3 becomeFirstResponder];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDatePicker;
    return [(UIView *)&v7 becomeFirstResponder];
  }
}

- (BOOL)resignFirstResponder
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(_UIDatePickerViewComponent *)self->_pickerView primaryFirstResponder],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v4 = v3;
    char v5 = [v3 resignFirstResponder];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDatePicker;
    return [(UIResponder *)&v7 resignFirstResponder];
  }
}

+ (void)_prepareStyleStorageIfNecessary
{
  if (_prepareStyleStorageIfNecessary_once != -1) {
    dispatch_once(&_prepareStyleStorageIfNecessary_once, &__block_literal_global_436);
  }
}

void __47__UIDatePicker__prepareStyleStorageIfNecessary__block_invoke()
{
  double v2 = objc_alloc_init(_UIDatePickerStyle_iOS);
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)__datePickerIdiomsToStyles;
  __datePickerIdiomsToStyles = v0;
}

+ (void)_registerStyle:(id)a3 forIdiom:(int64_t)a4
{
  id v6 = a3;
  [a1 _prepareStyleStorageIfNecessary];
  objc_super v7 = (void *)__datePickerIdiomsToStyles;
  id v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v6 forKey:v8];
}

+ (id)_styleForIdiom:(int64_t)a3
{
  BOOL v3 = (void *)__datePickerIdiomsToStyles;
  char v4 = [NSNumber numberWithInteger:a3];
  char v5 = [v3 objectForKey:v4];

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = objc_alloc_init(_UIDatePickerStyle_iOS);
  }
  objc_super v7 = v6;

  return v7;
}

- (void)_setCompactStyleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__compactStyleDelegate, a3);
  id v6 = self->_pickerView;
  char v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(_UIDatePickerViewComponent *)v6 didChangeCompactStyleDelegate];
  }
}

- (_UIDatePickerCompactStyleDelegate)_compactStyleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__compactStyleDelegate);
  return (_UIDatePickerCompactStyleDelegate *)WeakRetained;
}

- (void)_compactStyleSetActiveComponent:(int64_t)a3
{
  id v6 = self->_pickerView;
  char v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(_UIDatePickerViewComponent *)v6 setActiveComponent:a3];
  }
}

- (NSDictionary)_overrideCompactTextAttributes
{
  double v2 = self->_pickerView;
  BOOL v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v5 = [(_UIDatePickerViewComponent *)v2 overrideAttributes];
  }
  else
  {
    char v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (void)_setOverrideCompactTextAttributes:(id)a3
{
  id v7 = a3;
  char v4 = self->_pickerView;
  char v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(_UIDatePickerViewComponent *)v4 setOverrideAttributes:v7];
  }
}

- (void)_setDisplaysTimeZone:(BOOL)a3
{
  if (self->__displaysTimeZone != a3)
  {
    self->__displaysTimeZone = a3;
    char v5 = self->_pickerView;
    BOOL v3 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [(_UIDatePickerViewComponent *)v5 updateTimeZoneDisplay];
    }
  }
}

- (void)_setHidesLabels:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  [(_UIDatePickerViewComponent *)pickerView _setHidesLabels:v3];
}

- (NSDate)_dateUnderSelectionBar
{
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  [(_UIDatePickerViewComponent *)pickerView _updateDateOrTime];
  return [(UIDatePicker *)self date];
}

- (BOOL)_isTimeIntervalMode
{
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  return [(_UIDatePickerViewComponent *)pickerView _isTimeIntervalMode];
}

- (void)_setHighlightsToday:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  [(_UIDatePickerViewComponent *)pickerView setHighlightsToday:v3];
}

- (BOOL)_allowsZeroCountDownDuration
{
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  return [(_UIDatePickerViewComponent *)pickerView _allowsZeroCountDownDuration];
}

- (void)_setAllowsZeroCountDownDuration:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  [(_UIDatePickerViewComponent *)pickerView _setAllowsZeroCountDownDuration:v3];
}

- (BOOL)_allowsZeroTimeInterval
{
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  return [(_UIDatePickerViewComponent *)pickerView _allowsZeroTimeInterval];
}

- (void)_setAllowsZeroTimeInterval:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  [(_UIDatePickerViewComponent *)pickerView _setAllowsZeroTimeInterval:v3];
}

- (UIColor)_highlightColor
{
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  return (UIColor *)[(_UIDatePickerViewComponent *)pickerView _highlightColor];
}

- (void)_setHighlightColor:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  [(_UIDatePickerViewComponent *)pickerView _setHighlightColor:v5];
}

- (UIColor)_textColor
{
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  return (UIColor *)[(_UIDatePickerViewComponent *)pickerView _textColor];
}

- (void)_setTextColor:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  [(_UIDatePickerViewComponent *)pickerView _setTextColor:v4];
  [(_UIDatePickerDataModel *)self->_data setCustomTextColor:v4];

  id v6 = self->_pickerView;
  [(_UIDatePickerViewComponent *)v6 didReset];
}

- (UIColor)_textShadowColor
{
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  return (UIColor *)[(_UIDatePickerViewComponent *)pickerView _textShadowColor];
}

- (void)_setTextShadowColor:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  [(_UIDatePickerViewComponent *)pickerView _setTextShadowColor:v5];
}

- (UIColor)_magnifierLineColor
{
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  return (UIColor *)[(_UIDatePickerViewComponent *)pickerView _magnifierLineColor];
}

- (void)_setMagnifierLineColor:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    pickerView = self->_pickerView;
  }
  else {
    pickerView = 0;
  }
  [(_UIDatePickerViewComponent *)pickerView _setMagnifierLineColor:v5];
}

- (double)timeInterval
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  pickerView = self->_pickerView;
  [(_UIDatePickerViewComponent *)pickerView timeInterval];
  return result;
}

- (void)setTimeInterval:(double)a3
{
  if (objc_opt_respondsToSelector())
  {
    pickerView = self->_pickerView;
    [(_UIDatePickerViewComponent *)pickerView setTimeInterval:a3];
  }
}

- (id)_selectedTextForCalendarUnit:(unint64_t)a3
{
  return 0;
}

- (id)_labelTextForCalendarUnit:(unint64_t)a3
{
  return 0;
}

- (id)_lastSelectedDateComponents
{
  return [(_UIDatePickerDataModel *)self->_data lastSelectedDateComponents];
}

- (BOOL)_usesBlackChrome
{
  return 0;
}

- (BOOL)_drawsBackground
{
  return 1;
}

- (id)dateComponents
{
  double v2 = [(_UIDatePickerDataModel *)self->_data lastSelectedDateComponents];
  BOOL v3 = (void *)[v2 copy];

  return v3;
}

- (int)hour
{
  return 0;
}

- (int)minute
{
  return 0;
}

- (int)second
{
  return 0;
}

- (_UIDatePickerStyle)_style
{
  return self->_style;
}

- (UIDatePickerStyle)preferredDatePickerStyle
{
  return self->_preferredDatePickerStyle;
}

- (_UIDatePickerOverlayPresentation)_overlayPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__overlayPresentation);
  return (_UIDatePickerOverlayPresentation *)WeakRetained;
}

- (void)set_overlayPresentation:(id)a3
{
}

- (BOOL)_displaysTimeZone
{
  return self->__displaysTimeZone;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__overlayPresentation);
  objc_destroyWeak((id *)&self->__compactStyleDelegate);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
}

- (void)_performScrollTest:(id)a3 withIterations:(int64_t)a4 rowsToScroll:(int64_t)a5 inComponent:(int64_t)a6
{
  id v10 = a3;
  if (objc_opt_respondsToSelector()) {
    [(_UIDatePickerViewComponent *)self->_pickerView _performScrollTest:v10 withIterations:a4 rowsToScroll:a5 inComponent:a6];
  }
}

@end