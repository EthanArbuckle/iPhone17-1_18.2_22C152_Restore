@interface RESingleFeatureSet
@end

@implementation RESingleFeatureSet

void __39___RESingleFeatureSet_initWithFeature___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  v1 = (void *)initWithFeature__FeatureSetCache;
  initWithFeature__FeatureSetCache = v0;

  initWithFeature__Lock = 0;
}

@end