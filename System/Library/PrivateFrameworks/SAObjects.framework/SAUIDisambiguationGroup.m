@interface SAUIDisambiguationGroup
+ (id)disambiguationGroup;
- (NSArray)disambiguationLists;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDisambiguationLists:(id)a3;
@end

@implementation SAUIDisambiguationGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"DisambiguationGroup";
}

+ (id)disambiguationGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)disambiguationLists
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"disambiguationLists", v3);
}

- (void)setDisambiguationLists:(id)a3
{
}

@end