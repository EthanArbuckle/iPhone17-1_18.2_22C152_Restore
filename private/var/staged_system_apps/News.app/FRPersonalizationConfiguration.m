@interface FRPersonalizationConfiguration
- (BOOL)hasAutoFavorites;
- (BOOL)hasBundleIDMapping;
- (BOOL)hasUrlMapping;
- (FCKeyValueStore)keyValueStore;
- (FCPersonalizationBundleIDMapping)bundleIDMapping;
- (FCPersonalizationFavorabilityScores)favorabilityScores;
- (FCPersonalizationTodaySectionMapping)todaySectionMapping;
- (FCPersonalizationURLMapping)urlMapping;
- (FCPersonalizationWhitelist)whitelist;
- (FRPersonalizationAutoFavorites)autoFavorites;
- (FRPersonalizationConfiguration)initWithKeyValueStore:(id)a3;
- (NFLazy)lazyBundleIDMapping;
- (NFLazy)lazyFavorabilityScores;
- (NFLazy)lazyURLMapping;
- (NFLazy)lazyWhitelist;
- (NSDate)coreDuetLastQueryDate;
- (NSDate)portraitLastQueryDate;
- (id)jsonEncodableObject;
- (void)setAutoFavorites:(id)a3;
- (void)setBundleIDMappingData:(id)a3;
- (void)setCoreDuetLastQueryDate:(id)a3;
- (void)setFavorabilityScoresData:(id)a3;
- (void)setKeyValueStore:(id)a3;
- (void)setPortraitLastQueryDate:(id)a3;
- (void)setTodaySectionMapping:(id)a3;
- (void)setURLMappingData:(id)a3;
- (void)setWhitelistData:(id)a3;
@end

@implementation FRPersonalizationConfiguration

- (FCPersonalizationURLMapping)urlMapping
{
  v2 = [(FRPersonalizationConfiguration *)self lazyURLMapping];
  v3 = [v2 value];

  return (FCPersonalizationURLMapping *)v3;
}

- (FCPersonalizationWhitelist)whitelist
{
  v2 = [(FRPersonalizationConfiguration *)self lazyWhitelist];
  v3 = [v2 value];

  return (FCPersonalizationWhitelist *)v3;
}

- (FCPersonalizationBundleIDMapping)bundleIDMapping
{
  v2 = [(FRPersonalizationConfiguration *)self lazyBundleIDMapping];
  v3 = [v2 value];

  return (FCPersonalizationBundleIDMapping *)v3;
}

- (FCPersonalizationFavorabilityScores)favorabilityScores
{
  v2 = [(FRPersonalizationConfiguration *)self lazyFavorabilityScores];
  v3 = [v2 value];

  return (FCPersonalizationFavorabilityScores *)v3;
}

- (void)setURLMappingData:(id)a3
{
  id v4 = a3;
  v5 = [(FRPersonalizationConfiguration *)self keyValueStore];
  [v5 setObject:v4 forKeyedSubscript:@"url_mapping"];

  id v6 = [(FRPersonalizationConfiguration *)self lazyURLMapping];
  [v6 reset];
}

- (void)setFavorabilityScoresData:(id)a3
{
  id v4 = a3;
  v5 = [(FRPersonalizationConfiguration *)self keyValueStore];
  [v5 setObject:v4 forKeyedSubscript:@"favorability_scores"];

  id v6 = [(FRPersonalizationConfiguration *)self lazyFavorabilityScores];
  [v6 reset];
}

- (void)setBundleIDMappingData:(id)a3
{
  id v4 = a3;
  v5 = [(FRPersonalizationConfiguration *)self keyValueStore];
  [v5 setObject:v4 forKeyedSubscript:@"bundle_id_mapping"];

  id v6 = [(FRPersonalizationConfiguration *)self lazyBundleIDMapping];
  [v6 reset];
}

- (void)setWhitelistData:(id)a3
{
  id v4 = a3;
  v5 = [(FRPersonalizationConfiguration *)self keyValueStore];
  [v5 setObject:v4 forKeyedSubscript:@"whitelist"];

  id v6 = [(FRPersonalizationConfiguration *)self lazyWhitelist];
  [v6 reset];
}

- (NSDate)portraitLastQueryDate
{
  objc_opt_class();
  v3 = [(FRPersonalizationConfiguration *)self keyValueStore];
  id v4 = [v3 objectForKey:@"portrait_last_query_date"];
  v5 = FCDynamicCast();

  return (NSDate *)v5;
}

- (NSDate)coreDuetLastQueryDate
{
  objc_opt_class();
  v3 = [(FRPersonalizationConfiguration *)self keyValueStore];
  id v4 = [v3 objectForKey:@"core_duet_last_query_date"];
  v5 = FCDynamicCast();

  return (NSDate *)v5;
}

- (FRPersonalizationAutoFavorites)autoFavorites
{
  objc_opt_class();
  v3 = [(FRPersonalizationConfiguration *)self keyValueStore];
  id v4 = [v3 objectForKey:@"auto_favorites"];
  v5 = FCDynamicCast();

  if (v5)
  {
    id v9 = 0;
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v9];
    id v7 = v9;
    if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007A410();
    }
  }
  else
  {
    id v6 = 0;
  }

  return (FRPersonalizationAutoFavorites *)v6;
}

- (FRPersonalizationConfiguration)initWithKeyValueStore:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FRPersonalizationConfiguration;
  id v6 = [(FRPersonalizationConfiguration *)&v32 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keyValueStore, a3);
    id v8 = objc_alloc((Class)NFLazy);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100006DC0;
    v30[3] = &unk_1000C7918;
    id v9 = v5;
    id v31 = v9;
    v10 = (NFLazy *)[v8 initWithConstructor:v30];
    lazyURLMapping = v7->_lazyURLMapping;
    v7->_lazyURLMapping = v10;

    id v12 = objc_alloc((Class)NFLazy);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100007AC0;
    v28[3] = &unk_1000C7918;
    id v13 = v9;
    id v29 = v13;
    v14 = (NFLazy *)[v12 initWithConstructor:v28];
    lazyBundleIDMapping = v7->_lazyBundleIDMapping;
    v7->_lazyBundleIDMapping = v14;

    id v16 = objc_alloc((Class)NFLazy);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100006A40;
    v26[3] = &unk_1000C7918;
    id v17 = v13;
    id v27 = v17;
    v18 = (NFLazy *)[v16 initWithConstructor:v26];
    lazyFavorabilityScores = v7->_lazyFavorabilityScores;
    v7->_lazyFavorabilityScores = v18;

    id v20 = objc_alloc((Class)NFLazy);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100006FE4;
    v24[3] = &unk_1000C7918;
    id v25 = v17;
    v21 = (NFLazy *)[v20 initWithConstructor:v24];
    lazyWhitelist = v7->_lazyWhitelist;
    v7->_lazyWhitelist = v21;
  }
  return v7;
}

- (NFLazy)lazyWhitelist
{
  return self->_lazyWhitelist;
}

- (NFLazy)lazyURLMapping
{
  return self->_lazyURLMapping;
}

- (NFLazy)lazyFavorabilityScores
{
  return self->_lazyFavorabilityScores;
}

- (NFLazy)lazyBundleIDMapping
{
  return self->_lazyBundleIDMapping;
}

- (FCKeyValueStore)keyValueStore
{
  return self->_keyValueStore;
}

- (BOOL)hasUrlMapping
{
  v2 = [(FRPersonalizationConfiguration *)self keyValueStore];
  unsigned __int8 v3 = [v2 containsObjectForKey:@"url_mapping"];

  return v3;
}

- (BOOL)hasAutoFavorites
{
  v2 = [(FRPersonalizationConfiguration *)self keyValueStore];
  unsigned __int8 v3 = [v2 containsObjectForKey:@"auto_favorites"];

  return v3;
}

- (BOOL)hasBundleIDMapping
{
  v2 = [(FRPersonalizationConfiguration *)self keyValueStore];
  unsigned __int8 v3 = [v2 containsObjectForKey:@"bundle_id_mapping"];

  return v3;
}

- (FCPersonalizationTodaySectionMapping)todaySectionMapping
{
  todaySectionMapping = self->_todaySectionMapping;
  if (!todaySectionMapping)
  {
    objc_opt_class();
    id v4 = [(FRPersonalizationConfiguration *)self keyValueStore];
    id v5 = [v4 objectForKey:@"today_section_mapping"];
    id v6 = FCDynamicCast();

    if (v6)
    {
      id v11 = 0;
      id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v11];
      id v8 = v11;
      if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10007A288();
      }
    }
    else
    {
      id v7 = 0;
    }
    id v9 = self->_todaySectionMapping;
    self->_todaySectionMapping = v7;

    todaySectionMapping = self->_todaySectionMapping;
  }

  return todaySectionMapping;
}

- (void)setTodaySectionMapping:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_todaySectionMapping, a3);
  id v6 = [(FRPersonalizationConfiguration *)self keyValueStore];
  id v9 = 0;
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v9];
  id v8 = v9;
  [v6 setObject:v7 forKey:@"today_section_mapping"];

  if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007A34C();
  }
}

- (void)setCoreDuetLastQueryDate:(id)a3
{
  id v4 = a3;
  id v5 = [(FRPersonalizationConfiguration *)self keyValueStore];
  [v5 setObject:v4 forKey:@"core_duet_last_query_date"];
}

- (void)setPortraitLastQueryDate:(id)a3
{
  id v4 = a3;
  id v5 = [(FRPersonalizationConfiguration *)self keyValueStore];
  [v5 setObject:v4 forKey:@"portrait_last_query_date"];
}

- (void)setAutoFavorites:(id)a3
{
  id v4 = a3;
  id v5 = [(FRPersonalizationConfiguration *)self keyValueStore];
  id v6 = v5;
  if (v4)
  {
    id v9 = 0;
    id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v9];
    id v8 = v9;
    [v6 setObject:v7 forKey:@"auto_favorites"];

    if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10007A4D4();
    }
  }
  else
  {
    [v5 removeObjectForKey:@"auto_favorites"];
  }
}

- (id)jsonEncodableObject
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100063420;
  v4[3] = &unk_1000C6FC0;
  v4[4] = self;
  v2 = +[NSDictionary fc_dictionary:v4];

  return v2;
}

- (void)setKeyValueStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyWhitelist, 0);
  objc_storeStrong((id *)&self->_lazyFavorabilityScores, 0);
  objc_storeStrong((id *)&self->_lazyBundleIDMapping, 0);
  objc_storeStrong((id *)&self->_lazyURLMapping, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);

  objc_storeStrong((id *)&self->_todaySectionMapping, 0);
}

@end