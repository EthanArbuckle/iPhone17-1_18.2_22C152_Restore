@interface NETRBClientGetTypeID
@end

@implementation NETRBClientGetTypeID

uint64_t ____NETRBClientGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __netrbClientTypeID = result;
  return result;
}

@end