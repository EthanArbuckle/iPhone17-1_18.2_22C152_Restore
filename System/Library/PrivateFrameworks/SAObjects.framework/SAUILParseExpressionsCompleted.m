@interface SAUILParseExpressionsCompleted
+ (id)parseExpressionsCompleted;
- (BOOL)requiresResponse;
- (NSArray)parsedExpressions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setParsedExpressions:(id)a3;
@end

@implementation SAUILParseExpressionsCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.lite";
}

- (id)encodedClassName
{
  return @"ParseExpressionsCompleted";
}

+ (id)parseExpressionsCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)parsedExpressions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"parsedExpressions", v3);
}

- (void)setParsedExpressions:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end