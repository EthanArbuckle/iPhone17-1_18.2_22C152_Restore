@interface FBSDisplayLayoutMonitorConfiguration(SBSContinuityDisplayLayout)
+ (id)configurationForContinuityDisplay;
@end

@implementation FBSDisplayLayoutMonitorConfiguration(SBSContinuityDisplayLayout)

+ (id)configurationForContinuityDisplay
{
  v0 = (void *)MEMORY[0x1E4F50BB8];
  v1 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  v2 = [MEMORY[0x1E4F62940] serviceIdentifier];
  v3 = [v0 endpointForMachName:v1 service:v2 instance:@"com.apple.SpringBoard.continuity-display"];

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4F50BB8];
    v5 = [MEMORY[0x1E4F62940] serviceIdentifier];
    v3 = [v4 nullEndpointForService:v5 instance:@"com.apple.SpringBoard.continuity-display"];
  }
  v6 = [MEMORY[0x1E4F62958] configurationWithEndpoint:v3];

  return v6;
}

@end