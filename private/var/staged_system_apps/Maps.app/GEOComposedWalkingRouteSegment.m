@interface GEOComposedWalkingRouteSegment
- (id)transitInstructionInContext:(int64_t)a3;
@end

@implementation GEOComposedWalkingRouteSegment

- (id)transitInstructionInContext:(int64_t)a3
{
  return +[MNTransitWalkingSegmentInstruction instructionForWalkingSegment:self context:a3];
}

@end