@interface GKAchievementLeaderboardScoreRangeRequest
- (id)bagKey;
- (id)serverRequestWithService:(id)a3;
@end

@implementation GKAchievementLeaderboardScoreRangeRequest

- (id)bagKey
{
  return @"gk-get-achievement-leaderboard";
}

- (id)serverRequestWithService:(id)a3
{
  v10[0] = @"player-scope";
  v4 = [(GKAchievementLeaderboardScoreRangeRequest *)self serverPlayerScope];
  v11[0] = v4;
  v10[1] = @"count";
  [(GKAchievementLeaderboardScoreRangeRequest *)self range];
  v6 = +[NSNumber numberWithInteger:v5];
  v11[1] = v6;
  v10[2] = @"starting-rank";
  v7 = +[NSNumber numberWithInteger:[(GKAchievementLeaderboardScoreRangeRequest *)self range]];
  v10[3] = @"category";
  v11[2] = v7;
  v11[3] = @"points";
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

@end