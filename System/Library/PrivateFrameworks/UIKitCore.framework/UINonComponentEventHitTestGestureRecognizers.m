@interface UINonComponentEventHitTestGestureRecognizers
@end

@implementation UINonComponentEventHitTestGestureRecognizers

uint64_t ___UINonComponentEventHitTestGestureRecognizers_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_convertPointFromSceneReferenceSpace:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

@end