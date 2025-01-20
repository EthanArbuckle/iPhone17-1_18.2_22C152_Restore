@interface PDSECredentialNode
- (PDSECredentialNode)init;
@end

@implementation PDSECredentialNode

- (PDSECredentialNode)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_conflicts, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end