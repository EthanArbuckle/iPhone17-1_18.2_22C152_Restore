@interface UIDraggingImageSlotOwner
@end

@implementation UIDraggingImageSlotOwner

uint64_t __36___UIDraggingImageSlotOwner_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteSlots:*(void *)(a1 + 40)];
}

@end