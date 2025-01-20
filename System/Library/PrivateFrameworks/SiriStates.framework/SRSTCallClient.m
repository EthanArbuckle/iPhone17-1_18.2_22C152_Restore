@interface SRSTCallClient
- (NSString)mostRecentEventName;
- (SRSTCallClient)init;
- (SRSTCallClientDelegate)delegate;
- (SRSTCallState)currentState;
- (_SRSTCallClient)underlyingObject;
- (void)dispatchEvent:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)stateMachineWithClient:(id)a3 didReceiveEvent:(int64_t)a4;
- (void)stateMachineWithClient:(id)a3 didTransitionToState:(id)a4;
- (void)stopClient;
@end

@implementation SRSTCallClient

- (SRSTCallClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSTCallClient;
  v2 = [(SRSTCallClient *)&v6 init];
  uint64_t v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTCallClient *)v3;

  [(_SRSTCallClient *)v2->_underlyingObject setDelegate:v2];
  return v2;
}

- (SRSTCallState)currentState
{
  uint64_t v3 = [SRSTCallState alloc];
  v4 = [(_SRSTCallClient *)self->_underlyingObject currentState];
  v5 = [(SRSTCallState *)v3 initWithUnderlyingObject:v4];

  return v5;
}

- (NSString)mostRecentEventName
{
  return [(_SRSTCallClient *)self->_underlyingObject mostRecentEventName];
}

- (void)dispatchEvent:(int64_t)a3
{
}

- (void)stateMachineWithClient:(id)a3 didReceiveEvent:(int64_t)a4
{
  objc_super v6 = [(SRSTCallClient *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SRSTCallClient *)self delegate];
    [v8 stateMachineWithClient:self didReceiveEvent:a4];
  }
}

- (void)stateMachineWithClient:(id)a3 didTransitionToState:(id)a4
{
  id v5 = a4;
  id v7 = [(SRSTCallClient *)self delegate];
  objc_super v6 = [[SRSTCallState alloc] initWithUnderlyingObject:v5];

  [v7 stateMachineWithClient:self didTransitionToState:v6];
}

- (void)stopClient
{
}

- (SRSTCallClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRSTCallClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_SRSTCallClient)underlyingObject
{
  return (_SRSTCallClient *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end