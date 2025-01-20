@interface SKUIResponseView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForSubtitleLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMapTable)allViewTextProperties;
- (SKUIAttributedStringView)subtitleView;
- (SKUIResponseView)initWithFrame:(CGRect)a3;
- (SKUITextBoxView)descriptionView;
- (UIEdgeInsets)contentInset;
- (UIImageView)replyImageView;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setAllViewTextProperties:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDescriptionView:(id)a3;
- (void)setReplyImageView:(id)a3;
- (void)setSubtitleView:(id)a3;
@end

@implementation SKUIResponseView

- (SKUIResponseView)initWithFrame:(CGRect)a3
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
        -[SKUIResponseView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIResponseView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E4FB1818];
    v18 = SKUIBundle();
    v19 = [v17 imageNamed:@"Reply" inBundle:v18];

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v19];
    replyImageView = v16->_replyImageView;
    v16->_replyImageView = (UIImageView *)v20;

    [(SKUIResponseView *)v16 addSubview:v16->_replyImageView];
  }
  return v16;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIResponseView prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
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
        +[SKUIResponseView preferredSizeForViewElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUIResponseView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__SKUIResponseView_requestLayoutForViewElement_width_context___block_invoke;
  v19[3] = &unk_1E6429460;
  double v21 = a4;
  id v20 = v9;
  id v22 = a1;
  id v18 = v9;
  [v8 enumerateChildrenUsingBlock:v19];
}

void __62__SKUIResponseView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 elementType];
  if (v3 != 138)
  {
    BOOL v4 = v3 == 105;
    BOOL v5 = v10;
    if (!v4) {
      goto LABEL_11;
    }
    +[SKUIReviewListTitleView requestLayoutForViewElement:v10 width:*(void *)(a1 + 32) context:*(double *)(a1 + 40)];
LABEL_10:
    BOOL v5 = v10;
    goto LABEL_11;
  }
  uint64_t v6 = [v10 labelViewStyle];
  if (v6 == 4)
  {
    id v8 = [*(id *)(a1 + 48) _attributedStringForSubtitleLabel:v10 context:*(void *)(a1 + 32)];
    id v9 = [*(id *)(a1 + 32) labelLayoutCache];
    [v9 requestLayoutForLabel:v10 attributedString:v8 width:(uint64_t)(*(double *)(a1 + 40) + -17.5)];

    goto LABEL_10;
  }
  BOOL v4 = v6 == 1;
  BOOL v5 = v10;
  if (v4)
  {
    id v7 = [*(id *)(a1 + 32) editorialLayoutForLabelElement:v10 width:*(double *)(a1 + 40) + -17.5];
    [v7 enqueueLayoutRequests];

    goto LABEL_10;
  }
LABEL_11:
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
        +[SKUIResponseView sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
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
  v22[2] = __58__SKUIResponseView_sizeThatFitsWidth_viewElement_context___block_invoke;
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
  result.double height = v21;
  result.double width = v20;
  return result;
}

void __58__SKUIResponseView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 elementType] == 105)
  {
    +[SKUIReviewListTitleView sizeThatFitsWidth:v9 viewElement:*(void *)(a1 + 32) context:*(double *)(a1 + 64)];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v3
                                                                + 3.0
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40);
  }
  else
  {
    [*(id *)(a1 + 32) sizeForViewElement:v9 width:*(double *)(a1 + 64) + -17.5];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40);
    BOOL v5 = [*(id *)(a1 + 32) textPropertiesForViewElement:v9 width:*(double *)(a1 + 64) + -17.5];
    uint64_t v6 = v5;
    if (*(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 1)
    {
      [v5 desiredOffsetTop];
      *(float *)&double v7 = v7 - *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 40)
                                                                  + fmax(roundf(*(float *)&v7), 0.0);
    }
    [v6 baselineOffsetFromBottom];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__SKUIResponseView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E64234F8;
  v12[4] = self;
  id v13 = v8;
  double v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(SKUIViewReuseView *)self modifyUsingBlock:v12];
}

void __56__SKUIResponseView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 allViewTextProperties];
  [*(id *)(a1 + 32) setAllViewTextProperties:v4];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SKUIResponseView_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_1E64267A0;
  id v10 = v3;
  uint64_t v13 = *(void *)(a1 + 56);
  BOOL v5 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v3;
  [v5 enumerateChildrenUsingBlock:v9];
}

uint64_t __56__SKUIResponseView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 elementType];
  if (v3 == 138)
  {
    uint64_t v3 = [v7 labelViewStyle];
    if (v3 == 4)
    {
      double v4 = [*(id *)(a1 + 32) addLabelViewWithElement:v7 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56) + -17.5];
      uint64_t v3 = [*(id *)(a1 + 48) setSubtitleView:v4];
    }
    else
    {
      if (v3 != 1) {
        goto LABEL_10;
      }
      double v4 = [*(id *)(a1 + 32) addTextViewWithElement:v7 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56) + -17.5];
      uint64_t v3 = [*(id *)(a1 + 48) setDescriptionView:v4];
    }
  }
  else
  {
    if (v3 != 105) {
      goto LABEL_10;
    }
    uint64_t v3 = [*(id *)(a1 + 32) addReviewListTitleViewWithViewElement:v7 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
    double v4 = (void *)v3;
  }
  if (v4)
  {
    BOOL v5 = [*(id *)(a1 + 40) textPropertiesForViewElement:v7 width:*(double *)(a1 + 56) + -17.5];
    [*(id *)(a1 + 32) setTextProperties:v5 forView:v4];
  }
LABEL_10:

  return MEMORY[0x1F4181820](v3);
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

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(SKUIResponseView *)self contentInset];
  uint64_t v6 = v5;
  double v9 = width - (v7 + 17.5) - v8;
  id v10 = [(SKUIViewReuseView *)self allExistingViews];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  uint64_t v15 = 0;
  uint64_t v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__SKUIResponseView_sizeThatFits___block_invoke;
  v14[3] = &unk_1E642A558;
  v14[4] = self;
  v14[5] = &v15;
  v14[6] = v19;
  *(double *)&v14[7] = v9;
  [v10 enumerateObjectsUsingBlock:v14];
  double v11 = v16[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  double v12 = width;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

void __33__SKUIResponseView_sizeThatFits___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v20 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) allViewTextProperties];
  uint64_t v6 = [v5 objectForKey:v20];

  double v7 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (a3)
  {
    [v6 desiredOffsetTop];
    *(float *)&double v8 = v8 - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v7 = v7 + fmax(roundf(*(float *)&v8), 0.0);
  }
  objc_msgSend(v20, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
  uint64_t v11 = v10;
  if (v9 >= *(double *)(a1 + 56)) {
    double v12 = *(double *)(a1 + 56);
  }
  else {
    double v12 = v9;
  }
  uint64_t v13 = 0;
  double v14 = v7;
  CGRect v22 = CGRectIntegral(*(CGRect *)(&v11 - 3));
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  [v6 baselineOffsetFromBottom];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v23);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
  }
                                                                            + 24)
                                                                + 3.0;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)SKUIResponseView;
  [(SKUIResponseView *)&v29 layoutSubviews];
  char v3 = storeShouldReverseLayoutDirection() ^ 1;
  [(SKUIResponseView *)self bounds];
  uint64_t v24 = v4;
  uint64_t v6 = v5;
  double v8 = v7;
  uint64_t v10 = v9;
  [(SKUIResponseView *)self contentInset];
  double v12 = v11;
  uint64_t v14 = v13;
  double v16 = v15;
  double v18 = v17 + 17.5;
  double v19 = v8 - (v17 + 17.5) - v15;
  id v20 = [(SKUIViewReuseView *)self allExistingViews];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  *(double *)&v27[3] = v12;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __34__SKUIResponseView_layoutSubviews__block_invoke;
  v25[3] = &unk_1E6427250;
  v25[4] = self;
  v25[5] = v27;
  v25[6] = v28;
  char v26 = v3;
  *(double *)&v25[7] = v19;
  *(double *)&v25[8] = v12;
  *(double *)&v25[9] = v18;
  v25[10] = v14;
  *(double *)&v25[11] = v16;
  v25[12] = v24;
  v25[13] = v6;
  *(double *)&v25[14] = v8;
  v25[15] = v10;
  [v20 enumerateObjectsUsingBlock:v25];
  double v21 = [(SKUIResponseView *)self replyImageView];
  objc_msgSend(v21, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  objc_msgSend(v21, "setFrame:", 0.0, v12, v22, v23);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
}

void __34__SKUIResponseView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v29 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) allViewTextProperties];
  uint64_t v6 = [v5 objectForKey:v29];

  double v7 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (a3)
  {
    [v6 desiredOffsetTop];
    *(float *)&double v8 = v8 - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v7 = v7 + fmax(roundf(*(float *)&v8), 0.0);
  }
  id v9 = [*(id *)(a1 + 32) subtitleView];

  if (v9 == v29)
  {
    double v7 = v7 + -2.0;
    uint64_t v14 = [*(id *)(a1 + 32) subtitleView];
    double v15 = [v14 layout];
    [v15 boundingSize];
    double v11 = v16;
    double v18 = v17;

    double v13 = v18 + 2.0;
  }
  else
  {
    objc_msgSend(v29, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
    double v11 = v10;
    double v13 = v12;
  }
  if (v11 >= *(double *)(a1 + 56)) {
    double v11 = *(double *)(a1 + 56);
  }
  if (*(unsigned char *)(a1 + 128))
  {
    double v19 = *(double *)(a1 + 72);
  }
  else
  {
    double Width = CGRectGetWidth(*(CGRect *)(a1 + 96));
    v31.origin.CGFloat x = 0.0;
    v31.origin.CGFloat y = v7;
    v31.size.CGFloat width = v11;
    v31.size.CGFloat height = v13;
    double v19 = Width - CGRectGetWidth(v31) - *(double *)(a1 + 72);
  }
  double v21 = v7;
  double v22 = v11;
  double v23 = v13;
  CGRect v32 = CGRectIntegral(*(CGRect *)&v19);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat v26 = v32.size.width;
  CGFloat height = v32.size.height;
  objc_msgSend(v29, "setFrame:");
  [v6 baselineOffsetFromBottom];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v28;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = v26;
  v33.size.CGFloat height = height;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v33);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
  }
                                                                            + 24)
                                                                + 3.0;
}

+ (id)_attributedStringForSubtitleLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  double v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = SKUIFontPreferredFontForTextStyle(21);
  }
  id v9 = [v6 tintColor];
  double v10 = SKUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    double v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
  }
  double v11 = [v5 text];
  double v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v12;
}

- (SKUITextBoxView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (SKUIAttributedStringView)subtitleView
{
  return self->_subtitleView;
}

- (void)setSubtitleView:(id)a3
{
}

- (UIImageView)replyImageView
{
  return self->_replyImageView;
}

- (void)setReplyImageView:(id)a3
{
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (NSMapTable)allViewTextProperties
{
  return self->_allViewTextProperties;
}

- (void)setAllViewTextProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allViewTextProperties, 0);
  objc_storeStrong((id *)&self->_replyImageView, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);

  objc_storeStrong((id *)&self->_descriptionView, 0);
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