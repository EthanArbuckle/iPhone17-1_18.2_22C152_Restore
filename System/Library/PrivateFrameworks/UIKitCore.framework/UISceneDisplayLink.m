@interface UISceneDisplayLink
@end

@implementation UISceneDisplayLink

void __47___UISceneDisplayLink_unregisterTarget_action___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  v7 = [v11 target];
  v8 = v7;
  if (v7 != (void *)a1[4])
  {

    goto LABEL_8;
  }
  uint64_t v9 = [v11 action];
  uint64_t v10 = a1[6];
  if (v9 == v10)
  {
  }
  else
  {

    if (v10) {
      goto LABEL_8;
    }
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  *a4 = 1;
LABEL_8:
}

void __40___UISceneDisplayLink__displayLinkTick___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  v5 = [v12 target];
  if (v5)
  {
    v6 = (const char *)[v12 action];
    uint64_t v7 = *(void *)(a1 + 32);
    if (dyld_program_sdk_at_least()) {
      objc_msgSend(v5, v6, v7);
    }
    else {
      objc_msgSend(v5, sel_performSelector_withObject_, v6, v7);
    }
  }
  else
  {
    v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28E60] indexSet];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v8 addIndex:a3];
  }
}

@end