@interface SASmsSnippet
+ (id)snippet;
- (NSArray)smss;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSmss:(id)a3;
@end

@implementation SASmsSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"Snippet";
}

+ (id)snippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)smss
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"smss", v3);
}

- (void)setSmss:(id)a3
{
}

@end