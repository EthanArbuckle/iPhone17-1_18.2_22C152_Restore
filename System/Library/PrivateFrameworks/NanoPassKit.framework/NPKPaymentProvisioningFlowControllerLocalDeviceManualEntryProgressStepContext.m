@interface NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext
- (BOOL)numericEntryPending;
- (NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext)initWithRequestContext:(id)a3;
- (void)setNumericEntryPending:(BOOL)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext

- (NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (BOOL)numericEntryPending
{
  return self->_numericEntryPending;
}

- (void)setNumericEntryPending:(BOOL)a3
{
  self->_numericEntryPending = a3;
}

@end