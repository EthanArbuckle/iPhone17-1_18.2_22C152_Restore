@interface PKSubcredentialProvisioningConnectivityCheckOperation
- (BOOL)canBeRestarted;
- (void)performOperation;
@end

@implementation PKSubcredentialProvisioningConnectivityCheckOperation

- (void)performOperation
{
  v3.receiver = self;
  v3.super_class = (Class)PKSubcredentialProvisioningConnectivityCheckOperation;
  [(PKSubcredentialProvisioningOperation *)&v3 performOperation];
  if (PKNetworkConnectivityAvailable()) {
    [(PKSubcredentialProvisioningOperation *)self advanceToState:8];
  }
  else {
    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:19 description:@"Device connectivity check failed"];
  }
}

- (BOOL)canBeRestarted
{
  return 1;
}

@end