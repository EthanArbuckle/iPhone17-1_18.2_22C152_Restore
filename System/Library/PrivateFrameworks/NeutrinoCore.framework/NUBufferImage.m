@interface NUBufferImage
@end

@implementation NUBufferImage

uint64_t __53___NUBufferImage_copyBufferStorage_fromRect_toPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  return +[NUImageUtilities copyPixelsToImage:atPoint:fromBuffer:inRect:](NUImageUtilities, "copyPixelsToImage:atPoint:fromBuffer:inRect:", v2, v3, v4, a2, v7);
}

uint64_t __46___NUBufferImage_writeBufferRegion_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v10 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46___NUBufferImage_writeBufferRegion_withBlock___block_invoke_2;
  v14[3] = &unk_1E5D95A78;
  id v15 = v10;
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = a6;
  id v11 = v10;
  uint64_t v12 = [a5 writeBufferInRegion:a3 block:v14];

  return v12;
}

void __46___NUBufferImage_writeBufferRegion_withBlock___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [NUMutableBufferTileAdapter alloc];
  long long v5 = (void *)a1[4];
  if (!v5)
  {
    memset(v14, 0, sizeof(v14));
    goto LABEL_5;
  }
  [v5 frameRect];
  v6 = (void *)a1[4];
  if (!v6)
  {
LABEL_5:
    memset(v13, 0, sizeof(v13));
    goto LABEL_6;
  }
  [v6 contentRect];
LABEL_6:
  v7 = [(NUMutableBufferTileAdapter *)v4 initWithFrameRect:v14 contentRect:v13 buffer:v3];
  (*(void (**)(void, NUMutableBufferTileAdapter *, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v7, a1[6], v8, v9, v10, v11, v12);
}

uint64_t __45___NUBufferImage_readBufferRegion_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v10 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _OWORD v14[2] = __45___NUBufferImage_readBufferRegion_withBlock___block_invoke_2;
  v14[3] = &unk_1E5D95A28;
  id v15 = v10;
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = a6;
  id v11 = v10;
  uint64_t v12 = [a5 readBufferInRegion:a3 block:v14];

  return v12;
}

void __45___NUBufferImage_readBufferRegion_withBlock___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [NUBufferTileAdapter alloc];
  long long v5 = (void *)a1[4];
  if (!v5)
  {
    memset(v14, 0, sizeof(v14));
    goto LABEL_5;
  }
  [v5 frameRect];
  v6 = (void *)a1[4];
  if (!v6)
  {
LABEL_5:
    memset(v13, 0, sizeof(v13));
    goto LABEL_6;
  }
  [v6 contentRect];
LABEL_6:
  v7 = [(NUBufferTileAdapter *)v4 initWithFrameRect:v14 contentRect:v13 buffer:v3];
  (*(void (**)(void, NUBufferTileAdapter *, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v7, a1[6], v8, v9, v10, v11, v12);
}

@end