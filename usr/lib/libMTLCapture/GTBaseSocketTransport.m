@interface GTBaseSocketTransport
@end

@implementation GTBaseSocketTransport

id __53__GTBaseSocketTransport_destroySharedMemoryTransport__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroySharedMemoryTransport];
}

unsigned char *__63__GTBaseSocketTransport_createNewSharedMemoryTransportWithURL___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[52])
  {
    [result _destroySharedMemoryTransport];
    v3 = [GTSharedMemoryTransport_capture alloc];
    uint64_t v4 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 40));
    *(void *)(*(void *)(a1 + 32) + 248) = [(GTSharedMemoryTransport_capture *)v3 initWithMode:2 initialMessageSerial:v4];
    if (*(void *)(a1 + 40)) {
      [*(id *)(*(void *)(a1 + 32) + 248) setUrl:];
    }
    [*(id *)(*(void *)(a1 + 32) + 248) setRelayTransport:];
    [*(id *)(*(void *)(a1 + 32) + 248) setPrioritizeOutgoingMessages:*(unsigned __int8 *)(*(void *)(a1 + 32) + 53)];
    if ([*(id *)(a1 + 32) connected]) {
      [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "connect") waitUntilResolved];
    }
    result = [*(id *)(*(void *)(a1 + 32) + 248) url];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  }
  return result;
}

id __55__GTBaseSocketTransport_setPrioritizeOutgoingMessages___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 248) setPrioritizeOutgoingMessages:*(unsigned __int8 *)(a1 + 40)];
}

void __39__GTBaseSocketTransport_runWithSocket___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 232) = 0;
}

void __39__GTBaseSocketTransport_runWithSocket___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 240) = 0;
}

id __39__GTBaseSocketTransport_runWithSocket___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readAndAccumulateLoop];
}

unsigned char *__39__GTBaseSocketTransport_runWithSocket___block_invoke_4(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 240));
  *(unsigned char *)(*(void *)(a1 + 32) + 256) = 1;
  result = *(unsigned char **)(a1 + 32);
  if (result[257])
  {
    return [result _readAndAccumulateLoop];
  }
  return result;
}

@end