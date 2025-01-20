@interface SAStartBackgroundActionRequest
+ (id)startBackgroundActionRequest;
- (BOOL)requiresResponse;
- (NSString)backgroundAction;
- (SAAceSerializable)backgroundActionPayload;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBackgroundAction:(id)a3;
- (void)setBackgroundActionPayload:(id)a3;
@end

@implementation SAStartBackgroundActionRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StartBackgroundActionRequest";
}

+ (id)startBackgroundActionRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)backgroundAction
{
  return (NSString *)[(AceObject *)self propertyForKey:@"backgroundAction"];
}

- (void)setBackgroundAction:(id)a3
{
}

- (SAAceSerializable)backgroundActionPayload
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, @"backgroundActionPayload");
}

- (void)setBackgroundActionPayload:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end