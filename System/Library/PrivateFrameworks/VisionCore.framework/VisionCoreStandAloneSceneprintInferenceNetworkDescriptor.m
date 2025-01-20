@interface VisionCoreStandAloneSceneprintInferenceNetworkDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorAndReturnError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (VisionCoreTensorDescriptor)sceneprintOutput;
@end

@implementation VisionCoreStandAloneSceneprintInferenceNetworkDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptorAndReturnError:(id *)a3
{
  if (a3)
  {
    *a3 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:@"stand-alone sceneprint model is no longer supported"];
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (VisionCoreTensorDescriptor)sceneprintOutput
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"VisionCoreStandAloneSceneprintInferenceNetworkDescriptor.m" lineNumber:28 description:@"sceneprint tensor descriptor not available"];

  return 0;
}

@end