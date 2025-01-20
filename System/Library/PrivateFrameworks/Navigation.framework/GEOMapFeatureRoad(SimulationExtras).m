@interface GEOMapFeatureRoad(SimulationExtras)
- (double)lastCoordinate;
@end

@implementation GEOMapFeatureRoad(SimulationExtras)

- (double)lastCoordinate
{
  uint64_t v2 = [a1 coordinates3d];
  return *(double *)(v2 + 24 * [a1 coordinateCount] - 24);
}

@end