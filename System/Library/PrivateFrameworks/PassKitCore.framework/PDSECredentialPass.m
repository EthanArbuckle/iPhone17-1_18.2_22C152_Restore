@interface PDSECredentialPass
- (PDSECredentialPass)init;
@end

@implementation PDSECredentialPass

- (PDSECredentialPass)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_conflicts, 0);
}

@end