@interface SUUIViewElementPageSection
- (BOOL)_showsImageReflection;
- (BOOL)_stretchesToFitCollectionViewBounds;
- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3;
- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3;
- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (CGSize)preferredContentSize;
- (SUUIViewElementPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)pinningContentInsetForItemAtIndexPath:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (double)contentInsetAdjustmentForCollectionView:(id)a3;
- (double)defaultVerticalInset;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)defaultItemPinningStyle;
- (int64_t)numberOfCells;
- (void)_reloadViewElementProperties;
- (void)_requestCellLayout;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)expandEditorialForLabelElement:(id)a3 indexPath:(id)a4;
- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIViewElementPageSection

- (SUUIViewElementPageSection)initWithPageComponent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIViewElementPageSection;
  v3 = [(SUUIStorePageSection *)&v6 initWithPageComponent:a3];
  v4 = v3;
  if (v3) {
    [(SUUIViewElementPageSection *)v3 _reloadViewElementProperties];
  }
  return v4;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SUUIStorePageSection *)self pageComponent];
  objc_super v6 = [v7 viewElement];
  [v5 addItemViewElement:v6];
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  if (a3 != 2) {
    [(SUUIViewElementPageSection *)self _reloadViewElementProperties];
  }
  v6.receiver = self;
  v6.super_class = (Class)SUUIViewElementPageSection;
  return [(SUUIStorePageSection *)&v6 applyUpdateType:a3];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIStorePageSection *)self pageComponent];
  objc_super v6 = [v5 viewElement];
  char v7 = [v6 handlesBackgroundColorDirectly];

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = [(SUUIStorePageSection *)self pageComponent];
    v10 = [v9 viewElement];
    v11 = [v10 style];

    v12 = [v11 ikBackgroundColor];
    v13 = [v12 color];

    if (v13)
    {
      id v14 = v13;
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)SUUIViewElementPageSection;
      id v14 = [(SUUIStorePageSection *)&v16 backgroundColorForIndexPath:v4];
    }
    v8 = v14;
  }
  return v8;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIStorePageSection *)self context];
  objc_super v6 = [v5 collectionView];
  char v7 = [v6 dequeueReusableCellWithReuseIdentifier:self->_reuseIdentifier forIndexPath:v4];

  objc_msgSend(v7, "setContentInset:", self->_cellContentInset.top, self->_cellContentInset.left, self->_cellContentInset.bottom, self->_cellContentInset.right);
  [v7 setSeparatorStyle:0];
  v8 = [(SUUIStorePageSection *)self pageComponent];
  v9 = [v8 viewElement];

  if ([v9 elementType] == 49) {
    objc_msgSend(v7, "setShowsReflectionImage:", -[SUUIViewElementPageSection _showsImageReflection](self, "_showsImageReflection"));
  }
  [v5 activePageWidth];
  double v11 = v10 - self->_cellContentInset.left - self->_cellContentInset.right;
  v12 = [v9 style];
  v13 = [v12 visibility];
  int v14 = [v13 isEqualToString:@"hidden"];

  if (v14) {
    v15 = 0;
  }
  else {
    v15 = v9;
  }
  [v7 reloadWithViewElement:v15 width:self->_cellLayoutContext context:v11];
  if (self->_rendersWithPerspective && [v7 conformsToProtocol:&unk_270640F38])
  {
    id v16 = v7;
    v17 = [(SUUIStorePageSection *)self context];
    v18 = [v17 parentViewController];
    v19 = [v18 view];

    [v16 setPerspectiveTargetView:v19];
    [v19 bounds];
    objc_msgSend(v16, "setVanishingPoint:", CGRectGetMidX(v22), -800.0);
  }
  objc_storeWeak((id *)&self->_lastCell, v7);

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SUUIStorePageSection *)self context];
  [v4 activePageWidth];
  double v6 = v5;

  char v7 = [(SUUIStorePageSection *)self pageComponent];
  v8 = [v7 viewElement];

  [(objc_class *)self->_cellClass sizeThatFitsWidth:v8 viewElement:self->_cellLayoutContext context:v6 - self->_cellContentInset.left - self->_cellContentInset.right];
  double v10 = v9 + self->_cellContentInset.top + self->_cellContentInset.bottom;
  if ([(SUUIViewElementPageSection *)self _showsImageReflection]) {
    double v10 = v10 + v10;
  }

  double v11 = v6;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__SUUIViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke;
  v8[3] = &unk_265403110;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [v7 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__SUUIViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke(uint64_t a1, char a2, char a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__SUUIViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2;
  block[3] = &unk_2654030E8;
  char v7 = a2;
  char v8 = a3;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v6);
}

void __69__SUUIViewElementPageSection_collectionViewDidSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48) || !*(unsigned char *)(a1 + 49))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained performDefaultActionForViewElement:*(void *)(a1 + 32)];
  }
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  v3 = [(SUUIStorePageSection *)self pageComponent];
  id v4 = [v3 viewElement];
  char v5 = [v4 isEnabled];

  return v5;
}

- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3
{
  v3 = [(SUUIStorePageSection *)self pageComponent];
  id v4 = [v3 viewElement];
  char v5 = [v4 isEnabled];

  return v5;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4 = a3;
  if ([(SUUIViewElementPageSection *)self _stretchesToFitCollectionViewBounds])
  {
    char v5 = [(SUUIStorePageSection *)self context];
    id v6 = [v5 collectionView];

    [v6 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v6 contentInset];
    double v16 = v15;
    [v4 frame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    v32.origin.x = v8;
    v32.origin.y = v10;
    v32.size.width = v12;
    v32.size.height = v14;
    double v23 = CGRectGetMaxY(v32) - v16 - v20 - self->_sectionBottomInset;
    v24 = [(SUUIStorePageSection *)self pageComponent];
    v25 = [v24 viewElement];
    v26 = [v25 style];

    v27 = [v26 maxHeight];

    if (v27)
    {
      v28 = [v26 maxHeight];
      [v28 floatValue];
      float v30 = v29;

      if (v23 < v30) {
        double v23 = v30;
      }
    }
    objc_msgSend(v4, "setFrame:", v18, v20, v22, v23);
    objc_msgSend(v4, "setSize:", v22, v23);
  }
  v31.receiver = self;
  v31.super_class = (Class)SUUIViewElementPageSection;
  [(SUUIStorePageSection *)&v31 collectionViewWillApplyLayoutAttributes:v4];
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  char v5 = [(SUUIStorePageSection *)self pageComponent];
  id v6 = [v5 viewElement];

  double v7 = [(SUUIStorePageSection *)self context];
  CGFloat v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIViewElementPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  char v5 = [(SUUIStorePageSection *)self pageComponent];
  id v6 = [v5 viewElement];

  double v7 = [(SUUIStorePageSection *)self context];
  CGFloat v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIViewElementPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (double)contentInsetAdjustmentForCollectionView:(id)a3
{
  id v4 = [(SUUIStorePageSection *)self pageComponent];
  char v5 = [v4 viewElement];

  double v6 = 0.0;
  if ([(SUUIViewElementPageSection *)self _showsImageReflection])
  {
    Class cellClass = self->_cellClass;
    CGFloat v8 = [(SUUIStorePageSection *)self context];
    [v8 activePageWidth];
    [(objc_class *)cellClass sizeThatFitsWidth:v5 viewElement:self->_cellLayoutContext context:v9 - self->_cellContentInset.left - self->_cellContentInset.right];
    double v11 = v10;

    double v6 = -v11;
  }

  return v6;
}

- (int64_t)defaultItemPinningStyle
{
  v3 = [(SUUIStorePageSection *)self pageComponent];
  id v4 = [v3 viewElement];
  if ([v4 elementType] == 49)
  {
    BOOL v5 = [(SUUIStorePageSection *)self isTopSection];

    if (v5) {
      return 3;
    }
  }
  else
  {
  }
  v7.receiver = self;
  v7.super_class = (Class)SUUIViewElementPageSection;
  return [(SUUIStorePageSection *)&v7 defaultItemPinningStyle];
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SUUIViewElementPageSection *)self _requestCellLayout];
  v8.receiver = self;
  v8.super_class = (Class)SUUIViewElementPageSection;
  [(SUUIStorePageSection *)&v8 entityProvider:v7 didInvalidateWithContext:v6];
}

- (void)expandEditorialForLabelElement:(id)a3 indexPath:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  cellLayoutContext = self->_cellLayoutContext;
  id v7 = a4;
  [(SUUIViewElementLayoutContext *)cellLayoutContext expandEditorialForLabelElement:a3];
  objc_super v8 = [(SUUIStorePageSection *)self context];
  double v9 = [v8 collectionView];
  v11[0] = v7;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  [v9 reloadItemsAtIndexPaths:v10];
}

- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4
{
  id v19 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(SUUIStorePageSection *)self pageComponent];
  objc_super v8 = [v7 viewElement];
  int v9 = [v19 isDescendentFromViewElement:v8];

  if (v9)
  {
    double v10 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    double v11 = [(SUUIStorePageSection *)self context];
    CGFloat v12 = [v11 collectionView];
    double v13 = [v12 cellForItemAtIndexPath:v10];

    CGFloat v14 = [v19 itmlID];
    double v15 = [v13 viewForElementIdentifier:v14];

    double v16 = objc_alloc_init(SUUIModalSourceViewProvider);
    double v17 = v16;
    if (v15) {
      double v18 = v15;
    }
    else {
      double v18 = v13;
    }
    [(SUUIModalSourceViewProvider *)v16 setOriginalSourceView:v18];
  }
  else
  {
    double v17 = 0;
  }
  v6[2](v6, v17);
}

- (int64_t)numberOfCells
{
  return 1;
}

- (UIEdgeInsets)pinningContentInsetForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double firstSectionTopInset = self->_firstSectionTopInset;
  CGFloat left = self->_cellContentInset.left;
  double sectionBottomInset = self->_sectionBottomInset;
  CGFloat right = self->_cellContentInset.right;
  char v19 = 0;
  int v9 = [(SUUIStorePageSection *)self pageComponent];
  double v10 = [v9 viewElement];
  double v11 = [v10 style];
  double v12 = SUUIViewElementPaddingForStyle(v11, &v19);
  double v14 = v13;

  if (v19)
  {
    double firstSectionTopInset = v12;
  }
  else
  {
    double v14 = 0.0;
    if ([(SUUIStorePageSection *)self pinningStyleForItemAtIndexPath:v4] != 3
      && self->_cellContentInset.bottom <= 0.00000011920929)
    {
      double v14 = sectionBottomInset;
    }
  }

  double v15 = firstSectionTopInset;
  double v16 = left;
  double v17 = v14;
  double v18 = right;
  result.CGFloat right = v18;
  result.bottom = v17;
  result.CGFloat left = v16;
  result.top = v15;
  return result;
}

- (CGSize)preferredContentSize
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [(SUUIStorePageSection *)self pageComponent];
    id v4 = [v3 viewElement];

    [(objc_class *)self->_cellClass preferredSizeForViewElement:v4 context:self->_cellLayoutContext];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  Class cellClass = self->_cellClass;
  double v6 = [(SUUIStorePageSection *)self pageComponent];
  double v7 = [v6 viewElement];
  [(objc_class *)cellClass prefetchResourcesForViewElement:v7 reason:a3 context:self->_cellLayoutContext];

  v8.receiver = self;
  v8.super_class = (Class)SUUIViewElementPageSection;
  [(SUUIStorePageSection *)&v8 prefetchResourcesWithReason:a3];
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  double v7 = [(SUUIStorePageSection *)self context];
  objc_super v8 = [v7 clientContext];
  double v9 = [v8 previewViewControllerForViewElement:v6];

  return v9;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  id v11 = [(SUUIStorePageSection *)self context];
  double v6 = [v11 collectionView];
  double v7 = [v6 cellForItemAtIndexPath:v5];

  objc_super v8 = [(SUUIStorePageSection *)self pageComponent];
  double v9 = [v8 viewElement];

  [v11 activePageWidth];
  [v7 reloadWithViewElement:v9 width:self->_cellLayoutContext context:v10 - self->_cellContentInset.left - self->_cellContentInset.right];
}

- (UIEdgeInsets)sectionContentInset
{
  double sectionBottomInset = self->_sectionBottomInset;
  char v14 = 0;
  id v4 = [(SUUIStorePageSection *)self pageComponent];
  id v5 = [v4 viewElement];
  double v6 = [v5 style];
  double firstSectionTopInset = SUUIViewElementPaddingForStyle(v6, &v14);
  double v9 = v8;

  if (v14)
  {
    double sectionBottomInset = v9;
  }
  else
  {
    double firstSectionTopInset = 0.0;
    if ([(SUUIStorePageSection *)self isTopSection]) {
      double firstSectionTopInset = self->_firstSectionTopInset;
    }
  }
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = firstSectionTopInset;
  double v13 = sectionBottomInset;
  result.CGFloat right = v11;
  result.bottom = v13;
  result.CGFloat left = v10;
  result.top = v12;
  return result;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  p_lastCell = &self->_lastCell;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_lastCell);
  int v10 = [WeakRetained updateWithItemState:v8 context:self->_cellLayoutContext animated:v5];

  if (v10) {
    [(SUUIViewElementPageSection *)self _requestCellLayout];
  }
  return v10;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 collectionView];
  [v5 registerClass:self->_cellClass forCellWithReuseIdentifier:self->_reuseIdentifier];
  double v6 = self->_cellLayoutContext;
  double v7 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v6];
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:self];
  [(SUUIViewElementPageSection *)self _reloadViewElementProperties];
  [(SUUIViewElementPageSection *)self _requestCellLayout];
  v9.receiver = self;
  v9.super_class = (Class)SUUIViewElementPageSection;
  [(SUUIStorePageSection *)&v9 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  id v8 = a4;
  [(SUUIViewElementLayoutContext *)cellLayoutContext invalidateAllEditorialLayouts];
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setActivePageWidth:width];
  [(SUUIViewElementPageSection *)self _requestCellLayout];
  v9.receiver = self;
  v9.super_class = (Class)SUUIViewElementPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  p_lastCell = &self->_lastCell;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_lastCell);
  [WeakRetained setImage:v7 forArtworkRequest:v8 context:self->_cellLayoutContext];
}

- (double)defaultVerticalInset
{
  v2 = [MEMORY[0x263F82E88] keyWindow];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.double width = v8;
  v12.size.double height = v10;
  if (CGRectGetWidth(v12) < 1024.0) {
    return 15.0;
  }
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.double width = v8;
  v13.size.double height = v10;
  if (CGRectGetHeight(v13) <= 768.0) {
    return 15.0;
  }
  else {
    return 35.0;
  }
}

- (void)_reloadViewElementProperties
{
  p_cellContentInset = &self->_cellContentInset;
  CGFloat v4 = [(SUUIStorePageSection *)self context];
  [v4 horizontalPadding];
  CGFloat v6 = v5;
  double v7 = [(SUUIStorePageSection *)self context];
  [v7 horizontalPadding];
  p_cellContentInset->top = 0.0;
  p_cellContentInset->CGFloat left = v6;
  p_cellContentInset->bottom = 0.0;
  p_cellContentInset->CGFloat right = v8;

  [(SUUIViewElementPageSection *)self defaultVerticalInset];
  self->_double sectionBottomInset = v9;
  self->_double firstSectionTopInset = v9;
  CGFloat v10 = [(SUUIStorePageSection *)self pageComponent];
  id v21 = [v10 viewElement];

  self->_rendersWithPerspective = [v21 rendersWithPerspective];
  uint64_t v11 = [v21 elementType];
  if (v11 <= 49)
  {
    if (v11 > 26)
    {
      if (v11 <= 47)
      {
        if (v11 == 27)
        {
          self->_Class cellClass = (Class)objc_opt_class();
          CGRect v12 = @"SUUIContentUnavailableReuseIdentifier";
        }
        else
        {
          if (v11 != 40) {
            goto LABEL_41;
          }
          *(_OWORD *)&p_cellContentInset->top = xmmword_2568A1EE0;
          *(_OWORD *)&p_cellContentInset->bottom = xmmword_2568A1EE0;
          self->_Class cellClass = (Class)objc_opt_class();
          self->_double firstSectionTopInset = 0.0;
          CGRect v12 = @"SUUIFilterBarReuseIdentifier";
        }
        goto LABEL_40;
      }
      if (v11 == 48)
      {
        self->_Class cellClass = (Class)objc_opt_class();
        objc_storeStrong((id *)&self->_reuseIdentifier, @"SUUISectionHeaderReuseIdentifier");
        double v19 = 10.0;
        goto LABEL_37;
      }
      self->_Class cellClass = (Class)objc_opt_class();
      p_cellContentInset->CGFloat right = 0.0;
      p_cellContentInset->CGFloat left = 0.0;
      self->_double firstSectionTopInset = 0.0;
      objc_storeStrong((id *)&self->_reuseIdentifier, @"SUUIImageReuseIdentifier");
      CGRect v13 = [v21 style];
      char v14 = [v13 imageTreatment];
      int v15 = [v14 isEqualToString:@"uber"];

      if (v15) {
        self->_double sectionBottomInset = 0.0;
      }
      double v16 = [v21 style];
      double v17 = [v16 imageTreatment];
      int v18 = [v17 isEqualToString:@"uber-banner"];

      if (v18) {
LABEL_27:
      }
        self->_double sectionBottomInset = 0.0;
      goto LABEL_41;
    }
    if (v11 != 4)
    {
      if (v11 != 12)
      {
        if (v11 == 14)
        {
          self->_Class cellClass = (Class)objc_opt_class();
          objc_storeStrong((id *)&self->_reuseIdentifier, @"SUUICardViewElementReuseIdentifier");
          self->_double firstSectionTopInset = 0.0;
        }
        goto LABEL_41;
      }
LABEL_30:
      self->_Class cellClass = (Class)objc_opt_class();
      objc_storeStrong((id *)&self->_reuseIdentifier, @"SUUIButtonReuseIdentifier");
      double v19 = 12.0;
LABEL_37:
      self->_double sectionBottomInset = v19;
      goto LABEL_41;
    }
    self->_Class cellClass = (Class)objc_opt_class();
    CGRect v12 = @"SUUIActivityIndicatorReuseIdentifier";
LABEL_40:
    objc_storeStrong((id *)&self->_reuseIdentifier, v12);
    goto LABEL_41;
  }
  if (v11 > 108)
  {
    if (v11 <= 133)
    {
      if (v11 != 109)
      {
        if (v11 != 131) {
          goto LABEL_41;
        }
        self->_Class cellClass = (Class)objc_opt_class();
        CGRect v12 = @"SUUIStackListReuseIdentifier";
        goto LABEL_40;
      }
      self->_Class cellClass = (Class)objc_opt_class();
      p_cellContentInset->bottom = 8.0;
      p_cellContentInset->top = 0.0;
      self->_double firstSectionTopInset = 7.0;
      objc_storeStrong((id *)&self->_reuseIdentifier, @"SUUISegmentedControlReuseIdentifier");
      double v20 = [v21 bottomDivider];

      if (!v20) {
        self->_double sectionBottomInset = 7.0;
      }
      goto LABEL_41;
    }
    if (v11 != 134)
    {
      if (v11 != 141) {
        goto LABEL_41;
      }
      goto LABEL_30;
    }
    self->_Class cellClass = (Class)objc_opt_class();
    CGRect v12 = @"SUUIStarHistogramCellReuseIdentifier";
    goto LABEL_40;
  }
  if (v11 <= 65)
  {
    if (v11 != 50)
    {
      if (v11 != 62) {
        goto LABEL_41;
      }
      self->_Class cellClass = (Class)objc_opt_class();
      CGRect v12 = @"SUUIHorizontalListReuseIdentifier";
      goto LABEL_40;
    }
    goto LABEL_30;
  }
  if (v11 != 66)
  {
    if (v11 != 77) {
      goto LABEL_41;
    }
    self->_Class cellClass = (Class)objc_opt_class();
    CGRect v12 = @"SUUIOfferReuseIdentifier";
    goto LABEL_40;
  }
  switch([v21 lockupViewType])
  {
    case 0:
    case 1:
    case 2:
    case 6:
    case 8:
      self->_Class cellClass = (Class)objc_opt_class();
      CGRect v12 = @"SUUIHorizontalLockupReuseID";
      goto LABEL_40;
    case 3:
      self->_Class cellClass = (Class)objc_opt_class();
      CGRect v12 = @"SUUIProductLockupReuseIdentifier";
      goto LABEL_40;
    case 4:
      self->_Class cellClass = (Class)objc_opt_class();
      CGRect v12 = @"SUUIVerticalLockupReuseIdentifier";
      goto LABEL_40;
    case 5:
      p_cellContentInset->CGFloat right = 0.0;
      self->_Class cellClass = (Class)objc_opt_class();
      objc_storeStrong((id *)&self->_reuseIdentifier, @"SUUIHorizontalLockupReuseID");
      double v19 = 1.0;
      self->_double firstSectionTopInset = 1.0;
      goto LABEL_37;
    case 7:
      p_cellContentInset->CGFloat left = 0.0;
      p_cellContentInset->CGFloat right = 0.0;
      self->_Class cellClass = (Class)objc_opt_class();
      objc_storeStrong((id *)&self->_reuseIdentifier, @"SUUIHorizontalLockupReuseID");
      self->_double firstSectionTopInset = 0.0;
      goto LABEL_27;
    default:
      break;
  }
LABEL_41:
}

- (void)_requestCellLayout
{
  double v3 = [(SUUIStorePageSection *)self pageComponent];
  id v7 = [v3 viewElement];

  CGFloat v4 = [(SUUIStorePageSection *)self context];
  [v4 activePageWidth];
  double v6 = v5 - self->_cellContentInset.left - self->_cellContentInset.right;

  [(objc_class *)self->_cellClass requestLayoutForViewElement:v7 width:self->_cellLayoutContext context:v6];
}

- (BOOL)_showsImageReflection
{
  return 0;
}

- (BOOL)_stretchesToFitCollectionViewBounds
{
  BOOL v3 = [(SUUIStorePageSection *)self isBottomSection];
  if (v3)
  {
    CGFloat v4 = [(SUUIStorePageSection *)self pageComponent];
    double v5 = [v4 viewElement];
    uint64_t v6 = [v5 elementType];

    LOBYTE(v3) = v6 == 4 || v6 == 27;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_destroyWeak((id *)&self->_lastCell);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

@end