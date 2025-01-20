@interface SUUITracklistSectionHeaderCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)_titlesWidthForWidth:(double)a3 columnData:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUITracklistSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_showConfirmationAction:(id)a3;
- (void)itemOfferButtonWillAnimateTransition:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUITracklistSectionHeaderCollectionViewCell

- (SUUITracklistSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUITracklistSectionHeaderCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v4;

    v6 = v3->_separatorView;
    v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v6 setBackgroundColor:v7];

    v8 = [(SUUITracklistSectionHeaderCollectionViewCell *)v3 contentView];
    [v8 addSubview:v3->_separatorView];
  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 button];
  if (v9) {
    int v10 = [v8 prefetchResourcesForViewElement:v9 reason:a4];
  }
  else {
    int v10 = 0;
  }
  v11 = [v7 titleLabels];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v10 |= [v8 prefetchResourcesForViewElement:*(void *)(*((void *)&v17 + 1) + 8 * i) reason:a4];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  return v10 & 1;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = [v9 aggregateValueForKey:0x2704FCC90];
  [a1 _titlesWidthForWidth:v10 columnData:a4];
  double v12 = v11;
  v27 = v8;
  uint64_t v13 = [v8 titleLabels];
  uint64_t v14 = [v9 labelLayoutCache];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v21 = SUUITracklistAttributedStringForLabel(0, v20, v9);
        [v14 requestLayoutForLabel:v20 attributedString:v21 width:(uint64_t)v12];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }

  uint64_t v22 = [v27 button];
  uint64_t v23 = [v22 elementType];
  if (v23 == 141 || v23 == 12)
  {
    v24 = SUUITracklistAttributedStringForButton(0, v22, v9);
    v25 = [v10 columnForIdentifier:1];
    [v25 width];
    [v14 requestLayoutForButton:v22 attributedString:v24 width:(uint64_t)v26];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = [a4 titleLabels];
  int v10 = [v8 aggregateValueForKey:0x2704FCC90];
  [a1 _titlesWidthForWidth:v10 columnData:a3];
  double v12 = v11;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    double v17 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v8, "sizeForViewElement:width:", *(void *)(*((void *)&v23 + 1) + 8 * i), v12, (void)v23);
        double v17 = v17 + v19;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }
  else
  {
    double v17 = 0.0;
  }

  if (v17 <= 32.0) {
    double v20 = 44.0;
  }
  else {
    double v20 = v17 + 20.0;
  }

  double v21 = a3;
  double v22 = v20;
  result.height = v22;
  result.width = v21;
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

  id v13 = [v9 aggregateValueForKey:0x2704FCC90];
  columnData = self->_columnData;
  self->_columnData = v13;

  uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  labels = self->_labels;
  self->_labels = v15;

  double v17 = [v8 style];
  uint64_t v18 = [v17 ikBorderColor];
  double v19 = [v18 color];

  separatorView = self->_separatorView;
  if (v19)
  {
    [(UIView *)self->_separatorView setBackgroundColor:v19];
  }
  else
  {
    double v21 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)separatorView setBackgroundColor:v21];
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __84__SUUITracklistSectionHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v24[3] = &unk_265400C88;
  double v27 = a4;
  v24[4] = self;
  id v25 = v8;
  id v26 = v9;
  id v22 = v9;
  id v23 = v8;
  [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:v24];
}

void __84__SUUITracklistSectionHeaderCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [(id)objc_opt_class() _titlesWidthForWidth:*(void *)(*(void *)(a1 + 32) + 840) columnData:*(double *)(a1 + 56)];
  double v5 = v4;
  v6 = [*(id *)(a1 + 40) button];
  if (([v6 elementType] & 0xFFFFFFFFFFFFFF7FLL) == 0xD)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 840) columnForIdentifier:1];
    [v7 width];
    id v8 = objc_msgSend(v3, "addButtonWithElement:width:context:", v6, *(void *)(a1 + 48));
    [v8 addTarget:*(void *)(a1 + 32) action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
    [v8 addTarget:*(void *)(a1 + 32) action:sel__buttonAction_ forControlEvents:0x20000];
    [v8 addTarget:*(void *)(a1 + 32) action:sel__showConfirmationAction_ forControlEvents:0x40000];
    [v8 setItemOfferDelegate:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(void **)(v9 + 816);
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
  BOOL v10 = [(SUUIBuyButtonDescriptor *)self->_buyButtonDescriptor canPersonalizeUsingItemState:v8];
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
  uint64_t v61 = *MEMORY[0x263EF8340];
  v58.receiver = self;
  v58.super_class = (Class)SUUITracklistSectionHeaderCollectionViewCell;
  [(SUUICollectionViewCell *)&v58 layoutSubviews];
  id v3 = [(SUUITracklistSectionHeaderCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = objc_opt_class();
  [(SUUITracklistColumnData *)self->_columnData leftEdgeInset];
  double v10 = v5 - v9;
  [(SUUITracklistColumnData *)self->_columnData rightEdgeInset];
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
    CGFloat v18 = *MEMORY[0x263F001A8];
    CGFloat v19 = *(double *)(MEMORY[0x263F001A8] + 8);
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
        v62.origin.x = v18;
        v62.origin.y = v19;
        v62.size.width = v13;
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

  [(SUUITracklistColumnData *)self->_columnData leftEdgeInset];
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
        v34 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        objc_msgSend(v34, "frame", (void)v50);
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        objc_msgSend(v34, "setFrame:", v26, MaxY);
        v64.origin.x = v26;
        v64.origin.y = MaxY;
        v64.size.width = v36;
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
    -[UIControl sizeThatFits:](button, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    double v41 = v40;
    double v43 = v42;
    [(SUUITracklistColumnData *)self->_columnData rightEdgeInset];
    float v45 = (v7 - v43) * 0.5;
    -[UIControl setFrame:](self->_button, "setFrame:", v5 - v44 - v41, floorf(v45), v41, v43);
  }
  v46 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", (void)v50);
  [v46 scale];
  double v48 = 1.0 / v47;

  [(SUUITracklistColumnData *)self->_columnData leftEdgeInset];
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
  objc_msgSend(v15, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  double v12 = v11;
  double v14 = v13;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.double height = v10;
  objc_msgSend(v15, "setFrame:", CGRectGetMaxX(v17) - v12, v6, v12, v14);
}

- (void)_buttonAction:(id)a3
{
  SUUICollectionViewForView(self);
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
    [(SUUIButtonViewElement *)self->_buttonViewElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
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

@end