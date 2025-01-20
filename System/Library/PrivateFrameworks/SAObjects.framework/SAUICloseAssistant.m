@interface SAUICloseAssistant
+ (id)closeAssistant;
- (BOOL)requiresResponse;
- (NSString)reason;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setReason:(id)a3;
@end

@implementation SAUICloseAssistant

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"CloseAssistant";
}

- (NSString)reason
{
  return (NSString *)[(AceObject *)self propertyForKey:@"reason"];
}

- (void)setReason:(id)a3
{
}

+ (id)closeAssistant
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end