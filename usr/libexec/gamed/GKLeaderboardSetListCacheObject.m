@interface GKLeaderboardSetListCacheObject
+ (Class)entryClass;
+ (id)entityName;
- (BOOL)isValid;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKLeaderboardSetListCacheObject

+ (id)entityName
{
  return @"LeaderboardSetList";
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardSetListCacheObject;
  id v6 = a3;
  [(GKExpiringCacheObject *)&v8 updateWithServerRepresentation:v6 expirationDate:a4];
  v7 = [v6 objectForKeyedSubscript:@"results" v8.receiver, v8.super_class];

  [(GKListCacheObject *)self updateEntriesWithRepresentations:v7 entryForRepresentation:&stru_1002D9FF0 reuseEntriesByIndex:1];
}

- (BOOL)isValid
{
  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardSetListCacheObject;
  if (![(GKExpiringCacheObject *)&v7 isValid]) {
    return 0;
  }
  v3 = [(GKLeaderboardSetListCacheObject *)self game];
  v4 = [v3 name];
  BOOL v5 = v4 != 0;

  return v5;
}

@end