@interface SASportsMatchup
+ (id)matchup;
- (BOOL)isAvailable;
- (BOOL)isOnNow;
- (BOOL)isWatchlistable;
- (NSArray)awayLineScores;
- (NSArray)homeLineScores;
- (NSArray)playSummaries;
- (NSArray)tvChannels;
- (NSDate)startTime;
- (NSNumber)awayShootoutPoints;
- (NSNumber)expectedLineScoreCount;
- (NSNumber)homeShootoutPoints;
- (NSNumber)isExplicitlyEndOfPeriod;
- (NSNumber)playoff;
- (NSNumber)statsId;
- (NSNumber)timeTBD;
- (NSString)awayScore;
- (NSString)awayTeamRecordSummary;
- (NSString)currentPeriod;
- (NSString)favoredEntity;
- (NSString)gameSummary;
- (NSString)gameType;
- (NSString)homeScore;
- (NSString)homeTeamRecordSummary;
- (NSString)line;
- (NSString)location;
- (NSString)locationName;
- (NSString)matchupOrder;
- (NSString)overUnder;
- (NSString)periodDescription;
- (NSString)status;
- (NSString)timeRemaining;
- (NSString)title;
- (NSString)tournamentSeriesDescription;
- (NSString)winningEntity;
- (SALCMLiveTuneInButton)liveTuneInButton;
- (SALCMToggleButton)toggleButton;
- (SAServerBoundCommand)getAppsCommand;
- (SAServerBoundCommand)getModalDetailSnippetCommand;
- (SASportsEntity)awayEntity;
- (SASportsEntity)homeEntity;
- (SAUIAppPunchOut)punchout;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAwayEntity:(id)a3;
- (void)setAwayLineScores:(id)a3;
- (void)setAwayScore:(id)a3;
- (void)setAwayShootoutPoints:(id)a3;
- (void)setAwayTeamRecordSummary:(id)a3;
- (void)setCurrentPeriod:(id)a3;
- (void)setExpectedLineScoreCount:(id)a3;
- (void)setFavoredEntity:(id)a3;
- (void)setGameSummary:(id)a3;
- (void)setGameType:(id)a3;
- (void)setGetAppsCommand:(id)a3;
- (void)setGetModalDetailSnippetCommand:(id)a3;
- (void)setHomeEntity:(id)a3;
- (void)setHomeLineScores:(id)a3;
- (void)setHomeScore:(id)a3;
- (void)setHomeShootoutPoints:(id)a3;
- (void)setHomeTeamRecordSummary:(id)a3;
- (void)setIsAvailable:(BOOL)a3;
- (void)setIsExplicitlyEndOfPeriod:(id)a3;
- (void)setIsOnNow:(BOOL)a3;
- (void)setIsWatchlistable:(BOOL)a3;
- (void)setLine:(id)a3;
- (void)setLiveTuneInButton:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationName:(id)a3;
- (void)setMatchupOrder:(id)a3;
- (void)setOverUnder:(id)a3;
- (void)setPeriodDescription:(id)a3;
- (void)setPlaySummaries:(id)a3;
- (void)setPlayoff:(id)a3;
- (void)setPunchout:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setStatsId:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTimeRemaining:(id)a3;
- (void)setTimeTBD:(id)a3;
- (void)setTitle:(id)a3;
- (void)setToggleButton:(id)a3;
- (void)setTournamentSeriesDescription:(id)a3;
- (void)setTvChannels:(id)a3;
- (void)setWinningEntity:(id)a3;
@end

@implementation SASportsMatchup

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"Matchup";
}

+ (id)matchup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASportsEntity)awayEntity
{
  return (SASportsEntity *)AceObjectAceObjectForProperty(self, @"awayEntity");
}

- (void)setAwayEntity:(id)a3
{
}

- (NSArray)awayLineScores
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"awayLineScores", v3);
}

- (void)setAwayLineScores:(id)a3
{
}

- (NSString)awayScore
{
  return (NSString *)[(AceObject *)self propertyForKey:@"awayScore"];
}

- (void)setAwayScore:(id)a3
{
}

- (NSNumber)awayShootoutPoints
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"awayShootoutPoints"];
}

- (void)setAwayShootoutPoints:(id)a3
{
}

- (NSString)awayTeamRecordSummary
{
  return (NSString *)[(AceObject *)self propertyForKey:@"awayTeamRecordSummary"];
}

- (void)setAwayTeamRecordSummary:(id)a3
{
}

- (NSString)currentPeriod
{
  return (NSString *)[(AceObject *)self propertyForKey:@"currentPeriod"];
}

- (void)setCurrentPeriod:(id)a3
{
}

- (NSNumber)expectedLineScoreCount
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"expectedLineScoreCount"];
}

- (void)setExpectedLineScoreCount:(id)a3
{
}

- (NSString)favoredEntity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"favoredEntity"];
}

- (void)setFavoredEntity:(id)a3
{
}

- (NSString)gameSummary
{
  return (NSString *)[(AceObject *)self propertyForKey:@"gameSummary"];
}

- (void)setGameSummary:(id)a3
{
}

- (NSString)gameType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"gameType"];
}

- (void)setGameType:(id)a3
{
}

- (SAServerBoundCommand)getAppsCommand
{
  return (SAServerBoundCommand *)AceObjectAceObjectForProperty(self, @"getAppsCommand");
}

- (void)setGetAppsCommand:(id)a3
{
}

- (SAServerBoundCommand)getModalDetailSnippetCommand
{
  return (SAServerBoundCommand *)AceObjectAceObjectForProperty(self, @"getModalDetailSnippetCommand");
}

- (void)setGetModalDetailSnippetCommand:(id)a3
{
}

- (SASportsEntity)homeEntity
{
  return (SASportsEntity *)AceObjectAceObjectForProperty(self, @"homeEntity");
}

- (void)setHomeEntity:(id)a3
{
}

- (NSArray)homeLineScores
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"homeLineScores", v3);
}

- (void)setHomeLineScores:(id)a3
{
}

- (NSString)homeScore
{
  return (NSString *)[(AceObject *)self propertyForKey:@"homeScore"];
}

- (void)setHomeScore:(id)a3
{
}

- (NSNumber)homeShootoutPoints
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"homeShootoutPoints"];
}

- (void)setHomeShootoutPoints:(id)a3
{
}

- (NSString)homeTeamRecordSummary
{
  return (NSString *)[(AceObject *)self propertyForKey:@"homeTeamRecordSummary"];
}

- (void)setHomeTeamRecordSummary:(id)a3
{
}

- (BOOL)isAvailable
{
  return AceObjectBoolForProperty(self, @"isAvailable");
}

- (void)setIsAvailable:(BOOL)a3
{
}

- (NSNumber)isExplicitlyEndOfPeriod
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isExplicitlyEndOfPeriod"];
}

- (void)setIsExplicitlyEndOfPeriod:(id)a3
{
}

- (BOOL)isOnNow
{
  return AceObjectBoolForProperty(self, @"isOnNow");
}

- (void)setIsOnNow:(BOOL)a3
{
}

- (BOOL)isWatchlistable
{
  return AceObjectBoolForProperty(self, @"isWatchlistable");
}

- (void)setIsWatchlistable:(BOOL)a3
{
}

- (NSString)line
{
  return (NSString *)[(AceObject *)self propertyForKey:@"line"];
}

- (void)setLine:(id)a3
{
}

- (SALCMLiveTuneInButton)liveTuneInButton
{
  return (SALCMLiveTuneInButton *)AceObjectAceObjectForProperty(self, @"liveTuneInButton");
}

- (void)setLiveTuneInButton:(id)a3
{
}

- (NSString)location
{
  return (NSString *)[(AceObject *)self propertyForKey:@"location"];
}

- (void)setLocation:(id)a3
{
}

- (NSString)locationName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"locationName"];
}

- (void)setLocationName:(id)a3
{
}

- (NSString)matchupOrder
{
  return (NSString *)[(AceObject *)self propertyForKey:@"matchupOrder"];
}

- (void)setMatchupOrder:(id)a3
{
}

- (NSString)overUnder
{
  return (NSString *)[(AceObject *)self propertyForKey:@"overUnder"];
}

- (void)setOverUnder:(id)a3
{
}

- (NSString)periodDescription
{
  return (NSString *)[(AceObject *)self propertyForKey:@"periodDescription"];
}

- (void)setPeriodDescription:(id)a3
{
}

- (NSArray)playSummaries
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"playSummaries", v3);
}

- (void)setPlaySummaries:(id)a3
{
}

- (NSNumber)playoff
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"playoff"];
}

- (void)setPlayoff:(id)a3
{
}

- (SAUIAppPunchOut)punchout
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"punchout");
}

- (void)setPunchout:(id)a3
{
}

- (NSDate)startTime
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"startTime"];
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)statsId
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"statsId"];
}

- (void)setStatsId:(id)a3
{
}

- (NSString)status
{
  return (NSString *)[(AceObject *)self propertyForKey:@"status"];
}

- (void)setStatus:(id)a3
{
}

- (NSString)timeRemaining
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeRemaining"];
}

- (void)setTimeRemaining:(id)a3
{
}

- (NSNumber)timeTBD
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"timeTBD"];
}

- (void)setTimeTBD:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (SALCMToggleButton)toggleButton
{
  return (SALCMToggleButton *)AceObjectAceObjectForProperty(self, @"toggleButton");
}

- (void)setToggleButton:(id)a3
{
}

- (NSString)tournamentSeriesDescription
{
  return (NSString *)[(AceObject *)self propertyForKey:@"tournamentSeriesDescription"];
}

- (void)setTournamentSeriesDescription:(id)a3
{
}

- (NSArray)tvChannels
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"tvChannels"];
}

- (void)setTvChannels:(id)a3
{
}

- (NSString)winningEntity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"winningEntity"];
}

- (void)setWinningEntity:(id)a3
{
}

@end