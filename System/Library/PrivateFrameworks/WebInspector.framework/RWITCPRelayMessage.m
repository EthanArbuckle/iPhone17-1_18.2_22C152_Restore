@interface RWITCPRelayMessage
@end

@implementation RWITCPRelayMessage

ssize_t __29___RWITCPRelayMessage_write___block_invoke(uint64_t a1, const void *a2, size_t a3)
{
  return write(*(_DWORD *)(a1 + 32), a2, a3);
}

uint64_t __37___RWITCPRelayMessage_writeLockdown___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F99B70](*(void *)(a1 + 32));
}

@end