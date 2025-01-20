@interface WLKBasicSportingEventMetadata
- (NSDate)startGameTime;
- (NSString)leagueName;
- (NSString)leagueShortName;
- (WLKBasicSportingEventMetadata)initWithDictionary:(id)a3;
@end

@implementation WLKBasicSportingEventMetadata

- (WLKBasicSportingEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WLKBasicSportingEventMetadata;
  v5 = [(WLKBasicContentMetadata *)&v16 initWithDictionary:v4];
  if (v5)
  {
    v6 = objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", @"startGameTime");
    uint64_t v7 = [v6 copy];
    startGameTime = v5->_startGameTime;
    v5->_startGameTime = (NSDate *)v7;

    v9 = objc_msgSend(v4, "wlk_stringForKey:", @"leagueName");
    uint64_t v10 = [v9 copy];
    leagueName = v5->_leagueName;
    v5->_leagueName = (NSString *)v10;

    v12 = objc_msgSend(v4, "wlk_stringForKey:", @"leagueShortName");
    uint64_t v13 = [v12 copy];
    leagueShortName = v5->_leagueShortName;
    v5->_leagueShortName = (NSString *)v13;
  }
  return v5;
}

- (NSDate)startGameTime
{
  return self->_startGameTime;
}

- (NSString)leagueName
{
  return self->_leagueName;
}

- (NSString)leagueShortName
{
  return self->_leagueShortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leagueShortName, 0);
  objc_storeStrong((id *)&self->_leagueName, 0);

  objc_storeStrong((id *)&self->_startGameTime, 0);
}

@end