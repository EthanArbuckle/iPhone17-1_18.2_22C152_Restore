@interface SKUIFilterBarView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForButtonText:(id)a3 style:(id)a4 context:(id)a5;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (id)_attributedStringForMenuItem:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIFilterBarView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_destroyMenuPopover;
- (void)_imageTapAction:(id)a3;
- (void)_menuButtonAction:(id)a3;
- (void)_showConfirmationAction:(id)a3;
- (void)dealloc;
- (void)itemOfferButtonWillAnimateTransition:(id)a3;
- (void)layoutSubviews;
- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4;
- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUIFilterBarView

- (SKUIFilterBarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFilterBarView initWithFrame:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIFilterBarView;
  v8 = -[SKUIViewReuseView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    centerElementViews = v8->_centerElementViews;
    v8->_centerElementViews = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    leftElementViews = v8->_leftElementViews;
    v8->_leftElementViews = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    rightElementViews = v8->_rightElementViews;
    v8->_rightElementViews = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    viewElementViews = v8->_viewElementViews;
    v8->_viewElementViews = (NSMapTable *)v15;
  }
  return v8;
}

- (void)dealloc
{
  [(SKUIMenuPopoverController *)self->_popoverController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIFilterBarView;
  [(SKUIViewReuseView *)&v3 dealloc];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__SKUIFilterBarView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_1E64234D0;
  id v9 = v8;
  v13 = &v15;
  int64_t v14 = a4;
  id v12 = v9;
  [v7 enumerateChildrenUsingBlock:v11];
  LOBYTE(a4) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __68__SKUIFilterBarView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) prefetchResourcesForViewElement:a2 reason:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = 1;
  }
  else {
    char v5 = result;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v5;
  result.double width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v8 labelLayoutCache];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__SKUIFilterBarView_requestLayoutForViewElement_width_context___block_invoke;
  v13[3] = &unk_1E6424DE8;
  double v16 = a4;
  id v17 = a1;
  id v14 = v10;
  id v15 = v8;
  id v11 = v8;
  id v12 = v10;
  [v9 enumerateChildrenUsingBlock:v13];
}

uint64_t __63__SKUIFilterBarView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 elementType];
  if (v3 <= 68)
  {
    if (v3 == 8)
    {
      uint64_t v3 = [*(id *)(a1 + 32) requestLayoutForBadge:v8 width:(uint64_t)*(double *)(a1 + 48)];
      goto LABEL_13;
    }
    id v4 = v8;
    if (v3 != 12) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  if (v3 == 69)
  {
    double v5 = [v8 titleItem];
    v6 = [*(id *)(a1 + 56) _attributedStringForMenuItem:v5 context:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) requestLayoutForViewElement:v5 attributedString:v6 width:(uint64_t)*(double *)(a1 + 48)];

    goto LABEL_11;
  }
  id v4 = v8;
  if (v3 == 138)
  {
    double v5 = [*(id *)(a1 + 56) _attributedStringForLabel:v8 context:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) requestLayoutForLabel:v8 attributedString:v5 width:(uint64_t)*(double *)(a1 + 48)];
    goto LABEL_11;
  }
  if (v3 == 141)
  {
LABEL_8:
    double v5 = [*(id *)(a1 + 56) _attributedStringForButton:v8 context:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) requestLayoutForButton:v8 attributedString:v5 width:(uint64_t)*(double *)(a1 + 48)];
LABEL_11:

LABEL_13:
    id v4 = v8;
  }
LABEL_14:

  return MEMORY[0x1F41817F8](v3, v4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x3010000000;
  v21 = &unk_1C1D0F257;
  double v22 = a3;
  uint64_t v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__SKUIFilterBarView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v14[3] = &unk_1E64234D0;
  id v9 = v8;
  double v17 = a3;
  id v15 = v9;
  double v16 = &v18;
  [v7 enumerateChildrenUsingBlock:v14];
  double v10 = v19[4];
  if (v19[5] >= 29.0) {
    double v11 = v19[5];
  }
  else {
    double v11 = 29.0;
  }
  v19[5] = v11;

  _Block_object_dispose(&v18, 8);
  double v12 = v10;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

uint64_t __59__SKUIFilterBarView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) sizeForViewElement:a2 width:*(double *)(a1 + 48)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  double v6 = *(double *)(v5 + 40);
  if (v6 < v4) {
    double v6 = v4;
  }
  *(double *)(v5 + 40) = v6;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(NSMutableArray *)self->_centerElementViews removeAllObjects];
  [(NSMutableArray *)self->_leftElementViews removeAllObjects];
  [(NSMutableArray *)self->_rightElementViews removeAllObjects];
  [(NSMapTable *)self->_viewElementViews removeAllObjects];
  bottomDividerView = self->_bottomDividerView;
  self->_bottomDividerView = 0;

  elementControllers = self->_elementControllers;
  self->_elementControllers = 0;

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__SKUIFilterBarView_reloadWithViewElement_width_context___block_invoke;
  v14[3] = &unk_1E64234F8;
  void v14[4] = self;
  id v15 = v8;
  double v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(SKUIViewReuseView *)self modifyUsingBlock:v14];
}

void __57__SKUIFilterBarView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v41[0] = *(id *)(*(void *)(a1 + 32) + 488);
  v41[1] = *(id *)(*(void *)(a1 + 32) + 432);
  uint64_t v4 = 0;
  v41[2] = *(id *)(*(void *)(a1 + 32) + 504);
  do
  {
    uint64_t v5 = [*(id *)(a1 + 40) childViewElementsForAlignment:qword_1C1CCB328[v4]];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (!v6) {
      goto LABEL_44;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v11 = [v10 elementType];
        if (v11 <= 68)
        {
          if (v11 > 12)
          {
            if (v11 == 13) {
              goto LABEL_29;
            }
            if (v11 != 49)
            {
              if (v11 != 50) {
                continue;
              }
              goto LABEL_27;
            }
            id v13 = [v3 addImageViewWithElement:v10 context:*(void *)(a1 + 48)];
            uint64_t v23 = [v13 tapRecognizer];
            [(SKUISearchBarController *)v23 addTarget:*(void *)(a1 + 32) action:sel__imageTapAction_];
            goto LABEL_37;
          }
          if (v11 != 8)
          {
            if (v11 != 12) {
              continue;
            }
LABEL_27:
            id v13 = [v3 addButtonWithElement:v10 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
            [v13 removeTarget:*(void *)(a1 + 32) action:0 forControlEvents:0xFFFFFFFFLL];
            [v13 addTarget:*(void *)(a1 + 32) action:sel__buttonAction_ forControlEvents:64];
            if (v13) {
              goto LABEL_41;
            }
            continue;
          }
          uint64_t v21 = [v3 addBadgeViewWithElement:v10 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
LABEL_40:
          id v13 = (void *)v21;
          if (!v21) {
            continue;
          }
LABEL_41:
          [(id)v41[v4] addObject:v13];
          [*(id *)(*(void *)(a1 + 32) + 512) setObject:v10 forKey:v13];

          continue;
        }
        if (v11 > 137)
        {
          switch(v11)
          {
            case 138:
              uint64_t v21 = [v3 addLabelViewWithElement:v10 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
              break;
            case 141:
LABEL_29:
              id v13 = [v3 addButtonWithElement:v10 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
              [v13 addTarget:*(void *)(a1 + 32) action:sel__buttonAction_ forControlEvents:0x20000];
              [v13 addTarget:*(void *)(a1 + 32) action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
              [v13 addTarget:*(void *)(a1 + 32) action:sel__showConfirmationAction_ forControlEvents:0x40000];
              LODWORD(v22) = -0.5;
              [v13 setCharge:v22];
              [v13 setItemOfferDelegate:*(void *)(a1 + 32)];
              if (v13) {
                goto LABEL_41;
              }
              continue;
            case 152:
              uint64_t v21 = [v3 addImageViewWithVideoElement:v10 context:*(void *)(a1 + 48)];
              break;
            default:
              continue;
          }
          goto LABEL_40;
        }
        switch(v11)
        {
          case 'E':
            uint64_t v23 = [v10 titleItem];
            id v13 = [v3 addMenuButtonWithTitleItem:v23 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
            [v13 removeTarget:*(void *)(a1 + 32) action:0 forControlEvents:0xFFFFFFFFLL];
            [v13 addTarget:*(void *)(a1 + 32) action:sel__menuButtonAction_ forControlEvents:64];
            goto LABEL_37;
          case 'j':
            uint64_t v23 = [[SKUISearchBarController alloc] initWithSearchBarViewElement:v10];
            v24 = [*(id *)(a1 + 48) clientContext];
            [(SKUISearchBarController *)v23 setClientContext:v24];

            v25 = [*(id *)(a1 + 48) parentViewController];
            [(SKUISearchBarController *)v23 setParentViewController:v25];

            v26 = *(void **)(*(void *)(a1 + 32) + 472);
            if (!v26)
            {
              id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v28 = *(void *)(a1 + 32);
              v29 = *(void **)(v28 + 472);
              *(void *)(v28 + 472) = v27;

              v26 = *(void **)(*(void *)(a1 + 32) + 472);
            }
            [v26 addObject:v23];
            id v13 = [(SKUISearchBarController *)v23 searchBar];
            [v3 addView:v13];
LABEL_37:

            if (v13) {
              goto LABEL_41;
            }
            continue;
          case 'm':
            uint64_t v12 = v4;
            id v13 = [v3 addReusableViewWithReuseIdentifier:0x1F1C8E908];
            id v14 = [[SKUISegmentedControlViewElementController alloc] initWithViewElement:v10 segmentedControl:v13];
            id v15 = [*(id *)(a1 + 48) clientContext];
            [(SKUISegmentedControlViewElementController *)v14 setClientContext:v15];

            id v16 = [*(id *)(a1 + 48) parentViewController];
            [(SKUISegmentedControlViewElementController *)v14 setParentViewController:v16];

            double v17 = *(void **)(*(void *)(a1 + 32) + 472);
            if (!v17)
            {
              id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v19 = *(void *)(a1 + 32);
              uint64_t v20 = *(void **)(v19 + 472);
              *(void *)(v19 + 472) = v18;

              double v17 = *(void **)(*(void *)(a1 + 32) + 472);
            }
            [v17 addObject:v14];

            uint64_t v4 = v12;
            if (v13) {
              goto LABEL_41;
            }
            break;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v7);
LABEL_44:

    ++v4;
  }
  while (v4 != 3);
  v30 = [*(id *)(a1 + 40) bottomDivider];
  if (v30)
  {
    uint64_t v31 = [v3 addDividerWithElement:v30 context:*(void *)(a1 + 48)];
    uint64_t v32 = *(void *)(a1 + 32);
    v33 = *(void **)(v32 + 424);
    *(void *)(v32 + 424) = v31;

    [*(id *)(*(void *)(a1 + 32) + 424) setDividerOrientation:0];
    [*(id *)(*(void *)(a1 + 32) + 424) setDividerSize:0.0];
  }

  for (uint64_t j = 2; j != -1; --j)
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    [(SKUIFilterBarView *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v74[3] = *MEMORY[0x1E4F143B8];
  [(SKUIFilterBarView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v74[0] = self->_leftElementViews;
  v74[1] = self->_centerElementViews;
  v54 = self;
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  v74[2] = self->_rightElementViews;
  double v71 = 0.0;
  double v72 = 0.0;
  double v73 = 0.0;
  double v9 = 0.0;
  do
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v10 = (id)v74[v8];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v66 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          [v15 frame];
          double v17 = v16;
          double v19 = v18;
          objc_msgSend(v15, "sizeThatFits:", v4, v6);
          double v21 = v20;
          objc_msgSend(v15, "setFrame:", v17, v19, v20, v22);
          *(&v71 + v8) = v21 + *(&v71 + v8);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v12);
    }

    uint64_t v23 = [v10 count];
    if (v23 > 0) {
      ++v7;
    }
    if (v23 <= 1)
    {
      double v24 = *(&v71 + v8);
    }
    else
    {
      double v24 = *(&v71 + v8) + (float)((float)(v23 - 1) * 9.0);
      *(&v71 + v8) = v24;
    }
    double v9 = v9 + v24;
    ++v8;
  }
  while (v8 != 3);
  if (v7 > 1) {
    double v9 = v9 + (float)((float)(uint64_t)(v7 - 1) * 9.0);
  }
  double right = v54->_contentInset.right;
  for (j = v4 - v54->_contentInset.left - right; v9 > j; double v9 = v9 + -5.0)
  {
    uint64_t v27 = 0;
    double v28 = 0.0;
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (*(&v71 + v27) > v28)
      {
        double v28 = *(&v71 + v27);
        uint64_t v29 = v27;
      }
      ++v27;
    }
    while (v27 != 3);
    *(&v71 + v29) = *(&v71 + v29) + -5.0;
  }
  uint64_t v30 = 0;
  double v59 = v73;
  double v53 = v4;
  float v31 = (v4 - v72) * 0.5;
  double v57 = floorf(v31);
  double v58 = v71;
  double v60 = v4 - right - v73;
  double v55 = v60 - v72 + -9.0;
  double v56 = v60 - v72;
  do
  {
    double left = v60;
    if (v30 != 2)
    {
      if (v30 == 1)
      {
        double v33 = v58 + v54->_contentInset.left;
        if (v58 > 0.00000011920929) {
          double v33 = v33 + 9.0;
        }
        if (v33 < v57) {
          double v33 = v57;
        }
        if (v59 <= 0.00000011920929) {
          double v34 = v56;
        }
        else {
          double v34 = v55;
        }
        if (v33 >= v34) {
          double left = v34;
        }
        else {
          double left = v33;
        }
      }
      else if (v30)
      {
        double left = 0.0;
      }
      else
      {
        double left = v54->_contentInset.left;
      }
    }
    double v35 = *(&v71 + v30);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v36 = (id)v74[v30];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      double v39 = left + v35;
      uint64_t v40 = *(void *)v62;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v62 != v40) {
            objc_enumerationMutation(v36);
          }
          v42 = *(void **)(*((void *)&v61 + 1) + 8 * k);
          objc_msgSend(v42, "frame", *(void *)&v53);
          CGFloat v45 = v44;
          float v46 = (v6 - v44) * 0.5;
          double v47 = floorf(v46);
          if (v43 >= v39 - left) {
            double v48 = v39 - left;
          }
          else {
            double v48 = v43;
          }
          objc_msgSend(v42, "setFrame:", left, v47, v48);
          [v42 setHidden:left > v39];
          v75.origin.double x = left;
          v75.origin.double y = v47;
          v75.size.double width = v48;
          v75.size.double height = v45;
          double left = CGRectGetMaxX(v75) + 9.0;
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v38);
    }

    ++v30;
  }
  while (v30 != 3);
  if (v54->_bottomDividerView)
  {
    v49 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v49 scale];
    double v51 = 1.0 / v50;

    -[SKUIDividerView setFrame:](v54->_bottomDividerView, "setFrame:", 0.0, v6 - v51, v53, v51);
  }
  for (uint64_t m = 2; m != -1; --m)
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v4 = self->_viewElementViews;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    double v8 = 29.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "sizeThatFits:", width, v8, (void)v13);
        if (v8 < v10) {
          double v8 = v10;
        }
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 29.0;
  }

  double v11 = width;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  id v15 = a3;
  [v15 frame];
  double x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double MaxX = CGRectGetMaxX(v17);
  objc_msgSend(v15, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  double v9 = v8;
  double v11 = v10;
  if ([(NSMutableArray *)self->_centerElementViews containsObject:v15])
  {
    float v12 = (v9 - width) * 0.5;
    double v13 = x - floorf(v12);
  }
  else
  {
    int v14 = [(NSMutableArray *)self->_rightElementViews containsObject:v15];
    double v13 = MaxX - v9;
    if (!v14) {
      double v13 = x;
    }
  }
  objc_msgSend(v15, "setFrame:", v13, y, v9, v11);
}

- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
  if (self->_focusedMenuButton)
  {
    -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) == 0;
    uint64_t v7 = v8;
    if (v6) {
      uint64_t v7 = 0;
    }
    [v7 dispatchEventOfType:2 forItemAtIndex:a4];
    [(SKUIFilterBarView *)self _destroyMenuPopover];
  }
}

- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5
{
  [(UIControl *)self->_focusedMenuButton frame];
  a4->origin.double x = v6;
  a4->origin.double y = v7;
  a4->size.double width = v8;
  a4->size.double height = v9;
}

- (void)_buttonAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SKUICollectionViewCellForView(self);
  CGFloat v6 = SKUICollectionViewForView(self);
  CGFloat v7 = [v6 delegate];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CGFloat v8 = self->_viewElementViews;
  uint64_t v9 = [(NSMapTable *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (*(id *)(*((void *)&v15 + 1) + 8 * i) == v4)
        {
          double v13 = -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", v4, (void)v15);
          if (objc_opt_respondsToSelector())
          {
            int v14 = [v6 indexPathForCell:v5];
            [v7 collectionView:v6 didConfirmButtonElement:v13 withClickInfo:0 forItemAtIndexPath:v14];
          }
          else
          {
            [v13 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
          }

          goto LABEL_14;
        }
      }
      uint64_t v10 = [(NSMapTable *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)_cancelConfirmationAction:(id)a3
{
  id v4 = a3;
  [(SKUIFilterBarView *)self bringSubviewToFront:v4];
  [v4 setShowingConfirmation:0 animated:1];
}

- (void)_imageTapAction:(id)a3
{
  viewElementViews = self->_viewElementViews;
  id v4 = [a3 view];
  id v5 = [(NSMapTable *)viewElementViews objectForKey:v4];

  [v5 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (void)_menuButtonAction:(id)a3
{
  id v24 = a3;
  popoverController = self->_popoverController;
  if (popoverController)
  {
    [(SKUIMenuPopoverController *)popoverController setDelegate:0];
    [(SKUIMenuPopoverController *)self->_popoverController dismissAnimated:1];
    focusedMenuButton = self->_focusedMenuButton;
    self->_focusedMenuButton = 0;

    CGFloat v7 = self->_popoverController;
    self->_popoverController = 0;
  }
  CGFloat v8 = [(NSMapTable *)self->_viewElementViews objectForKey:v24];
  if (v8)
  {
    p_focusedMenuButton = &self->_focusedMenuButton;
    objc_storeStrong((id *)&self->_focusedMenuButton, a3);
    uint64_t v10 = [SKUIMenuPopoverController alloc];
    uint64_t v11 = [v8 menuItemTitles];
    float v12 = -[SKUIMenuPopoverController initWithMenuTitles:selectedIndex:](v10, "initWithMenuTitles:selectedIndex:", v11, [v8 selectedItemIndex]);
    double v13 = self->_popoverController;
    self->_popoverController = v12;

    [(SKUIMenuPopoverController *)self->_popoverController setDelegate:self];
    int v14 = self->_popoverController;
    [(UIControl *)*p_focusedMenuButton frame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    uint64_t v23 = [(UIControl *)*p_focusedMenuButton superview];
    -[SKUIMenuPopoverController presentFromRect:inView:permittedArrowDirections:animated:](v14, "presentFromRect:inView:permittedArrowDirections:animated:", v23, 15, 1, v16, v18, v20, v22);
  }
}

- (void)_showConfirmationAction:(id)a3
{
  id v4 = a3;
  [(SKUIFilterBarView *)self bringSubviewToFront:v4];
  [v4 setShowingConfirmation:1 animated:1];
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = [v6 buttonText];
  uint64_t v9 = [v6 buttonTitleStyle];
  if (v9)
  {
    uint64_t v10 = [a1 _attributedStringForButtonText:v8 style:v9 context:v7];
  }
  else
  {
    uint64_t v11 = [v6 style];
    uint64_t v10 = [a1 _attributedStringForButtonText:v8 style:v11 context:v7];
  }

  return v10;
}

+ (id)_attributedStringForButtonText:(id)a3 style:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = SKUIViewElementFontWithStyle(v8);
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
  }
  uint64_t v11 = [v9 tintColor];
  float v12 = SKUIViewElementPlainColorWithStyle(v8, v11);

  if (!v12)
  {
    float v12 = [MEMORY[0x1E4FB1618] labelColor];
  }
  double v13 = [v7 attributedStringWithDefaultFont:v10 foregroundColor:v12 style:v8];

  return v13;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 style];
  id v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
  }
  id v9 = [v6 tintColor];
  uint64_t v10 = SKUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4FB1618] labelColor];
  }
  uint64_t v11 = [v5 text];
  float v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v12;
}

+ (id)_attributedStringForMenuItem:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 itemText];
  id v9 = [v7 style];

  uint64_t v10 = [a1 _attributedStringForButtonText:v8 style:v9 context:v6];

  return v10;
}

- (void)_destroyMenuPopover
{
  [(SKUIMenuPopoverController *)self->_popoverController setDelegate:0];
  focusedMenuButton = self->_focusedMenuButton;
  self->_focusedMenuButton = 0;

  popoverController = self->_popoverController;
  self->_popoverController = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_rightElementViews, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_leftElementViews, 0);
  objc_storeStrong((id *)&self->_focusedMenuButton, 0);
  objc_storeStrong((id *)&self->_elementControllers, 0);
  objc_storeStrong((id *)&self->_centerElementViews, 0);

  objc_storeStrong((id *)&self->_bottomDividerView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFilterBarView initWithFrame:]";
}

@end