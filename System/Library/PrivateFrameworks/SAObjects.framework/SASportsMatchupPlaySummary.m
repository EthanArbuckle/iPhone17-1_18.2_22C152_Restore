@interface SASportsMatchupPlaySummary
+ (id)matchupPlaySummary;
- (BOOL)appliesToAwayTeam;
- (BOOL)appliesToHomeTeam;
- (NSString)nonFormattedTime;
- (NSString)summaryDescription;
- (NSString)time;
- (SASportsAthlete)offensivePlayer;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppliesToAwayTeam:(BOOL)a3;
- (void)setAppliesToHomeTeam:(BOOL)a3;
- (void)setNonFormattedTime:(id)a3;
- (void)setOffensivePlayer:(id)a3;
- (void)setSummaryDescription:(id)a3;
- (void)setTime:(id)a3;
@end

@implementation SASportsMatchupPlaySummary

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"MatchupPlaySummary";
}

+ (id)matchupPlaySummary
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)appliesToAwayTeam
{
  return AceObjectBoolForProperty(self, @"appliesToAwayTeam");
}

- (void)setAppliesToAwayTeam:(BOOL)a3
{
}

- (BOOL)appliesToHomeTeam
{
  return AceObjectBoolForProperty(self, @"appliesToHomeTeam");
}

- (void)setAppliesToHomeTeam:(BOOL)a3
{
}

- (NSString)nonFormattedTime
{
  return (NSString *)[(AceObject *)self propertyForKey:@"nonFormattedTime"];
}

- (void)setNonFormattedTime:(id)a3
{
}

- (SASportsAthlete)offensivePlayer
{
  return (SASportsAthlete *)AceObjectAceObjectForProperty(self, @"offensivePlayer");
}

- (void)setOffensivePlayer:(id)a3
{
}

- (NSString)summaryDescription
{
  return (NSString *)[(AceObject *)self propertyForKey:@"summaryDescription"];
}

- (void)setSummaryDescription:(id)a3
{
}

- (NSString)time
{
  return (NSString *)[(AceObject *)self propertyForKey:@"time"];
}

- (void)setTime:(id)a3
{
}

@end