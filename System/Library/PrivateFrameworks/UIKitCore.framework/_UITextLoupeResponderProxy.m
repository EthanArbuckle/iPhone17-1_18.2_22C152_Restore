@interface _UITextLoupeResponderProxy
+ (id)_proxyWithResponder:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (UIResponder)responder;
- (_UITextLoupeResponderProxyDelegate)delegate;
- (id)nextResponder;
- (void)setDelegate:(id)a3;
@end

@implementation _UITextLoupeResponderProxy

- (void)setDelegate:(id)a3
{
}

+ (id)_proxyWithResponder:(id)a3
{
  id v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeWeak(v5 + 3, v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_responder);
}

- (id)nextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  return WeakRetained;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v7 = [(_UITextLoupeResponderProxy *)self delegate];
  LOBYTE(a3) = [v7 canPerformAction:a3 withSender:v6];

  return (char)a3;
}

- (UIResponder)responder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  return (UIResponder *)WeakRetained;
}

- (_UITextLoupeResponderProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITextLoupeResponderProxyDelegate *)WeakRetained;
}

@end