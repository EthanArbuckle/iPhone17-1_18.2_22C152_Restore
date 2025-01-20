@interface HandleIncomingMessage
@end

@implementation HandleIncomingMessage

void ___HandleIncomingMessage_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
  xpc_release(*(xpc_object_t *)(a1 + 40));
  v2 = *(const void **)(a1 + 48);

  CFRelease(v2);
}

@end