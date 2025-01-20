@interface UIInputViewControllerInterface
- (UIInputViewControllerInterface)init;
- (_UIIVCInterface)forwardingInterface;
- (_UIIVCResponseDelegate)responseDelegate;
- (_UIInputViewControllerState)_cachedState;
- (void)_setCachedState:(id)a3;
- (void)dealloc;
- (void)setForwardingInterface:(id)a3;
- (void)setResponseDelegate:(id)a3;
- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4;
@end

@implementation UIInputViewControllerInterface

- (UIInputViewControllerInterface)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIInputViewControllerInterface;
  v2 = [(UIInputViewControllerInterface *)&v5 init];
  if (v2)
  {
    v3 = sharedInputManagerMux_0();
    [v3 addClient:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = sharedInputManagerMux_0();
  [v3 removeClient:self];

  v4.receiver = self;
  v4.super_class = (Class)UIInputViewControllerInterface;
  [(UIInputViewControllerInterface *)&v4 dealloc];
}

- (void)setForwardingInterface:(id)a3
{
  objc_super v4 = (_UIIVCInterface *)a3;
  [(_UIIVCInterface *)self->_forwardingInterface setResponseDelegate:0];
  forwardingInterface = self->_forwardingInterface;
  self->_forwardingInterface = v4;
  v6 = v4;

  v7 = [(UIInputViewControllerInterface *)self responseDelegate];
  [(_UIIVCInterface *)self->_forwardingInterface setResponseDelegate:v7];

  v8 = [(UIInputViewControllerInterface *)self _cachedState];

  if (v8)
  {
    v9 = [(UIInputViewControllerInterface *)self forwardingInterface];
    v10 = [(UIInputViewControllerInterface *)self _cachedState];
    [v9 _handleInputViewControllerState:v10];

    [(UIInputViewControllerInterface *)self _setCachedState:0];
  }
}

- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  v9 = (void (**)(id, void))a4;
  v6 = +[_UIInputViewControllerState stateForKeyboardState:a3];
  v7 = [(UIInputViewControllerInterface *)self forwardingInterface];

  if (v7)
  {
    v8 = [(UIInputViewControllerInterface *)self forwardingInterface];
    [v8 _handleInputViewControllerState:v6];
  }
  else
  {
    [(UIInputViewControllerInterface *)self _setCachedState:v6];
    [(UIInputViewControllerInterface *)self _handleInputViewControllerState:v6];
  }
  if (v9) {
    v9[2](v9, 0);
  }
}

- (_UIIVCResponseDelegate)responseDelegate
{
  return self->_responseDelegate;
}

- (void)setResponseDelegate:(id)a3
{
}

- (_UIIVCInterface)forwardingInterface
{
  return self->_forwardingInterface;
}

- (_UIInputViewControllerState)_cachedState
{
  return self->_cachedState;
}

- (void)_setCachedState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedState, 0);
  objc_storeStrong((id *)&self->_forwardingInterface, 0);
  objc_storeStrong((id *)&self->_responseDelegate, 0);
}

@end