@interface SVTouchAbsorbingView
- (BOOL)isTracking;
@end

@implementation SVTouchAbsorbingView

- (BOOL)isTracking
{
  return 1;
}

@end