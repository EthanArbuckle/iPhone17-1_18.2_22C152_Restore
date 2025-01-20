@interface SRSTClient
- (NSString)mostRecentEventName;
- (SRSTClient)init;
- (SRSTClientDelegate)delegate;
- (SRSTState)currentState;
- (_SRSTClient)underlyingObject;
- (void)dispatchEvent:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)stateMachineWithClient:(id)a3 didReceiveEvent:(int64_t)a4;
- (void)stateMachineWithClient:(id)a3 didTransitionToState:(id)a4;
- (void)stopClient;
@end

@implementation SRSTClient

- (SRSTClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSTClient;
  v2 = [(SRSTClient *)&v6 init];
  uint64_t v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTClient *)v3;

  [(_SRSTClient *)v2->_underlyingObject setDelegate:v2];
  return v2;
}

- (SRSTState)currentState
{
  uint64_t v3 = [SRSTState alloc];
  v4 = [(_SRSTClient *)self->_underlyingObject currentState];
  v5 = [(SRSTState *)v3 initWithUnderlyingObject:v4];

  return v5;
}

- (NSString)mostRecentEventName
{
  return [(_SRSTClient *)self->_underlyingObject mostRecentEventName];
}

- (void)dispatchEvent:(int64_t)a3
{
}

- (void)stateMachineWithClient:(id)a3 didReceiveEvent:(int64_t)a4
{
  objc_super v6 = [(SRSTClient *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SRSTClient *)self delegate];
    [v8 stateMachineWithClient:self didReceiveEvent:a4];
  }
}

- (void)stateMachineWithClient:(id)a3 didTransitionToState:(id)a4
{
  id v5 = a4;
  id v7 = [(SRSTClient *)self delegate];
  objc_super v6 = [[SRSTState alloc] initWithUnderlyingObject:v5];

  [v7 stateMachineWithClient:self didTransitionToState:v6];
}

- (void)stopClient
{
}

- (SRSTClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRSTClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_SRSTClient)underlyingObject
{
  return (_SRSTClient *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end