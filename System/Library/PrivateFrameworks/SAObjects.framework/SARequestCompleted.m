@interface SARequestCompleted
+ (id)requestCompleted;
- (BOOL)requiresResponse;
- (NSString)turnId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTurnId:(id)a3;
@end

@implementation SARequestCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RequestCompleted";
}

+ (id)requestCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)turnId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"turnId"];
}

- (void)setTurnId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end