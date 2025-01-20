@interface FIUIWorkoutActivityType
- (BOOL)bridge_isDownhillSnowSport;
- (BOOL)bridge_supportsElevationAscendedInSummary;
- (BOOL)bridge_supportsElevationDescendedInSummary;
@end

@implementation FIUIWorkoutActivityType

- (BOOL)bridge_supportsElevationAscendedInSummary
{
  v2 = self;
  char v3 = FIUIWorkoutActivityType.supportsElevationAscendedInSummary.getter();

  return v3 & 1;
}

- (BOOL)bridge_supportsElevationDescendedInSummary
{
  v2 = self;
  char v3 = FIUIWorkoutActivityType.supportsElevationDescendedInSummary.getter();

  return v3 & 1;
}

- (BOOL)bridge_isDownhillSnowSport
{
  return [(FIUIWorkoutActivityType *)self isDownhillSnowSport];
}

@end