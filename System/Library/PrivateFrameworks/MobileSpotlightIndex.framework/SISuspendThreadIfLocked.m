@interface SISuspendThreadIfLocked
@end

@implementation SISuspendThreadIfLocked

thread_read_t *___SISuspendThreadIfLocked_block_invoke(uint64_t a1)
{
  return _SISuspendThread((thread_read_t *)*(unsigned int *)(a1 + 40), *(void (***)(void, void))(a1 + 32));
}

@end