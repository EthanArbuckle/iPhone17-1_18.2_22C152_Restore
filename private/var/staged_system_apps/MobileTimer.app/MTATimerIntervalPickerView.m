@interface MTATimerIntervalPickerView
- (BOOL)isSelectedDurationValid;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTATimerIntervalPickerView)initWithFrame:(CGRect)a3;
- (MTATimerIntervalPickerViewDelegate)delegate;
- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (double)selectedDuration;
- (id)_hoursStringForHour:(int64_t)a3;
- (id)_labelForComponent:(int64_t)a3 createIfNecessary:(BOOL)a4;
- (id)_makeNewComponentLabel;
- (id)_minutesStringForMinutes:(int64_t)a3;
- (id)_secondsStringForSeconds:(int64_t)a3;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_fadeLabelForComponent:(int64_t)a3 toText:(id)a4 animated:(BOOL)a5;
- (void)_positionLabel:(id)a3 forComponent:(int64_t)a4;
- (void)_setLabel:(id)a3 forComponent:(int64_t)a4;
- (void)_updateLabels:(BOOL)a3;
- (void)layoutSubviews;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
@end

@implementation MTATimerIntervalPickerView

- (MTATimerIntervalPickerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTATimerIntervalPickerView;
  v3 = -[MTATimerIntervalPickerView initWithFrame:](&v7, "initWithFrame:", 0.0, 0.0, 320.0, 216.0);
  if (v3)
  {
    v4 = [objc_alloc((Class)UIPickerView) initWithFrame:0.0, 0.0, 320.0, 216.0];
    timePicker = v3->_timePicker;
    v3->_timePicker = v4;

    [(UIPickerView *)v3->_timePicker setDataSource:v3];
    [(UIPickerView *)v3->_timePicker setDelegate:v3];
    [(MTATimerIntervalPickerView *)v3 addSubview:v3->_timePicker];
  }
  return v3;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MTATimerIntervalPickerView;
  [(MTATimerIntervalPickerView *)&v6 layoutSubviews];
  [(MTATimerIntervalPickerView *)self frame];
  double v4 = v3 * 0.5 + -160.0;
  [(MTATimerIntervalPickerView *)self frame];
  -[UIPickerView setFrame:](self->_timePicker, "setFrame:", v4, v5 * 0.5 + -108.0, 320.0, 216.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 320.0;
  double v4 = 216.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 3;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t v4 = 60;
  if ((unint64_t)a4 >= 3) {
    int64_t v4 = 0;
  }
  if (a4) {
    return v4;
  }
  else {
    return 24;
  }
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v9 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = (MTATimerIntervalPickerCell *)v9;
  }
  else {
    v10 = objc_alloc_init(MTATimerIntervalPickerCell);
  }
  v11 = v10;
  v12 = [(MTATimerIntervalPickerCell *)v10 textLabel];
  [v12 setTextAlignment:2];

  v13 = +[UIFont systemFontOfSize:22.0];
  v14 = [(MTATimerIntervalPickerCell *)v11 textLabel];
  [v14 setFont:v13];

  [(MTATimerIntervalPickerView *)self pickerView:self->_timePicker widthForComponent:a5];
  double v16 = v15;
  [(MTATimerIntervalPickerView *)self pickerView:self->_timePicker rowHeightForComponent:a5];
  -[MTATimerIntervalPickerCell setFrame:](v11, "setFrame:", 0.0, 0.0, v16, v17);
  v18 = +[UIColor mtui_primaryTextColor];
  v19 = +[NSNumber numberWithInteger:a4];
  v20 = +[NSNumberFormatter localizedStringFromNumber:v19 numberStyle:0];

  id v21 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v26 = NSForegroundColorAttributeName;
  v27 = v18;
  v22 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  id v23 = [v21 initWithString:v20 attributes:v22];

  v24 = [(MTATimerIntervalPickerCell *)v11 textLabel];
  [v24 setAttributedText:v23];

  return v11;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  -[MTATimerIntervalPickerView _updateLabels:](self, "_updateLabels:", 1, a4, a5);
  uint64_t v6 = [(MTATimerIntervalPickerView *)self delegate];
  if (v6)
  {
    objc_super v7 = (void *)v6;
    v8 = [(MTATimerIntervalPickerView *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(MTATimerIntervalPickerView *)self delegate];
      [(MTATimerIntervalPickerView *)self selectedDuration];
      [v10 pickerView:didChangeSelectedDuration:self];
    }
  }
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  [(UIPickerView *)self->_timePicker bounds];
  double result = v4 / 3.0;
  if (v4 / 3.0 > 105.0) {
    return 105.0;
  }
  return result;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 32.0;
}

- (void)_updateLabels:(BOOL)a3
{
  BOOL v3 = a3;
  NSInteger v5 = [(UIPickerView *)self->_timePicker selectedRowInComponent:0];
  NSInteger v6 = [(UIPickerView *)self->_timePicker selectedRowInComponent:1];
  NSInteger v7 = [(UIPickerView *)self->_timePicker selectedRowInComponent:2];
  v8 = [(MTATimerIntervalPickerView *)self _hoursStringForHour:v5];
  [(MTATimerIntervalPickerView *)self _fadeLabelForComponent:0 toText:v8 animated:v3];

  char v9 = [(MTATimerIntervalPickerView *)self _minutesStringForMinutes:v6];
  [(MTATimerIntervalPickerView *)self _fadeLabelForComponent:1 toText:v9 animated:v3];

  id v10 = [(MTATimerIntervalPickerView *)self _secondsStringForSeconds:v7];
  [(MTATimerIntervalPickerView *)self _fadeLabelForComponent:2 toText:v10 animated:v3];
}

- (id)_makeNewComponentLabel
{
  id v2 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  BOOL v3 = +[UIFont boldSystemFontOfSize:17.0];
  [v2 setFont:v3];

  double v4 = +[UIColor mtui_primaryTextColor];
  [v2 setTextColor:v4];

  [v2 setTextAlignment:4];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v2;
}

- (id)_labelForComponent:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  switch(a3)
  {
    case 2:
      p_secondsLabel = &self->_secondsLabel;
      secondsLabel = self->_secondsLabel;
      if (secondsLabel) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = !a4;
      }
      if (v11) {
        goto LABEL_20;
      }
      v8 = -[MTATimerIntervalPickerView _secondsStringForSeconds:](self, "_secondsStringForSeconds:", 0, a4);
      char v9 = self;
      uint64_t v10 = 2;
      goto LABEL_19;
    case 1:
      p_secondsLabel = &self->_minutesLabel;
      secondsLabel = self->_minutesLabel;
      if (secondsLabel) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = !a4;
      }
      if (v12) {
        goto LABEL_20;
      }
      v8 = -[MTATimerIntervalPickerView _minutesStringForMinutes:](self, "_minutesStringForMinutes:", 0, a4);
      char v9 = self;
      uint64_t v10 = 1;
      goto LABEL_19;
    case 0:
      p_secondsLabel = &self->_hoursLabel;
      secondsLabel = self->_hoursLabel;
      if (secondsLabel) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = !a4;
      }
      if (v7) {
        goto LABEL_20;
      }
      v8 = -[MTATimerIntervalPickerView _hoursStringForHour:](self, "_hoursStringForHour:", 0, a4);
      char v9 = self;
      uint64_t v10 = 0;
LABEL_19:
      [(MTATimerIntervalPickerView *)v9 _fadeLabelForComponent:v10 toText:v8 animated:0];

      secondsLabel = *p_secondsLabel;
LABEL_20:
      v13 = secondsLabel;
      goto LABEL_22;
  }
  v13 = 0;
LABEL_22:

  return v13;
}

- (void)_setLabel:(id)a3 forComponent:(int64_t)a4
{
  id v7 = a3;
  if ((unint64_t)a4 <= 2)
  {
    id v8 = v7;
    objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *(&off_1000A2188)[a4]), a3);
    id v7 = v8;
  }
}

- (void)_positionLabel:(id)a3 forComponent:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [(MTATimerIntervalPickerView *)self mtui_isRTL];
  if (a4 == 2)
  {
    BOOL v10 = v7 == 0;
    double v8 = 271.0;
    double v11 = 283.0;
  }
  else if (a4 == 1)
  {
    BOOL v10 = v7 == 0;
    double v8 = 161.0;
    double v11 = 173.0;
  }
  else
  {
    double v9 = 0.0;
    if (a4) {
      goto LABEL_10;
    }
    BOOL v10 = v7 == 0;
    double v8 = 51.0;
    double v11 = 69.0;
  }
  if (v10) {
    double v9 = v8;
  }
  else {
    double v9 = v11;
  }
LABEL_10:
  LODWORD(v8) = 1148846080;
  [v6 setContentHuggingPriority:0 forAxis:v8];
  LODWORD(v12) = 1148846080;
  [v6 setContentCompressionResistancePriority:0 forAxis:v12];
  v13 = [v6 leadingAnchor];
  v14 = [(UIPickerView *)self->_timePicker leadingAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14 constant:v9];
  v20[0] = v15;
  double v16 = [v6 centerYAnchor];

  double v17 = [(UIPickerView *)self->_timePicker centerYAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:1.0];
  v20[1] = v18;
  v19 = +[NSArray arrayWithObjects:v20 count:2];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)_fadeLabelForComponent:(int64_t)a3 toText:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(MTATimerIntervalPickerView *)self _labelForComponent:a3 createIfNecessary:0];
  BOOL v10 = [v9 text];
  unsigned __int8 v11 = [v10 isEqualToString:v8];

  id v12 = v9;
  if ((v11 & 1) == 0)
  {
    if (v5)
    {
      v13 = [(MTATimerIntervalPickerView *)self _makeNewComponentLabel];

      [v13 setText:v8];
      [(MTATimerIntervalPickerView *)self addSubview:v13];
      [(MTATimerIntervalPickerView *)self _positionLabel:v13 forComponent:a3];
      [v13 setAlpha:0.0];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10005AC7C;
      v18[3] = &unk_1000A1428;
      id v19 = v9;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10005AC88;
      v16[3] = &unk_1000A19B8;
      id v17 = v19;
      +[UIView animateWithDuration:0x10000 delay:v18 options:v16 animations:0.2 completion:0.0];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10005AC90;
      v14[3] = &unk_1000A1428;
      id v12 = v13;
      id v15 = v12;
      +[UIView animateWithDuration:0x20000 delay:v14 options:0 animations:0.2 completion:0.0];
    }
    else
    {
      id v12 = v9;
      if (!v9)
      {
        id v12 = [(MTATimerIntervalPickerView *)self _makeNewComponentLabel];
        [(MTATimerIntervalPickerView *)self addSubview:v12];
      }
      [v12 setText:v8];
      [(MTATimerIntervalPickerView *)self _positionLabel:v12 forComponent:a3];
    }
  }
  [(MTATimerIntervalPickerView *)self _setLabel:v12 forComponent:a3];
}

- (BOOL)isSelectedDurationValid
{
  NSInteger v3 = [(UIPickerView *)self->_timePicker selectedRowInComponent:0];
  NSInteger v4 = [(UIPickerView *)self->_timePicker selectedRowInComponent:1];
  return (v3 | v4 | [(UIPickerView *)self->_timePicker selectedRowInComponent:2]) != 0;
}

- (void)setDuration:(double)a3
{
  if (a3 < 0.0 || a3 > 86399.0)
  {
    BOOL v5 = MTLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006D52C((uint64_t)self, v5, a3);
    }
  }
  else
  {
    [(UIPickerView *)self->_timePicker selectRow:(uint64_t)(a3 / 3600.0) inComponent:0 animated:0];
    [(UIPickerView *)self->_timePicker selectRow:(int)(((__int16)((34953 * ((int)(uint64_t)a3 % 3600)) >> 16) >> 5)+ ((((int)(uint64_t)a3 % 3600 + ((-30583 * ((int)(uint64_t)a3 % 3600)) >> 16)) & 0x8000) >> 15)) inComponent:1 animated:0];
    [(UIPickerView *)self->_timePicker selectRow:(uint64_t)a3 % 60 inComponent:2 animated:0];
    [(MTATimerIntervalPickerView *)self _updateLabels:1];
  }
}

- (double)selectedDuration
{
  double v3 = (double)(3600 * [(UIPickerView *)self->_timePicker selectedRowInComponent:0]);
  double v4 = v3 + (double)(60 * [(UIPickerView *)self->_timePicker selectedRowInComponent:1]);
  return v4 + (double)[(UIPickerView *)self->_timePicker selectedRowInComponent:2];
}

- (id)_hoursStringForHour:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = v3;
    CFStringRef v5 = @"hour[singular]";
  }
  else if (a3)
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = v3;
    CFStringRef v5 = @"hour[plural]";
  }
  else
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = v3;
    CFStringRef v5 = @"hour[zero]";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1000A2560 table:0];

  return v6;
}

- (id)_minutesStringForMinutes:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = v3;
    CFStringRef v5 = @"min[singular]";
  }
  else if (a3)
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = v3;
    CFStringRef v5 = @"min[plural]";
  }
  else
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = v3;
    CFStringRef v5 = @"min[zero]";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1000A2560 table:0];

  return v6;
}

- (id)_secondsStringForSeconds:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = v3;
    CFStringRef v5 = @"sec[singular]";
  }
  else if (a3)
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = v3;
    CFStringRef v5 = @"sec[plural]";
  }
  else
  {
    double v3 = +[NSBundle mainBundle];
    double v4 = v3;
    CFStringRef v5 = @"sec[zero]";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1000A2560 table:0];

  return v6;
}

- (MTATimerIntervalPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTATimerIntervalPickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondsLabel, 0);
  objc_storeStrong((id *)&self->_minutesLabel, 0);
  objc_storeStrong((id *)&self->_hoursLabel, 0);

  objc_storeStrong((id *)&self->_timePicker, 0);
}

@end