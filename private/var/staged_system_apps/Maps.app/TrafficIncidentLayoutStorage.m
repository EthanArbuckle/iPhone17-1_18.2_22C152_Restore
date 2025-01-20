@interface TrafficIncidentLayoutStorage
+ (id)sharedInstance;
- (id)_cachedIncidentLayoutWithIncidentKey:(id)a3;
- (id)_sharedUserDefaults;
- (id)cachedIncidentLayout;
- (id)cachedIncidentVotingLayout;
- (void)_saveIncidentLayout:(id)a3 withIncidentKey:(id)a4;
- (void)clearCache;
- (void)saveIncidentLayout:(id)a3;
- (void)saveIncidentVotingLayout:(id)a3;
@end

@implementation TrafficIncidentLayoutStorage

- (id)_cachedIncidentLayoutWithIncidentKey:(id)a3
{
  id v4 = a3;
  v5 = [(TrafficIncidentLayoutStorage *)self _sharedUserDefaults];
  v6 = [v5 objectForKey:v4];

  id v12 = 0;
  v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v12];
  id v8 = v12;
  if (v8)
  {
    v9 = sub_100576E2C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "TrafficIncidentLayoutStorage error decoding incidentLayout %@", buf, 0xCu);
    }

    id v10 = 0;
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (id)cachedIncidentLayout
{
  return [(TrafficIncidentLayoutStorage *)self _cachedIncidentLayoutWithIncidentKey:@"TrafficIncidentLayoutDictionary"];
}

- (id)_sharedUserDefaults
{
  return +[NSUserDefaults __maps_groupUserDefaults];
}

+ (id)sharedInstance
{
  if (qword_10160F110 != -1) {
    dispatch_once(&qword_10160F110, &stru_1012EF200);
  }
  v2 = (void *)qword_10160F118;

  return v2;
}

- (void)clearCache
{
  id v2 = [(TrafficIncidentLayoutStorage *)self _sharedUserDefaults];
  [v2 setObject:0 forKey:@"TrafficIncidentVotingDictionary"];
  [v2 setObject:0 forKey:@"TrafficIncidentLayoutDictionary"];
  [v2 synchronize];
}

- (void)saveIncidentVotingLayout:(id)a3
{
}

- (void)saveIncidentLayout:(id)a3
{
}

- (void)_saveIncidentLayout:(id)a3 withIncidentKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TrafficIncidentLayoutStorage *)self _sharedUserDefaults];
  id v12 = 0;
  v9 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v12];

  id v10 = v12;
  if (v10)
  {
    v11 = sub_100576E2C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutStorage error archiving incidentLayout %@", buf, 0xCu);
    }
  }
  [v8 setObject:v9 forKey:v6];
  [v8 synchronize];
}

- (id)cachedIncidentVotingLayout
{
  return [(TrafficIncidentLayoutStorage *)self _cachedIncidentLayoutWithIncidentKey:@"TrafficIncidentVotingDictionary"];
}

@end