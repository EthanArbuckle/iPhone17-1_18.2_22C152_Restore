@interface UIDragSessionImpl
@end

@implementation UIDragSessionImpl

void __42___UIDragSessionImpl_initWithInteraction___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)__activeDragSessionsTable;
  __activeDragSessionsTable = v0;
}

@end