@interface PKProvisioningWatchUICoordinator
- (PKProvisioningWatchUICoordinator)init;
- (PKProvisioningWatchUICoordinator)initWithSetupContext:(int64_t)a3 provisioningController:(id)a4 credential:(id)a5;
- (PKProvisioningWatchUICoordinatorDelegate)delegate;
- (id)_initWithCoordinator:(id)a3;
- (id)initManualEntryCoordinatorWithSetupContext:(int64_t)a3 provisioningController:(id)a4 skipRequirements:(BOOL)a5;
- (void)cancel;
- (void)continueWithFieldsModel:(id)a3;
- (void)preflightWithFieldsModel:(id)a3 completion:(id)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
@end

@implementation PKProvisioningWatchUICoordinator

- (PKProvisioningWatchUICoordinator)init
{
  return 0;
}

- (PKProvisioningWatchUICoordinator)initWithSetupContext:(int64_t)a3 provisioningController:(id)a4 credential:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [[_PKProvisioningWatchUICoordinator alloc] initWithSetupContext:a3 provisioningController:v9 credential:v8];

  v11 = [(PKProvisioningWatchUICoordinator *)self _initWithCoordinator:v10];
  return v11;
}

- (id)initManualEntryCoordinatorWithSetupContext:(int64_t)a3 provisioningController:(id)a4 skipRequirements:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [[_PKProvisioningWatchUICoordinator alloc] initWithManualEntrySetupContext:a3 provisioningController:v8 skipRequirements:v5];

  id v10 = [(PKProvisioningWatchUICoordinator *)self _initWithCoordinator:v9];
  return v10;
}

- (id)_initWithCoordinator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKProvisioningWatchUICoordinator;
  v6 = [(PKProvisioningWatchUICoordinator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_coordinator, a3);
  }

  return v7;
}

- (PKProvisioningWatchUICoordinatorDelegate)delegate
{
  return [(_PKProvisioningWatchUICoordinator *)self->_coordinator delegate];
}

- (void)setDelegate:(id)a3
{
}

- (void)continueWithFieldsModel:(id)a3
{
}

- (void)preflightWithFieldsModel:(id)a3 completion:(id)a4
{
}

- (void)cancel
{
}

- (void)reset
{
}

- (void).cxx_destruct
{
}

@end