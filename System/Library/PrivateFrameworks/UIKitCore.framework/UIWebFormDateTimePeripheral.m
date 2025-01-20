@interface UIWebFormDateTimePeripheral
+ (id)createPeripheralWithDOMHTMLInputElement:(id)a3;
- (DOMHTMLInputElement)_inputElement;
- (UIWebFormControl)_control;
- (UIWebFormDateTimePeripheral)initWithDOMHTMLInputElement:(id)a3;
- (id)assistantView;
- (int64_t)_datePickerModeForInputType:(id)a3;
- (void)beginEditing;
- (void)dealloc;
- (void)endEditing;
- (void)set_control:(id)a3;
- (void)set_inputElement:(id)a3;
@end

@implementation UIWebFormDateTimePeripheral

- (int64_t)_datePickerModeForInputType:(id)a3
{
  if ([a3 isEqualToString:@"date"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"datetime-local"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"time"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"month"]) {
    return 4;
  }
  return -1;
}

- (UIWebFormDateTimePeripheral)initWithDOMHTMLInputElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIWebFormDateTimePeripheral;
  v4 = [(UIWebFormDateTimePeripheral *)&v10 init];
  v5 = v4;
  if (v4)
  {
    [(UIWebFormDateTimePeripheral *)v4 set_inputElement:a3];
    WebThreadLock();
    uint64_t v6 = [(UIWebFormDateTimePeripheral *)v5 _datePickerModeForInputType:[(DOMHTMLInputElement *)v5->_inputElement type]];
    if (v6 == -1)
    {

      return 0;
    }
    else
    {
      uint64_t v7 = v6;
      if (([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1)v8 = UIWebDefaultDateTimePopover; {
      else
      }
        v8 = UIWebDefaultDateTimePicker;
      -[UIWebFormDateTimePeripheral set_control:](v5, "set_control:", (id)[[v8 alloc] initWithDOMHTMLInputElement:a3 datePickerMode:v7]);
    }
  }
  return v5;
}

- (void)dealloc
{
  [(UIWebFormDateTimePeripheral *)self set_inputElement:0];
  [(UIWebFormDateTimePeripheral *)self set_control:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebFormDateTimePeripheral;
  [(UIWebFormDateTimePeripheral *)&v3 dealloc];
}

+ (id)createPeripheralWithDOMHTMLInputElement:(id)a3
{
  objc_super v3 = [[UIWebFormDateTimePeripheral alloc] initWithDOMHTMLInputElement:a3];
  return v3;
}

- (void)beginEditing
{
}

- (void)endEditing
{
}

- (id)assistantView
{
  return (id)[(UIWebFormControl *)self->_control controlView];
}

- (DOMHTMLInputElement)_inputElement
{
  return self->_inputElement;
}

- (void)set_inputElement:(id)a3
{
}

- (UIWebFormControl)_control
{
  return self->_control;
}

- (void)set_control:(id)a3
{
}

@end