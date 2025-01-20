@interface SKUITracklistSectionHeaderCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)_titlesWidthForWidth:(double)a3 columnData:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUITracklistSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_showConfirmationAction:(id)a3;
- (void)itemOfferButtonWillAnimateTransition:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUITracklistSectionHeaderCollectionViewCell

- (SKUITracklistSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUITracklistSectionHeaderCollectionViewCell initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUITracklistSectionHeaderCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v16->_separatorView;
    v16->_separatorView = v17;

    v19 = v16->_separatorView;
    v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v19 setBackgroundColor:v20];

    v21 = [(SKUITracklistSectionHeaderCollectionViewCell *)v16 contentView];
    [v21 addSubview:v16->_separatorView];
  }
  return v16;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUITracklistSectionHeaderCollectionViewCell prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v17 = [v7 button];
  if (v17) {
    int v18 = [v8 prefetchResourcesForViewElement:v17 reason:a4];
  }
  else {
    int v18 = 0;
  }
  v19 = [v7 titleLabels];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        v18 |= [v8 prefetchResourcesForViewElement:*(void *)(*((void *)&v25 + 1) + 8 * i) reason:a4];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v21);
  }

  return v18 & 1;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUITracklistSectionHeaderCollectionViewCell preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUITracklistSectionHeaderCollectionViewCell requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  int v18 = [v9 aggregateValueForKey:0x1F1C8E028];
  [a1 _titlesWidthForWidth:v18 columnData:a4];
  double v20 = v19;
  v35 = v8;
  uint64_t v21 = [v8 titleLabels];
  uint64_t v22 = [v9 labelLayoutCache];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v23 = v21;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v29 = SKUITracklistAttributedStringForLabel(0, v28, v9);
        [v22 requestLayoutForLabel:v28 attributedString:v29 width:(uint64_t)v20];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v25);
  }

  uint64_t v30 = [v35 button];
  uint64_t v31 = [v30 elementType];
  if (v31 == 141 || v31 == 12)
  {
    v32 = SKUITracklistAttributedStringForButton(0, v30, v9);
    v33 = [v18 columnForIdentifier:1];
    [v33 width];
    [v22 requestLayoutForButton:v30 attributedString:v32 width:(uint64_t)v34];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUITracklistSectionHeaderCollectionViewCell sizeThatFitsWidth:viewElement:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  int v18 = [v8 titleLabels];
  double v19 = [v9 aggregateValueForKey:0x1F1C8E028];
  [a1 _titlesWidthForWidth:v19 columnData:a3];
  double v21 = v20;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v22 = v18;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v33;
    double v26 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(v9, "sizeForViewElement:width:", *(void *)(*((void *)&v32 + 1) + 8 * i), v21, (void)v32);
        double v26 = v26 + v28;
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v24);
  }
  else
  {
    double v26 = 0.0;
  }

  if (v26 <= 32.0) {
    double v29 = 44.0;
  }
  else {
    double v29 = v26 + 20.0;
  }

  double v30 = a3;
  double v31 = v29;
  result.double height = v31;
  result.double width = v30;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  button = self->_button;
  self->_button = 0;

  buttonViewElement = self->_buttonViewElement;
  self->_buttonViewElement = 0;

  buyButtonDescriptor = self->_buyButtonDescriptor;
  self->_buyButtonDescriptor = 0;

  uint64_t v13 = [v9 aggregateValueForKey:0x1F1C8E028];
  columnData = self->_columnData;
  self->_columnData = v13;

  uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  labels = self->_labels;
  self->_labels = v15;

  uint64_t v17 = [v8 style];
  int v18 = [v17 ikBorderColor];
  double v19 = [v18 color];

  separatorView = self->_separatorView;
  if (v19)
  {
    [(UIView *)self->_separatorView setBackgroundColor:v19];
  }
  else
  {
    double v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)separatorView setBackgroundColor:v21];
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__SKUITracklistSectionHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v24[3] = &unk_1E64234F8;
  double v27 = a4;
  v24[4] = self;
  id v25 = v8;
  id v26 = v9;
  id v22 = v9;
  id v23 = v8;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v24];
}

void __84__SKUITracklistSectionHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [(id)objc_opt_class() _titlesWidthForWidth:*(void *)(*(void *)(a1 + 32) + 840) columnData:*(double *)(a1 + 56)];
  double v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 40) button];
  if (([v6 elementType] & 0xFFFFFFFFFFFFFF7FLL) == 0xD)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 840) columnForIdentifier:1];
    [v7 width];
    id v8 = objc_msgSend(v3, "addButtonWithElement:width:context:", v6, *(void *)(a1 + 48));
    [v8 addTarget:*(void *)(a1 + 32) action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
    [v8 addTarget:*(void *)(a1 + 32) action:sel__buttonAction_ forControlEvents:0x20000];
    [v8 addTarget:*(void *)(a1 + 32) action:sel__showConfirmationAction_ forControlEvents:0x40000];
    [v8 setItemOfferDelegate:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(a1 + 32);
    BOOL v10 = *(void **)(v9 + 816);
    *(void *)(v9 + 816) = v8;
    id v11 = v8;

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 824), v6);
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 824) buyButtonDescriptor];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 832);
    *(void *)(v13 + 832) = v12;
  }
  uint64_t v15 = [*(id *)(a1 + 40) titleLabels];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        double v20 = [v3 addLabelViewWithElement:*(void *)(*((void *)&v21 + 1) + 8 * v19) width:*(void *)(a1 + 48) context:v5];
        [*(id *)(*(void *)(a1 + 32) + 848) addObject:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(SKUIBuyButtonDescriptor *)self->_buyButtonDescriptor canPersonalizeUsingItemState:v8];
  if (v10)
  {
    button = self->_button;
    buyButtonDescriptor = self->_buyButtonDescriptor;
    uint64_t v13 = [v9 clientContext];
    [(UIControl *)button setValuesUsingBuyButtonDescriptor:buyButtonDescriptor itemState:v8 clientContext:v13 animated:v5];
  }
  return v10;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v58.receiver = self;
  v58.super_class = (Class)SKUITracklistSectionHeaderCollectionViewCell;
  [(SKUICollectionViewCell *)&v58 layoutSubviews];
  id v3 = [(SKUITracklistSectionHeaderCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = objc_opt_class();
  [(SKUITracklistColumnData *)self->_columnData leftEdgeInset];
  double v10 = v5 - v9;
  [(SKUITracklistColumnData *)self->_columnData rightEdgeInset];
  [v8 _titlesWidthForWidth:self->_columnData columnData:v10 - v11];
  double v13 = v12;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v14 = self->_labels;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v55;
    CGFloat v18 = *MEMORY[0x1E4F1DB28];
    CGFloat v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v20 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v55 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v22 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        objc_msgSend(v22, "sizeThatFits:", v13, 1.79769313e308);
        v62.size.double height = v23;
        v62.origin.double x = v18;
        v62.origin.double y = v19;
        v62.size.double width = v13;
        CGRect v63 = CGRectIntegral(v62);
        double height = v63.size.height;
        objc_msgSend(v22, "setFrame:", v63.origin.x, v63.origin.y, v63.size.width);
        double v20 = v20 + height;
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v16);
  }
  else
  {
    double v20 = 0.0;
  }

  [(SKUITracklistColumnData *)self->_columnData leftEdgeInset];
  double v26 = v25;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  double v27 = self->_labels;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    float v30 = (v7 - v20) * 0.5;
    double MaxY = floorf(v30);
    uint64_t v32 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v51 != v32) {
          objc_enumerationMutation(v27);
        }
        long long v34 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        objc_msgSend(v34, "frame", (void)v50);
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        objc_msgSend(v34, "setFrame:", v26, MaxY);
        v64.origin.double x = v26;
        v64.origin.double y = MaxY;
        v64.size.double width = v36;
        v64.size.double height = v38;
        double MaxY = CGRectGetMaxY(v64);
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v29);
  }

  button = self->_button;
  if (button)
  {
    -[UIControl sizeThatFits:](button, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
    double v41 = v40;
    double v43 = v42;
    [(SKUITracklistColumnData *)self->_columnData rightEdgeInset];
    float v45 = (v7 - v43) * 0.5;
    -[UIControl setFrame:](self->_button, "setFrame:", v5 - v44 - v41, floorf(v45), v41, v43);
  }
  v46 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", (void)v50);
  [v46 scale];
  double v48 = 1.0 / v47;

  [(SKUITracklistColumnData *)self->_columnData leftEdgeInset];
  -[UIView setFrame:](self->_separatorView, "setFrame:", v49, v7 - v48, v5 - v49, v48);
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  id v15 = a3;
  [v15 frame];
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_msgSend(v15, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  double v12 = v11;
  double v14 = v13;
  v17.origin.double x = v4;
  v17.origin.double y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  objc_msgSend(v15, "setFrame:", CGRectGetMaxX(v17) - v12, v6, v12, v14);
}

- (void)_buttonAction:(id)a3
{
  SKUICollectionViewForView(self);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  CGFloat v4 = [v8 delegate];
  char v5 = objc_opt_respondsToSelector();
  buttonViewElement = self->_buttonViewElement;
  if (v5)
  {
    double v7 = [v8 indexPathForCell:self];
    [v4 collectionView:v8 didConfirmButtonElement:buttonViewElement withClickInfo:0 forItemAtIndexPath:v7];
  }
  else
  {
    [(SKUIButtonViewElement *)self->_buttonViewElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

- (void)_cancelConfirmationAction:(id)a3
{
}

- (void)_showConfirmationAction:(id)a3
{
  id v4 = a3;
  double v3 = [v4 superview];
  [v3 bringSubviewToFront:v4];

  [v4 setShowingConfirmation:1 animated:1];
}

+ (double)_titlesWidthForWidth:(double)a3 columnData:(id)a4
{
  id v5 = a4;
  double v6 = [v5 columnForIdentifier:1];
  double v7 = v6;
  if (v6)
  {
    [v6 width];
    double v9 = a3 - v8;
    [v5 interColumnSpacing];
    a3 = v9 - v10;
  }

  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_columnData, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptor, 0);
  objc_storeStrong((id *)&self->_buttonViewElement, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end