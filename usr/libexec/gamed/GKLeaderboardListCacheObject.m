@interface GKLeaderboardListCacheObject
+ (id)entityName;
- (BOOL)isValid;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKLeaderboardListCacheObject

+ (id)entityName
{
  return @"LeaderboardList";
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardListCacheObject;
  id v6 = a3;
  [(GKExpiringCacheObject *)&v8 updateWithServerRepresentation:v6 expirationDate:a4];
  v7 = [v6 objectForKeyedSubscript:@"results" v8.receiver, v8.super_class];

  [(GKListCacheObject *)self updateEntriesWithRepresentations:v7 entryForRepresentation:&stru_1002DA058 reuseEntriesByIndex:1];
}

- (BOOL)isValid
{
  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardListCacheObject;
  if (![(GKExpiringCacheObject *)&v7 isValid]) {
    return 0;
  }
  v3 = [(GKLeaderboardListCacheObject *)self game];
  v4 = [v3 name];
  BOOL v5 = v4 != 0;

  return v5;
}

@end