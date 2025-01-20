@interface SUScriptTextFieldNativeObjectUITextField
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (double)width;
- (id)_nativeObjectDelegate;
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

@implementation SUScriptTextFieldNativeObjectUITextField

- (int64_t)autocapitalizationType
{
  id v2 = [(SUScriptNativeObject *)self object];

  return [v2 autocapitalizationType];
}

- (int64_t)autocorrectionType
{
  id v2 = [(SUScriptNativeObject *)self object];

  return [v2 autocorrectionType];
}

- (BOOL)becomeFirstResponder
{
  id v2 = [(SUScriptNativeObject *)self object];

  return [v2 becomeFirstResponder];
}

- (void)destroyNativeObject
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextFieldNativeObjectUITextField;
  [(SUScriptTextFieldNativeObject *)&v3 destroyNativeObject];
}

- (int64_t)keyboardType
{
  id v2 = [(SUScriptNativeObject *)self object];

  return [v2 keyboardType];
}

- (id)_nativeObjectDelegate
{
  id v2 = [(SUScriptNativeObject *)self object];

  return (id)[v2 delegate];
}

- (BOOL)resignFirstResponder
{
  id v2 = [(SUScriptNativeObject *)self object];

  return [v2 resignFirstResponder];
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setAutocapitalizationType:a3];
}

- (void)setAutocorrectionType:(int64_t)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setAutocorrectionType:a3];
}

- (void)setKeyboardType:(int64_t)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setKeyboardType:a3];
}

- (void)_setNativeObjectDelegate:(id)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setDelegate:a3];
}

- (void)setPlaceholder:(id)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setPlaceholder:a3];
}

- (void)setupNativeObject
{
  id v3 = [(SUScriptNativeObject *)self object];
  [v3 addTarget:self action:sel__textDidChange_ forControlEvents:0x20000];
  [v3 addTarget:self action:sel__textDidEndEditingOnExit_ forControlEvents:0x80000];
  v4.receiver = self;
  v4.super_class = (Class)SUScriptTextFieldNativeObjectUITextField;
  [(SUScriptTextFieldNativeObject *)&v4 setupNativeObject];
}

- (void)setValue:(id)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setText:", a3);

  [(SUScriptTextFieldNativeObject *)self _sendScriptDidChange];
}

- (void)setWidth:(double)a3
{
  id v3 = [(SUScriptNativeObject *)self object];
  [v3 frame];
  objc_msgSend(v3, "setFrame:");
  objc_super v4 = (void *)[v3 superview];

  [v4 setNeedsLayout];
}

- (id)value
{
  id v2 = [(SUScriptNativeObject *)self object];

  return (id)[v2 text];
}

- (double)width
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "frame");
  return v2;
}

@end