@interface SUUIReviewListPageSection
- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (NSMutableDictionary)contextActionsRegistration;
- (SUUIReviewListPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)_contentInsetForReviewIndex:(int64_t)a3;
- (id)_contextActionRegistrationKeyWithCell:(id)a3 indexPath:(id)a4;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)_requestCellLayout;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)registerContextActionsForCell:(id)a3 indexPath:(id)a4 viewController:(id)a5;
- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4;
- (void)setContextActionsRegistration:(id)a3;
- (void)unregisterContextActionsForCell:(id)a3 indexPath:(id)a4 viewController:(id)a5;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIReviewListPageSection

- (SUUIReviewListPageSection)initWithPageComponent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIReviewListPageSection;
  v3 = [(SUUIStorePageSection *)&v7 initWithPageComponent:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    contextActionsRegistration = v3->_contextActionsRegistration;
    v3->_contextActionsRegistration = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SUUIStorePageSection *)self pageComponent];
  v9 = [v8 viewElement];
  [v6 addItemViewElement:v9];

  v10 = [(SUUIStorePageSection *)self pageComponent];
  v11 = [v10 viewElement];
  v12 = [v11 items];
  uint64_t v13 = [v7 item];

  id v14 = [v12 objectAtIndex:v13];

  [v6 addItemViewElement:v14];
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 item];
  id v6 = [(SUUIStorePageSection *)self context];
  id v7 = [(SUUIStorePageSection *)self pageComponent];
  v8 = [v7 viewElement];
  v9 = [v8 items];
  v10 = [v9 objectAtIndex:v5];

  v11 = [v6 collectionView];
  v12 = [v11 dequeueReusableCellWithReuseIdentifier:0x2705014B0 forIndexPath:v4];

  [v12 setSeparatorStyle:5];
  uint64_t v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  [v12 setSeparatorColor:v13];

  [v6 activePageWidth];
  double v15 = v14 + -30.0;
  [(SUUIReviewListPageSection *)self _contentInsetForReviewIndex:v5];
  objc_msgSend(v12, "setContentInset:");
  [v12 reloadWithViewElement:v10 width:self->_cellLayoutContext context:v15];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __46__SUUIReviewListPageSection_cellForIndexPath___block_invoke;
  v29[3] = &unk_265402438;
  id v16 = v10;
  double v34 = v15;
  id v30 = v16;
  v31 = self;
  id v17 = v6;
  id v32 = v17;
  id v18 = v4;
  id v33 = v18;
  [v12 setDescriptionTapAction:v29];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__SUUIReviewListPageSection_cellForIndexPath___block_invoke_2;
  v23[3] = &unk_265402438;
  double v28 = v15;
  id v24 = v16;
  v25 = self;
  id v26 = v17;
  id v27 = v18;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  [v12 setResponseDescriptionTapAction:v23];

  return v12;
}

void __46__SUUIReviewListPageSection_cellForIndexPath___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) expandableLabelElementForWidth:*(void *)(*(void *)(a1 + 40) + 88) context:*(double *)(a1 + 64)];
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 40) + 88) expandEditorialForLabelElement:v2];
    v3 = [*(id *)(a1 + 48) collectionView];
    v5[0] = *(void *)(a1 + 56);
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
    [v3 reloadItemsAtIndexPaths:v4];
  }
}

void __46__SUUIReviewListPageSection_cellForIndexPath___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __46__SUUIReviewListPageSection_cellForIndexPath___block_invoke_3;
  v5[3] = &unk_265402460;
  v5[6] = *(void *)(a1 + 64);
  v5[4] = *(void *)(a1 + 40);
  v5[5] = &v6;
  [v2 enumerateChildrenUsingBlock:v5];
  if (v7[5])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "expandEditorialForLabelElement:");
    v3 = [*(id *)(a1 + 48) collectionView];
    v12[0] = *(void *)(a1 + 56);
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    [v3 reloadItemsAtIndexPaths:v4];
  }
  _Block_object_dispose(&v6, 8);
}

void __46__SUUIReviewListPageSection_cellForIndexPath___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if ([v8 elementType] == 102)
  {
    uint64_t v5 = [v8 expandableLabelElementForWidth:*(void *)(*(void *)(a1 + 32) + 88) context:*(double *)(a1 + 48)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *a3 = 1;
  }
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self context];
  [v5 activePageWidth];
  double v7 = v6;

  uint64_t v8 = [v4 item];
  v9 = [(SUUIStorePageSection *)self pageComponent];
  v10 = [v9 viewElement];
  id v11 = [v10 items];
  v12 = [v11 objectAtIndex:v8];

  +[SUUIReviewCollectionViewCell sizeThatFitsWidth:v12 viewElement:self->_cellLayoutContext context:v7 + -30.0];
  double v14 = v13 + 15.0;

  double v15 = v7;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];
  double v7 = [v6 items];
  uint64_t v8 = [v4 item];

  id v9 = [v7 objectAtIndex:v8];

  [v9 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  v3 = [(SUUIStorePageSection *)self pageComponent];
  id v4 = [v3 viewElement];
  uint64_t v5 = [v4 attributes];
  double v6 = [v5 valueForKey:@"highlight"];

  if ([v6 length]) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];
  char v7 = [v6 items];
  uint64_t v8 = [v7 count];

  id v9 = [v4 indexPath];
  uint64_t v10 = [v9 item];

  uint64_t v11 = v8 - 1;
  if (v10 < 1 || v10 >= v11)
  {
    uint64_t v13 = 5;
    if (!v10) {
      uint64_t v13 = 13;
    }
    if (v10 == v11) {
      uint64_t v12 = v13 | 0x20;
    }
    else {
      uint64_t v12 = v13;
    }
  }
  else
  {
    uint64_t v12 = 21;
  }
  [v4 setPosition:v12];
  v14.receiver = self;
  v14.super_class = (Class)SUUIReviewListPageSection;
  [(SUUIStorePageSection *)&v14 collectionViewWillApplyLayoutAttributes:v4];
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self context];
  double v6 = [v5 activeMetricsImpressionSession];

  char v7 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v8 = [v7 viewElement];

  [v6 beginActiveImpressionForViewElement:v8];
  id v9 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v10 = [v9 viewElement];
  uint64_t v11 = [v10 items];
  uint64_t v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v4, "item"));

  [v6 beginActiveImpressionForViewElement:v12];
  v13.receiver = self;
  v13.super_class = (Class)SUUIReviewListPageSection;
  [(SUUIStorePageSection *)&v13 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)registerContextActionsForCell:(id)a3 indexPath:(id)a4 viewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v12 = [v11 viewElement];
  objc_super v13 = [v12 items];
  objc_super v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v9, "item"));

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v15 = [v14 dialogTemplate];

    if (v15)
    {
      double v16 = [(SUUIReviewListPageSection *)self _contextActionRegistrationKeyWithCell:v8 indexPath:v9];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __84__SUUIReviewListPageSection_registerContextActionsForCell_indexPath_viewController___block_invoke;
      v19[3] = &unk_265402488;
      id v20 = v14;
      id v17 = [v10 registerForPreviewingFromSourceView:v8 handler:v19];
      id v18 = [(SUUIReviewListPageSection *)self contextActionsRegistration];
      [v18 setObject:v17 forKeyedSubscript:v16];
    }
  }
}

SUUIContextActionsConfiguration *__84__SUUIReviewListPageSection_registerContextActionsForCell_indexPath_viewController___block_invoke(uint64_t a1)
{
  v2 = [SUUIContextActionsConfiguration alloc];
  v3 = [*(id *)(a1 + 32) dialogTemplate];
  id v4 = [(SUUIContextActionsConfiguration *)v2 initWithDialogTemplate:v3];

  return v4;
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self context];
  double v6 = [v5 activeMetricsImpressionSession];

  char v7 = [(SUUIStorePageSection *)self pageComponent];
  id v8 = [v7 viewElement];

  [v6 endActiveImpressionForViewElement:v8];
  unint64_t v9 = [v4 item];
  id v10 = [v8 items];
  if (v9 < [v10 count])
  {
    uint64_t v11 = [v10 objectAtIndex:v9];

    [v6 endActiveImpressionForViewElement:v11];
    id v8 = (void *)v11;
  }
  v12.receiver = self;
  v12.super_class = (Class)SUUIReviewListPageSection;
  [(SUUIStorePageSection *)&v12 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (void)unregisterContextActionsForCell:(id)a3 indexPath:(id)a4 viewController:(id)a5
{
  id v12 = a5;
  id v8 = [(SUUIReviewListPageSection *)self _contextActionRegistrationKeyWithCell:a3 indexPath:a4];
  unint64_t v9 = [(SUUIReviewListPageSection *)self contextActionsRegistration];
  id v10 = [v9 objectForKeyedSubscript:v8];

  if (v10)
  {
    [v12 unregisterForPreviewing:v10];
    uint64_t v11 = [(SUUIReviewListPageSection *)self contextActionsRegistration];
    [v11 removeObjectForKey:v8];
  }
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SUUIReviewListPageSection *)self _requestCellLayout];
  v8.receiver = self;
  v8.super_class = (Class)SUUIReviewListPageSection;
  [(SUUIStorePageSection *)&v8 entityProvider:v7 didInvalidateWithContext:v6];
}

- (int64_t)numberOfCells
{
  v2 = [(SUUIStorePageSection *)self pageComponent];
  v3 = [v2 viewElement];
  id v4 = [v3 items];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v15 = a3;
  int64_t v5 = [(SUUIStorePageSection *)self context];
  id v6 = [v5 collectionView];
  id v7 = [v6 cellForItemAtIndexPath:v15];

  if (v7)
  {
    uint64_t v8 = [v15 item];
    unint64_t v9 = [(SUUIStorePageSection *)self pageComponent];
    id v10 = [v9 viewElement];
    uint64_t v11 = [v10 items];

    [v5 activePageWidth];
    double v13 = v12 + -30.0;
    [(SUUIReviewListPageSection *)self _contentInsetForReviewIndex:v8];
    objc_msgSend(v7, "setContentInset:");
    objc_super v14 = [v11 objectAtIndex:v8];
    [v7 reloadWithViewElement:v14 width:self->_cellLayoutContext context:v13];
  }
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2705014B0];
  id v6 = self->_cellLayoutContext;
  id v7 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v6];
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  unint64_t v9 = [(SUUIStorePageSection *)self pageComponent];
  id v10 = [v9 viewElement];

  -[SUUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", [v10 elementType]);
  [(SUUIReviewListPageSection *)self _requestCellLayout];
  v11.receiver = self;
  v11.super_class = (Class)SUUIReviewListPageSection;
  [(SUUIStorePageSection *)&v11 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  id v8 = a4;
  [(SUUIViewElementLayoutContext *)cellLayoutContext invalidateAllEditorialLayouts];
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setActivePageWidth:width];
  [(SUUIReviewListPageSection *)self _requestCellLayout];
  v9.receiver = self;
  v9.super_class = (Class)SUUIReviewListPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (id)_contextActionRegistrationKeyWithCell:(id)a3 indexPath:(id)a4
{
  int64_t v5 = NSNumber;
  id v6 = a4;
  uint64_t v7 = [a3 hash];
  uint64_t v8 = [v6 hash];

  objc_super v9 = [v5 numberWithUnsignedInteger:v8 + v7];
  id v10 = [v9 stringValue];

  return v10;
}

- (UIEdgeInsets)_contentInsetForReviewIndex:(int64_t)a3
{
  double v3 = 15.0;
  if (!a3) {
    double v3 = 0.0;
  }
  double v4 = 15.0;
  double v5 = 15.0;
  double v6 = 15.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)_requestCellLayout
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v3 = [(SUUIStorePageSection *)self pageComponent];
  double v4 = [v3 viewElement];

  double v5 = [v4 items];
  double v6 = [(SUUIStorePageSection *)self context];
  [v6 activePageWidth];
  double v8 = v7;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    double v12 = v8 + -30.0;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v9);
        }
        +[SUUIReviewCollectionViewCell requestLayoutForViewElement:width:context:](SUUIReviewCollectionViewCell, "requestLayoutForViewElement:width:context:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), self->_cellLayoutContext, v12, (void)v15);
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (NSMutableDictionary)contextActionsRegistration
{
  return self->_contextActionsRegistration;
}

- (void)setContextActionsRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextActionsRegistration, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

@end