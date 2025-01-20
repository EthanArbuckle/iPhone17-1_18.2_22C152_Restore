@interface SASemanticValue
+ (id)semanticValue;
- (NSString)semanticValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSemanticValue:(id)a3;
@end

@implementation SASemanticValue

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SemanticValue";
}

+ (id)semanticValue
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)semanticValue
{
  return (NSString *)[(AceObject *)self propertyForKey:@"semanticValue"];
}

- (void)setSemanticValue:(id)a3
{
}

@end