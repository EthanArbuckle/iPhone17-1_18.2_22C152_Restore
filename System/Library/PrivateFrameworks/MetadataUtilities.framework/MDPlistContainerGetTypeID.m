@interface MDPlistContainerGetTypeID
@end

@implementation MDPlistContainerGetTypeID

uint64_t ___MDPlistContainerGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kMDPlistContainerTypeID = result;
  return result;
}

@end