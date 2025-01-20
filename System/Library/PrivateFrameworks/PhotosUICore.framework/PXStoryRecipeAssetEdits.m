@interface PXStoryRecipeAssetEdits
- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo;
- (BOOL)isEqual:(id)a3;
- (PXDisplayAsset)keyAsset;
- (PXDisplayAssetFetchResult)userCuratedAssets;
- (PXMemoryCustomUserAssetsEdit)customUserAssetsEdit;
- (PXStoryRecipeAssetEdits)init;
- (PXStoryRecipeAssetEdits)initWithKeyAsset:(id)a3 overallDurationInfo:(id *)a4 userCuratedAssets:(id)a5 customUserAssetsEdit:(id)a6;
- (id)copyWithCustomUserAssets:(id)a3;
- (id)copyWithKeyAsset:(id)a3;
- (id)copyWithOverallDurationInfo:(id *)a3 userCuratedAssets:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation PXStoryRecipeAssetEdits

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCuratedAssets, 0);
  objc_storeStrong((id *)&self->_customUserAssetsEdit, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
}

- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo
{
  long long v3 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self->var1.var2.var1;
  *(_OWORD *)&retstr->var1.var1.var3 = v3;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[1].var1.var0.var1;
  long long v4 = *(_OWORD *)&self->var1.var1.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var1.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v4;
  return self;
}

- (PXDisplayAssetFetchResult)userCuratedAssets
{
  return self->_userCuratedAssets;
}

- (PXMemoryCustomUserAssetsEdit)customUserAssetsEdit
{
  return self->_customUserAssetsEdit;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (id)copyWithCustomUserAssets:(id)a3
{
  id v4 = a3;
  v5 = [[PXMemoryCustomUserAssetsEdit alloc] initWithAssets:v4];

  v6 = [PXStoryRecipeAssetEdits alloc];
  v7 = [(PXStoryRecipeAssetEdits *)self keyAsset];
  [(PXStoryRecipeAssetEdits *)self overallDurationInfo];
  v8 = [(PXStoryRecipeAssetEdits *)self userCuratedAssets];
  v9 = [(PXStoryRecipeAssetEdits *)v6 initWithKeyAsset:v7 overallDurationInfo:&v11 userCuratedAssets:v8 customUserAssetsEdit:v5];

  return v9;
}

- (id)copyWithOverallDurationInfo:(id *)a3 userCuratedAssets:(id)a4
{
  id v6 = a4;
  v7 = [PXStoryRecipeAssetEdits alloc];
  v8 = [(PXStoryRecipeAssetEdits *)self keyAsset];
  v9 = [(PXStoryRecipeAssetEdits *)self customUserAssetsEdit];
  long long v10 = *(_OWORD *)&a3->var1.var1.var3;
  v14[2] = *(_OWORD *)&a3->var1.var1.var0;
  v14[3] = v10;
  v14[4] = *(_OWORD *)&a3->var1.var2.var1;
  long long v11 = *(_OWORD *)&a3->var1.var0.var1;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v11;
  v12 = [(PXStoryRecipeAssetEdits *)v7 initWithKeyAsset:v8 overallDurationInfo:v14 userCuratedAssets:v6 customUserAssetsEdit:v9];

  return v12;
}

- (id)copyWithKeyAsset:(id)a3
{
  id v4 = a3;
  v5 = [PXStoryRecipeAssetEdits alloc];
  [(PXStoryRecipeAssetEdits *)self overallDurationInfo];
  id v6 = [(PXStoryRecipeAssetEdits *)self userCuratedAssets];
  v7 = [(PXStoryRecipeAssetEdits *)self customUserAssetsEdit];
  v8 = [(PXStoryRecipeAssetEdits *)v5 initWithKeyAsset:v4 overallDurationInfo:&v10 userCuratedAssets:v6 customUserAssetsEdit:v7];

  return v8;
}

- (id)description
{
  long long v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(PXStoryRecipeAssetEdits *)self keyAsset];
  v7 = [v6 uuid];
  [(PXStoryRecipeAssetEdits *)self overallDurationInfo];
  v8 = PFStoryOverallDurationInfoDescription();
  v9 = [(PXStoryRecipeAssetEdits *)self userCuratedAssets];
  uint64_t v10 = [v9 count];
  long long v11 = [(PXStoryRecipeAssetEdits *)self customUserAssetsEdit];
  v12 = [v11 assets];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; keyAsset:%@, overallDurationInfo:%@, userCuratedAssets:%ld, customUserAssets:%ld>",
    v5,
    self,
    v7,
    v8,
    v10,
  v13 = [v12 count]);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PXStoryRecipeAssetEdits *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      keyAsset = self->_keyAsset;
      v7 = [(PXStoryRecipeAssetEdits *)v5 keyAsset];
      if (keyAsset == v7)
      {

        if (v5)
        {
LABEL_6:
          [(PXStoryRecipeAssetEdits *)v5 overallDurationInfo];
          uint64_t v10 = v20[0];
          goto LABEL_11;
        }
      }
      else
      {
        v8 = v7;
        int v9 = [(PXDisplayAsset *)keyAsset isEqual:v7];

        if (!v9) {
          goto LABEL_15;
        }
        if (v5) {
          goto LABEL_6;
        }
      }
      uint64_t v10 = 0;
      memset(v22, 0, sizeof(v22));
      long long v21 = 0u;
      memset(v20, 0, sizeof(v20));
LABEL_11:
      if (self->_overallDurationInfo.kind != v10) {
        goto LABEL_15;
      }
      v24[1] = *(_OWORD *)&self->_overallDurationInfo.specificDurationInfo.preferredDuration.timescale;
      CMTime maximumDuration = (CMTime)self->_overallDurationInfo.specificDurationInfo.maximumDuration;
      v24[0] = *(_OWORD *)&self->_overallDurationInfo.specificDurationInfo.minimumDuration.epoch;
      long long v23 = v21;
      CMTime time1 = (CMTime)self->_overallDurationInfo.specificDurationInfo.minimumDuration;
      CMTime time2 = *(CMTime *)&v20[1];
      if (CMTimeCompare(&time1, &time2)) {
        goto LABEL_15;
      }
      CMTime time1 = *(CMTime *)((char *)v24 + 8);
      *(_OWORD *)&time2.value = v23;
      time2.epoch = v22[0];
      if (CMTimeCompare(&time1, &time2)) {
        goto LABEL_15;
      }
      CMTime time1 = maximumDuration;
      CMTime time2 = *(CMTime *)&v22[1];
      if (CMTimeCompare(&time1, &time2)) {
        goto LABEL_15;
      }
      userCuratedAssets = self->_userCuratedAssets;
      v14 = [(PXStoryRecipeAssetEdits *)v5 userCuratedAssets];
      if (userCuratedAssets == v14)
      {

LABEL_22:
        v17 = [(PXMemoryCustomUserAssetsEdit *)self->_customUserAssetsEdit assets];
        v18 = [(PXStoryRecipeAssetEdits *)v5 customUserAssetsEdit];
        v19 = [v18 assets];
        if (v17 == v19) {
          char v11 = 1;
        }
        else {
          char v11 = [v17 isEqual:v19];
        }

        goto LABEL_16;
      }
      v15 = v14;
      int v16 = [(PXDisplayAssetFetchResult *)userCuratedAssets isEqual:v14];

      if (v16) {
        goto LABEL_22;
      }
LABEL_15:
      char v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_17:

  return v11;
}

- (unint64_t)hash
{
  v2 = [(PXStoryRecipeAssetEdits *)self keyAsset];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (PXStoryRecipeAssetEdits)initWithKeyAsset:(id)a3 overallDurationInfo:(id *)a4 userCuratedAssets:(id)a5 customUserAssetsEdit:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryRecipeAssetEdits;
  v14 = [(PXStoryRecipeAssetEdits *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_keyAsset, a3);
    *(_OWORD *)&v15->_overallDurationInfo.kind = *(_OWORD *)&a4->var0;
    long long v16 = *(_OWORD *)&a4->var1.var0.var1;
    long long v17 = *(_OWORD *)&a4->var1.var1.var0;
    long long v18 = *(_OWORD *)&a4->var1.var2.var1;
    *(_OWORD *)&v15->_overallDurationInfo.specificDurationInfo.preferredDuration.epoch = *(_OWORD *)&a4->var1.var1.var3;
    *(_OWORD *)&v15->_overallDurationInfo.specificDurationInfo.maximumDuration.timescale = v18;
    *(_OWORD *)&v15->_overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v16;
    *(_OWORD *)&v15->_overallDurationInfo.specificDurationInfo.preferredDuration.value = v17;
    objc_storeStrong((id *)&v15->_userCuratedAssets, a5);
    objc_storeStrong((id *)&v15->_customUserAssetsEdit, a6);
  }

  return v15;
}

- (PXStoryRecipeAssetEdits)init
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 48);
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F8D288] + 32);
  v5[3] = v2;
  v5[4] = *(_OWORD *)(MEMORY[0x1E4F8D288] + 64);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 16);
  v5[0] = *MEMORY[0x1E4F8D288];
  v5[1] = v3;
  return [(PXStoryRecipeAssetEdits *)self initWithKeyAsset:0 overallDurationInfo:v5 userCuratedAssets:0 customUserAssetsEdit:0];
}

@end