@interface RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock
@end

@implementation RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock

void ___RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = [v7 stringByAppendingFormat:@".%@", v5];
  }
  else
  {
    id v8 = v5;
  }
  v9 = v8;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = ___RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock_block_invoke_2;
  v13[3] = &unk_26425ECD0;
  id v10 = *(id *)(a1 + 40);
  id v14 = v9;
  id v15 = v10;
  id v11 = v9;
  id v12 = (id)[v6 addAction:v13];
}

uint64_t ___RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void ___RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = [v6 stringByAppendingFormat:@".%@", v9];
  }
  else
  {
    id v7 = v9;
  }
  id v8 = v7;
  _RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock(v5, v7, *(void *)(a1 + 40));
}

@end