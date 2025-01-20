@interface UILumaTrackingGroup
@end

@implementation UILumaTrackingGroup

uint64_t __57___UILumaTrackingGroup_backgroundLumaView_didChangeLuma___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) &= ~1u;
  return [*(id *)(a1 + 32) _updateLumaValue];
}

@end