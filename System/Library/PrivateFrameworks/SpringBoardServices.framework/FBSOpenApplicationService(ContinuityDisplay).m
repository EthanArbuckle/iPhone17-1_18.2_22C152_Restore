@interface FBSOpenApplicationService(ContinuityDisplay)
+ (id)continuityDisplayEndpoint;
+ (id)continuityDisplayService;
@end

@implementation FBSOpenApplicationService(ContinuityDisplay)

+ (id)continuityDisplayEndpoint
{
  v0 = (void *)MEMORY[0x1E4F50BB8];
  v1 = [MEMORY[0x1E4F629E0] serviceName];
  v2 = [v0 endpointForMachName:@"com.apple.frontboard.systemappservices" service:v1 instance:@"com.apple.SpringBoard.continuity-display"];

  return v2;
}

+ (id)continuityDisplayService
{
  v0 = [MEMORY[0x1E4F629E0] continuityDisplayEndpoint];
  if (v0)
  {
    v1 = [MEMORY[0x1E4F629E0] serviceWithEndpoint:v0];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end