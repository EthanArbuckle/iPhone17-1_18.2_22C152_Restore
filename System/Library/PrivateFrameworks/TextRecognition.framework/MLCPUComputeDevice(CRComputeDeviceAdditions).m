@interface MLCPUComputeDevice(CRComputeDeviceAdditions)
- (uint64_t)_crComputeDeviceType;
@end

@implementation MLCPUComputeDevice(CRComputeDeviceAdditions)

- (uint64_t)_crComputeDeviceType
{
  return 1;
}

@end