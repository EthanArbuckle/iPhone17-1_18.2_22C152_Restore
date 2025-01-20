@interface MLGPUComputeDevice(CRComputeDeviceAdditions)
- (uint64_t)_crComputeDeviceType;
@end

@implementation MLGPUComputeDevice(CRComputeDeviceAdditions)

- (uint64_t)_crComputeDeviceType
{
  return 2;
}

@end