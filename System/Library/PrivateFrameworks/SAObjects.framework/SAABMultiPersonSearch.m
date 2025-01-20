@interface SAABMultiPersonSearch
+ (id)multiPersonSearch;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)personSearches;
- (NSNumber)resultsLimit;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPersonSearches:(id)a3;
- (void)setResultsLimit:(id)a3;
@end

@implementation SAABMultiPersonSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.contact";
}

- (id)encodedClassName
{
  return @"MultiPersonSearch";
}

+ (id)multiPersonSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)personSearches
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"personSearches", v3);
}

- (void)setPersonSearches:(id)a3
{
}

- (NSNumber)resultsLimit
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"resultsLimit"];
}

- (void)setResultsLimit:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end