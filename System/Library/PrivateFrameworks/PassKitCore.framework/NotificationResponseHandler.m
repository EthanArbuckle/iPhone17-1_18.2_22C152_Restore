@interface NotificationResponseHandler
@end

@implementation NotificationResponseHandler

void ___NotificationResponseHandler_block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 32)];
  v3 = _NotificationHandlerMap();
  v4 = [v3 objectForKey:v2];

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___NotificationResponseHandler_block_invoke_2;
    block[3] = &unk_1E56E4C30;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = v5;
    uint64_t v11 = v6;
    uint64_t v12 = v7;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  v8 = _NotificationHandlerMap();
  [v8 removeObjectForKey:v2];

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t ___NotificationResponseHandler_block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

@end