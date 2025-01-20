@interface GKBiomeManager
+ (GKBiomeManager)shared;
- (GKBiomeManager)init;
- (void)logEarnedWithAchievement:(id)a3;
@end

@implementation GKBiomeManager

+ (GKBiomeManager)shared
{
  id v2 = static BiomeManager.shared.getter();

  return (GKBiomeManager *)v2;
}

- (GKBiomeManager)init
{
  return (GKBiomeManager *)sub_100163FB8();
}

- (void)logEarnedWithAchievement:(id)a3
{
  id v4 = a3;
  v5 = self;
  BiomeManager.logEarned(achievement:)(v4);
}

- (void).cxx_destruct
{
}

@end