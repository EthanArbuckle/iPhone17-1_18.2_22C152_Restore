@interface FCSportsData
- (BOOL)hideLocationInMasthead;
- (FCSportsData)initWithDictionary:(id)a3;
- (NSArray)topLevelGroupsTagIdentifiers;
- (NSDate)sportsEventStartTime;
- (NSString)UMCCanonicalID;
- (NSString)sportsFullName;
- (NSString)sportsLocation;
- (NSString)sportsNameAbbreviation;
- (NSString)sportsNickname;
- (NSString)sportsPrimaryName;
- (NSString)sportsSecondaryName;
- (NSString)sportsSecondaryShortName;
- (NSString)sportsTypeDisplayName;
- (NSString)sportsTypePluralizedDisplayName;
- (NSString)topLevelSportTagIdentifier;
- (unint64_t)sportsLeagueType;
- (unint64_t)sportsType;
- (void)_inflateSportsDataFromJSONDictionary:(id)a3;
- (void)setHideLocationInMasthead:(BOOL)a3;
- (void)setSportsEventStartTime:(id)a3;
- (void)setSportsFullName:(id)a3;
- (void)setSportsLeagueType:(unint64_t)a3;
- (void)setSportsLocation:(id)a3;
- (void)setSportsNameAbbreviation:(id)a3;
- (void)setSportsNickname:(id)a3;
- (void)setSportsPrimaryName:(id)a3;
- (void)setSportsSecondaryName:(id)a3;
- (void)setSportsSecondaryShortName:(id)a3;
- (void)setSportsType:(unint64_t)a3;
- (void)setSportsTypeDisplayName:(id)a3;
- (void)setSportsTypePluralizedDisplayName:(id)a3;
- (void)setTopLevelGroupsTagIdentifiers:(id)a3;
- (void)setTopLevelSportTagIdentifier:(id)a3;
- (void)setUMCCanonicalID:(id)a3;
@end

@implementation FCSportsData

- (FCSportsData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCSportsData;
  v5 = [(FCSportsData *)&v8 init];
  v6 = v5;
  if (v5) {
    [(FCSportsData *)v5 _inflateSportsDataFromJSONDictionary:v4];
  }

  return v6;
}

- (void)_inflateSportsDataFromJSONDictionary:(id)a3
{
  id v35 = a3;
  id v4 = [v35 objectForKeyedSubscript:@"umcCanonicalId"];
  UMCCanonicalID = self->_UMCCanonicalID;
  self->_UMCCanonicalID = v4;

  v6 = [v35 objectForKeyedSubscript:@"primaryName"];
  sportsPrimaryName = self->_sportsPrimaryName;
  self->_sportsPrimaryName = v6;

  objc_super v8 = [v35 objectForKeyedSubscript:@"nameAbbreviation"];
  sportsNameAbbreviation = self->_sportsNameAbbreviation;
  self->_sportsNameAbbreviation = v8;

  v10 = [v35 objectForKeyedSubscript:@"secondaryName"];
  sportsSecondaryName = self->_sportsSecondaryName;
  self->_sportsSecondaryName = v10;

  v12 = [v35 objectForKeyedSubscript:@"shortSecondaryName"];
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v14 = [v35 objectForKeyedSubscript:@"secondaryShortName"];
  }
  sportsSecondaryShortName = self->_sportsSecondaryShortName;
  self->_sportsSecondaryShortName = v14;

  v16 = [v35 objectForKeyedSubscript:@"fullName"];
  sportsFullName = self->_sportsFullName;
  self->_sportsFullName = v16;

  v18 = [v35 objectForKeyedSubscript:@"topLevelSportTagId"];
  topLevelSportTagIdentifier = self->_topLevelSportTagIdentifier;
  self->_topLevelSportTagIdentifier = v18;

  v20 = [v35 objectForKeyedSubscript:@"topLevelGroupsTagIds"];
  topLevelGroupsTagIdentifiers = self->_topLevelGroupsTagIdentifiers;
  self->_topLevelGroupsTagIdentifiers = v20;

  v22 = [v35 objectForKeyedSubscript:@"nickname"];
  if (!v22)
  {
    v22 = [v35 objectForKeyedSubscript:@"nickName"];
  }
  objc_storeStrong((id *)&self->_sportsNickname, v22);
  v23 = [v35 objectForKeyedSubscript:@"location"];
  sportsLocation = self->_sportsLocation;
  self->_sportsLocation = v23;

  v25 = [v35 objectForKeyedSubscript:@"hideLocationInMasthead"];
  self->_hideLocationInMasthead = [v25 BOOLValue];
  v26 = [v35 objectForKeyedSubscript:@"sportsType"];
  self->_sportsType = FCSportsTypeFromString((uint64_t)v26);
  v27 = [v35 objectForKeyedSubscript:@"sportsTypeDisplayName"];
  sportsTypeDisplayName = self->_sportsTypeDisplayName;
  self->_sportsTypeDisplayName = v27;

  v29 = [v35 objectForKeyedSubscript:@"sportsTypePluralizedDisplayName"];
  sportsTypePluralizedDisplayName = self->_sportsTypePluralizedDisplayName;
  self->_sportsTypePluralizedDisplayName = v29;

  v31 = [v35 objectForKeyedSubscript:@"leagueType"];
  self->_sportsLeagueType = FCSportsLeagueTypeFromString((uint64_t)v31);
  v32 = [v35 objectForKeyedSubscript:@"startTime"];
  if (v32)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateFromStringWithISO8601Format:", v32);
    v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
    sportsEventStartTime = self->_sportsEventStartTime;
    self->_sportsEventStartTime = v33;
  }
  else
  {
    sportsEventStartTime = self->_sportsEventStartTime;
    self->_sportsEventStartTime = 0;
  }
}

- (NSString)UMCCanonicalID
{
  return self->_UMCCanonicalID;
}

- (void)setUMCCanonicalID:(id)a3
{
}

- (NSString)sportsPrimaryName
{
  return self->_sportsPrimaryName;
}

- (void)setSportsPrimaryName:(id)a3
{
}

- (NSString)sportsNameAbbreviation
{
  return self->_sportsNameAbbreviation;
}

- (void)setSportsNameAbbreviation:(id)a3
{
}

- (NSString)sportsSecondaryName
{
  return self->_sportsSecondaryName;
}

- (void)setSportsSecondaryName:(id)a3
{
}

- (NSString)sportsSecondaryShortName
{
  return self->_sportsSecondaryShortName;
}

- (void)setSportsSecondaryShortName:(id)a3
{
}

- (NSString)sportsFullName
{
  return self->_sportsFullName;
}

- (void)setSportsFullName:(id)a3
{
}

- (NSString)topLevelSportTagIdentifier
{
  return self->_topLevelSportTagIdentifier;
}

- (void)setTopLevelSportTagIdentifier:(id)a3
{
}

- (NSArray)topLevelGroupsTagIdentifiers
{
  return self->_topLevelGroupsTagIdentifiers;
}

- (void)setTopLevelGroupsTagIdentifiers:(id)a3
{
}

- (NSString)sportsNickname
{
  return self->_sportsNickname;
}

- (void)setSportsNickname:(id)a3
{
}

- (NSString)sportsLocation
{
  return self->_sportsLocation;
}

- (void)setSportsLocation:(id)a3
{
}

- (BOOL)hideLocationInMasthead
{
  return self->_hideLocationInMasthead;
}

- (void)setHideLocationInMasthead:(BOOL)a3
{
  self->_hideLocationInMasthead = a3;
}

- (unint64_t)sportsType
{
  return self->_sportsType;
}

- (void)setSportsType:(unint64_t)a3
{
  self->_sportsType = a3;
}

- (NSString)sportsTypeDisplayName
{
  return self->_sportsTypeDisplayName;
}

- (void)setSportsTypeDisplayName:(id)a3
{
}

- (NSString)sportsTypePluralizedDisplayName
{
  return self->_sportsTypePluralizedDisplayName;
}

- (void)setSportsTypePluralizedDisplayName:(id)a3
{
}

- (unint64_t)sportsLeagueType
{
  return self->_sportsLeagueType;
}

- (void)setSportsLeagueType:(unint64_t)a3
{
  self->_sportsLeagueType = a3;
}

- (NSDate)sportsEventStartTime
{
  return self->_sportsEventStartTime;
}

- (void)setSportsEventStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsEventStartTime, 0);
  objc_storeStrong((id *)&self->_sportsTypePluralizedDisplayName, 0);
  objc_storeStrong((id *)&self->_sportsTypeDisplayName, 0);
  objc_storeStrong((id *)&self->_sportsLocation, 0);
  objc_storeStrong((id *)&self->_sportsNickname, 0);
  objc_storeStrong((id *)&self->_topLevelGroupsTagIdentifiers, 0);
  objc_storeStrong((id *)&self->_topLevelSportTagIdentifier, 0);
  objc_storeStrong((id *)&self->_sportsFullName, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryShortName, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryName, 0);
  objc_storeStrong((id *)&self->_sportsNameAbbreviation, 0);
  objc_storeStrong((id *)&self->_sportsPrimaryName, 0);
  objc_storeStrong((id *)&self->_UMCCanonicalID, 0);
}

@end