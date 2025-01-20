@interface UIResponderForwarderWantsForwardingFromResponder
@end

@implementation UIResponderForwarderWantsForwardingFromResponder

void ___UIResponderForwarderWantsForwardingFromResponder_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  v7 = [v9 responder];
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

@end