@interface SASportsSnippet
+ (id)snippet;
- (SASportsLeague)league;
- (SAUIAppPunchOut)leagueAppPunchOut;
- (SAUIAppPunchOut)punchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLeague:(id)a3;
- (void)setLeagueAppPunchOut:(id)a3;
- (void)setPunchOut:(id)a3;
@end

@implementation SASportsSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"Snippet";
}

+ (id)snippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASportsLeague)league
{
  return (SASportsLeague *)AceObjectAceObjectForProperty(self, @"league");
}

- (void)setLeague:(id)a3
{
}

- (SAUIAppPunchOut)leagueAppPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"leagueAppPunchOut");
}

- (void)setLeagueAppPunchOut:(id)a3
{
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"punchOut");
}

- (void)setPunchOut:(id)a3
{
}

@end