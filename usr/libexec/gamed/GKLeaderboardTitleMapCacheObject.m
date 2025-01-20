@interface GKLeaderboardTitleMapCacheObject
+ (id)entityName;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKLeaderboardTitleMapCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardTitleMapCacheObject;
  [(GKCacheObject *)&v7 updateWithServerRepresentation:v4];
  v5 = [v4 objectForKeyedSubscript:@"category-name"];
  if (v5) {
    [(GKLeaderboardTitleMapCacheObject *)self setIdentifier:v5];
  }
  v6 = [v4 objectForKeyedSubscript:@"category-title"];

  if (v6) {
    [(GKLeaderboardTitleMapCacheObject *)self setLocalizedTitle:v6];
  }
}

+ (id)entityName
{
  return @"LeaderboardTitleMap";
}

@end