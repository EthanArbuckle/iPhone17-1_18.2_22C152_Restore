@interface SIShutdownIndex
@end

@implementation SIShutdownIndex

uint64_t ___SIShutdownIndex_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= indexClosing(a2);
  }
  return 1;
}

@end