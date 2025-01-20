@interface PXStoryColorGradingRepositoryFactory
+ (PXStoryColorGradingRepository)sharedRepository;
@end

@implementation PXStoryColorGradingRepositoryFactory

+ (PXStoryColorGradingRepository)sharedRepository
{
  if (sharedRepository_onceToken != -1) {
    dispatch_once(&sharedRepository_onceToken, &__block_literal_global_86260);
  }
  v2 = (void *)sharedRepository_sharedRepository;
  return (PXStoryColorGradingRepository *)v2;
}

uint64_t __56__PXStoryColorGradingRepositoryFactory_sharedRepository__block_invoke()
{
  v0 = objc_alloc_init(PXStoryConcreteColorGradingRepository);
  v1 = (void *)sharedRepository_sharedRepository;
  sharedRepository_sharedRepository = (uint64_t)v0;

  v2 = (void *)sharedRepository_sharedRepository;
  return [v2 startPreloadingWithCompletionHandler:0];
}

@end