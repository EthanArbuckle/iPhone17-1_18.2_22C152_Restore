@interface SAUIDecoratedText
+ (id)decoratedText;
- (NSArray)regions;
- (NSString)ducId;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDucId:(id)a3;
- (void)setRegions:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SAUIDecoratedText

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"DecoratedText";
}

+ (id)decoratedText
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)ducId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"ducId"];
}

- (void)setDucId:(id)a3
{
}

- (NSArray)regions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"regions", v3);
}

- (void)setRegions:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end