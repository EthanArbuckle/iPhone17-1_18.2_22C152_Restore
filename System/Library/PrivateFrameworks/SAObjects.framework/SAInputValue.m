@interface SAInputValue
+ (id)inputValue;
- (NSString)inputValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInputValue:(id)a3;
@end

@implementation SAInputValue

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"InputValue";
}

+ (id)inputValue
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)inputValue
{
  return (NSString *)[(AceObject *)self propertyForKey:@"inputValue"];
}

- (void)setInputValue:(id)a3
{
}

@end