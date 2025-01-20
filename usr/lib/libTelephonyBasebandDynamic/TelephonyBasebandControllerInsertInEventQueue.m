@interface TelephonyBasebandControllerInsertInEventQueue
@end

@implementation TelephonyBasebandControllerInsertInEventQueue

uint64_t ___TelephonyBasebandControllerInsertInEventQueue_block_invoke(uint64_t result)
{
  **(void **)(result + 32) = *(void *)(result + 40);
  *(void *)(*(void *)(result + 32) + 8) = 0;
  *(void *)(*(void *)(result + 32) + 16) = *(void *)(*(void *)(*(void *)(result + 48) + 96) + 8);
  **(void **)(*(void *)(*(void *)(result + 48) + 96) + 8) = *(void *)(result + 32);
  *(void *)(*(void *)(*(void *)(result + 48) + 96) + 8) = *(void *)(result + 32) + 8;
  return result;
}

@end