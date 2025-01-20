@interface SAUILParsedExpression
+ (id)parsedExpression;
- (NSString)parsedOutput;
- (SAUILParseableExpression)parseableExpression;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setParseableExpression:(id)a3;
- (void)setParsedOutput:(id)a3;
@end

@implementation SAUILParsedExpression

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.lite";
}

- (id)encodedClassName
{
  return @"ParsedExpression";
}

+ (id)parsedExpression
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUILParseableExpression)parseableExpression
{
  return (SAUILParseableExpression *)AceObjectAceObjectForProperty(self, @"parseableExpression");
}

- (void)setParseableExpression:(id)a3
{
}

- (NSString)parsedOutput
{
  return (NSString *)[(AceObject *)self propertyForKey:@"parsedOutput"];
}

- (void)setParsedOutput:(id)a3
{
}

@end