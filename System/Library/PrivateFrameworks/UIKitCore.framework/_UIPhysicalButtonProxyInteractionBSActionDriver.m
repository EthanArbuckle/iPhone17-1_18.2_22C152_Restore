@interface _UIPhysicalButtonProxyInteractionBSActionDriver
- (_UIPhysicalButtonProxyInteractionBSActionDriver)init;
- (_UIPhysicalButtonProxyInteractionBSActionDriver)initWithReceiver:(id)a3;
- (int64_t)_driverType;
- (void)_handleBSAction:(id)a3;
@end

@implementation _UIPhysicalButtonProxyInteractionBSActionDriver

- (_UIPhysicalButtonProxyInteractionBSActionDriver)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButtonProxyInteractionBSActionDriver.m", 28, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonProxyInteractionBSActionDriver init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (_UIPhysicalButtonProxyInteractionBSActionDriver)initWithReceiver:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIPhysicalButtonProxyInteractionBSActionDriver;
  v5 = [(_UIPhysicalButtonProxyInteractionBSActionDriver *)&v8 init];
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, v5, @"_UIPhysicalButtonProxyInteractionBSActionDriver.m", 38, @"Attempting to initialize %@ with a non-conforming receiver: %@", objc_opt_class(), a3 object file lineNumber description];
    }
    objc_storeWeak((id *)&v5->_proxyReceiver, a3);
  }
  return v5;
}

- (int64_t)_driverType
{
  return 0;
}

- (void)_handleBSAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyReceiver);
  [WeakRetained _proxyDriver:self didReceiveBSAction:a3];
}

- (void).cxx_destruct
{
}

@end