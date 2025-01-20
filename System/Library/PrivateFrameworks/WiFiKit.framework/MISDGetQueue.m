@interface MISDGetQueue
@end

@implementation MISDGetQueue

dispatch_queue_t ____MISDGetQueue_block_invoke()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x22uLL, "com.apple.misd.%p", &__MISDGetQueue___misdQueue);
  __str[33] = 0;
  dispatch_queue_t result = dispatch_queue_create(__str, 0);
  __MISDGetQueue___misdQueue = (uint64_t)result;
  return result;
}

@end