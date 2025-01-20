@interface SAUIRepeatIt
+ (id)repeatIt;
- (BOOL)requiresResponse;
- (NSString)contingency;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContingency:(id)a3;
@end

@implementation SAUIRepeatIt

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"RepeatIt";
}

+ (id)repeatIt
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contingency
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contingency"];
}

- (void)setContingency:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end