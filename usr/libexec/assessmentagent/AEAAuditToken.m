@interface AEAAuditToken
- (NSData)dataRepresentation;
- (int)processIdentifier;
@end

@implementation AEAAuditToken

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (void).cxx_destruct
{
}

@end