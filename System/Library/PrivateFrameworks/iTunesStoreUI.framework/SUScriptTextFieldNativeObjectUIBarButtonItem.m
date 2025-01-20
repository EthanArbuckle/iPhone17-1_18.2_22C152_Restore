@interface SUScriptTextFieldNativeObjectUIBarButtonItem
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (double)width;
- (id)_nativeObjectDelegate;
- (id)_textField;
- (id)placeholder;
- (id)value;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardType;
- (void)_setNativeObjectDelegate:(id)a3;
- (void)destroyNativeObject;
- (void)setAutocapitalizationType:(int64_t)a3;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setValue:(id)a3;
- (void)setWidth:(double)a3;
- (void)setupNativeObject;
@end

@implementation SUScriptTextFieldNativeObjectUIBarButtonItem

- (id)_textField
{
  id v2 = [(SUScriptNativeObject *)self object];

  return (id)[v2 customView];
}

- (int64_t)autocapitalizationType
{
  id v2 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  return [v2 autocapitalizationType];
}

- (int64_t)autocorrectionType
{
  id v2 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  return [v2 autocorrectionType];
}

- (BOOL)becomeFirstResponder
{
  id v2 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  return [v2 becomeFirstResponder];
}

- (void)destroyNativeObject
{
  objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextFieldNativeObjectUIBarButtonItem;
  [(SUScriptTextFieldNativeObject *)&v3 destroyNativeObject];
}

- (int64_t)keyboardType
{
  id v2 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  return [v2 keyboardType];
}

- (id)_nativeObjectDelegate
{
  id v2 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  return (id)[v2 delegate];
}

- (id)placeholder
{
  id v2 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  return (id)[v2 placeholder];
}

- (BOOL)resignFirstResponder
{
  id v2 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  return [v2 resignFirstResponder];
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  id v4 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  [v4 setAutocapitalizationType:a3];
}

- (void)setAutocorrectionType:(int64_t)a3
{
  id v4 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  [v4 setAutocorrectionType:a3];
}

- (void)setKeyboardType:(int64_t)a3
{
  id v4 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  [v4 setKeyboardType:a3];
}

- (void)_setNativeObjectDelegate:(id)a3
{
  id v4 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  [v4 setDelegate:a3];
}

- (void)setPlaceholder:(id)a3
{
  id v4 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  [v4 setPlaceholder:a3];
}

- (void)setupNativeObject
{
  id v3 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];
  [v3 addTarget:self action:sel__textDidChange_ forControlEvents:0x20000];
  [v3 addTarget:self action:sel__textDidEndEditingOnExit_ forControlEvents:0x80000];
  v4.receiver = self;
  v4.super_class = (Class)SUScriptTextFieldNativeObjectUIBarButtonItem;
  [(SUScriptTextFieldNativeObject *)&v4 setupNativeObject];
}

- (void)setValue:(id)a3
{
  objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "setText:", a3);

  [(SUScriptTextFieldNativeObject *)self _sendScriptDidChange];
}

- (void)setWidth:(double)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setWidth:a3];
}

- (id)value
{
  id v2 = [(SUScriptTextFieldNativeObjectUIBarButtonItem *)self _textField];

  return (id)[v2 text];
}

- (double)width
{
  id v2 = [(SUScriptNativeObject *)self object];

  [v2 width];
  return result;
}

@end