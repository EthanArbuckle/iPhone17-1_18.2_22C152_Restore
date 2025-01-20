@interface MLNeuralEngineComputeDevice(CRComputeDeviceAdditions)
- (uint64_t)_crComputeDeviceType;
@end

@implementation MLNeuralEngineComputeDevice(CRComputeDeviceAdditions)

- (uint64_t)_crComputeDeviceType
{
  return 4;
}

@end