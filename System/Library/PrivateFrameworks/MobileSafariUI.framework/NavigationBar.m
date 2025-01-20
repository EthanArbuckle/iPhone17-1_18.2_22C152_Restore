@interface NavigationBar
- (UnifiedField)textField;
- (double)placeholderHorizontalInset;
- (id)newTextField;
- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4;
- (void)setTextFieldPlaceHolderColor:(id)a3;
@end

@implementation NavigationBar

- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  BOOL v6 = a3;
  if (a3 && ![(_SFNavigationBar *)self isExpanded])
  {
    v8 = [(NavigationBar *)self textField];
    [v8 setReflectedItem:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)NavigationBar;
  -[_SFNavigationBar setExpanded:textFieldSelectionRange:completionHandler:](&v9, sel_setExpanded_textFieldSelectionRange_completionHandler_, v6, location, length, 0);
}

- (double)placeholderHorizontalInset
{
  v2 = [(NavigationBar *)self textField];
  [v2 placeholderHorizontalInset];
  double v4 = v3;

  return v4;
}

- (void)setTextFieldPlaceHolderColor:(id)a3
{
  id v4 = a3;
  id v5 = [(NavigationBar *)self textField];
  [v5 setPlaceholderColor:v4];
}

- (UnifiedField)textField
{
  v4.receiver = self;
  v4.super_class = (Class)NavigationBar;
  v2 = [(_SFNavigationBar *)&v4 textField];
  return (UnifiedField *)v2;
}

- (id)newTextField
{
  return objc_alloc_init(UnifiedField);
}

@end