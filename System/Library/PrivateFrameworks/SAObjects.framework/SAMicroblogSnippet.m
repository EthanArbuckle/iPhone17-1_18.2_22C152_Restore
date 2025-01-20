@interface SAMicroblogSnippet
+ (id)snippet;
- (NSArray)microblogs;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMicroblogs:(id)a3;
@end

@implementation SAMicroblogSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
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

- (NSArray)microblogs
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"microblogs", v3);
}

- (void)setMicroblogs:(id)a3
{
}

@end