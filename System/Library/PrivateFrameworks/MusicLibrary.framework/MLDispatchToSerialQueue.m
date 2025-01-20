@interface MLDispatchToSerialQueue
@end

@implementation MLDispatchToSerialQueue

uint64_t ___MLDispatchToSerialQueue_block_invoke()
{
  __ML3LogSerialQueue = (uint64_t)dispatch_queue_create(0, 0);

  return MEMORY[0x1F41817F8]();
}

@end