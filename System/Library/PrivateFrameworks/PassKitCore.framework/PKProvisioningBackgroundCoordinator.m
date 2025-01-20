@interface PKProvisioningBackgroundCoordinator
- (PKProvisioningBackgroundCoordinator)init;
- (PKProvisioningBackgroundCoordinator)initWithSetupContext:(id)a3 credential:(id)a4 previouslyAcceptedTerms:(BOOL)a5;
- (id)archivedState;
- (void)cancel;
- (void)cleanUpArchivedProvisioningAndInvalidateWithCompletion:(id)a3;
- (void)invalidate;
- (void)startWithCompletion:(id)a3;
@end

@implementation PKProvisioningBackgroundCoordinator

- (PKProvisioningBackgroundCoordinator)init
{
  return 0;
}

- (PKProvisioningBackgroundCoordinator)initWithSetupContext:(id)a3 credential:(id)a4 previouslyAcceptedTerms:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKProvisioningBackgroundCoordinator;
  v10 = [(PKProvisioningBackgroundCoordinator *)&v14 init];
  if (v10)
  {
    v11 = [[_PKProvisioningBackgroundCoordinator alloc] initWithPkContext:v8 credential:v9 previouslyAcceptedTerms:v5];
    coordinator = v10->_coordinator;
    v10->_coordinator = v11;
  }
  return v10;
}

- (void)startWithCompletion:(id)a3
{
}

- (void)cancel
{
}

- (void)invalidate
{
}

- (void)cleanUpArchivedProvisioningAndInvalidateWithCompletion:(id)a3
{
}

- (id)archivedState
{
  return [(_PKProvisioningBackgroundCoordinator *)self->_coordinator archivedState];
}

- (void).cxx_destruct
{
}

@end