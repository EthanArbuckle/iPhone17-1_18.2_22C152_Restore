@interface PVAppIdentity
@end

@implementation PVAppIdentity

void __PVAppIdentity_GenerateDigestWithCompletion_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = objc_msgSend(MEMORY[0x263F087E8], "pvai_wrappedError:error:", -10002, a2);
  v4 = [[PVAppIdentityDigest alloc] initWithError:v3 version:&unk_27087BB58];
  v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_6;
  block[3] = &unk_265480D68;
  id v10 = *(id *)(a1 + 48);
  v8 = v4;
  id v9 = *(id *)(a1 + 40);
  v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 40);

  return [v2 invalidate];
}

void __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_3;
  block[3] = &unk_265480D68;
  id v9 = *(id *)(a1 + 48);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __PVAppIdentity_GenerateDigestWithCompletion_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 40);

  return [v2 invalidate];
}

@end