@interface SUScriptTextFieldNativeObject
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (NSString)placeholder;
- (NSString)value;
- (double)width;
- (id)_nativeObjectDelegate;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardType;
- (void)_sendScriptDidChange;
- (void)_textDidChange:(id)a3;
- (void)_textDidEndEditingOnExit:(id)a3;
- (void)dealloc;
- (void)destroyNativeObject;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setupNativeObject;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation SUScriptTextFieldNativeObject

- (void)dealloc
{
  [(SUScriptTextFieldDelegate *)self->_textFieldDelegate removeDelegate:self];

  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextFieldNativeObject;
  [(SUScriptTextFieldNativeObject *)&v3 dealloc];
}

- (int64_t)autocapitalizationType
{
  return 0;
}

- (int64_t)autocorrectionType
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return 0;
}

- (int64_t)keyboardType
{
  return 0;
}

- (NSString)placeholder
{
  return 0;
}

- (BOOL)resignFirstResponder
{
  return 1;
}

- (NSString)value
{
  return 0;
}

- (double)width
{
  return 0.0;
}

- (void)destroyNativeObject
{
  [(SUScriptTextFieldDelegate *)self->_textFieldDelegate removeDelegate:self];
  if (![(SUScriptTextFieldDelegate *)self->_textFieldDelegate numberOfDelegates]
    && [(SUScriptTextFieldNativeObject *)self _nativeObjectDelegate] == self->_textFieldDelegate)
  {
    [(SUScriptTextFieldNativeObject *)self _setNativeObjectDelegate:0];
  }

  self->_textFieldDelegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextFieldNativeObject;
  [(SUScriptNativeObject *)&v3 destroyNativeObject];
}

- (void)setupNativeObject
{
  [(SUScriptTextFieldDelegate *)self->_textFieldDelegate removeDelegate:self];

  self->_textFieldDelegate = 0;
  id v3 = [(SUScriptTextFieldNativeObject *)self _nativeObjectDelegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = (SUScriptTextFieldDelegate *)v3;
  }
  else {
    v4 = objc_alloc_init(SUScriptTextFieldDelegate);
  }
  self->_textFieldDelegate = v4;
  [(SUScriptTextFieldDelegate *)v4 addDelegate:self];
  [(SUScriptTextFieldNativeObject *)self _setNativeObjectDelegate:self->_textFieldDelegate];
  v5.receiver = self;
  v5.super_class = (Class)SUScriptTextFieldNativeObject;
  [(SUScriptNativeObject *)&v5 setupNativeObject];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  v4 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v4 dispatchEvent:0 forName:@"change"];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"submit"];
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  return [(SUScriptObject *)v3 canBecomeFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"focus"];
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"blur"];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"focus"];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"blur"];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  return [(SUScriptObject *)v3 canBecomeFirstResponder];
}

- (void)_textDidChange:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"change"];
}

- (void)_textDidEndEditingOnExit:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"submit"];
}

- (id)_nativeObjectDelegate
{
  return 0;
}

- (void)_sendScriptDidChange
{
  if (objc_opt_respondsToSelector())
  {
    textFieldDelegate = self->_textFieldDelegate;
    id v4 = [(SUScriptNativeObject *)self object];
    [(SUScriptTextFieldDelegate *)textFieldDelegate scriptDidChangeTextForField:v4];
  }
}

@end