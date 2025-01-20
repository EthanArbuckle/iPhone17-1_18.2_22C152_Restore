@interface UIViewServiceSession
@end

@implementation UIViewServiceSession

void __46___UIViewServiceSession__objc_initiateDealloc__block_invoke(uint64_t a1)
{
}

uint64_t __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _invalidateUnconditionallyThen:a2];
}

uint64_t __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) invoke];
}

uint64_t __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) invoke];
}

uint64_t __61___UIViewServiceSession_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

uint64_t __47___UIViewServiceSession_setTerminationHandler___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 48);
  if (*(void **)(result + 40) != v1)
  {
    uint64_t v2 = result;

    result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 48) = result;
  }
  return result;
}

void __56___UIViewServiceSession__invalidateUnconditionallyThen___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __56___UIViewServiceSession__invalidateUnconditionallyThen___block_invoke_2;
  v13 = &unk_1E530DB88;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = v5;
  v6 = *(void **)(v5 + 16);
  if (v6)
  {
    objc_msgSend(v6, "invalidate", v10, v11, v12, v13);
    [*(id *)(*(void *)(a1 + 40) + 32) invalidate];
    dispatch_async((dispatch_queue_t)[*(id *)(*(void *)(a1 + 40) + 16) _queue], &v10);
  }
  else
  {
    *(void *)(v15 + 16) = 0;
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v15 + 48) + 16))(*(void *)(v15 + 48), a2, a3, a4);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, v7, v8, v9);
  }
}

uint64_t __56___UIViewServiceSession__invalidateUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 40) + 16) = 0;
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 48) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

void __67___UIViewServiceSession_registerDeputyClass_withConnectionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = (id *)(id)[*(id *)(a1 + 32) object];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v15 = 0;
    if (_UIApplicationIsKeyboardExtension())
    {
      uint64_t v15 = @"<null>";
    }
    else
    {
      [v7[2] _xpcConnection];
      uint64_t v8 = xpc_connection_copy_bundle_id();
      if (!v8
        || (uint64_t v9 = (void *)v8,
            uint64_t v15 = (__CFString *)[NSString stringWithUTF8String:v8],
            free(v9),
            !v15))
      {
        id v10 = v7[2];
        if (v10) {
          [v10 auditToken];
        }
        else {
          memset(&v14[2], 0, 32);
        }
        CPCopyBundleIdentifierAndTeamFromAuditToken();
      }
    }
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [v7[2] processIdentifier];
    id v13 = v7[2];
    if (v13) {
      [v13 auditToken];
    }
    else {
      memset(v14, 0, 32);
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, __CFString *, _OWORD *, uint64_t))(v11 + 16))(v11, a2, v12, v15, v14, a3);
  }
}

@end