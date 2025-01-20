@interface UIColor(VideosUICore)
- (uint64_t)colorByRemovingTransparency;
@end

@implementation UIColor(VideosUICore)

- (uint64_t)colorByRemovingTransparency
{
  return [a1 colorWithAlphaComponent:1.0];
}

@end