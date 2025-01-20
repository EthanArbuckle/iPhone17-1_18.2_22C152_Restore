@interface JSONEncodableObjectWithObjectHandlers
@end

@implementation JSONEncodableObjectWithObjectHandlers

uint64_t ___fc_JSONEncodableObjectWithObjectHandlers_block_invoke_2()
{
  return 0;
}

uint64_t ___fc_JSONEncodableObjectWithObjectHandlers_block_invoke_3()
{
  return 0;
}

uint64_t ___fc_JSONEncodableObjectWithObjectHandlers_block_invoke_4()
{
  return 0;
}

id ___fc_JSONEncodableObjectWithObjectHandlers_block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v6 = _fc_JSONEncodableObjectWithObjectHandlers(v5, *(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), 1);
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    _fc_JSONEncodableObjectWithObjectHandlers(v4, *(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

id ___fc_JSONEncodableObjectWithObjectHandlers_block_invoke_6(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  id v8 = (*(void (**)(void))(a1[5] + 16))();
  v9 = _fc_JSONEncodableObjectWithObjectHandlers(v8, a1[6], a1[7], a1[5], a1[8], 1);
  v10 = (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v9, v6);
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

id ___fc_JSONEncodableObjectWithObjectHandlers_block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v6 = _fc_JSONEncodableObjectWithObjectHandlers(v5, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 32), 1);
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    _fc_JSONEncodableObjectWithObjectHandlers(v4, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

@end