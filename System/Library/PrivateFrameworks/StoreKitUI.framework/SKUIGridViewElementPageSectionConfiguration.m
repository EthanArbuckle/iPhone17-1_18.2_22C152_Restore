@interface SKUIGridViewElementPageSectionConfiguration
- (BOOL)_isContainedWithinExploreTemplateWithGridViewElement:(id)a3;
- (BOOL)_useOrdinalPadding;
- (BOOL)rendersWithPerspective;
- (BOOL)showsEditMode;
- (BOOL)viewElementIsStandardCard:(id)a3;
- (CGSize)cellSizeForViewElement:(id)a3 indexPath:(id)a4;
- (Class)_cardCellClassForCard:(id)a3;
- (Class)cellClassForViewElement:(id)a3;
- (Class)lockupCellClassWithLockup:(id)a3;
- (SKUIGridViewElementPageSectionConfigurationDataSource)dataSource;
- (SKUIStorePageSectionContext)pageSectionContext;
- (SKUIViewElementLayoutContext)cellLayoutContext;
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
- (void)columnContentWidth;
- (void)columnWidth;
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

@implementation SKUIGridViewElementPageSectionConfiguration

- (double)columnContentWidth
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGridViewElementPageSectionConfiguration *)v3 columnContentWidth];
      }
    }
  }
  [(SKUIGridViewElementPageSectionConfiguration *)self columnWidth];
  -[SKUIGridViewElementPageSectionConfiguration _columnContentWidthPaddingForWidth:](self, "_columnContentWidthPaddingForWidth:");
  return result;
}

- (double)columnWidth
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGridViewElementPageSectionConfiguration *)v3 columnWidth];
      }
    }
  }
  if (self->_numberOfColumns < 1) {
    return 0.0;
  }
  [(SKUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
  double v12 = v11;
  v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  double v15 = v12 * v14;

  double v16 = floor(v15 / (double)self->_numberOfColumns);
  v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v17 scale];
  double v19 = v16 / v18;

  return v19;
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridViewElementPageSectionConfiguration setDataSource:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != v4)
  {
    id v14 = objc_storeWeak((id *)&self->_dataSource, v4);
    *(unsigned char *)&self->_dataSourceRespondsToSelectorFlags = *(unsigned char *)&self->_dataSourceRespondsToSelectorFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  }
}

- (void)setNumberOfColumns:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridViewElementPageSectionConfiguration setNumberOfColumns:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIGridViewElementPageSectionConfiguration backgroundColorForViewElement:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [v3 style];
  v13 = [v12 ikBackgroundColor];
  id v14 = [v13 color];

  if (!v14)
  {
    if ([v3 elementType] == 48)
    {
      id v14 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    }
    else
    {
      id v14 = 0;
    }
  }

  return v14;
}

- (Class)cellClassForViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridViewElementPageSectionConfiguration cellClassForViewElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v4 elementType];
  id v14 = 0;
  if (v13 > 48)
  {
    if (v13 <= 65)
    {
      if (v13 == 49 || v13 == 50) {
        goto LABEL_20;
      }
    }
    else
    {
      if (v13 == 66)
      {
        id v14 = [(SKUIGridViewElementPageSectionConfiguration *)self lockupCellClassWithLockup:v4];
        goto LABEL_21;
      }
      if (v13 == 141 || v13 == 152) {
        goto LABEL_20;
      }
    }
  }
  else if (v13 > 13)
  {
    if (v13 == 14)
    {
      id v14 = [(SKUIGridViewElementPageSectionConfiguration *)self _cardCellClassForCard:v4];
      goto LABEL_21;
    }
    if (v13 == 48) {
      goto LABEL_20;
    }
  }
  else if ((unint64_t)(v13 - 12) < 2 || v13 == 4)
  {
LABEL_20:
    id v14 = (objc_class *)objc_opt_class();
  }
LABEL_21:
  double v15 = v14;

  return v15;
}

- (id)cellForViewElement:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIGridViewElementPageSectionConfiguration cellForViewElement:indexPath:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v16 = self->_pageSectionContext;
  uint64_t v17 = [v6 elementType];
  double v18 = 0;
  if (v17 <= 48)
  {
    if (v17 > 13)
    {
      if (v17 == 14)
      {
        uint64_t v24 = [v6 cardType];
        double v19 = [(SKUIStorePageSectionContext *)v16 collectionView];
        v20 = v19;
        if (v24 == 3) {
          uint64_t v21 = 0x1F1C94528;
        }
        else {
          uint64_t v21 = 0x1F1C91108;
        }
      }
      else
      {
        if (v17 != 48) {
          goto LABEL_30;
        }
        double v19 = [(SKUIStorePageSectionContext *)v16 collectionView];
        v20 = v19;
        uint64_t v21 = 0x1F1C8DAA8;
      }
      goto LABEL_27;
    }
    if ((unint64_t)(v17 - 12) >= 2)
    {
      if (v17 != 4) {
        goto LABEL_30;
      }
      double v19 = [(SKUIStorePageSectionContext *)v16 collectionView];
      v20 = v19;
      uint64_t v21 = 0x1F1C9C288;
      goto LABEL_27;
    }
LABEL_20:
    double v19 = [(SKUIStorePageSectionContext *)v16 collectionView];
    v20 = v19;
    uint64_t v21 = 0x1F1C956C8;
LABEL_27:
    double v18 = [v19 dequeueReusableCellWithReuseIdentifier:v21 forIndexPath:v7];
LABEL_28:

    if (!v18) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v17 <= 65)
  {
    if (v17 != 49)
    {
      if (v17 != 50) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  switch(v17)
  {
    case 66:
      v20 = [(SKUIGridViewElementPageSectionConfiguration *)self _lockupCellReuseIdentifierWithLockup:v6];
      v23 = [(SKUIStorePageSectionContext *)v16 collectionView];
      double v18 = [v23 dequeueReusableCellWithReuseIdentifier:v20 forIndexPath:v7];

      goto LABEL_28;
    case 141:
      goto LABEL_20;
    case 152:
LABEL_21:
      v22 = [(SKUIStorePageSectionContext *)v16 collectionView];
      double v18 = [v22 dequeueReusableCellWithReuseIdentifier:0x1F1C87EE8 forIndexPath:v7];

      [v18 setShowsReflectionImage:0];
      if (v18) {
LABEL_29:
      }
        [(SKUIGridViewElementPageSectionConfiguration *)self configureCell:v18 forViewElement:v6 indexPath:v7];
      break;
  }
LABEL_30:

  return v18;
}

- (CGSize)cellSizeForViewElement:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  uint64_t v57 = 0;
  v58 = (double *)&v57;
  uint64_t v59 = 0x3010000000;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  v60 = &unk_1C1D0F257;
  [(SKUIGridViewElementPageSectionConfiguration *)self columnWidth];
  *((void *)v58 + 4) = v16;
  [(SKUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
  double v18 = v17;
  id v19 = v6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v20) {
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
  }
  uint64_t v28 = [v19 elementType];

  if (v28 == 48)
  {
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellInsetsForViewElement:v19 indexPath:v7];
    double v30 = v29;
    double v32 = v31;
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellHeightForViewElement:v19 width:v18 - v33 - v34];
    v35 = v58;
    double v37 = v32 + v30 + v36;
    v58[4] = v18;
    v35[5] = v37;
  }
  else
  {
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    char v56 = 0;
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
    uint64_t v49 = 0;
    v50 = (double *)&v49;
    uint64_t v51 = 0x4010000000;
    v52 = &unk_1C1D0F257;
    long long v38 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    long long v53 = *MEMORY[0x1E4FB2848];
    long long v54 = v38;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __80__SKUIGridViewElementPageSectionConfiguration_cellSizeForViewElement_indexPath___block_invoke;
    v43[3] = &unk_1E6428ED0;
    uint64_t v48 = v39;
    v43[4] = self;
    v45 = &v49;
    v46 = &v57;
    v47 = v55;
    id v44 = v7;
    [(SKUIGridViewElementPageSectionConfiguration *)self _enumerateViewElementsForRowOfIndexPath:v44 usingBlock:v43];
    v58[5] = v50[6] + v50[4] + v58[5];

    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(v55, 8);
    v35 = v58;
    double v18 = v58[4];
    double v37 = v58[5];
  }
  if (v37 >= self->_minimumCellHeight) {
    double minimumCellHeight = v37;
  }
  else {
    double minimumCellHeight = self->_minimumCellHeight;
  }
  v35[5] = minimumCellHeight;
  _Block_object_dispose(&v57, 8);

  double v41 = v18;
  double v42 = minimumCellHeight;
  result.height = v42;
  result.width = v41;
  return result;
}

void __80__SKUIGridViewElementPageSectionConfiguration_cellSizeForViewElement_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v27 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _cellInsetsForViewElement:v27 indexPath:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = *(unsigned char **)(a1 + 32);
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
      id v19 = (void *)[*(id *)(a1 + 32) cellClassForViewElement:v27];
      if (class_conformsToProtocol((Class)v19, (Protocol *)&unk_1F1DA49A8))
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridViewElementPageSectionConfiguration collectionViewWillApplyLayoutAttributes:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = [v4 indexPath];
  objc_msgSend(v4, "setPosition:", -[SKUIGridViewElementPageSectionConfiguration positionForIndexPath:](self, "positionForIndexPath:", v13));
}

- (void)configureCell:(id)a3 forViewElement:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v11) {
        -[SKUIGridViewElementPageSectionConfiguration configureCell:forViewElement:indexPath:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  id v19 = self->_pageSectionContext;
  uint64_t v20 = [v9 elementType];
  id v21 = 0;
  int v22 = 0;
  if (v20 <= 48)
  {
    if (v20 == 14)
    {
      if ([v9 cardType] != 3)
      {
        id v21 = v8;
        int v22 = 0;
        goto LABEL_11;
      }
LABEL_10:
      int v22 = 0;
      id v21 = 0;
LABEL_11:
      BOOL v23 = 0;
      goto LABEL_16;
    }
    BOOL v23 = 0;
    if (v20 == 48)
    {
      id v21 = 0;
      BOOL v23 = 0;
      int v22 = 1;
    }
  }
  else
  {
    if (v20 == 49)
    {
LABEL_9:
      [v8 setShowsReflectionImage:0];
      goto LABEL_10;
    }
    if (v20 != 66)
    {
      BOOL v23 = 0;
      if (v20 != 152) {
        goto LABEL_16;
      }
      goto LABEL_9;
    }
    double v24 = [(SKUIGridViewElementPageSectionConfiguration *)self _lockupCellReuseIdentifierWithLockup:v9];
    BOOL v23 = v24 == @"SKUIHorizontalLockupReuseID";

    int v22 = 0;
    id v21 = 0;
  }
LABEL_16:
  uint64_t v25 = self->_separatorColor;
  CGFloat top = self->_separatorWidths.top;
  double left = self->_separatorWidths.left;
  double bottom = self->_separatorWidths.bottom;
  CGFloat right = self->_separatorWidths.right;
  CGFloat v30 = self->_separatorMargins.top;
  CGFloat v31 = self->_separatorMargins.left;
  double v32 = self->_separatorMargins.bottom;
  double v33 = self->_separatorMargins.right;
  if (v22)
  {
    BOOL v86 = v23;
    double v34 = [v9 style];
    uint64_t separatorStyle = [v34 valueForStyle:*MEMORY[0x1E4F6EFC0]];

    v87 = v19;
    if (separatorStyle)
    {
      [v34 borderWidths];
      CGFloat top = v36;
      double left = v37;
      double bottom = v38;
      CGFloat right = v39;
      uint64_t separatorStyle = 2;
    }
    id v88 = v10;
    v40 = [v34 valueForStyle:*MEMORY[0x1E4F6EFB0]];

    if (v40)
    {
      double v41 = [v34 ikBorderColor];
      uint64_t v42 = [v41 color];

      uint64_t v25 = (UIColor *)v42;
    }
    v43 = [v34 valueForStyle:*MEMORY[0x1E4F6EFB8]];

    if (v43)
    {
      [v34 borderMargins];
      CGFloat v30 = v44;
      CGFloat v31 = v45;
      double v32 = v46;
      double v33 = v47;
    }
    double v89 = right;
    uint64_t v48 = [v9 parent];
    uint64_t v49 = [v48 style];
    v50 = [v49 ikBackgroundColor];

    if (v50 && [v50 colorType] == 3) {
      self->_hasHeader = 1;
    }
    double v51 = top;

    id v19 = v87;
    id v10 = v88;
    BOOL v23 = v86;
  }
  else
  {
    double v89 = self->_separatorWidths.right;
    uint64_t separatorStyle = self->_separatorStyle;
    if (self->_hasHeader)
    {
      double v51 = self->_separatorWidths.top;
      if ([v10 item] == 1) {
        uint64_t separatorStyle = 0;
      }
    }
    else
    {
      double v51 = self->_separatorWidths.top;
    }
  }
  double v52 = v31;
  id v53 = v9;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v54 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v54) {
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:](v54, v55, v56, v57, v58, v59, v60, v61);
      }
    }
  }
  double v62 = v30;
  uint64_t v63 = [v53 elementType];

  if (v63 == 48)
  {
    [(SKUIStorePageSectionContext *)v19 activePageWidth];
    double v65 = v64;
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellPaddingLeftEdgeHorizontal];
    double v67 = v65 - v66;
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellPaddingRightEdgeHorizontal];
    double v69 = v67 - v68;
  }
  else
  {
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
    double v69 = v70;
  }
  [v8 reloadWithViewElement:v53 width:self->_cellLayoutContext context:v69];
  [v8 setSeparatorColor:v25];
  [v8 setSeparatorStyle:separatorStyle];
  objc_msgSend(v8, "setSeparatorWidths:", v51, left, bottom, v89);
  objc_msgSend(v8, "setSeparatorInsets:", v62, v52, v32, v33);
  if (v23) {
    [v8 setEditing:self->_showsEditMode animated:0];
  }
  [(SKUIGridViewElementPageSectionConfiguration *)self _normalizedContentInsetForViewElement:v53 indexPath:v10];
  double v72 = v71;
  double v74 = v73;
  double v76 = v75;
  double v78 = v77;
  if ([(SKUIGridViewElementPageSectionConfiguration *)self rendersWithPerspective]
    && [v8 conformsToProtocol:&unk_1F1DA49A8])
  {
    id v79 = v8;
    v80 = [(SKUIStorePageSectionContext *)self->_pageSectionContext parentViewController];
    v81 = [v80 view];

    [v79 setPerspectiveTargetView:v81];
    [v81 bounds];
    objc_msgSend(v79, "setVanishingPoint:", CGRectGetMidX(v90), -800.0);
    if ([v53 rendersWithPerspective])
    {
      [(id)objc_opt_class() sizeThatFitsWidth:v53 viewElement:self->_cellLayoutContext context:v69];
      objc_msgSend((id)objc_opt_class(), "maximumPerspectiveHeightForSize:", v82, v83);
      if (v72 < v84) {
        double v72 = v84;
      }
    }
  }
  objc_msgSend(v8, "setContentInset:", v72, v74, v76, v78);
  if (v21)
  {
    v85 = [(SKUIGridViewElementPageSectionConfiguration *)self _cardArtworkBoundingSizeForIndexPath:v10];
    [v21 setArtworkBoundingSize:v85];
  }
}

- (Class)lockupCellClassWithLockup:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridViewElementPageSectionConfiguration lockupCellClassWithLockup:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if ((unint64_t)[(SKUIGridViewElementPageSectionConfiguration *)self _lockupTypeForLockup:v4] <= 8)
  {
    objc_opt_class();
    self = (SKUIGridViewElementPageSectionConfiguration *)objc_claimAutoreleasedReturnValue();
  }

  return (Class)self;
}

- (int64_t)positionForIndexPath:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridViewElementPageSectionConfiguration positionForIndexPath:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  unint64_t v13 = [a3 item];
  int64_t v14 = 1;
  int64_t v19 = 1;
  if ((v13 & 0x8000000000000000) == 0)
  {
    unint64_t v15 = v13;
    if (v13 >= [(NSArray *)self->_positions count])
    {
      int64_t v14 = 1;
    }
    else
    {
      uint64_t v16 = [(NSArray *)self->_positions objectAtIndex:v15];
      int64_t v14 = [v16 integerValue];
      int64_t v19 = v14;
    }
  }
  if (*(unsigned char *)&self->_dataSourceRespondsToSelectorFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained gridViewElementPageSectionConfiguration:self configurePosition:&v19 forItemAtIndexPath:a3];

    return v19;
  }
  return v14;
}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIGridViewElementPageSectionConfiguration registerReusableClassesForCollectionView:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C9C288];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C956C8];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C91108];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C94528];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C954C8];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C87EE8];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C90268];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C8DAA8];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C8BFC8];
}

- (void)reloadCellWithIndexPath:(id)a3 forViewElement:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIGridViewElementPageSectionConfiguration reloadCellWithIndexPath:forViewElement:reason:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIStorePageSectionContext *)self->_pageSectionContext collectionView];
  int64_t v19 = [v18 cellForItemAtIndexPath:v8];

  [(SKUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
  objc_msgSend(v19, "reloadWithViewElement:width:context:", v9, self->_cellLayoutContext);
  if (a5 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v19 setEditing:self->_showsEditMode animated:1];
    }
  }
  if ([(SKUIGridViewElementPageSectionConfiguration *)self viewElementIsStandardCard:v9])
  {
    uint64_t v20 = [(SKUIGridViewElementPageSectionConfiguration *)self _cardArtworkBoundingSizeForIndexPath:v8];
    [v19 setArtworkBoundingSize:v20];
  }
  [(SKUIGridViewElementPageSectionConfiguration *)self _normalizedContentInsetForViewElement:v9 indexPath:v8];
  objc_msgSend(v19, "setContentInset:");
}

- (void)requestCellLayoutForViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridViewElementPageSectionConfiguration requestCellLayoutForViewElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(SKUIGridViewElementPageSectionConfiguration *)self cellClassForViewElement:v4];
  id v14 = v4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v15) {
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:](v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
  uint64_t v23 = [v14 elementType];

  if (v23 == 48)
  {
    [(SKUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
    double v25 = v24;
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellPaddingLeftEdgeHorizontal];
    double v27 = v25 - v26;
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellPaddingRightEdgeHorizontal];
    double v29 = v27 - v28;
  }
  else
  {
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
  }
  [(objc_class *)v13 requestLayoutForViewElement:v14 width:self->_cellLayoutContext context:(double)(uint64_t)v29];
}

- (UIEdgeInsets)sectionContentInsetAdjustedFromValue:(UIEdgeInsets)a3 forGridViewElement:(id)a4
{
  CGFloat right = a3.right;
  double bottom = a3.bottom;
  CGFloat left = a3.left;
  double top = a3.top;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUIGridViewElementPageSectionConfiguration sectionContentInsetAdjustedFromValue:forGridViewElement:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  char v25 = 0;
  uint64_t v17 = [v8 style];
  double v18 = SKUIViewElementPaddingForStyle(v17, &v25);
  double v20 = v19;

  if (v25)
  {
    double bottom = v20;
    double top = v18;
  }

  double v21 = top;
  double v22 = left;
  double v23 = bottom;
  double v24 = right;
  result.CGFloat right = v24;
  result.double bottom = v23;
  result.CGFloat left = v22;
  result.double top = v21;
  return result;
}

- (void)updateLayoutPropertiesForGridViewElement:(id)a3
{
  *(void *)((char *)&v52[1] + 4) = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridViewElementPageSectionConfiguration updateLayoutPropertiesForGridViewElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(SKUIGridViewElementPageSectionConfiguration *)self pageSectionContext];
  [v13 activePageWidth];
  double v15 = v14;
  self->_cellContentWidth = 0.0;
  uint64_t v16 = [v4 style];
  [(SKUIGridViewElementPageSectionConfiguration *)self setNumberOfColumns:[(SKUIGridViewElementPageSectionConfiguration *)self _numberOfColumnsForWidth:v16 style:v15]];

  double v41 = v13;
  uint64_t v17 = [v13 clientContext];
  uint64_t v18 = SKUIUserInterfaceIdiom(v17);

  if (v18 == 1)
  {
    if ([(SKUIGridViewElementPageSectionConfiguration *)self _isContainedWithinExploreTemplateWithGridViewElement:v4])
    {
      int64_t v19 = 3;
    }
    else
    {
      int64_t v19 = 4;
    }
  }
  else
  {
    if (v15 < 414.0)
    {
      self->_cardVerticalSpacingStyle = 0;
      goto LABEL_15;
    }
    if (self->_numberOfColumns > 1) {
      int64_t v19 = 2;
    }
    else {
      int64_t v19 = 1;
    }
  }
  self->_cardVerticalSpacingStyle = v19;
LABEL_15:
  double v20 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v4 flattenedChildren];
  uint64_t v45 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  uint64_t v42 = v4;
  if (v45)
  {
    uint64_t v21 = 0;
    int64_t v22 = 0;
    unint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v47;
    uint64_t v43 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(obj);
        }
        unint64_t v27 = v24 + i;
        int64_t numberOfColumns = self->_numberOfColumns;
        if (numberOfColumns == 1)
        {
          unsigned int v29 = 5;
          unint64_t v23 = v24 + i;
        }
        else
        {
          uint64_t v30 = v24;
          CGFloat v31 = v20;
          double v32 = self;
          id v33 = *(id *)(*((void *)&v46 + 1) + 8 * i);
          if (os_variant_has_internal_content()
            && _os_feature_enabled_impl()
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            -[SKUIGridViewElementPageSectionConfiguration updateLayoutPropertiesForGridViewElement:](buf, v52);
          }
          uint64_t v34 = [v33 elementType];

          self = v32;
          if (v34 == 48)
          {
            int64_t numberOfColumns = v32->_numberOfColumns;
            int64_t v22 = numberOfColumns - 1;
            unsigned int v29 = 5;
            unint64_t v23 = v27;
          }
          else
          {
            int64_t numberOfColumns = v32->_numberOfColumns;
            if (v22 == numberOfColumns - 1) {
              unsigned int v29 = 4;
            }
            else {
              unsigned int v29 = 2;
            }
            if (!v22)
            {
              int64_t v22 = 0;
              unint64_t v23 = v27;
              unsigned int v29 = 1;
            }
          }
          double v20 = v31;
          uint64_t v24 = v30;
          uint64_t v25 = v43;
        }
        if (v21) {
          uint64_t v35 = v29;
        }
        else {
          uint64_t v35 = v29 | 8;
        }
        if (v22 < numberOfColumns - 1)
        {
          ++v22;
        }
        else
        {
          ++v21;
          int64_t v22 = 0;
        }
        double v36 = [NSNumber numberWithInt:v35];
        [(NSArray *)v20 addObject:v36];
      }
      v24 += v45;
      uint64_t v45 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v45);
  }
  else
  {
    unint64_t v23 = 0;
  }

  for (; v23 < [(NSArray *)v20 count]; ++v23)
  {
    double v37 = [(NSArray *)v20 objectAtIndex:v23];
    int v38 = [v37 integerValue];

    double v39 = [NSNumber numberWithInt:v38 | 0x20u];
    [(NSArray *)v20 replaceObjectAtIndex:v23 withObject:v39];
  }
  positions = self->_positions;
  self->_positions = v20;
}

- (void)updateStylePropertiesForGridViewElement:(id)a3 gridItemViewElements:(id)a4 numberOfGridItems:(unint64_t)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (NSArray *)a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUIGridViewElementPageSectionConfiguration updateStylePropertiesForGridViewElement:gridItemViewElements:numberOfGridItems:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v17 = [MEMORY[0x1E4FB1618] separatorColor];
  uint64_t v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v18 scale];
  double v20 = v19;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v21 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v21) {
        -[SKUIGridViewElementPageSectionConfiguration updateStylePropertiesForGridViewElement:gridItemViewElements:numberOfGridItems:](v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }
  if ([v7 elementType] == 45) {
    char v29 = [v7 showsEditMode];
  }
  else {
    char v29 = 0;
  }
  self->_showsEditMode = v29;
  uint64_t v30 = [v7 style];
  CGFloat v31 = [v30 itemWidth];
  double v32 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v33 = [v31 stringByTrimmingCharactersInSet:v32];

  [v33 floatValue];
  self->_double gridViewElementStyleItemWidth = v34;
  char v35 = [v33 hasSuffix:@"%"];
  self->_gridViewElementStyleItemWidthIsPercentage = v35;
  if (v35)
  {
    double gridViewElementStyleItemWidth = self->_gridViewElementStyleItemWidth;
    self->_gridIsEdgeToEdge = gridViewElementStyleItemWidth == 100.0;
    p_gridIsEdgeToEdge = &self->_gridIsEdgeToEdge;
    if (gridViewElementStyleItemWidth == 100.0)
    {
      uint64_t v38 = [MEMORY[0x1E4FB1618] whiteColor];

      CGFloat v40 = *MEMORY[0x1E4FB2848];
      CGFloat v39 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      CGFloat v41 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      CGFloat v42 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      uint64_t v17 = (void *)v38;
      goto LABEL_17;
    }
  }
  else
  {
    self->_gridIsEdgeToEdge = 0;
    p_gridIsEdgeToEdge = &self->_gridIsEdgeToEdge;
  }
  CGFloat v41 = 0.0;
  CGFloat v42 = 15.0;
  CGFloat v39 = 15.0;
  CGFloat v40 = 0.0;
LABEL_17:
  double v43 = 1.0 / v20;
  double v44 = [v30 ikBorderColor];
  uint64_t v45 = [v44 color];

  if (v45)
  {
    id v46 = v45;
    if (CGColorGetAlpha((CGColorRef)[v46 CGColor]) <= 0.00000011920929)
    {
      id v81 = 0;
      int64_t v47 = 0;
      goto LABEL_37;
    }
    id v81 = v46;
  }
  else
  {
    id v81 = v17;
  }
  uint64_t v17 = [v30 dividerType];
  if ([v17 isEqualToString:@"grid-full"])
  {
    int64_t v47 = 2;
  }
  else if ([v17 isEqualToString:@"grid-top"])
  {
    int64_t v47 = 3;
  }
  else if ([v17 isEqualToString:@"full"])
  {
    int64_t v47 = 4;
  }
  else if ([v17 isEqualToString:@"grid-vertical"])
  {
    int64_t v47 = 6;
  }
  else if ([v17 isEqualToString:@"none"])
  {
    int64_t v47 = 0;
  }
  else if (*p_gridIsEdgeToEdge || ([v17 isEqualToString:@"edge-to-edge"] & 1) != 0)
  {
    int64_t v47 = 7;
  }
  else
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obj = v8;
    uint64_t v76 = [(NSArray *)obj countByEnumeratingWithState:&v83 objects:v87 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v80 = *(void *)v84;
      int64_t v47 = 1;
LABEL_55:
      uint64_t v78 = 0;
      while (1)
      {
        if (*(void *)v84 != v80) {
          objc_enumerationMutation(obj);
        }
        if (!SKUIIKViewElementTypeIsButton([*(id *)(*((void *)&v83 + 1) + 8 * v78) elementType])) {
          break;
        }
        if (v77 == ++v78)
        {
          uint64_t v77 = [(NSArray *)obj countByEnumeratingWithState:&v83 objects:v87 count:16];
          if (v77) {
            goto LABEL_55;
          }
          goto LABEL_61;
        }
      }
    }
    else
    {
LABEL_61:
      int64_t v47 = 4;
    }
  }
  long long v48 = [v30 valueForStyle:*MEMORY[0x1E4F6EFC0]];

  if (v48)
  {
    [v30 borderWidths];
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    double v43 = v55;
    goto LABEL_38;
  }
LABEL_37:
  CGFloat v54 = v43;
  CGFloat v52 = v43;
  CGFloat v50 = v43;
LABEL_38:
  uint64_t v56 = v8;

  uint64_t v57 = [v30 valueForStyle:*MEMORY[0x1E4F6EFB8]];

  if (v57)
  {
    [v30 borderMargins];
    CGFloat v40 = v58;
    CGFloat v39 = v59;
    CGFloat v41 = v60;
    CGFloat v42 = v61;
  }
  double v62 = [v30 valueForStyle:*MEMORY[0x1E4F6EFD8]];
  BOOL v63 = 1;
  if (!v62)
  {
    double v64 = [v30 valueForStyle:@"itml-padding"];
    BOOL v63 = v64 != 0;
  }
  if (v30) {
    BOOL v65 = v63;
  }
  else {
    BOOL v65 = 0;
  }
  self->_hasGridViewElementStyle = v65;
  [v30 elementPadding];
  self->_gridViewElementStyleElementPadding.double top = v66;
  self->_gridViewElementStyleElementPadding.CGFloat left = v67;
  self->_gridViewElementStyleElementPadding.double bottom = v68;
  self->_gridViewElementStyleElementPadding.CGFloat right = v69;
  self->_numberOfGridItems = a5;
  self->_uint64_t separatorStyle = v47;
  objc_storeStrong((id *)&self->_separatorColor, v81);
  self->_separatorMargins.double top = v40;
  self->_separatorMargins.CGFloat left = v39;
  self->_separatorMargins.double bottom = v41;
  self->_separatorMargins.CGFloat right = v42;
  self->_separatorWidths.double top = v50;
  self->_separatorWidths.CGFloat left = v52;
  self->_separatorWidths.double bottom = v54;
  self->_separatorWidths.CGFloat right = v43;
  viewElements = self->_viewElements;
  self->_viewElements = v56;

  self->_cellContentWidth = 0.0;
  self->_cellPaddingNeedsReloading = 1;
  self->_cellPaddingLeftEdgeHorizontal = 0.0;
  self->_cellPaddingRightEdgeHorizontal = 0.0;
  self->_cellPaddingInteriorHorizontal = 0.0;
  double v71 = [v7 style];
  double v72 = [v71 lockupType];

  if (v72) {
    int64_t v73 = SKUILockupViewTypeForString(v72);
  }
  else {
    int64_t v73 = -1;
  }
  self->_lockupType = v73;
  double v74 = [v30 itemHeight];
  if (v74 || ([v30 rowHeight], (double v74 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v74 floatValue];
    self->_double minimumCellHeight = v75;
  }
  else
  {
    self->_double minimumCellHeight = 44.0;
  }
}

- (BOOL)viewElementIsStandardCard:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIGridViewElementPageSectionConfiguration viewElementIsStandardCard:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  BOOL v12 = [v3 elementType] == 14 && objc_msgSend(v3, "cardType") != 3;

  return v12;
}

- (id)_cardArtworkBoundingSizeForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__74;
  uint64_t v14 = __Block_byref_object_dispose__74;
  id v15 = 0;
  if (self->_numberOfColumns >= 2)
  {
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__SKUIGridViewElementPageSectionConfiguration__cardArtworkBoundingSizeForIndexPath___block_invoke;
    v9[3] = &unk_1E6428EF8;
    v9[6] = v6;
    v9[4] = self;
    v9[5] = &v10;
    [(SKUIGridViewElementPageSectionConfiguration *)self _enumerateViewElementsForRowOfIndexPath:v4 usingBlock:v9];
    uint64_t v5 = (void *)v11[5];
  }
  id v7 = v5;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __84__SKUIGridViewElementPageSectionConfiguration__cardArtworkBoundingSizeForIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "viewElementIsStandardCard:"))
  {
    +[SKUICardViewElementCollectionViewCell artworkBoundingSizeWithViewElement:v9 width:*(void *)(*(void *)(a1 + 32) + 240) context:*(double *)(a1 + 48)];
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      objc_msgSend(v5, "unionWithSize:", v3, v4);
    }
    else
    {
      uint64_t v6 = -[SKUISizeValue initWithSize:]([SKUISizeValue alloc], "initWithSize:", v3, v4);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double result = self->_cellContentWidth;
  if (result >= 0.00000011920929) {
    return result;
  }
  double result = self->_gridViewElementStyleItemWidth;
  if (result <= 0.00000011920929)
  {
    [(SKUIGridViewElementPageSectionConfiguration *)self columnContentWidth];
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
            [(SKUIGridViewElementPageSectionConfiguration *)self columnWidth];
LABEL_33:
            self->_double cellContentWidth = v16;
            continue;
          }
          if ([v14 lockupViewType] == 2 && v8 <= 0.0)
          {
            +[SKUIHorizontalLockupCollectionViewCell preferredSizeForViewElement:v14 context:self->_cellLayoutContext];
            -[SKUIGridViewElementPageSectionConfiguration _columnContentWidthPaddingForWidth:](self, "_columnContentWidthPaddingForWidth:");
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
            && [(SKUIGridViewElementPageSectionConfiguration *)self viewElementIsStandardCard:v14])
          {
            +[SKUICardViewElementCollectionViewCell preferredSizeForViewElement:v14 context:self->_cellLayoutContext];
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
    [(SKUIGridViewElementPageSectionConfiguration *)self columnWidth];
    double result = v5 * v6;
  }
  self->_double cellContentWidth = result;
  return result;
}

- (double)_cellHeightForViewElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  double v7 = [(SKUIGridViewElementPageSectionConfiguration *)self cellClassForViewElement:v6];
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
  double v8 = *MEMORY[0x1E4FB2848];
  double v67 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  uint64_t v11 = [v6 style];
  char v68 = 0;
  double v12 = SKUIViewElementPaddingForStyle(v11, &v68);
  if (v68)
  {
    double v16 = v8 + v12;
    double v17 = v9 + v14;
    double v18 = v67 + v13;
    double v19 = v10 + v15;
    goto LABEL_18;
  }
  double v19 = v10;
  double v17 = v9;
  double v18 = v67;
  double v16 = v8;
  if (self->_hasGridViewElementStyle) {
    goto LABEL_18;
  }
  uint64_t v20 = objc_msgSend(v6, "elementType", v12);
  if (v20 <= 47)
  {
    if ((unint64_t)(v20 - 12) >= 2)
    {
      if (v20 == 14
        && [(SKUIGridViewElementPageSectionConfiguration *)self viewElementIsStandardCard:v6])
      {
        double v19 = v10;
        double v17 = v9;
        double v18 = v67;
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
            double v62 = [v6 firstChildForElementType:66];

            if (v62) {
              double v17 = v9 + 20.0;
            }
            else {
              double v17 = v9;
            }
            if (v62) {
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
LABEL_13:
    double v17 = v9 + 12.0;
    double v21 = 11.0;
    goto LABEL_16;
  }
  if (v20 == 48)
  {
    double v17 = v9 + 10.0;
    double v16 = v8 + 4.0;
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellPaddingLeftEdgeHorizontal];
    double v18 = v67 + v60;
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellPaddingRightEdgeHorizontal];
    double v19 = v10 + v61;
    goto LABEL_18;
  }
  if (v20 == 141 || v20 == 50) {
    goto LABEL_13;
  }
LABEL_14:
  double v21 = 10.0;
LABEL_15:
  double v17 = v9 + v21;
LABEL_16:
  double v16 = v8 + v21;
LABEL_17:
  double v19 = v10;
  double v18 = v67;
LABEL_18:
  id v22 = v6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v23 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v23) {
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:](v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
  }
  uint64_t v31 = [v22 elementType];

  if (v31 != 48)
  {
    double v65 = v16;
    double v66 = v17;
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellPaddingInteriorHorizontal];
    double v33 = v19 + v18 + v32 * 2.0;
    [(SKUIGridViewElementPageSectionConfiguration *)self columnContentWidth];
    double v35 = v33 + v34;
    [(SKUIGridViewElementPageSectionConfiguration *)self columnWidth];
    BOOL v37 = v35 <= v36;
    if (v35 <= v36) {
      double v38 = v19;
    }
    else {
      double v38 = 0.0;
    }
    if (v37) {
      double v39 = v18;
    }
    else {
      double v39 = 0.0;
    }
    [(SKUIGridViewElementPageSectionConfiguration *)self _cellPaddingInteriorHorizontal];
    double v41 = v40;
    char v42 = [(SKUIGridViewElementPageSectionConfiguration *)self positionForIndexPath:v7];
    if (v42)
    {
      [(SKUIGridViewElementPageSectionConfiguration *)self _cellPaddingLeftEdgeHorizontal];
      double v45 = v44;
      double v43 = v41;
    }
    else
    {
      if ((v42 & 4) != 0) {
        [(SKUIGridViewElementPageSectionConfiguration *)self _cellPaddingRightEdgeHorizontal];
      }
      else {
        double v43 = v41;
      }
      double v45 = v41;
    }
    double v18 = v39 + v45;
    double v19 = v38 + v43;
    if ([v22 elementType] == 66)
    {
      double v63 = v9;
      double v64 = v10;
      id v46 = [(SKUIGridViewElementPageSectionConfiguration *)self cellLayoutContext];
      [v46 largeScreenElementPadding];
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;

      if (v67 != v50 || v8 != v48 || v64 != v54 || v63 != v52)
      {
        double v19 = v54;
        double v65 = v48;
        double v66 = v52;
        double v18 = v50;
      }
      double v55 = -0.0;
      if (self->_gridViewElementStyleItemWidthIsPercentage) {
        double v55 = v41;
      }
      double v17 = v66 + v55;
      double v16 = v65 + v55;
    }
    else
    {
      double v17 = v66;
    }
  }

  double v56 = v16;
  double v57 = v18;
  double v58 = v17;
  double v59 = v19;
  result.CGFloat right = v59;
  result.double bottom = v58;
  result.CGFloat left = v57;
  result.double top = v56;
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
  BOOL v5 = [(SKUIGridViewElementPageSectionConfiguration *)self _useOrdinalPadding];
  id v6 = [(SKUIGridViewElementPageSectionConfiguration *)self pageSectionContext];
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
  *(void *)&v21[20] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(id, void *, void *, unsigned char *))a4;
  uint64_t v8 = [v6 item] / self->_numberOfColumns * self->_numberOfColumns;
  double v18 = v6;
  uint64_t v9 = [v6 section];
  char v19 = 0;
  int64_t numberOfGridItems = self->_numberOfGridItems;
  uint64_t v11 = [(SKUIGridViewElementPageSectionConfiguration *)self dataSource];
  double v17 = v21;
  int64_t v12 = v8;
  do
  {
    if (v12 >= self->_numberOfColumns + v8 || v12 >= numberOfGridItems) {
      break;
    }
    double v14 = (void *)MEMORY[0x1C8749310]();
    double v15 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 inSection:v9];
    double v16 = [v11 gridViewElementPageSectionConfiguration:self viewElementForIndexPath:v15];
    if (v16)
    {
      if (os_variant_has_internal_content()
        && _os_feature_enabled_impl()
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        -[SKUIGridViewElementPageSectionConfiguration updateLayoutPropertiesForGridViewElement:](buf, v17);
      }
      if (objc_msgSend(v16, "elementType", v17) != 48) {
        v7[2](v7, v16, v15, &v19);
      }
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
  unint64_t v3 = [(SKUIGridViewElementPageSectionConfiguration *)self _lockupTypeForLockup:a3];
  if (v3 <= 8) {
    id v4 = (id)*off_1E6428F88[v3];
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
  uint64_t v34 = 0;
  double v35 = (double *)&v34;
  uint64_t v36 = 0x4010000000;
  BOOL v37 = &unk_1C1D0F257;
  long long v38 = 0u;
  long long v39 = 0u;
  [(SKUIGridViewElementPageSectionConfiguration *)self _cellInsetsForViewElement:v6 indexPath:v7];
  *(void *)&long long v38 = v8;
  *((void *)&v38 + 1) = v9;
  *(void *)&long long v39 = v10;
  *((void *)&v39 + 1) = v11;
  id v12 = v6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v13) {
        -[SKUIGridViewElementPageSectionConfiguration cellSizeForViewElement:indexPath:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  uint64_t v21 = [v12 elementType];

  if (v21 != 48)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __95__SKUIGridViewElementPageSectionConfiguration__normalizedContentInsetForViewElement_indexPath___block_invoke;
    v30[3] = &unk_1E6428F20;
    id v31 = v12;
    double v32 = self;
    double v33 = &v34;
    [(SKUIGridViewElementPageSectionConfiguration *)self _enumerateViewElementsForRowOfIndexPath:v7 usingBlock:v30];
  }
  double v22 = v35[4];
  double v23 = v35[5];
  double v24 = v35[6];
  double v25 = v35[7];
  _Block_object_dispose(&v34, 8);

  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  result.CGFloat right = v29;
  result.double bottom = v28;
  result.CGFloat left = v27;
  result.double top = v26;
  return result;
}

uint64_t __95__SKUIGridViewElementPageSectionConfiguration__normalizedContentInsetForViewElement_indexPath___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
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
    int64_t v9 = [(SKUIStorePageSectionContext *)self->_pageSectionContext layoutStyle];
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
    int64_t v9 = [(SKUIStorePageSectionContext *)self->_pageSectionContext layoutStyle];
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
    [(SKUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
    if (v3 <= 0.0)
    {
      int64_t v8 = [(SKUIGridViewElementPageSectionConfiguration *)self pageSectionContext];
      [v8 horizontalPadding];
      double v7 = v9 + v9;
    }
    else
    {
      [(SKUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
      double v5 = v4;
      [(SKUIGridViewElementPageSectionConfiguration *)self _cellContentWidth];
      *(float *)&double v6 = v5 - v6 * (double)self->_numberOfColumns;
      double v7 = floorf(*(float *)&v6);
    }
    BOOL v10 = [(SKUIGridViewElementPageSectionConfiguration *)self _useOrdinalPadding];
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
        uint64_t v16 = [(SKUIGridViewElementPageSectionConfiguration *)self pageSectionContext];
        [v16 horizontalPadding];
        CGFloat left = v17;

        if (v11)
        {
          CGFloat right = left;
          CGFloat left = 0.0;
        }
        else
        {
          uint64_t v18 = [(SKUIGridViewElementPageSectionConfiguration *)self pageSectionContext];
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
  uint64_t v16 = &v15;
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
    [(SKUIViewElementLayoutContext *)self->_cellLayoutContext largeScreenElementPadding];
    if (*(double *)(MEMORY[0x1E4FB2848] + 8) == v8
      && *MEMORY[0x1E4FB2848] == v5
      && *(double *)(MEMORY[0x1E4FB2848] + 24) == v7
      && *(double *)(MEMORY[0x1E4FB2848] + 16) == v6)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __65__SKUIGridViewElementPageSectionConfiguration__useOrdinalPadding__block_invoke;
      v14[3] = &unk_1E6422498;
      v14[4] = &v15;
      [v3 enumerateChildrenUsingBlock:v14];
    }
  }
  char v12 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __65__SKUIGridViewElementPageSectionConfiguration__useOrdinalPadding__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 elementType];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 80;
  *a3 = 1;
  return result;
}

- (SKUIViewElementLayoutContext)cellLayoutContext
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

- (SKUIStorePageSectionContext)pageSectionContext
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

- (SKUIGridViewElementPageSectionConfigurationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SKUIGridViewElementPageSectionConfigurationDataSource *)WeakRetained;
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

- (void)columnContentWidth
{
}

- (void)columnWidth
{
}

- (void)setDataSource:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setNumberOfColumns:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)backgroundColorForViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cellClassForViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cellForViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cellSizeForViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cellSizeForViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)collectionViewWillApplyLayoutAttributes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)configureCell:(uint64_t)a3 forViewElement:(uint64_t)a4 indexPath:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lockupCellClassWithLockup:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)positionForIndexPath:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerReusableClassesForCollectionView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadCellWithIndexPath:(uint64_t)a3 forViewElement:(uint64_t)a4 reason:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestCellLayoutForViewElement:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sectionContentInsetAdjustedFromValue:(uint64_t)a3 forGridViewElement:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateLayoutPropertiesForGridViewElement:(uint8_t *)buf .cold.1(uint8_t *buf, void *a2)
{
  *(_DWORD *)buf = 136446210;
  *a2 = "SKUIGridViewElementIsFullWidth";
}

- (void)updateLayoutPropertiesForGridViewElement:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateStylePropertiesForGridViewElement:(uint64_t)a3 gridItemViewElements:(uint64_t)a4 numberOfGridItems:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateStylePropertiesForGridViewElement:(uint64_t)a3 gridItemViewElements:(uint64_t)a4 numberOfGridItems:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewElementIsStandardCard:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end