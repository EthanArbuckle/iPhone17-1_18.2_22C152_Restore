@interface PNAssetGroupOptions
- (BOOL)groupByDifferentOrientation;
- (BOOL)groupBySharedLibraryParticipationState;
- (PNAssetGroupOptions)init;
- (double)comparableCurationScoreThreshold;
- (int)distanceFromFirstThreshold;
- (int)distanceIfAdjustedDiffersThreshold;
- (int)distanceThreshold;
- (void)setComparableCurationScoreThreshold:(double)a3;
- (void)setDistanceFromFirstThreshold:(int)a3;
- (void)setDistanceIfAdjustedDiffersThreshold:(int)a3;
- (void)setDistanceThreshold:(int)a3;
- (void)setGroupByDifferentOrientation:(BOOL)a3;
- (void)setGroupBySharedLibraryParticipationState:(BOOL)a3;
@end

@implementation PNAssetGroupOptions

- (BOOL)groupByDifferentOrientation
{
  return PNAssetGroupOptions.groupByDifferentOrientation.getter() & 1;
}

- (void)setGroupByDifferentOrientation:(BOOL)a3
{
}

- (BOOL)groupBySharedLibraryParticipationState
{
  return PNAssetGroupOptions.groupBySharedLibraryParticipationState.getter() & 1;
}

- (void)setGroupBySharedLibraryParticipationState:(BOOL)a3
{
}

- (double)comparableCurationScoreThreshold
{
  return PNAssetGroupOptions.comparableCurationScoreThreshold.getter();
}

- (void)setComparableCurationScoreThreshold:(double)a3
{
}

- (int)distanceThreshold
{
  return PNAssetGroupOptions.distanceThreshold.getter();
}

- (void)setDistanceThreshold:(int)a3
{
}

- (int)distanceFromFirstThreshold
{
  return PNAssetGroupOptions.distanceFromFirstThreshold.getter();
}

- (void)setDistanceFromFirstThreshold:(int)a3
{
}

- (int)distanceIfAdjustedDiffersThreshold
{
  return PNAssetGroupOptions.distanceIfAdjustedDiffersThreshold.getter();
}

- (void)setDistanceIfAdjustedDiffersThreshold:(int)a3
{
}

- (PNAssetGroupOptions)init
{
  return (PNAssetGroupOptions *)PNAssetGroupOptions.init()();
}

@end