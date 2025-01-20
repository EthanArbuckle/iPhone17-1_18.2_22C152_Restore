@interface SASportsLeague
+ (id)league;
- (BOOL)displayTeamLocationOverName;
- (NSString)diplayedText;
- (NSString)displayedText;
- (NSString)identifier;
- (NSString)sport;
- (SASportsSeason)season;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDiplayedText:(id)a3;
- (void)setDisplayTeamLocationOverName:(BOOL)a3;
- (void)setDisplayedText:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSeason:(id)a3;
- (void)setSport:(id)a3;
@end

@implementation SASportsLeague

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"League";
}

+ (id)league
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)diplayedText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"diplayedText"];
}

- (void)setDiplayedText:(id)a3
{
}

- (BOOL)displayTeamLocationOverName
{
  return AceObjectBoolForProperty(self, @"displayTeamLocationOverName");
}

- (void)setDisplayTeamLocationOverName:(BOOL)a3
{
}

- (NSString)displayedText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"displayedText"];
}

- (void)setDisplayedText:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"identifier"];
}

- (void)setIdentifier:(id)a3
{
}

- (SASportsSeason)season
{
  return (SASportsSeason *)AceObjectAceObjectForProperty(self, @"season");
}

- (void)setSeason:(id)a3
{
}

- (NSString)sport
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sport"];
}

- (void)setSport:(id)a3
{
}

@end