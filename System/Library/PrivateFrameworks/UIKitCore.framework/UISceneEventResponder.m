@interface UISceneEventResponder
@end

@implementation UISceneEventResponder

void __58___UISceneEventResponder__enqueueCommitResponse_forPhase___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    v12 = v2;
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 8));
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 12));
    v12[24] = 1;
    v3 = (uint64_t *)(v1 + 16);
    v4 = (id *)*(id *)(v1 + 16);
    while (1)
    {
      uint64_t v5 = *v3;
      if (!*v3) {
        break;
      }
      if (!*(unsigned char *)(v5 + 24)) {
        goto LABEL_7;
      }
      objc_storeStrong((id *)(v1 + 16), *(id *)(v5 + 8));
    }
    v6 = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = 0;

    uint64_t v5 = *(void *)(v1 + 16);
LABEL_7:
    v7 = (id *)(id)v5;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 12));
    if (v4 != v7)
    {
      do
      {
        v8 = (id *)v4[1];
        v9 = (void (**)(void))v4[2];
        if (v9)
        {
          v9[2]();
          id v10 = v4[2];
          v4[2] = 0;
        }
        id v11 = v4[1];
        v4[1] = 0;

        v4 = v8;
      }
      while (v8 != v7);
      v4 = v7;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 8));

    v2 = v12;
  }
}

@end