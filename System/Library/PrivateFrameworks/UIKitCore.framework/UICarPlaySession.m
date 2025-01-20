@interface UICarPlaySession
@end

@implementation UICarPlaySession

void __35___UICarPlaySession_sharedInstance__block_invoke()
{
  v0 = [_UICarPlaySession alloc];
  if (v0)
  {
    v10.receiver = v0;
    v10.super_class = (Class)_UICarPlaySession;
    v1 = objc_msgSendSuper2(&v10, sel_init);
    uint64_t v2 = (uint64_t)v1;
    if (v1)
    {
      v1[2] = 0;
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2050000000;
      v3 = (void *)qword_1EB262EA0;
      uint64_t v15 = qword_1EB262EA0;
      if (!qword_1EB262EA0)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __getCARSessionStatusClass_block_invoke;
        v11[3] = &unk_1E52D9900;
        v11[4] = &v12;
        __getCARSessionStatusClass_block_invoke((uint64_t)v11);
        v3 = (void *)v13[3];
      }
      v4 = v3;
      _Block_object_dispose(&v12, 8);
      id v5 = objc_alloc_init(v4);
      v6 = *(void **)(v2 + 16);
      *(void *)(v2 + 16) = v5;

      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v8 = *(void **)(v2 + 32);
      *(void *)(v2 + 32) = v7;

      [*(id *)(v2 + 16) addSessionObserver:v2];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  v9 = (void *)_MergedGlobals_1220;
  _MergedGlobals_1220 = v2;
}

void __71___UICarPlaySession_enqueuePendingSessionAccessWithTimeout_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
}

void __39___UICarPlaySession_sessionDidConnect___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "completion", (void)v9);
        v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v8[2](v8, *(void *)(a1 + 40));

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __42___UICarPlaySession_sessionDidDisconnect___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v2);
}

@end