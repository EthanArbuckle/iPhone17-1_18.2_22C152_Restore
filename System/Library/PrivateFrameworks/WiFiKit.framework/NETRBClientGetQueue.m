@interface NETRBClientGetQueue
@end

@implementation NETRBClientGetQueue

dispatch_queue_t ____NETRBClientGetQueue_block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x2DuLL, "com.apple.framework.netrb.%p", &__netrbClientTypeID);
  __str[44] = 0;
  dispatch_queue_t result = dispatch_queue_create(__str, 0);
  __NETRBClientGetQueue___netrbQueue = (uint64_t)result;
  if (!result)
  {
    v1 = __error();
    strerror(*v1);
    return (dispatch_queue_t)NETRBErrorLog();
  }
  return result;
}

@end