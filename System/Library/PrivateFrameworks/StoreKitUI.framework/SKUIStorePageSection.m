@interface SKUIStorePageSection
- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3;
- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3;
- (BOOL)containsElementWithIndexBarEntryID:(id)a3;
- (BOOL)fitsToHeight;
- (BOOL)isBottomSection;
- (BOOL)isTopSection;
- (BOOL)performDefaultActionForViewElement:(id)a3;
- (BOOL)requestLayoutWithReloadReason:(int64_t)a3;
- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (CGSize)preferredContentSize;
- (IKColor)backgroundColorForSection;
- (NSArray)indexPathsForBackgroundItems;
- (NSArray)indexPathsForPinningItems;
- (NSIndexPath)firstAppearanceIndexPath;
- (NSSet)relevantEntityProviders;
- (SKUIPageComponent)pageComponent;
- (SKUIStorePageSection)initWithPageComponent:(id)a3;
- (SKUIStorePageSectionContext)context;
- (UIEdgeInsets)sectionContentInset;
- (_NSRange)itemRangeForIndexPathRange:(SKUIIndexPathRange *)a3;
- (double)contentInsetAdjustmentForCollectionView:(id)a3;
- (id)_clickEventWithElementName:(id)a3 index:(int64_t)a4 fieldData:(id)a5;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (id)clickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5;
- (id)clickEventWithLink:(id)a3 elementName:(id)a4 index:(int64_t)a5;
- (id)clickEventWithMedia:(id)a3 elementName:(id)a4 index:(int64_t)a5;
- (id)itemOfferClickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5;
- (id)performItemOfferActionForItem:(id)a3;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (id)targetScrollingIndexPathForElementWithIndexBarEntryID:(id)a3 relativeSectionIndex:(int64_t)a4;
- (int64_t)_itemPinningGroup;
- (int64_t)_itemPinningStyle;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)defaultItemPinningStyle;
- (int64_t)numberOfCells;
- (int64_t)pinningTransitionStyleForItemAtIndexPath:(id)a3;
- (int64_t)sectionIndex;
- (int64_t)updateWithContext:(id)a3 pageComponent:(id)a4;
- (void)_recursivelyAddRelevantEntityProvidersForViewElement:(id)a3 toSet:(id)a4;
- (void)_sendXEventWithDictionary:(id)a3 completionBlock:(id)a4;
- (void)_setContext:(id)a3;
- (void)collectionViewDidConfirmButtonElement:(id)a3 withClickInfo:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionViewDidLongPressItemAtIndexPath:(id)a3;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4;
- (void)playVideoForElement:(id)a3;
- (void)playVideoWithURL:(id)a3;
- (void)productPageOverlayDidDismiss:(id)a3;
- (void)reloadVisibleCellsWithReason:(int64_t)a3;
- (void)sendXEventWithItem:(id)a3 completionBlock:(id)a4;
- (void)sendXEventWithLink:(id)a3 completionBlock:(id)a4;
- (void)setBottomSection:(BOOL)a3;
- (void)setSectionIndex:(int64_t)a3;
- (void)setTopSection:(BOOL)a3;
- (void)showPageWithLink:(id)a3;
- (void)showProductViewControllerWithItem:(id)a3;
@end

@implementation SKUIStorePageSection

- (SKUIStorePageSection)initWithPageComponent:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStorePageSection initWithPageComponent:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIStorePageSection;
  v6 = [(SKUIStorePageSection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_component, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIStorePageSection;
  [(SKUIStorePageSection *)&v3 dealloc];
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  if (a3 != 2)
  {
    relevantEntityProviders = self->_relevantEntityProviders;
    self->_relevantEntityProviders = 0;

    self->_hasValidRelevantEntityProviders = 0;
  }
  v6 = [(SKUIStorePageSection *)self context];
  [(SKUIStorePageSection *)self willAppearInContext:v6];

  return a3;
}

- (id)backgroundColorForIndexPath:(id)a3
{
  objc_super v3 = [(SKUIStorePageSection *)self context];
  v4 = [v3 colorScheme];

  id v5 = [v4 backgroundColor];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  v8 = v7;

  return v8;
}

- (id)cellForIndexPath:(id)a3
{
  return 0;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)clickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  id v8 = a3;
  objc_super v9 = [(SKUIStorePageSection *)self _clickEventWithElementName:a4 index:a5 fieldData:v8];
  if (v9)
  {
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v8, "itemIdentifier"));
    [v9 setTargetIdentifier:v10];

    v11 = [v8 productPageURLString];
    [v9 setTargetURL:v11];
  }

  return v9;
}

- (id)clickEventWithLink:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  id v8 = a3;
  objc_super v9 = [(SKUIStorePageSection *)self _clickEventWithElementName:a4 index:a5 fieldData:v8];
  if (v9)
  {
    v10 = [v8 item];
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v10, "itemIdentifier"));
      [v9 setTargetIdentifier:v12];

      v13 = [v11 productPageURLString];
      [v9 setTargetURL:v13];
    }
    else
    {
      v13 = [v8 URL];
      v14 = [v13 absoluteString];
      [v9 setTargetURL:v14];
    }
  }

  return v9;
}

- (id)clickEventWithMedia:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 mediaType])
  {
    v10 = [(SKUIStorePageSection *)self _clickEventWithElementName:v9 index:a5 fieldData:v8];
    if (!v10) {
      goto LABEL_10;
    }
    uint64_t v11 = [v8 mediaIdentifier];
    if (v11)
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", v11);
      [v10 setTargetIdentifier:v12];
    }
    v13 = [v8 mediaURLString];
    [v10 setTargetURL:v13];
  }
  else
  {
    v13 = [v8 link];
    if (v13)
    {
      v10 = [(SKUIStorePageSection *)self clickEventWithLink:v13 elementName:v9 index:a5];
    }
    else
    {
      v10 = 0;
    }
  }

LABEL_10:

  return v10;
}

- (void)collectionViewDidConfirmButtonElement:(id)a3 withClickInfo:(id)a4 forItemAtIndexPath:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 itemIdentifier];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = +[SKUIItemStateCenter defaultCenter];
    uint64_t v11 = [v10 stateForItemWithIdentifier:v9];

    if (v11)
    {
      v12 = [v6 buyButtonDescriptor];
      int v13 = [v12 canPerformLocalActionWithItemState:v11];

      if (v13)
      {
        char v14 = [v11 state];
        if ((v14 & 2) != 0)
        {
          id v15 = +[SKUIItemStateCenter defaultCenter];
          [v15 cancelDownloadForItemWithIdentifier:v9];
LABEL_14:

          uint64_t v18 = 6;
          goto LABEL_10;
        }
        if ((v14 & 0x40) != 0)
        {
          v19 = [v6 personalizationLibraryItems];
          id v15 = [v19 anyObject];

          v16 = +[SKUIItemStateCenter defaultCenter];
          [v16 performActionForLibraryItem:v15];
          goto LABEL_13;
        }
        if ((v14 & 0x24) == 4)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
          v16 = [NSNumber numberWithLongLong:v9];
          v20[0] = v16;
          v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
          [v15 getLibraryItemsForITunesStoreItemIdentifiers:v17 completionBlock:&__block_literal_global_10];

LABEL_13:
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v18 = 2;
LABEL_10:
  [v6 dispatchEventOfType:v18 canBubble:1 isCancelable:1 extraInfo:v7 completionBlock:0];
}

void __95__SKUIStorePageSection_collectionViewDidConfirmButtonElement_withClickInfo_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 firstObject];
  v2 = [v5 valueForProperty:*MEMORY[0x1E4FA8928]];
  double v3 = v2;
  if (v2)
  {
    id v4 = v2;
    SKUIMetricsLaunchApplicationWithIdentifier((uint64_t)v4, 0);
    CFRelease(v4);
  }
}

- (void)collectionViewDidLongPressItemAtIndexPath:(id)a3
{
  double v3 = [(SKUIStorePageSection *)self pageComponent];
  id v4 = [v3 viewElement];

  [v4 dispatchEventOfType:3 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3
{
  return 1;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v11 = a3;
  if ([(SKUIStorePageSection *)self fitsToHeight])
  {
    id v4 = [(SKUIStorePageSectionContext *)self->_context collectionView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    [v4 contentInset];
    [v11 frame];
    objc_msgSend(v11, "setFrame:");
    objc_msgSend(v11, "setSize:", v6, v8);
  }
  uint64_t v9 = [v11 indexPath];
  v10 = [(SKUIStorePageSection *)self backgroundColorForIndexPath:v9];
  [v11 setBackgroundColor:v10];
}

- (BOOL)containsElementWithIndexBarEntryID:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];
  double v7 = [v6 firstDescendentWithIndexBarEntryID:v4];

  return v7 != 0;
}

- (double)contentInsetAdjustmentForCollectionView:(id)a3
{
  return 0.0;
}

- (int64_t)defaultItemPinningStyle
{
  return 0;
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v7 = [(SKUIStorePageSection *)self context];
  double v5 = [v7 collectionView];
  double v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
  [v5 reloadSections:v6];
}

- (NSIndexPath)firstAppearanceIndexPath
{
  return 0;
}

- (BOOL)fitsToHeight
{
  return 0;
}

- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4
{
}

- (NSArray)indexPathsForPinningItems
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(SKUIStorePageSection *)self numberOfCells] == 1
    && [(SKUIStorePageSection *)self _itemPinningStyle])
  {
    double v3 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (id)itemOfferClickEventWithItem:(id)a3 elementName:(id)a4 index:(int64_t)a5
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(SKUIStorePageSection *)self context];
  id v11 = [v10 metricsController];
  v12 = [v11 itemOfferClickEventWithItem:v8 locationPosition:a5];
  if (v12)
  {
    int v13 = [v11 locationWithPosition:0 type:*MEMORY[0x1E4FA88D0] fieldData:0];
    char v14 = [(SKUIStorePageSection *)self pageComponent];
    id v15 = [v11 locationWithPageComponent:v14];

    uint64_t v16 = [v11 locationWithPosition:a5 type:v9 fieldData:v8];
    v17 = (void *)v16;
    if (v13) {
      BOOL v18 = v15 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (!v18 && v16 != 0)
    {
      v24[0] = v13;
      v24[1] = v16;
      v24[2] = v15;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
      [v12 setLocationWithEventLocations:v20];
    }
    v21 = [v10 parentViewController];
    v22 = [v21 _visibleMetricsImpressionsString];
    [v12 setImpressions:v22];
  }

  return v12;
}

- (_NSRange)itemRangeForIndexPathRange:(SKUIIndexPathRange *)a3
{
  int64_t v5 = [(SKUIStorePageSection *)self sectionIndex];
  if (a3->var0 >= v5) {
    int64_t var1 = a3->var1;
  }
  else {
    int64_t var1 = 0;
  }
  if (a3->var2 == v5) {
    int64_t v7 = a3->var3 + 1;
  }
  else {
    int64_t v7 = [(SKUIStorePageSection *)self numberOfCells];
  }
  NSUInteger v8 = v7 - var1;
  NSUInteger v9 = var1;
  result.length = v8;
  result.location = v9;
  return result;
}

- (int64_t)numberOfCells
{
  return 0;
}

- (BOOL)performDefaultActionForViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  if (v5 == 14)
  {
LABEL_4:
    id v6 = [v4 firstChildForElementType:152];
    goto LABEL_6;
  }
  if (v5 != 152)
  {
    if (v5 != 66)
    {
LABEL_9:
      LOBYTE(v8) = 0;
      goto LABEL_12;
    }
    goto LABEL_4;
  }
  id v6 = v4;
LABEL_6:
  int64_t v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  int v8 = [v6 isEnabled];
  if (v8) {
    [(SKUIStorePageSection *)self playVideoForElement:v7];
  }
  else {
    [v4 dispatchEvent:0x1F1C94B88 eventAttribute:0x1F1C94BA8 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
  }

LABEL_12:
  return v8;
}

- (id)performItemOfferActionForItem:(id)a3
{
  id v4 = a3;
  if (SKUIItemKindIsSoftwareKind([v4 itemKind]))
  {
    uint64_t v5 = [(SKUIStorePageSection *)self context];
    id v6 = [v5 parentViewController];
    int64_t v7 = [v6 clientContext];

    int v8 = [v5 metricsController];
    NSUInteger v9 = v8;
    if (v8)
    {
      v10 = [v8 performActionForItem:v4 clientContext:v7];
    }
    else
    {
      id v11 = +[SKUIItemStateCenter defaultCenter];
      v10 = [v11 performActionForItem:v4 clientContext:v7];
    }
  }
  else
  {
    [(SKUIStorePageSection *)self showProductViewControllerWithItem:v4];
    v10 = 0;
  }

  return v10;
}

- (int64_t)pinningTransitionStyleForItemAtIndexPath:(id)a3
{
  double v3 = [(SKUIStorePageSection *)self context];
  int64_t v4 = [v3 defaultPinningTransitionStyle];

  return v4;
}

- (void)playVideoForElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 assets];
  id v6 = (void *)[v5 copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SKUIStorePageSection_playVideoForElement___block_invoke;
  v8[3] = &unk_1E6425468;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __44__SKUIStorePageSection_playVideoForElement___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  int v13 = [[SKUIPlayableAsset alloc] initWithVideoViewElement:*(void *)(a1 + 32) assetViewElement:v6];

  id v7 = *(void **)(a1 + 32);
  int v8 = [*(id *)(a1 + 40) context];
  id v9 = [v8 clientContext];
  v10 = SKUIVideoPreviewPlayPlayableVideoWithAsset(v7, v13, v9);

  if (v10)
  {
    id v11 = [*(id *)(a1 + 40) context];
    v12 = [v11 parentViewController];

    [v12 presentViewController:v10 animated:1 completion:0];
    SKUIVideoPreviewDismissOnEnterBackground(v10);
    *a4 = 1;
  }
}

- (void)playVideoWithURL:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v10 = [[SKUIPlayableAsset alloc] initWithContentURL:v4];

    uint64_t v5 = [(SKUIStorePageSection *)self context];
    id v6 = [v5 clientContext];
    id v7 = SKUIVideoPreviewPlayPlayableAsset(v10, v6);

    if (v7)
    {
      int v8 = [(SKUIStorePageSection *)self context];
      id v9 = [v8 parentViewController];

      [v9 presentViewController:v7 animated:1 completion:0];
      SKUIVideoPreviewDismissOnEnterBackground(v7);
    }
  }
}

- (CGSize)preferredContentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  return 0;
}

- (NSSet)relevantEntityProviders
{
  if (!self->_hasValidRelevantEntityProviders)
  {
    self->_hasValidRelevantEntityProviders = 1;
    double v3 = [(SKUIStorePageSection *)self pageComponent];
    id v4 = [v3 viewElement];

    if (v4)
    {
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
      [(SKUIStorePageSection *)self _recursivelyAddRelevantEntityProvidersForViewElement:v4 toSet:v5];
    }
    else
    {
      uint64_t v5 = 0;
    }
    if ([v5 count]) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    objc_storeStrong((id *)&self->_relevantEntityProviders, v6);
  }
  relevantEntityProviders = self->_relevantEntityProviders;

  return relevantEntityProviders;
}

- (void)reloadVisibleCellsWithReason:(int64_t)a3
{
  uint64_t v5 = [(SKUIStorePageSection *)self context];
  id v6 = [v5 collectionView];

  id v7 = [v6 indexPathsForVisibleItems];
  int64_t v8 = [(SKUIStorePageSection *)self sectionIndex];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SKUIStorePageSection_reloadVisibleCellsWithReason___block_invoke;
  v9[3] = &unk_1E6425490;
  v9[4] = self;
  v9[5] = v8;
  v9[6] = a3;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __53__SKUIStorePageSection_reloadVisibleCellsWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 section] == *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) reloadCellWithIndexPath:v3 reason:*(void *)(a1 + 48)];
  }
}

- (BOOL)requestLayoutWithReloadReason:(int64_t)a3
{
  return 0;
}

- (UIEdgeInsets)sectionContentInset
{
  double v2 = [(SKUIStorePageSection *)self pageComponent];
  id v3 = [v2 viewElement];

  if (v3)
  {
    double v4 = 15.0;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }
  else
  {
    double v6 = *MEMORY[0x1E4FB2848];
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  result.right = v7;
  result.bottom = v4;
  result.left = v5;
  result.top = v6;
  return result;
}

- (void)sendXEventWithItem:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [a3 lookupDictionary];
  [(SKUIStorePageSection *)self _sendXEventWithDictionary:v7 completionBlock:v6];
}

- (void)sendXEventWithLink:(id)a3 completionBlock:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 item];
  if (v7)
  {
    [(SKUIStorePageSection *)self sendXEventWithItem:v7 completionBlock:v6];
  }
  else
  {
    int64_t v8 = [v9 linkDictionary];
    [(SKUIStorePageSection *)self _sendXEventWithDictionary:v8 completionBlock:v6];
  }
}

- (void)showPageWithLink:(id)a3
{
  id v4 = a3;
  double v5 = [v4 item];
  uint64_t v6 = [v4 URL];
  id v7 = (void *)v6;
  if (!v5)
  {
    if (!v6) {
      goto LABEL_17;
    }
    int64_t v8 = [(SKUIStorePageSection *)self context];
    id v9 = [v8 parentViewController];

    v10 = [v9 delegate];
    if (objc_opt_respondsToSelector())
    {
      if ([v10 sectionsViewController:v9 showStorePageForURL:v7]) {
        goto LABEL_16;
      }
    }
    else
    {
      id v11 = [v4 targetString];
      int v12 = [v11 isEqualToString:@"external"];

      if (v12)
      {
        uint64_t v13 = SKUIMobileCoreServicesFramework();
        objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Lsapplicationw.isa, v13), "defaultWorkspace");
        char v14 = (SKUIURL *)objc_claimAutoreleasedReturnValue();
        [(SKUIURL *)v14 openSensitiveURL:v7 withOptions:0];
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
    }
    char v14 = [[SKUIURL alloc] initWithURL:v7];
    id v15 = [(SKUIURL *)v14 actionString];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4FB1438] sharedApplication];
      v17 = [v16 delegate];

      if (objc_opt_respondsToSelector())
      {
        BOOL v18 = [MEMORY[0x1E4FB1438] sharedApplication];
        [v17 application:v18 openURL:v7 sourceApplication:0 annotation:MEMORY[0x1E4F1CC08]];
      }
      else
      {
        uint64_t v19 = SKUIMobileCoreServicesFramework();
        BOOL v18 = objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Lsapplicationw.isa, v19), "defaultWorkspace");
        [v18 openSensitiveURL:v7 withOptions:0];
      }
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __41__SKUIStorePageSection_showPageWithLink___block_invoke;
      v20[3] = &unk_1E64254B8;
      id v21 = v9;
      id v22 = v4;
      id v23 = v7;
      [(SKUIStorePageSection *)self sendXEventWithLink:v22 completionBlock:v20];
    }
    goto LABEL_15;
  }
  [(SKUIStorePageSection *)self showProductViewControllerWithItem:v5];
LABEL_17:
}

void __41__SKUIStorePageSection_showPageWithLink___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v7 = objc_alloc_init(SKUIStorePageViewController);
    id v4 = [*(id *)(a1 + 32) clientContext];
    [(SKUIStorePageViewController *)v7 setClientContext:v4];

    double v5 = [*(id *)(a1 + 40) title];
    [(SKUIStorePageViewController *)v7 setTitle:v5];

    [(SKUIStorePageViewController *)v7 loadURL:*(void *)(a1 + 48) withCompletionBlock:0];
    uint64_t v6 = [*(id *)(a1 + 32) navigationController];
    [v6 pushViewController:v7 animated:1];
  }
}

- (void)showProductViewControllerWithItem:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self context];
  uint64_t v6 = [v5 parentViewController];

  id v7 = [v6 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v7 sectionsViewController:v6 showProductPageForItem:v4] & 1) == 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__SKUIStorePageSection_showProductViewControllerWithItem___block_invoke;
    v8[3] = &unk_1E64254B8;
    id v9 = v4;
    id v10 = v6;
    id v11 = self;
    [(SKUIStorePageSection *)self sendXEventWithItem:v9 completionBlock:v8];
  }
}

void __58__SKUIStorePageSection_showProductViewControllerWithItem___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (SKUIItemKindIsSoftwareKind([*(id *)(a1 + 32) itemKind]))
    {
      id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v4 = [v3 userInterfaceIdiom];

      if (v4)
      {
        if (!*(void *)(*(void *)(a1 + 48) + 40))
        {
          double v5 = [[SKUIProductPageOverlayController alloc] initWithParentViewController:*(void *)(a1 + 40)];
          uint64_t v6 = *(void *)(a1 + 48);
          id v7 = *(void **)(v6 + 40);
          *(void *)(v6 + 40) = v5;

          int64_t v8 = *(void **)(*(void *)(a1 + 48) + 40);
          id v9 = [*(id *)(a1 + 40) clientContext];
          [v8 setClientContext:v9];

          objc_msgSend(*(id *)(*(void *)(a1 + 48) + 40), "setDelegate:");
          [*(id *)(*(void *)(a1 + 48) + 40) showWithInitialItem:*(void *)(a1 + 32)];
          id v10 = *(void **)(a1 + 40);
          uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 40);
          [v10 _setActiveProductPageOverlayController:v11];
        }
      }
      else
      {
        uint64_t v19 = [[SKUIIPhoneProductPageViewController alloc] initWithItem:*(void *)(a1 + 32)];
        v17 = [*(id *)(a1 + 40) clientContext];
        [(SKUIViewController *)v19 setClientContext:v17];

        BOOL v18 = [*(id *)(a1 + 40) navigationController];
        [v18 pushViewController:v19 animated:1];
      }
    }
    else
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F3C310]);
      [v12 setAutomaticallyDismisses:1];
      id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      char v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "itemIdentifier"));
      id v15 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, *MEMORY[0x1E4F3C3A8], 0);

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __58__SKUIStorePageSection_showProductViewControllerWithItem___block_invoke_2;
      v20[3] = &unk_1E64253F8;
      id v21 = v12;
      id v16 = v12;
      [v16 loadProductWithParameters:v15 completionBlock:v20];
      [*(id *)(a1 + 40) presentViewController:v16 animated:1 completion:0];
    }
  }
}

uint64_t __58__SKUIStorePageSection_showProductViewControllerWithItem___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

- (id)targetScrollingIndexPathForElementWithIndexBarEntryID:(id)a3 relativeSectionIndex:(int64_t)a4
{
  uint64_t v6 = [(SKUIStorePageSection *)self numberOfCells];
  if (v6 < 1)
  {
    id v7 = 0;
  }
  else
  {
    if (v6 - 1 < a4) {
      a4 = v6 - 1;
    }
    id v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", a4, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
  }

  return v7;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (int64_t)updateWithContext:(id)a3 pageComponent:(id)a4
{
  id v6 = a3;
  id v7 = (SKUIPageComponent *)a4;
  int64_t v8 = [(SKUIPageComponent *)v7 viewElement];
  if ([v8 updateType])
  {
    uint64_t v9 = 0;
  }
  else
  {
    [v6 activePageWidth];
    double v11 = v10;
    id v12 = [(SKUIStorePageSection *)self context];
    [v12 activePageWidth];
    double v14 = vabdd_f64(v11, v13);

    if (v14 > 0.00000011920929) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  [(SKUIStorePageSection *)self _setContext:v6];
  component = self->_component;
  self->_component = v7;

  int64_t v16 = [(SKUIStorePageSection *)self applyUpdateType:v9];
  return v16;
}

- (void)productPageOverlayDidDismiss:(id)a3
{
  uint64_t v4 = [(SKUIStorePageSection *)self context];
  double v5 = [v4 parentViewController];
  [v5 _pageSectionDidDismissOverlayController:self->_overlayController];

  [(SKUIProductPageOverlayController *)self->_overlayController setDelegate:0];
  overlayController = self->_overlayController;
  self->_overlayController = 0;
}

- (void)_setContext:(id)a3
{
  double v5 = (SKUIStorePageSectionContext *)a3;
  context = self->_context;
  p_context = &self->_context;
  if (context != v5)
  {
    int64_t v8 = v5;
    objc_storeStrong((id *)p_context, a3);
    double v5 = v8;
  }
}

- (id)_clickEventWithElementName:(id)a3 index:(int64_t)a4 fieldData:(id)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  double v10 = [(SKUIStorePageSection *)self context];
  double v11 = [v10 metricsController];
  if ([v11 canRecordEventWithType:*MEMORY[0x1E4FA8878]])
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4FA8200]);
    [v12 setTargetType:v8];
    double v13 = [(SKUIStorePageSection *)self pageComponent];
    double v14 = [v11 locationWithPageComponent:v13];

    uint64_t v15 = [v11 locationWithPosition:a4 type:v8 fieldData:v9];
    int64_t v16 = (void *)v15;
    if (v14 && v15)
    {
      v21[0] = v15;
      v21[1] = v14;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
      [v12 setLocationWithEventLocations:v17];
    }
    BOOL v18 = [v10 parentViewController];
    uint64_t v19 = [v18 _visibleMetricsImpressionsString];
    [v12 setImpressions:v19];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (int64_t)_itemPinningStyle
{
  id v3 = [(SKUIStorePageSection *)self pageComponent];
  uint64_t v4 = [v3 viewElement];

  if (v4)
  {
    int64_t v5 = 1;
    switch([v4 pinStyle])
    {
      case 1:
        int64_t v5 = 0;
        break;
      case 2:
        break;
      case 3:
        int64_t v5 = 2;
        break;
      case 4:
        int64_t v5 = 3;
        break;
      case 5:
        int64_t v5 = 4;
        break;
      default:
        goto LABEL_3;
    }
  }
  else
  {
LABEL_3:
    int64_t v5 = [(SKUIStorePageSection *)self defaultItemPinningStyle];
  }

  return v5;
}

- (int64_t)_itemPinningGroup
{
  uint64_t v2 = [(SKUIStorePageSection *)self pageComponent];
  id v3 = [v2 viewElement];

  int64_t v4 = [v3 pinGroup];
  return v4;
}

- (void)_recursivelyAddRelevantEntityProvidersForViewElement:(id)a3 toSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 explicitEntityProvider];
    if (v8) {
      [v7 addObject:v8];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__SKUIStorePageSection__recursivelyAddRelevantEntityProvidersForViewElement_toSet___block_invoke;
    v9[3] = &unk_1E64243A8;
    v9[4] = self;
    id v10 = v7;
    [v6 enumerateChildrenUsingBlock:v9];
  }
}

uint64_t __83__SKUIStorePageSection__recursivelyAddRelevantEntityProvidersForViewElement_toSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _recursivelyAddRelevantEntityProvidersForViewElement:a2 toSet:*(void *)(a1 + 40)];
}

- (void)_sendXEventWithDictionary:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SKUIStorePageSection *)self context];
  id v9 = [v8 parentViewController];
  id v10 = [v9 clientContext];

  if (v10)
  {
    double v11 = SKUIXEventSidepackDictionary((uint64_t)v6);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__SKUIStorePageSection__sendXEventWithDictionary_completionBlock___block_invoke;
    v12[3] = &unk_1E64224E8;
    id v13 = v7;
    [v10 sendOnXEventWithDictionary:v11 completionBlock:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __66__SKUIStorePageSection__sendXEventWithDictionary_completionBlock___block_invoke(uint64_t a1, char a2)
{
  if (*(void *)(a1 + 32))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __66__SKUIStorePageSection__sendXEventWithDictionary_completionBlock___block_invoke_2;
    v3[3] = &unk_1E64254E0;
    id v4 = *(id *)(a1 + 32);
    char v5 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
}

uint64_t __66__SKUIStorePageSection__sendXEventWithDictionary_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isBottomSection
{
  return self->_bottomSection;
}

- (void)setBottomSection:(BOOL)a3
{
  self->_bottomSection = a3;
}

- (SKUIStorePageSectionContext)context
{
  return self->_context;
}

- (SKUIPageComponent)pageComponent
{
  return self->_component;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (BOOL)isTopSection
{
  return self->_topSection;
}

- (void)setTopSection:(BOOL)a3
{
  self->_topSection = a3;
}

- (IKColor)backgroundColorForSection
{
  return self->_backgroundColorForSection;
}

- (NSArray)indexPathsForBackgroundItems
{
  return self->_indexPathsForBackgroundItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathsForBackgroundItems, 0);
  objc_storeStrong((id *)&self->_backgroundColorForSection, 0);
  objc_storeStrong((id *)&self->_relevantEntityProviders, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_component, 0);
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStorePageSection initWithPageComponent:]";
}

@end