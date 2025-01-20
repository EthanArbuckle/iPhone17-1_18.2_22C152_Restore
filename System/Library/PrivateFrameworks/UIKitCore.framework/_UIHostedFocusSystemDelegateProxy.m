@interface _UIHostedFocusSystemDelegateProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (_UIHostedFocusSystemDelegate)delegate;
- (_UIHostedFocusSystemDelegateProxy)initWithFocusSystem:(id)a3 delegate:(id)a4;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
@end

@implementation _UIHostedFocusSystemDelegateProxy

- (_UIHostedFocusSystemDelegateProxy)initWithFocusSystem:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_UIHostedFocusSystemDelegateProxy;
  v7 = [(_UIHostedFocusSystemDelegateProxy *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_focusSystem = (_UIHostedFocusSystem *)a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(_UIHostedFocusSystem *)self->_focusSystem _hostFocusSystem];
    v7 = [v6 delegate];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = [v8 methodSignatureForSelector:a3];
  }
  else
  {
    v8 = [(_UIHostedFocusSystem *)self->_focusSystem _hostFocusSystem];
    objc_super v10 = [v8 delegate];
    v9 = [v10 methodSignatureForSelector:a3];
  }
  return v9;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = objc_loadWeakRetained((id *)p_delegate);
  }
  else
  {
    v8 = [(_UIHostedFocusSystem *)self->_focusSystem _hostFocusSystem];
    char v7 = [v8 delegate];
  }
  return v7;
}

- (_UIHostedFocusSystemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIHostedFocusSystemDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end