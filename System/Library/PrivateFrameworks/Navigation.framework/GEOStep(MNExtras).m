@interface GEOStep(MNExtras)
- (BOOL)maneuverIsTakeNthExitAtRoundabout;
@end

@implementation GEOStep(MNExtras)

- (BOOL)maneuverIsTakeNthExitAtRoundabout
{
  return [a1 maneuverType] - 41 < 0x13;
}

@end