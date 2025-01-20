@interface SAStartStructuredDictationRequest
+ (id)startStructuredDictationRequest;
- (BOOL)requiresResponse;
- (NSString)structuredDictationType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStructuredDictationType:(id)a3;
@end

@implementation SAStartStructuredDictationRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StartStructuredDictationRequest";
}

+ (id)startStructuredDictationRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)structuredDictationType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"structuredDictationType"];
}

- (void)setStructuredDictationType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end