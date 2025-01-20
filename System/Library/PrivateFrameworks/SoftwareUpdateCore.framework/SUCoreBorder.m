@interface SUCoreBorder
@end

@implementation SUCoreBorder

void __SUCoreBorder_MAPurgeAll_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  v5 = _SUCoreBorder_MAFunctionAtEnd(@"MAPurgeAll", &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(id *)(v6 + 40);
    _SUCoreBorder_MASimulate(v5, &v10);
    objc_storeStrong((id *)(v6 + 40), v10);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_6:
      v8();
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_6;
    }
  }
}

@end