@interface SASportsTeam
+ (id)team;
- (BOOL)alwaysUseAthleteFullName;
- (NSArray)athletes;
- (NSArray)news;
- (NSArray)rankings;
- (NSArray)statistics;
- (NSNumber)clinchedQualificationPosition;
- (NSNumber)conferencePosition;
- (NSNumber)groupPosition;
- (NSNumber)primaryColor;
- (NSNumber)secondaryColor;
- (NSString)abbreviatedName;
- (NSString)awayLosses;
- (NSString)awayOvertimeLosses;
- (NSString)awayPoints;
- (NSString)awayTies;
- (NSString)awayWins;
- (NSString)gamesBehind;
- (NSString)gamesPlayed;
- (NSString)groupName;
- (NSString)groupPositionDescription;
- (NSString)homeLosses;
- (NSString)homeOvertimeLosses;
- (NSString)homePoints;
- (NSString)homeTies;
- (NSString)homeWins;
- (NSString)location;
- (NSString)losses;
- (NSString)monogram;
- (NSString)netRunRate;
- (NSString)overtimeLosses;
- (NSString)points;
- (NSString)pointsAgainst;
- (NSString)pointsFor;
- (NSString)qualificationPosition;
- (NSString)qualificationPositionSummary;
- (NSString)streakNumber;
- (NSString)streakType;
- (NSString)ties;
- (NSString)venueLocation;
- (NSString)venueName;
- (NSString)winPercentage;
- (NSString)wins;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAbbreviatedName:(id)a3;
- (void)setAlwaysUseAthleteFullName:(BOOL)a3;
- (void)setAthletes:(id)a3;
- (void)setAwayLosses:(id)a3;
- (void)setAwayOvertimeLosses:(id)a3;
- (void)setAwayPoints:(id)a3;
- (void)setAwayTies:(id)a3;
- (void)setAwayWins:(id)a3;
- (void)setClinchedQualificationPosition:(id)a3;
- (void)setConferencePosition:(id)a3;
- (void)setGamesBehind:(id)a3;
- (void)setGamesPlayed:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupPosition:(id)a3;
- (void)setGroupPositionDescription:(id)a3;
- (void)setHomeLosses:(id)a3;
- (void)setHomeOvertimeLosses:(id)a3;
- (void)setHomePoints:(id)a3;
- (void)setHomeTies:(id)a3;
- (void)setHomeWins:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLosses:(id)a3;
- (void)setMonogram:(id)a3;
- (void)setNetRunRate:(id)a3;
- (void)setNews:(id)a3;
- (void)setOvertimeLosses:(id)a3;
- (void)setPoints:(id)a3;
- (void)setPointsAgainst:(id)a3;
- (void)setPointsFor:(id)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setQualificationPosition:(id)a3;
- (void)setQualificationPositionSummary:(id)a3;
- (void)setRankings:(id)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setStatistics:(id)a3;
- (void)setStreakNumber:(id)a3;
- (void)setStreakType:(id)a3;
- (void)setTies:(id)a3;
- (void)setVenueLocation:(id)a3;
- (void)setVenueName:(id)a3;
- (void)setWinPercentage:(id)a3;
- (void)setWins:(id)a3;
@end

@implementation SASportsTeam

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"Team";
}

+ (id)team
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)abbreviatedName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"abbreviatedName"];
}

- (void)setAbbreviatedName:(id)a3
{
}

- (BOOL)alwaysUseAthleteFullName
{
  return AceObjectBoolForProperty(self, @"alwaysUseAthleteFullName");
}

- (void)setAlwaysUseAthleteFullName:(BOOL)a3
{
}

- (NSArray)athletes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"athletes", v3);
}

- (void)setAthletes:(id)a3
{
}

- (NSString)awayLosses
{
  return (NSString *)[(AceObject *)self propertyForKey:@"awayLosses"];
}

- (void)setAwayLosses:(id)a3
{
}

- (NSString)awayOvertimeLosses
{
  return (NSString *)[(AceObject *)self propertyForKey:@"awayOvertimeLosses"];
}

- (void)setAwayOvertimeLosses:(id)a3
{
}

- (NSString)awayPoints
{
  return (NSString *)[(AceObject *)self propertyForKey:@"awayPoints"];
}

- (void)setAwayPoints:(id)a3
{
}

- (NSString)awayTies
{
  return (NSString *)[(AceObject *)self propertyForKey:@"awayTies"];
}

- (void)setAwayTies:(id)a3
{
}

- (NSString)awayWins
{
  return (NSString *)[(AceObject *)self propertyForKey:@"awayWins"];
}

- (void)setAwayWins:(id)a3
{
}

- (NSNumber)clinchedQualificationPosition
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"clinchedQualificationPosition"];
}

- (void)setClinchedQualificationPosition:(id)a3
{
}

- (NSNumber)conferencePosition
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"conferencePosition"];
}

- (void)setConferencePosition:(id)a3
{
}

- (NSString)gamesBehind
{
  return (NSString *)[(AceObject *)self propertyForKey:@"gamesBehind"];
}

- (void)setGamesBehind:(id)a3
{
}

- (NSString)gamesPlayed
{
  return (NSString *)[(AceObject *)self propertyForKey:@"gamesPlayed"];
}

- (void)setGamesPlayed:(id)a3
{
}

- (NSString)groupName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupName"];
}

- (void)setGroupName:(id)a3
{
}

- (NSNumber)groupPosition
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"groupPosition"];
}

- (void)setGroupPosition:(id)a3
{
}

- (NSString)groupPositionDescription
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupPositionDescription"];
}

- (void)setGroupPositionDescription:(id)a3
{
}

- (NSString)homeLosses
{
  return (NSString *)[(AceObject *)self propertyForKey:@"homeLosses"];
}

- (void)setHomeLosses:(id)a3
{
}

- (NSString)homeOvertimeLosses
{
  return (NSString *)[(AceObject *)self propertyForKey:@"homeOvertimeLosses"];
}

- (void)setHomeOvertimeLosses:(id)a3
{
}

- (NSString)homePoints
{
  return (NSString *)[(AceObject *)self propertyForKey:@"homePoints"];
}

- (void)setHomePoints:(id)a3
{
}

- (NSString)homeTies
{
  return (NSString *)[(AceObject *)self propertyForKey:@"homeTies"];
}

- (void)setHomeTies:(id)a3
{
}

- (NSString)homeWins
{
  return (NSString *)[(AceObject *)self propertyForKey:@"homeWins"];
}

- (void)setHomeWins:(id)a3
{
}

- (NSString)location
{
  return (NSString *)[(AceObject *)self propertyForKey:@"location"];
}

- (void)setLocation:(id)a3
{
}

- (NSString)losses
{
  return (NSString *)[(AceObject *)self propertyForKey:@"losses"];
}

- (void)setLosses:(id)a3
{
}

- (NSString)monogram
{
  return (NSString *)[(AceObject *)self propertyForKey:@"monogram"];
}

- (void)setMonogram:(id)a3
{
}

- (NSString)netRunRate
{
  return (NSString *)[(AceObject *)self propertyForKey:@"netRunRate"];
}

- (void)setNetRunRate:(id)a3
{
}

- (NSArray)news
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"news", v3);
}

- (void)setNews:(id)a3
{
}

- (NSString)overtimeLosses
{
  return (NSString *)[(AceObject *)self propertyForKey:@"overtimeLosses"];
}

- (void)setOvertimeLosses:(id)a3
{
}

- (NSString)points
{
  return (NSString *)[(AceObject *)self propertyForKey:@"points"];
}

- (void)setPoints:(id)a3
{
}

- (NSString)pointsAgainst
{
  return (NSString *)[(AceObject *)self propertyForKey:@"pointsAgainst"];
}

- (void)setPointsAgainst:(id)a3
{
}

- (NSString)pointsFor
{
  return (NSString *)[(AceObject *)self propertyForKey:@"pointsFor"];
}

- (void)setPointsFor:(id)a3
{
}

- (NSNumber)primaryColor
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"primaryColor"];
}

- (void)setPrimaryColor:(id)a3
{
}

- (NSString)qualificationPosition
{
  return (NSString *)[(AceObject *)self propertyForKey:@"qualificationPosition"];
}

- (void)setQualificationPosition:(id)a3
{
}

- (NSString)qualificationPositionSummary
{
  return (NSString *)[(AceObject *)self propertyForKey:@"qualificationPositionSummary"];
}

- (void)setQualificationPositionSummary:(id)a3
{
}

- (NSArray)rankings
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"rankings", v3);
}

- (void)setRankings:(id)a3
{
}

- (NSNumber)secondaryColor
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"secondaryColor"];
}

- (void)setSecondaryColor:(id)a3
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

- (NSString)streakNumber
{
  return (NSString *)[(AceObject *)self propertyForKey:@"streakNumber"];
}

- (void)setStreakNumber:(id)a3
{
}

- (NSString)streakType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"streakType"];
}

- (void)setStreakType:(id)a3
{
}

- (NSString)ties
{
  return (NSString *)[(AceObject *)self propertyForKey:@"ties"];
}

- (void)setTies:(id)a3
{
}

- (NSString)venueLocation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"venueLocation"];
}

- (void)setVenueLocation:(id)a3
{
}

- (NSString)venueName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"venueName"];
}

- (void)setVenueName:(id)a3
{
}

- (NSString)winPercentage
{
  return (NSString *)[(AceObject *)self propertyForKey:@"winPercentage"];
}

- (void)setWinPercentage:(id)a3
{
}

- (NSString)wins
{
  return (NSString *)[(AceObject *)self propertyForKey:@"wins"];
}

- (void)setWins:(id)a3
{
}

@end