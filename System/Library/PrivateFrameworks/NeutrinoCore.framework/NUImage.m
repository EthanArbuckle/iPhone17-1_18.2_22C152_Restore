@interface NUImage
@end

@implementation NUImage

void __26___NUImage__purgeableCopy__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 40;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(*(void *)(a1 + 40) + 48));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)v2 + 56);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v10 + 1) + 8 * v7);
        v9 = v8;
        if (v8) {
          objc_msgSend(v8, "incrementUseCount", (void)v10);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "replacePointerAtIndex:withPointer:", v5 + v7, v9, (void)v10);

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      v5 += v7;
    }
    while (v4);
  }
}

void __28___NUImage_endAccessRegion___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(v3 + 24);
  if (v2)
  {
    [v2 bounds];
    uint64_t v5 = *(void **)(a1 + 40);
  }
  else
  {
    uint64_t v5 = 0;
    memset(v11, 0, sizeof(v11));
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28___NUImage_endAccessRegion___block_invoke_2;
  v8[3] = &unk_1E5D95A00;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  [v4 enumerateTilesForWritingInRect:v11 withBlock:v8];
}

void __28___NUImage_endAccessRegion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v3) {
    [v3 frameRect];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  if ([v5 intersectsRect:v10])
  {
    uint64_t v6 = [v4 index];
    --*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 72) + v6);
    uint64_t v7 = *(void **)(a1 + 40);
    if (!*(unsigned char *)(v7[9] + v6))
    {
      id v8 = objc_msgSend(v7, "_tileAtIndex:");
      id v9 = v8;
      if (v8) {
        [v8 decrementAccessCount];
      }
    }
  }
}

void __30___NUImage_beginAccessRegion___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  uint64_t v4 = *(void **)(v3 + 24);
  if (v2)
  {
    [v2 bounds];
    uint64_t v5 = (void *)a1[5];
  }
  else
  {
    uint64_t v5 = 0;
    memset(v12, 0, sizeof(v12));
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30___NUImage_beginAccessRegion___block_invoke_2;
  v8[3] = &unk_1E5D959B0;
  id v6 = v5;
  uint64_t v7 = a1[4];
  id v9 = v6;
  uint64_t v10 = v7;
  uint64_t v11 = a1[6];
  [v4 enumerateTilesForWritingInRect:v12 withBlock:v8];
}

void __30___NUImage_beginAccessRegion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v3) {
    [v3 frameRect];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  if ([v5 intersectsRect:v14])
  {
    uint64_t v6 = [v4 index];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 72);
    int v8 = *(unsigned __int8 *)(v7 + v6);
    *(unsigned char *)(v7 + v6) = v8 + 1;
    if (!v8)
    {
      id v9 = [*(id *)(a1 + 40) _tileAtIndex:v6];
      uint64_t v10 = v9;
      if (v9 && ([v9 incrementAccessCount] & 1) == 0)
      {
        uint64_t v11 = [*(id *)(a1 + 40) validRegion];
        if (v4) {
          [v4 frameRect];
        }
        else {
          memset(v13, 0, sizeof(v13));
        }
        long long v12 = [v11 regionByRemovingRect:v13];
        [*(id *)(a1 + 40) setValidRegion:v12];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
    }
  }
}

void __34___NUImage_writeRegion_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v5) {
    [v5 frameRect];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  if ([v7 intersectsRect:v17])
  {
    uint64_t v8 = [v6 index];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(NSObject **)(v9 + 16);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _OWORD v11[2] = __34___NUImage_writeRegion_withBlock___block_invoke_2;
    v11[3] = &unk_1E5D95988;
    v11[4] = v9;
    uint64_t v15 = v8;
    id v12 = v6;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    uint64_t v16 = a3;
    dispatch_sync(v10, v11);
  }
}

void __34___NUImage_writeRegion_withBlock___block_invoke_5(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) validRegion];
  uint64_t v2 = [v3 regionByAddingRegion:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setValidRegion:v2];
}

void __34___NUImage_writeRegion_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tileAtIndex:*(void *)(a1 + 64)];
  if (!v2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) _createOrCopyTile:0 tileInfo:*(void *)(a1 + 40) writeRegion:*(void *)(a1 + 48)];
  }
  id v3 = [*(id *)(a1 + 40) translatedAndClippedRegion:*(void *)(a1 + 48)];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  _OWORD v17[2] = __34___NUImage_writeRegion_withBlock___block_invoke_3;
  v17[3] = &unk_1E5D958E8;
  id v21 = *(id *)(a1 + 56);
  id v4 = v2;
  id v18 = v4;
  id v5 = v3;
  id v19 = v5;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 72);
  id v20 = v6;
  uint64_t v22 = v7;
  if ([v4 writeStorageInRegion:v5 block:v17] == 3)
  {
    uint64_t v8 = [*(id *)(a1 + 32) _createOrCopyTile:v4 tileInfo:*(void *)(a1 + 40) writeRegion:*(void *)(a1 + 48)];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _OWORD v11[2] = __34___NUImage_writeRegion_withBlock___block_invoke_4;
    v11[3] = &unk_1E5D958E8;
    id v15 = *(id *)(a1 + 56);
    id v4 = v8;
    id v12 = v4;
    id v13 = v5;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 72);
    id v14 = v9;
    uint64_t v16 = v10;
    [v4 writeStorageInRegion:v13 block:v11];
  }
}

uint64_t __34___NUImage_writeRegion_withBlock___block_invoke_3(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a2, a1[8]);
}

uint64_t __34___NUImage_writeRegion_withBlock___block_invoke_4(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a2, a1[8]);
}

void __51___NUImage__createOrCopyTile_tileInfo_writeRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) validRegion];
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  id v4 = [v2 regionByRemovingRect:v5];
  [*(id *)(a1 + 32) setValidRegion:v4];
}

void __51___NUImage__createOrCopyTile_tileInfo_writeRegion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _tileAtIndex:*(void *)(a1 + 72)];
  long long v3 = *(void **)(a1 + 40);
  id obj = (id)v2;
  if (v2)
  {
    BOOL v4 = v2 == (void)v3;
    long long v3 = (void *)v2;
    if (!v4)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 48));
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), obj);
      goto LABEL_10;
    }
  }
  else if (!v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 56) replacePointerAtIndex:*(void *)(a1 + 72) withPointer:*(void *)(a1 + 48)];
    goto LABEL_10;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 72) + *(void *)(a1 + 72)))
  {
    [v3 decrementAccessCount];
    long long v3 = *(void **)(a1 + 40);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  [*(id *)(*(void *)(a1 + 32) + 56) replacePointerAtIndex:*(void *)(a1 + 72) withPointer:*(void *)(a1 + 48)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 72) + *(void *)(a1 + 72))) {
    [*(id *)(a1 + 48) decrementAccessCount];
  }
LABEL_10:
}

void __33___NUImage_readRegion_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v5) {
    [v5 contentRect];
  }
  else {
    memset(v18, 0, sizeof(v18));
  }
  if ([v7 intersectsRect:v18])
  {
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "tileAtIndex:", objc_msgSend(v6, "index"));
    id v9 = v8;
    if (v8 && [v8 isValid])
    {
      uint64_t v10 = [v6 translatedAndClippedRegion:*(void *)(a1 + 32)];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      _OWORD v12[2] = __33___NUImage_readRegion_withBlock___block_invoke_2;
      v12[3] = &unk_1E5D958E8;
      id v16 = *(id *)(a1 + 48);
      id v13 = v9;
      id v14 = v10;
      id v15 = v6;
      uint64_t v17 = a3;
      id v11 = v10;
      [v13 readStorageInRegion:v11 block:v12];
    }
  }
}

uint64_t __33___NUImage_readRegion_withBlock___block_invoke_2(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a2, a1[8]);
}

uint64_t __24___NUImage_tileAtIndex___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _tileAtIndex:*(void *)(a1 + 48)];

  return MEMORY[0x1F41817F8]();
}

void __23___NUImage_description__block_invoke(uint64_t a1)
{
  if (*(uint64_t *)(a1 + 48) >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      long long v3 = [*(id *)(a1 + 32) _tileAtIndex:v2];
      if (v3)
      {
        long long v10 = 0u;
        long long v11 = 0u;
        BOOL v4 = [*(id *)(a1 + 32) layout];
        id v5 = v4;
        if (v4)
        {
          [v4 frameRectForTileAtIndex:v2];
        }
        else
        {
          long long v10 = 0u;
          long long v11 = 0u;
        }

        uint64_t v7 = NSString;
        uint64_t v8 = [NSString stringWithFormat:@"{origin={%ld, %ld} size={%ld, %ld}}]", v10, v11];
        id v9 = [v3 description];
        id v6 = [v7 stringWithFormat:@"%@ - %@", v8, v9];
      }
      else
      {
        id v6 = @"n/a";
      }
      [*(id *)(a1 + 40) addObject:v6];

      ++v2;
    }
    while (v2 < *(void *)(a1 + 48));
  }
}

@end