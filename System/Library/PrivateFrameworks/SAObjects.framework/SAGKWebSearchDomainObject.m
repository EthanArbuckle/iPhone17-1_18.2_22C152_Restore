@interface SAGKWebSearchDomainObject
+ (id)webSearchDomainObject;
- (NSArray)image;
- (NSArray)linkedAnswerGroups;
- (NSString)query;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImage:(id)a3;
- (void)setLinkedAnswerGroups:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation SAGKWebSearchDomainObject

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"WebSearchDomainObject";
}

+ (id)webSearchDomainObject
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)image
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"image", v3);
}

- (void)setImage:(id)a3
{
}

- (NSArray)linkedAnswerGroups
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"linkedAnswerGroups", v3);
}

- (void)setLinkedAnswerGroups:(id)a3
{
}

- (NSString)query
{
  return (NSString *)[(AceObject *)self propertyForKey:@"query"];
}

- (void)setQuery:(id)a3
{
}

@end