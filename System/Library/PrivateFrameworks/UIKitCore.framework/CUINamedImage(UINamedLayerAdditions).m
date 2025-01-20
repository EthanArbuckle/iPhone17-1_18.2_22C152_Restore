@interface CUINamedImage(UINamedLayerAdditions)
- (uint64_t)imageObj;
@end

@implementation CUINamedImage(UINamedLayerAdditions)

- (uint64_t)imageObj
{
  return [a1 UIImageWithAsset:0 configuration:0 flippedHorizontally:0 optionalVectorImage:0];
}

@end