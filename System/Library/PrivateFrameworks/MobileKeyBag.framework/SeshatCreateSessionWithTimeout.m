@interface SeshatCreateSessionWithTimeout
@end

@implementation SeshatCreateSessionWithTimeout

dispatch_queue_t ___SeshatCreateSessionWithTimeout_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mobile.keybagd.seshat.sesion-timeout", 0);
  _SeshatCreateSessionWithTimeout_queue = (uint64_t)result;
  return result;
}

void ___SeshatCreateSessionWithTimeout_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___SeshatCreateSessionWithTimeout_block_invoke_3;
  v4[3] = &unk_1E61CB128;
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = a3;
  v4[5] = v3;
  uint64_t v6 = *(void *)(a1 + 56);
  v4[6] = a2;
  dispatch_sync((dispatch_queue_t)_SeshatCreateSessionWithTimeout_queue, v4);
}

void ___SeshatCreateSessionWithTimeout_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v9 + 24))
  {
    debuglog("_SeshatCreateSessionWithTimeout_block_invoke_3", @"doing nothing due to poison", a3, a4, a5, a6, a7, a8, v21);
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    if (v10)
    {
      char v11 = objc_msgSend((id)objc_msgSend(v10, "description"), "cStringUsingEncoding:", 1);
      debuglog("_SeshatCreateSessionWithTimeout_block_invoke_3", @"ERROR: %s", v12, v13, v14, v15, v16, v17, v11);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      id v18 = *(id *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 64);
    }
    else
    {
      *(unsigned char *)(v9 + 24) = 1;
      id v18 = *(id *)(a1 + 48);
      uint64_t v19 = *(void *)(a1 + 72);
    }
    *(void *)(*(void *)(v19 + 8) + 40) = v18;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  v20 = *(NSObject **)(a1 + 40);

  dispatch_release(v20);
}

uint64_t ___SeshatCreateSessionWithTimeout_block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v8 = result;
    debuglog("_SeshatCreateSessionWithTimeout_block_invoke_4", @"signaling end of session due to failure to start", a3, a4, a5, a6, a7, a8, v10);
    dispatch_queue_t result = [*(id *)(v8 + 32) endSession];
    uint64_t v9 = *(unsigned char **)(v8 + 48);
    *(unsigned char *)(*(void *)(*(void *)(v8 + 40) + 8) + 24) = 1;
    if (v9) {
      *uint64_t v9 = 1;
    }
  }
  return result;
}

@end