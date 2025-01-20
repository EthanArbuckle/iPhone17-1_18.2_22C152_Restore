@interface NTKAllAvailableFaceDescriptorsForDevice
@end

@implementation NTKAllAvailableFaceDescriptorsForDevice

void ___NTKAllAvailableFaceDescriptorsForDevice_block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = [v7 isHardwareSpecific];
  v4 = v7;
  if ((v3 & 1) == 0)
  {
    v5 = [(id)objc_opt_class() identifier];
    v6 = [[NTKFaceDescriptor alloc] initWithBundleIdentifier:v5];
    if (v6) {
      [*(id *)(a1 + 32) addObject:v6];
    }

    v4 = v7;
  }
}

@end