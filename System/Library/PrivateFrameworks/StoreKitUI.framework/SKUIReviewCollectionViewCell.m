@interface SKUIReviewCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForDateLabel:(id)a3 context:(id)a4;
+ (id)_attributedStringForTitleLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUIResponseView)responseView;
- (SKUITextBoxView)descriptionView;
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

@implementation SKUIReviewCollectionViewCell

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        +[SKUIReviewCollectionViewCell preferredSizeForViewElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUIReviewCollectionViewCell requestLayoutForViewElement:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__SKUIReviewCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v18[3] = &unk_1E6425F10;
  double v20 = a4;
  id v19 = v8;
  id v17 = v8;
  [v7 enumerateChildrenUsingBlock:v18];
}

void __74__SKUIReviewCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
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
      v4 = off_1E6420EE0;
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
    v4 = off_1E6420EC8;
    goto LABEL_11;
  }
  if (v3 != 135) {
    goto LABEL_12;
  }
  v4 = off_1E6420FD8;
LABEL_11:
  [(__objc2_class *)*v4 requestLayoutForViewElement:v6 width:*(void *)(a1 + 32) context:*(double *)(a1 + 40)];
LABEL_12:
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUIReviewCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v30 = 0;
  v31 = (double *)&v30;
  uint64_t v32 = 0x3010000000;
  v33 = &unk_1C1D0F257;
  long long v34 = *MEMORY[0x1E4F1DB30];
  *(double *)&long long v34 = a3;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__SKUIReviewCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v22[3] = &unk_1E6427228;
  double v27 = a3;
  id v17 = v8;
  id v23 = v17;
  v24 = &v30;
  v25 = v29;
  v26 = v28;
  [v7 enumerateChildrenUsingBlock:v22];
  double v18 = v31[4];
  double v19 = v31[5];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v30, 8);

  double v20 = v18;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

void __70__SKUIReviewCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if ([v12 elementType] == 105)
  {
    +[SKUIReviewListTitleView sizeThatFitsWidth:v12 viewElement:*(void *)(a1 + 32) context:*(double *)(a1 + 64)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    double v5 = v4 + *(double *)(v3 + 40);
LABEL_5:
    *(double *)(v3 + 40) = v5;
    goto LABEL_9;
  }
  if ([v12 elementType] == 102)
  {
    +[SKUIResponseView sizeThatFitsWidth:v12 viewElement:*(void *)(a1 + 32) context:*(double *)(a1 + 64)];
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
  BOOL v9 = v8;
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
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__SKUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E64234F8;
  double v16 = a4;
  id v13 = v8;
  id v14 = v9;
  uint64_t v15 = self;
  id v10 = v9;
  id v11 = v8;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v12];
}

void __68__SKUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __68__SKUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  id v11 = &unk_1E64267A0;
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

void __68__SKUIReviewCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
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
  v9.super_class = (Class)SKUIReviewCollectionViewCell;
  -[SKUICollectionViewCell setHighlighted:](&v9, sel_setHighlighted_);
  if (v3)
  {
    id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
    [(SKUIViewReuseCollectionViewCell *)self setBackgroundColor:v5];

    [MEMORY[0x1E4FB1618] colorWithWhite:0.9 alpha:1.0];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIViewReuseCollectionViewCell *)self setBackgroundColor:v6];

    [MEMORY[0x1E4FB1618] clearColor];
  id v7 = };
  uint64_t v8 = [(SKUIReviewCollectionViewCell *)self contentView];
  [v8 setBackgroundColor:v7];
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)SKUIReviewCollectionViewCell;
  [(SKUICollectionViewCell *)&v27 layoutSubviews];
  char v3 = storeShouldReverseLayoutDirection() ^ 1;
  uint64_t v4 = [(SKUIReviewCollectionViewCell *)self contentView];
  [v4 bounds];
  uint64_t v22 = v5;
  uint64_t v7 = v6;
  double v9 = v8;
  uint64_t v11 = v10;

  [(SKUIViewReuseCollectionViewCell *)self contentInset];
  uint64_t v13 = v12;
  double v15 = v14;
  uint64_t v17 = v16;
  double v19 = v18;
  double v20 = v9 - v14 - v18;
  double v21 = [(SKUIViewReuseCollectionViewCell *)self allExistingViews];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = v13;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__SKUIReviewCollectionViewCell_layoutSubviews__block_invoke;
  v23[3] = &unk_1E6427250;
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

void __46__SKUIReviewCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  uint64_t v4 = [(SKUIReviewCollectionViewCell *)self descriptionView];
  uint64_t v5 = [v4 superview];
  [v28 locationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  uint64_t v10 = [(SKUIReviewCollectionViewCell *)self descriptionTapAction];
  if (v10)
  {
    double v11 = (void *)v10;
    CGFloat v12 = [(SKUIReviewCollectionViewCell *)self descriptionView];
    [v12 frame];
    v30.CGFloat x = v7;
    v30.CGFloat y = v9;
    BOOL v13 = CGRectContainsPoint(v32, v30);

    if (v13)
    {
      double v14 = [(SKUIReviewCollectionViewCell *)self descriptionTapAction];
      v14[2]();
    }
  }
  double v15 = [(SKUIReviewCollectionViewCell *)self responseView];
  double v16 = [v15 descriptionView];
  double v17 = [v16 superview];
  [v28 locationInView:v17];
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  uint64_t v22 = [(SKUIReviewCollectionViewCell *)self responseDescriptionTapAction];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    id v24 = [(SKUIReviewCollectionViewCell *)self responseView];
    v25 = [v24 descriptionView];
    [v25 frame];
    v31.CGFloat x = v19;
    v31.CGFloat y = v21;
    BOOL v26 = CGRectContainsPoint(v33, v31);

    if (v26)
    {
      CGRect v27 = [(SKUIReviewCollectionViewCell *)self responseDescriptionTapAction];
      v27[2]();
    }
  }
}

+ (id)_attributedStringForTitleLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGFloat v7 = [v5 style];
  double v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = SKUIFontPreferredFontForTextStyle(1);
  }
  CGFloat v9 = [v6 tintColor];
  uint64_t v10 = SKUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4FB1618] blackColor];
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
  double v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = SKUIFontPreferredFontForTextStyle(21);
  }
  CGFloat v9 = [v6 tintColor];
  uint64_t v10 = SKUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
  }
  double v11 = [v5 text];
  CGFloat v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v12;
}

- (void)_resetTapGestures
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [(SKUIReviewCollectionViewCell *)self contentView];
  [v3 setUserInteractionEnabled:1];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(SKUIReviewCollectionViewCell *)self contentView];
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
        double v11 = [(SKUIReviewCollectionViewCell *)self contentView];
        [v11 removeGestureRecognizer:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  CGFloat v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_contentViewTapped_];
  BOOL v13 = [(SKUIReviewCollectionViewCell *)self contentView];
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

- (SKUITextBoxView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (SKUIResponseView)responseView
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