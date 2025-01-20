@interface SAARParaphrasedSuggestedResultsPod
+ (id)paraphrasedSuggestedResultsPod;
- (NSArray)suggestedResults;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSuggestedResults:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAARParaphrasedSuggestedResultsPod

- (id)groupIdentifier
{
  return @"com.apple.ace.alternatives";
}

- (id)encodedClassName
{
  return @"ParaphrasedSuggestedResultsPod";
}

+ (id)paraphrasedSuggestedResultsPod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)suggestedResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"suggestedResults", v3);
}

- (void)setSuggestedResults:(id)a3
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