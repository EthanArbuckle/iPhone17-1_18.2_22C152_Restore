@interface PXPhotosSearchSectionHeaderLayoutProvider
- (BOOL)wantsHeaderForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (id)customBackgroundStyle;
- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (int64_t)actionTypeForHeaderLayout:(id)a3;
- (int64_t)actionVisibilityForHeaderLayout:(id)a3;
- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5;
@end

@implementation PXPhotosSearchSectionHeaderLayoutProvider

- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5
{
  id v6 = a3;
  v7 = [(PXActionableSectionHeaderLayoutProvider *)self viewModel];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__PXPhotosSearchSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke;
  v9[3] = &unk_1E5DCF6C0;
  id v10 = v6;
  id v8 = v6;
  [v7 performChanges:v9];
}

void __94__PXPhotosSearchSectionHeaderLayoutProvider_sectionHeader_didPressButtonForActionType_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setIsInSelectMode:", objc_msgSend(v3, "isInSelectMode") ^ 1);
  objc_msgSend(v3, "attemptSetInSelectMode:", objc_msgSend(v3, "isInSelectMode") ^ 1);
}

- (int64_t)actionVisibilityForHeaderLayout:(id)a3
{
  return 0;
}

- (int64_t)actionTypeForHeaderLayout:(id)a3
{
  id v4 = a3;
  int64x2_t v18 = 0u;
  int64x2_t v19 = 0u;
  v5 = [v4 dataSource];
  id v6 = v5;
  if (v5)
  {
    [v5 lastSectionIndexPath];
  }
  else
  {
    int64x2_t v18 = 0u;
    int64x2_t v19 = 0u;
  }

  if (v18.i64[1] < 0) {
    goto LABEL_12;
  }
  while (1)
  {
    v7 = [v4 dataSource];
    v17[0] = v18;
    v17[1] = v19;
    BOOL v8 = [(PXPhotosSearchSectionHeaderLayoutProvider *)self wantsHeaderForDataSource:v7 sectionIndexPath:v17];

    if (v8) {
      break;
    }
    uint64_t v9 = v18.i64[1]--;
    if (v9 <= 0) {
      goto LABEL_12;
    }
  }
  if (v4)
  {
    [v4 sectionIndexPath];
    int64x2_t v10 = v15;
    int64x2_t v11 = v16;
  }
  else
  {
    int64x2_t v10 = 0uLL;
    int64x2_t v11 = 0uLL;
  }
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v10, v18), (int32x4_t)vceqq_s64(v11, v19))), 0xFuLL))))
  {
    v14 = [(PXActionableSectionHeaderLayoutProvider *)self viewModel];
    if ([v14 isInSelectMode]) {
      int64_t v12 = 8;
    }
    else {
      int64_t v12 = 9;
    }
  }
  else
  {
LABEL_12:
    int64_t v12 = 0;
  }

  return v12;
}

- (id)customBackgroundStyle
{
  return &unk_1F02D7588;
}

- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  id v6 = a3;
  v7 = v6;
  memset(v17, 0, sizeof(v17));
  if (v6)
  {
    [v6 lastSectionIndexPath];
    if ((*((void *)&v17[0] + 1) & 0x8000000000000000) != 0) {
      goto LABEL_10;
    }
  }
  while (1)
  {
    v16[0] = v17[0];
    v16[1] = v17[1];
    if ([(PXPhotosSearchSectionHeaderLayoutProvider *)self wantsHeaderForDataSource:v7 sectionIndexPath:v16])
    {
      break;
    }
    uint64_t v8 = (*((void *)&v17[0] + 1))--;
    if (v8 <= 0) {
      goto LABEL_10;
    }
  }
  if (a4->dataSourceIdentifier == *(void *)&v17[0]
    && *(_OWORD *)&a4->section == *(_OWORD *)((char *)v17 + 8)
    && a4->subitem == *((void *)&v17[1] + 1))
  {
    uint64_t v9 = objc_msgSend(v7, "numberOfItemsInSection:");
    int64x2_t v10 = NSString;
    int64x2_t v11 = PXLocalizedStringFromTable(@"%ld_SEARCH_ALL_RESULTS", @"PhotosUICore");
    int64_t v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v9);
  }
  else
  {
LABEL_10:
    long long v13 = *(_OWORD *)&a4->item;
    v17[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v17[1] = v13;
    v14 = [v7 assetCollectionAtSectionIndexPath:v17];
    int64_t v12 = [v14 localizedTitle];
  }
  return v12;
}

- (BOOL)wantsHeaderForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  id v5 = a3;
  long long v6 = *(_OWORD *)&a4->item;
  v11[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v11[1] = v6;
  v7 = [v5 assetCollectionAtSectionIndexPath:v11];
  uint64_t v8 = [v7 localizedTitle];
  if (v8) {
    BOOL v9 = [v5 numberOfItemsInSection:a4->section] > 0;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

@end