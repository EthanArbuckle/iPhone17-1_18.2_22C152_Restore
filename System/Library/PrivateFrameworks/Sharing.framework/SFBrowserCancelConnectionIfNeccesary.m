@interface SFBrowserCancelConnectionIfNeccesary
@end

@implementation SFBrowserCancelConnectionIfNeccesary

void ___SFBrowserCancelConnectionIfNeccesary_block_invoke(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  v2 = *(void **)(a1 + 32);

  xpc_release(v2);
}

@end