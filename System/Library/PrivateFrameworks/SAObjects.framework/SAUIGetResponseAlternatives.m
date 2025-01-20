@interface SAUIGetResponseAlternatives
+ (id)getResponseAlternatives;
- (BOOL)locallyResolved;
- (BOOL)requiresResponse;
- (NSString)requestId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLocallyResolved:(BOOL)a3;
- (void)setRequestId:(id)a3;
@end

@implementation SAUIGetResponseAlternatives

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"GetResponseAlternatives";
}

+ (id)getResponseAlternatives
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)locallyResolved
{
  return AceObjectBoolForProperty(self, @"locallyResolved");
}

- (void)setLocallyResolved:(BOOL)a3
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
  return 0;
}

@end