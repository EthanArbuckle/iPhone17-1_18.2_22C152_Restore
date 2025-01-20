@interface SKUIGridPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUIGridPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)_contentInsetForMediaIndex:(int64_t)a3;
- (UIEdgeInsets)_contentInsetForVideoLockupIndex:(int64_t)a3;
- (double)_heightForEditorialAtIndexPath:(id)a3;
- (double)_heightForEditorialLockup:(id)a3;
- (double)_heightForEditorialLockupAtIndexPath:(id)a3;
- (double)_heightForLockupAtIndexPath:(id)a3 gridType:(int64_t)a4;
- (double)_heightForMedia:(id)a3 width:(double)a4;
- (double)_heightForMediaAtIndexPath:(id)a3;
- (double)_mediaWidthForMediaIndex:(int64_t)a3 gridWidth:(double)a4;
- (id)_artworkContextForLockupSize:(int64_t)a3;
- (id)_cellImageForItem:(id)a3 lockupSize:(int64_t)a4;
- (id)_editorialCellWithEditorials:(id)a3 indexPath:(id)a4;
- (id)_editorialLayoutForEditorial:(id)a3;
- (id)_editorialLayoutForLockup:(id)a3;
- (id)_editorialLockupCellWithLockups:(id)a3 indexPath:(id)a4;
- (id)_itemCellWithLockups:(id)a3 indexPath:(id)a4;
- (id)_itemForIndex:(int64_t)a3;
- (id)_mediaCellWithMedia:(id)a3 indexPath:(id)a4;
- (id)_missingItemLoader;
- (id)_newSizeToFitArtworkRequestWithArtwork:(id)a3 mediaIndex:(int64_t)a4;
- (id)_popSourceViewForOverlayController:(id)a3;
- (id)_videoThumbnailImageForVideo:(id)a3 thumbnailSize:(CGSize)a4;
- (id)cellForIndexPath:(id)a3;
- (id)clickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5;
- (id)itemOfferClickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5;
- (int64_t)_numberOfLandscapeColumnsWithGridType:(int64_t)a3;
- (int64_t)_numberOfPortraitColumnsWithGridType:(int64_t)a3;
- (int64_t)numberOfCells;
- (void)_enumerateItemsFromStartIndex:(int64_t)a3 withBlock:(id)a4;
- (void)_enumerateVisibleIndexPathsWithBlock:(id)a3;
- (void)_enumerateVisibleItemsWithBlock:(id)a3;
- (void)_loadImageForItem:(id)a3 lockupSize:(int64_t)a4 loader:(id)a5 reason:(int64_t)a6;
- (void)_loadImageForVideo:(id)a3 thumbnailSize:(CGSize)a4 loader:(id)a5 reason:(int64_t)a6;
- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4;
- (void)_reloadEditorialLockupCell:(id)a3 withLockup:(id)a4 index:(int64_t)a5;
- (void)_reloadItemCell:(id)a3 withLockup:(id)a4 index:(int64_t)a5;
- (void)_selectItem:(id)a3 withIndex:(int64_t)a4;
- (void)_setPositionForClickEvent:(id)a3 withElementIndex:(int64_t)a4;
- (void)_showProductPageWithItem:(id)a3 index:(int64_t)a4 animated:(BOOL)a5;
- (void)_updateVisibileEditorialWithEditorialOrientation:(int64_t)a3;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidConfirmItemOfferAtIndexPath:(id)a3;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewDidTapVideoAtIndexPath:(id)a3;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)dealloc;
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

@implementation SKUIGridPageSection

- (SKUIGridPageSection)initWithPageComponent:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGridPageSection initWithPageComponent:]();
  }
  v34.receiver = self;
  v34.super_class = (Class)SKUIGridPageSection;
  v5 = [(SKUIStorePageSection *)&v34 initWithPageComponent:v4];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:0 capacity:0];
    v7 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v6;

    v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    v5[129] = [v8 userInterfaceIdiom] == 1;

    *((void *)v5 + 23) = 0x7FFFFFFFFFFFFFFFLL;
    v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 scale];
    *((void *)v5 + 24) = (uint64_t)v10;

    unint64_t v11 = [v4 gridType];
    if (v11 <= 5)
    {
      unint64_t v12 = v11;
      if (((1 << v11) & 0x23) != 0)
      {
        v13 = [v4 children];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v31 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              if (v18)
              {
                [*(id *)(*((void *)&v30 + 1) + 8 * i) lockupStyle];
                unint64_t v19 = v29;
              }
              else
              {
                unint64_t v19 = 0;
                unint64_t v29 = 0;
              }
              v20 = objc_msgSend(v18, "item", v27);
              double v21 = SKUILockupImageSizeForLockupSize(v19, [v20 itemKind]);
              long long v27 = v22;
              float64_t v28 = v21;

              v23.f64[0] = v28;
              *(void *)&v23.f64[1] = v27;
              *(int8x16_t *)(v5 + 136) = vbslq_s8((int8x16_t)vcgtq_f64(*(float64x2_t *)(v5 + 136), v23), *(int8x16_t *)(v5 + 136), (int8x16_t)v23);
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
          }
          while (v15);
        }
        v5[104] = 1;

        if (v12 == 5)
        {
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v25 = (void *)*((void *)v5 + 27);
          *((void *)v5 + 27) = v24;
        }
      }
    }
  }

  return (SKUIGridPageSection *)v5;
}

- (void)dealloc
{
  v3 = +[SKUIItemStateCenter defaultCenter];
  [v3 removeObserver:self];

  [(SKUIMissingItemLoader *)self->_missingItemLoader setDelegate:0];
  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)SKUIGridPageSection;
  [(SKUIStorePageSection *)&v4 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (self->_containsLockups)
  {
    unint64_t v7 = [v19 item];
    v8 = [(SKUIStorePageSection *)self pageComponent];
    v9 = [v8 children];

    if (v7 < [v9 count])
    {
      double v10 = [v9 objectAtIndex:v7];
      unint64_t v11 = [v10 item];
      objc_msgSend(v6, "addItemIdentifier:", objc_msgSend(v11, "itemIdentifier"));
    }
  }
  unint64_t v12 = [(SKUIStorePageSection *)self pageComponent];
  v13 = [v12 viewElement];
  [v6 addItemViewElement:v13];

  uint64_t v14 = [v19 item];
  uint64_t v15 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v16 = [v15 children];

  v17 = [v16 objectAtIndex:v14];
  v18 = [v17 viewElement];
  [v6 addItemViewElement:v18];
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self pageComponent];
  id v6 = 0;
  switch([v5 gridType])
  {
    case 0:
    case 5:
      unint64_t v7 = [v5 children];
      uint64_t v8 = [(SKUIGridPageSection *)self _itemCellWithLockups:v7 indexPath:v4];
      goto LABEL_6;
    case 1:
      unint64_t v7 = [v5 children];
      uint64_t v8 = [(SKUIGridPageSection *)self _editorialLockupCellWithLockups:v7 indexPath:v4];
      goto LABEL_6;
    case 3:
      unint64_t v7 = [v5 children];
      uint64_t v8 = [(SKUIGridPageSection *)self _editorialCellWithEditorials:v7 indexPath:v4];
      goto LABEL_6;
    case 4:
      unint64_t v7 = [v5 children];
      uint64_t v8 = [(SKUIGridPageSection *)self _mediaCellWithMedia:v7 indexPath:v4];
LABEL_6:
      id v6 = (void *)v8;

      break;
    default:
      break;
  }

  return v6;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = a3;
  if (self->_isPad) {
    double v5 = 95.0;
  }
  else {
    double v5 = 84.0;
  }
  id v6 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v7 = [v6 gridType];

  switch(v7)
  {
    case 0:
    case 5:
      [(SKUIGridPageSection *)self _heightForLockupAtIndexPath:v4 gridType:v7];
      goto LABEL_9;
    case 1:
      [(SKUIGridPageSection *)self _heightForEditorialLockupAtIndexPath:v4];
      goto LABEL_9;
    case 3:
      [(SKUIGridPageSection *)self _heightForEditorialAtIndexPath:v4];
      goto LABEL_9;
    case 4:
      [(SKUIGridPageSection *)self _heightForMediaAtIndexPath:v4];
LABEL_9:
      double v5 = v8;
      break;
    default:
      break;
  }
  v9 = [(SKUIStorePageSection *)self context];
  double v10 = [v9 collectionView];
  [v10 bounds];
  double v12 = v11;

  int64_t numberOfColumns = self->_numberOfColumns;
  if (numberOfColumns != 1)
  {
    if (v7 == 5)
    {
      -[SKUIGridPageSection _contentInsetForVideoLockupIndex:](self, "_contentInsetForVideoLockupIndex:", [v4 item]);
      double v12 = v15 + v14 + 221.0;
    }
    else
    {
      float v16 = v12 / (double)numberOfColumns;
      double v12 = floorf(v16);
    }
  }

  double v17 = v12;
  double v18 = v5;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)clickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIGridPageSection;
  uint64_t v7 = -[SKUIStorePageSection clickEventWithItem:elementName:index:](&v9, sel_clickEventWithItem_elementName_index_, a3, a4);
  [(SKUIGridPageSection *)self _setPositionForClickEvent:v7 withElementIndex:a5];

  return v7;
}

- (void)collectionViewDidConfirmItemOfferAtIndexPath:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 item];
  double v5 = [(SKUIGridPageSection *)self _itemForIndex:v4];
  if (v5)
  {
    id v6 = [(SKUIStorePageSection *)self context];
    uint64_t v7 = [(SKUIGridPageSection *)self itemOfferClickEventWithItem:v5 elementName:*MEMORY[0x1E4FA88E0] index:v4];
    if (v7)
    {
      double v8 = [v6 metricsController];
      [v8 recordEvent:v7];
    }
    objc_super v9 = [v6 collectionView];
    double v10 = [v9 cellForItemAtIndexPath:v13];

    double v11 = [(SKUIStorePageSection *)self performItemOfferActionForItem:v5];
    double v12 = [v10 layout];
    [v12 setItemState:v11 animated:1];
  }
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  uint64_t v4 = -[SKUIGridPageSection _itemForIndex:](self, "_itemForIndex:", [a3 item]);
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v10 = v4;
    id v6 = [(NSMapTable *)self->_artworkRequests objectForKey:v4];
    if (v6)
    {
      uint64_t v7 = [(SKUIStorePageSection *)self context];
      double v8 = [v7 resourceLoader];
      char v9 = objc_msgSend(v8, "trySetReason:forRequestWithIdentifier:", 0, objc_msgSend(v6, "unsignedIntegerValue"));

      if ((v9 & 1) == 0) {
        [(NSMapTable *)self->_artworkRequests removeObjectForKey:v10];
      }
    }

    uint64_t v5 = v10;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [(SKUIStorePageSection *)self pageComponent];
  unint64_t v5 = [v15 item];
  id v6 = [(SKUIGridPageSection *)self _itemForIndex:v5];
  if (v6)
  {
    [(SKUIGridPageSection *)self _selectItem:v6 withIndex:v5];
  }
  else if ([v4 gridType] == 4)
  {
    uint64_t v7 = [v4 children];
    if (v5 < [v7 count])
    {
      double v8 = [(SKUIStorePageSection *)self context];
      char v9 = [v7 objectAtIndex:v5];
      uint64_t v10 = [(SKUIStorePageSection *)self clickEventWithMedia:v9 elementName:*MEMORY[0x1E4FA88E0] index:v5];
      if (v10)
      {
        double v11 = [v8 metricsController];
        [v11 recordEvent:v10];
      }
      if ([v9 mediaType])
      {
        double v12 = [v8 collectionView];
        id v13 = [v12 cellForItemAtIndexPath:v15];

        double v14 = [v13 mediaView];
        [v14 beginPlaybackAnimated:1];
      }
      else
      {
        id v13 = [v9 link];
        [(SKUIStorePageSection *)self showPageWithLink:v13];
      }
    }
  }
}

- (void)collectionViewDidTapVideoAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[SKUIGridPageSection _itemForIndex:](self, "_itemForIndex:", [v4 item]);
  id v6 = [v5 videos];
  uint64_t v7 = [v6 firstObject];

  double v8 = [v7 URL];
  if (v8)
  {
    char v9 = [(SKUIStorePageSection *)self context];
    uint64_t v10 = [v9 collectionView];

    double v11 = [v10 cellForItemAtIndexPath:v4];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    double v17 = __60__SKUIGridPageSection_collectionViewDidTapVideoAtIndexPath___block_invoke;
    double v18 = &unk_1E6429230;
    id v19 = v10;
    id v20 = v11;
    id v12 = v11;
    id v13 = v10;
    [(SKUIGridPageSection *)self _enumerateVisibleIndexPathsWithBlock:&v15];
    objc_msgSend(v13, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 2, 1, v15, v16, v17, v18);
    double v14 = [v12 layout];
    [v14 playInlineVideoWithURL:v8];
  }
}

void __60__SKUIGridPageSection_collectionViewDidTapVideoAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) cellForItemAtIndexPath:a2];
  if (*(void **)(a1 + 40) != v3)
  {
    id v5 = v3;
    id v4 = [v3 layout];
    [v4 endVideoPlaybackAnimated:1];

    v3 = v5;
  }
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4 = a3;
  id v8 = [v4 indexPath];
  uint64_t v5 = [v8 item];
  id v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v5 / self->_numberOfColumns, objc_msgSend(v8, "section"));
  uint64_t v7 = [(SKUIStorePageSection *)self backgroundColorForIndexPath:v6];
  [v4 setBackgroundColor:v7];
}

- (id)itemOfferClickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIGridPageSection;
  uint64_t v7 = -[SKUIStorePageSection itemOfferClickEventWithItem:elementName:index:](&v9, sel_itemOfferClickEventWithItem_elementName_index_, a3, a4);
  [(SKUIGridPageSection *)self _setPositionForClickEvent:v7 withElementIndex:a5];

  return v7;
}

- (int64_t)numberOfCells
{
  v2 = [(SKUIStorePageSection *)self pageComponent];
  v3 = [v2 children];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_containsLockups)
  {
    uint64_t v5 = [(SKUIStorePageSection *)self context];
    id v6 = [v5 collectionView];
    uint64_t v7 = [v6 indexPathsForVisibleItems];

    int64_t v8 = [(SKUIStorePageSection *)self sectionIndex];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v9 = v7;
    uint64_t v10 = 0;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([v14 section] == v8)
          {
            uint64_t v15 = [v14 item];
            if (v10 <= v15) {
              uint64_t v10 = v15;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v11);
    }

    uint64_t v16 = [v5 resourceLoader];
    double v17 = [(SKUIStorePageSection *)self pageComponent];
    uint64_t v18 = [v17 gridType];

    id v19 = [(SKUIStorePageSection *)self pageComponent];
    id v20 = v19;
    if (v19)
    {
      [v19 lockupStyle];
      uint64_t v21 = v30;
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
    }

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __51__SKUIGridPageSection_prefetchResourcesWithReason___block_invoke;
    v23[3] = &unk_1E6429258;
    v23[4] = self;
    id v22 = v16;
    int64_t v26 = a3;
    uint64_t v27 = v21;
    id v24 = v22;
    v25 = v29;
    uint64_t v28 = v18;
    [(SKUIGridPageSection *)self _enumerateItemsFromStartIndex:v10 withBlock:v23];
    [(SKUIGridPageSection *)self _loadMissingItemsFromIndex:0 withReason:a3];

    _Block_object_dispose(v29, 8);
  }
}

void __51__SKUIGridPageSection_prefetchResourcesWithReason___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v12 = a2;
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "objectForKey:");
  id v6 = v5;
  if (v5
    && (objc_msgSend(*(id *)(a1 + 40), "trySetReason:forRequestWithIdentifier:", *(void *)(a1 + 56), objc_msgSend(v5, "unsignedIntegerValue")) & 1) != 0)
  {
    if (*a3) {
      goto LABEL_13;
    }
  }
  else
  {
    [*(id *)(a1 + 32) _loadImageForItem:v12 lockupSize:*(void *)(a1 + 64) loader:*(void *)(a1 + 40) reason:*(void *)(a1 + 56)];
    BOOL v7 = ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > 19;
    *a3 = v7;
    if (v7) {
      goto LABEL_13;
    }
  }
  if (*(void *)(a1 + 72) == 5)
  {
    int64_t v8 = [v12 videos];
    id v9 = [v8 firstObject];

    if (v9)
    {
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKey:v9];
      uint64_t v11 = v10;
      if (!v10
        || (objc_msgSend(*(id *)(a1 + 40), "trySetReason:forRequestWithIdentifier:", *(void *)(a1 + 56), objc_msgSend(v10, "unsignedIntegerValue")) & 1) == 0)
      {
        +[SKUILockupItemCellLayout videoThumbnailSizeForVideo:v9 clientContext:*(void *)(*(void *)(a1 + 32) + 96)];
        objc_msgSend(*(id *)(a1 + 32), "_loadImageForVideo:thumbnailSize:loader:reason:", v9, *(void *)(a1 + 40), *(void *)(a1 + 56));
        *a3 = ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > 19;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
LABEL_13:
}

- (void)willAppearInContext:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C902C8];
  id v6 = +[SKUIItemStateCenter defaultCenter];
  [v6 addObserver:self];

  BOOL v7 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v8 = [v7 gridType];
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    id v9 = [v7 children];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v15 = [v14 componentType];
        if (v15 == 5)
        {
          uint64_t v16 = [(SKUIGridPageSection *)self _editorialLayoutForEditorial:v14];
        }
        else
        {
          if (v15 != 9) {
            continue;
          }
          uint64_t v16 = [(SKUIGridPageSection *)self _editorialLayoutForLockup:v14];
        }
        double v17 = v16;
        [v16 enqueueLayoutRequests];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v11)
      {
LABEL_14:

        break;
      }
    }
  }
  [v5 bounds];
  if (self->_isPad)
  {
    if (v18 <= v19)
    {
      self->_isLandscape = 0;
      int64_t v20 = [(SKUIGridPageSection *)self _numberOfPortraitColumnsWithGridType:v8];
    }
    else
    {
      self->_isLandscape = 1;
      int64_t v20 = [(SKUIGridPageSection *)self _numberOfLandscapeColumnsWithGridType:v8];
    }
    self->_int64_t numberOfColumns = v20;
  }
  else
  {
    self->_isLandscape = 0;
    self->_int64_t numberOfColumns = 1;
    if (v18 > v19)
    {
      uint64_t v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v21 bounds];
      double v23 = v22;

      if (v23 > 375.0)
      {
        self->_isLandscape = 1;
        self->_int64_t numberOfColumns = 2;
      }
    }
  }
  id v24 = [v4 parentViewController];
  v25 = [v24 clientContext];
  clientContext = self->_clientContext;
  self->_clientContext = v25;

  uint64_t v27 = objc_alloc_init(SKUIVideoImageDataConsumer);
  videoImageDataConsumer = self->_videoImageDataConsumer;
  self->_videoImageDataConsumer = v27;

  unint64_t v29 = self->_videoImageDataConsumer;
  uint64_t v30 = [v4 colorScheme];
  [(SKUIVideoImageDataConsumer *)v29 setColorScheme:v30];

  uint64_t v31 = SKUIUserInterfaceIdiom(self->_clientContext);
  uint64_t v32 = self->_videoImageDataConsumer;
  if (v31 == 1)
  {
    [(SKUIVideoImageDataConsumer *)v32 setAllowedOrientations:2];
    -[SKUIVideoImageDataConsumer setLandscapeSize:](self->_videoImageDataConsumer, "setLandscapeSize:", 221.0, 166.0);
  }
  else
  {
    [(SKUIVideoImageDataConsumer *)v32 setAllowedOrientations:3];
    -[SKUIVideoImageDataConsumer setLandscapeSize:](self->_videoImageDataConsumer, "setLandscapeSize:", 320.0, 180.0);
    -[SKUIVideoImageDataConsumer setPortraitSize:](self->_videoImageDataConsumer, "setPortraitSize:", 180.0, 320.0);
  }
  v33.receiver = self;
  v33.super_class = (Class)SKUIGridPageSection;
  [(SKUIStorePageSection *)&v33 willAppearInContext:v4];
}

- (void)willHideInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SKUIItemStateCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SKUIGridPageSection;
  [(SKUIStorePageSection *)&v6 willHideInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if (self->_isPad
    || ([MEMORY[0x1E4FB1BA8] mainScreen],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 bounds],
        double v10 = v9,
        v8,
        v10 > 375.0))
  {
    self->_isLandscape = width > height;
    uint64_t v11 = [(SKUIStorePageSection *)self pageComponent];
    uint64_t v12 = [v11 gridType];
    if ((v12 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      [(SKUIGridPageSection *)self _updateVisibileEditorialWithEditorialOrientation:self->_isLandscape];
    }
    if (self->_isPad)
    {
      if (self->_isLandscape) {
        int64_t v13 = [(SKUIGridPageSection *)self _numberOfLandscapeColumnsWithGridType:v12];
      }
      else {
        int64_t v13 = [(SKUIGridPageSection *)self _numberOfPortraitColumnsWithGridType:v12];
      }
    }
    else if (self->_isLandscape)
    {
      int64_t v13 = 2;
    }
    else
    {
      int64_t v13 = 1;
    }
    self->_int64_t numberOfColumns = v13;
    if (v12 == 5)
    {
      double v14 = [(SKUIStorePageSection *)self context];
      uint64_t v15 = [v14 collectionView];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __70__SKUIGridPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke;
      v18[3] = &unk_1E6429230;
      id v19 = v15;
      int64_t v20 = self;
      id v16 = v15;
      [(SKUIGridPageSection *)self _enumerateVisibleIndexPathsWithBlock:v18];
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIGridPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v17, sel_willTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void __70__SKUIGridPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 cellForItemAtIndexPath:v4];
  uint64_t v5 = [v8 layout];
  objc_super v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v4 item];

  [v6 _contentInsetForVideoLockupIndex:v7];
  objc_msgSend(v5, "setContentInsets:");
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SKUIStorePageSection *)self context];
  double v9 = [v8 collectionView];

  uint64_t v10 = [v7 requestIdentifier];
  BOOL containsLockups = self->_containsLockups;
  uint64_t v12 = [(SKUIStorePageSection *)self pageComponent];
  int64_t v13 = v12;
  if (containsLockups)
  {
    uint64_t v14 = [v12 gridType];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __51__SKUIGridPageSection_artworkRequest_didLoadImage___block_invoke;
    v25[3] = &unk_1E6429280;
    v25[4] = self;
    id v26 = v9;
    id v27 = v6;
    uint64_t v28 = v10;
    uint64_t v29 = v14;
    id v15 = v6;
    id v16 = v9;
    [(SKUIGridPageSection *)self _enumerateVisibleItemsWithBlock:v25];
  }
  else
  {
    objc_super v17 = [v12 children];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__SKUIGridPageSection_artworkRequest_didLoadImage___block_invoke_2;
    v19[3] = &unk_1E64292A8;
    id v20 = v17;
    uint64_t v21 = self;
    id v23 = v6;
    uint64_t v24 = v10;
    id v22 = v9;
    id v18 = v6;
    id v15 = v9;
    id v16 = v17;
    [(SKUIGridPageSection *)self _enumerateVisibleIndexPathsWithBlock:v19];
  }
}

void __51__SKUIGridPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKey:v17];
  double v9 = v8;
  if (v8 && [v8 unsignedIntegerValue] == *(void *)(a1 + 56))
  {
    uint64_t v10 = [*(id *)(a1 + 40) cellForItemAtIndexPath:v7];
    uint64_t v11 = [v10 layout];
    [v11 setIconImage:*(void *)(a1 + 48)];

    *a4 = 1;
  }
  else
  {
    if (*(void *)(a1 + 64) != 5) {
      goto LABEL_12;
    }
    uint64_t v12 = [v17 videos];
    uint64_t v10 = [v12 firstObject];

    if (v10)
    {
      int64_t v13 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKey:v10];
      uint64_t v14 = v13;
      if (v13 && [v13 unsignedIntegerValue] == *(void *)(a1 + 56))
      {
        id v15 = [*(id *)(a1 + 40) cellForItemAtIndexPath:v7];
        id v16 = [v15 layout];
        [v16 setVideoThumbnailImage:*(void *)(a1 + 48)];

        *a4 = 1;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
LABEL_12:
}

void __51__SKUIGridPageSection_artworkRequest_didLoadImage___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  unint64_t v5 = [v13 item];
  BOOL v6 = v5 >= [*(id *)(a1 + 32) count];
  id v7 = v13;
  if (!v6)
  {
    id v8 = *(void **)(*(void *)(a1 + 40) + 88);
    double v9 = [*(id *)(a1 + 32) objectAtIndex:v5];
    uint64_t v10 = [v8 objectForKey:v9];

    if (v10 && [v10 unsignedIntegerValue] == *(void *)(a1 + 64))
    {
      uint64_t v11 = [*(id *)(a1 + 48) cellForItemAtIndexPath:v13];
      uint64_t v12 = [v11 mediaView];
      [v12 setThumbnailImage:*(void *)(a1 + 56)];

      *a3 = 1;
    }

    id v7 = v13;
  }
}

- (void)mediaView:(id)a3 playbackStateDidChange:(int64_t)a4
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SKUIStorePageSection *)self context];
  id v8 = [v7 collectionView];
  [v6 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = [v6 superview];

  objc_msgSend(v8, "convertRect:fromView:", v17, v10, v12, v14, v16);
  double v19 = v18;
  double v21 = v20;

  id v22 = objc_msgSend(v8, "indexPathForItemAtPoint:", v19, v21);
  id v23 = v22;
  if (v22)
  {
    uint64_t v24 = [v22 section];
    if (v24 == [(SKUIStorePageSection *)self sectionIndex])
    {
      v25 = [(SKUIStorePageSection *)self context];
      id v26 = [v25 metricsController];

      if ([v26 canRecordEventWithType:*MEMORY[0x1E4FA8888]])
      {
        id v27 = objc_alloc_init(MEMORY[0x1E4FA8240]);
        uint64_t v28 = SKUIMetricsMediaEventTypeForPlaybackState(a4);
        [v27 setMediaEventType:v28];

        uint64_t v29 = [(SKUIStorePageSection *)self pageComponent];
        uint64_t v30 = [v29 children];
        uint64_t v31 = objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v23, "item"));

        uint64_t v32 = [v26 locationWithPageComponent:v29];
        uint64_t v33 = [v26 locationWithPageComponent:v31];
        long long v34 = (void *)v33;
        if (v32 && v33)
        {
          v39[0] = v33;
          v39[1] = v32;
          long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
          [v27 setLocationWithEventLocations:v35];
        }
        uint64_t v36 = [v31 mediaIdentifier];
        if (v36)
        {
          long long v37 = [NSNumber numberWithLongLong:v36];
          [v27 setItemIdentifier:v37];
        }
        uint64_t v38 = [v31 mediaURLString];
        [v27 setMediaURL:v38];

        [v26 recordEvent:v27];
      }
    }
  }
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
        double v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v13 = [v12 itemIdentifier];
        [v6 setObject:v12 forKey:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__SKUIGridPageSection_itemStateCenter_itemStatesChanged___block_invoke;
  v15[3] = &unk_1E6421FF8;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

void __57__SKUIGridPageSection_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 collectionView];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SKUIGridPageSection_itemStateCenter_itemStatesChanged___block_invoke_2;
  v6[3] = &unk_1E64292D0;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 _enumerateVisibleItemsWithBlock:v6];
}

void __57__SKUIGridPageSection_itemStateCenter_itemStatesChanged___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = (objc_class *)NSNumber;
  id v6 = a2;
  id v7 = [v5 alloc];
  uint64_t v8 = [v6 itemIdentifier];

  uint64_t v9 = (void *)[v7 initWithLongLong:v8];
  uint64_t v10 = [*(id *)(a1 + 32) objectForKey:v9];
  if (v10)
  {
    double v11 = [*(id *)(a1 + 40) cellForItemAtIndexPath:v13];
    double v12 = [v11 layout];
    [v12 setItemState:v10 animated:1];
  }
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SKUIGridPageSection_itemStateCenterRestrictionsChanged___block_invoke;
  v6[3] = &unk_1E6421FF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __58__SKUIGridPageSection_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 collectionView];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SKUIGridPageSection_itemStateCenterRestrictionsChanged___block_invoke_2;
  v6[3] = &unk_1E64292D0;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _enumerateVisibleItemsWithBlock:v6];
}

void __58__SKUIGridPageSection_itemStateCenterRestrictionsChanged___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v11 = [v5 cellForItemAtIndexPath:a3];
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v6 parentalControlsRank];

  uint64_t v9 = [v7 isItemRestrictedWithParentalControlsRank:v8];
  uint64_t v10 = [v11 layout];
  [v10 setRestricted:v9];
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(SKUIStorePageSection *)self pageComponent];
  if ([v7 count])
  {
    uint64_t v10 = [v9 _updateWithMissingItems:v7];
    if ([v10 count])
    {
      id v11 = [(SKUIStorePageSection *)self context];
      double v12 = [v11 collectionView];

      uint64_t v13 = [v9 gridType];
      id v14 = [v9 children];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __77__SKUIGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
      v19[3] = &unk_1E64292F8;
      id v23 = v14;
      uint64_t v24 = v13;
      id v20 = v10;
      id v21 = v12;
      uint64_t v22 = self;
      id v15 = v14;
      id v16 = v12;
      [(SKUIGridPageSection *)self _enumerateVisibleItemsWithBlock:v19];
    }
  }
  if ([v8 count])
  {
    long long v17 = [v9 _updateWithInvalidItemIdentifiers:v8];
    if ([v17 count])
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __77__SKUIGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke_2;
      v18[3] = &unk_1E6422020;
      void v18[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v18];
    }
  }
}

void __77__SKUIGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  uint64_t v4 = [v10 item];
  if ([*(id *)(a1 + 32) containsIndex:v4])
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if (!v5 || v5 == 5)
    {
      id v6 = [*(id *)(a1 + 40) cellForItemAtIndexPath:v10];
      uint64_t v9 = *(void **)(a1 + 48);
      id v8 = [*(id *)(a1 + 56) objectAtIndex:v4];
      [v9 _reloadItemCell:v6 withLockup:v8 index:v4];
    }
    else
    {
      if (v5 != 1) {
        goto LABEL_8;
      }
      id v6 = [*(id *)(a1 + 40) cellForItemAtIndexPath:v10];
      id v7 = *(void **)(a1 + 48);
      id v8 = [*(id *)(a1 + 56) objectAtIndex:v4];
      [v7 _reloadEditorialLockupCell:v6 withLockup:v8 index:v4];
    }
  }
LABEL_8:
}

void __77__SKUIGridPageSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v4 = [v2 collectionView];

  v3 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 32), "sectionIndex"));
  [v4 reloadSections:v3];
}

- (void)productPageOverlayDidDismiss:(id)a3
{
  id v10 = [(SKUIStorePageSection *)self context];
  id v4 = [v10 collectionView];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", self->_overlaySourceItemIndex, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
  id v6 = [v4 cellForItemAtIndexPath:v5];

  id v7 = [v6 layout];
  [v7 setIconImageHidden:0];

  id v8 = [v10 parentViewController];
  [v8 _pageSectionDidDismissOverlayController:self->_overlayController];

  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
  overlayController = self->_overlayController;
  self->_overlayController = 0;

  self->_overlaySourceItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  [(NSMutableIndexSet *)self->_hiddenIconIndexSet removeAllIndexes];
}

- (id)_artworkContextForLockupSize:(int64_t)a3
{
  lockupArtworkContexts = self->_lockupArtworkContexts;
  if (!lockupArtworkContexts)
  {
    id v6 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:0];
    id v7 = self->_lockupArtworkContexts;
    self->_lockupArtworkContexts = v6;

    lockupArtworkContexts = self->_lockupArtworkContexts;
  }
  NSMapGet(lockupArtworkContexts, (const void *)a3);
  id v8 = (SKUIItemArtworkContext *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    id v8 = objc_alloc_init(SKUIItemArtworkContext);
    uint64_t v9 = [(SKUIStorePageSection *)self context];
    id v10 = [v9 colorScheme];
    [(SKUIItemArtworkContext *)v8 setColorScheme:v10];

    id v11 = +[SKUIProductImageDataConsumer lockupConsumerWithSize:a3 itemKind:7];
    [(SKUIItemArtworkContext *)v8 setGeneralConsumer:v11];

    double v12 = +[SKUIStyledImageDataConsumer lockupIconConsumerWithSize:a3];
    [(SKUIItemArtworkContext *)v8 setIconConsumer:v12];

    uint64_t v13 = +[SKUIProductImageDataConsumer lockupConsumerWithSize:a3 itemKind:8];
    [(SKUIItemArtworkContext *)v8 setLetterboxConsumer:v13];

    id v14 = +[SKUIStyledImageDataConsumer lockupProductImageConsumerWithSize:a3];
    [(SKUIItemArtworkContext *)v8 setNewsstandConsumer:v14];

    id v15 = +[SKUIProductImageDataConsumer lockupConsumerWithSize:a3 itemKind:6];
    [(SKUIItemArtworkContext *)v8 setPosterConsumer:v15];

    NSMapInsert(self->_lockupArtworkContexts, (const void *)a3, v8);
  }

  return v8;
}

- (id)_cellImageForItem:(id)a3 lockupSize:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SKUIStorePageSection *)self context];
  id v8 = [v7 resourceLoader];

  uint64_t v9 = [(NSMapTable *)self->_artworkRequests objectForKey:v6];
  id v10 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  id v11 = objc_msgSend(v8, "cachedResourceForRequestIdentifier:", objc_msgSend(v9, "unsignedIntegerValue"));
  if (v11) {
    goto LABEL_6;
  }
  if ((objc_msgSend(v8, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v10, "unsignedIntegerValue")) & 1) == 0) {
LABEL_4:
  }
    [(SKUIGridPageSection *)self _loadImageForItem:v6 lockupSize:a4 loader:v8 reason:1];
  double v12 = [(SKUIGridPageSection *)self _artworkContextForLockupSize:a4];
  id v11 = [v12 placeholderImageForItem:v6];

LABEL_6:

  return v11;
}

- (UIEdgeInsets)_contentInsetForMediaIndex:(int64_t)a3
{
  double v5 = 15.0;
  if (a3 && (a3 != 1 || self->_numberOfColumns <= 1)) {
    double v5 = 8.0;
  }
  id v6 = [(SKUIStorePageSection *)self pageComponent];
  id v7 = [v6 children];
  uint64_t v8 = [v7 count];

  int64_t numberOfColumns = self->_numberOfColumns;
  double v10 = 8.0;
  if (a3) {
    double v10 = 15.0;
  }
  if (numberOfColumns == 1) {
    double v11 = 15.0;
  }
  else {
    double v11 = v10;
  }
  if (numberOfColumns == 1 || (a3 & 1) == 0) {
    double v13 = 15.0;
  }
  else {
    double v13 = 7.0;
  }
  if (v8 - numberOfColumns <= a3 && v8 % numberOfColumns == 0) {
    double v15 = 15.0;
  }
  else {
    double v15 = 7.0;
  }
  double v16 = v5;
  result.right = v11;
  result.bottom = v15;
  result.left = v13;
  result.top = v16;
  return result;
}

- (UIEdgeInsets)_contentInsetForVideoLockupIndex:(int64_t)a3
{
  double v5 = 15.0;
  double v6 = 15.0;
  if (self->_numberOfColumns > a3)
  {
    if (self->_isPad) {
      double v6 = 28.0;
    }
    else {
      double v6 = 0.0;
    }
  }
  id v7 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v8 = [v7 children];
  uint64_t v9 = [v8 count];

  int64_t numberOfColumns = self->_numberOfColumns;
  double v11 = 15.0;
  if (numberOfColumns != 1)
  {
    if (a3 % numberOfColumns)
    {
      if (numberOfColumns == 4) {
        double v11 = 28.0;
      }
      else {
        double v11 = 25.0;
      }
      double v12 = 26.0;
      if (numberOfColumns == 4) {
        double v12 = 28.0;
      }
      if (a3 % numberOfColumns == numberOfColumns - 1) {
        double v5 = v12;
      }
      else {
        double v5 = 0.0;
      }
    }
    else
    {
      double v11 = 28.0;
      if (numberOfColumns != 4) {
        double v11 = 26.0;
      }
      double v5 = 0.0;
    }
  }
  uint64_t v13 = v9 % numberOfColumns;
  int64_t v14 = v9 - numberOfColumns;
  double v15 = 40.0;
  if (!self->_isPad) {
    double v15 = 7.0;
  }
  double v16 = 28.0;
  if (!self->_isPad) {
    double v16 = 12.0;
  }
  if (v14 > a3 || v13 != 0) {
    double v16 = v15;
  }
  double v18 = v6;
  double v19 = v5;
  result.right = v19;
  result.bottom = v16;
  result.left = v11;
  result.top = v18;
  return result;
}

- (id)_editorialCellWithEditorials:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SKUIStorePageSection *)self context];
  uint64_t v9 = [v8 collectionView];
  double v10 = [v9 dequeueReusableCellWithReuseIdentifier:0x1F1C90D28 forIndexPath:v7];
  double v11 = [v10 layout];
  BOOL v12 = SKUIEditorialLayoutOrientationForView(v9);
  unint64_t v13 = [v7 item];

  if (v13 >= [v6 count])
  {
    [v11 applyEditorialLayout:0 withOrientation:v12 expanded:1];
  }
  else
  {
    int64_t v14 = [v6 objectAtIndex:v13];
    double v15 = [(SKUIGridPageSection *)self _editorialLayoutForEditorial:v14];
    [v11 applyEditorialLayout:v15 withOrientation:v12 expanded:1];
  }
  double v16 = [v8 colorScheme];
  [v11 setColoringWithColorScheme:v16];

  return v10;
}

- (id)_editorialLayoutForEditorial:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMapTable *)self->_editorialLayouts objectForKey:v4];
  if (!v5)
  {
    id v6 = [SKUIEditorialLayout alloc];
    id v7 = [(SKUIStorePageSection *)self context];
    uint64_t v8 = [v7 textLayoutCache];
    double v5 = [(SKUIEditorialLayout *)v6 initWithEditorial:v4 layoutCache:v8];

    uint64_t v9 = [(SKUIStorePageSection *)self context];
    double v10 = [v9 collectionView];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    if (self->_isPad)
    {
      float v15 = v14 * 0.5 + -30.0;
      [(SKUIEditorialLayout *)v5 setLayoutWidth:1 forOrientation:floorf(v15)];
      float v16 = v12 * 0.5 + -30.0;
      double v17 = floorf(v16);
    }
    else
    {
      [(SKUIEditorialLayout *)v5 setLayoutWidth:1 forOrientation:v14 + -30.0];
      double v17 = v12 + -30.0;
    }
    [(SKUIEditorialLayout *)v5 setLayoutWidth:0 forOrientation:v17];
    editorialLayouts = self->_editorialLayouts;
    if (!editorialLayouts)
    {
      double v19 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      id v20 = self->_editorialLayouts;
      self->_editorialLayouts = v19;

      editorialLayouts = self->_editorialLayouts;
    }
    [(NSMapTable *)editorialLayouts setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)_editorialLayoutForLockup:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMapTable *)self->_editorialLayouts objectForKey:v4];
  if (!v5)
  {
    id v6 = [v4 editorial];
    id v7 = [SKUIEditorialLayout alloc];
    uint64_t v8 = [(SKUIStorePageSection *)self context];
    uint64_t v9 = [v8 textLayoutCache];
    double v5 = [(SKUIEditorialLayout *)v7 initWithEditorial:v6 layoutCache:v9];

    if (v4) {
      [v4 lockupStyle];
    }
    BOOL IsHorizontal = SKUILockupLayoutStyleIsHorizontal(0);
    double v11 = 328.0;
    if (IsHorizontal)
    {
      double v11 = 477.0;
      double v12 = 349.0;
    }
    else
    {
      double v12 = 200.0;
    }
    -[SKUIEditorialLayout setLayoutWidth:forOrientation:](v5, "setLayoutWidth:forOrientation:", 1, v11, 200.0);
    [(SKUIEditorialLayout *)v5 setLayoutWidth:0 forOrientation:v12];
    editorialLayouts = self->_editorialLayouts;
    if (!editorialLayouts)
    {
      double v14 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      float v15 = self->_editorialLayouts;
      self->_editorialLayouts = v14;

      editorialLayouts = self->_editorialLayouts;
    }
    [(NSMapTable *)editorialLayouts setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)_editorialLockupCellWithLockups:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SKUIStorePageSection *)self context];
  uint64_t v9 = [v8 collectionView];
  double v10 = [v9 dequeueReusableCellWithReuseIdentifier:0x1F1C9A308 forIndexPath:v7];
  double v11 = [v10 layout];
  [v11 setClientContext:self->_clientContext];
  double v12 = [v8 itemOfferButtonAppearance];
  [v11 setItemOfferButtonAppearance:v12];

  unint64_t v13 = [v7 item];
  double v14 = 20.0;
  if (v13) {
    double v15 = 15.0;
  }
  else {
    double v15 = 20.0;
  }
  if ((v13 & 1) == 0) {
    double v14 = 15.0;
  }
  if (self->_numberOfColumns == 1)
  {
    double v14 = 15.0;
    double v16 = 15.0;
  }
  else
  {
    double v16 = v15;
  }
  objc_msgSend(v11, "setContentInsets:", 15.0, v14, 15.0, v16);
  if (v13 >= [v6 count])
  {
    [v10 configureForItem:0 clientContext:self->_clientContext];
    double v18 = [v11 lockupCellLayout];
    [v18 setIconImage:0];

    [v11 applyEditorialLayout:0 withOrientation:0];
  }
  else
  {
    double v17 = [v6 objectAtIndex:v13];
    [(SKUIGridPageSection *)self _reloadEditorialLockupCell:v10 withLockup:v17 index:v13];
  }

  return v10;
}

- (void)_enumerateItemsFromStartIndex:(int64_t)a3 withBlock:(id)a4
{
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  id v7 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v8 = [v7 children];
  int64_t v9 = [v8 count];
  char v13 = 0;
  if (v9 > a3)
  {
    int64_t v10 = v9;
    do
    {
      double v11 = [v8 objectAtIndex:a3];
      double v12 = [v11 item];
      v6[2](v6, v12, &v13);

      ++a3;
    }
    while (a3 < v10 && !v13);
  }
}

- (void)_enumerateVisibleIndexPathsWithBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  double v5 = [(SKUIStorePageSection *)self context];
  id v6 = [v5 collectionView];

  int64_t v7 = [(SKUIStorePageSection *)self sectionIndex];
  [v6 indexPathsForVisibleItems];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      char v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
      if ([v13 section] == v7)
      {
        char v14 = 0;
        v4[2](v4, v13, &v14);
        if (v14) {
          break;
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_enumerateVisibleItemsWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SKUIGridPageSection__enumerateVisibleItemsWithBlock___block_invoke;
  v6[3] = &unk_1E6429320;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SKUIGridPageSection *)self _enumerateVisibleIndexPathsWithBlock:v6];
}

void __55__SKUIGridPageSection__enumerateVisibleItemsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_itemForIndex:", objc_msgSend(v4, "item"));
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (double)_heightForEditorialAtIndexPath:(id)a3
{
  uint64_t v4 = [a3 item];
  id v5 = [(SKUIStorePageSection *)self pageComponent];
  id v6 = [v5 children];

  BOOL isLandscape = self->_isLandscape;
  if (self->_numberOfColumns == 1)
  {
    id v8 = [v6 objectAtIndex:v4];
    uint64_t v9 = [(SKUIGridPageSection *)self _editorialLayoutForEditorial:v8];

    [v9 layoutHeightForOrientation:isLandscape expanded:1];
    double v11 = v10;
  }
  else
  {
    uint64_t v12 = v4 - ((v4 & 0x8000000000000001) == 1);
    char v13 = [v6 objectAtIndex:v12];
    uint64_t v9 = [(SKUIGridPageSection *)self _editorialLayoutForEditorial:v13];

    [v9 layoutHeightForOrientation:isLandscape expanded:1];
    double v11 = v14;
    unint64_t v15 = v12 + 1;
    if (v15 < [v6 count])
    {
      long long v16 = [v6 objectAtIndex:v15];
      long long v17 = [(SKUIGridPageSection *)self _editorialLayoutForEditorial:v16];

      [v17 layoutHeightForOrientation:isLandscape expanded:1];
      if (v11 < v18) {
        double v11 = v18;
      }
    }
  }

  return v11 + 32.0;
}

- (double)_heightForEditorialLockup:(id)a3
{
  id v4 = a3;
  +[SKUILockupItemCellLayout heightForLockupComponent:v4 clientContext:self->_clientContext];
  double v6 = v5;
  id v7 = [(SKUIGridPageSection *)self _editorialLayoutForLockup:v4];
  [v7 layoutHeightForOrientation:self->_isLandscape expanded:1];
  double v9 = v8 + 42.0;
  if (v4)
  {
    [v4 lockupStyle];
    if (!SKUILockupLayoutStyleIsHorizontal(v12))
    {
      [v4 lockupStyle];
      if ((v11 & 4) != 0) {
        double v9 = v9 + 41.0;
      }
      goto LABEL_7;
    }
LABEL_6:
    double v6 = v6 + v9;
    goto LABEL_9;
  }
  if (SKUILockupLayoutStyleIsHorizontal(0)) {
    goto LABEL_6;
  }
LABEL_7:
  if (v9 >= v6) {
    double v6 = v9;
  }
LABEL_9:

  return v6;
}

- (double)_heightForEditorialLockupAtIndexPath:(id)a3
{
  uint64_t v4 = [a3 item];
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 children];

  if (self->_numberOfColumns == 1)
  {
    id v7 = [v6 objectAtIndex:v4];
    [(SKUIGridPageSection *)self _heightForEditorialLockup:v7];
    double v9 = v8;
  }
  else
  {
    uint64_t v10 = v4 - ((v4 & 0x8000000000000001) == 1);
    id v7 = [v6 objectAtIndex:v10];
    [(SKUIGridPageSection *)self _heightForEditorialLockup:v7];
    double v9 = v11;
    unint64_t v12 = v10 + 1;
    if (v12 < [v6 count])
    {
      char v13 = [v6 objectAtIndex:v12];
      [(SKUIGridPageSection *)self _heightForEditorialLockup:v13];
      if (v9 < v14) {
        double v9 = v14;
      }
    }
  }

  return v9;
}

- (double)_heightForLockupAtIndexPath:(id)a3 gridType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SKUIStorePageSection *)self pageComponent];
  double v8 = [v7 children];

  uint64_t v9 = [v6 item];
  int64_t numberOfColumns = self->_numberOfColumns;
  if (numberOfColumns == 1)
  {
    double v11 = [v8 objectAtIndex:v9];
    +[SKUILockupItemCellLayout heightForLockupComponent:v11 clientContext:self->_clientContext];
    double i = v12;
  }
  else
  {
    unint64_t v14 = v9 / numberOfColumns * numberOfColumns;
    for (double i = 0.0; v14 < [v8 count]; ++v14)
    {
      unint64_t v15 = [v8 objectAtIndex:v14];
      +[SKUILockupItemCellLayout heightForLockupComponent:v15 clientContext:self->_clientContext];
      double v17 = v16;

      if (i < v17) {
        double i = v17;
      }
    }
  }
  if (a4 == 5)
  {
    -[SKUIGridPageSection _contentInsetForVideoLockupIndex:](self, "_contentInsetForVideoLockupIndex:", [v6 item]);
    double i = i + v18 + v19;
  }
  else if (!a4)
  {
    double i = i + 20.0;
  }

  return i;
}

- (double)_heightForMedia:(id)a3 width:(double)a4
{
  double v5 = [a3 bestThumbnailArtwork];
  double v6 = (double)[v5 height];
  float v7 = a4 / (double)[v5 width] * v6;
  double v8 = floorf(v7);

  return v8;
}

- (double)_heightForMediaAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self context];
  double v6 = [v5 collectionView];
  [v6 bounds];
  double v8 = v7;

  uint64_t v9 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v10 = [v9 children];

  unint64_t v11 = [v4 item];
  [(SKUIGridPageSection *)self _mediaWidthForMediaIndex:v11 gridWidth:v8];
  double v13 = v12;
  if (self->_numberOfColumns == 1)
  {
    unint64_t v14 = [v10 objectAtIndex:v11];
    [(SKUIGridPageSection *)self _heightForMedia:v14 width:v13];
    double v16 = v15;
  }
  else
  {
    unint64_t v17 = v11 - ((v11 & 0x8000000000000001) == 1);
    double v18 = [v10 objectAtIndex:v17];
    [(SKUIGridPageSection *)self _heightForMedia:v18 width:v13];
    double v16 = v19;

    unint64_t v11 = v17 + 1;
    if (v11 < [v10 count])
    {
      uint64_t v20 = [v10 objectAtIndex:v11];
      [(SKUIGridPageSection *)self _heightForMedia:v20 width:v13];
      double v22 = v21;

      if (v16 < v22) {
        double v16 = v22;
      }
    }
  }
  [(SKUIGridPageSection *)self _contentInsetForMediaIndex:v11];
  double v25 = v16 + v23 + v24;

  return v25;
}

- (id)_itemCellWithLockups:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SKUIStorePageSection *)self context];
  uint64_t v9 = [v8 collectionView];
  uint64_t v10 = [v9 dequeueReusableCellWithReuseIdentifier:0x1F1C902C8 forIndexPath:v7];

  unint64_t v11 = [v8 colorScheme];
  double v12 = v11;
  if (v11)
  {
    double v13 = [v11 primaryTextColor];
    [v10 setSeparatorColor:v13];
  }
  unint64_t v14 = [v10 layout];
  [v14 setClientContext:self->_clientContext];
  [v14 setColoringWithColorScheme:v12];
  double v15 = [v8 itemOfferButtonAppearance];
  [v14 setItemOfferButtonAppearance:v15];

  [v14 setVerticalAlignment:1];
  unint64_t v16 = [v7 item];
  if (v16 >= [v6 count])
  {
    [v10 configureForItem:0 clientContext:self->_clientContext];
    [v14 setIconImage:0];
    [v14 setVideoThumbnailImage:0];
    objc_msgSend(v14, "setVideoThumbnailSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [v14 setVisibleFields:0];
  }
  else
  {
    unint64_t v17 = [v6 objectAtIndex:v16];
    [(SKUIGridPageSection *)self _reloadItemCell:v10 withLockup:v17 index:v16];
  }
  BOOL v20 = 1;
  if (self->_isPad)
  {
    double v18 = [(SKUIStorePageSection *)self pageComponent];
    uint64_t v19 = [v18 gridType];

    if (v19 == 5) {
      BOOL v20 = 0;
    }
  }
  [v10 setSeparatorStyle:v20];

  return v10;
}

- (id)_itemForIndex:(int64_t)a3
{
  if (self->_containsLockups)
  {
    id v4 = [(SKUIStorePageSection *)self pageComponent];
    double v5 = [v4 children];

    if ([v5 count] <= (unint64_t)a3)
    {
      id v7 = 0;
    }
    else
    {
      id v6 = [v5 objectAtIndex:a3];
      id v7 = [v6 item];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_loadImageForItem:(id)a3 lockupSize:(int64_t)a4 loader:(id)a5 reason:(int64_t)a6
{
  id v18 = a3;
  id v10 = a5;
  unint64_t v11 = [(SKUIGridPageSection *)self _artworkContextForLockupSize:a4];
  double v12 = [v11 URLForItem:v18];

  if (v12)
  {
    double v13 = objc_alloc_init(SKUIArtworkRequest);
    [(SKUIArtworkRequest *)v13 setDelegate:self];
    unint64_t v14 = [(SKUIGridPageSection *)self _artworkContextForLockupSize:a4];
    double v15 = [v14 dataConsumerForItem:v18];
    [(SKUIArtworkRequest *)v13 setDataConsumer:v15];

    [(SKUIArtworkRequest *)v13 setURL:v12];
    artworkRequests = self->_artworkRequests;
    unint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v13, "requestIdentifier"));
    [(NSMapTable *)artworkRequests setObject:v17 forKey:v18];

    [v10 loadResourceWithRequest:v13 reason:a6];
  }
}

- (void)_loadImageForVideo:(id)a3 thumbnailSize:(CGSize)a4 loader:(id)a5 reason:(int64_t)a6
{
  double height = a4.height;
  double width = a4.width;
  id v18 = a3;
  id v11 = a5;
  double v12 = [v18 artworks];
  double v13 = objc_msgSend(v12, "bestArtworkForScaledSize:", width, height);
  unint64_t v14 = [v13 URL];

  if (v14)
  {
    double v15 = objc_alloc_init(SKUIArtworkRequest);
    [(SKUIArtworkRequest *)v15 setDataConsumer:self->_videoImageDataConsumer];
    [(SKUIArtworkRequest *)v15 setDelegate:self];
    [(SKUIArtworkRequest *)v15 setURL:v14];
    artworkRequests = self->_artworkRequests;
    unint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v15, "requestIdentifier"));
    [(NSMapTable *)artworkRequests setObject:v17 forKey:v18];

    [v11 loadResourceWithRequest:v15 reason:a6];
  }
}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  id v8 = [(SKUIStorePageSection *)self pageComponent];
  if ([v8 isMissingItemData])
  {
    id v7 = [(SKUIGridPageSection *)self _missingItemLoader];
    [v7 loadItemsForPageComponent:v8 startIndex:a3 reason:a4];
  }
}

- (id)_mediaCellWithMedia:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SKUIStorePageSection *)self context];
  uint64_t v9 = [v8 collectionView];

  id v10 = [v9 dequeueReusableCellWithReuseIdentifier:0x1F1C99EE8 forIndexPath:v7];
  unint64_t v11 = [v7 item];

  [(SKUIGridPageSection *)self _contentInsetForMediaIndex:v11];
  objc_msgSend(v10, "setContentInset:");
  if (v11 >= [v6 count])
  {
    double v12 = 0;
  }
  else
  {
    double v12 = [v6 objectAtIndex:v11];
    if (v12)
    {
      double v13 = [(SKUIStorePageSection *)self context];
      unint64_t v14 = [v13 resourceLoader];

      double v15 = [(NSMapTable *)self->_artworkRequests objectForKey:v12];
      unint64_t v16 = v15;
      if (!v15) {
        goto LABEL_6;
      }
      unint64_t v17 = objc_msgSend(v14, "cachedResourceForRequestIdentifier:", objc_msgSend(v15, "unsignedIntegerValue"));
      if (v17)
      {
LABEL_10:

        goto LABEL_13;
      }
      if ((objc_msgSend(v14, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v16, "unsignedIntegerValue")) & 1) == 0)
      {
LABEL_6:
        id v18 = [v12 bestThumbnailArtwork];
        if (v18)
        {
          id v19 = [(SKUIGridPageSection *)self _newSizeToFitArtworkRequestWithArtwork:v18 mediaIndex:v11];
          artworkRequests = self->_artworkRequests;
          BOOL v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "requestIdentifier"));
          [(NSMapTable *)artworkRequests setObject:v20 forKey:v12];

          [v14 loadResourceWithRequest:v19 reason:1];
        }
      }
      unint64_t v17 = 0;
      goto LABEL_10;
    }
  }
  unint64_t v17 = 0;
LABEL_13:
  double v21 = [v10 mediaView];
  double v22 = [v12 accessibilityLabel];
  [v21 setAccessibilityLabel:v22];

  [v21 setDelegate:self];
  objc_msgSend(v21, "setMediaType:", objc_msgSend(v12, "mediaType"));
  double v23 = [v12 mediaURLString];
  [v21 setMediaURLString:v23];

  [v21 setThumbnailImage:v17];

  return v10;
}

- (double)_mediaWidthForMediaIndex:(int64_t)a3 gridWidth:(double)a4
{
  [(SKUIGridPageSection *)self _contentInsetForMediaIndex:a3];
  float v8 = a4 * 0.5 - v6 - v7;
  double result = floorf(v8);
  double v10 = a4 - v6 - v7;
  if (self->_numberOfColumns == 1) {
    return v10;
  }
  return result;
}

- (id)_missingItemLoader
{
  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    id v4 = [SKUIMissingItemLoader alloc];
    double v5 = [(SKUIStorePageSection *)self context];
    double v6 = [v5 resourceLoader];
    double v7 = [(SKUIMissingItemLoader *)v4 initWithResourceLoader:v6];
    float v8 = self->_missingItemLoader;
    self->_missingItemLoader = v7;

    [(SKUIMissingItemLoader *)self->_missingItemLoader setDelegate:self];
    missingItemLoader = self->_missingItemLoader;
  }

  return missingItemLoader;
}

- (id)_newSizeToFitArtworkRequestWithArtwork:(id)a3 mediaIndex:(int64_t)a4
{
  id v6 = a3;
  double v7 = objc_alloc_init(SKUIArtworkRequest);
  [(SKUIArtworkRequest *)v7 setDelegate:self];
  float v8 = [v6 URL];

  [(SKUIArtworkRequest *)v7 setURL:v8];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v10 = [(SKUIStorePageSection *)self context];
  [v10 landscapePageWidth];
  -[SKUIGridPageSection _mediaWidthForMediaIndex:gridWidth:](self, "_mediaWidthForMediaIndex:gridWidth:", a4);
  double v12 = v11;

  double v13 = +[SKUISizeToFitImageDataConsumer consumerWithConstraintSize:](SKUISizeToFitImageDataConsumer, "consumerWithConstraintSize:", v12, v9);
  [(SKUIArtworkRequest *)v7 setDataConsumer:v13];

  return v7;
}

- (int64_t)_numberOfLandscapeColumnsWithGridType:(int64_t)a3
{
  int64_t v3 = 2;
  if (a3 == 5) {
    int64_t v3 = 4;
  }
  if (a3) {
    return v3;
  }
  else {
    return 3;
  }
}

- (int64_t)_numberOfPortraitColumnsWithGridType:(int64_t)a3
{
  if (a3 == 5) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)_popSourceViewForOverlayController:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_overlaySourceItemIndex == 0x7FFFFFFFFFFFFFFFLL || [v4 numberOfVisibleOverlays] > 1)
  {
    double v15 = 0;
    goto LABEL_13;
  }
  id v6 = [(SKUIStorePageSection *)self context];
  double v7 = [v6 collectionView];

  float v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", self->_overlaySourceItemIndex, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
  double v9 = [v7 cellForItemAtIndexPath:v8];

  double v10 = [v9 layout];
  double v11 = [(SKUIStorePageSection *)self pageComponent];
  double v12 = [v11 children];
  double v13 = [v12 objectAtIndex:self->_overlaySourceItemIndex];

  unint64_t v14 = [v10 iconImage];
  double v15 = v14;
  if (v14)
  {
    if (v13)
    {
      [v13 lockupStyle];

      if ((v38 & 2) != 0)
      {
        id v16 = objc_alloc(MEMORY[0x1E4FB1838]);
        unint64_t v17 = [v10 iconImage];
        double v15 = (void *)[v16 initWithImage:v17];

        id v18 = [MEMORY[0x1E4FB1618] clearColor];
        [v15 setBackgroundColor:v18];

        id v19 = [v10 iconImageView];
        [v19 frame];
        double v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        [v15 frame];
        double v29 = v28;
        double v31 = v30;
        v40.origin.x = v21;
        v40.origin.y = v23;
        v40.size.double width = v25;
        v40.size.double height = v27;
        CGFloat v32 = CGRectGetMaxY(v40) - v31;
        uint64_t v33 = [v19 superview];
        objc_msgSend(v33, "convertRect:toView:", 0, v21, v32, v29, v31);
        objc_msgSend(v15, "setFrame:");

        hiddenIconIndexSet = self->_hiddenIconIndexSet;
        if (!hiddenIconIndexSet)
        {
          long long v35 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
          uint64_t v36 = self->_hiddenIconIndexSet;
          self->_hiddenIconIndexSet = v35;

          hiddenIconIndexSet = self->_hiddenIconIndexSet;
        }
        [(NSMutableIndexSet *)hiddenIconIndexSet addIndex:self->_overlaySourceItemIndex];
        [v10 setIconImageHidden:1];

        goto LABEL_12;
      }
    }
    else
    {
    }
    double v15 = 0;
  }
LABEL_12:

LABEL_13:

  return v15;
}

- (void)_reloadEditorialLockupCell:(id)a3 withLockup:(id)a4 index:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = [(SKUIStorePageSection *)self context];
  double v10 = [v33 collectionView];
  double v11 = [v8 layout];
  if (v9) {
    [v9 lockupStyle];
  }
  [v11 setLayoutStyle:0];
  [v11 setVisibleFields:0];
  double v12 = [v9 item];
  [v8 configureForItem:v12 clientContext:self->_clientContext];
  double v13 = [v11 lockupCellLayout];
  CGFloat v32 = [(SKUIGridPageSection *)self _cellImageForItem:v12 lockupSize:0];
  objc_msgSend(v13, "setIconImage:");
  objc_msgSend(v13, "setIconImageHidden:", -[NSMutableIndexSet containsIndex:](self->_hiddenIconIndexSet, "containsIndex:", a5));
  objc_msgSend(v13, "setImageBoundingSize:", self->_lockupImageBoundingSize.width, self->_lockupImageBoundingSize.height);
  double v31 = [(SKUIGridPageSection *)self _editorialLayoutForLockup:v9];
  [v11 applyEditorialLayout:v31 withOrientation:SKUIEditorialLayoutOrientationForView(v10)];
  [v9 editorial];
  unint64_t v14 = v30 = v10;
  double v15 = [v11 textBoxView];
  objc_msgSend(v15, "setNumberOfVisibleLines:", objc_msgSend(v14, "maximumBodyLines"));
  [v15 setTruncationStyle:1];
  moreButtonTitle = self->_moreButtonTitle;
  id v17 = v9;
  if (!moreButtonTitle)
  {
    CGFloat v27 = v12;
    id v28 = v8;
    id v18 = v13;
    id v19 = v17;
    clientContext = self->_clientContext;
    if (clientContext)
    {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"MORE_BUTTON"];
    }
    else
    {
      id v21 = 0;
      +[SKUIClientContext localizedStringForKey:@"MORE_BUTTON" inBundles:0];
    }
    double v22 = (NSString *)objc_claimAutoreleasedReturnValue();

    CGFloat v23 = self->_moreButtonTitle;
    self->_moreButtonTitle = v22;

    moreButtonTitle = self->_moreButtonTitle;
    id v8 = v28;
    id v17 = v19;
    double v13 = v18;
  }
  double v29 = v17;
  objc_msgSend(v15, "setMoreButtonTitle:", moreButtonTitle, v27, v28);
  double v24 = +[SKUIItemStateCenter defaultCenter];
  CGFloat v25 = objc_msgSend(v24, "stateForItemWithIdentifier:", objc_msgSend(v12, "itemIdentifier"));
  [v11 setItemState:v25];
  objc_msgSend(v11, "setRestricted:", objc_msgSend(v24, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v12, "parentalControlsRank")));
  double v26 = [v33 colorScheme];
  [v11 setColoringWithColorScheme:v26];
}

- (void)_reloadItemCell:(id)a3 withLockup:(id)a4 index:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  double v10 = [v8 item];
  [v9 configureForItem:v10 clientContext:self->_clientContext];
  double v11 = [v9 layout];

  objc_msgSend(v11, "setImageBoundingSize:", self->_lockupImageBoundingSize.width, self->_lockupImageBoundingSize.height);
  if (v8) {
    [v8 lockupStyle];
  }
  [v11 setLayoutStyle:0];
  [v11 setLockupSize:0];
  objc_msgSend(v11, "setContentInsets:", 10.0, 15.0, 10.0, 15.0);
  if (v10)
  {
    double v12 = [(SKUIGridPageSection *)self _cellImageForItem:v10 lockupSize:0];
    [v11 setIconImage:v12];
    objc_msgSend(v11, "setIconImageHidden:", -[NSMutableIndexSet containsIndex:](self->_hiddenIconIndexSet, "containsIndex:", a5));
    [v11 setPlaysInlineVideo:!self->_isPad];
    [v11 setVisibleFields:0];
    [v11 setVideoThumbnailImage:0];
    objc_msgSend(v11, "setVideoThumbnailSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  else
  {
    [v11 setIconImage:0];
    [v11 setVideoThumbnailImage:0];
    objc_msgSend(v11, "setVideoThumbnailSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [v11 setVisibleFields:0];
  }
  double v13 = +[SKUIItemStateCenter defaultCenter];
  unint64_t v14 = objc_msgSend(v13, "stateForItemWithIdentifier:", objc_msgSend(v10, "itemIdentifier"));
  [v11 setItemState:v14];
  objc_msgSend(v11, "setRestricted:", objc_msgSend(v13, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v10, "parentalControlsRank")));
}

- (void)_selectItem:(id)a3 withIndex:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(SKUIStorePageSection *)self context];
  id v8 = [(SKUIGridPageSection *)self clickEventWithItem:v6 elementName:*MEMORY[0x1E4FA88E0] index:a4];
  if (v8)
  {
    id v9 = [v7 metricsController];
    [v9 recordEvent:v8];
  }
  double v10 = [v7 parentViewController];
  double v11 = [v10 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v11 sectionsViewController:v10 showProductPageForItem:v6] & 1) == 0)
  {
    double v12 = [(SKUIStorePageSection *)self pageComponent];
    uint64_t v13 = [v12 gridType];

    if (v13 == 5)
    {
      unint64_t v14 = [v6 videos];
      double v15 = [v14 firstObject];
    }
    else
    {
      double v15 = 0;
    }
    id v16 = [v15 URL];
    if (v16 && (BOOL isPad = self->_isPad, v16, isPad))
    {
      CGFloat v25 = [[SKUIPlayableAsset alloc] initWithVideo:v15];
      int64_t v26 = a4;
      id v18 = [(SKUIStorePageSection *)self context];
      id v19 = [v18 clientContext];
      SKUIVideoPreviewPlayPlayableAsset(v25, v19);
      id v21 = v20 = v7;

      double v22 = [(SKUIStorePageSection *)self context];
      CGFloat v23 = [v22 parentViewController];
      [v23 presentViewController:v21 animated:1 completion:0];

      dispatch_time_t v24 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__SKUIGridPageSection__selectItem_withIndex___block_invoke;
      block[3] = &unk_1E6429348;
      block[4] = self;
      id v28 = v6;
      int64_t v29 = v26;
      dispatch_after(v24, MEMORY[0x1E4F14428], block);

      double v7 = v20;
    }
    else
    {
      [(SKUIGridPageSection *)self _showProductPageWithItem:v6 index:a4 animated:1];
    }
  }
}

uint64_t __45__SKUIGridPageSection__selectItem_withIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showProductPageWithItem:*(void *)(a1 + 40) index:*(void *)(a1 + 48) animated:0];
}

- (void)_setPositionForClickEvent:(id)a3 withElementIndex:(int64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    double v7 = [(SKUIStorePageSection *)self context];
    id v10 = [v7 collectionView];

    id v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", a4, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    id v9 = [v10 cellForItemAtIndexPath:v8];

    SKUIMetricsSetClickEventPositionWithView(v6, v9);
  }
}

- (void)_showProductPageWithItem:(id)a3 index:(int64_t)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = v7;
  if (self->_isPad && SKUIItemKindIsSoftwareKind([v7 itemKind]))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__SKUIGridPageSection__showProductPageWithItem_index_animated___block_invoke;
    v9[3] = &unk_1E64248E0;
    v9[4] = self;
    int64_t v11 = a4;
    id v10 = v8;
    [(SKUIStorePageSection *)self sendXEventWithItem:v10 completionBlock:v9];
  }
  else
  {
    [(SKUIStorePageSection *)self showProductViewControllerWithItem:v8];
  }
}

void __63__SKUIGridPageSection__showProductPageWithItem_index_animated___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) context];
    id v9 = [v4 parentViewController];

    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(void *)(v5 + 176))
    {
      id v6 = [[SKUIProductPageOverlayController alloc] initWithParentViewController:v9];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 176);
      *(void *)(v7 + 176) = v6;

      [*(id *)(*(void *)(a1 + 32) + 176) setClientContext:*(void *)(*(void *)(a1 + 32) + 96)];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 176), "setDelegate:");
      uint64_t v5 = *(void *)(a1 + 32);
    }
    *(void *)(v5 + 184) = *(void *)(a1 + 48);
    [*(id *)(*(void *)(a1 + 32) + 176) showWithInitialItem:*(void *)(a1 + 40)];
    [v9 _setActiveProductPageOverlayController:*(void *)(*(void *)(a1 + 32) + 176)];
  }
}

- (void)_updateVisibileEditorialWithEditorialOrientation:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = [(SKUIStorePageSection *)self context];
  uint64_t v5 = [v4 collectionView];

  id v28 = v5;
  id v6 = [v5 indexPathsForVisibleItems];
  int64_t v7 = [(SKUIStorePageSection *)self sectionIndex];
  CGFloat v25 = self;
  id v8 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v9 = [v8 gridType];
  dispatch_time_t v24 = v8;
  CGFloat v27 = [v8 children];
  uint64_t v10 = [v27 count];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v16 section] == v7)
        {
          uint64_t v17 = [v16 item];
          if (v17 < v10)
          {
            uint64_t v18 = v17;
            if (v9 == 1)
            {
              id v19 = [v28 cellForItemAtIndexPath:v16];
              CGFloat v23 = [v27 objectAtIndex:v18];
              id v21 = [(SKUIGridPageSection *)v25 _editorialLayoutForLockup:v23];

              double v22 = [v19 layout];
              [v22 applyEditorialLayout:v21 withOrientation:a3];
            }
            else
            {
              if (v9 != 3) {
                continue;
              }
              id v19 = [v28 cellForItemAtIndexPath:v16];
              double v20 = [v27 objectAtIndex:v18];
              id v21 = [(SKUIGridPageSection *)v25 _editorialLayoutForEditorial:v20];

              double v22 = [v19 layout];
              [v22 applyEditorialLayout:v21 withOrientation:a3 expanded:1];
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }
}

- (id)_videoThumbnailImageForVideo:(id)a3 thumbnailSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [(SKUIStorePageSection *)self context];
  uint64_t v9 = [v8 resourceLoader];

  uint64_t v10 = [(NSMapTable *)self->_artworkRequests objectForKey:v7];
  id v11 = v10;
  if (!v10) {
    goto LABEL_4;
  }
  uint64_t v12 = objc_msgSend(v9, "cachedResourceForRequestIdentifier:", objc_msgSend(v10, "unsignedIntegerValue"));
  if (v12) {
    goto LABEL_12;
  }
  if ((objc_msgSend(v9, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v11, "unsignedIntegerValue")) & 1) == 0) {
LABEL_4:
  }
    -[SKUIGridPageSection _loadImageForVideo:thumbnailSize:loader:reason:](self, "_loadImageForVideo:thumbnailSize:loader:reason:", v7, v9, 1, width, height);
  uint64_t v13 = -[SKUISizeValue initWithSize:]([SKUISizeValue alloc], "initWithSize:", width, height);
  uint64_t v12 = [(NSMutableDictionary *)self->_videoPlaceholderImages objectForKey:v13];
  if (!v12)
  {
    uint64_t v14 = width <= height ? 1 : 2;
    uint64_t v12 = [(SKUIVideoImageDataConsumer *)self->_videoImageDataConsumer imageForColor:0 orientation:v14];
    if (v12) {
      [(NSMutableDictionary *)self->_videoPlaceholderImages setObject:v12 forKey:v13];
    }
  }

LABEL_12:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlaceholderImages, 0);
  objc_storeStrong((id *)&self->_videoImageDataConsumer, 0);
  objc_storeStrong((id *)&self->_lockupArtworkContexts, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_moreButtonTitle, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_hiddenIconIndexSet, 0);
  objc_storeStrong((id *)&self->_editorialLayouts, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_artworkRequests, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGridPageSection initWithPageComponent:]";
}

@end