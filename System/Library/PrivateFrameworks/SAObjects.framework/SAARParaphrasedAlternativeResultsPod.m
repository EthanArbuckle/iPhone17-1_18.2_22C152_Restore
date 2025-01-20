@interface SAARParaphrasedAlternativeResultsPod
+ (id)paraphrasedAlternativeResultsPod;
- (NSArray)alternativeResultViews;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlternativeResultViews:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAARParaphrasedAlternativeResultsPod

- (id)groupIdentifier
{
  return @"com.apple.ace.alternatives";
}

- (id)encodedClassName
{
  return @"ParaphrasedAlternativeResultsPod";
}

+ (id)paraphrasedAlternativeResultsPod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)alternativeResultViews
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"alternativeResultViews", v3);
}

- (void)setAlternativeResultViews:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end