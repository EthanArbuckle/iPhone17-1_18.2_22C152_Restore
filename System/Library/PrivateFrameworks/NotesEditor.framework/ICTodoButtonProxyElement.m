@interface ICTodoButtonProxyElement
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (ICBaseTextView)textView;
- (ICTodoButton)todoButton;
- (ICTodoButtonProxyElement)initWithTodoButton:(id)a3 inTextRange:(_NSRange)a4 textView:(id)a5;
- (_NSRange)textRange;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)setTextRange:(_NSRange)a3;
- (void)setTextView:(id)a3;
- (void)setTodoButton:(id)a3;
@end

@implementation ICTodoButtonProxyElement

- (ICTodoButtonProxyElement)initWithTodoButton:(id)a3 inTextRange:(_NSRange)a4 textView:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICTodoButtonProxyElement;
  v11 = [(ICTodoButtonProxyElement *)&v14 initWithAccessibilityContainer:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_todoButton, v9);
    v12->_textRange.NSUInteger location = location;
    v12->_textRange.NSUInteger length = length;
    objc_storeWeak((id *)&v12->_textView, v10);
  }

  return v12;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"checklist button" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(ICTodoButtonProxyElement *)self todoButton];
  int v3 = [v2 isDone];
  v4 = [MEMORY[0x263F086E0] mainBundle];
  v5 = v4;
  if (v3) {
    v6 = @"completed";
  }
  else {
    v6 = @"incomplete";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_26C10E100 table:0];

  return v7;
}

- (CGRect)accessibilityFrame
{
  v2 = [(ICTodoButtonProxyElement *)self todoButton];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)accessibilityActivate
{
  double v3 = [(ICTodoButtonProxyElement *)self textView];
  double v4 = [v3 editorController];
  double v5 = [v4 note];
  int v6 = [v5 isDeletedOrInTrash];

  if (!v6) {
    return 0;
  }
  double v7 = [(ICTodoButtonProxyElement *)self todoButton];
  char v8 = [v7 accessibilityActivate];

  return v8;
}

- (ICTodoButton)todoButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_todoButton);

  return (ICTodoButton *)WeakRetained;
}

- (void)setTodoButton:(id)a3
{
}

- (_NSRange)textRange
{
  p_textRange = &self->_textRange;
  NSUInteger location = self->_textRange.location;
  NSUInteger length = p_textRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (ICBaseTextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (ICBaseTextView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);

  objc_destroyWeak((id *)&self->_todoButton);
}

@end