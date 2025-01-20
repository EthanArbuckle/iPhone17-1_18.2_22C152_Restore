@interface SASportsTeamSnippet
+ (id)teamSnippet;
- (NSArray)teams;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTeams:(id)a3;
@end

@implementation SASportsTeamSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"TeamSnippet";
}

+ (id)teamSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)teams
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"teams", v3);
}

- (void)setTeams:(id)a3
{
}

@end