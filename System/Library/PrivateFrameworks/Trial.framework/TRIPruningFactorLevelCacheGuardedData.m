@interface TRIPruningFactorLevelCacheGuardedData
@end

@implementation TRIPruningFactorLevelCacheGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->prefetchedLevels, 0);
  objc_storeStrong((id *)&self->requiredLevels, 0);
  objc_storeStrong(&self->loadFactorLevels, 0);
}

@end