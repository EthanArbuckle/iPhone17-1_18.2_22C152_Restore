@interface PXMediaProvider(Preheating)
+ (id)preheatQueue;
@end

@implementation PXMediaProvider(Preheating)

+ (id)preheatQueue
{
  if (preheatQueue_onceToken != -1) {
    dispatch_once(&preheatQueue_onceToken, &__block_literal_global_188478);
  }
  v0 = (void *)preheatQueue_sharedPreheatQueue;
  return v0;
}

@end