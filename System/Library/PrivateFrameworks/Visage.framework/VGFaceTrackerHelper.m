@interface VGFaceTrackerHelper
+ (NSArray)blendshapeNames;
+ (NSDictionary)blendshapeNamesToIdx;
@end

@implementation VGFaceTrackerHelper

+ (NSArray)blendshapeNames
{
  if (blendshapesInitialization(void)::onceToken != -1) {
    dispatch_once(&blendshapesInitialization(void)::onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_blendshapeNames;

  return (NSArray *)v2;
}

+ (NSDictionary)blendshapeNamesToIdx
{
  if (blendshapesInitialization(void)::onceToken != -1) {
    dispatch_once(&blendshapesInitialization(void)::onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_blendshapeNameToIdx;

  return (NSDictionary *)v2;
}

@end