@interface _UIPhysicalButtonProxyInteraction
- (BOOL)_isProxyInteraction;
- (_UIPhysicalButtonProxyInteraction)init;
- (id)_driverClasses;
- (id)initWithConfigurations:(void *)a3 proxyDelegate:;
- (void)_driver:(id)a3 didCreateProposedAction:(id)a4;
- (void)_proxyDriver:(id)a3 didReceiveBSAction:(id)a4;
@end

@implementation _UIPhysicalButtonProxyInteraction

- (_UIPhysicalButtonProxyInteraction)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButtonProxyInteraction.m", 67, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonProxyInteraction init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)initWithConfigurations:(void *)a3 proxyDelegate:
{
  if (!a1) {
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:sel_initWithConfigurations_proxyDelegate_, a1, @"_UIPhysicalButtonProxyInteraction.m", 75, @"Attempting to initialize %@ with a non-conforming delegate: %@", objc_opt_class(), a3 object file lineNumber description];
  }
  v10.receiver = a1;
  v10.super_class = (Class)_UIPhysicalButtonProxyInteraction;
  v6 = (id *)objc_msgSendSuper2(&v10, sel_initWithConfigurations_delegate_, a2, a3);
  v7 = v6;
  if (v6) {
    objc_storeWeak(v6 + 11, a3);
  }
  return v7;
}

- (BOOL)_isProxyInteraction
{
  return 1;
}

- (id)_driverClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)_driver:(id)a3 didCreateProposedAction:(id)a4
{
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPhysicalButtonProxyInteraction.m", 98, @"Unexpected request for a proxy interaction to handle a proposed action: self: %@; driver: %@; proposedAction: %@",
    self,
    a3,
    a4);
}

- (void)_proxyDriver:(id)a3 didReceiveBSAction:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyDelegate);
  [WeakRetained _physicalButtonProxyInteraction:self didReceiveBSAction:a4];
}

- (void).cxx_destruct
{
}

@end