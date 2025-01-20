@interface _UIPhysicalButtonInteractionBSActionDriver
- (_UIPhysicalButtonInteractionBSActionDriver)init;
- (_UIPhysicalButtonInteractionBSActionDriver)initWithReceiver:(id)a3;
- (int64_t)_driverType;
- (void)_handleBSAction:(id)a3;
@end

@implementation _UIPhysicalButtonInteractionBSActionDriver

- (_UIPhysicalButtonInteractionBSActionDriver)initWithReceiver:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPhysicalButtonInteractionBSActionDriver;
  v4 = [(_UIPhysicalButtonInteractionBSActionDriver *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak((id *)&v4->_receiver, a3);
  }
  return v5;
}

- (_UIPhysicalButtonInteractionBSActionDriver)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteractionBSActionDriver.m", 28, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonInteractionBSActionDriver init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (int64_t)_driverType
{
  return 0;
}

- (void)_handleBSAction:(id)a3
{
  +[_UIPhysicalButtonAction _actionFromPhysicalButtonBSAction:andDriver:]((uint64_t)_UIPhysicalButtonAction, a3, [(_UIPhysicalButtonInteractionBSActionDriver *)self _driverType]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  [WeakRetained _driver:self didCreateProposedAction:v5];
}

- (void).cxx_destruct
{
}

@end