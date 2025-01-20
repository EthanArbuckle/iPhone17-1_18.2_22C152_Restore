@interface SAMPSearchConstraint
+ (id)searchConstraint;
- (NSArray)mediaPlayerOrderingTerms;
- (NSArray)searchProperties;
- (NSString)query;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMediaPlayerOrderingTerms:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSearchProperties:(id)a3;
@end

@implementation SAMPSearchConstraint

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"SearchConstraint";
}

+ (id)searchConstraint
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)mediaPlayerOrderingTerms
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"mediaPlayerOrderingTerms", v3);
}

- (void)setMediaPlayerOrderingTerms:(id)a3
{
}

- (NSString)query
{
  return (NSString *)[(AceObject *)self propertyForKey:@"query"];
}

- (void)setQuery:(id)a3
{
}

- (NSArray)searchProperties
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"searchProperties"];
}

- (void)setSearchProperties:(id)a3
{
}

@end