@interface SASportsAthleteSnippet
+ (id)athleteSnippet;
- (NSArray)athletes;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAthletes:(id)a3;
@end

@implementation SASportsAthleteSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"AthleteSnippet";
}

+ (id)athleteSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)athletes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"athletes", v3);
}

- (void)setAthletes:(id)a3
{
}

@end