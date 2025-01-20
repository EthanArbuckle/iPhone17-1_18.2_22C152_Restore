@interface UIWebDateTimePopoverViewController
- (UIWebDateTimePopoverViewController)initWithDOMHTMLInputElement:(id)a3 datePickerMode:(int64_t)a4;
- (UIWebFormControl)_innerWebDateTimeControl;
- (void)dealloc;
- (void)loadView;
- (void)set_innerWebDateTimeControl:(id)a3;
@end

@implementation UIWebDateTimePopoverViewController

- (UIWebDateTimePopoverViewController)initWithDOMHTMLInputElement:(id)a3 datePickerMode:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIWebDateTimePopoverViewController;
  v6 = [(UIViewController *)&v8 init];
  if (v6) {
    [(UIWebDateTimePopoverViewController *)v6 set_innerWebDateTimeControl:[[UIWebDefaultDateTimePicker alloc] initWithDOMHTMLInputElement:a3 datePickerMode:a4]];
  }
  return v6;
}

- (void)dealloc
{
  [(UIWebDateTimePopoverViewController *)self set_innerWebDateTimeControl:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebDateTimePopoverViewController;
  [(UIViewController *)&v3 dealloc];
}

- (void)loadView
{
  uint64_t v3 = [(UIWebFormControl *)self->_innerWebDateTimeControl controlView];
  [(UIViewController *)self setView:v3];
}

- (UIWebFormControl)_innerWebDateTimeControl
{
  return self->_innerWebDateTimeControl;
}

- (void)set_innerWebDateTimeControl:(id)a3
{
}

@end