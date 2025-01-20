@interface PUWatchFaceHelper
+ (CGRect)screenBoundsForWatchType:(int64_t)a3;
- (PUWatchFaceHelper)init;
@end

@implementation PUWatchFaceHelper

+ (CGRect)screenBoundsForWatchType:(int64_t)a3
{
  sub_1AEAFC47C(a3);
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (PUWatchFaceHelper)init
{
  return (PUWatchFaceHelper *)sub_1AEAFC508();
}

@end