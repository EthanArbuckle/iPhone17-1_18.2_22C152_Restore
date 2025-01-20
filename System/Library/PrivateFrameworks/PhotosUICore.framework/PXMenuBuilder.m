@interface PXMenuBuilder
+ (id)_menuWithConfiguration:(id)a3;
+ (id)defaultStoryActionsMenuWithViewModel:(id)a3;
+ (id)defaultStoryThumbnailActionsMenuWithModel:(id)a3 isFavorite:(BOOL)a4;
+ (id)menuWithDeferredConfiguration:(id)a3;
+ (id)menuWithTitle:(id)a3 deferredConfiguration:(id)a4;
- (NSMutableArray)menuItems;
- (PXMenuBuilder)init;
- (void)_addMenuItem:(id)a3;
- (void)addActionsMenuDurationSectionWithStoryViewModel:(id)a3;
- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 handler:(id)a5;
- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 options:(unint64_t)a5 handler:(id)a6;
- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 state:(int64_t)a5 options:(unint64_t)a6 handler:(id)a7;
- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 submenuConfiguration:(id)a5;
- (void)addSectionWithConfiguration:(id)a3;
- (void)addSectionWithMenu:(id)a3;
@end

@implementation PXMenuBuilder

+ (id)menuWithDeferredConfiguration:(id)a3
{
  return +[PXMenuBuilder menuWithTitle:0 deferredConfiguration:a3];
}

+ (id)menuWithTitle:(id)a3 deferredConfiguration:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4FB1970];
  v7 = (void *)MEMORY[0x1E4FB16B8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__PXMenuBuilder_menuWithTitle_deferredConfiguration___block_invoke;
  v14[3] = &unk_1E5DBD6A0;
  id v15 = v5;
  id v8 = v5;
  id v9 = a3;
  v10 = [v7 elementWithProvider:v14];
  v16[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v12 = [v6 menuWithTitle:v9 children:v11];

  return v12;
}

- (void)addActionsMenuDurationSectionWithStoryViewModel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AA7F5FB8(v4, (uint64_t)&v9);
  if (v10)
  {
    sub_1A9BF709C(&v9, (uint64_t)v11);
    uint64_t v6 = v12;
    uint64_t v7 = v13;
    id v8 = __swift_project_boxed_opaque_existential_1(v11, v12);
    sub_1AA016894((uint64_t)v8, 0, 0, v6, v7);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  }
  else
  {
    sub_1AA7F6130((uint64_t)&v9);
  }
}

+ (id)defaultStoryThumbnailActionsMenuWithModel:(id)a3 isFavorite:(BOOL)a4
{
  id v7 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke;
  aBlock[3] = &unk_1E5DB9E18;
  id v8 = v7;
  id v30 = v8;
  long long v9 = _Block_copy(aBlock);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_3;
  v27[3] = &unk_1E5DB9D28;
  id v10 = v9;
  id v28 = v10;
  v11 = _Block_copy(v27);
  uint64_t v12 = [v8 layoutSpec];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_4;
  v19[3] = &unk_1E5DB9EB8;
  BOOL v26 = a4;
  id v20 = v12;
  id v21 = v8;
  SEL v24 = a2;
  id v25 = a1;
  id v22 = v11;
  id v23 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v11;
  id v16 = v12;
  v17 = +[PXMenuBuilder menuWithDeferredConfiguration:v19];

  return v17;
}

id __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_2;
  aBlock[3] = &unk_1E5DD0510;
  id v6 = *(id *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = a2;
  id v11 = v6;
  id v7 = v5;
  id v8 = _Block_copy(aBlock);

  return v8;
}

uint64_t __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_5;
  v14[3] = &unk_1E5DB9E40;
  id v15 = *(id *)(a1 + 32);
  char v17 = *(unsigned char *)(a1 + 80);
  id v16 = *(id *)(a1 + 48);
  [v3 addSectionWithConfiguration:v14];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_6;
  v8[3] = &unk_1E5DB9E68;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  long long v13 = *(_OWORD *)(a1 + 64);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 48);
  [v3 addSectionWithConfiguration:v8];
  id v4 = +[PXRootSettings sharedInstance];
  int v5 = [v4 canShowInternalUI];

  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_8;
    v6[3] = &unk_1E5DB9E90;
    id v7 = *(id *)(a1 + 48);
    [v3 addSectionWithConfiguration:v6];
  }
}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_5(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) thumbnailMenuIncludesFavoriteAction])
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v3 = PXLocalizedStringFromTable(@"InteractiveMemoryCardActionMenuItemUnavorite", @"PhotosUICore");
      id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      int v5 = @"heart.slash";
    }
    else
    {
      id v3 = PXLocalizedStringFromTable(@"InteractiveMemoryCardActionMenuItemFavorite", @"PhotosUICore");
      id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      int v5 = @"heart";
    }
    [v8 addItemWithTitle:v3 systemImageName:v5 handler:v4];
  }
  id v6 = PXLocalizedStringFromTable(@"InteractiveMemoryCardActionMenuItemChangeTitle", @"PhotosUICore");
  id v7 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [v8 addItemWithTitle:v6 systemImageName:@"pencil" handler:v7];
}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) thumbnailMenuIncludesFeatureLessAction])
  {
    id v4 = PXLocalizedStringFromTable(@"InteractiveMemoryCardActionMenuItemFeatureLess", @"PhotosUICore");
    int v5 = [*(id *)(a1 + 40) currentAssetCollection];
    id v6 = objc_msgSend(v5, "px_blockableFeatureActions");
    if ((unint64_t)[v6 count] < 2)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      id v8 = [v6 lastObject];
      id v9 = [v8 actionType];
      id v10 = (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 6, v9);
      [v3 addItemWithTitle:v4 systemImageName:@"memories.badge.minus" handler:v10];
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_7;
      v15[3] = &unk_1E5DB9DA0;
      id v16 = v6;
      id v17 = *(id *)(a1 + 48);
      [v3 addItemWithTitle:v4 systemImageName:@"memories.badge.minus" submenuConfiguration:v15];
    }
  }
  id v11 = PXLocalizedStringFromTable(@"InteractiveMemoryCardActionMenuItemDelete", @"PhotosUICore");
  id v14 = (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 5, v12, v13);
  [v3 addItemWithTitle:v11 systemImageName:@"trash" options:1 handler:v14];
}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  id v5 = a2;
  id v6 = v4(v3, 7);
  [v5 addItemWithTitle:@"File Radar" systemImageName:@"ant" handler:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addItemWithTitle:@"Visual Diagnostics" systemImageName:@"eye" handler:v7];
}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "localizedTitle", (void)v14);
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = [v9 actionType];
        uint64_t v13 = (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, 6, v12);
        [v3 addItemWithTitle:v10 systemImageName:0 handler:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

void __88__PXMenuBuilder_PXStoryViewModel__defaultStoryThumbnailActionsMenuWithModel_isFavorite___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) thumbnailActionPerformer];
  id v4 = v3;
  switch(*(void *)(a1 + 48))
  {
    case 0:
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"+[PXMenuBuilder(PXStoryViewModel) defaultStoryThumbnailActionsMenuWithModel:isFavorite:]_block_invoke_2"];
      [v6 handleFailureInFunction:v7 file:@"PXMenuBuilder+PXStoryViewModel.m" lineNumber:157 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      uint64_t v5 = 1;
      goto LABEL_5;
    case 2:
      uint64_t v5 = 0;
LABEL_5:
      [v3 setFavorite:v5 completionHandler:0];
      break;
    case 3:
      [v3 presentShareSheet];
      break;
    case 4:
      [v3 presentTitleEditor];
      break;
    case 5:
      [v3 deleteMemory];
      break;
    case 6:
      [v3 featureLess:*(void *)(a1 + 40)];
      break;
    case 7:
      [v3 fileRadar];
      break;
    case 8:
      [v3 showVisualDiagnostics];
      break;
    default:
      break;
  }
}

+ (id)defaultStoryActionsMenuWithViewModel:(id)a3
{
  id v3 = a3;
  id v4 = +[PXStorySettings sharedInstance];
  int v5 = [v4 useCommonActionInfrastructureForActionMenu];

  if (v5)
  {
    uint64_t v6 = [v3 makeDefaultActionsMenu];
  }
  else
  {
    uint64_t v7 = +[PXStorySettings sharedInstance];
    id v8 = [v3 viewLayoutSpec];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke;
    aBlock[3] = &unk_1E5DB9D00;
    id v9 = v3;
    id v41 = v9;
    id v10 = _Block_copy(aBlock);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_3;
    v38[3] = &unk_1E5DB9D28;
    id v11 = v10;
    id v39 = v11;
    uint64_t v12 = _Block_copy(v38);
    uint64_t v13 = [v9 mainModel];
    long long v14 = [v13 recipeManager];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_4;
    v30[3] = &unk_1E5DB9DF0;
    id v15 = v9;
    id v31 = v15;
    id v32 = v13;
    id v33 = v8;
    id v34 = v14;
    id v35 = v7;
    id v36 = v12;
    id v37 = v11;
    id v16 = v11;
    id v25 = v7;
    id v17 = v14;
    id v18 = v8;
    id v19 = v13;
    id v20 = v12;
    id v21 = +[PXMenuBuilder menuWithDeferredConfiguration:v30];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_9;
    v28[3] = &unk_1E5DD36F8;
    id v22 = v15;
    id v29 = v22;
    id v23 = [v21 onOpen:v28];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_11;
    v26[3] = &unk_1E5DD36F8;
    id v27 = v22;
    uint64_t v6 = [v23 onClose:v26];
  }
  return v6;
}

id __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_2;
  aBlock[3] = &unk_1E5DD0460;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = a2;
  uint64_t v10 = a3;
  int v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_4(id *a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_5;
  v10[3] = &unk_1E5DB9D50;
  id v11 = a1[4];
  id v15 = a1[9];
  id v12 = a1[5];
  id v13 = a1[6];
  id v14 = a1[7];
  [v3 addSectionWithConfiguration:v10];
  [v3 addActionsMenuDurationSectionWithStoryViewModel:a1[4]];
  id v4 = +[PXRootSettings sharedInstance];
  int v5 = [v4 canShowInternalUI];

  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_6;
    v6[3] = &unk_1E5DB9DC8;
    id v7 = a1[4];
    id v8 = a1[8];
    id v9 = a1[10];
    [v3 addItemWithTitle:@"Internal" systemImageName:@"applelogo" submenuConfiguration:v6];
  }
}

uint64_t __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) performChanges:&__block_literal_global_104128];
}

uint64_t __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) performChanges:&__block_literal_global_299];
}

uint64_t __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 setIsActionMenuOpen:0];
}

uint64_t __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 setIsActionMenuOpen:1];
}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_5(uint64_t a1, void *a2)
{
  id v40 = a2;
  if ([*(id *)(a1 + 32) canToggleSelectMode])
  {
    id v3 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemSelect", @"PhotosUICore");
    id v4 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [v40 addItemWithTitle:v3 systemImageName:@"checkmark.circle" handler:v4];
  }
  if ([*(id *)(a1 + 40) currentAssetCollectionIsFavorite])
  {
    int v5 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemRemoveFromFavorites", @"PhotosUICore");
    uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v7 = @"heart.slash";
  }
  else
  {
    int v5 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemAddToFavorites", @"PhotosUICore");
    uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v7 = @"heart";
  }
  [v40 addItemWithTitle:v5 systemImageName:v7 handler:v6];

  if (([*(id *)(a1 + 32) allowedChromeItems] & 0x10000000) != 0)
  {
    id v8 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemEditMovieTimeline", @"PhotosUICore");
    id v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 48) canShowManagePhotosAction])
  {
    id v8 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemManagePhotos", @"PhotosUICore");
    id v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_10:
    uint64_t v10 = v9();
    [v40 addItemWithTitle:v8 systemImageName:@"photo.on.rectangle.angled" handler:v10];
  }
  if ([*(id *)(a1 + 32) desiredPlayState]
    || ![*(id *)(a1 + 40) currentChapterTitleIsVisible])
  {
    id v11 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemChangeTitle", @"PhotosUICore");
    id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    id v11 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemEditChapterTitle", @"PhotosUICore");
    id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  id v13 = v12();
  [v40 addItemWithTitle:v11 systemImageName:@"pencil" handler:v13];

  if ([*(id *)(a1 + 32) viewMode] == 1 && !objc_msgSend(*(id *)(a1 + 32), "desiredPlayState"))
  {
    id v14 = [*(id *)(a1 + 40) visibleDisplayAssets];
    uint64_t v15 = [v14 count];

    if (v15 == 1)
    {
      id v16 = [*(id *)(a1 + 40) visibleDisplayAssets];
      id v17 = [v16 firstObject];
      id v18 = [*(id *)(a1 + 56) recipe];
      id v19 = [v18 keyAsset];
      id v20 = v17;
      id v21 = v19;
      if (v20 == v21)
      {
      }
      else
      {
        id v22 = v21;
        if (v20 && v21)
        {
          uint64_t v23 = [v20 isContentEqualTo:v21];
          if (!v23) {
            uint64_t v23 = [v22 isContentEqualTo:v20];
          }

          if (v23 == 2) {
            goto LABEL_29;
          }
        }
        else
        {
        }
        id v16 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemMakeKeyPhoto", @"PhotosUICore");
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        [v40 addItemWithTitle:v16 systemImageName:@"person.crop.rectangle.stack" handler:v20];
      }

LABEL_29:
      SEL v24 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemHideFromMemory", @"PhotosUICore");
      id v25 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      [v40 addItemWithTitle:v24 systemImageName:@"minus.circle" handler:v25];
    }
  }
  BOOL v26 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemAirPlay", @"PhotosUICore");
  id v27 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [v40 addItemWithTitle:v26 systemImageName:@"airplayvideo" handler:v27];

  uint64_t v28 = [*(id *)(a1 + 32) shouldAutoReplayPreference];
  id v29 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemReplay", @"PhotosUICore");
  id v30 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [v40 addItemWithTitle:v29 systemImageName:@"repeat" state:v28 options:0 handler:v30];

  uint64_t v31 = [*(id *)(a1 + 32) viewEnvironmentModel];
  if (v31)
  {
    id v32 = (void *)v31;
    id v33 = [*(id *)(a1 + 32) viewEnvironmentModel];
    int v34 = [v33 supportsTogglingDimming];

    if (v34)
    {
      id v35 = [*(id *)(a1 + 32) viewEnvironmentModel];
      unsigned int v36 = [v35 isDimmed];

      uint64_t v37 = v36;
      v38 = PXLocalizedStringFromTable(@"InteractiveMemoryActionMenuItemDim", @"PhotosUICore");
      id v39 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      [v40 addItemWithTitle:v38 systemImageName:@"circle.lefthalf.dotted.inset.half.filled.inverse" state:v37 options:0 handler:v39];
    }
  }
}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_6(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] addInternalActionsTo:v3];
  if ([a1[5] isHUDEnabled])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_7;
    v4[3] = &unk_1E5DB9DA0;
    id v5 = a1[4];
    id v6 = a1[6];
    [v3 addItemWithTitle:@"HUD" systemImageName:@"gauge" submenuConfiguration:v4];
  }
}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isHUDVisible]) {
    uint64_t v4 = [*(id *)(a1 + 32) diagnosticHUDType];
  }
  else {
    uint64_t v4 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_8;
  aBlock[3] = &unk_1E5DB9D78;
  uint64_t v19 = v4;
  id v5 = v3;
  id v17 = v5;
  id v18 = *(id *)(a1 + 40);
  id v6 = (void (**)(void *, void))_Block_copy(aBlock);
  v6[2](v6, 0);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = +[PXStorySettings possibleDefaultHUDTypes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, [*(id *)(*((void *)&v12 + 1) + 8 * v11++) integerValue]);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_8(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[6];
  id v5 = (void *)a1[4];
  uint64_t v6 = a2 - 1;
  if ((unint64_t)(a2 - 1) >= 0x13)
  {
    long long v12 = @"None";
    uint64_t v8 = @"None";
    id v7 = @"eye.slash";
  }
  else
  {
    long long v12 = off_1E5DC50E0[v6];
    id v7 = off_1E5DC5178[v6];
  }
  BOOL v9 = v4 == a2;
  uint64_t v10 = v7;
  uint64_t v11 = (*(void (**)(void))(a1[5] + 16))();
  [v5 addItemWithTitle:v12 systemImageName:v10 state:v9 options:0 handler:v11];
}

void __72__PXMenuBuilder_PXStoryViewModel__defaultStoryActionsMenuWithViewModel___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 actionPerformer];
  [v5 performActionForChromeActionMenuItem:a1[5] withValue:a1[6] sender:v4];
}

- (void).cxx_destruct
{
}

- (NSMutableArray)menuItems
{
  return self->_menuItems;
}

- (void)_addMenuItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PXMenuBuilder *)self menuItems];
  [v5 addObject:v4];
}

- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 submenuConfiguration:(id)a5
{
  id v13 = a3;
  uint64_t v8 = (void (**)(id, PXMenuBuilder *))a5;
  if (a4)
  {
    a4 = [MEMORY[0x1E4FB1818] systemImageNamed:a4];
  }
  BOOL v9 = objc_alloc_init(PXMenuBuilder);
  v8[2](v8, v9);
  uint64_t v10 = (void *)MEMORY[0x1E4FB1970];
  uint64_t v11 = [(PXMenuBuilder *)v9 menuItems];
  long long v12 = [v10 menuWithTitle:v13 image:a4 identifier:0 options:0 children:v11];
  [(PXMenuBuilder *)self _addMenuItem:v12];
}

- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 state:(int64_t)a5 options:(unint64_t)a6 handler:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  if (v11)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4FB1818], "px_systemImageNamed:", v11);
  }
  else
  {
    id v13 = 0;
  }
  long long v14 = (void *)MEMORY[0x1E4FB13F0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__PXMenuBuilder_addItemWithTitle_systemImageName_state_options_handler___block_invoke;
  v24[3] = &unk_1E5DC8470;
  id v15 = v12;
  id v25 = v15;
  id v16 = [v14 actionWithTitle:v10 image:v13 identifier:0 handler:v24];
  id v17 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v18 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v17];

  int v19 = [v18 hasPreview];
  id v20 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterMenu_Shared");
  int v21 = [v10 isEqualToString:v20];

  if (v19 && v21) {
    PXSharedLibraryUpdateActionTitleForPreview(v16);
  }
  [v16 setAttributes:(2 * (a6 & 1)) | (a6 >> 2) & 1];
  if ((unint64_t)a5 <= 2) {
    objc_msgSend(v16, "setState:");
  }
  [(PXMenuBuilder *)self _addMenuItem:v16];
}

void __72__PXMenuBuilder_addItemWithTitle_systemImageName_state_options_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 sender];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 options:(unint64_t)a5 handler:(id)a6
{
}

- (void)addItemWithTitle:(id)a3 systemImageName:(id)a4 handler:(id)a5
{
}

- (void)addSectionWithMenu:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1970];
  id v6 = [a3 children];
  id v5 = [v4 menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v6];
  [(PXMenuBuilder *)self _addMenuItem:v5];
}

- (void)addSectionWithConfiguration:(id)a3
{
  id v4 = (void (**)(id, PXMenuBuilder *))a3;
  BOOL v9 = objc_alloc_init(PXMenuBuilder);
  v4[2](v4, v9);

  id v5 = (void *)MEMORY[0x1E4FB1970];
  id v6 = [(PXMenuBuilder *)v9 menuItems];
  id v7 = (void *)[v6 copy];
  uint64_t v8 = [v5 menuWithTitle:&stru_1F00B0030 image:0 identifier:0 options:1 children:v7];
  [(PXMenuBuilder *)self _addMenuItem:v8];
}

- (PXMenuBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXMenuBuilder;
  uint64_t v2 = [(PXMenuBuilder *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    menuItems = v2->_menuItems;
    v2->_menuItems = v3;
  }
  return v2;
}

+ (id)_menuWithConfiguration:(id)a3
{
  id v3 = (void (**)(id, PXMenuBuilder *))a3;
  id v4 = objc_alloc_init(PXMenuBuilder);
  v3[2](v3, v4);

  id v5 = (void *)MEMORY[0x1E4FB1970];
  objc_super v6 = [(PXMenuBuilder *)v4 menuItems];
  id v7 = [v5 menuWithChildren:v6];

  return v7;
}

void __53__PXMenuBuilder_menuWithTitle_deferredConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v6 = objc_alloc_init(PXMenuBuilder);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = [(PXMenuBuilder *)v6 menuItems];
  id v5 = (void *)[v4 copy];
  v3[2](v3, v5);
}

@end