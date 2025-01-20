@interface SARollbackRequest
+ (id)rollbackRequest;
- (BOOL)requiresResponse;
- (NSString)reason;
- (NSString)requestId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setReason:(id)a3;
- (void)setRequestId:(id)a3;
@end

@implementation SARollbackRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RollbackRequest";
}

+ (id)rollbackRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)reason
{
  return (NSString *)[(AceObject *)self propertyForKey:@"reason"];
}

- (void)setReason:(id)a3
{
}

- (NSString)requestId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestId"];
}

- (void)setRequestId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end