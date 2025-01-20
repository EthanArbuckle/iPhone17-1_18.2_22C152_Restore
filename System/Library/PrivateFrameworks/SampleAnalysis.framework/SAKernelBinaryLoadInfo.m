@interface SAKernelBinaryLoadInfo
- (BOOL)isInKernelAddressSpace;
@end

@implementation SAKernelBinaryLoadInfo

- (BOOL)isInKernelAddressSpace
{
  return 1;
}

@end