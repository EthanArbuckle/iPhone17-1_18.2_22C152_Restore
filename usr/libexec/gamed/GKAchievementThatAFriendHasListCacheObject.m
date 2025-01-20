@interface GKAchievementThatAFriendHasListCacheObject
+ (id)dateFromMillisecondsSinceEpoch:(double)a3;
+ (id)entityName;
+ (id)friendsForAchievement:(id)a3 plist:(id)a4 profileProvider:(id)a5;
- (BOOL)isValid;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4 playerId:(id)a5 achievementId:(id)a6;
@end

@implementation GKAchievementThatAFriendHasListCacheObject

+ (id)entityName
{
  return @"AchievementThatAFriendHasList";
}

+ (id)friendsForAchievement:(id)a3 plist:(id)a4 profileProvider:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = [v8 objectForKeyedSubscript:@"results"];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000E8BB8;
  v39[3] = &unk_1002D9EB0;
  id v12 = v7;
  id v40 = v12;
  id v13 = [v11 indexOfObjectPassingTest:v39];

  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = [v10 copy];
  }
  else
  {
    id v31 = v12;
    id v32 = v8;
    v34 = v10;
    v15 = [v8 objectForKeyedSubscript:@"results"];
    v16 = [v15 objectAtIndexedSubscript:v13];

    [v16 objectForKeyedSubscript:@"friends-with-achievement"];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v17 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v22 = [v21 objectForKeyedSubscript:@"friend-player-id"];
          v23 = v9[2](v9, v22);

          v24 = [v21 objectForKeyedSubscript:@"timestamp"];
          [v24 doubleValue];
          double v26 = v25;

          uint64_t v27 = +[GKAchievementThatAFriendHasListCacheObject dateFromMillisecondsSinceEpoch:v26];
          v28 = (void *)v27;
          if (v23)
          {
            v41[0] = @"friend";
            v41[1] = @"timestamp";
            v42[0] = v23;
            v42[1] = v27;
            v29 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
            [v34 addObject:v29];
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v18);
    }
    id v10 = v34;
    id v14 = [v34 copy];

    id v12 = v31;
    id v8 = v32;
  }

  return v14;
}

+ (id)dateFromMillisecondsSinceEpoch:(double)a3
{
  double v4 = fabs(a3);
  id v5 = objc_alloc((Class)NSDate);
  double v6 = a3 / 1000.0;
  if (v4 == INFINITY) {
    double v6 = 0.0;
  }
  id v7 = [v5 initWithTimeIntervalSince1970:v6];

  return v7;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4 playerId:(id)a5 achievementId:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)GKAchievementThatAFriendHasListCacheObject;
  id v9 = a6;
  id v10 = a3;
  [(GKExpiringCacheObject *)&v14 updateWithServerRepresentation:v10 expirationDate:a4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000E8D94;
  v13[3] = &unk_1002D9ED8;
  v13[4] = self;
  v11 = objc_retainBlock(v13);
  id v12 = +[GKAchievementThatAFriendHasListCacheObject friendsForAchievement:v9 plist:v10 profileProvider:v11];

  [(GKListCacheObject *)self updateEntriesWithRepresentations:v12 entryForRepresentation:&stru_1002D9F18 reuseEntriesByIndex:1];
}

- (BOOL)isValid
{
  v7.receiver = self;
  v7.super_class = (Class)GKAchievementThatAFriendHasListCacheObject;
  if (![(GKExpiringCacheObject *)&v7 isValid]) {
    return 0;
  }
  v3 = [(GKAchievementThatAFriendHasListCacheObject *)self game];
  double v4 = [v3 name];
  BOOL v5 = v4 != 0;

  return v5;
}

@end