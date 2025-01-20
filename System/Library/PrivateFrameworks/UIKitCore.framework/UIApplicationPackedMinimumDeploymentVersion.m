@interface UIApplicationPackedMinimumDeploymentVersion
@end

@implementation UIApplicationPackedMinimumDeploymentVersion

void ___UIApplicationPackedMinimumDeploymentVersion_block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 infoDictionary];
  id v2 = [v1 objectForKey:@"MinimumOSVersion"];

  _MergedGlobals_1321 = _UIApplicationPackedDeploymentVersionFromString(v2);
}

@end