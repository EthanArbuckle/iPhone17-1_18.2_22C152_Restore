@interface STLoadHeaderIconForAppID
@end

@implementation STLoadHeaderIconForAppID

uint64_t ___STLoadHeaderIconForAppID_block_invoke()
{
  _gHeaderIconsByID = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

void ___STLoadHeaderIconForAppID_block_invoke_2(uint64_t a1)
{
  v2 = _LoadIconForAppID((void *)_gHeaderIconsByID, *(void **)(a1 + 32), 2, *(unsigned __int8 *)(a1 + 48));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = ___STLoadHeaderIconForAppID_block_invoke_3;
  v4[3] = &unk_2643023C8;
  id v5 = v2;
  id v6 = *(id *)(a1 + 40);
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void ___STLoadHeaderIconForAppID_block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(uint64_t))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3);
  }
  else
  {
    PSBlankIconImage();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
  }
}

@end