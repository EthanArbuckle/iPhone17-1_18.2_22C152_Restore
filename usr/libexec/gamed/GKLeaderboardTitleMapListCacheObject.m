@interface GKLeaderboardTitleMapListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKLeaderboardTitleMapListCacheObject

+ (id)entityName
{
  return @"LeaderboardTitleMapList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardTitleMapListCacheObject;
  id v6 = a3;
  [(GKExpiringCacheObject *)&v8 updateWithServerRepresentation:v6 expirationDate:a4];
  v7 = [v6 objectForKeyedSubscript:@"results" v8.receiver, v8.super_class];

  [(GKListCacheObject *)self updateEntriesWithRepresentations:v7 entryForRepresentation:&stru_1002DA038 reuseEntriesByIndex:1];
}

@end