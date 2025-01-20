@interface NUAdjustment(PIModernPhotosPipeline)
- (uint64_t)isEnabled;
@end

@implementation NUAdjustment(PIModernPhotosPipeline)

- (uint64_t)isEnabled
{
  v1 = [a1 objectForKeyedSubscript:@"enabled"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end