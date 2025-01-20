@interface PBFGalleryCollectionViewController
@end

@implementation PBFGalleryCollectionViewController

uint64_t __50___PBFGalleryCollectionViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 userInterfaceStyle] == 2;
  v3 = (void *)MEMORY[0x1E4FB1618];
  double v4 = dbl_1D337E9E0[v2];
  return [v3 colorWithWhite:v4 alpha:1.0];
}

id __50___PBFGalleryCollectionViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = [WeakRetained dataProvider];
  v12 = objc_msgSend(v11, "sectionIdentifierForIndex:", objc_msgSend(v7, "section"));
  uint64_t v13 = [v11 sectionTypeForSectionWithIdentifier:v12];
  v14 = [v11 previewForPreviewUniqueIdentifier:v8];

  if (v13 == 2)
  {
    v15 = @"kGalleryPosterCellWithDescriptionReuseIdentifier";
    goto LABEL_12;
  }
  v16 = [v14 type];
  v17 = PBFPreviewTypeSmartAlbum;

  if (v16 == v17)
  {
    v15 = @"kGalleryPosterSmartAlbumCellReuseIdentifier";
    goto LABEL_12;
  }
  v18 = [v14 type];
  v19 = PBFPreviewTypeHero;

  if (v18 == v19)
  {
    v15 = @"kGalleryPosterHeroCellReuseIdentifier";
    goto LABEL_12;
  }
  v20 = [v14 subtitleComplication];
  if (v20)
  {

LABEL_11:
    v15 = @"kGalleryPosterCellWithComplicationsReuseIdentifier";
    goto LABEL_12;
  }
  v21 = [v14 suggestedComplications];
  if ([v21 count])
  {

    goto LABEL_11;
  }
  v24 = [v14 suggestedLandscapeComplications];
  uint64_t v25 = [v24 count];

  if (v25) {
    v15 = @"kGalleryPosterCellWithComplicationsReuseIdentifier";
  }
  else {
    v15 = @"kGalleryPosterCellReuseIdentifier";
  }
LABEL_12:
  [WeakRetained[129] updatePosterPreview:v14 isVisible:1];
  v22 = [v9 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v7];
  [WeakRetained configureCell:v22 forCollectionView:v9 posterPreview:v14 indexPath:v7];

  return v22;
}

id __50___PBFGalleryCollectionViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([@"KGalleryHeaderElementKind" isEqual:v8])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v11 = [WeakRetained dataProvider];

    v12 = objc_msgSend(v11, "sectionIdentifierForIndex:", objc_msgSend(v9, "section"));
    uint64_t v13 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:@"KGalleryHeaderElementKind" forIndexPath:v9];
    v14 = [v11 localizedTitleForSectionWithIdentifier:v12];
    v15 = [v11 localizedSubtitleForSectionWithIdentifier:v12];
    [v13 setText:v14];
    [v13 setSubtitle:v15];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void __72___PBFGalleryCollectionViewController__updateAssetHelperActiveContexts___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = +[PBFGenericDisplayContext genericDisplayContextWithDisplayContext:*(void *)(a1 + 32)];
  id v7 = [v4 displayContextWithUpdatedInterfaceOrientation:a2];

  if (([v7 isEqualToDisplayContext:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 40) + 1032) appendDisplayContext:v7];
  }
  v5 = [v7 displayContextWithUpdatedUserInterfaceStyle:1];
  if (([v5 isEqualToDisplayContext:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 40) + 1032) appendDisplayContext:v5];
  }
  v6 = [v7 displayContextWithUpdatedUserInterfaceStyle:2];
  if (([v6 isEqualToDisplayContext:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 40) + 1032) appendDisplayContext:v6];
  }
}

uint64_t __90___PBFGalleryCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAssetHelperActiveContexts:1];
  [*(id *)(a1 + 40) invalidateLayout];
  BOOL v2 = *(void **)(a1 + 48);
  return [v2 reloadData];
}

PBFApplicationStateComponent *__50___PBFGalleryCollectionViewController__resetState__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 posterDescriptorLookupInfo];
  v3 = [v2 posterDescriptorPath];

  double v4 = [PBFApplicationStateComponent alloc];
  v5 = [v3 serverIdentity];
  v6 = [(PBFApplicationStateComponent *)v4 initWithServerIdentity:v5];

  return v6;
}

id __80___PBFGalleryCollectionViewController_collectionView_prefetchItemsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 1056);
  double v4 = [*(id *)(v2 + 1016) itemIdentifierForIndexPath:a2];
  v5 = [v3 previewForPreviewUniqueIdentifier:v4];

  return v5;
}

id __92___PBFGalleryCollectionViewController_collectionView_cancelPrefetchingForItemsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 1056);
  double v4 = [*(id *)(v2 + 1016) itemIdentifierForIndexPath:a2];
  v5 = [v3 previewForPreviewUniqueIdentifier:v4];

  return v5;
}

@end