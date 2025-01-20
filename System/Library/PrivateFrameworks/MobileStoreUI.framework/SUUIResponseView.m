@interface SUUIResponseView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForSubtitleLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMapTable)allViewTextProperties;
- (SUUIAttributedStringView)subtitleView;
- (SUUIResponseView)initWithFrame:(CGRect)a3;
- (SUUITextBoxView)descriptionView;
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

@implementation SUUIResponseView

- (SUUIResponseView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIResponseView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F827E8];
    v5 = SUUIBundle();
    v6 = [v4 imageNamed:@"Reply" inBundle:v5];

    uint64_t v7 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v6];
    replyImageView = v3->_replyImageView;
    v3->_replyImageView = (UIImageView *)v7;

    [(SUUIResponseView *)v3 addSubview:v3->_replyImageView];
  }
  return v3;
}

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
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__SUUIResponseView_requestLayoutForViewElement_width_context___block_invoke;
  v10[3] = &unk_265402370;
  double v12 = a4;
  id v11 = v8;
  id v13 = a1;
  id v9 = v8;
  [a3 enumerateChildrenUsingBlock:v10];
}

void __62__SUUIResponseView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 elementType];
  if (v3 != 138)
  {
    BOOL v4 = v3 == 105;
    v5 = v10;
    if (!v4) {
      goto LABEL_11;
    }
    +[SUUIReviewListTitleView requestLayoutForViewElement:v10 width:*(void *)(a1 + 32) context:*(double *)(a1 + 40)];
LABEL_10:
    v5 = v10;
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
  v5 = v10;
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
  v14[2] = __58__SUUIResponseView_sizeThatFitsWidth_viewElement_context___block_invoke;
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

void __58__SUUIResponseView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 elementType] == 105)
  {
    +[SUUIReviewListTitleView sizeThatFitsWidth:v9 viewElement:*(void *)(a1 + 32) context:*(double *)(a1 + 64)];
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
    v5 = [*(id *)(a1 + 32) textPropertiesForViewElement:v9 width:*(double *)(a1 + 64) + -17.5];
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
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__SUUIResponseView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_265400C88;
  v12[4] = self;
  id v13 = v8;
  double v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(SUUIViewReuseView *)self modifyUsingBlock:v12];
}

void __56__SUUIResponseView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 allViewTextProperties];
  [*(id *)(a1 + 32) setAllViewTextProperties:v4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__SUUIResponseView_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_2654023C0;
  id v10 = v3;
  uint64_t v13 = *(void *)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v3;
  [v5 enumerateChildrenUsingBlock:v9];
}

uint64_t __56__SUUIResponseView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = [*(id *)(a1 + 40) textPropertiesForViewElement:v7 width:*(double *)(a1 + 56) + -17.5];
    [*(id *)(a1 + 32) setTextProperties:v5 forView:v4];
  }
LABEL_10:
  return MEMORY[0x270F9A790](v3);
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
  [(SUUIResponseView *)self contentInset];
  uint64_t v6 = v5;
  double v9 = width - (v7 + 17.5) - v8;
  id v10 = [(SUUIViewReuseView *)self allExistingViews];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  uint64_t v15 = 0;
  v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = v6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __33__SUUIResponseView_sizeThatFits___block_invoke;
  v14[3] = &unk_2654023E8;
  void v14[4] = self;
  v14[5] = &v15;
  v14[6] = v19;
  *(double *)&v14[7] = v9;
  [v10 enumerateObjectsUsingBlock:v14];
  double v11 = v16[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  double v12 = width;
  double v13 = v11;
  result.height = v13;
  result.double width = v12;
  return result;
}

void __33__SUUIResponseView_sizeThatFits___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  v29.super_class = (Class)SUUIResponseView;
  [(SUUIResponseView *)&v29 layoutSubviews];
  char v3 = storeShouldReverseLayoutDirection() ^ 1;
  [(SUUIResponseView *)self bounds];
  uint64_t v24 = v4;
  uint64_t v6 = v5;
  double v8 = v7;
  uint64_t v10 = v9;
  [(SUUIResponseView *)self contentInset];
  double v12 = v11;
  uint64_t v14 = v13;
  double v16 = v15;
  double v18 = v17 + 17.5;
  double v19 = v8 - (v17 + 17.5) - v15;
  id v20 = [(SUUIViewReuseView *)self allExistingViews];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  *(double *)&v27[3] = v12;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __34__SUUIResponseView_layoutSubviews__block_invoke;
  v25[3] = &unk_265402410;
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
  v21 = [(SUUIResponseView *)self replyImageView];
  objc_msgSend(v21, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  objc_msgSend(v21, "setFrame:", 0.0, v12, v22, v23);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
}

void __34__SUUIResponseView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  double v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = SUUIFontPreferredFontForTextStyle(21);
  }
  id v9 = [v6 tintColor];
  double v10 = SUUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    double v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
  }
  double v11 = [v5 text];
  double v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v12;
}

- (SUUITextBoxView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (SUUIAttributedStringView)subtitleView
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

@end