@interface WLKSportsFavorite
- (BOOL)isHome;
- (NSDictionary)images;
- (NSString)ID;
- (NSString)abbreviation;
- (NSString)backgroundColor;
- (NSString)leagueId;
- (NSString)name;
- (NSString)nickName;
- (NSString)shortName;
- (WLKSportsFavorite)initWithDictionary:(id)a3;
- (WLKSportsFavorite)initWithID:(id)a3;
@end

@implementation WLKSportsFavorite

- (WLKSportsFavorite)initWithID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLKSportsFavorite;
  v5 = [(WLKSportsFavorite *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    ID = v5->_ID;
    v5->_ID = (NSString *)v6;
  }
  return v5;
}

- (WLKSportsFavorite)initWithDictionary:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WLKSportsFavorite;
  v5 = [(WLKSportsFavorite *)&v30 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"abbreviation");
    abbreviation = v5->_abbreviation;
    v5->_abbreviation = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "wlk_stringForKey:", @"backgroundColor");
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "wlk_stringForKey:", @"id");
    ID = v5->_ID;
    v5->_ID = (NSString *)v10;

    v5->_isHome = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"isHome", 0);
    uint64_t v12 = objc_msgSend(v4, "wlk_stringForKey:", @"leagueId");
    leagueId = v5->_leagueId;
    v5->_leagueId = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "wlk_stringForKey:", @"name");
    name = v5->_name;
    v5->_name = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "wlk_stringForKey:", @"nickname");
    nickName = v5->_nickName;
    v5->_nickName = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v4, "wlk_stringForKey:", @"shortName");
    shortName = v5->_shortName;
    v5->_shortName = (NSString *)v18;

    v20 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"images");
    v21 = objc_msgSend(v20, "wlk_dictionaryForKey:", @"masterArtLogo");
    v22 = objc_msgSend(v20, "wlk_dictionaryForKey:", @"teamLogo");
    v23 = [[WLKSportImageDetails alloc] initWithDictionary:v21];
    v24 = [[WLKSportImageDetails alloc] initWithDictionary:v22];
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v26 = v25;
    if (v23) {
      [v25 setObject:v23 forKey:@"masterArtLogo"];
    }
    if (v24) {
      [v26 setObject:v24 forKey:@"teamLogo"];
    }
    uint64_t v27 = [v26 copy];
    images = v5->_images;
    v5->_images = (NSDictionary *)v27;
  }
  return v5;
}

- (NSString)abbreviation
{
  return self->_abbreviation;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)ID
{
  return self->_ID;
}

- (BOOL)isHome
{
  return self->_isHome;
}

- (NSString)leagueId
{
  return self->_leagueId;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)nickName
{
  return self->_nickName;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSDictionary)images
{
  return self->_images;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_leagueId, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_abbreviation, 0);
}

@end