@interface UISDisplaySingleRectShape(DisplayInfoProviding)
- (uint64_t)displayShapeName;
@end

@implementation UISDisplaySingleRectShape(DisplayInfoProviding)

- (uint64_t)displayShapeName
{
  [a1 rect];
  return objc_msgSend(NSString, "stringWithFormat:", @"SingleRect-%ld,%ld-%ldx%ld", (uint64_t)v3, (uint64_t)v4, (uint64_t)v1, (uint64_t)v2);
}

@end