@interface SAWebWebSearchResult
+ (id)webSearchResult;
- (NSArray)imageResults;
- (NSArray)newsResults;
- (NSArray)relatedSearchResults;
- (NSArray)videoResults;
- (NSArray)webResults;
- (NSNumber)totalImageResults;
- (NSNumber)totalNewsResults;
- (NSNumber)totalVideoResults;
- (NSNumber)totalWebResults;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImageResults:(id)a3;
- (void)setNewsResults:(id)a3;
- (void)setRelatedSearchResults:(id)a3;
- (void)setTotalImageResults:(id)a3;
- (void)setTotalNewsResults:(id)a3;
- (void)setTotalVideoResults:(id)a3;
- (void)setTotalWebResults:(id)a3;
- (void)setVideoResults:(id)a3;
- (void)setWebResults:(id)a3;
@end

@implementation SAWebWebSearchResult

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
}

- (id)encodedClassName
{
  return @"WebSearchResult";
}

+ (id)webSearchResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)imageResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"imageResults", v3);
}

- (void)setImageResults:(id)a3
{
}

- (NSArray)newsResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"newsResults", v3);
}

- (void)setNewsResults:(id)a3
{
}

- (NSArray)relatedSearchResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"relatedSearchResults", v3);
}

- (void)setRelatedSearchResults:(id)a3
{
}

- (NSNumber)totalImageResults
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"totalImageResults"];
}

- (void)setTotalImageResults:(id)a3
{
}

- (NSNumber)totalNewsResults
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"totalNewsResults"];
}

- (void)setTotalNewsResults:(id)a3
{
}

- (NSNumber)totalVideoResults
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"totalVideoResults"];
}

- (void)setTotalVideoResults:(id)a3
{
}

- (NSNumber)totalWebResults
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"totalWebResults"];
}

- (void)setTotalWebResults:(id)a3
{
}

- (NSArray)videoResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"videoResults", v3);
}

- (void)setVideoResults:(id)a3
{
}

- (NSArray)webResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"webResults", v3);
}

- (void)setWebResults:(id)a3
{
}

@end