@interface _UIDatePickerCalendarTimeView
- (BOOL)compactTimeLabel:(id)a3 shouldDismissForInteractionAtLocation:(CGPoint)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)roundsToMinuteInterval;
- (BOOL)shouldShowTimeLabel;
- (NSCalendar)calendar;
- (NSLocale)locale;
- (NSString)customFontDesign;
- (UILabel)timeLabel;
- (_UIDatePickerCalendarTime)selectedTime;
- (_UIDatePickerCalendarTimeView)initWithFrame:(CGRect)a3;
- (_UIDatePickerCalendarTimeViewDelegate)delegate;
- (_UIDatePickerCompactTimeLabel)timeTextField;
- (id)createDatePickerForCompactTimeLabel:(id)a3;
- (int64_t)minuteInterval;
- (void)_reload;
- (void)_reloadDateFormatters;
- (void)_setupViewHierarchy;
- (void)_updateClockLayout;
- (void)_updateFonts;
- (void)_updateTextFieldsFromSelectedDateComponents;
- (void)_updateTimeLabelTitleIfNeeded;
- (void)compactTimeLabel:(id)a3 didSelectTime:(id)a4;
- (void)compactTimeLabelDidBeginEditing:(id)a3;
- (void)compactTimeLabelDidEndEditing:(id)a3;
- (void)compactTimeLabelWillBecomeFirstResponder:(id)a3;
- (void)reloadWithCalendar:(id)a3 locale:(id)a4 selectedDate:(id)a5;
- (void)reloadWithCalendar:(id)a3 locale:(id)a4 selectedDate:(id)a5 followsSystemHourCycle:(BOOL)a6;
- (void)setCustomFontDesign:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMinuteInterval:(int64_t)a3;
- (void)setRoundsToMinuteInterval:(BOOL)a3;
- (void)setSelectedDate:(id)a3;
- (void)setShouldShowTimeLabel:(BOOL)a3;
- (void)tintColorDidChange;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIDatePickerCalendarTimeView

- (_UIDatePickerCalendarTimeView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UIDatePickerCalendarTimeView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = v3->_calendar;
    v3->_calendar = (NSCalendar *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    locale = v3->_locale;
    v3->_locale = (NSLocale *)v6;

    v3->_followsSystemHourCycle = 1;
    v3->_minuteInterval = 1;
    v8 = [_UIDatePickerCalendarTime alloc];
    v9 = objc_opt_new();
    uint64_t v10 = [(_UIDatePickerCalendarDateComponent *)v8 initWithDate:v9 calendar:v3->_calendar];
    selectedTime = v3->_selectedTime;
    v3->_selectedTime = (_UIDatePickerCalendarTime *)v10;

    [(_UIDatePickerCalendarTimeView *)v3 _setupViewHierarchy];
    [(_UIDatePickerCalendarTimeView *)v3 _reloadDateFormatters];
    [(_UIDatePickerCalendarTimeView *)v3 _updateTextFieldsFromSelectedDateComponents];
  }
  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerCalendarTimeView;
  -[UIView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  if (!a3)
  {
    v5 = [(_UIDatePickerCalendarTimeView *)self timeLabel];
    [v5 resignFirstResponder];

    [(_UIDatePickerOverlayPresentation *)self->_presentation dismissPresentationAnimated:0];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerCalendarTimeView;
  -[UIView willMoveToSuperview:](&v6, sel_willMoveToSuperview_);
  if (!a3)
  {
    v5 = [(_UIDatePickerCalendarTimeView *)self timeLabel];
    [v5 resignFirstResponder];

    [(_UIDatePickerOverlayPresentation *)self->_presentation dismissPresentationAnimated:0];
  }
}

- (void)_setupViewHierarchy
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v3 = [(_UIDatePickerCalendarTimeView *)self calendar];
  uint64_t v4 = [(_UIDatePickerCalendarTimeView *)self locale];
  v5 = +[_UIDatePickerCalendarTimeFormat formatWithCalendar:v3 locale:v4 followsSystemHourCycle:self->_followsSystemHourCycle];

  objc_super v6 = [[_UIDatePickerCompactTimeLabel alloc] initWithTimeFormat:v5 minuteInterval:[(_UIDatePickerCalendarTimeView *)self minuteInterval]];
  v7 = [[_UIDatePickerOverlayPresentation alloc] initWithSourceView:self];
  [(_UIDatePickerOverlayPresentation *)v7 setAlignment:5];
  [(_UIDatePickerOverlayPresentation *)v7 setOverlayAnchor:1];
  [(_UIDatePickerCompactTimeLabel *)v6 setOverlayPresentation:v7];
  [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_UIDatePickerCompactTimeLabel *)v6 setSelectionDelegate:self];
  LODWORD(v8) = 1148682240;
  [(UIView *)v6 setContentHuggingPriority:0 forAxis:v8];
  LODWORD(v9) = 1148682240;
  [(UIView *)v6 setContentCompressionResistancePriority:0 forAxis:v9];
  [(UIView *)self addSubview:v6];
  objc_storeStrong((id *)&self->_timeTextField, v6);
  presentation = self->_presentation;
  self->_presentation = v7;
  v11 = v7;

  v12 = objc_opt_new();
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v13) = 1144750080;
  [v12 setContentHuggingPriority:0 forAxis:v13];
  [(UIView *)self addSubview:v12];
  objc_storeStrong((id *)&self->_timeLabel, v12);
  [(_UIDatePickerCalendarTimeView *)self _updateTimeLabelTitleIfNeeded];
  [(_UIDatePickerCalendarTimeView *)self _updateFonts];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52___UIDatePickerCalendarTimeView__setupViewHierarchy__block_invoke;
  v19[3] = &unk_1E52EA848;
  v20 = v6;
  v21 = self;
  id v22 = v12;
  id v14 = v12;
  v15 = v6;
  v16 = objc_opt_new();
  __52___UIDatePickerCalendarTimeView__setupViewHierarchy__block_invoke((id *)v19, v16);
  [MEMORY[0x1E4F5B268] activateConstraints:v16];

  [(_UIDatePickerCalendarTimeView *)self _updateClockLayout];
  v23[0] = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v18 = [(UIView *)self registerForTraitChanges:v17 withAction:sel__updateFonts];
}

- (void)setShouldShowTimeLabel:(BOOL)a3
{
  self->_shouldShowTimeLabel = a3;
  [(_UIDatePickerCalendarTimeView *)self _updateClockLayout];
}

- (void)_updateClockLayout
{
  v24[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(_UIDatePickerCalendarTimeView *)self shouldShowTimeLabel];
  uint64_t v4 = [(_UIDatePickerCalendarTimeView *)self timeLabel];
  int v5 = [v4 isHidden];

  if (v3 == v5)
  {
    uint64_t v6 = [(_UIDatePickerCalendarTimeView *)self timeTextField];
    v7 = [(_UIDatePickerCalendarTimeView *)self timeLabel];
    [v7 setHidden:v3 ^ 1u];
    self->_showsTimeLabel = v3;
    if (self->_clockLayoutConstraints) {
      objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51___UIDatePickerCalendarTimeView__updateClockLayout__block_invoke;
    aBlock[3] = &unk_1E52EA870;
    char v23 = v3;
    id v21 = v7;
    id v22 = self;
    id v19 = v7;
    double v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    double v9 = (NSArray *)objc_opt_new();
    v8[2](v8, v6);
    v11 = uint64_t v10 = (void *)v6;
    [(NSArray *)v9 addObjectsFromArray:v11];

    v12 = [v10 trailingAnchor];
    double v13 = [(UIView *)self layoutMarginsGuide];
    id v14 = [v13 trailingAnchor];
    v15 = [v12 constraintEqualToAnchor:v14];
    v24[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [(NSArray *)v9 addObjectsFromArray:v16];

    clockLayoutConstraints = self->_clockLayoutConstraints;
    self->_clockLayoutConstraints = v9;
    id v18 = v9;

    [MEMORY[0x1E4F5B268] activateConstraints:self->_clockLayoutConstraints];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = self;
  v12.receiver = self;
  v12.super_class = (Class)_UIDatePickerCalendarTimeView;
  id v7 = a4;
  unsigned __int8 v8 = -[UIView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y);
  double v9 = [(_UIDatePickerCalendarTimeView *)v6 timeTextField];
  uint64_t v10 = [(_UIDatePickerCalendarTimeView *)v6 timeTextField];
  -[UIView convertPoint:toView:](v6, "convertPoint:toView:", v10, x, y);
  LOBYTE(v6) = objc_msgSend(v9, "pointInside:withEvent:", v7);

  return v8 | v6;
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerCalendarTimeView;
  [(UIView *)&v5 tintColorDidChange];
  int v3 = [(UIView *)self tintColor];
  uint64_t v4 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v4 setTintColor:v3];
}

- (void)setMinuteInterval:(int64_t)a3
{
  self->_minuteInterval = a3;
  -[_UIDatePickerCalendarTimeLabel setMinuteInterval:](self->_timeTextField, "setMinuteInterval:");
  id v5 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v5 setMinuteInterval:a3];
}

- (void)setRoundsToMinuteInterval:(BOOL)a3
{
  BOOL v3 = a3;
  self->_roundsToMinuteInterval = a3;
  -[_UIDatePickerCalendarTimeLabel setRoundsToMinuteInterval:](self->_timeTextField, "setRoundsToMinuteInterval:");
  id v5 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v5 setRoundsToMinuteInterval:v3];
}

- (void)_reloadDateFormatters
{
  BOOL v3 = [(_UIDatePickerCalendarTimeView *)self timeTextField];
  uint64_t v4 = [(_UIDatePickerCalendarTimeView *)self calendar];
  id v5 = [(_UIDatePickerCalendarTimeView *)self locale];
  [v3 reloadWithCalendar:v4 locale:v5 followsSystemHourCycle:self->_followsSystemHourCycle displaysTimeZone:0];

  [(_UIDatePickerCalendarTimeView *)self _updateClockLayout];
}

- (void)_reload
{
  [(_UIDatePickerCalendarTimeView *)self _updateClockLayout];
  BOOL v3 = [(_UIDatePickerCalendarTimeView *)self timeTextField];
  uint64_t v4 = [v3 selectedTime];
  selectedTime = self->_selectedTime;
  self->_selectedTime = v4;

  [(_UIDatePickerCalendarTimeView *)self _updateTextFieldsFromSelectedDateComponents];
}

- (void)reloadWithCalendar:(id)a3 locale:(id)a4 selectedDate:(id)a5
{
}

- (void)reloadWithCalendar:(id)a3 locale:(id)a4 selectedDate:(id)a5 followsSystemHourCycle:(BOOL)a6
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v19)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_UIDatePickerCalendarTimeView.m", 237, @"Invalid parameter not satisfying: %@", @"calendar" object file lineNumber description];
  }
  p_calendar = &self->_calendar;
  objc_storeStrong((id *)&self->_calendar, a3);
  v15 = v12;
  if (!v12)
  {
    v15 = [v19 locale];
  }
  p_locale = &self->_locale;
  objc_storeStrong((id *)&self->_locale, v15);
  if (!v12) {

  }
  self->_followsSystemHourCycle = a6;
  [(_UIDatePickerCalendarTimeView *)self _updateTimeLabelTitleIfNeeded];
  [(_UIDatePickerCalendarTimeView *)self _reloadDateFormatters];
  [(_UIDatePickerCalendarTimeView *)self setSelectedDate:v13];
  v17 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v17 setCalendar:*p_calendar];
  [v17 setLocale:*p_locale];
}

- (void)_updateTextFieldsFromSelectedDateComponents
{
  id v5 = [(_UIDatePickerCalendarTimeView *)self timeTextField];
  BOOL v3 = [(_UIDatePickerCalendarTimeView *)self selectedTime];
  uint64_t v4 = [v3 date];
  [v5 reloadWithDate:v4];
}

- (void)_updateTimeLabelTitleIfNeeded
{
  timeLocaleIdentifier = self->_timeLocaleIdentifier;
  uint64_t v4 = [(NSLocale *)self->_locale localeIdentifier];
  id v5 = timeLocaleIdentifier;
  uint64_t v6 = v4;
  if (v5 == v6)
  {

    id v12 = v5;
  }
  else
  {
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
    }
    else
    {
      char v9 = [(NSString *)v5 isEqual:v6];

      if (v9) {
        return;
      }
    }
    uint64_t v10 = [(NSLocale *)self->_locale localeIdentifier];
    v11 = self->_timeLocaleIdentifier;
    self->_timeLocaleIdentifier = v10;

    _UILocalizedStringWithDefaultValueInLanguage(@"ui.datepicker.time", self->_timeLocaleIdentifier, @"Time");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [(_UIDatePickerCalendarTimeView *)self timeLabel];
    [(NSString *)v5 setText:v12];
  }
}

- (void)setSelectedDate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDatePickerCalendarDateComponent *)[_UIDatePickerCalendarTime alloc] initWithDate:v4 calendar:self->_calendar];
  selectedTime = self->_selectedTime;
  self->_selectedTime = v5;
  id v7 = v5;

  [(_UIDatePickerCalendarTimeView *)self _updateTextFieldsFromSelectedDateComponents];
  id v8 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];

  [v8 setDate:v4];
}

- (void)setCustomFontDesign:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self->_customFontDesign;
  id v7 = (NSString *)v5;
  char v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(NSString *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_customFontDesign, a3);
    [(_UIDatePickerCalendarTimeView *)self _updateFonts];
  }
LABEL_9:
}

- (void)_updateFonts
{
  v27[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIView *)self traitCollection];
  id v4 = self->_customFontDesign;
  id v5 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleBody" compatibleWithTraitCollection:v3];
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 fontDescriptorWithDesign:v4];

    uint64_t v6 = (void *)v7;
  }
  uint64_t v8 = *(void *)off_1E52D6BA0;
  v26[0] = *(void *)off_1E52D6BA8;
  v26[1] = v8;
  v27[0] = &unk_1ED3F3AC8;
  v27[1] = &unk_1ED3F3AE0;
  char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  uint64_t v10 = *(void *)off_1E52D6B70;
  char v23 = v9;
  uint64_t v24 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v25 = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  id v13 = [v6 fontDescriptorByAddingAttributes:v12];

  id v14 = [off_1E52D39B8 fontWithDescriptor:v13 size:0.0];

  v15 = [(_UIDatePickerCalendarTimeView *)self timeTextField];
  [v15 setFont:v14];

  v16 = self->_customFontDesign;
  v17 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleBody" compatibleWithTraitCollection:v3];
  id v18 = v17;
  if (v16)
  {
    uint64_t v19 = [v17 fontDescriptorWithDesign:v16];

    id v18 = (void *)v19;
  }
  v20 = [v18 fontDescriptorWithSymbolicTraits:2];

  id v21 = [off_1E52D39B8 fontWithDescriptor:v20 size:0.0];

  id v22 = [(_UIDatePickerCalendarTimeView *)self timeLabel];
  [v22 setFont:v21];
}

- (void)compactTimeLabel:(id)a3 didSelectTime:(id)a4
{
  objc_storeStrong((id *)&self->_selectedTime, a4);
  id v6 = [(_UIDatePickerCalendarTimeView *)self delegate];
  id v5 = [(_UIDatePickerCalendarTimeView *)self selectedTime];
  [v6 timeView:self didSelectTime:v5];
}

- (void)compactTimeLabelWillBecomeFirstResponder:(id)a3
{
  id v4 = [(_UIDatePickerCalendarTimeView *)self delegate];
  [v4 timeViewWillBecomeFirstResponder:self];
}

- (void)compactTimeLabelDidBeginEditing:(id)a3
{
  id v4 = [(_UIDatePickerCalendarTimeView *)self delegate];
  [v4 timeViewDidBeginEditing:self];
}

- (void)compactTimeLabelDidEndEditing:(id)a3
{
  id v4 = [(_UIDatePickerCalendarTimeView *)self delegate];
  [v4 timeViewDidEndEditing:self];
}

- (BOOL)compactTimeLabel:(id)a3 shouldDismissForInteractionAtLocation:(CGPoint)a4
{
  return 1;
}

- (id)createDatePickerForCompactTimeLabel:(id)a3
{
  id v4 = [(_UIDatePickerCalendarTimeView *)self delegate];
  id v5 = [v4 createDatePickerForTimeView:self];

  return v5;
}

- (_UIDatePickerCalendarTimeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDatePickerCalendarTimeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)customFontDesign
{
  return self->_customFontDesign;
}

- (int64_t)minuteInterval
{
  return self->_minuteInterval;
}

- (BOOL)roundsToMinuteInterval
{
  return self->_roundsToMinuteInterval;
}

- (_UIDatePickerCalendarTime)selectedTime
{
  return self->_selectedTime;
}

- (BOOL)shouldShowTimeLabel
{
  return self->_shouldShowTimeLabel;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (_UIDatePickerCompactTimeLabel)timeTextField
{
  return self->_timeTextField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTextField, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_selectedTime, 0);
  objc_storeStrong((id *)&self->_customFontDesign, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_clockLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_timeLocaleIdentifier, 0);
}

@end