@interface PXStoryMemoryFeedItemLayoutFactory
- (BOOL)shouldReloadItemLayout:(id)a3 forChangedItemFromIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5 toIndexPath:(PXSimpleIndexPath *)a6 inDataSource:(id)a7;
- (id)createLayoutForFeedItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 viewModel:(id)a5 initialReferenceSize:(CGSize)a6 thumbnailAsset:(id *)a7;
- (id)itemPlacementControllerForItemReference:(id)a3 itemLayout:(id)a4;
- (int64_t)layoutKind;
- (void)collectTapToRadarDiagnosticsForItemLayout:(id)a3 indexPath:(PXSimpleIndexPath *)a4 intoContainer:(id)a5;
- (void)setItemLayout:(id)a3 isHovered:(BOOL)a4;
- (void)setItemLayout:(id)a3 isTouched:(BOOL)a4;
- (void)setItemLayout:(id)a3 shouldAutoplayContent:(BOOL)a4 videoTimeRange:(id *)a5;
- (void)setLayoutKind:(int64_t)a3;
@end

@implementation PXStoryMemoryFeedItemLayoutFactory

- (void)setLayoutKind:(int64_t)a3
{
  self->layoutKind = a3;
}

- (int64_t)layoutKind
{
  return self->layoutKind;
}

- (void)collectTapToRadarDiagnosticsForItemLayout:(id)a3 indexPath:(PXSimpleIndexPath *)a4 intoContainer:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F28E78];
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __104__PXStoryMemoryFeedItemLayoutFactory_collectTapToRadarDiagnosticsForItemLayout_indexPath_intoContainer___block_invoke;
  v16 = &unk_1E5DCC760;
  id v17 = v10;
  id v11 = v10;
  [v9 enumerateDescendantsLayoutsUsingBlock:&v13];

  v12 = objc_msgSend(NSString, "stringWithFormat:", @"Feed Item #%li", a4->item, v13, v14, v15, v16);
  [v8 addAttachmentWithText:v11 name:v12];
}

void __104__PXStoryMemoryFeedItemLayoutFactory_collectTapToRadarDiagnosticsForItemLayout_indexPath_intoContainer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F03266A8])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = +[PXStorySettings possibleFeedHUDTypes];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) integerValue];
          id v10 = objc_msgSend(v3, "diagnosticTextForHUDType:displaySize:", v9, 1920.0, 1080.0);
          if (v10)
          {
            id v11 = @"None";
            if ((unint64_t)(v9 - 1) <= 0x12) {
              id v11 = off_1E5DC50E0[v9 - 1];
            }
            v12 = *(void **)(a1 + 32);
            uint64_t v13 = v11;
            [v12 appendFormat:@"== %@ ==\n", v13];

            [*(id *)(a1 + 32) appendString:v10];
            [*(id *)(a1 + 32) appendString:@"\n"];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
}

- (id)itemPlacementControllerForItemReference:(id)a3 itemLayout:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 itemPlacementControllerForItemReference:v6];

  return v7;
}

- (BOOL)shouldReloadItemLayout:(id)a3 forChangedItemFromIndexPath:(PXSimpleIndexPath *)a4 inDataSource:(id)a5 toIndexPath:(PXSimpleIndexPath *)a6 inDataSource:(id)a7
{
  id v11 = a3;
  long long v12 = *(_OWORD *)&a4->item;
  long long v41 = *(_OWORD *)&a4->dataSourceIdentifier;
  long long v42 = v12;
  id v13 = a7;
  long long v14 = [a5 objectAtIndexPath:&v41];
  long long v15 = *(_OWORD *)&a6->item;
  long long v41 = *(_OWORD *)&a6->dataSourceIdentifier;
  long long v42 = v15;
  long long v16 = [v13 objectAtIndexPath:&v41];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v23 = 0;
    goto LABEL_36;
  }
  long long v17 = __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke(v16);
  v18 = __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke(v14);
  id v19 = v17;
  id v20 = v18;
  v21 = v20;
  if (v19 == v20)
  {
  }
  else
  {
    if (!v19 || !v20)
    {

LABEL_16:
LABEL_30:
      BOOL v27 = 1;
      goto LABEL_31;
    }
    uint64_t v22 = [v19 isContentEqualTo:v20];
    if (!v22) {
      uint64_t v22 = [v21 isContentEqualTo:v19];
    }

    if (v22 != 2) {
      goto LABEL_16;
    }
  }
  __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_2(v14);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_2(v16);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  if (v24 == v25)
  {
  }
  else
  {
    int v26 = [v24 isEqualToString:v25];

    if (!v26)
    {
      BOOL v27 = 1;
      goto LABEL_29;
    }
  }
  __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_3(v14);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_3(v16);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  v40 = v28;
  if (v28 == v29)
  {

LABEL_22:
    v39 = v24;
    __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_4(v14);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_4(v16);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
    }
    else
    {
      int v33 = [v31 isEqualToString:v32];

      if (!v33)
      {
        BOOL v27 = 1;
LABEL_27:

        id v24 = v39;
        goto LABEL_28;
      }
    }
    uint64_t v34 = __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_5(v14);
    BOOL v27 = v34 != __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_5(v16);
    goto LABEL_27;
  }
  int v30 = [v28 isEqualToString:v29];

  if (v30) {
    goto LABEL_22;
  }
  BOOL v27 = 1;
LABEL_28:

LABEL_29:
  if (v27) {
    goto LABEL_30;
  }
LABEL_31:
  int v35 = objc_msgSend(v14, "isFavorite", v39);
  if (v35 != [v16 isFavorite])
  {
    v36 = [v11 model];
    int v37 = [v16 isFavorite];
    if (v37 != [v36 currentAssetCollectionIsFavorite]) {
      BOOL v27 = 1;
    }
  }
  BOOL v23 = v27;
LABEL_36:

  return v23;
}

id __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke(void *a1)
{
  v1 = [a1 keyAssetFetchResult];
  v2 = [v1 firstObject];

  return v2;
}

id __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_2(void *a1)
{
  v1 = [a1 assetCollection];
  v2 = [v1 localizedTitle];

  return v2;
}

id __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_3(void *a1)
{
  v1 = [a1 assetCollection];
  v2 = [v1 localizedSubtitle];

  return v2;
}

__CFString *__127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_4(void *a1)
{
  id v1 = a1;
  v2 = [v1 assetCollection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v4 = [v1 assetCollection];
    id v5 = [v4 storyTitleCategory];
  }
  else
  {
    id v5 = &stru_1F00B0030;
  }

  return v5;
}

uint64_t __127__PXStoryMemoryFeedItemLayoutFactory_shouldReloadItemLayout_forChangedItemFromIndexPath_inDataSource_toIndexPath_inDataSource___block_invoke_5(void *a1)
{
  id v1 = a1;
  v2 = [v1 assetCollection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v4 = [v1 assetCollection];
    uint64_t v5 = [v4 storyColorGradeKind];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setItemLayout:(id)a3 isHovered:(BOOL)a4
{
  uint64_t v5 = [a3 model];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_isHovered___block_invoke;
  v6[3] = &__block_descriptor_33_e31_v16__0___PXStoryMutableModel__8l;
  BOOL v7 = a4;
  [v5 performChanges:v6];
}

uint64_t __62__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_isHovered___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsHovering:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setItemLayout:(id)a3 isTouched:(BOOL)a4
{
  uint64_t v5 = [a3 model];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_isTouched___block_invoke;
  v6[3] = &__block_descriptor_33_e31_v16__0___PXStoryMutableModel__8l;
  BOOL v7 = a4;
  [v5 performChanges:v6];
}

uint64_t __62__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_isTouched___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsTouching:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setItemLayout:(id)a3 shouldAutoplayContent:(BOOL)a4 videoTimeRange:(id *)a5
{
  BOOL v7 = [a3 model];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_shouldAutoplayContent_videoTimeRange___block_invoke;
  v9[3] = &__block_descriptor_81_e31_v16__0___PXStoryMutableModel__8l;
  BOOL v13 = a4;
  long long v8 = *(_OWORD *)&a5->var0.var3;
  long long v10 = *(_OWORD *)&a5->var0.var0;
  long long v11 = v8;
  long long v12 = *(_OWORD *)&a5->var1.var1;
  [v7 performChanges:v9];
}

void __89__PXStoryMemoryFeedItemLayoutFactory_setItemLayout_shouldAutoplayContent_videoTimeRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 80);
  id v4 = a2;
  [v4 setShouldAutoplayThumbnail:v3];
  long long v5 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v5;
  v6[2] = *(_OWORD *)(a1 + 64);
  [v4 setThumbnailAutoplayTimeRange:v6];
}

- (id)createLayoutForFeedItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4 viewModel:(id)a5 initialReferenceSize:(CGSize)a6 thumbnailAsset:(id *)a7
{
  double height = a6.height;
  double width = a6.width;
  id v14 = a4;
  id v15 = a5;
  long long v16 = *(_OWORD *)&a3->item;
  v53[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v53[1] = v16;
  long long v17 = [v14 objectReferenceAtIndexPath:v53];
  v18 = v17;
  if (!v17)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PXStoryMemoryFeedItemLayoutFactory.m", 39, @"Invalid parameter not satisfying: %@", @"objectReference != nil" object file lineNumber description];

    long long v17 = 0;
  }
  id v19 = PXStoryConfigurationForObjectReference(v17);
  [v19 setLaunchType:@"ForYou"];
  if (!v19)
  {
    long long v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"PXStoryMemoryFeedItemLayoutFactory.m" lineNumber:63 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v20 = +[PXStorySettings sharedInstance];
  v21 = v20;
  v43 = a7;
  v44 = v18;
  if (a3->item) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = [v20 wantsFullscreenFeedExperience];
  }
  BOOL v23 = [PXStoryMemoryFeedItemExtendedTraitCollection alloc];
  id v24 = [v15 specManager];
  long long v42 = -[PXStoryMemoryFeedItemExtendedTraitCollection initWithSpecManager:initialReferenceSize:isFullscreen:](v23, "initWithSpecManager:initialReferenceSize:isFullscreen:", v24, v22, width, height);

  id v25 = (void *)[v19 copyWithAdditionalOptions:66];
  int v26 = [v15 assetCollectionActionPerformerDelegate];
  [v25 setAssetCollectionActionPerformerDelegate:v26];

  BOOL v27 = [v15 presentingViewController];
  [v25 setPresentingViewController:v27];

  [v25 setContainerTapToRadarDiagnosticsProvider:v15];
  id v28 = [[PXStoryModel alloc] initWithConfiguration:v25 extendedTraitCollection:v42];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __132__PXStoryMemoryFeedItemLayoutFactory_createLayoutForFeedItemAtIndexPath_inDataSource_viewModel_initialReferenceSize_thumbnailAsset___block_invoke;
  v50[3] = &unk_1E5DB8F78;
  id v51 = v21;
  char v52 = v22;
  id v29 = v21;
  [(PXStoryModel *)v28 performChanges:v50];
  int v30 = [v15 actionPerformer];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __132__PXStoryMemoryFeedItemLayoutFactory_createLayoutForFeedItemAtIndexPath_inDataSource_viewModel_initialReferenceSize_thumbnailAsset___block_invoke_2;
  v45[3] = &unk_1E5DB8FA0;
  long long v31 = *(_OWORD *)&a3->item;
  long long v48 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v49 = v31;
  id v46 = v30;
  id v47 = v14;
  id v32 = v14;
  id v33 = v30;
  uint64_t v34 = [(PXStoryModel *)v28 thumbnailActionPerformer];
  [v34 setPresentPlayerAction:v45];

  int v35 = [[PXStoryLayout alloc] initWithModel:v28];
  v36 = [(PXStoryModel *)v28 resourcesDataSourceManager];
  int v37 = [v36 dataSource];
  v38 = [v37 keyAssetResource];
  objc_msgSend(v38, "px_storyResourceDisplayAsset");
  id *v43 = (id)objc_claimAutoreleasedReturnValue();

  return v35;
}

void __132__PXStoryMemoryFeedItemLayoutFactory_createLayoutForFeedItemAtIndexPath_inDataSource_viewModel_initialReferenceSize_thumbnailAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "setIsHUDVisible:", objc_msgSend(v3, "isFeedHUDVisible"));
  objc_msgSend(v5, "setDiagnosticHUDType:", objc_msgSend(*(id *)(a1 + 32), "feedHUDType"));
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 1;
  }
  [v5 setThumbnailStyle:v4];
}

uint64_t __132__PXStoryMemoryFeedItemLayoutFactory_createLayoutForFeedItemAtIndexPath_inDataSource_viewModel_initialReferenceSize_thumbnailAsset___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  return [v2 handlePrimaryActionOnItemAtIndexPath:v5 inDataSource:v1];
}

@end