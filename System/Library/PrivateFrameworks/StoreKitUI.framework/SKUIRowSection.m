@interface SKUIRowSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUILockupStyle)_lockupStyleForComponent:(SEL)a3 columnIndex:(id)a4;
- (SKUIRowSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)_edgeInsetsForColumnIndex:(int64_t)a3;
- (double)_cellContentHeightForRowWidth:(double)a3;
- (double)_columnWidthForColumnIndex:(int64_t)a3 rowWidth:(double)a4;
- (double)_heightForArtwork:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5;
- (double)_heightForComponent:(id)a3 columnIndex:(double)a4 rowWidth:(double)a5;
- (double)_heightForCountdownComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5;
- (double)_heightForEditorialComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5;
- (double)_heightForGalleryComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5;
- (double)_heightForLockupComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5;
- (double)_heightForMediaComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5;
- (double)_interColumnSpacing;
- (id)_columnViews;
- (id)_editorialLayoutForEditorial:(id)a3 columnIndex:(int64_t)a4;
- (id)_editorialLayoutForLockup:(id)a3 columnIndex:(int64_t)a4;
- (id)_imageConsumerWithItem:(id)a3 lockupSize:(int64_t)a4;
- (id)_lockupImageForComponent:(id)a3;
- (id)_lockupPlaceholderForComponent:(id)a3;
- (id)_missingItemLoader;
- (id)_newSizeToFitArtworkRequestWithArtwork:(id)a3 columnIndex:(int64_t)a4;
- (id)_newViewWithMediaComponent:(id)a3;
- (id)_overlaySourceCell;
- (id)_popSourceViewForOverlayController:(id)a3;
- (id)_viewControllerForCountdownComponent:(id)a3;
- (id)_viewControllerForGalleryComponent:(id)a3;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (id)clickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5;
- (id)itemOfferClickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5;
- (int64_t)numberOfCells;
- (void)_enumerateLockupsWithBlock:(id)a3;
- (void)_expandEditorialComponent:(id)a3 columnIndex:(int64_t)a4;
- (void)_loadImagesForGalleryComponent:(id)a3 columnIndex:(int64_t)a4;
- (void)_reloadEditorialCell:(id)a3 forComponent:(id)a4 columnIndex:(int64_t)a5;
- (void)_reloadEditorialLockupCell:(id)a3 forComponent:(id)a4 columnIndex:(int64_t)a5;
- (void)_reloadLockupCell:(id)a3 forComponent:(id)a4 columnIndex:(int64_t)a5;
- (void)_reloadView:(id)a3 forMediaComponent:(id)a4 columnIndex:(int64_t)a5;
- (void)_selectGalleryComponent:(id)a3 columnIndex:(int64_t)a4;
- (void)_selectLockupComponent:(id)a3 columnIndex:(int64_t)a4;
- (void)_selectMediaComponent:(id)a3 columnIndex:(int64_t)a4;
- (void)_setPositionForClickEvent:(id)a3 elementIndex:(int64_t)a4;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidConfirmItemOfferAtIndexPath:(id)a3;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)invalidateCachedLayoutInformation;
- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4;
- (void)itemStateCenterRestrictionsChanged:(id)a3;
- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4;
- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)productPageOverlayDidDismiss:(id)a3;
- (void)willAppearInContext:(id)a3;
- (void)willHideInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIRowSection

- (SKUIRowSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRowSection initWithPageComponent:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIRowSection;
  v5 = [(SKUIStorePageSection *)&v10 initWithPageComponent:v4];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    componentArtworkRequestIDs = v5->_componentArtworkRequestIDs;
    v5->_componentArtworkRequestIDs = (NSMapTable *)v6;

    v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    v5->_isPad = [v8 userInterfaceIdiom] == 1;
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[SKUIItemStateCenter defaultCenter];
  [v3 removeObserver:self];

  [(SKUIMissingItemLoader *)self->_missingItemLoader setDelegate:0];
  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)SKUIRowSection;
  [(SKUIStorePageSection *)&v4 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v20 = a4;
  id v6 = a3;
  v7 = [(SKUIStorePageSection *)self pageComponent];
  v8 = [v7 viewElement];
  [v20 addItemViewElement:v8];

  v9 = [(SKUIStorePageSection *)self pageComponent];
  objc_super v10 = [v9 childComponents];
  unint64_t v11 = [v6 item];

  if (v11 < [v10 count])
  {
    v12 = [v10 objectAtIndex:v11];
    uint64_t v13 = [v12 componentType];
    if (v13 != 10)
    {
      if (v13 == 9)
      {
        v19 = [v12 item];
        uint64_t v16 = [v19 itemIdentifier];
      }
      else
      {
        if (v13 == 7)
        {
          v14 = [(NSMapTable *)self->_galleryViewControllers objectForKey:v12];
          v15 = [v14 selectedMediaComponent];
          uint64_t v16 = [v15 mediaIdentifier];

          v17 = [v14 selectedMediaComponent];
          v18 = [v17 viewElement];

LABEL_10:
          [v20 addItemIdentifier:v16];
          [v20 addItemViewElement:v18];

          goto LABEL_11;
        }
        uint64_t v16 = 0;
      }
      v18 = 0;
      goto LABEL_10;
    }
    uint64_t v16 = [v12 mediaIdentifier];
    v18 = [v12 viewElement];
    goto LABEL_10;
  }
LABEL_11:
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self pageComponent];
  id v6 = [v5 backgroundColor];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKUIRowSection;
    id v7 = [(SKUIStorePageSection *)&v10 backgroundColorForIndexPath:v4];
  }
  v8 = v7;

  return v8;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self context];
  id v6 = [v5 collectionView];

  unint64_t v7 = [v4 item];
  v8 = [(SKUIStorePageSection *)self pageComponent];
  v9 = [v8 childComponents];

  if (v7 >= [v9 count])
  {
    objc_super v10 = 0;
  }
  else
  {
    objc_super v10 = [v9 objectAtIndex:v7];
  }
  uint64_t v11 = [v10 componentType];
  if (v11 == 5)
  {
    uint64_t v13 = [v6 dequeueReusableCellWithReuseIdentifier:0x1F1C90D28 forIndexPath:v4];
    [(SKUIRowSection *)self _reloadEditorialCell:v13 forComponent:v10 columnIndex:v7];
  }
  else if (v11 == 9)
  {
    v12 = [v10 editorial];

    if (v12)
    {
      uint64_t v13 = [v6 dequeueReusableCellWithReuseIdentifier:0x1F1C9A308 forIndexPath:v4];
      [(SKUIRowSection *)self _reloadEditorialLockupCell:v13 forComponent:v10 columnIndex:v7];
    }
    else
    {
      uint64_t v13 = [v6 dequeueReusableCellWithReuseIdentifier:0x1F1C902C8 forIndexPath:v4];
      [(SKUIRowSection *)self _reloadLockupCell:v13 forComponent:v10 columnIndex:v7];
    }
  }
  else
  {
    uint64_t v13 = [v6 dequeueReusableCellWithReuseIdentifier:@"SKUIRowSectionMiscReuseIdentifer" forIndexPath:v4];
    if (v10)
    {
      v14 = [(SKUIRowSection *)self _columnViews];
      v15 = [v14 objectForKey:v10];
    }
    else
    {
      v15 = 0;
    }
    [v13 setContentChildView:v15];
    [(SKUIRowSection *)self _edgeInsetsForColumnIndex:v7];
    objc_msgSend(v13, "setContentInsets:");
    uint64_t v16 = [v10 componentType];
    if (v16 == 10)
    {
      [(SKUIRowSection *)self _reloadView:v15 forMediaComponent:v10 columnIndex:v7];
    }
    else if (v16 == 7)
    {
      [(SKUIRowSection *)self _loadImagesForGalleryComponent:v10 columnIndex:v7];
    }
  }

  return v13;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self context];
  id v6 = [v5 collectionView];

  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(SKUIStorePageSection *)self pageComponent];
  v12 = v11;
  if (self->_isPad || ![v11 shouldAutoFlow])
  {
    if (v8 <= v10) {
      uint64_t v18 = 184;
    }
    else {
      uint64_t v18 = 152;
    }
    double v17 = *(double *)((char *)&self->super.super.isa + v18);
    if (v17 < 0.00000011920929)
    {
      [(SKUIRowSection *)self _cellContentHeightForRowWidth:v8];
      double v17 = *(double *)&v19;
      *(Class *)((char *)&self->super.super.isa + v18) = v19;
    }
  }
  else
  {
    uint64_t v13 = [v4 item];
    v14 = [v12 childComponents];
    v15 = [v14 objectAtIndex:v13];

    [(SKUIRowSection *)self _heightForComponent:v15 columnIndex:(double)v13 rowWidth:v8];
    double v17 = v16;
  }
  uint64_t v20 = [v4 item];
  [(SKUIRowSection *)self _columnWidthForColumnIndex:v20 rowWidth:v8];
  double v22 = v21;
  [(SKUIRowSection *)self _edgeInsetsForColumnIndex:v20];
  double v25 = v17 + v24 + v23;
  double v28 = v22 + v26 + v27;

  double v29 = v28;
  double v30 = v25;
  result.height = v30;
  result.width = v29;
  return result;
}

- (id)clickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIRowSection;
  double v7 = -[SKUIStorePageSection clickEventWithItem:elementName:index:](&v9, sel_clickEventWithItem_elementName_index_, a3, a4);
  [(SKUIRowSection *)self _setPositionForClickEvent:v7 elementIndex:a5];

  return v7;
}

- (void)collectionViewDidConfirmItemOfferAtIndexPath:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [v16 item];
  v5 = [(SKUIStorePageSection *)self pageComponent];
  id v6 = [v5 childComponents];
  double v7 = [v6 objectAtIndex:v4];

  if ([v7 componentType] == 9)
  {
    double v8 = [(SKUIStorePageSection *)self context];
    objc_super v9 = [v7 item];
    double v10 = [(SKUIRowSection *)self itemOfferClickEventWithItem:v9 elementName:@"Column" index:v4];
    if (v10)
    {
      uint64_t v11 = [v8 metricsController];
      [v11 recordEvent:v10];
    }
    v12 = [v8 collectionView];
    uint64_t v13 = [v12 cellForItemAtIndexPath:v16];

    v14 = [(SKUIStorePageSection *)self performItemOfferActionForItem:v9];
    v15 = [v13 layout];
    [v15 setItemState:v14 animated:1];
  }
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 item];
  id v6 = [(SKUIStorePageSection *)self pageComponent];
  double v7 = [v6 childComponents];
  double v8 = [v7 objectAtIndex:v5];

  switch([v8 componentType])
  {
    case 5:
      [(SKUIRowSection *)self _expandEditorialComponent:v8 columnIndex:v5];
      break;
    case 7:
      [(SKUIRowSection *)self _selectGalleryComponent:v8 columnIndex:v5];
      break;
    case 9:
      [(SKUIRowSection *)self _selectLockupComponent:v8 columnIndex:v5];
      break;
    case 10:
      [(SKUIRowSection *)self _selectMediaComponent:v8 columnIndex:v5];
      break;
    default:
      break;
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIRowSection;
  [(SKUIStorePageSection *)&v9 collectionViewDidSelectItemAtIndexPath:v4];
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 indexPath];
  id v6 = [(SKUIRowSection *)self backgroundColorForIndexPath:v5];
  [v4 setBackgroundColor:v6];

  v7.receiver = self;
  v7.super_class = (Class)SKUIRowSection;
  [(SKUIStorePageSection *)&v7 collectionViewWillApplyLayoutAttributes:v4];
}

- (void)invalidateCachedLayoutInformation
{
  self->_landscapeCellContentHeight = 0.0;
  self->_portraitCellContentHeight = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)SKUIRowSection;
  [(SKUIStorePageSection *)&v2 invalidateCachedLayoutInformation];
}

- (id)itemOfferClickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIRowSection;
  objc_super v7 = -[SKUIStorePageSection itemOfferClickEventWithItem:elementName:index:](&v9, sel_itemOfferClickEventWithItem_elementName_index_, a3, a4);
  [(SKUIRowSection *)self _setPositionForClickEvent:v7 elementIndex:a5];

  return v7;
}

- (int64_t)numberOfCells
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v2 = [(SKUIStorePageSection *)self pageComponent];
  v3 = [v2 columnWidths];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v12 + 1) + 8 * i) integerValue];
      }
      v7 += v5;
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v10 = [v2 numberOfColumns];

  return v7 - v6 + v10;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  id v6 = [(SKUIStorePageSection *)self pageComponent];
  if ([v6 isMissingItemData])
  {
    uint64_t v5 = [(SKUIRowSection *)self _missingItemLoader];
    [v5 loadItemsForPageComponent:v6 startIndex:0 reason:a3];
  }
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SKUIRowSectionMiscReuseIdentifer"];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C90D28];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C902C8];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C9A308];
  id v6 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v7 = [v6 childComponents];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__SKUIRowSection_willAppearInContext___block_invoke;
  v13[3] = &unk_1E6425D38;
  v13[4] = self;
  [v7 enumerateObjectsUsingBlock:v13];
  uint64_t v8 = [v4 parentViewController];
  objc_super v9 = [v8 clientContext];
  clientContext = self->_clientContext;
  self->_clientContext = v9;

  uint64_t v11 = +[SKUIItemStateCenter defaultCenter];
  [v11 addObserver:self];

  v12.receiver = self;
  v12.super_class = (Class)SKUIRowSection;
  [(SKUIStorePageSection *)&v12 willAppearInContext:v4];
}

void __38__SKUIRowSection_willAppearInContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [v8 componentType];
  if (v5 == 9)
  {
    id v6 = [*(id *)(a1 + 32) _editorialLayoutForLockup:v8 columnIndex:a3];
  }
  else
  {
    if (v5 != 5) {
      goto LABEL_6;
    }
    id v6 = [*(id *)(a1 + 32) _editorialLayoutForEditorial:v8 columnIndex:a3];
  }
  uint64_t v7 = v6;
  [v6 enqueueLayoutRequests];

LABEL_6:
}

- (void)willHideInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SKUIItemStateCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SKUIRowSection;
  [(SKUIStorePageSection *)&v6 willHideInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(SKUIStorePageSection *)self context];
  objc_super v9 = [v8 collectionView];

  int64_t v10 = [(SKUIStorePageSection *)self sectionIndex];
  uint64_t v11 = [(SKUIStorePageSection *)self pageComponent];
  objc_super v12 = [v11 childComponents];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__SKUIRowSection_willTransitionToSize_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_1E6425D60;
  v15[4] = self;
  id v16 = v9;
  int64_t v17 = v10;
  BOOL v18 = width > height;
  id v13 = v9;
  [v12 enumerateObjectsUsingBlock:v15];
  v14.receiver = self;
  v14.super_class = (Class)SKUIRowSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v14, sel_willTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void __65__SKUIRowSection_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  uint64_t v5 = [v10 componentType];
  if (v5 == 9)
  {
    objc_super v6 = [*(id *)(a1 + 32) _editorialLayoutForLockup:v10 columnIndex:a3];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:*(void *)(a1 + 48)];
      id v8 = [*(id *)(a1 + 40) cellForItemAtIndexPath:v7];
      objc_super v9 = [v8 layout];
      [v9 applyEditorialLayout:v6 withOrientation:*(void *)(a1 + 56)];
      goto LABEL_7;
    }
  }
  else
  {
    if (v5 != 5) {
      goto LABEL_9;
    }
    objc_super v6 = [*(id *)(a1 + 32) _editorialLayoutForEditorial:v10 columnIndex:a3];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:*(void *)(a1 + 48)];
      id v8 = [*(id *)(a1 + 40) cellForItemAtIndexPath:v7];
      objc_super v9 = [v8 layout];
      objc_msgSend(v9, "applyEditorialLayout:withOrientation:expanded:", v6, *(void *)(a1 + 56), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "containsIndex:", a3));
LABEL_7:
    }
  }

LABEL_9:
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SKUIRowSection *)self _columnViews];
  uint64_t v9 = [v7 requestIdentifier];

  id v10 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v11 = [v10 childComponents];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__SKUIRowSection_artworkRequest_didLoadImage___block_invoke;
  v14[3] = &unk_1E6425D88;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  uint64_t v17 = v9;
  id v12 = v8;
  id v13 = v6;
  [v11 enumerateObjectsUsingBlock:v14];
}

void __46__SKUIRowSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "objectForKey:");
  if ([v7 unsignedIntegerValue] == *(void *)(a1 + 56))
  {
    uint64_t v8 = [v14 componentType];
    if (v8 == 10)
    {
      id v10 = [*(id *)(a1 + 48) objectForKey:v14];
      [v10 setThumbnailImage:*(void *)(a1 + 40)];
    }
    else
    {
      if (v8 != 9)
      {
LABEL_7:
        *a4 = 1;
        goto LABEL_8;
      }
      uint64_t v9 = [*(id *)(a1 + 32) context];
      id v10 = [v9 collectionView];

      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", a3, objc_msgSend(*(id *)(a1 + 32), "sectionIndex"));
      id v12 = [v10 cellForItemAtIndexPath:v11];

      id v13 = [v12 layout];
      [v13 setIconImage:*(void *)(a1 + 40)];
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = self->_columnViews;
  uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
      id v13 = -[NSMapTable objectForKey:](self->_columnViews, "objectForKey:", v12, (void)v31);
      if ([v6 isDescendantOfView:v13]) {
        break;
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMapTable *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_24;
      }
    }
    id v14 = [(SKUIStorePageSection *)self pageComponent];
    id v15 = [v14 childComponents];
    uint64_t v16 = [v15 indexOfObjectIdenticalTo:v12];

    uint64_t v17 = [v12 componentType];
    if (v17 == 10)
    {
      v19 = v12;
    }
    else
    {
      if (v17 != 7)
      {
        v19 = v7;
LABEL_23:

        id v7 = v19;
        goto LABEL_24;
      }
      BOOL v18 = [(NSMapTable *)self->_galleryViewControllers objectForKey:v12];
      v19 = [v18 selectedMediaComponent];
    }
    if (!v19) {
      goto LABEL_25;
    }
    uint64_t v20 = [(SKUIStorePageSection *)self context];
    id v13 = [v20 metricsController];

    if ([v13 canRecordEventWithType:*MEMORY[0x1E4FA8888]])
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4FA8240]);
      double v22 = SKUIMetricsMediaEventTypeForPlaybackState(a4);
      [v21 setMediaEventType:v22];

      double v23 = [(SKUIStorePageSection *)self pageComponent];
      double v24 = [v13 locationWithPageComponent:v23];

      uint64_t v25 = [v13 locationWithPosition:v16 type:@"Column" fieldData:0];
      double v26 = (void *)v25;
      if (v24 && v25)
      {
        v35[0] = v25;
        v35[1] = v24;
        double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
        [v21 setLocationWithEventLocations:v27];
      }
      uint64_t v28 = [(NSMapTable *)v19 mediaIdentifier];
      if (v28)
      {
        double v29 = [NSNumber numberWithLongLong:v28];
        [v21 setItemIdentifier:v29];
      }
      double v30 = [(NSMapTable *)v19 mediaURLString];
      [v21 setMediaURL:v30];

      [v13 recordEvent:v21];
    }
    goto LABEL_23;
  }
LABEL_24:

LABEL_25:
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 itemIdentifier];
        [v6 setObject:v12 forKey:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__SKUIRowSection_itemStateCenter_itemStatesChanged___block_invoke;
  v15[3] = &unk_1E6421FF8;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

void __52__SKUIRowSection_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 collectionView];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SKUIRowSection_itemStateCenter_itemStatesChanged___block_invoke_2;
  v6[3] = &unk_1E6425DB0;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _enumerateLockupsWithBlock:v6];
}

void __52__SKUIRowSection_itemStateCenter_itemStatesChanged___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v12 = [v5 cellForItemAtIndexPath:a3];
  id v7 = [v6 item];

  if (v12) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v7, "itemIdentifier"));
    uint64_t v10 = [*(id *)(a1 + 40) objectForKey:v9];
    if (v10)
    {
      uint64_t v11 = [v12 layout];
      [v11 setItemState:v10 animated:1];
    }
  }
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SKUIRowSection_itemStateCenterRestrictionsChanged___block_invoke;
  v6[3] = &unk_1E6421FF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __53__SKUIRowSection_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 collectionView];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SKUIRowSection_itemStateCenterRestrictionsChanged___block_invoke_2;
  v6[3] = &unk_1E6425DB0;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _enumerateLockupsWithBlock:v6];
}

void __53__SKUIRowSection_itemStateCenterRestrictionsChanged___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v10 = [v5 cellForItemAtIndexPath:a3];
  id v7 = [v10 layout];
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v6 item];

  objc_msgSend(v7, "setRestricted:", objc_msgSend(v8, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v9, "parentalControlsRank")));
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v6 = a4;
  if ([v6 count])
  {
    id v7 = [(SKUIStorePageSection *)self pageComponent];
    id v8 = [v7 _updateWithMissingItems:v6];
    if ([v8 count])
    {
      uint64_t v9 = [v7 childComponents];
      id v10 = [(SKUIStorePageSection *)self context];
      uint64_t v11 = [v10 collectionView];

      int64_t v12 = [(SKUIStorePageSection *)self sectionIndex];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__SKUIRowSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
      v15[3] = &unk_1E6425DD8;
      id v16 = v11;
      id v17 = v9;
      long long v18 = self;
      int64_t v19 = v12;
      id v13 = v9;
      id v14 = v11;
      [v8 enumerateIndexesUsingBlock:v15];
    }
  }
}

void __72__SKUIRowSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 56)];
  id v9 = [v4 cellForItemAtIndexPath:v5];

  if (v9)
  {
    id v6 = [*(id *)(a1 + 40) objectAtIndex:a2];
    id v7 = [v6 editorial];

    id v8 = *(void **)(a1 + 48);
    if (v7) {
      [v8 _reloadEditorialLockupCell:v9 forComponent:v6 columnIndex:a2];
    }
    else {
      [v8 _reloadLockupCell:v9 forComponent:v6 columnIndex:a2];
    }
  }
}

- (void)productPageOverlayDidDismiss:(id)a3
{
  id v9 = [(SKUIRowSection *)self _overlaySourceCell];
  id v4 = [v9 layout];
  [v4 setIconImageHidden:0];

  overlaySourceComponent = self->_overlaySourceComponent;
  self->_overlaySourceComponent = 0;

  id v6 = [(SKUIStorePageSection *)self context];
  id v7 = [v6 parentViewController];
  [v7 _pageSectionDidDismissOverlayController:self->_overlayController];

  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
  overlayController = self->_overlayController;
  self->_overlayController = 0;
}

- (double)_cellContentHeightForRowWidth:(double)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v5 = [(SKUIStorePageSection *)self pageComponent];
  id v6 = [v5 childComponents];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__SKUIRowSection__cellContentHeightForRowWidth___block_invoke;
  v9[3] = &unk_1E6425E00;
  *(double *)&v9[6] = a3;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  double v7 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __48__SKUIRowSection__cellContentHeightForRowWidth___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) _heightForComponent:a2 columnIndex:(double)a3 rowWidth:*(double *)(a1 + 48)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(double *)(v6 + 24) >= v5) {
    double v5 = *(double *)(v6 + 24);
  }
  *(double *)(v6 + 24) = v5;
  return result;
}

- (id)_columnViews
{
  columnViews = self->_columnViews;
  if (!columnViews)
  {
    id v4 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E4F28E10]);
    double v5 = self->_columnViews;
    self->_columnViews = v4;

    uint64_t v6 = [(SKUIStorePageSection *)self pageComponent];
    double v7 = [v6 childComponents];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__SKUIRowSection__columnViews__block_invoke;
    v9[3] = &unk_1E6425D38;
    v9[4] = self;
    [v7 enumerateObjectsUsingBlock:v9];

    columnViews = self->_columnViews;
  }

  return columnViews;
}

void __30__SKUIRowSection__columnViews__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 componentType];
  if (v3 == 10)
  {
    double v5 = (void *)[*(id *)(a1 + 32) _newViewWithMediaComponent:v7];
    if (v5)
    {
LABEL_9:
      [*(id *)(*(void *)(a1 + 32) + 96) setObject:v5 forKey:v7];
    }
  }
  else
  {
    if (v3 == 7)
    {
      id v4 = [*(id *)(a1 + 32) _viewControllerForGalleryComponent:v7];
    }
    else
    {
      if (v3 != 2) {
        goto LABEL_10;
      }
      id v4 = [*(id *)(a1 + 32) _viewControllerForCountdownComponent:v7];
    }
    uint64_t v6 = v4;
    double v5 = [v4 view];

    if (v5) {
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (double)_columnWidthForColumnIndex:(int64_t)a3 rowWidth:(double)a4
{
  id v7 = [(SKUIStorePageSection *)self pageComponent];
  id v8 = v7;
  if (self->_isPad || ![v7 shouldAutoFlow])
  {
    uint64_t v10 = [v8 columnWidths];
    uint64_t v11 = [v8 numberOfColumns];
    [(SKUIRowSection *)self _interColumnSpacing];
    double v13 = v12;
    *(float *)&double v12 = (a4 + -30.0 - v12 * (double)(v11 - 1)) / (double)v11;
    double v14 = floorf(*(float *)&v12);
    if (a3 < 1)
    {
      double v16 = 15.0;
    }
    else
    {
      uint64_t v15 = 0;
      double v16 = 15.0;
      do
      {
        if ([v10 count] <= (unint64_t)a3)
        {
          uint64_t v18 = 1;
        }
        else
        {
          id v17 = [v10 objectAtIndex:v15];
          uint64_t v18 = [v17 integerValue];
        }
        double v16 = v13 + v16 + v13 * (double)(v18 - 1) + (double)v18 * v14;
        ++v15;
      }
      while (a3 != v15);
    }
    if ([v10 count] <= (unint64_t)a3)
    {
      uint64_t v20 = 1;
    }
    else
    {
      int64_t v19 = [v10 objectAtIndex:a3];
      uint64_t v20 = [v19 integerValue];
    }
    if (v11 - v20 == a3) {
      double v9 = a4 + -15.0 - v16;
    }
    else {
      double v9 = v13 * (double)(v20 - 1) + (double)v20 * v14;
    }
  }
  else
  {
    double v9 = a4 + -30.0;
  }

  return v9;
}

- (UIEdgeInsets)_edgeInsetsForColumnIndex:(int64_t)a3
{
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  [(SKUIRowSection *)self _interColumnSpacing];
  double v7 = v6;
  uint64_t v8 = [v5 numberOfColumns];
  if (self->_isPad || (v9 = 15.0, double v10 = 15.0, ([v5 shouldAutoFlow] & 1) == 0))
  {
    float v11 = v7 * 0.5;
    double v12 = floorf(v11);
    if (a3) {
      double v10 = v12;
    }
    else {
      double v10 = 15.0;
    }
    if (v8 - 1 == a3) {
      double v9 = 15.0;
    }
    else {
      double v9 = v12;
    }
  }

  double v13 = 15.0;
  double v14 = 15.0;
  double v15 = v10;
  double v16 = v9;
  result.right = v16;
  result.bottom = v14;
  result.left = v15;
  result.top = v13;
  return result;
}

- (id)_editorialLayoutForEditorial:(id)a3 columnIndex:(int64_t)a4
{
  id v6 = a3;
  editorialLayouts = self->_editorialLayouts;
  if (!editorialLayouts)
  {
    uint64_t v8 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    double v9 = self->_editorialLayouts;
    self->_editorialLayouts = v8;

    editorialLayouts = self->_editorialLayouts;
  }
  double v10 = [(NSMapTable *)editorialLayouts objectForKey:v6];
  if (!v10)
  {
    float v11 = [(SKUIStorePageSection *)self context];
    double v12 = [SKUIEditorialLayout alloc];
    double v13 = [(SKUIStorePageSection *)self context];
    double v14 = [v13 textLayoutCache];
    double v10 = [(SKUIEditorialLayout *)v12 initWithEditorial:v6 layoutCache:v14];

    [v11 portraitPageWidth];
    -[SKUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4);
    -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v10, "setLayoutWidth:forOrientation:", 0);
    [v11 landscapePageWidth];
    -[SKUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4);
    -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v10, "setLayoutWidth:forOrientation:", 1);
    [(NSMapTable *)self->_editorialLayouts setObject:v10 forKey:v6];
  }

  return v10;
}

- (id)_editorialLayoutForLockup:(id)a3 columnIndex:(int64_t)a4
{
  id v6 = a3;
  double v7 = [v6 editorial];
  if (v7)
  {
    editorialLayouts = self->_editorialLayouts;
    if (!editorialLayouts)
    {
      double v9 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      double v10 = self->_editorialLayouts;
      self->_editorialLayouts = v9;

      editorialLayouts = self->_editorialLayouts;
    }
    float v11 = [(NSMapTable *)editorialLayouts objectForKey:v7];
    if (!v11)
    {
      double v12 = [(SKUIStorePageSection *)self context];
      double v13 = [SKUIEditorialLayout alloc];
      double v14 = [(SKUIStorePageSection *)self context];
      double v15 = [v14 textLayoutCache];
      float v11 = [(SKUIEditorialLayout *)v13 initWithEditorial:v7 layoutCache:v15];

      long long v19 = 0uLL;
      uint64_t v20 = 0;
      [(SKUIRowSection *)self _lockupStyleForComponent:v6 columnIndex:a4];
      [v12 portraitPageWidth];
      -[SKUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4);
      long long v17 = v19;
      uint64_t v18 = v20;
      +[SKUIEditorialLockupCellLayout editorialWidthForCellWidth:lockupStyle:](SKUIEditorialLockupCellLayout, "editorialWidthForCellWidth:lockupStyle:", &v17);
      -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v11, "setLayoutWidth:forOrientation:", 0);
      [v12 landscapePageWidth];
      -[SKUIRowSection _columnWidthForColumnIndex:rowWidth:](self, "_columnWidthForColumnIndex:rowWidth:", a4);
      long long v17 = v19;
      uint64_t v18 = v20;
      +[SKUIEditorialLockupCellLayout editorialWidthForCellWidth:lockupStyle:](SKUIEditorialLockupCellLayout, "editorialWidthForCellWidth:lockupStyle:", &v17);
      -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v11, "setLayoutWidth:forOrientation:", 1);
      [(NSMapTable *)self->_editorialLayouts setObject:v11 forKey:v7];
    }
  }
  else
  {
    float v11 = 0;
  }

  return v11;
}

- (void)_enumerateLockupsWithBlock:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SKUIStorePageSection *)self sectionIndex];
  id v6 = [(SKUIStorePageSection *)self pageComponent];
  double v7 = [v6 childComponents];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__SKUIRowSection__enumerateLockupsWithBlock___block_invoke;
  v9[3] = &unk_1E6425E28;
  id v10 = v4;
  int64_t v11 = v5;
  id v8 = v4;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __45__SKUIRowSection__enumerateLockupsWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if ([v6 componentType] == 9)
  {
    int64_t v5 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_expandEditorialComponent:(id)a3 columnIndex:(int64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(SKUIStorePageSection *)self context];
  id v8 = [v7 collectionView];

  BOOL v9 = SKUIEditorialLayoutOrientationForView(v8);
  id v10 = [(SKUIRowSection *)self _editorialLayoutForEditorial:v6 columnIndex:a4];

  int64_t v11 = [v10 bodyTextLayoutForOrientation:v9];

  if ([v11 requiresTruncation]
    && ([(NSMutableIndexSet *)self->_expandedEditorialIndexes containsIndex:a4] & 1) == 0)
  {
    expandedEditorialIndexes = self->_expandedEditorialIndexes;
    if (!expandedEditorialIndexes)
    {
      double v13 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
      double v14 = self->_expandedEditorialIndexes;
      self->_expandedEditorialIndexes = v13;

      expandedEditorialIndexes = self->_expandedEditorialIndexes;
    }
    [(NSMutableIndexSet *)expandedEditorialIndexes addIndex:a4];
    self->_landscapeCellContentHeight = 0.0;
    self->_portraitCellContentHeight = 0.0;
    double v15 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", a4, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v17[0] = v15;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v8 reloadItemsAtIndexPaths:v16];
  }
}

- (double)_heightForArtwork:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  id v8 = a3;
  [(SKUIRowSection *)self _columnWidthForColumnIndex:a4 rowWidth:a5];
  double v10 = v9;
  double v11 = (double)[v8 height];
  uint64_t v12 = [v8 width];

  float v13 = v10 / (double)v12 * v11;
  return floorf(v13);
}

- (double)_heightForComponent:(id)a3 columnIndex:(double)a4 rowWidth:(double)a5
{
  id v8 = a3;
  double v9 = 0.0;
  switch([v8 componentType])
  {
    case 2:
      [(SKUIRowSection *)self _heightForCountdownComponent:v8 columnIndex:(uint64_t)a4 rowWidth:a5];
      goto LABEL_8;
    case 5:
      [(SKUIRowSection *)self _heightForEditorialComponent:v8 columnIndex:(uint64_t)a4 rowWidth:a5];
      goto LABEL_8;
    case 7:
      [(SKUIRowSection *)self _heightForGalleryComponent:v8 columnIndex:(uint64_t)a4 rowWidth:a5];
      goto LABEL_8;
    case 9:
      [(SKUIRowSection *)self _heightForLockupComponent:v8 columnIndex:(uint64_t)a4 rowWidth:a5];
      goto LABEL_8;
    case 10:
      [(SKUIRowSection *)self _heightForMediaComponent:v8 columnIndex:(uint64_t)a4 rowWidth:a5];
      goto LABEL_8;
    case 14:
      [v8 height];
LABEL_8:
      double v9 = v10;
      break;
    default:
      break;
  }

  return v9;
}

- (double)_heightForCountdownComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  id v8 = [a3 countdown];
  double v9 = [v8 artworkProvider];
  double v10 = [v9 largestArtwork];

  if (v10)
  {
    [(SKUIRowSection *)self _heightForArtwork:v10 columnIndex:a4 rowWidth:a5];
    double v12 = v11;
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (double)_heightForEditorialComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  double v7 = [(SKUIRowSection *)self _editorialLayoutForEditorial:a3 columnIndex:a5];
  id v8 = [(SKUIStorePageSection *)self context];
  double v9 = [v8 collectionView];
  BOOL v10 = SKUIEditorialLayoutOrientationForView(v9);

  objc_msgSend(v7, "layoutHeightForOrientation:expanded:", v10, -[NSMutableIndexSet containsIndex:](self->_expandedEditorialIndexes, "containsIndex:", a4));
  double v12 = v11 + 17.0;

  return v12;
}

- (double)_heightForGalleryComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = [a3 childComponents];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SKUIRowSection *)self _heightForMediaComponent:*(void *)(*((void *)&v16 + 1) + 8 * i) columnIndex:a4 rowWidth:a5];
        if (v12 < v14) {
          double v12 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (double)_heightForLockupComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  id v7 = a3;
  id v8 = [(SKUIStorePageSection *)self context];
  uint64_t v9 = [v7 editorial];
  long long v24 = 0uLL;
  uint64_t v25 = 0;
  [(SKUIRowSection *)self _lockupStyleForComponent:v7 columnIndex:a4];
  uint64_t v10 = [v7 item];
  uint64_t v11 = [v8 parentViewController];
  double v12 = [v11 clientContext];
  long long v22 = v24;
  uint64_t v23 = v25;
  +[SKUILockupItemCellLayout heightForLockupStyle:&v22 item:v10 editorial:v9 clientContext:v12];
  double v14 = v13;

  if (v9)
  {
    double v15 = [(SKUIRowSection *)self _editorialLayoutForLockup:v7 columnIndex:a4];
    long long v16 = [v8 collectionView];
    BOOL v17 = SKUIEditorialLayoutOrientationForView(v16);

    [v15 layoutHeightForOrientation:v17 expanded:1];
    double v19 = v18 + 17.0;
    if (SKUILockupLayoutStyleIsHorizontal(*((uint64_t *)&v24 + 1)))
    {
      double v14 = v14 + v19;
    }
    else
    {
      double v20 = v19 + 26.0;
      if ((v25 & 4) == 0) {
        double v20 = v19;
      }
      if (v20 >= v14) {
        double v14 = v20;
      }
    }
  }
  return v14;
}

- (double)_heightForMediaComponent:(id)a3 columnIndex:(int64_t)a4 rowWidth:(double)a5
{
  id v8 = [a3 bestThumbnailArtwork];
  if (v8)
  {
    [(SKUIRowSection *)self _heightForArtwork:v8 columnIndex:a4 rowWidth:a5];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (id)_imageConsumerWithItem:(id)a3 lockupSize:(int64_t)a4
{
  unint64_t v5 = [a3 itemKind];
  if (v5 <= 0x11 && ((1 << v5) & 0x21020) != 0)
  {
    id v6 = +[SKUIStyledImageDataConsumer lockupIconConsumerWithSize:](SKUIStyledImageDataConsumer, "lockupIconConsumerWithSize:", a4, v5);
  }
  else
  {
    id v6 = +[SKUIProductImageDataConsumer lockupConsumerWithSize:a4 itemKind:v5];
  }

  return v6;
}

- (double)_interColumnSpacing
{
  if (!self->_isPad) {
    return 20.0;
  }
  objc_super v2 = [(SKUIStorePageSection *)self context];
  uint64_t v3 = [v2 collectionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double result = 28.0;
  if (v5 > v7) {
    return 30.0;
  }
  return result;
}

- (void)_loadImagesForGalleryComponent:(id)a3 columnIndex:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(SKUIRowSection *)self _viewControllerForGalleryComponent:v6];
  if (v7)
  {
    id v8 = [(SKUIStorePageSection *)self context];
    [v8 landscapePageWidth];
    double v10 = v9;
    [v8 portraitPageWidth];
    if (v10 >= v11) {
      double v11 = v10;
    }
    [(SKUIRowSection *)self _columnWidthForColumnIndex:a4 rowWidth:v11];
    uint64_t v13 = v12;
    double v14 = [v6 childComponents];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__SKUIRowSection__loadImagesForGalleryComponent_columnIndex___block_invoke;
    v15[3] = &unk_1E6425E50;
    id v16 = v7;
    uint64_t v17 = v13;
    [v14 enumerateObjectsUsingBlock:v15];
  }
}

uint64_t __61__SKUIRowSection__loadImagesForGalleryComponent_columnIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) loadArtworkForChildComponent:a2 reason:a3 == 0 constraintWidth:*(double *)(a1 + 40)];
}

- (id)_lockupImageForComponent:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self context];
  id v6 = [v5 resourceLoader];

  double v7 = [(NSMapTable *)self->_componentArtworkRequestIDs objectForKey:v4];
  id v8 = v7;
  if (v7)
  {
    double v9 = objc_msgSend(v6, "cachedResourceForRequestIdentifier:", objc_msgSend(v7, "unsignedIntegerValue"));
    double v10 = v9;
    if (v9)
    {
      id v11 = v9;
LABEL_6:
      uint64_t v12 = v11;
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v8, "unsignedIntegerValue")))
    {
      id v11 = [(SKUIRowSection *)self _lockupPlaceholderForComponent:v4];
      goto LABEL_6;
    }
  }
  double v10 = [v4 item];
  if (v4) {
    [v4 lockupStyle];
  }
  double v13 = SKUILockupImageSizeForLockupSize(0, [v10 itemKind]);
  double v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v14 scale];
  uint64_t v16 = (uint64_t)(v15 * (double)(uint64_t)v13);

  uint64_t v17 = [v10 artworkURLForSize:v16];
  if (v17)
  {
    double v18 = objc_alloc_init(SKUIArtworkRequest);
    double v19 = [(SKUIRowSection *)self _imageConsumerWithItem:v10 lockupSize:0];
    [(SKUIArtworkRequest *)v18 setDataConsumer:v19];

    [(SKUIArtworkRequest *)v18 setDelegate:self];
    [(SKUIArtworkRequest *)v18 setURL:v17];
    componentArtworkRequestIDs = self->_componentArtworkRequestIDs;
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v18, "requestIdentifier"));
    [(NSMapTable *)componentArtworkRequestIDs setObject:v21 forKey:v4];

    [v6 loadResourceWithRequest:v18 reason:1];
  }
  uint64_t v12 = [(SKUIRowSection *)self _lockupPlaceholderForComponent:v4];

LABEL_12:

  return v12;
}

- (id)_lockupPlaceholderForComponent:(id)a3
{
  id v4 = a3;
  double v5 = [v4 item];
  if (v4)
  {
    [v4 lockupStyle];
    uint64_t v6 = v11;
  }
  else
  {
    uint64_t v6 = 0;
  }
  double v7 = [(SKUIRowSection *)self _imageConsumerWithItem:v5 lockupSize:v6];

  id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
  double v9 = [v7 imageForColor:v8];

  return v9;
}

- (SKUILockupStyle)_lockupStyleForComponent:(SEL)a3 columnIndex:(id)a4
{
  id v8 = a4;
  retstr->int64_t layoutStyle = 0;
  retstr->visibleFields = 0;
  retstr->artworkSize = 0;
  id v16 = v8;
  if (v8)
  {
    [v8 lockupStyle];
    id v8 = v16;
  }
  if (self->_isPad)
  {
    if ((unint64_t)(retstr->artworkSize - 3) >= 2)
    {
      if (retstr->artworkSize != 5) {
        goto LABEL_13;
      }
    }
    else
    {
      double v9 = [(SKUIStorePageSection *)self pageComponent];
      if ([v9 numberOfColumns] < 2)
      {

        goto LABEL_12;
      }
      double v10 = [v9 columnWidths];
      uint64_t v11 = [v10 objectAtIndex:a5];

      uint64_t v12 = [v11 integerValue];
      id v8 = v16;
      if (v12 != 1) {
        goto LABEL_13;
      }
    }
    double v13 = [v8 editorial];

    if (v13)
    {
      retstr->int64_t layoutStyle = 0;
LABEL_12:
      id v8 = v16;
      goto LABEL_13;
    }
    int64_t layoutStyle = retstr->layoutStyle;
    if (layoutStyle == 1)
    {
      retstr->int64_t layoutStyle = 3;
      goto LABEL_12;
    }
    id v8 = v16;
    if (!layoutStyle) {
      retstr->int64_t layoutStyle = 2;
    }
  }
LABEL_13:

  return result;
}

- (id)_missingItemLoader
{
  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    id v4 = [SKUIMissingItemLoader alloc];
    double v5 = [(SKUIStorePageSection *)self context];
    uint64_t v6 = [v5 resourceLoader];
    double v7 = [(SKUIMissingItemLoader *)v4 initWithResourceLoader:v6];
    id v8 = self->_missingItemLoader;
    self->_missingItemLoader = v7;

    [(SKUIMissingItemLoader *)self->_missingItemLoader setDelegate:self];
    missingItemLoader = self->_missingItemLoader;
  }

  return missingItemLoader;
}

- (id)_newSizeToFitArtworkRequestWithArtwork:(id)a3 columnIndex:(int64_t)a4
{
  id v6 = a3;
  double v7 = objc_alloc_init(SKUIArtworkRequest);
  [(SKUIArtworkRequest *)v7 setDelegate:self];
  id v8 = [v6 URL];

  [(SKUIArtworkRequest *)v7 setURL:v8];
  double v9 = [(SKUIStorePageSection *)self context];
  [v9 landscapePageWidth];
  double v11 = v10;
  [v9 portraitPageWidth];
  if (v11 >= v12) {
    double v12 = v11;
  }
  [(SKUIRowSection *)self _columnWidthForColumnIndex:a4 rowWidth:v12];
  double v13 = +[SKUISizeToFitImageDataConsumer consumerWithConstraintSize:](SKUISizeToFitImageDataConsumer, "consumerWithConstraintSize:");
  [(SKUIArtworkRequest *)v7 setDataConsumer:v13];

  return v7;
}

- (id)_newViewWithMediaComponent:(id)a3
{
  id v4 = objc_alloc_init(SKUIEmbeddedMediaView);
  [(SKUIEmbeddedMediaView *)v4 setDelegate:self];
  return v4;
}

- (id)_overlaySourceCell
{
  if (self->_overlaySourceComponent)
  {
    uint64_t v3 = [(SKUIStorePageSection *)self context];
    id v4 = [v3 collectionView];

    double v5 = [(SKUIStorePageSection *)self pageComponent];
    id v6 = [v5 childComponents];
    uint64_t v7 = [v6 indexOfObjectIdenticalTo:self->_overlaySourceComponent];

    id v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v7, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    double v9 = [v4 cellForItemAtIndexPath:v8];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)_popSourceViewForOverlayController:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_overlaySourceComponent && [v4 numberOfVisibleOverlays] <= 1)
  {
    id v6 = [(SKUIRowSection *)self _overlaySourceCell];
    uint64_t v7 = [v6 layout];
    id v8 = [v7 iconImageView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    id v17 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v18 = [v7 iconImage];
    double v19 = (void *)[v17 initWithImage:v18];

    double v20 = [MEMORY[0x1E4FB1618] clearColor];
    [v19 setBackgroundColor:v20];

    uint64_t v21 = [v8 superview];
    objc_msgSend(v21, "convertRect:toView:", 0, v10, v12, v14, v16);
    objc_msgSend(v19, "setFrame:");

    [v7 setIconImageHidden:1];
  }
  else
  {
    double v19 = 0;
  }

  return v19;
}

- (void)_reloadEditorialCell:(id)a3 forComponent:(id)a4 columnIndex:(int64_t)a5
{
  id v20 = a3;
  id v8 = a4;
  double v9 = [(SKUIRowSection *)self _editorialLayoutForEditorial:v8 columnIndex:a5];
  double v10 = [(SKUIStorePageSection *)self context];
  double v11 = [v10 collectionView];
  BOOL v12 = SKUIEditorialLayoutOrientationForView(v11);

  if ([(NSMutableIndexSet *)self->_expandedEditorialIndexes containsIndex:a5]) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = [v8 maximumBodyLines];
  }
  double v14 = [v20 layout];
  [v14 applyEditorialLayout:v9 withOrientation:v12 expanded:v13 == 0];
  [(SKUIRowSection *)self _edgeInsetsForColumnIndex:a5];
  objc_msgSend(v14, "setContentInset:");
  double v15 = [(SKUIStorePageSection *)self context];
  double v16 = [v15 parentViewController];
  id v17 = [v16 clientContext];

  double v18 = [v14 textBoxView];
  if (v17) {
    [v17 localizedStringForKey:@"MORE_BUTTON"];
  }
  else {
  double v19 = +[SKUIClientContext localizedStringForKey:@"MORE_BUTTON" inBundles:0];
  }
  [v18 setMoreButtonTitle:v19];

  [v18 setNumberOfVisibleLines:v13];
}

- (void)_reloadEditorialLockupCell:(id)a3 forComponent:(id)a4 columnIndex:(int64_t)a5
{
  id v8 = (SKUILockupComponent *)a4;
  id v9 = a3;
  double v10 = [(SKUIStorePageSection *)self context];
  double v11 = [v9 layout];
  [v11 setClientContext:self->_clientContext];
  [(SKUIRowSection *)self _edgeInsetsForColumnIndex:a5];
  objc_msgSend(v11, "setContentInsets:");
  unint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  [(SKUIRowSection *)self _lockupStyleForComponent:v8 columnIndex:a5];
  [v11 setLayoutStyle:v24];
  [v11 setVisibleFields:v25];
  BOOL v12 = [(SKUILockupComponent *)v8 item];
  [v9 configureForItem:v12 clientContext:self->_clientContext];
  [v9 setSeparatorStyle:0];

  uint64_t v13 = [(SKUIRowSection *)self _lockupImageForComponent:v8];
  double v14 = [v11 lockupCellLayout];
  [v14 setClientContext:self->_clientContext];
  [v14 setIconImage:v13];
  [v14 setIconImageHidden:self->_overlaySourceComponent == v8];
  objc_msgSend(v14, "setImageBoundingSize:", SKUILockupImageSizeForLockupSize(v23, objc_msgSend(v12, "itemKind")));
  [v14 setLockupSize:v23];
  double v15 = [(SKUIRowSection *)self _editorialLayoutForLockup:v8 columnIndex:a5];

  double v16 = [(SKUIStorePageSection *)self context];
  id v17 = [v16 collectionView];
  BOOL v18 = SKUIEditorialLayoutOrientationForView(v17);

  [v11 applyEditorialLayout:v15 withOrientation:v18];
  double v19 = +[SKUIItemStateCenter defaultCenter];
  id v20 = objc_msgSend(v19, "stateForItemWithIdentifier:", objc_msgSend(v12, "itemIdentifier"));
  uint64_t v21 = [v10 colorScheme];
  [v11 setColoringWithColorScheme:v21];

  long long v22 = [v10 itemOfferButtonAppearance];
  [v11 setItemOfferButtonAppearance:v22];

  [v11 setItemState:v20];
  objc_msgSend(v11, "setRestricted:", objc_msgSend(v19, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v12, "parentalControlsRank")));
}

- (void)_reloadLockupCell:(id)a3 forComponent:(id)a4 columnIndex:(int64_t)a5
{
  id v8 = (SKUILockupComponent *)a4;
  id v9 = a3;
  double v10 = [(SKUIStorePageSection *)self context];
  double v11 = [v9 layout];
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  [(SKUIRowSection *)self _lockupStyleForComponent:v8 columnIndex:a5];
  [v11 setClientContext:self->_clientContext];
  [(SKUIRowSection *)self _edgeInsetsForColumnIndex:a5];
  objc_msgSend(v11, "setContentInsets:");
  BOOL v12 = [v10 itemOfferButtonAppearance];
  [v11 setItemOfferButtonAppearance:v12];

  [v11 setLayoutStyle:v20];
  [v11 setLockupSize:v19];
  [v11 setVerticalAlignment:0];
  [v11 setVisibleFields:v21];
  uint64_t v13 = [(SKUILockupComponent *)v8 item];
  [v9 configureForItem:v13 clientContext:self->_clientContext];
  [v9 setSeparatorStyle:0];

  objc_msgSend(v11, "setImageBoundingSize:", SKUILockupImageSizeForLockupSize(v19, objc_msgSend(v13, "itemKind")));
  double v14 = [(SKUIRowSection *)self _lockupImageForComponent:v8];
  [v11 setIconImage:v14];
  BOOL v15 = self->_overlaySourceComponent == v8;

  [v11 setIconImageHidden:v15];
  double v16 = +[SKUIItemStateCenter defaultCenter];
  id v17 = objc_msgSend(v16, "stateForItemWithIdentifier:", objc_msgSend(v13, "itemIdentifier"));
  BOOL v18 = [v10 colorScheme];
  [v11 setColoringWithColorScheme:v18];

  [v11 setItemState:v17];
  objc_msgSend(v11, "setRestricted:", objc_msgSend(v16, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v13, "parentalControlsRank")));
}

- (void)_reloadView:(id)a3 forMediaComponent:(id)a4 columnIndex:(int64_t)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = [(SKUIStorePageSection *)self context];
  double v10 = [v9 resourceLoader];

  double v11 = [(NSMapTable *)self->_componentArtworkRequestIDs objectForKey:v8];
  BOOL v12 = v11;
  if (!v11)
  {
    uint64_t v13 = [v8 bestThumbnailArtwork];
    if (!v13) {
      goto LABEL_9;
    }
    id v14 = [(SKUIRowSection *)self _newSizeToFitArtworkRequestWithArtwork:v13 columnIndex:a5];
    componentArtworkRequestIDs = self->_componentArtworkRequestIDs;
    unint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "requestIdentifier"));
    [(NSMapTable *)componentArtworkRequestIDs setObject:v19 forKey:v8];

    [v10 loadResourceWithRequest:v14 reason:1];
    goto LABEL_8;
  }
  uint64_t v13 = objc_msgSend(v10, "cachedResourceForRequestIdentifier:", objc_msgSend(v11, "unsignedIntegerValue"));
  [v22 setThumbnailImage:v13];
  if (!v13
    && (objc_msgSend(v10, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v12, "unsignedIntegerValue")) & 1) == 0)
  {
    id v14 = [v8 bestThumbnailArtwork];
    if (v14)
    {
      id v15 = [(SKUIRowSection *)self _newSizeToFitArtworkRequestWithArtwork:v14 columnIndex:a5];
      double v16 = self->_componentArtworkRequestIDs;
      id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "requestIdentifier"));
      [(NSMapTable *)v16 setObject:v17 forKey:v8];

      [v10 loadResourceWithRequest:v15 reason:1];
    }
LABEL_8:
  }
LABEL_9:

  uint64_t v20 = [v8 accessibilityLabel];
  [v22 setAccessibilityLabel:v20];

  objc_msgSend(v22, "setMediaType:", objc_msgSend(v8, "mediaType"));
  uint64_t v21 = [v8 mediaURLString];
  [v22 setMediaURLString:v21];
}

- (void)_selectGalleryComponent:(id)a3 columnIndex:(int64_t)a4
{
  id v10 = [(NSMapTable *)self->_galleryViewControllers objectForKey:a3];
  id v6 = [v10 selectedMediaComponent];
  uint64_t v7 = [(SKUIStorePageSection *)self clickEventWithMedia:v6 elementName:@"Column" index:a4];
  if (v7)
  {
    id v8 = [(SKUIStorePageSection *)self context];
    id v9 = [v8 metricsController];
    [v9 recordEvent:v7];
  }
  [v10 performActionForSelectedComponentAnimated:1];
}

- (void)_selectLockupComponent:(id)a3 columnIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 item];
  id v8 = [(SKUIRowSection *)self clickEventWithItem:v7 elementName:@"Column" index:a4];
  if (v8)
  {
    id v9 = [(SKUIStorePageSection *)self context];
    id v10 = [v9 metricsController];
    [v10 recordEvent:v8];
  }
  double v11 = [(SKUIStorePageSection *)self context];
  BOOL v12 = [v11 parentViewController];

  uint64_t v13 = [v12 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v13 sectionsViewController:v12 showProductPageForItem:v7] & 1) == 0)
  {
    if (SKUIItemKindIsSoftwareKind([v7 itemKind])
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          id v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 userInterfaceIdiom],
          v14,
          v15))
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __53__SKUIRowSection__selectLockupComponent_columnIndex___block_invoke;
      v16[3] = &unk_1E6425E78;
      v16[4] = self;
      id v17 = v12;
      id v18 = v6;
      id v19 = v7;
      [(SKUIStorePageSection *)self sendXEventWithItem:v19 completionBlock:v16];
    }
    else
    {
      [(SKUIStorePageSection *)self showProductViewControllerWithItem:v7];
    }
  }
}

uint64_t __53__SKUIRowSection__selectLockupComponent_columnIndex___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 32);
    if (!*(void *)(v4 + 168))
    {
      double v5 = [[SKUIProductPageOverlayController alloc] initWithParentViewController:*(void *)(result + 40)];
      uint64_t v6 = *(void *)(v3 + 32);
      uint64_t v7 = *(void **)(v6 + 168);
      *(void *)(v6 + 168) = v5;

      id v8 = *(void **)(*(void *)(v3 + 32) + 168);
      id v9 = [*(id *)(v3 + 40) clientContext];
      [v8 setClientContext:v9];

      objc_msgSend(*(id *)(*(void *)(v3 + 32) + 168), "setDelegate:");
      uint64_t v4 = *(void *)(v3 + 32);
    }
    objc_storeStrong((id *)(v4 + 176), *(id *)(v3 + 48));
    [*(id *)(*(void *)(v3 + 32) + 168) showWithInitialItem:*(void *)(v3 + 56)];
    id v10 = *(void **)(v3 + 40);
    uint64_t v11 = *(void *)(*(void *)(v3 + 32) + 168);
    return [v10 _setActiveProductPageOverlayController:v11];
  }
  return result;
}

- (void)_selectMediaComponent:(id)a3 columnIndex:(int64_t)a4
{
  id v9 = a3;
  double v5 = -[SKUIStorePageSection clickEventWithMedia:elementName:index:](self, "clickEventWithMedia:elementName:index:");
  if (v5)
  {
    uint64_t v6 = [(SKUIStorePageSection *)self context];
    uint64_t v7 = [v6 metricsController];
    [v7 recordEvent:v5];
  }
  if ([v9 mediaType])
  {
    id v8 = [(NSMapTable *)self->_columnViews objectForKey:v9];
    [v8 beginPlaybackAnimated:1];
  }
  else
  {
    id v8 = [v9 link];
    [(SKUIStorePageSection *)self showPageWithLink:v8];
  }
}

- (void)_setPositionForClickEvent:(id)a3 elementIndex:(int64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = [(SKUIStorePageSection *)self context];
    id v10 = [v7 collectionView];

    id v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", a4, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    id v9 = [v10 cellForItemAtIndexPath:v8];

    SKUIMetricsSetClickEventPositionWithView(v6, v9);
  }
}

- (id)_viewControllerForCountdownComponent:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMapTable *)self->_countdownViewControllers objectForKey:v4];
  if (!v5)
  {
    id v6 = [(SKUIStorePageSection *)self context];
    uint64_t v7 = [SKUICountdownViewController alloc];
    id v8 = [v6 resourceLoader];
    double v5 = [(SKUICountdownViewController *)v7 initWithCountdownComponent:v4 artworkLoader:v8];

    [(SKUICountdownViewController *)v5 setClientContext:self->_clientContext];
    id v9 = [(SKUIStorePageSection *)self pageComponent];
    id v10 = [v9 childComponents];
    uint64_t v11 = [v10 indexOfObjectIdenticalTo:v4];

    BOOL v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v11, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    uint64_t v13 = [(SKUICountdownViewController *)v5 view];
    id v14 = [(SKUIRowSection *)self backgroundColorForIndexPath:v12];
    [v13 setBackgroundColor:v14];

    countdownViewControllers = self->_countdownViewControllers;
    if (!countdownViewControllers)
    {
      double v16 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      id v17 = self->_countdownViewControllers;
      self->_countdownViewControllers = v16;

      countdownViewControllers = self->_countdownViewControllers;
    }
    [(NSMapTable *)countdownViewControllers setObject:v5 forKey:v4];
    id v18 = [v6 parentViewController];
    [v18 addChildViewController:v5];
  }

  return v5;
}

- (id)_viewControllerForGalleryComponent:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMapTable *)self->_galleryViewControllers objectForKey:v4];
  if (!v5)
  {
    id v6 = [(SKUIStorePageSection *)self context];
    uint64_t v7 = [SKUIGalleryViewController alloc];
    id v8 = [v6 resourceLoader];
    double v5 = [(SKUIGalleryViewController *)v7 initWithGalleryComponent:v4 artworkLoader:v8];

    [(SKUIGalleryViewController *)v5 setEmbeddedMediaDelegate:self];
    id v9 = [(SKUIStorePageSection *)self pageComponent];
    id v10 = [v9 childComponents];
    uint64_t v11 = [v10 indexOfObjectIdenticalTo:v4];

    BOOL v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v11, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    uint64_t v13 = [(SKUIRowSection *)self backgroundColorForIndexPath:v12];
    [(SKUIGalleryViewController *)v5 setBackgroundColor:v13];

    galleryViewControllers = self->_galleryViewControllers;
    if (!galleryViewControllers)
    {
      uint64_t v15 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      double v16 = self->_galleryViewControllers;
      self->_galleryViewControllers = v15;

      galleryViewControllers = self->_galleryViewControllers;
    }
    [(NSMapTable *)galleryViewControllers setObject:v5 forKey:v4];
    id v17 = [v6 parentViewController];
    [v17 addChildViewController:v5];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaySourceComponent, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_countdownViewControllers, 0);
  objc_storeStrong((id *)&self->_galleryViewControllers, 0);
  objc_storeStrong((id *)&self->_expandedEditorialIndexes, 0);
  objc_storeStrong((id *)&self->_editorialLayouts, 0);
  objc_storeStrong((id *)&self->_componentArtworkRequestIDs, 0);
  objc_storeStrong((id *)&self->_columnViews, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRowSection initWithPageComponent:]";
}

@end