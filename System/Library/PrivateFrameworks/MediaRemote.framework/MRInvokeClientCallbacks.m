@interface MRInvokeClientCallbacks
@end

@implementation MRInvokeClientCallbacks

void ___onQueue_MRInvokeClientCallbacks_block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) block];
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___onQueue_MRInvokeClientCallbacks_block_invoke_2;
  v7[3] = &unk_1E57D9AF8;
  v6 = *(void **)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 80);
  char v15 = *(unsigned char *)(a1 + 104);
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 88);
  id v13 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 96);
  _onClientQueue_MRInvokeClientCallback(v2, v3, v4, v5, v6, v7);
}

void ___onQueue_MRInvokeClientCallbacks_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if ((unint64_t)[*(id *)(a1 + 48) count] <= 1) {
      goto LABEL_9;
    }
  }
  else
  {
    MRContentItemMerge(*(void **)(a1 + 32), *(void **)(a1 + 40));
    if ((unint64_t)[*(id *)(a1 + 48) count] <= 1 || !*(unsigned char *)(a1 + 88))
    {
LABEL_9:
      v3 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
      v3();
      return;
    }
  }
  id v4 = (id)[*(id *)(a1 + 48) mutableCopy];
  [v4 removeObjectAtIndex:0];
  _onQueue_MRInvokeClientCallbacks(*(void *)(a1 + 56), v4, *(void *)(a1 + 64), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 88), *(void *)(a1 + 72), *(void *)(a1 + 80));
}

@end