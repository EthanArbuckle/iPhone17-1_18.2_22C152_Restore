@interface SASetConnectionHeader
+ (id)setConnectionHeader;
- (BOOL)reconnectNow;
- (BOOL)requiresResponse;
- (NSString)aceHostHeader;
- (SAConnectionPolicy)connectionPolicy;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceHostHeader:(id)a3;
- (void)setConnectionPolicy:(id)a3;
- (void)setReconnectNow:(BOOL)a3;
@end

@implementation SASetConnectionHeader

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetConnectionHeader";
}

+ (id)setConnectionHeader
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)aceHostHeader
{
  return (NSString *)[(AceObject *)self propertyForKey:@"aceHostHeader"];
}

- (void)setAceHostHeader:(id)a3
{
}

- (SAConnectionPolicy)connectionPolicy
{
  return (SAConnectionPolicy *)AceObjectAceObjectForProperty(self, @"connectionPolicy");
}

- (void)setConnectionPolicy:(id)a3
{
}

- (BOOL)reconnectNow
{
  return AceObjectBoolForProperty(self, @"reconnectNow");
}

- (void)setReconnectNow:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end