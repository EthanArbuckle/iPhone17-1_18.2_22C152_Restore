@interface _UITextServicesResponderProxy
+ (id)_proxyWithResponder:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (UIResponder)responder;
- (_UITextServicesResponderProxyDelegate)delegate;
- (id)nextResponder;
- (void)_addShortcut:(id)a3;
- (void)_define:(id)a3;
- (void)_lookup:(id)a3;
- (void)_share:(id)a3;
- (void)_translate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UITextServicesResponderProxy

+ (id)_proxyWithResponder:(id)a3
{
  id v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeWeak(v5 + 3, v4);

  return v5;
}

- (id)nextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  return WeakRetained;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v7 = [(_UITextServicesResponderProxy *)self delegate];
  LOBYTE(a3) = [v7 canPerformAction:a3 withSender:v6];

  return (char)a3;
}

- (void)_share:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextServicesResponderProxy *)self delegate];
  [v5 _beginSessionWithType:8 sender:v4];
}

- (void)_addShortcut:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextServicesResponderProxy *)self delegate];
  [v5 _beginSessionWithType:4 sender:v4];
}

- (void)_define:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextServicesResponderProxy *)self delegate];
  [v5 _beginSessionWithType:2 sender:v4];
}

- (void)_lookup:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextServicesResponderProxy *)self delegate];
  [v5 _beginSessionWithType:16 sender:v4];
}

- (void)_translate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextServicesResponderProxy *)self delegate];
  [v5 _beginSessionWithType:32 sender:v4];
}

- (UIResponder)responder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  return (UIResponder *)WeakRetained;
}

- (_UITextServicesResponderProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITextServicesResponderProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_responder);
}

@end