@interface UIWebDefaultDateTimePicker
- (DOMHTMLInputElement)_inputElement;
- (UIDatePicker)_datePicker;
- (UIWebDefaultDateTimePicker)initWithDOMHTMLInputElement:(id)a3 datePickerMode:(int64_t)a4;
- (id)_sanitizeInputValueForFormatter:(id)a3;
- (id)controlView;
- (int64_t)_timeZoneOffsetFromGMT:(id)a3;
- (void)_dateChanged;
- (void)_dateChangedSetAsNumber;
- (void)_dateChangedSetAsString;
- (void)controlBeginEditing;
- (void)dealloc;
- (void)set_datePicker:(id)a3;
- (void)set_inputElement:(id)a3;
@end

@implementation UIWebDefaultDateTimePicker

- (int64_t)_timeZoneOffsetFromGMT:(id)a3
{
  if (!self->_shouldRemoveTimeZoneInformation) {
    return 0;
  }
  v4 = [(UIDatePicker *)self->_datePicker timeZone];
  return [(NSTimeZone *)v4 secondsFromGMTForDate:a3];
}

- (void)_dateChangedSetAsNumber
{
  v3 = [(UIDatePicker *)self->_datePicker date];
  [(NSDate *)v3 timeIntervalSince1970];
  double v5 = (v4 + (double)[(UIWebDefaultDateTimePicker *)self _timeZoneOffsetFromGMT:v3])
     * 1000.0;
  WebThreadLock();
  inputElement = self->_inputElement;
  [(DOMHTMLInputElement *)inputElement setValueAsNumberWithChangeEvent:v5];
}

- (void)_dateChangedSetAsString
{
  v3 = [(UIDatePicker *)self->_datePicker date];
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend(v4, "setTimeZone:", -[UIDatePicker timeZone](self->_datePicker, "timeZone"));
  [v4 setDateFormat:self->_formatString];
  [v4 setLocale:v6];
  uint64_t v5 = [v4 stringFromDate:v3];
  WebThreadLock();
  [(DOMHTMLInputElement *)self->_inputElement setValueWithChangeEvent:v5];
}

- (void)_dateChanged
{
  if (self->_formatString) {
    [(UIWebDefaultDateTimePicker *)self _dateChangedSetAsString];
  }
  else {
    [(UIWebDefaultDateTimePicker *)self _dateChangedSetAsNumber];
  }
}

- (UIWebDefaultDateTimePicker)initWithDOMHTMLInputElement:(id)a3 datePickerMode:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)UIWebDefaultDateTimePicker;
  id v6 = [(UIWebDefaultDateTimePicker *)&v13 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  [(UIWebDefaultDateTimePicker *)v6 set_inputElement:a3];
  v8 = [(DOMHTMLInputElement *)v7->_inputElement type];
  *(_WORD *)&v7->_shouldRemoveTimeZoneInformation = 0;
  v7->_formatString = 0;
  if ([(NSString *)v8 isEqualToString:@"date"])
  {
    v9 = @"yyyy-MM-dd";
LABEL_6:
    v7->_formatString = &v9->isa;
    goto LABEL_7;
  }
  if ([(NSString *)v8 isEqualToString:@"month"])
  {
    v9 = @"yyyy-MM";
    goto LABEL_6;
  }
  if ([(NSString *)v8 isEqualToString:@"time"])
  {
    v7->_formatString = (NSString *)@"HH:mm";
    v7->_isTimeInput = 1;
  }
  else
  {
    v7->_shouldRemoveTimeZoneInformation = [(NSString *)v8 isEqualToString:@"datetime-local"];
  }
LABEL_7:
  if (([+[UIDevice currentDevice](UIDevice, "currentDevice") userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1)+[UIPickerView defaultSizeForCurrentOrientation]; {
  else
  }
    +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", [(id)UIApp _defaultSceneInterfaceOrientationReturningUnknownForNilScene:0]);
  -[UIWebDefaultDateTimePicker set_datePicker:](v7, "set_datePicker:", -[UIDatePicker initWithFrame:]([UIDatePicker alloc], "initWithFrame:", 0.0, 0.0, v10, v11));
  [(UIDatePicker *)v7->_datePicker setDatePickerMode:a4];
  [(UIView *)v7->_datePicker setHidden:0];
  [(UIControl *)v7->_datePicker addTarget:v7 action:sel__dateChangeHandler_ forControlEvents:4096];
  return v7;
}

- (void)dealloc
{
  [(UIControl *)self->_datePicker removeTarget:self action:0 forControlEvents:4096];
  [(UIWebDefaultDateTimePicker *)self set_inputElement:0];
  [(UIWebDefaultDateTimePicker *)self set_datePicker:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebDefaultDateTimePicker;
  [(UIWebDefaultDateTimePicker *)&v3 dealloc];
}

- (id)controlView
{
  return self->_datePicker;
}

- (id)_sanitizeInputValueForFormatter:(id)a3
{
  if (!self->_isTimeInput) {
    return a3;
  }
  uint64_t v4 = [@"HH:mm" length];
  return (id)[a3 substringToIndex:v4];
}

- (void)controlBeginEditing
{
  -[UIDatePicker setTimeZone:](self->_datePicker, "setTimeZone:", [MEMORY[0x1E4F1CAF0] localTimeZone]);
  objc_super v3 = [(DOMHTMLInputElement *)self->_inputElement value];
  if ([(NSString *)v3 length])
  {
    if (self->_formatString)
    {
      id v4 = [(UIWebDefaultDateTimePicker *)self _sanitizeInputValueForFormatter:v3];
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
      id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      objc_msgSend(v12, "setTimeZone:", -[UIDatePicker timeZone](self->_datePicker, "timeZone"));
      [v12 setDateFormat:self->_formatString];
      [v12 setLocale:v5];
      uint64_t v6 = [v12 dateFromString:v4];
      if (!v6) {
        uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
      }
      [(UIDatePicker *)self->_datePicker setDate:v6];
    }
    else
    {
      [(DOMHTMLInputElement *)self->_inputElement valueAsNumber];
      double v8 = v7 / 1000.0;
      uint64_t v9 = -[UIWebDefaultDateTimePicker _timeZoneOffsetFromGMT:](self, "_timeZoneOffsetFromGMT:", [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7 / 1000.0]);
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v8 - (double)v9];
      datePicker = self->_datePicker;
      [(UIDatePicker *)datePicker setDate:v10];
    }
  }
  else
  {
    -[UIDatePicker setDate:](self->_datePicker, "setDate:", [MEMORY[0x1E4F1C9C8] date]);
    [(UIWebDefaultDateTimePicker *)self _dateChanged];
  }
}

- (DOMHTMLInputElement)_inputElement
{
  return self->_inputElement;
}

- (void)set_inputElement:(id)a3
{
}

- (UIDatePicker)_datePicker
{
  return self->_datePicker;
}

- (void)set_datePicker:(id)a3
{
}

@end