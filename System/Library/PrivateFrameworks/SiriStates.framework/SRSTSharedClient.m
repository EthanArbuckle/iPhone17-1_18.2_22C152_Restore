@interface SRSTSharedClient
- (NSString)mostRecentEventName;
- (SRSTSharedClient)init;
- (SRSTSharedClientDelegate)delegate;
- (SRSTSharedState)currentState;
- (_SRSTSharedClient)underlyingObject;
- (void)dispatchEvent:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)stateMachineWithClient:(id)a3 didReceiveEvent:(int64_t)a4;
- (void)stateMachineWithClient:(id)a3 didTransitionToState:(id)a4;
- (void)stopClient;
@end

@implementation SRSTSharedClient

- (SRSTSharedClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSTSharedClient;
  v2 = [(SRSTSharedClient *)&v6 init];
  uint64_t v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTSharedClient *)v3;

  [(_SRSTSharedClient *)v2->_underlyingObject setDelegate:v2];
  return v2;
}

- (SRSTSharedState)currentState
{
  uint64_t v3 = [SRSTSharedState alloc];
  v4 = [(_SRSTSharedClient *)self->_underlyingObject currentState];
  v5 = [(SRSTSharedState *)v3 initWithUnderlyingObject:v4];

  return v5;
}

- (NSString)mostRecentEventName
{
  return [(_SRSTSharedClient *)self->_underlyingObject mostRecentEventName];
}

- (void)dispatchEvent:(int64_t)a3
{
}

- (void)stateMachineWithClient:(id)a3 didReceiveEvent:(int64_t)a4
{
  objc_super v6 = [(SRSTSharedClient *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SRSTSharedClient *)self delegate];
    [v8 stateMachineWithClient:self didReceiveEvent:a4];
  }
}

- (void)stateMachineWithClient:(id)a3 didTransitionToState:(id)a4
{
  id v5 = a4;
  id v7 = [(SRSTSharedClient *)self delegate];
  objc_super v6 = [[SRSTSharedState alloc] initWithUnderlyingObject:v5];

  [v7 stateMachineWithClient:self didTransitionToState:v6];
}

- (void)stopClient
{
}

- (SRSTSharedClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRSTSharedClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_SRSTSharedClient)underlyingObject
{
  return (_SRSTSharedClient *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end