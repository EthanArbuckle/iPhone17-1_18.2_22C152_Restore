@interface RBSLaunchResponse
- (NSDictionary)managedEndpointByLaunchIdentifier;
- (NSError)error;
- (RBSAssertion)assertion;
- (RBSProcessHandle)process;
- (id)_init;
- (void)setAssertion:(id)a3;
- (void)setError:(id)a3;
- (void)setManagedEndpointByLaunchIdentifier:(id)a3;
- (void)setProcess:(id)a3;
@end

@implementation RBSLaunchResponse

- (void)setProcess:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)RBSLaunchResponse;
  return [(RBSLaunchResponse *)&v3 init];
}

- (void)setAssertion:(id)a3
{
}

- (void)setManagedEndpointByLaunchIdentifier:(id)a3
{
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end