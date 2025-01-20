@interface GKAchievementThatAFriendHasCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKAchievementThatAFriendHasCacheObject

+ (id)entityName
{
  return @"AchievementThatAFriendHas";
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"friend"];
  [(GKAchievementThatAFriendHasCacheObject *)self setFriend:v5];

  id v6 = [v4 objectForKeyedSubscript:@"timestamp"];

  [(GKAchievementThatAFriendHasCacheObject *)self setTimestamp:v6];
}

- (id)internalRepresentation
{
  v3 = +[GKAchievementThatAFriendHasInternal internalRepresentation];
  id v4 = [(GKAchievementThatAFriendHasCacheObject *)self friend];
  v5 = [v4 internalRepresentation];
  [v3 setFriendPlayer:v5];

  id v6 = [(GKAchievementThatAFriendHasCacheObject *)self timestamp];
  [v3 setTimestamp:v6];

  return v3;
}

@end