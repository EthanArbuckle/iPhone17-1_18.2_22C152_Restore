@interface MTEpisodeLevelCalculator
+ (int64_t)uncalculatedLevel;
- (MTEpisodeLevelCalculator)init;
- (void)unsafeUpdateEpisodeLevelsWithShowUUID:(id)a3 on:(id)a4;
- (void)unsafeUpdateEpisodeShowTypeSpecificLevelsWithShowUUID:(id)a3 on:(id)a4;
@end

@implementation MTEpisodeLevelCalculator

+ (int64_t)uncalculatedLevel
{
  return 1000000;
}

- (void)unsafeUpdateEpisodeLevelsWithShowUUID:(id)a3 on:(id)a4
{
}

- (void)unsafeUpdateEpisodeShowTypeSpecificLevelsWithShowUUID:(id)a3 on:(id)a4
{
}

- (MTEpisodeLevelCalculator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EpisodeLevelCalculator();
  return [(MTEpisodeLevelCalculator *)&v3 init];
}

@end