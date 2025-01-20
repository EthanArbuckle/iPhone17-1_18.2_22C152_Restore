@interface PLErrorUserInfoContainerIsSafeForXPC
@end

@implementation PLErrorUserInfoContainerIsSafeForXPC

uint64_t ___PLErrorUserInfoContainerIsSafeForXPC_block_invoke(void *a1)
{
  id v1 = a1;
  if ([v1 conformsToProtocol:&unk_1EEC335A0]) {
    uint64_t IsSafeForXPC = _PLErrorUserInfoContainerIsSafeForXPC(v1);
  }
  else {
    uint64_t IsSafeForXPC = 1;
  }

  return IsSafeForXPC;
}

@end