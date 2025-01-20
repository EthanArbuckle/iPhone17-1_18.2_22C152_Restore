@interface FCPuzzleTypeLeaderboard
- (FCPuzzleTypeLeaderboard)initWithDictionary:(id)a3;
- (NSArray)leaderboards;
- (void)setLeaderboards:(id)a3;
@end

@implementation FCPuzzleTypeLeaderboard

- (void).cxx_destruct
{
}

- (FCPuzzleTypeLeaderboard)initWithDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FCPuzzleTypeLeaderboard;
  v5 = [(FCPuzzleTypeLeaderboard *)&v18 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"leaderboards", 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [[FCPuzzleLeaderboard alloc] initWithDictionary:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
          if (v12) {
            [v6 addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
    [(FCPuzzleTypeLeaderboard *)v5 setLeaderboards:v6];
  }
  return v5;
}

- (void)setLeaderboards:(id)a3
{
}

- (NSArray)leaderboards
{
  return self->_leaderboards;
}

@end