@interface SUUIRowViewElementPageSection
- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3;
- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3;
- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (Class)_cellClassForCardViewElement:(id)a3;
- (Class)_cellClassForLockupViewElement:(id)a3;
- (Class)_cellClassForViewElement:(id)a3;
- (SUUIRowViewElementPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)_contentInsetForIndexPath:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (double)_interiorColumnSpacing;
- (double)_singleColumnWidth;
- (id)_firstChildForColumn:(id)a3;
- (id)_reuseIdentifierForCardViewElement:(id)a3;
- (id)_reuseIdentifierForLockupViewElement:(id)a3;
- (id)_reuseIdentifierForViewElement:(id)a3;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)_enumerateViewElementsUsingBlock:(id)a3;
- (void)_requestLayoutForCells;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIRowViewElementPageSection

- (SUUIRowViewElementPageSection)initWithPageComponent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIRowViewElementPageSection;
  return [(SUUIStorePageSection *)&v4 initWithPageComponent:a3];
}

- (void)dealloc
{
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIRowViewElementPageSection;
  [(SUUIStorePageSection *)&v3 dealloc];
}

- (UIEdgeInsets)sectionContentInset
{
  objc_super v3 = [(SUUIStorePageSection *)self pageComponent];
  objc_super v4 = [v3 viewElement];
  v5 = [v4 type];
  int v6 = [v5 isEqualToString:@"modern"];

  if (!v6) {
    goto LABEL_4;
  }
  v7 = [(SUUIStorePageSection *)self pageComponent];
  v8 = [v7 viewElement];
  v9 = [v8 style];
  v10 = [v9 valueForStyle:*MEMORY[0x263F4B388]];

  if (v10)
  {
    [v10 edgeInsetsValue];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    double v19 = v12;
    double v20 = v14;
    double v21 = v16;
    double v22 = v18;
  }
  else
  {
LABEL_4:
    v23.receiver = self;
    v23.super_class = (Class)SUUIRowViewElementPageSection;
    [(SUUIStorePageSection *)&v23 sectionContentInset];
  }
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SUUIStorePageSection *)self pageComponent];
  v9 = [v8 viewElement];
  [v6 addItemViewElement:v9];

  v10 = [(SUUIStorePageSection *)self pageComponent];
  double v11 = [v10 viewElement];
  double v12 = [v11 columns];
  uint64_t v13 = [v7 item];

  id v14 = [v12 objectAtIndex:v13];

  [v6 addItemViewElement:v14];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self pageComponent];
  id v6 = [v5 viewElement];
  id v7 = [v6 columns];
  v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "item"));

  v9 = [(SUUIRowViewElementPageSection *)self _firstChildForColumn:v8];
  v10 = [v9 style];
  double v11 = [v10 ikBackgroundColor];
  double v12 = [v11 color];

  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SUUIRowViewElementPageSection;
    id v13 = [(SUUIStorePageSection *)&v16 backgroundColorForIndexPath:v4];
  }
  id v14 = v13;

  return v14;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self pageComponent];
  id v6 = [v5 viewElement];
  id v7 = [v6 columns];
  v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "item"));

  v9 = [(SUUIRowViewElementPageSection *)self _firstChildForColumn:v8];
  v10 = [(SUUIRowViewElementPageSection *)self _reuseIdentifierForViewElement:v9];
  double v11 = [(SUUIStorePageSection *)self context];
  double v12 = [v11 collectionView];
  id v13 = [v12 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v4];

  [(SUUIRowViewElementPageSection *)self _contentInsetForIndexPath:v4];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  objc_msgSend(v13, "setContentInset:", v15, v17, v19, v21);
  [(SUUIRowViewElementPageSection *)self _interiorColumnSpacing];
  double v23 = v22;
  [(SUUIRowViewElementPageSection *)self _singleColumnWidth];
  double v25 = v24;
  uint64_t v26 = [v8 columnSpan];
  float v27 = v23 * (double)(v26 - 1) + (double)v26 * v25;
  double v28 = floorf(v27);
  v29 = [v9 style];
  v30 = [v29 visibility];
  LODWORD(v12) = [v30 isEqualToString:@"hidden"];

  if (v12) {
    v31 = 0;
  }
  else {
    v31 = v9;
  }
  [v13 reloadWithViewElement:v31 width:self->_cellLayoutContext context:v28];

  return v13;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x3010000000;
  double v16 = "";
  long long v17 = *MEMORY[0x263F001B0];
  uint64_t v5 = [v4 item];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__SUUIRowViewElementPageSection_cellSizeForIndexPath___block_invoke;
  v12[3] = &unk_2654030C0;
  v12[5] = &v13;
  v12[6] = v5;
  v12[4] = self;
  [(SUUIRowViewElementPageSection *)self _enumerateViewElementsUsingBlock:v12];
  [(SUUIRowViewElementPageSection *)self _contentInsetForIndexPath:v4];
  double v8 = v14[5];
  double v9 = v6 + v7 + v14[4];
  v14[4] = v9;
  _Block_object_dispose(&v13, 8);

  double v10 = v9;
  double v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

void __54__SUUIRowViewElementPageSection_cellSizeForIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 48) == a3) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = a4;
  }
  id v12 = v7;
  double v8 = (void *)[*(id *)(a1 + 32) _cellClassForViewElement:v7];
  if (v8)
  {
    [v8 sizeThatFitsWidth:v12 viewElement:*(void *)(*(void *)(a1 + 32) + 88) context:a4];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    double v11 = *(double *)(v10 + 40);
    if (v11 < v9) {
      double v11 = v9;
    }
    *(double *)(v10 + 40) = v11;
  }
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];
  id v7 = [v6 columns];
  double v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "item"));

  double v9 = [(SUUIRowViewElementPageSection *)self _firstChildForColumn:v8];
  objc_initWeak(&location, self);
  if (v9)
  {
    if ([v9 isEnabled])
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __72__SUUIRowViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke;
      v10[3] = &unk_265403110;
      objc_copyWeak(&v12, &location);
      id v11 = v9;
      [v11 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:v10];

      objc_destroyWeak(&v12);
    }
    else
    {
      [v9 dispatchEvent:0x270509DB0 eventAttribute:0x270509DD0 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
    }
  }
  objc_destroyWeak(&location);
}

void __72__SUUIRowViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke(uint64_t a1, char a2, char a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__SUUIRowViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2;
  block[3] = &unk_2654030E8;
  char v7 = a2;
  char v8 = a3;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v6);
}

void __72__SUUIRowViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48) || !*(unsigned char *)(a1 + 49))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained performDefaultActionForViewElement:*(void *)(a1 + 32)];
  }
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3
{
  return 1;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIStorePageSection *)self context];
  id v6 = [v5 activeMetricsImpressionSession];

  char v7 = [(SUUIStorePageSection *)self pageComponent];
  char v8 = [v7 viewElement];

  [v6 beginActiveImpressionForViewElement:v8];
  double v9 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v10 = [v9 viewElement];
  id v11 = [v10 columns];
  id v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v4, "item"));

  [v6 beginActiveImpressionForViewElement:v12];
  v13.receiver = self;
  v13.super_class = (Class)SUUIRowViewElementPageSection;
  [(SUUIStorePageSection *)&v13 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIStorePageSection *)self context];
  id v6 = [v5 activeMetricsImpressionSession];

  char v7 = [(SUUIStorePageSection *)self pageComponent];
  char v8 = [v7 viewElement];

  [v6 endActiveImpressionForViewElement:v8];
  double v9 = [v8 columns];
  unint64_t v10 = [v4 item];
  if (v10 < [v9 count])
  {
    uint64_t v11 = [v9 objectAtIndex:v10];

    [v6 endActiveImpressionForViewElement:v11];
    char v8 = (void *)v11;
  }
  v12.receiver = self;
  v12.super_class = (Class)SUUIRowViewElementPageSection;
  [(SUUIStorePageSection *)&v12 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SUUIRowViewElementPageSection *)self _requestLayoutForCells];
  v8.receiver = self;
  v8.super_class = (Class)SUUIRowViewElementPageSection;
  [(SUUIStorePageSection *)&v8 entityProvider:v7 didInvalidateWithContext:v6];
}

- (int64_t)numberOfCells
{
  v2 = [(SUUIStorePageSection *)self pageComponent];
  objc_super v3 = [v2 viewElement];
  id v4 = [v3 columns];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__SUUIRowViewElementPageSection_prefetchResourcesWithReason___block_invoke;
  v6[3] = &unk_265403138;
  v6[4] = self;
  v6[5] = a3;
  [(SUUIRowViewElementPageSection *)self _enumerateViewElementsUsingBlock:v6];
  v5.receiver = self;
  v5.super_class = (Class)SUUIRowViewElementPageSection;
  [(SUUIStorePageSection *)&v5 prefetchResourcesWithReason:a3];
}

void __61__SUUIRowViewElementPageSection_prefetchResourcesWithReason___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend((id)objc_msgSend(v3, "_cellClassForViewElement:", v4), "prefetchResourcesForViewElement:reason:context:", v4, *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 88));
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(SUUIStorePageSection *)self context];
  uint64_t v11 = [v10 collectionView];
  objc_super v12 = [v11 cellForItemAtIndexPath:v8];

  int v13 = [v12 updateWithItemState:v9 context:self->_cellLayoutContext animated:v5];
  if (v13)
  {
    double v14 = [(SUUIStorePageSection *)self pageComponent];
    uint64_t v15 = [v14 viewElement];
    double v16 = [v15 columns];
    long long v17 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v8, "item"));

    [(SUUIRowViewElementPageSection *)self _interiorColumnSpacing];
    double v19 = v18;
    [(SUUIRowViewElementPageSection *)self _singleColumnWidth];
    double v21 = v20;
    uint64_t v22 = [v17 columnSpan];
    float v23 = v19 * (double)(v22 - 1) + (double)v22 * v21;
    [(id)objc_opt_class() requestLayoutForViewElement:v17 width:self->_cellLayoutContext context:floorf(v23)];
  }
  return v13;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270503770];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270503790];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x27050B090];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270502AB0];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270508F30];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270505AF0];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2705094D0];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2704FE9D0];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x27050B010];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270506F70];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2704FE850];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270503310];
  id v6 = self->_cellLayoutContext;
  id v7 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v6];
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:self];
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setAggregateValue:MEMORY[0x263EFFA88] forKey:0x270507D30];
  id v9 = [(SUUIStorePageSection *)self pageComponent];
  unint64_t v10 = [v9 viewElement];

  -[SUUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", [v10 elementType]);
  [(SUUIRowViewElementPageSection *)self _requestLayoutForCells];
  v11.receiver = self;
  v11.super_class = (Class)SUUIRowViewElementPageSection;
  [(SUUIStorePageSection *)&v11 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  id v8 = a4;
  [(SUUIViewElementLayoutContext *)cellLayoutContext setActivePageWidth:width];
  [(SUUIRowViewElementPageSection *)self _requestLayoutForCells];
  v9.receiver = self;
  v9.super_class = (Class)SUUIRowViewElementPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUUIStorePageSection *)self context];
  objc_super v9 = [v8 collectionView];

  int64_t v10 = [(SUUIStorePageSection *)self sectionIndex];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__SUUIRowViewElementPageSection_artworkRequest_didLoadImage___block_invoke;
  v14[3] = &unk_265403160;
  double v18 = self;
  int64_t v19 = v10;
  id v15 = v9;
  id v16 = v7;
  id v17 = v6;
  id v11 = v6;
  id v12 = v7;
  id v13 = v9;
  [(SUUIRowViewElementPageSection *)self _enumerateViewElementsUsingBlock:v14];
}

void __61__SUUIRowViewElementPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:*(void *)(a1 + 64)];
  id v4 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v5];
  [v4 setImage:*(void *)(a1 + 40) forArtworkRequest:*(void *)(a1 + 48) context:*(void *)(*(void *)(a1 + 56) + 88)];
}

- (Class)_cellClassForCardViewElement:(id)a3
{
  [a3 cardType];
  objc_super v3 = objc_opt_class();
  return (Class)v3;
}

- (Class)_cellClassForLockupViewElement:(id)a3
{
  if ((unint64_t)[a3 lockupViewType] <= 8)
  {
    objc_super v3 = objc_opt_class();
  }
  return (Class)v3;
}

- (Class)_cellClassForViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  if (v5 > 49)
  {
    if (v5 != 66)
    {
LABEL_10:
      id v6 = (objc_class *)objc_opt_class();
      goto LABEL_11;
    }
    id v6 = [(SUUIRowViewElementPageSection *)self _cellClassForLockupViewElement:v4];
  }
  else
  {
    if (v5 <= 13 || v5 != 14) {
      goto LABEL_10;
    }
    id v6 = [(SUUIRowViewElementPageSection *)self _cellClassForCardViewElement:v4];
  }
LABEL_11:
  id v7 = v6;

  return v7;
}

- (UIEdgeInsets)_contentInsetForIndexPath:(id)a3
{
  double v4 = *MEMORY[0x263F834E8];
  double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
  id v6 = a3;
  id v7 = [(SUUIStorePageSection *)self pageComponent];
  id v8 = [v7 viewElement];
  objc_super v9 = [v8 columns];
  uint64_t v10 = [v9 count];

  [(SUUIRowViewElementPageSection *)self _interiorColumnSpacing];
  double v12 = v11;
  uint64_t v13 = [v6 item];

  float v14 = v12 * 0.5;
  double v15 = floorf(v14);
  if (v13) {
    double v16 = v15;
  }
  else {
    double v16 = 15.0;
  }
  if (v13 == v10 - 1) {
    double v17 = 15.0;
  }
  else {
    double v17 = v15;
  }
  double v18 = v4;
  double v19 = v5;
  result.right = v17;
  result.bottom = v19;
  result.left = v16;
  result.top = v18;
  return result;
}

- (void)_enumerateViewElementsUsingBlock:(id)a3
{
  id v4 = a3;
  [(SUUIRowViewElementPageSection *)self _interiorColumnSpacing];
  uint64_t v6 = v5;
  [(SUUIRowViewElementPageSection *)self _singleColumnWidth];
  uint64_t v8 = v7;
  objc_super v9 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v10 = [v9 viewElement];
  double v11 = [v10 columns];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__SUUIRowViewElementPageSection__enumerateViewElementsUsingBlock___block_invoke;
  v13[3] = &unk_265403188;
  uint64_t v15 = v6;
  uint64_t v16 = v8;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v11 enumerateObjectsUsingBlock:v13];
}

void __66__SUUIRowViewElementPageSection__enumerateViewElementsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  double v7 = *(double *)(a1 + 48);
  double v8 = *(double *)(a1 + 56);
  id v9 = a2;
  uint64_t v10 = [v9 columnSpan];
  float v11 = v7 * (double)(v10 - 1) + (double)v10 * v8;
  double v12 = floorf(v11);
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [*(id *)(a1 + 32) _firstChildForColumn:v9];

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, double))(v13 + 16))(v13, v14, a3, a4, v12);
}

- (id)_firstChildForColumn:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__25;
  float v11 = __Block_byref_object_dispose__25;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__SUUIRowViewElementPageSection__firstChildForColumn___block_invoke;
  v6[3] = &unk_265400D50;
  v6[4] = &v7;
  [v3 enumerateChildrenUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__SUUIRowViewElementPageSection__firstChildForColumn___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (double)_interiorColumnSpacing
{
  id v3 = [(SUUIStorePageSection *)self pageComponent];
  id v4 = [v3 viewElement];
  uint64_t v5 = [v4 columns];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [(SUUIStorePageSection *)self context];
  [v7 activePageWidth];
  double v9 = 20.0;
  if (v6 != 2)
  {
    if (v6 == 3)
    {
      if (v8 <= 1000.0)
      {
        if (v8 <= 700.0) {
          double v9 = 4.0;
        }
        else {
          double v9 = 18.0;
        }
      }
    }
    else if (v6 == 4)
    {
      uint64_t v10 = [v7 clientContext];
      uint64_t v11 = SUUIUserInterfaceIdiom(v10);

      if (v11 == 1) {
        double v9 = 18.0;
      }
      else {
        double v9 = 4.0;
      }
    }
    else
    {
      double v9 = 0.0;
    }
  }

  return v9;
}

- (void)_requestLayoutForCells
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__SUUIRowViewElementPageSection__requestLayoutForCells__block_invoke;
  v2[3] = &unk_2654031B0;
  v2[4] = self;
  [(SUUIRowViewElementPageSection *)self _enumerateViewElementsUsingBlock:v2];
}

void __55__SUUIRowViewElementPageSection__requestLayoutForCells__block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend((id)objc_msgSend(v5, "_cellClassForViewElement:", v6), "requestLayoutForViewElement:width:context:", v6, *(void *)(*(void *)(a1 + 32) + 88), a3);
}

- (id)_reuseIdentifierForCardViewElement:(id)a3
{
  uint64_t v3 = [a3 cardType];
  id v4 = &SUUICardViewElementCollectionViewCellReuseIdentifier;
  if (v3 == 3) {
    id v4 = &SUUIEditorialCardCellReuseIdentifier;
  }
  uint64_t v5 = (void *)*v4;
  return v5;
}

- (id)_reuseIdentifierForLockupViewElement:(id)a3
{
  unint64_t v3 = [a3 lockupViewType];
  if (v3 <= 8) {
    id v4 = (id)*off_265403218[v3];
  }
  return v4;
}

- (id)_reuseIdentifierForViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  if (v5 > 49)
  {
    if (v5 <= 133)
    {
      if (v5 != 50)
      {
        if (v5 == 62)
        {
          id v6 = @"SUUIHorizontalListReuseIdentifier";
          goto LABEL_24;
        }
        if (v5 == 66)
        {
          id v7 = [(SUUIRowViewElementPageSection *)self _reuseIdentifierForLockupViewElement:v4];
          goto LABEL_25;
        }
        goto LABEL_14;
      }
LABEL_19:
      id v6 = @"SUUIButtonReuseIdentifier";
      goto LABEL_24;
    }
    if (v5 == 134)
    {
      id v6 = @"SUUIStarHistogramCellReuseIdentifier";
      goto LABEL_24;
    }
    if (v5 == 141) {
      goto LABEL_19;
    }
    if (v5 != 152) {
      goto LABEL_14;
    }
LABEL_18:
    id v6 = @"SUUIImageReuseIdentifier";
    goto LABEL_24;
  }
  if (v5 > 13)
  {
    if (v5 == 14)
    {
      id v7 = [(SUUIRowViewElementPageSection *)self _reuseIdentifierForCardViewElement:v4];
      goto LABEL_25;
    }
    if (v5 == 28)
    {
      id v6 = @"SUUICounterReuseIdentifier";
      goto LABEL_24;
    }
    if (v5 != 49) {
      goto LABEL_14;
    }
    goto LABEL_18;
  }
  if ((unint64_t)(v5 - 12) < 2) {
    goto LABEL_19;
  }
  if (v5 != 4)
  {
LABEL_14:
    id v6 = @"SUUISpacerReuseIdentifier";
    goto LABEL_24;
  }
  id v6 = @"SUUIActivityIndicatorReuseIdentifier";
LABEL_24:
  id v7 = v6;
LABEL_25:
  double v8 = v7;

  return v8;
}

- (double)_singleColumnWidth
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SUUIStorePageSection *)self pageComponent];
  id v4 = [v3 viewElement];
  uint64_t v5 = [v4 columns];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 += objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "columnSpan", (void)v19);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  [(SUUIRowViewElementPageSection *)self _interiorColumnSpacing];
  double v13 = v12;
  id v14 = [(SUUIStorePageSection *)self context];
  [v14 activePageWidth];
  double v16 = v15;

  float v17 = (v16 + -30.0 - v13 * (double)(v9 - 1)) / (double)v9;
  return floorf(v17);
}

- (void).cxx_destruct
{
}

@end