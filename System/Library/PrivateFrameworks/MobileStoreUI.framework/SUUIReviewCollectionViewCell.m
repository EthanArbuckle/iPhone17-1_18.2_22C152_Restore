@interface SUUIReviewCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForDateLabel:(id)a3 context:(id)a4;
+ (id)_attributedStringForTitleLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIResponseView)responseView;
- (SUUITextBoxView)descriptionView;
- (id)descriptionTapAction;
- (id)responseDescriptionTapAction;
- (id)viewForElementIdentifier:(id)a3;
- (void)_resetTapGestures;
- (void)contentViewTapped:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setDescriptionTapAction:(id)a3;
- (void)setDescriptionView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setResponseDescriptionTapAction:(id)a3;
- (void)setResponseView:(id)a3;
@end

@implementation SUUIReviewCollectionViewCell

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__SUUIReviewCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v9[3] = &unk_265405690;
  double v11 = a4;
  id v10 = v7;
  id v8 = v7;
  [a3 enumerateChildrenUsingBlock:v9];
}

void __74__SUUIReviewCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 elementType];
  if (v3 <= 134)
  {
    if (v3 != 102)
    {
      if (v3 != 105) {
        goto LABEL_12;
      }
      v4 = off_2653FF8A8;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v3 == 138)
  {
    if ([v6 labelViewStyle] == 1)
    {
      v5 = [*(id *)(a1 + 32) editorialLayoutForLabelElement:v6 width:*(double *)(a1 + 40)];
      [v5 enqueueLayoutRequests];
    }
LABEL_10:
    v4 = off_2653FF898;
    goto LABEL_11;
  }
  if (v3 != 135) {
    goto LABEL_12;
  }
  v4 = off_2653FF9A0;
LABEL_11:
  [(__objc2_class *)*v4 requestLayoutForViewElement:v6 width:*(void *)(a1 + 32) context:*(double *)(a1 + 40)];
LABEL_12:
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v22 = 0;
  v23 = (double *)&v22;
  uint64_t v24 = 0x3010000000;
  v25 = "";
  long long v26 = *MEMORY[0x263F001B0];
  *(double *)&long long v26 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__SUUIReviewCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v14[3] = &unk_265402398;
  double v19 = a3;
  id v9 = v8;
  id v15 = v9;
  v16 = &v22;
  v17 = v21;
  v18 = v20;
  [v7 enumerateChildrenUsingBlock:v14];
  double v10 = v23[4];
  double v11 = v23[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);

  double v12 = v10;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

void __70__SUUIReviewCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if ([v12 elementType] == 105)
  {
    +[SUUIReviewListTitleView sizeThatFitsWidth:v12 viewElement:*(void *)(a1 + 32) context:*(double *)(a1 + 64)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    double v5 = v4 + *(double *)(v3 + 40);
LABEL_5:
    *(double *)(v3 + 40) = v5;
    goto LABEL_9;
  }
  if ([v12 elementType] == 102)
  {
    +[SUUIResponseView sizeThatFitsWidth:v12 viewElement:*(void *)(a1 + 32) context:*(double *)(a1 + 64)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    double v5 = v6 + 10.0 + *(double *)(v3 + 40);
    goto LABEL_5;
  }
  [*(id *)(a1 + 32) sizeForViewElement:v12 width:*(double *)(a1 + 64)];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v7
                                                              + 10.0
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40);
  id v8 = [*(id *)(a1 + 32) textPropertiesForViewElement:v12 width:*(double *)(a1 + 64)];
  id v9 = v8;
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 1)
  {
    [v8 desiredOffsetTop];
    *(float *)&double v10 = v10 - *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40)
                                                                + fmax(roundf(*(float *)&v10), 0.0);
  }
  [v9 baselineOffsetFromBottom];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;

LABEL_9:
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__SUUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_265400C88;
  double v16 = a4;
  id v13 = v8;
  id v14 = v9;
  id v15 = self;
  id v10 = v9;
  id v11 = v8;
  [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:v12];
}

void __68__SUUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __68__SUUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  id v11 = &unk_2654023C0;
  id v12 = v3;
  uint64_t v15 = *(void *)(a1 + 56);
  double v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v13 = v5;
  uint64_t v14 = v6;
  id v7 = v3;
  [v4 enumerateChildrenUsingBlock:&v8];
  objc_msgSend(*(id *)(a1 + 48), "_resetTapGestures", v8, v9, v10, v11);
}

void __68__SUUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 elementType];
  if (v3 <= 134)
  {
    if (v3 != 102)
    {
      if (v3 != 105) {
        goto LABEL_15;
      }
      uint64_t v4 = [*(id *)(a1 + 32) addReviewListTitleViewWithViewElement:v7 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
LABEL_13:
      id v5 = (void *)v4;
      if (!v4) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    id v5 = [*(id *)(a1 + 32) addResponseViewWithViewElement:v7 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
    [*(id *)(a1 + 48) setResponseView:v5];
    if (!v5) {
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v6 = [*(id *)(a1 + 40) textPropertiesForViewElement:v7 width:*(double *)(a1 + 56)];
    [*(id *)(a1 + 32) setTextProperties:v6 forView:v5];

    goto LABEL_15;
  }
  if (v3 == 135)
  {
    uint64_t v4 = [*(id *)(a1 + 32) addStarRatingViewWithViewElement:v7 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
    goto LABEL_13;
  }
  if (v3 == 138 && [v7 labelViewStyle] == 1)
  {
    id v5 = [*(id *)(a1 + 32) addTextViewWithElement:v7 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
    [*(id *)(a1 + 48) setDescriptionView:v5];
    if (v5) {
      goto LABEL_14;
    }
  }
LABEL_15:
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

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIReviewCollectionViewCell;
  -[SUUICollectionViewCell setHighlighted:](&v9, sel_setHighlighted_);
  if (v3)
  {
    id v5 = [MEMORY[0x263F825C8] colorWithWhite:0.9 alpha:1.0];
    [(SUUIViewReuseCollectionViewCell *)self setBackgroundColor:v5];

    [MEMORY[0x263F825C8] colorWithWhite:0.9 alpha:1.0];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIViewReuseCollectionViewCell *)self setBackgroundColor:v6];

    [MEMORY[0x263F825C8] clearColor];
  id v7 = };
  uint64_t v8 = [(SUUIReviewCollectionViewCell *)self contentView];
  [v8 setBackgroundColor:v7];
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)SUUIReviewCollectionViewCell;
  [(SUUICollectionViewCell *)&v27 layoutSubviews];
  char v3 = storeShouldReverseLayoutDirection() ^ 1;
  uint64_t v4 = [(SUUIReviewCollectionViewCell *)self contentView];
  [v4 bounds];
  uint64_t v22 = v5;
  uint64_t v7 = v6;
  double v9 = v8;
  uint64_t v11 = v10;

  [(SUUIViewReuseCollectionViewCell *)self contentInset];
  uint64_t v13 = v12;
  double v15 = v14;
  uint64_t v17 = v16;
  double v19 = v18;
  double v20 = v9 - v14 - v18;
  v21 = [(SUUIViewReuseCollectionViewCell *)self allExistingViews];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = v13;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__SUUIReviewCollectionViewCell_layoutSubviews__block_invoke;
  v23[3] = &unk_265402410;
  v23[4] = self;
  v23[5] = v25;
  v23[6] = v26;
  char v24 = v3;
  *(double *)&v23[7] = v20;
  v23[8] = v13;
  *(double *)&v23[9] = v15;
  v23[10] = v17;
  *(double *)&v23[11] = v19;
  v23[12] = v22;
  v23[13] = v7;
  *(double *)&v23[14] = v9;
  v23[15] = v11;
  [v21 enumerateObjectsUsingBlock:v23];
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
}

void __46__SUUIReviewCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v24 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) textPropertiesForView:v24];
  id v6 = [*(id *)(a1 + 32) responseView];

  if (v6 == v24
    || ([*(id *)(a1 + 32) descriptionView],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v24))
  {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + 10.0;
  }
  double v8 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (a3)
  {
    [v5 desiredOffsetTop];
    *(float *)&double v9 = v9 - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v8 = v8 + fmax(roundf(*(float *)&v9), 0.0);
  }
  objc_msgSend(v24, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
  CGFloat v12 = v11;
  if (v10 >= *(double *)(a1 + 56)) {
    double v13 = *(double *)(a1 + 56);
  }
  else {
    double v13 = v10;
  }
  if (*(unsigned char *)(a1 + 128))
  {
    double v14 = *(double *)(a1 + 72);
  }
  else
  {
    double Width = CGRectGetWidth(*(CGRect *)(a1 + 96));
    v26.origin.CGFloat x = 0.0;
    v26.origin.CGFloat y = v8;
    v26.size.width = v13;
    v26.size.CGFloat height = v12;
    double v14 = Width - CGRectGetWidth(v26) - *(double *)(a1 + 72);
  }
  double v16 = v8;
  double v17 = v13;
  CGFloat v18 = v12;
  CGRect v27 = CGRectIntegral(*(CGRect *)&v14);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat v21 = v27.size.width;
  CGFloat height = v27.size.height;
  objc_msgSend(v24, "setFrame:");
  [v5 baselineOffsetFromBottom];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v23;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.width = v21;
  v28.size.CGFloat height = height;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v28);
}

- (void)contentViewTapped:(id)a3
{
  id v28 = a3;
  uint64_t v4 = [(SUUIReviewCollectionViewCell *)self descriptionView];
  uint64_t v5 = [v4 superview];
  [v28 locationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  uint64_t v10 = [(SUUIReviewCollectionViewCell *)self descriptionTapAction];
  if (v10)
  {
    double v11 = (void *)v10;
    CGFloat v12 = [(SUUIReviewCollectionViewCell *)self descriptionView];
    [v12 frame];
    v30.CGFloat x = v7;
    v30.CGFloat y = v9;
    BOOL v13 = CGRectContainsPoint(v32, v30);

    if (v13)
    {
      double v14 = [(SUUIReviewCollectionViewCell *)self descriptionTapAction];
      v14[2]();
    }
  }
  double v15 = [(SUUIReviewCollectionViewCell *)self responseView];
  double v16 = [v15 descriptionView];
  double v17 = [v16 superview];
  [v28 locationInView:v17];
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  uint64_t v22 = [(SUUIReviewCollectionViewCell *)self responseDescriptionTapAction];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    id v24 = [(SUUIReviewCollectionViewCell *)self responseView];
    v25 = [v24 descriptionView];
    [v25 frame];
    v31.CGFloat x = v19;
    v31.CGFloat y = v21;
    BOOL v26 = CGRectContainsPoint(v33, v31);

    if (v26)
    {
      CGRect v27 = [(SUUIReviewCollectionViewCell *)self responseDescriptionTapAction];
      v27[2]();
    }
  }
}

+ (id)_attributedStringForTitleLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGFloat v7 = [v5 style];
  double v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = SUUIFontPreferredFontForTextStyle(1);
  }
  CGFloat v9 = [v6 tintColor];
  uint64_t v10 = SUUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x263F825C8] blackColor];
  }
  double v11 = [v5 text];
  CGFloat v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v12;
}

+ (id)_attributedStringForDateLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGFloat v7 = [v5 style];
  double v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = SUUIFontPreferredFontForTextStyle(21);
  }
  CGFloat v9 = [v6 tintColor];
  uint64_t v10 = SUUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
  }
  double v11 = [v5 text];
  CGFloat v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v12;
}

- (void)_resetTapGestures
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v3 = [(SUUIReviewCollectionViewCell *)self contentView];
  [v3 setUserInteractionEnabled:1];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(SUUIReviewCollectionViewCell *)self contentView];
  id v5 = [v4 gestureRecognizers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        double v11 = [(SUUIReviewCollectionViewCell *)self contentView];
        [v11 removeGestureRecognizer:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  CGFloat v12 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_contentViewTapped_];
  BOOL v13 = [(SUUIReviewCollectionViewCell *)self contentView];
  [v13 addGestureRecognizer:v12];
}

- (id)descriptionTapAction
{
  return self->_descriptionTapAction;
}

- (void)setDescriptionTapAction:(id)a3
{
}

- (id)responseDescriptionTapAction
{
  return self->_responseDescriptionTapAction;
}

- (void)setResponseDescriptionTapAction:(id)a3
{
}

- (SUUITextBoxView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (SUUIResponseView)responseView
{
  return self->_responseView;
}

- (void)setResponseView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseView, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong(&self->_responseDescriptionTapAction, 0);
  objc_storeStrong(&self->_descriptionTapAction, 0);
}

@end