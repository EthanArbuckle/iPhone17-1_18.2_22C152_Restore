@interface SASportsAthlete
+ (id)athlete;
- (NSArray)athleteMetadata;
- (NSArray)careerStatistics;
- (NSArray)formattedMetadata;
- (NSArray)formattedMetadataTypes;
- (NSArray)lastGameStatistics;
- (NSArray)previousTeams;
- (NSArray)statistics;
- (NSNumber)injured;
- (NSString)firstName;
- (NSString)gender;
- (NSString)height;
- (NSString)jerseyNumber;
- (NSString)lastName;
- (NSString)nickname;
- (NSString)position;
- (NSString)weight;
- (SASportsTeam)activeTeam;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActiveTeam:(id)a3;
- (void)setAthleteMetadata:(id)a3;
- (void)setCareerStatistics:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFormattedMetadata:(id)a3;
- (void)setFormattedMetadataTypes:(id)a3;
- (void)setGender:(id)a3;
- (void)setHeight:(id)a3;
- (void)setInjured:(id)a3;
- (void)setJerseyNumber:(id)a3;
- (void)setLastGameStatistics:(id)a3;
- (void)setLastName:(id)a3;
- (void)setNickname:(id)a3;
- (void)setPosition:(id)a3;
- (void)setPreviousTeams:(id)a3;
- (void)setStatistics:(id)a3;
- (void)setWeight:(id)a3;
@end

@implementation SASportsAthlete

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"Athlete";
}

+ (id)athlete
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASportsTeam)activeTeam
{
  return (SASportsTeam *)AceObjectAceObjectForProperty(self, @"activeTeam");
}

- (void)setActiveTeam:(id)a3
{
}

- (NSArray)athleteMetadata
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"athleteMetadata", v3);
}

- (void)setAthleteMetadata:(id)a3
{
}

- (NSArray)careerStatistics
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"careerStatistics", v3);
}

- (void)setCareerStatistics:(id)a3
{
}

- (NSString)firstName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"firstName"];
}

- (void)setFirstName:(id)a3
{
}

- (NSArray)formattedMetadata
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"formattedMetadata"];
}

- (void)setFormattedMetadata:(id)a3
{
}

- (NSArray)formattedMetadataTypes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"formattedMetadataTypes"];
}

- (void)setFormattedMetadataTypes:(id)a3
{
}

- (NSString)gender
{
  return (NSString *)[(AceObject *)self propertyForKey:@"gender"];
}

- (void)setGender:(id)a3
{
}

- (NSString)height
{
  return (NSString *)[(AceObject *)self propertyForKey:@"height"];
}

- (void)setHeight:(id)a3
{
}

- (NSNumber)injured
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"injured"];
}

- (void)setInjured:(id)a3
{
}

- (NSString)jerseyNumber
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jerseyNumber"];
}

- (void)setJerseyNumber:(id)a3
{
}

- (NSArray)lastGameStatistics
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"lastGameStatistics", v3);
}

- (void)setLastGameStatistics:(id)a3
{
}

- (NSString)lastName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"lastName"];
}

- (void)setLastName:(id)a3
{
}

- (NSString)nickname
{
  return (NSString *)[(AceObject *)self propertyForKey:@"nickname"];
}

- (void)setNickname:(id)a3
{
}

- (NSString)position
{
  return (NSString *)[(AceObject *)self propertyForKey:@"position"];
}

- (void)setPosition:(id)a3
{
}

- (NSArray)previousTeams
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"previousTeams", v3);
}

- (void)setPreviousTeams:(id)a3
{
}

- (NSArray)statistics
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"statistics", v3);
}

- (void)setStatistics:(id)a3
{
}

- (NSString)weight
{
  return (NSString *)[(AceObject *)self propertyForKey:@"weight"];
}

- (void)setWeight:(id)a3
{
}

@end