@interface TSTLayoutTask
- (NSMutableArray)cellStatesToLayout;
- (TSTLayoutTask)initWithMasterLayout:(id)a3;
- (void)dealloc;
- (void)flushToGlobalCaches;
- (void)setCellStatesToLayout:(id)a3;
@end

@implementation TSTLayoutTask

- (TSTLayoutTask)initWithMasterLayout:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSTLayoutTask;
  v4 = [(TSTLayoutTask *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mMasterLayout = (TSTMasterLayout *)a3;
    v4->mCellStatesToLayout = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v5;
}

- (void)dealloc
{
  self->mCellStatesToLayout = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTLayoutTask;
  [(TSTLayoutTask *)&v3 dealloc];
}

- (void)flushToGlobalCaches
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  mCellStatesToLayout = self->mCellStatesToLayout;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__TSTLayoutTask_flushToGlobalCaches__block_invoke;
  v6[3] = &unk_2646B3C98;
  v6[4] = self;
  v6[5] = v3;
  v6[6] = v4;
  [(NSMutableArray *)mCellStatesToLayout enumerateObjectsUsingBlock:v6];
  [(TSUConcurrentCache *)[(TSTMasterLayout *)self->mMasterLayout dupContentCache] addEntriesFromDictionary:v3];

  [(TSUConcurrentCache *)[(TSTMasterLayout *)self->mMasterLayout cellIDToWPColumnCache] addEntriesFromDictionary:v4];
}

uint64_t __36__TSTLayoutTask_flushToGlobalCaches__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  int v3 = [v2 modelCellID];
  unint64_t v4 = [v2 mergedRange];
  uint64_t result = [v2 wpColumn];
  if (result)
  {
    uint64_t v6 = result;
    if ([v2 keyVal]
      && ([v2 layoutCacheFlags] & 2) != 0
      && ((objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "tableInfo"), "editingCellID") ^ v3) & 0xFFFFFF) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, objc_msgSend(v2, "keyVal"));
    }
    if ([v2 hasContent]
      && ([v2 layoutCacheFlags] & 1) != 0
      && ![v2 verticalAlignment])
    {
      HIDWORD(v7) = v3;
      LODWORD(v7) = v3;
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v6, objc_msgSend(NSNumber, "numberWithUnsignedInt:", (v7 >> 16) & 0xFFFF00FF));
    }
    uint64_t result = [v2 inDynamicLayout];
    if ((result & 1) == 0)
    {
      uint64_t result = [v2 cellPropsRowHeight];
      if (result)
      {
        if ((_WORD)v4 == 0xFFFF || (v4 & 0xFF0000) == 0xFF0000 || !HIWORD(v4) || (v4 & 0xFFFF00000000) == 0)
        {
          v22 = v24;
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __36__TSTLayoutTask_flushToGlobalCaches__block_invoke_3;
          v24[3] = &unk_2646B0750;
          uint64_t v23 = *(void *)(a1 + 32);
          v24[4] = v2;
          v24[5] = v23;
        }
        else
        {
          double v8 = TSTMasterLayoutSizeOfTextInColumn((void *)[v2 wpColumn]);
          uint64_t v10 = v9;
          [v2 paddingInsets];
          uint64_t v12 = v11;
          uint64_t v14 = v13;
          uint64_t v16 = v15;
          uint64_t v18 = v17;
          uint64_t v19 = [v2 cell];
          BOOL v21 = v19
             && *(unsigned __int8 *)(v19 + 9) << 8 == 1536
             && (uint64_t v20 = [v2 cell]) != 0
             && *(_DWORD *)(v20 + 104) == 263;
          v22 = v25;
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __36__TSTLayoutTask_flushToGlobalCaches__block_invoke_2;
          v25[3] = &unk_2646B3C70;
          uint64_t v23 = *(void *)(a1 + 32);
          v25[4] = v23;
          v25[11] = v4;
          *(double *)&v25[5] = v8;
          v25[6] = v10;
          v25[7] = v12;
          v25[8] = v14;
          v25[9] = v16;
          v25[10] = v18;
          BOOL v26 = v21;
        }
        return objc_msgSend((id)objc_msgSend(*(id *)(v23 + 8), "whCacheQueue"), "performAsyncWrite:", v22);
      }
    }
  }
  return result;
}

uint64_t __36__TSTLayoutTask_flushToGlobalCaches__block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) mergeRanges];
  uint64_t v3 = *(void *)(a1 + 88);
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  double v8 = *(double *)(a1 + 72);
  double v9 = *(double *)(a1 + 80);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 96);

  return objc_msgSend(v2, "addRange:andSize:andPaddingInsets:andIsCheckbox:", v3, v10, v4, v5, v6, v7, v8, v9);
}

uint64_t __36__TSTLayoutTask_flushToGlobalCaches__block_invoke_3(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) modelCellID];
  double v3 = TSTMasterLayoutSizeOfTextInColumn((void *)[*(id *)(a1 + 32) wpColumn]);
  double v5 = v4;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "cell", v3);
  if (v6 && *(unsigned __int8 *)(v6 + 9) << 8 == 1536) {
    [*(id *)(a1 + 32) cell];
  }
  if (v5 <= 0.0)
  {
    uint64_t v13 = (void *)[*(id *)(*(void *)(a1 + 40) + 8) widthHeightCache];
    return [v13 resetFitHeightForCellID:v2];
  }
  else
  {
    [*(id *)(a1 + 32) paddingInsets];
    double v8 = v7;
    [*(id *)(a1 + 32) paddingInsets];
    double v10 = v5 + v8 + v9;
    uint64_t v11 = (void *)[*(id *)(*(void *)(a1 + 40) + 8) widthHeightCache];
    return [v11 setFitHeight:v2 forCellID:v10];
  }
}

- (NSMutableArray)cellStatesToLayout
{
  return self->mCellStatesToLayout;
}

- (void)setCellStatesToLayout:(id)a3
{
}

@end