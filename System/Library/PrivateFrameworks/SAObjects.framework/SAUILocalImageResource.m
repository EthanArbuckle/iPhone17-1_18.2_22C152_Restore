@interface SAUILocalImageResource
+ (id)localImageResource;
- (NSString)imageCode;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImageCode:(id)a3;
@end

@implementation SAUILocalImageResource

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"LocalImageResource";
}

+ (id)localImageResource
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)imageCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"imageCode"];
}

- (void)setImageCode:(id)a3
{
}

@end