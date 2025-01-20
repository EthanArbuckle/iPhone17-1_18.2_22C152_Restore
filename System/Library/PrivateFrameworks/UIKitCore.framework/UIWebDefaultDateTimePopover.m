@interface UIWebDefaultDateTimePopover
- (UIWebDateTimePopoverViewController)_webDateTimeViewController;
- (UIWebDefaultDateTimePopover)initWithDOMHTMLInputElement:(id)a3 datePickerMode:(int64_t)a4;
- (id)controlView;
- (void)clear:(id)a3;
- (void)controlBeginEditing;
- (void)dealloc;
- (void)set_webDateTimeViewController:(id)a3;
@end

@implementation UIWebDefaultDateTimePopover

- (void)clear:(id)a3
{
  WebThreadLock();
  v4 = [(UIWebRotatingNodePopover *)self node];
  [(DOMNode *)v4 _accessoryClear];
}

- (UIWebDefaultDateTimePopover)initWithDOMHTMLInputElement:(id)a3 datePickerMode:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)UIWebDefaultDateTimePopover;
  v6 = -[UIWebFormRotatingAccessoryPopover initWithDOMNode:](&v12, sel_initWithDOMNode_);
  if (v6)
  {
    [(UIWebDefaultDateTimePopover *)v6 set_webDateTimeViewController:[[UIWebDateTimePopoverViewController alloc] initWithDOMHTMLInputElement:a3 datePickerMode:a4]];
    objc_msgSend((id)-[UIWebFormControl _datePicker](-[UIWebDateTimePopoverViewController _innerWebDateTimeControl](v6->_webDateTimeViewController, "_innerWebDateTimeControl"), "_datePicker"), "_contentWidth");
    double v8 = v7;
    [[(UIViewController *)v6->_webDateTimeViewController view] frame];
    -[UIViewController setPreferredContentSize:](v6->_webDateTimeViewController, "setPreferredContentSize:", v8, v9);
    [(UIViewController *)v6->_webDateTimeViewController setEdgesForExtendedLayout:0];
    -[UIViewController setTitle:](v6->_webDateTimeViewController, "setTitle:", [a3 title]);
    v10 = [[UINavigationController alloc] initWithRootViewController:v6->_webDateTimeViewController];
    [(UINavigationItem *)[(UINavigationBar *)[(UINavigationController *)v10 navigationBar] topItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:_UINSLocalizedStringWithDefaultValue(@"Clear", @"Clear") style:1 target:v6 action:sel_clear_]];
    [(UIWebRotatingNodePopover *)v6 setPopoverController:[[UIPopoverController alloc] initWithContentViewController:v10]];
  }
  return v6;
}

- (void)dealloc
{
  [(UIWebDefaultDateTimePopover *)self set_webDateTimeViewController:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebDefaultDateTimePopover;
  [(UIWebRotatingNodePopover *)&v3 dealloc];
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  [(UIWebRotatingNodePopover *)self presentPopoverAnimated:0];
  objc_super v3 = [(UIWebDateTimePopoverViewController *)self->_webDateTimeViewController _innerWebDateTimeControl];
  [(UIWebFormControl *)v3 controlBeginEditing];
}

- (UIWebDateTimePopoverViewController)_webDateTimeViewController
{
  return self->_webDateTimeViewController;
}

- (void)set_webDateTimeViewController:(id)a3
{
}

@end