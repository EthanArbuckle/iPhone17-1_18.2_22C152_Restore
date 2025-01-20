@interface SKUIContentUnavailableView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringWithButton:(id)a3 context:(id)a4;
+ (id)_attributedStringWithMessageLabel:(id)a3 context:(id)a4;
+ (id)_attributedStringWithTitleLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (double)_baselineOffsetForView:(id)a3;
- (double)_firstBaselineOffsetForView:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUIContentUnavailableView

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIContentUnavailableView prefetchResourcesForViewElement:reason:context:]();
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__SKUIContentUnavailableView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v12[3] = &unk_1E64234D0;
  id v9 = v8;
  v14 = &v16;
  int64_t v15 = a4;
  id v13 = v9;
  [v7 enumerateChildrenUsingBlock:v12];
  char v10 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __77__SKUIContentUnavailableView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) prefetchResourcesForViewElement:a2 reason:*(void *)(a1 + 48)];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIContentUnavailableView preferredSizeForViewElement:context:]();
  }
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIContentUnavailableView requestLayoutForViewElement:width:context:]();
  }
  char v10 = [v9 labelLayoutCache];
  v11 = [v8 titleLabel];
  if (v11)
  {
    v12 = [a1 _attributedStringWithTitleLabel:v11 context:v9];
    [v10 requestLayoutForLabel:v11 attributedString:v12 width:(uint64_t)a4];
  }
  id v13 = [v8 messageLabel];

  if (v13)
  {
    v14 = [a1 _attributedStringWithMessageLabel:v13 context:v9];
    [v10 requestLayoutForLabel:v13 attributedString:v14 width:(uint64_t)a4];
  }
  int64_t v15 = [v8 button];
  if (v15)
  {
    uint64_t v16 = [a1 _attributedStringWithButton:v15 context:v9];
    [v10 requestLayoutForButton:v15 attributedString:v16 width:(uint64_t)a4];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIContentUnavailableView sizeThatFitsWidth:viewElement:context:]();
  }
  uint64_t v27 = 0;
  v28 = (double *)&v27;
  uint64_t v29 = 0x3010000000;
  v30 = &unk_1C1D0F257;
  double v31 = a3;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__SKUIContentUnavailableView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v18[3] = &unk_1E6424998;
  id v9 = v8;
  double v22 = a3;
  id v19 = v9;
  v20 = &v23;
  v21 = &v27;
  [v7 enumerateChildrenUsingBlock:v18];
  uint64_t v10 = v24[3];
  v11 = v28;
  BOOL v12 = v10 <= 1;
  uint64_t v13 = v10 - 1;
  if (v12)
  {
    double v14 = v28[5];
  }
  else
  {
    double v14 = v28[5] + (float)((float)v13 * 35.0);
    v28[5] = v14;
  }
  double v15 = v11[4];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  double v16 = v15;
  double v17 = v14;
  result.height = v17;
  result.width = v16;
  return result;
}

double __68__SKUIContentUnavailableView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) sizeForViewElement:a2 width:*(double *)(a1 + 56)];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = v4 + *(double *)(v3 + 40);
  *(double *)(v3 + 40) = result;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  button = self->_button;
  self->_button = 0;

  buttonElement = self->_buttonElement;
  self->_buttonElement = 0;

  imageElement = self->_imageElement;
  self->_imageElement = 0;

  imageView = self->_imageView;
  self->_imageView = 0;

  messageView = self->_messageView;
  self->_messageView = 0;

  titleView = self->_titleView;
  self->_titleView = 0;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__SKUIContentUnavailableView_reloadWithViewElement_width_context___block_invoke;
  v18[3] = &unk_1E64234F8;
  void v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  double v21 = a4;
  id v16 = v9;
  id v17 = v8;
  [(SKUIViewReuseView *)self modifyUsingBlock:v18];
}

void __66__SKUIContentUnavailableView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v25 = a2;
  uint64_t v3 = [*(id *)(a1 + 40) image];
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 480);
  *(void *)(v4 + 480) = v3;

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 480);
  if (v6)
  {
    uint64_t v7 = [v25 addImageViewWithElement:v6 context:*(void *)(a1 + 48)];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 472);
    *(void *)(v8 + 472) = v7;
  }
  uint64_t v10 = [*(id *)(a1 + 40) titleLabel];
  if (v10)
  {
    uint64_t v11 = [v25 addLabelViewWithElement:v10 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 496);
    *(void *)(v12 + 496) = v11;
  }
  double v14 = [*(id *)(a1 + 40) messageLabel];

  if (v14)
  {
    uint64_t v15 = [v25 addLabelViewWithElement:v14 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 488);
    *(void *)(v16 + 488) = v15;
  }
  uint64_t v18 = [*(id *)(a1 + 40) button];
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = *(void **)(v19 + 432);
  *(void *)(v19 + 432) = v18;

  uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 432);
  if (v21)
  {
    uint64_t v22 = [v25 addButtonWithElement:v21 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
    uint64_t v23 = *(void *)(a1 + 32);
    v24 = *(void **)(v23 + 424);
    *(void *)(v23 + 424) = v22;

    [*(id *)(*(void *)(a1 + 32) + 424) addTarget:*(void *)(a1 + 32) action:sel__buttonAction_ forControlEvents:64];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUIContentUnavailableView *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (self->_imageElement
    && (objc_msgSend(v10, "requestIdentifierForViewElement:"),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 unsignedIntegerValue],
        uint64_t v14 = [v9 requestIdentifier],
        v12,
        v13 == v14))
  {
    [(SKUIImageView *)self->_imageView setImage:v8];
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [(SKUIContentUnavailableView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  unint64_t v10 = v9;
  uint64_t v11 = [(SKUIViewReuseView *)self allExistingViews];
  if ([v11 count])
  {
    float v12 = v8 - self->_contentInset.left - self->_contentInset.right;
    uint64_t v26 = (char *)&v25 + 8;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __44__SKUIContentUnavailableView_layoutSubviews__block_invoke;
    v24[3] = &unk_1E64249C0;
    *(double *)&v24[6] = floorf(v12);
    v24[7] = v4;
    v24[8] = v6;
    *(double *)&v24[9] = v8;
    long long v25 = v10;
    v24[4] = self;
    v24[5] = (char *)&v25 + 8;
    [v11 enumerateObjectsUsingBlock:v24];
    uint64_t v13 = [v11 firstObject];
    uint64_t v14 = [v11 lastObject];
    [v13 frame];
    CGRectGetHeight(v31);
    [(SKUIContentUnavailableView *)self _baselineOffsetForView:v13];
    if (v14)
    {
      [v14 frame];
      CGRectGetHeight(v32);
      [(SKUIContentUnavailableView *)self _baselineOffsetForView:v14];
    }
    [v14 frame];
    CGRectGetMaxY(v33);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v19, "frame", (void)v20);
          objc_msgSend(v19, "setFrame:");
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v29 count:16];
      }
      while (v16);
    }

    _Block_object_dispose((char *)&v25 + 8, 8);
  }
}

void __44__SKUIContentUnavailableView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  [v15 frame];
  objc_msgSend(v15, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
  double v6 = v5;
  double v8 = v7;
  *(float *)&double v5 = (*(double *)(a1 + 72) - v5) * 0.5;
  double v9 = floorf(*(float *)&v5);
  double v10 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (a3)
  {
    [*(id *)(a1 + 32) _firstBaselineOffsetForView:v15];
    *(float *)&double v11 = v10 + 35.0 - v11;
    double v10 = floorf(*(float *)&v11);
  }
  objc_msgSend(v15, "setFrame:", v9, v10, v6, v8);
  [*(id *)(a1 + 32) _baselineOffsetForView:v15];
  if (v12 <= 0.00000011920929)
  {
    v17.origin.x = v9;
    v17.origin.y = v10;
    v17.size.width = v6;
    v17.size.height = v8;
    double MaxY = CGRectGetMaxY(v17);
  }
  else
  {
    float v13 = v10 + v12;
    double MaxY = floorf(v13);
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MaxY;
}

- (void)_buttonAction:(id)a3
{
  SKUICollectionViewCellForView(self);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = SKUICollectionViewForView(v9);
  double v5 = [v4 delegate];
  char v6 = objc_opt_respondsToSelector();
  buttonElement = self->_buttonElement;
  if (v6)
  {
    double v8 = [v4 indexPathForCell:v9];
    [v5 collectionView:v4 didConfirmButtonElement:buttonElement withClickInfo:0 forItemAtIndexPath:v8];
  }
  else
  {
    [(SKUIButtonViewElement *)buttonElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

+ (id)_attributedStringWithButton:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 buttonTitleStyle];
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 style];
  }
  double v10 = v9;

  double v11 = SKUIViewElementFontWithStyle(v10);
  if (!v11)
  {
    double v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
  }
  double v12 = [v6 tintColor];
  float v13 = SKUIViewElementPlainColorWithStyle(v10, v12);

  uint64_t v14 = SKUIViewElementAlignmentForStyle(v10);
  if (v14) {
    uint64_t v15 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v14);
  }
  else {
    uint64_t v15 = 1;
  }
  uint64_t v16 = [v5 buttonText];
  CGRect v17 = [v16 attributedStringWithDefaultFont:v11 foregroundColor:v13 textAlignment:v15 style:v10];

  return v17;
}

+ (id)_attributedStringWithMessageLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  double v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  }
  id v9 = [v6 tintColor];
  double v10 = SKUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    double v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  uint64_t v11 = SKUIViewElementAlignmentForStyle(v7);
  if (v11) {
    uint64_t v12 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v11);
  }
  else {
    uint64_t v12 = 1;
  }
  float v13 = [v5 text];
  uint64_t v14 = [v13 attributedStringWithDefaultFont:v8 foregroundColor:v10 textAlignment:v12 style:v7];

  return v14;
}

+ (id)_attributedStringWithTitleLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  double v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:27.0];
  }
  id v9 = [v6 tintColor];
  double v10 = SKUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    double v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  uint64_t v11 = SKUIViewElementAlignmentForStyle(v7);
  if (v11) {
    uint64_t v12 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v11);
  }
  else {
    uint64_t v12 = 1;
  }
  float v13 = [v5 text];
  uint64_t v14 = [v13 attributedStringWithDefaultFont:v8 foregroundColor:v10 textAlignment:v12 style:v7];

  return v14;
}

- (double)_baselineOffsetForView:(id)a3
{
  button = (SKUIAttributedStringView *)a3;
  id v5 = button;
  if (self->_messageView == button || self->_titleView == button) {
    goto LABEL_6;
  }
  double v6 = 0.0;
  if ((SKUIAttributedStringView *)self->_button == button)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      button = (SKUIAttributedStringView *)self->_button;
LABEL_6:
      [(SKUIAttributedStringView *)button baselineOffset];
      double v6 = v7;
    }
  }

  return v6;
}

- (double)_firstBaselineOffsetForView:(id)a3
{
  button = (SKUIAttributedStringView *)a3;
  id v5 = button;
  if (self->_messageView == button || self->_titleView == button) {
    goto LABEL_6;
  }
  double v6 = 0.0;
  if ((SKUIAttributedStringView *)self->_button == button)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      button = (SKUIAttributedStringView *)self->_button;
LABEL_6:
      [(SKUIAttributedStringView *)button firstBaselineOffset];
      double v6 = v7;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_imageElement, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_buttonElement, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

+ (void)prefetchResourcesForViewElement:reason:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIContentUnavailableView prefetchResourcesForViewElement:reason:context:]";
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIContentUnavailableView preferredSizeForViewElement:context:]";
}

+ (void)requestLayoutForViewElement:width:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIContentUnavailableView requestLayoutForViewElement:width:context:]";
}

+ (void)sizeThatFitsWidth:viewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIContentUnavailableView sizeThatFitsWidth:viewElement:context:]";
}

@end