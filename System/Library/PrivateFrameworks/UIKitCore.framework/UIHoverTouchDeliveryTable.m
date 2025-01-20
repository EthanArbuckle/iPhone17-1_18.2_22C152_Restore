@interface UIHoverTouchDeliveryTable
@end

@implementation UIHoverTouchDeliveryTable

void __60___UIHoverTouchDeliveryTable_updateForEvent_forcingHitTest___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 isEnabled]
    && [v6 state] <= 2
    && (!*(unsigned char *)(a1 + 56) || [v6 _wantsHoverEventsWhilePointerIsLocked]))
  {
    [*(id *)(a1 + 32) addObject:v6];
    if (([*(id *)(*(void *)(a1 + 40) + 16) containsObject:v6] & 1) == 0)
    {
      uint64_t v3 = *(void *)(a1 + 48);
      v4 = *(void **)(*(void *)(a1 + 40) + 32);
      v5 = [v4 _responder];
      LODWORD(v3) = [v6 _shouldReceiveTouch:v4 forEvent:v3 recognizerView:v5];

      if (v3) {
        [*(id *)(*(void *)(a1 + 40) + 8) addObject:v6];
      }
    }
  }
}

@end