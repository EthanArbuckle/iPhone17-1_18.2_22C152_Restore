@interface AEAConcreteAuditTokenPrimitives
- (id)auditTokenForData:(id)a3;
- (id)makeInvalidAuditToken;
@end

@implementation AEAConcreteAuditTokenPrimitives

- (id)auditTokenForData:(id)a3
{
  return +[AEAConcreteAuditToken auditTokenWithData:a3];
}

- (id)makeInvalidAuditToken
{
  return +[AEAConcreteAuditToken invalidAuditToken];
}

@end