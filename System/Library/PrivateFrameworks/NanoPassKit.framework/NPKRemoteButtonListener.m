@interface NPKRemoteButtonListener
- (BOOL)enabled;
- (NPKDoublePressDelegationAssertion)delegationAssertion;
- (NPKRemoteButtonListener)init;
- (NPKRemoteButtonListenerDelegate)delegate;
- (void)dealloc;
- (void)doublePressDelegationAssertion:(id)a3 didReceiveTerminalAuthenticationRequestForPassWithUniqueID:(id)a4;
- (void)doublePressDelegationAssertionDidReceiveDelegatedDoublePressEvent:(id)a3 authIntentSource:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegationAssertion:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation NPKRemoteButtonListener

- (NPKRemoteButtonListener)init
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v4 = (OS_dispatch_queue *)dispatch_queue_create("NPKRemoteButtonListener", v3);
  internalQueue = self->_internalQueue;
  self->_internalQueue = v4;

  v6 = self->_internalQueue;
  v10.receiver = self;
  v10.super_class = (Class)NPKRemoteButtonListener;
  v7 = [(NPKButtonListener *)&v10 initWithHandlerQueue:v6];
  v8 = v7;
  if (v7) {
    [(NPKRemoteButtonListener *)v7 setEnabled:1];
  }

  return v8;
}

- (void)dealloc
{
  [(NPKTransientAssertion *)self->_delegationAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NPKRemoteButtonListener;
  [(NPKRemoteButtonListener *)&v3 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = @"disable";
        if (v3) {
          v8 = @"enable";
        }
        int v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Requested to %@ remote button listener.", (uint8_t *)&v12, 0xCu);
      }
    }
    if (v3)
    {
      v9 = [[NPKDoublePressDelegationAssertion alloc] initWithQueue:self->_internalQueue];
      delegationAssertion = self->_delegationAssertion;
      self->_delegationAssertion = v9;

      [(NPKDoublePressDelegationAssertion *)self->_delegationAssertion setDelegate:self];
    }
    else
    {
      [(NPKTransientAssertion *)self->_delegationAssertion invalidate];
      [(NPKDoublePressDelegationAssertion *)self->_delegationAssertion setDelegate:0];
      v11 = self->_delegationAssertion;
      self->_delegationAssertion = 0;
    }
  }
}

- (void)doublePressDelegationAssertionDidReceiveDelegatedDoublePressEvent:(id)a3 authIntentSource:(unint64_t)a4
{
  BOOL v6 = [(NPKButtonListener *)self handlerQueue];
  dispatch_assert_queue_V2(v6);

  v7 = [(NPKButtonListener *)self _handlerQueue_buttonHandler];
  if (v7)
  {
    id v8 = v7;
    v7[2](v7, a4);
    v7 = (void (**)(void, void))v8;
  }
}

- (void)doublePressDelegationAssertion:(id)a3 didReceiveTerminalAuthenticationRequestForPassWithUniqueID:(id)a4
{
  id v5 = a4;
  id v6 = [(NPKRemoteButtonListener *)self delegate];
  [v6 remoteButtonListener:self didReceiveTerminalAuthenticationRequestForPassWithUniqueID:v5];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NPKRemoteButtonListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKRemoteButtonListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPKDoublePressDelegationAssertion)delegationAssertion
{
  return self->_delegationAssertion;
}

- (void)setDelegationAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegationAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end