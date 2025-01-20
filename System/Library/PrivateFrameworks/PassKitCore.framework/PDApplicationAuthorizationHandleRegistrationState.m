@interface PDApplicationAuthorizationHandleRegistrationState
- (PDApplicationAuthorizationHandleRegistrationState)init;
@end

@implementation PDApplicationAuthorizationHandleRegistrationState

- (PDApplicationAuthorizationHandleRegistrationState)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end