@interface SAUILParseableExpression
+ (id)parseableExpression;
- (NSString)expressionString;
- (SADomainObject)context;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContext:(id)a3;
- (void)setExpressionString:(id)a3;
@end

@implementation SAUILParseableExpression

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.lite";
}

- (id)encodedClassName
{
  return @"ParseableExpression";
}

+ (id)parseableExpression
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADomainObject)context
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, @"context");
}

- (void)setContext:(id)a3
{
}

- (NSString)expressionString
{
  return (NSString *)[(AceObject *)self propertyForKey:@"expressionString"];
}

- (void)setExpressionString:(id)a3
{
}

@end