@interface SASportsAthleteComparisonSnippet
+ (id)athleteComparisonSnippet;
- (NSDictionary)comparisonItemDetails;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setComparisonItemDetails:(id)a3;
@end

@implementation SASportsAthleteComparisonSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"AthleteComparisonSnippet";
}

+ (id)athleteComparisonSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)comparisonItemDetails
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"comparisonItemDetails", v3);
}

- (void)setComparisonItemDetails:(id)a3
{
}

@end