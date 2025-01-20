@interface SUUIGridViewElementPageSectionConfiguration
- (BOOL)_isContainedWithinExploreTemplateWithGridViewElement:(id)a3;
- (BOOL)_useOrdinalPadding;
- (BOOL)rendersWithPerspective;
- (BOOL)showsEditMode;
- (BOOL)viewElementIsStandardCard:(id)a3;
- (CGSize)cellSizeForViewElement:(id)a3 indexPath:(id)a4;
- (Class)_cardCellClassForCard:(id)a3;
- (Class)cellClassForViewElement:(id)a3;
- (Class)lockupCellClassWithLockup:(id)a3;
- (SUUIGridViewElementPageSectionConfigurationDataSource)dataSource;
- (SUUIStorePageSectionContext)pageSectionContext;
- (SUUIViewElementLayoutContext)cellLayoutContext;
- (UIEdgeInsets)_cellInsetsForViewElement:(id)a3 indexPath:(id)a4;
- (UIEdgeInsets)_normalizedContentInsetForViewElement:(id)a3 indexPath:(id)a4;
- (UIEdgeInsets)sectionContentInsetAdjustedFromValue:(UIEdgeInsets)a3 forGridViewElement:(id)a4;
- (double)_cellContentWidth;
- (double)_cellHeightForViewElement:(id)a3 width:(double)a4;
- (double)_cellPaddingInteriorHorizontal;
- (double)_cellPaddingLeftEdgeHorizontal;
- (double)_cellPaddingRightEdgeHorizontal;
- (double)_columnContentWidthPaddingForWidth:(double)a3;
- (double)columnContentWidth;
- (double)columnWidth;
- (id)_cardArtworkBoundingSizeForIndexPath:(id)a3;
- (id)_lockupCellReuseIdentifierWithLockup:(id)a3;
- (id)backgroundColorForViewElement:(id)a3;
- (id)cellForViewElement:(id)a3 indexPath:(id)a4;
- (int64_t)_lockupTypeForLockup:(id)a3;
- (int64_t)_numberOfColumnsForWidth:(double)a3 style:(id)a4;
- (int64_t)numberOfColumns;
- (int64_t)positionForIndexPath:(id)a3;
- (void)_enumerateViewElementsForRowOfIndexPath:(id)a3 usingBlock:(id)a4;
- (void)_reloadCellPaddingIfNeeded;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)configureCell:(id)a3 forViewElement:(id)a4 indexPath:(id)a5;
- (void)registerReusableClassesForCollectionView:(id)a3;
- (void)reloadCellWithIndexPath:(id)a3 forViewElement:(id)a4 reason:(int64_t)a5;
- (void)requestCellLayoutForViewElement:(id)a3;
- (void)setCellLayoutContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setNumberOfColumns:(int64_t)a3;
- (void)setPageSectionContext:(id)a3;
- (void)setRendersWithPerspective:(BOOL)a3;
- (void)updateLayoutPropertiesForGridViewElement:(id)a3;
- (void)updateStylePropertiesForGridViewElement:(id)a3 gridItemViewElements:(id)a4 numberOfGridItems:(unint64_t)a5;
@end

@implementation SUUIGridViewElementPageSectionConfiguration

- (double)columnContentWidth
{
  [(SUUIGridViewElementPageSectionConfiguration *)self columnWidth];
  -[SUUIGridViewElementPageSectionConfiguration _columnContentWidthPaddingForWidth:](self, "_columnContentWidthPaddingForWidth:");
  return result;
}

- (double)columnWidth
{
  if (self->_numberOfColumns < 1) {
    return 0.0;
  }
  [(SUUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
  double v4 = v3;
  v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 scale];
  double v7 = v4 * v6;

  double v8 = floor(v7 / (double)self->_numberOfColumns);
  v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  double v11 = v8 / v10;

  return v11;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_dataSource, obj);
    *(unsigned char *)&self->_dataSourceRespondsToSelectorFlags = *(unsigned char *)&self->_dataSourceRespondsToSelectorFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  }
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
  self->_cellContentWidth = 0.0;
  self->_cellPaddingLeftEdgeHorizontal = 0.0;
  self->_cellPaddingRightEdgeHorizontal = 0.0;
  self->_cellPaddingInteriorHorizontal = 0.0;
  self->_cellPaddingNeedsReloading = 1;
}

- (id)backgroundColorForViewElement:(id)a3
{
  id v3 = a3;
  double v4 = [v3 style];
  id v5 = [v4 ikBackgroundColor];
  double v6 = [v5 color];

  if (!v6)
  {
    if ([v3 elementType] == 48)
    {
      double v6 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
    }
    else
    {
      double v6 = 0;
    }
  }

  return v6;
}

- (Class)cellClassForViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  double v6 = 0;
  if (v5 > 48)
  {
    if (v5 <= 65)
    {
      if (v5 == 49 || v5 == 50) {
        goto LABEL_16;
      }
    }
    else
    {
      if (v5 == 66)
      {
        double v6 = [(SUUIGridViewElementPageSectionConfiguration *)self lockupCellClassWithLockup:v4];
        goto LABEL_17;
      }
      if (v5 == 141 || v5 == 152) {
        goto LABEL_16;
      }
    }
  }
  else if (v5 > 13)
  {
    if (v5 == 14)
    {
      double v6 = [(SUUIGridViewElementPageSectionConfiguration *)self _cardCellClassForCard:v4];
      goto LABEL_17;
    }
    if (v5 == 48) {
      goto LABEL_16;
    }
  }
  else if ((unint64_t)(v5 - 12) < 2 || v5 == 4)
  {
LABEL_16:
    double v6 = (objc_class *)objc_opt_class();
  }
LABEL_17:
  double v7 = v6;

  return v7;
}

- (id)cellForViewElement:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self->_pageSectionContext;
  uint64_t v9 = [v6 elementType];
  double v10 = 0;
  if (v9 <= 48)
  {
    if (v9 > 13)
    {
      if (v9 == 14)
      {
        uint64_t v17 = [v6 cardType];
        double v11 = [(SUUIStorePageSectionContext *)v8 collectionView];
        v12 = v11;
        if (v17 == 3) {
          uint64_t v13 = 0x270508F30;
        }
        else {
          uint64_t v13 = 0x27050B090;
        }
      }
      else
      {
        if (v9 != 48) {
          goto LABEL_20;
        }
        double v11 = [(SUUIStorePageSectionContext *)v8 collectionView];
        v12 = v11;
        uint64_t v13 = 0x270509D90;
      }
      goto LABEL_17;
    }
    if ((unint64_t)(v9 - 12) >= 2)
    {
      if (v9 != 4) {
        goto LABEL_20;
      }
      double v11 = [(SUUIStorePageSectionContext *)v8 collectionView];
      v12 = v11;
      uint64_t v13 = 0x270503770;
      goto LABEL_17;
    }
LABEL_16:
    double v11 = [(SUUIStorePageSectionContext *)v8 collectionView];
    v12 = v11;
    uint64_t v13 = 0x270503790;
LABEL_17:
    double v10 = [v11 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v7];
    goto LABEL_18;
  }
  if (v9 <= 65)
  {
    if (v9 != 49)
    {
      if (v9 != 50) {
        goto LABEL_20;
      }
      goto LABEL_16;
    }
    goto LABEL_23;
  }
  switch(v9)
  {
    case 66:
      v12 = [(SUUIGridViewElementPageSectionConfiguration *)self _lockupCellReuseIdentifierWithLockup:v6];
      v16 = [(SUUIStorePageSectionContext *)v8 collectionView];
      double v10 = [v16 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v7];

LABEL_18:
      if (!v10) {
        break;
      }
      goto LABEL_19;
    case 141:
      goto LABEL_16;
    case 152:
LABEL_23:
      v15 = [(SUUIStorePageSectionContext *)v8 collectionView];
      double v10 = [v15 dequeueReusableCellWithReuseIdentifier:0x2704FE9D0 forIndexPath:v7];

      [v10 setShowsReflectionImage:0];
      if (v10) {
LABEL_19:
      }
        [(SUUIGridViewElementPageSectionConfiguration *)self configureCell:v10 forViewElement:v6 indexPath:v7];
      break;
  }
LABEL_20:

  return v10;
}

- (CGSize)cellSizeForViewElement:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v39 = 0;
  v40 = (double *)&v39;
  uint64_t v41 = 0x3010000000;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  v42 = "";
  [(SUUIGridViewElementPageSectionConfiguration *)self columnWidth];
  *((void *)v40 + 4) = v8;
  [(SUUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
  double v10 = v9;
  if ([v6 elementType] == 48)
  {
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellInsetsForViewElement:v6 indexPath:v7];
    double v12 = v11;
    double v14 = v13;
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellHeightForViewElement:v6 width:v10 - v15 - v16];
    uint64_t v17 = v40;
    double v19 = v14 + v12 + v18;
    v40[4] = v10;
    v17[5] = v19;
  }
  else
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    char v38 = 0;
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
    uint64_t v31 = 0;
    v32 = (double *)&v31;
    uint64_t v33 = 0x4010000000;
    v34 = "";
    long long v20 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    long long v35 = *MEMORY[0x263F834E8];
    long long v36 = v20;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __80__SUUIGridViewElementPageSectionConfiguration_cellSizeForViewElement_indexPath___block_invoke;
    v25[3] = &unk_265405EA0;
    uint64_t v30 = v21;
    v25[4] = self;
    v27 = &v31;
    v28 = &v39;
    v29 = v37;
    id v26 = v7;
    [(SUUIGridViewElementPageSectionConfiguration *)self _enumerateViewElementsForRowOfIndexPath:v26 usingBlock:v25];
    v40[5] = v32[6] + v32[4] + v40[5];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(v37, 8);
    uint64_t v17 = v40;
    double v10 = v40[4];
    double v19 = v40[5];
  }
  if (v19 >= self->_minimumCellHeight) {
    double minimumCellHeight = v19;
  }
  else {
    double minimumCellHeight = self->_minimumCellHeight;
  }
  v17[5] = minimumCellHeight;
  _Block_object_dispose(&v39, 8);

  double v23 = v10;
  double v24 = minimumCellHeight;
  result.height = v24;
  result.width = v23;
  return result;
}

void __80__SUUIGridViewElementPageSectionConfiguration_cellSizeForViewElement_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v27 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _cellInsetsForViewElement:v27 indexPath:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = *(unsigned char **)(a1 + 32);
  double v15 = *(double *)(a1 + 72) - v8 - v12;
  if (v14[96]) {
    double v16 = v15;
  }
  else {
    double v16 = *(double *)(a1 + 72);
  }
  [v14 _cellHeightForViewElement:v27 width:v16];
  double v18 = v17;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 236))
  {
    if ([v27 rendersWithPerspective])
    {
      double v19 = (void *)[*(id *)(a1 + 32) cellClassForViewElement:v27];
      if (class_conformsToProtocol((Class)v19, (Protocol *)&unk_270640F38))
      {
        objc_msgSend(v19, "maximumPerspectiveHeightForSize:", v16, v18);
        double v7 = v20;
      }
    }
  }
  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
  double v22 = *(double *)(v21 + 48);
  if (v22 < v11) {
    double v22 = v11;
  }
  *(double *)(v21 + 48) = v22;
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  double v24 = *(double *)(v23 + 32);
  if (v24 < v7) {
    double v24 = v7;
  }
  *(double *)(v23 + 32) = v24;
  uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
  double v26 = *(double *)(v25 + 40);
  if (v26 < v18) {
    double v26 = v18;
  }
  *(double *)(v25 + 40) = v26;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && [*(id *)(a1 + 40) isEqual:v5])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = v13 + v9 + v16;
  }
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [v4 indexPath];
  objc_msgSend(v4, "setPosition:", -[SUUIGridViewElementPageSectionConfiguration positionForIndexPath:](self, "positionForIndexPath:", v5));
}

- (void)configureCell:(id)a3 forViewElement:(id)a4 indexPath:(id)a5
{
  id v71 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = self->_pageSectionContext;
  uint64_t v11 = [v8 elementType];
  id v12 = 0;
  int v13 = 0;
  if (v11 <= 48)
  {
    if (v11 == 14)
    {
      if ([v8 cardType] != 3)
      {
        id v12 = v71;
        int v13 = 0;
        goto LABEL_7;
      }
LABEL_6:
      int v13 = 0;
      id v12 = 0;
LABEL_7:
      BOOL v14 = 0;
      goto LABEL_12;
    }
    BOOL v14 = 0;
    if (v11 == 48)
    {
      id v12 = 0;
      BOOL v14 = 0;
      int v13 = 1;
    }
  }
  else
  {
    if (v11 == 49)
    {
LABEL_5:
      [v71 setShowsReflectionImage:0];
      goto LABEL_6;
    }
    if (v11 != 66)
    {
      BOOL v14 = 0;
      if (v11 != 152) {
        goto LABEL_12;
      }
      goto LABEL_5;
    }
    double v15 = [(SUUIGridViewElementPageSectionConfiguration *)self _lockupCellReuseIdentifierWithLockup:v8];
    BOOL v14 = v15 == @"SUUIHorizontalLockupReuseID";

    int v13 = 0;
    id v12 = 0;
  }
LABEL_12:
  double v16 = self->_separatorColor;
  double top = self->_separatorWidths.top;
  double left = self->_separatorWidths.left;
  double bottom = self->_separatorWidths.bottom;
  double right = self->_separatorWidths.right;
  CGFloat v21 = self->_separatorMargins.top;
  CGFloat v22 = self->_separatorMargins.left;
  CGFloat v23 = self->_separatorMargins.bottom;
  CGFloat v24 = self->_separatorMargins.right;
  if (v13)
  {
    uint64_t v25 = [v8 style];
    uint64_t separatorStyle = [v25 valueForStyle:*MEMORY[0x263F4B358]];

    id v69 = v9;
    if (separatorStyle)
    {
      [v25 borderWidths];
      double top = v27;
      double left = v28;
      double bottom = v29;
      double right = v30;
      uint64_t separatorStyle = 2;
    }
    uint64_t v31 = [v25 valueForStyle:*MEMORY[0x263F4B348]];

    BOOL v68 = v14;
    v32 = v10;
    if (v31)
    {
      uint64_t v33 = [v25 ikBorderColor];
      uint64_t v34 = [v33 color];

      double v16 = (UIColor *)v34;
    }
    long long v35 = [v25 valueForStyle:*MEMORY[0x263F4B350]];

    if (v35)
    {
      [v25 borderMargins];
      CGFloat v21 = v36;
      CGFloat v22 = v37;
      CGFloat v23 = v38;
      CGFloat v24 = v39;
    }
    v40 = [v8 parent];
    uint64_t v41 = [v40 style];
    v42 = [v41 ikBackgroundColor];

    if (v42 && [v42 colorType] == 3) {
      self->_hasHeader = 1;
    }

    id v9 = v69;
    double v10 = v32;
    BOOL v14 = v68;
  }
  else
  {
    uint64_t separatorStyle = self->_separatorStyle;
    if (self->_hasHeader && [v9 item] == 1) {
      uint64_t separatorStyle = 0;
    }
  }
  double v70 = v24;
  double v43 = v23;
  double v44 = v22;
  double v45 = v21;
  if ([v8 elementType] == 48)
  {
    [(SUUIStorePageSectionContext *)v10 activePageWidth];
    double v47 = v46;
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellPaddingLeftEdgeHorizontal];
    double v49 = v47 - v48;
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellPaddingRightEdgeHorizontal];
    double v51 = v49 - v50;
  }
  else
  {
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
    double v51 = v52;
  }
  [v71 reloadWithViewElement:v8 width:self->_cellLayoutContext context:v51];
  [v71 setSeparatorColor:v16];
  [v71 setSeparatorStyle:separatorStyle];
  objc_msgSend(v71, "setSeparatorWidths:", top, left, bottom, right);
  objc_msgSend(v71, "setSeparatorInsets:", v45, v44, v43, v70);
  if (v14) {
    [v71 setEditing:self->_showsEditMode animated:0];
  }
  [(SUUIGridViewElementPageSectionConfiguration *)self _normalizedContentInsetForViewElement:v8 indexPath:v9];
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  if ([(SUUIGridViewElementPageSectionConfiguration *)self rendersWithPerspective]
    && [v71 conformsToProtocol:&unk_270640F38])
  {
    id v61 = v71;
    v62 = [(SUUIStorePageSectionContext *)self->_pageSectionContext parentViewController];
    v63 = [v62 view];

    [v61 setPerspectiveTargetView:v63];
    [v63 bounds];
    objc_msgSend(v61, "setVanishingPoint:", CGRectGetMidX(v73), -800.0);
    if ([v8 rendersWithPerspective])
    {
      [(id)objc_opt_class() sizeThatFitsWidth:v8 viewElement:self->_cellLayoutContext context:v51];
      objc_msgSend((id)objc_opt_class(), "maximumPerspectiveHeightForSize:", v64, v65);
      if (v54 < v66) {
        double v54 = v66;
      }
    }
  }
  objc_msgSend(v71, "setContentInset:", v54, v56, v58, v60);
  if (v12)
  {
    v67 = [(SUUIGridViewElementPageSectionConfiguration *)self _cardArtworkBoundingSizeForIndexPath:v9];
    [v12 setArtworkBoundingSize:v67];
  }
}

- (Class)lockupCellClassWithLockup:(id)a3
{
  if ((unint64_t)[(SUUIGridViewElementPageSectionConfiguration *)self _lockupTypeForLockup:a3] <= 8)
  {
    id v3 = objc_opt_class();
  }
  return (Class)v3;
}

- (int64_t)positionForIndexPath:(id)a3
{
  unint64_t v5 = [a3 item];
  int64_t v6 = 1;
  int64_t v11 = 1;
  if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v7 = v5;
    if (v5 >= [(NSArray *)self->_positions count])
    {
      int64_t v6 = 1;
    }
    else
    {
      id v8 = [(NSArray *)self->_positions objectAtIndex:v7];
      int64_t v6 = [v8 integerValue];
      int64_t v11 = v6;
    }
  }
  if (*(unsigned char *)&self->_dataSourceRespondsToSelectorFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained gridViewElementPageSectionConfiguration:self configurePosition:&v11 forItemAtIndexPath:a3];

    return v11;
  }
  return v6;
}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  id v3 = a3;
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270503770];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270503790];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x27050B090];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270508F30];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2705094D0];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2704FE9D0];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x27050B010];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270509D90];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270503310];
}

- (void)reloadCellWithIndexPath:(id)a3 forViewElement:(id)a4 reason:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = [(SUUIStorePageSectionContext *)self->_pageSectionContext collectionView];
  double v10 = [v9 cellForItemAtIndexPath:v12];

  [(SUUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
  objc_msgSend(v10, "reloadWithViewElement:width:context:", v8, self->_cellLayoutContext);
  if (a5 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 setEditing:self->_showsEditMode animated:1];
    }
  }
  if ([(SUUIGridViewElementPageSectionConfiguration *)self viewElementIsStandardCard:v8])
  {
    int64_t v11 = [(SUUIGridViewElementPageSectionConfiguration *)self _cardArtworkBoundingSizeForIndexPath:v12];
    [v10 setArtworkBoundingSize:v11];
  }
  [(SUUIGridViewElementPageSectionConfiguration *)self _normalizedContentInsetForViewElement:v8 indexPath:v12];
  objc_msgSend(v10, "setContentInset:");
}

- (void)requestCellLayoutForViewElement:(id)a3
{
  id v11 = a3;
  id v4 = [(SUUIGridViewElementPageSectionConfiguration *)self cellClassForViewElement:v11];
  if ([v11 elementType] == 48)
  {
    [(SUUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
    double v6 = v5;
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellPaddingLeftEdgeHorizontal];
    double v8 = v6 - v7;
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellPaddingRightEdgeHorizontal];
    double v10 = v8 - v9;
  }
  else
  {
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
  }
  [(objc_class *)v4 requestLayoutForViewElement:v11 width:self->_cellLayoutContext context:(double)(uint64_t)v10];
}

- (UIEdgeInsets)sectionContentInsetAdjustedFromValue:(UIEdgeInsets)a3 forGridViewElement:(id)a4
{
  CGFloat right = a3.right;
  double bottom = a3.bottom;
  CGFloat left = a3.left;
  double top = a3.top;
  char v16 = 0;
  double v8 = [a4 style];
  double v9 = SUUIViewElementPaddingForStyle(v8, &v16);
  double v11 = v10;

  if (v16) {
    double v12 = v11;
  }
  else {
    double v12 = bottom;
  }
  if (v16) {
    double v13 = v9;
  }
  else {
    double v13 = top;
  }
  double v14 = left;
  double v15 = right;
  result.CGFloat right = v15;
  result.double bottom = v12;
  result.CGFloat left = v14;
  result.double top = v13;
  return result;
}

- (void)updateLayoutPropertiesForGridViewElement:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(SUUIGridViewElementPageSectionConfiguration *)self pageSectionContext];
  [v5 activePageWidth];
  double v7 = v6;
  self->_cellContentWidth = 0.0;
  double v8 = [v4 style];
  [(SUUIGridViewElementPageSectionConfiguration *)self setNumberOfColumns:[(SUUIGridViewElementPageSectionConfiguration *)self _numberOfColumnsForWidth:v8 style:v7]];

  uint64_t v31 = v5;
  double v9 = [v5 clientContext];
  uint64_t v10 = SUUIUserInterfaceIdiom(v9);

  if (v10 == 1)
  {
    if ([(SUUIGridViewElementPageSectionConfiguration *)self _isContainedWithinExploreTemplateWithGridViewElement:v4])
    {
      int64_t v11 = 3;
    }
    else
    {
      int64_t v11 = 4;
    }
LABEL_10:
    self->_cardVerticalSpacingStyle = v11;
    goto LABEL_11;
  }
  if (v7 >= 414.0)
  {
    if (self->_numberOfColumns > 1) {
      int64_t v11 = 2;
    }
    else {
      int64_t v11 = 1;
    }
    goto LABEL_10;
  }
  self->_cardVerticalSpacingStyle = 0;
LABEL_11:
  double v12 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v32 = v4;
  id obj = [v4 flattenedChildren];
  uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v13)
  {
    unint64_t v16 = 0;
    goto LABEL_37;
  }
  uint64_t v14 = v13;
  int64_t v15 = 0;
  unint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v35 != v19) {
        objc_enumerationMutation(obj);
      }
      int64_t numberOfColumns = self->_numberOfColumns;
      if (numberOfColumns == 1) {
        goto LABEL_19;
      }
      if ([*(id *)(*((void *)&v34 + 1) + 8 * i) elementType] == 48)
      {
        int64_t numberOfColumns = self->_numberOfColumns;
        int64_t v15 = numberOfColumns - 1;
LABEL_19:
        unsigned int v22 = 5;
        unint64_t v16 = v18 + i;
        goto LABEL_25;
      }
      int64_t numberOfColumns = self->_numberOfColumns;
      if (v15 == numberOfColumns - 1) {
        unsigned int v22 = 4;
      }
      else {
        unsigned int v22 = 2;
      }
      if (!v15)
      {
        int64_t v15 = 0;
        unint64_t v16 = v18 + i;
        unsigned int v22 = 1;
      }
LABEL_25:
      if (v17) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = v22 | 8;
      }
      int64_t v24 = numberOfColumns - 1;
      BOOL v25 = v15 < v24;
      if (v15 < v24) {
        ++v15;
      }
      else {
        int64_t v15 = 0;
      }
      if (!v25) {
        ++v17;
      }
      double v26 = [NSNumber numberWithInt:v23];
      [(NSArray *)v12 addObject:v26];
    }
    v18 += v14;
    uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  }
  while (v14);
LABEL_37:

  for (; v16 < [(NSArray *)v12 count]; ++v16)
  {
    double v27 = [(NSArray *)v12 objectAtIndex:v16];
    int v28 = [v27 integerValue];

    double v29 = [NSNumber numberWithInt:v28 | 0x20u];
    [(NSArray *)v12 replaceObjectAtIndex:v16 withObject:v29];
  }
  positions = self->_positions;
  self->_positions = v12;
}

- (void)updateStylePropertiesForGridViewElement:(id)a3 gridItemViewElements:(id)a4 numberOfGridItems:(unint64_t)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v7 = a3;
  double v8 = (NSArray *)a4;
  double v9 = [MEMORY[0x263F825C8] separatorColor];
  uint64_t v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 scale];
  double v12 = v11;

  if ([v7 elementType] == 45) {
    char v13 = [v7 showsEditMode];
  }
  else {
    char v13 = 0;
  }
  self->_showsEditMode = v13;
  uint64_t v14 = [v7 style];
  int64_t v15 = [v14 itemWidth];
  unint64_t v16 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v17 = [v15 stringByTrimmingCharactersInSet:v16];

  [v17 floatValue];
  self->_double gridViewElementStyleItemWidth = v18;
  BOOL v68 = v17;
  char v19 = [v17 hasSuffix:@"%"];
  self->_gridViewElementStyleItemWidthIsPercentage = v19;
  if (v19)
  {
    double gridViewElementStyleItemWidth = self->_gridViewElementStyleItemWidth;
    self->_gridIsEdgeToEdge = gridViewElementStyleItemWidth == 100.0;
    p_gridIsEdgeToEdge = &self->_gridIsEdgeToEdge;
    if (gridViewElementStyleItemWidth == 100.0)
    {
      uint64_t v22 = [MEMORY[0x263F825C8] whiteColor];

      CGFloat v24 = *MEMORY[0x263F834E8];
      CGFloat v23 = *(double *)(MEMORY[0x263F834E8] + 8);
      CGFloat v25 = *(double *)(MEMORY[0x263F834E8] + 16);
      CGFloat v26 = *(double *)(MEMORY[0x263F834E8] + 24);
      double v9 = (void *)v22;
      goto LABEL_9;
    }
  }
  else
  {
    self->_gridIsEdgeToEdge = 0;
    p_gridIsEdgeToEdge = &self->_gridIsEdgeToEdge;
  }
  CGFloat v25 = 0.0;
  CGFloat v26 = 15.0;
  CGFloat v23 = 15.0;
  CGFloat v24 = 0.0;
LABEL_9:
  double v27 = 1.0 / v12;
  int v28 = [v14 ikBorderColor];
  double v29 = [v28 color];

  if (v29)
  {
    id v30 = v29;
    if (CGColorGetAlpha((CGColorRef)[v30 CGColor]) <= 0.00000011920929)
    {

      double v9 = 0;
      int64_t v33 = 0;
      CGFloat v34 = v27;
      CGFloat v35 = v27;
      CGFloat v36 = v27;
      goto LABEL_29;
    }
    id v31 = v30;

    double v9 = v31;
  }
  v32 = [v14 dividerType];
  if ([v32 isEqualToString:@"grid-full"])
  {
    int64_t v33 = 2;
  }
  else if ([v32 isEqualToString:@"grid-top"])
  {
    int64_t v33 = 3;
  }
  else if ([v32 isEqualToString:@"full"])
  {
    int64_t v33 = 4;
  }
  else if ([v32 isEqualToString:@"grid-vertical"])
  {
    int64_t v33 = 6;
  }
  else if ([v32 isEqualToString:@"none"])
  {
    int64_t v33 = 0;
  }
  else if (*p_gridIsEdgeToEdge || ([v32 isEqualToString:@"edge-to-edge"] & 1) != 0)
  {
    int64_t v33 = 7;
  }
  else
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v8;
    uint64_t v62 = [(NSArray *)obj countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v66 = *(void *)v70;
      int64_t v33 = 1;
LABEL_46:
      uint64_t v64 = 0;
      while (1)
      {
        if (*(void *)v70 != v66) {
          objc_enumerationMutation(obj);
        }
        if (!SUUIIKViewElementTypeIsButton([*(id *)(*((void *)&v69 + 1) + 8 * v64) elementType])) {
          break;
        }
        if (v63 == ++v64)
        {
          uint64_t v63 = [(NSArray *)obj countByEnumeratingWithState:&v69 objects:v73 count:16];
          if (v63) {
            goto LABEL_46;
          }
          goto LABEL_52;
        }
      }
    }
    else
    {
LABEL_52:
      int64_t v33 = 4;
    }
  }
  long long v37 = [v14 valueForStyle:*MEMORY[0x263F4B358]];

  CGFloat v34 = v27;
  CGFloat v35 = v27;
  CGFloat v36 = v27;
  if (v37)
  {
    [v14 borderWidths];
    CGFloat v36 = v38;
    CGFloat v35 = v39;
    CGFloat v34 = v40;
    double v27 = v41;
  }

LABEL_29:
  v42 = v8;
  double v43 = [v14 valueForStyle:*MEMORY[0x263F4B350]];

  if (v43)
  {
    [v14 borderMargins];
    CGFloat v24 = v44;
    CGFloat v23 = v45;
    CGFloat v25 = v46;
    CGFloat v26 = v47;
  }
  double v48 = [v14 valueForStyle:*MEMORY[0x263F4B390]];
  BOOL v49 = 1;
  if (!v48)
  {
    double v50 = [v14 valueForStyle:@"itml-padding"];
    BOOL v49 = v50 != 0;
  }
  if (v14) {
    BOOL v51 = v49;
  }
  else {
    BOOL v51 = 0;
  }
  self->_hasGridViewElementStyle = v51;
  [v14 elementPadding];
  self->_gridViewElementStyleElementPadding.double top = v52;
  self->_gridViewElementStyleElementPadding.CGFloat left = v53;
  self->_gridViewElementStyleElementPadding.double bottom = v54;
  self->_gridViewElementStyleElementPadding.CGFloat right = v55;
  self->_numberOfGridItems = a5;
  self->_uint64_t separatorStyle = v33;
  objc_storeStrong((id *)&self->_separatorColor, v9);
  self->_separatorMargins.double top = v24;
  self->_separatorMargins.CGFloat left = v23;
  self->_separatorMargins.double bottom = v25;
  self->_separatorMargins.CGFloat right = v26;
  self->_separatorWidths.double top = v36;
  self->_separatorWidths.CGFloat left = v35;
  self->_separatorWidths.double bottom = v34;
  self->_separatorWidths.CGFloat right = v27;
  viewElements = self->_viewElements;
  self->_viewElements = v42;

  self->_cellContentWidth = 0.0;
  self->_cellPaddingNeedsReloading = 1;
  self->_cellPaddingLeftEdgeHorizontal = 0.0;
  self->_cellPaddingRightEdgeHorizontal = 0.0;
  self->_cellPaddingInteriorHorizontal = 0.0;
  double v57 = [v7 style];
  double v58 = [v57 lockupType];

  if (v58) {
    int64_t v59 = SUUILockupViewTypeForString(v58);
  }
  else {
    int64_t v59 = -1;
  }
  self->_lockupType = v59;
  double v60 = [v14 itemHeight];
  if (v60 || ([v14 rowHeight], (double v60 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v60 floatValue];
    self->_double minimumCellHeight = v61;
  }
  else
  {
    self->_double minimumCellHeight = 44.0;
  }
}

- (BOOL)viewElementIsStandardCard:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 elementType] == 14 && objc_msgSend(v3, "cardType") != 3;

  return v4;
}

- (id)_cardArtworkBoundingSizeForIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = 0;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__50;
  uint64_t v14 = __Block_byref_object_dispose__50;
  id v15 = 0;
  if (self->_numberOfColumns >= 2)
  {
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __84__SUUIGridViewElementPageSectionConfiguration__cardArtworkBoundingSizeForIndexPath___block_invoke;
    v9[3] = &unk_265405EC8;
    v9[6] = v6;
    v9[4] = self;
    v9[5] = &v10;
    [(SUUIGridViewElementPageSectionConfiguration *)self _enumerateViewElementsForRowOfIndexPath:v4 usingBlock:v9];
    double v5 = (void *)v11[5];
  }
  id v7 = v5;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __84__SUUIGridViewElementPageSectionConfiguration__cardArtworkBoundingSizeForIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "viewElementIsStandardCard:"))
  {
    +[SUUICardViewElementCollectionViewCell artworkBoundingSizeWithViewElement:v9 width:*(void *)(*(void *)(a1 + 32) + 240) context:*(double *)(a1 + 48)];
    double v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      objc_msgSend(v5, "unionWithSize:", v3, v4);
    }
    else
    {
      uint64_t v6 = -[SUUISizeValue initWithSize:]([SUUISizeValue alloc], "initWithSize:", v3, v4);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      double v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
}

- (Class)_cardCellClassForCard:(id)a3
{
  [a3 cardType];
  double v3 = objc_opt_class();
  return (Class)v3;
}

- (double)_cellContentWidth
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  double result = self->_cellContentWidth;
  if (result >= 0.00000011920929) {
    return result;
  }
  double result = self->_gridViewElementStyleItemWidth;
  if (result <= 0.00000011920929)
  {
    [(SUUIGridViewElementPageSectionConfiguration *)self columnContentWidth];
    double v8 = v7;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = self->_viewElements;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v10) {
      goto LABEL_36;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "elementType", (void)v18);
        if (v15 == 66)
        {
          if ([v14 lockupViewType] == 7)
          {
            [(SUUIGridViewElementPageSectionConfiguration *)self columnWidth];
LABEL_33:
            self->_double cellContentWidth = v16;
            continue;
          }
          if ([v14 lockupViewType] == 2 && v8 <= 0.0)
          {
            +[SUUIHorizontalLockupCollectionViewCell preferredSizeForViewElement:v14 context:self->_cellLayoutContext];
            -[SUUIGridViewElementPageSectionConfiguration _columnContentWidthPaddingForWidth:](self, "_columnContentWidthPaddingForWidth:");
            double cellContentWidth = self->_cellContentWidth;
LABEL_31:
            if (cellContentWidth >= v16) {
              double v16 = cellContentWidth;
            }
            goto LABEL_33;
          }
LABEL_28:
          double v16 = self->_cellContentWidth;
          if (v16 < v8) {
            double v16 = v8;
          }
          goto LABEL_33;
        }
        if (v15 != 48)
        {
          if (v15 == 14
            && [(SUUIGridViewElementPageSectionConfiguration *)self viewElementIsStandardCard:v14])
          {
            +[SUUICardViewElementCollectionViewCell preferredSizeForViewElement:v14 context:self->_cellLayoutContext];
            double cellContentWidth = self->_cellContentWidth;
            if (v16 >= v8) {
              double v16 = v8;
            }
            goto LABEL_31;
          }
          goto LABEL_28;
        }
        double v16 = v8;
        if (self->_cellContentWidth < 0.00000011920929) {
          goto LABEL_33;
        }
      }
      uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v16);
      if (!v11)
      {
LABEL_36:

        return self->_cellContentWidth;
      }
    }
  }
  if (self->_gridViewElementStyleItemWidthIsPercentage)
  {
    double v4 = result / 100.0;
    double v5 = 1.0;
    if (v4 <= 1.0)
    {
      double v5 = v4;
      if (v4 < 0.00000011920929) {
        double v5 = 0.0;
      }
    }
    [(SUUIGridViewElementPageSectionConfiguration *)self columnWidth];
    double result = v5 * v6;
  }
  self->_double cellContentWidth = result;
  return result;
}

- (double)_cellHeightForViewElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  double v7 = [(SUUIGridViewElementPageSectionConfiguration *)self cellClassForViewElement:v6];
  if (v7)
  {
    [(objc_class *)v7 sizeThatFitsWidth:v6 viewElement:self->_cellLayoutContext context:a4];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }
  uint64_t v10 = [v6 style];
  uint64_t v11 = [v10 itemHeight];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 floatValue];
    double v14 = v13;
  }
  else
  {
    uint64_t v15 = [v10 rowHeight];
    double v16 = v15;
    if (v15)
    {
      [v15 floatValue];
      double v14 = v17;
    }
    else
    {
      double v14 = 0.0;
    }
  }
  if (v9 < v14) {
    double v9 = v14;
  }

  return v9;
}

- (UIEdgeInsets)_cellInsetsForViewElement:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = *MEMORY[0x263F834E8];
  double v57 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v9 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v10 = *(double *)(MEMORY[0x263F834E8] + 24);
  uint64_t v11 = [v6 style];
  char v58 = 0;
  double v12 = SUUIViewElementPaddingForStyle(v11, &v58);
  if (v58)
  {
    double v16 = v8 + v12;
    double v17 = v9 + v14;
    double v18 = v57 + v13;
    double v19 = v10 + v15;
    goto LABEL_18;
  }
  double v19 = v10;
  double v17 = v9;
  double v18 = v57;
  double v16 = v8;
  if (!self->_hasGridViewElementStyle)
  {
    uint64_t v20 = objc_msgSend(v6, "elementType", v12);
    if (v20 > 47)
    {
      if (v20 == 48)
      {
        double v17 = v9 + 10.0;
        double v16 = v8 + 4.0;
        [(SUUIGridViewElementPageSectionConfiguration *)self _cellPaddingLeftEdgeHorizontal];
        double v18 = v57 + v50;
        [(SUUIGridViewElementPageSectionConfiguration *)self _cellPaddingRightEdgeHorizontal];
        double v19 = v10 + v51;
        goto LABEL_18;
      }
      if (v20 != 141 && v20 != 50)
      {
LABEL_14:
        double v21 = 10.0;
LABEL_15:
        double v17 = v9 + v21;
LABEL_16:
        double v16 = v8 + v21;
LABEL_17:
        double v19 = v10;
        double v18 = v57;
        goto LABEL_18;
      }
    }
    else if ((unint64_t)(v20 - 12) >= 2)
    {
      if (v20 == 14
        && [(SUUIGridViewElementPageSectionConfiguration *)self viewElementIsStandardCard:v6])
      {
        double v19 = v10;
        double v17 = v9;
        double v18 = v57;
        double v16 = v8;
        switch(self->_cardVerticalSpacingStyle)
        {
          case 0:
          case 4:
            double v17 = v9 + 30.0;
            double v21 = 20.0;
            goto LABEL_16;
          case 1:
            double v21 = 25.0;
            goto LABEL_15;
          case 2:
            double v17 = v9 + 24.0;
            double v21 = 33.0;
            goto LABEL_16;
          case 3:
            CGFloat v52 = [v6 firstChildForElementType:66];

            if (v52) {
              double v17 = v9 + 20.0;
            }
            else {
              double v17 = v9;
            }
            if (v52) {
              double v16 = v8 + 30.0;
            }
            else {
              double v16 = v8 + 25.0;
            }
            goto LABEL_17;
          default:
            goto LABEL_18;
        }
        goto LABEL_18;
      }
      goto LABEL_14;
    }
    double v17 = v9 + 12.0;
    double v21 = 11.0;
    goto LABEL_16;
  }
LABEL_18:
  if ([v6 elementType] != 48)
  {
    double v55 = v16;
    double v56 = v17;
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellPaddingInteriorHorizontal];
    double v23 = v19 + v18 + v22 * 2.0;
    [(SUUIGridViewElementPageSectionConfiguration *)self columnContentWidth];
    double v25 = v23 + v24;
    [(SUUIGridViewElementPageSectionConfiguration *)self columnWidth];
    BOOL v27 = v25 <= v26;
    if (v25 <= v26) {
      double v28 = v19;
    }
    else {
      double v28 = 0.0;
    }
    if (v27) {
      double v29 = v18;
    }
    else {
      double v29 = 0.0;
    }
    [(SUUIGridViewElementPageSectionConfiguration *)self _cellPaddingInteriorHorizontal];
    double v31 = v30;
    char v32 = [(SUUIGridViewElementPageSectionConfiguration *)self positionForIndexPath:v7];
    if (v32)
    {
      [(SUUIGridViewElementPageSectionConfiguration *)self _cellPaddingLeftEdgeHorizontal];
      double v35 = v34;
      double v33 = v31;
    }
    else
    {
      if ((v32 & 4) != 0) {
        [(SUUIGridViewElementPageSectionConfiguration *)self _cellPaddingRightEdgeHorizontal];
      }
      else {
        double v33 = v31;
      }
      double v35 = v31;
    }
    double v18 = v29 + v35;
    double v19 = v28 + v33;
    if ([v6 elementType] == 66)
    {
      double v53 = v9;
      double v54 = v10;
      CGFloat v36 = [(SUUIGridViewElementPageSectionConfiguration *)self cellLayoutContext];
      [v36 largeScreenElementPadding];
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;

      if (v57 != v40 || v8 != v38 || v54 != v44 || v53 != v42)
      {
        double v19 = v44;
        double v55 = v38;
        double v56 = v42;
        double v18 = v40;
      }
      double v45 = -0.0;
      if (self->_gridViewElementStyleItemWidthIsPercentage) {
        double v45 = v31;
      }
      double v17 = v56 + v45;
      double v16 = v55 + v45;
    }
    else
    {
      double v17 = v56;
    }
  }

  double v46 = v16;
  double v47 = v18;
  double v48 = v17;
  double v49 = v19;
  result.CGFloat right = v49;
  result.double bottom = v48;
  result.CGFloat left = v47;
  result.double top = v46;
  return result;
}

- (double)_cellPaddingInteriorHorizontal
{
  return self->_cellPaddingInteriorHorizontal;
}

- (double)_cellPaddingLeftEdgeHorizontal
{
  return self->_cellPaddingLeftEdgeHorizontal;
}

- (double)_cellPaddingRightEdgeHorizontal
{
  return self->_cellPaddingRightEdgeHorizontal;
}

- (double)_columnContentWidthPaddingForWidth:(double)a3
{
  BOOL v5 = [(SUUIGridViewElementPageSectionConfiguration *)self _useOrdinalPadding];
  id v6 = [(SUUIGridViewElementPageSectionConfiguration *)self pageSectionContext];
  [v6 horizontalPadding];
  double v8 = a3 - v7;
  double v9 = a3 + v7 * -2.0;
  if (v5) {
    double v10 = v8;
  }
  else {
    double v10 = v9;
  }

  return v10;
}

- (void)_enumerateViewElementsForRowOfIndexPath:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, void *, void *, unsigned char *))a4;
  uint64_t v8 = [v6 item] / self->_numberOfColumns * self->_numberOfColumns;
  double v18 = v6;
  uint64_t v9 = [v6 section];
  char v19 = 0;
  int64_t numberOfGridItems = self->_numberOfGridItems;
  uint64_t v11 = [(SUUIGridViewElementPageSectionConfiguration *)self dataSource];
  int64_t v12 = v8;
  do
  {
    if (v12 >= self->_numberOfColumns + v8 || v12 >= numberOfGridItems) {
      break;
    }
    double v14 = (void *)MEMORY[0x25A2A9B80]();
    double v15 = [MEMORY[0x263F088C8] indexPathForItem:v12 inSection:v9];
    double v16 = [v11 gridViewElementPageSectionConfiguration:self viewElementForIndexPath:v15];
    double v17 = v16;
    if (v16 && [v16 elementType] != 48) {
      v7[2](v7, v17, v15, &v19);
    }

    ++v12;
  }
  while (!v19);
}

- (BOOL)_isContainedWithinExploreTemplateWithGridViewElement:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    BOOL v5 = v3;
    do
    {
      uint64_t v6 = [v5 elementType];
      double v7 = [v5 parent];

      BOOL v5 = v7;
      BOOL v8 = v6 == 37;
    }
    while (!v8 && v7);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_lockupCellReuseIdentifierWithLockup:(id)a3
{
  unint64_t v3 = [(SUUIGridViewElementPageSectionConfiguration *)self _lockupTypeForLockup:a3];
  if (v3 <= 8) {
    id v4 = (id)*off_265405F58[v3];
  }
  return v4;
}

- (int64_t)_lockupTypeForLockup:(id)a3
{
  int64_t result = self->_lockupType;
  if (result == -1) {
    return [a3 lockupViewType];
  }
  return result;
}

- (UIEdgeInsets)_normalizedContentInsetForViewElement:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  double v25 = (double *)&v24;
  uint64_t v26 = 0x4010000000;
  BOOL v27 = "";
  long long v28 = 0u;
  long long v29 = 0u;
  [(SUUIGridViewElementPageSectionConfiguration *)self _cellInsetsForViewElement:v6 indexPath:v7];
  *(void *)&long long v28 = v8;
  *((void *)&v28 + 1) = v9;
  *(void *)&long long v29 = v10;
  *((void *)&v29 + 1) = v11;
  if ([v6 elementType] != 48)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __95__SUUIGridViewElementPageSectionConfiguration__normalizedContentInsetForViewElement_indexPath___block_invoke;
    v20[3] = &unk_265405EF0;
    id v21 = v6;
    double v22 = self;
    double v23 = &v24;
    [(SUUIGridViewElementPageSectionConfiguration *)self _enumerateViewElementsForRowOfIndexPath:v7 usingBlock:v20];
  }
  double v12 = v25[4];
  double v13 = v25[5];
  double v14 = v25[6];
  double v15 = v25[7];
  _Block_object_dispose(&v24, 8);

  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.CGFloat right = v19;
  result.double bottom = v18;
  result.CGFloat left = v17;
  result.double top = v16;
  return result;
}

uint64_t __95__SUUIGridViewElementPageSectionConfiguration__normalizedContentInsetForViewElement_indexPath___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(result + 32) != a2)
  {
    uint64_t v3 = result;
    UIEdgeInsets result = [*(id *)(result + 40) _cellInsetsForViewElement:a2 indexPath:a3];
    uint64_t v6 = *(void *)(*(void *)(v3 + 48) + 8);
    double v7 = *(double *)(v6 + 48);
    if (v7 < v5) {
      double v7 = v5;
    }
    *(double *)(v6 + 48) = v7;
    uint64_t v8 = *(void *)(*(void *)(v3 + 48) + 8);
    if (*(double *)(v8 + 32) >= v4) {
      double v4 = *(double *)(v8 + 32);
    }
    *(double *)(v8 + 32) = v4;
  }
  return result;
}

- (int64_t)_numberOfColumnsForWidth:(double)a3 style:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (v6)
  {
    int64_t v8 = [v6 columnCount];
    int64_t v9 = [(SUUIStorePageSectionContext *)self->_pageSectionContext layoutStyle];
    if (v8 != -1)
    {
      if ((float)((float)v8 * 320.0) + 320.0 <= a3) {
        ++v8;
      }
      goto LABEL_18;
    }
  }
  else
  {
    int64_t v9 = [(SUUIStorePageSectionContext *)self->_pageSectionContext layoutStyle];
  }
  uint64_t v10 = (uint64_t)(a3 / 320.0);
  if (v10 <= 1) {
    uint64_t v10 = 1;
  }
  if ((unint64_t)v10 >= 3) {
    uint64_t v10 = 3;
  }
  uint64_t v11 = 1;
  if (a3 >= 640.0) {
    uint64_t v11 = 2;
  }
  if (v9 == 2) {
    uint64_t v10 = v11;
  }
  if (v9 == 1) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = v10;
  }
LABEL_18:

  return v8;
}

- (void)_reloadCellPaddingIfNeeded
{
  if (self->_cellPaddingNeedsReloading)
  {
    [(SUUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
    if (v3 <= 0.0)
    {
      int64_t v8 = [(SUUIGridViewElementPageSectionConfiguration *)self pageSectionContext];
      [v8 horizontalPadding];
      double v7 = v9 + v9;
    }
    else
    {
      [(SUUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
      double v5 = v4;
      [(SUUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
      *(float *)&double v6 = v5 - v6 * (double)self->_numberOfColumns;
      double v7 = floorf(*(float *)&v6);
    }
    BOOL v10 = [(SUUIGridViewElementPageSectionConfiguration *)self _useOrdinalPadding];
    BOOL v11 = v10;
    if (self->_numberOfColumns > 1)
    {
      if (self->_hasGridViewElementStyle)
      {
        CGFloat left = self->_gridViewElementStyleElementPadding.left;
        CGFloat right = self->_gridViewElementStyleElementPadding.right;
      }
      else
      {
        double v16 = [(SUUIGridViewElementPageSectionConfiguration *)self pageSectionContext];
        [v16 horizontalPadding];
        CGFloat left = v17;

        if (v11)
        {
          CGFloat right = left;
          CGFloat left = 0.0;
        }
        else
        {
          double v18 = [(SUUIGridViewElementPageSectionConfiguration *)self pageSectionContext];
          [v18 horizontalPadding];
          CGFloat right = v19;
        }
      }
      if (!self->_gridViewElementStyleItemWidthIsPercentage)
      {
        self->_cellPaddingLeftEdgeHorizontal = left;
        self->_cellPaddingRightEdgeHorizontal = right;
        int64_t numberOfColumns = self->_numberOfColumns;
        float v22 = (v7 - left - right) / (double)(numberOfColumns - 1) * 0.5;
        double v23 = floorf(v22);
        self->_cellPaddingInteriorHorizontal = v23;
        if (right < v23)
        {
          float v24 = v7 / (float)((float)(numberOfColumns + 1) + (float)(numberOfColumns + 1));
          double v25 = floorf(v24);
          double v26 = v25 + v25;
          self->_cellPaddingRightEdgeHorizontal = v25 + v25;
          double v27 = fmax(left - right, 0.0);
          if (v11) {
            double v26 = v27;
          }
          self->_cellPaddingInteriorHorizontal = v25;
          self->_cellPaddingLeftEdgeHorizontal = v26;
        }
        goto LABEL_25;
      }
      self->_cellPaddingLeftEdgeHorizontal = 0.0;
      self->_cellPaddingRightEdgeHorizontal = 0.0;
      if (!self->_hasGridViewElementStyle)
      {
        self->_cellPaddingInteriorHorizontal = 0.0;
        goto LABEL_25;
      }
      double v20 = self->_gridViewElementStyleElementPadding.left;
      if (v20 < self->_gridViewElementStyleElementPadding.right) {
        double v20 = self->_gridViewElementStyleElementPadding.right;
      }
      double v15 = v20 * 0.5;
    }
    else
    {
      if (v10)
      {
        self->_cellPaddingLeftEdgeHorizontal = 0.0;
        self->_cellPaddingRightEdgeHorizontal = v7;
        self->_cellPaddingInteriorHorizontal = v7;
LABEL_25:
        self->_cellPaddingNeedsReloading = 0;
        return;
      }
      float v14 = v7 * 0.5;
      double v15 = floorf(v14);
      self->_cellPaddingLeftEdgeHorizontal = v15;
      self->_cellPaddingRightEdgeHorizontal = v15;
    }
    self->_cellPaddingInteriorHorizontal = v15;
    goto LABEL_25;
  }
}

- (BOOL)_useOrdinalPadding
{
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  double v3 = [(NSArray *)self->_viewElements firstObject];
  if ([v3 elementType] == 48 && -[NSArray count](self->_viewElements, "count") >= 2)
  {
    uint64_t v4 = [(NSArray *)self->_viewElements objectAtIndex:1];

    double v3 = (void *)v4;
  }
  if ([v3 elementType] == 66)
  {
    [(SUUIViewElementLayoutContext *)self->_cellLayoutContext largeScreenElementPadding];
    if (*(double *)(MEMORY[0x263F834E8] + 8) == v8
      && *MEMORY[0x263F834E8] == v5
      && *(double *)(MEMORY[0x263F834E8] + 24) == v7
      && *(double *)(MEMORY[0x263F834E8] + 16) == v6)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __65__SUUIGridViewElementPageSectionConfiguration__useOrdinalPadding__block_invoke;
      v14[3] = &unk_265400D50;
      v14[4] = &v15;
      [v3 enumerateChildrenUsingBlock:v14];
    }
  }
  char v12 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __65__SUUIGridViewElementPageSectionConfiguration__useOrdinalPadding__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 elementType];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 80;
  *a3 = 1;
  return result;
}

- (SUUIViewElementLayoutContext)cellLayoutContext
{
  return self->_cellLayoutContext;
}

- (void)setCellLayoutContext:(id)a3
{
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (SUUIStorePageSectionContext)pageSectionContext
{
  return self->_pageSectionContext;
}

- (void)setPageSectionContext:(id)a3
{
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  self->_rendersWithPerspective = a3;
}

- (BOOL)showsEditMode
{
  return self->_showsEditMode;
}

- (SUUIGridViewElementPageSectionConfigurationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SUUIGridViewElementPageSectionConfigurationDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pageSectionContext, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_positions, 0);
}

@end