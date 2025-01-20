@interface TelephonyBasebandControllerIsEmptyEventQueue
@end

@implementation TelephonyBasebandControllerIsEmptyEventQueue

uint64_t ___TelephonyBasebandControllerIsEmptyEventQueue_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = **(void **)(*(void *)(result + 40) + 96) == 0;
  return result;
}

@end