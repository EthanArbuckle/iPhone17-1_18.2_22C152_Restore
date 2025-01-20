@interface PNAssetCaptionGenerator
- (PNAssetCaptionGenerator)init;
@end

@implementation PNAssetCaptionGenerator

- (PNAssetCaptionGenerator)init
{
  return (PNAssetCaptionGenerator *)AssetCaptionGenerator.init()();
}

@end