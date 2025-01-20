@interface PKVirtualCard
@end

@implementation PKVirtualCard

void __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_2;
    v10[3] = &unk_1E59D2788;
    v5 = &v11;
    id v6 = *(id *)(a1 + 48);
    v10[4] = *(void *)(a1 + 40);
    id v11 = v6;
    objc_msgSend(v4, "snapshotWithPass:size:suppressedContent:completion:", a2, 4087, v10, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_4;
    v8[3] = &unk_1E59CAD68;
    v5 = &v9;
    id v7 = *(id *)(a1 + 48);
    v8[4] = *(void *)(a1 + 40);
    id v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_3;
  block[3] = &unk_1E59CA938;
  id v7 = v3;
  id v4 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(uint64_t))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 48);
    v2(v3);
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) _genericCardIcon];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
  }
}

void __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _genericCardIcon];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

@end