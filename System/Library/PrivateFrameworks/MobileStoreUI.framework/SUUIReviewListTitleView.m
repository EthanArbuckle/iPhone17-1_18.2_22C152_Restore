@interface SUUIReviewListTitleView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForDateLabel:(id)a3 context:(id)a4;
+ (id)_attributedStringForTitleLabel:(id)a3 context:(id)a4;
+ (id)_dateLabelForViewElement:(id)a3;
+ (id)_textLabelForViewElement:(id)a3;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIAttributedStringView)dateView;
- (SUUIAttributedStringView)titleView;
- (SUUIReviewListTitleView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDateView:(id)a3;
- (void)setTitleView:(id)a3;
@end

@implementation SUUIReviewListTitleView

- (SUUIReviewListTitleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIReviewListTitleView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SUUIReviewListTitleView *)v3 setContentMode:3];
  }
  return v4;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
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
  id v16 = a3;
  id v8 = a5;
  v9 = [a1 _dateLabelForViewElement:v16];
  if (v9)
  {
    v10 = [a1 _attributedStringForDateLabel:v9 context:v8];
    v11 = [v8 labelLayoutCache];
    [v11 requestLayoutForLabel:v9 attributedString:v10 width:(uint64_t)a4];

    if ([v10 length])
    {
      objc_msgSend(v10, "boundingRectWithSize:options:context:", 1, 0, a4, 1.79769313e308);
      a4 = a4 - v12;
    }
  }
  v13 = [a1 _textLabelForViewElement:v16];
  if (v13)
  {
    v14 = [a1 _attributedStringForTitleLabel:v13 context:v8];
    v15 = [v8 labelLayoutCache];
    [v15 requestLayoutForLabel:v13 attributedString:v14 width:(uint64_t)a4];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = [a4 firstChildForElementType:138];
  double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  [v7 sizeForViewElement:v8 width:a3];
  double v11 = v9 + v10;
  double v12 = [v7 textPropertiesForViewElement:v8 width:a3];

  [v12 baselineOffsetFromBottom];
  double v13 = a3;
  double v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SUUIReviewListTitleView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_265400C88;
  double v15 = a4;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(SUUIViewReuseView *)self modifyUsingBlock:v12];
}

void __63__SUUIReviewListTitleView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  double v3 = *(double *)(a1 + 56);
  double v4 = [(id)objc_opt_class() _dateLabelForViewElement:*(void *)(a1 + 40)];
  if (v4)
  {
    double v5 = [v15 addLabelViewWithElement:v4 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
    [*(id *)(a1 + 32) setDateView:v5];

    objc_super v6 = [*(id *)(a1 + 48) textPropertiesForViewElement:v4 width:*(double *)(a1 + 56)];
    id v7 = [*(id *)(a1 + 32) dateView];
    [v15 setTextProperties:v6 forView:v7];

    id v8 = [*(id *)(a1 + 32) dateView];
    objc_msgSend(v8, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
    double v10 = v9;

    double v3 = v3 - v10;
  }
  else
  {
    [*(id *)(a1 + 32) setDateView:0];
  }
  id v11 = [(id)objc_opt_class() _textLabelForViewElement:*(void *)(a1 + 40)];
  if (v11)
  {
    double v12 = [v15 addLabelViewWithElement:v11 width:*(void *)(a1 + 48) context:v3];
    [*(id *)(a1 + 32) setTitleView:v12];

    id v13 = [*(id *)(a1 + 48) textPropertiesForViewElement:v11 width:v3];
    id v14 = [*(id *)(a1 + 32) titleView];
    [v15 setTextProperties:v13 forView:v14];
  }
  else
  {
    [*(id *)(a1 + 32) setTitleView:0];
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
    [(SUUIReviewListTitleView *)self setNeedsDisplay];
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
  v47.receiver = self;
  v47.super_class = (Class)SUUIReviewListTitleView;
  [(SUUIReviewListTitleView *)&v47 layoutSubviews];
  [(SUUIReviewListTitleView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat rect = v9;
  [(SUUIReviewListTitleView *)self contentInset];
  double v11 = v10;
  double v45 = v12;
  double v14 = v13;
  id v15 = [(SUUIReviewListTitleView *)self titleView];
  id v16 = [(SUUIReviewListTitleView *)self dateView];
  v17 = [v16 layout];
  [v17 boundingSize];
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v22 = [v15 layout];
  [v22 baselineOffset];
  double v24 = v23;
  v25 = [v16 layout];
  [v25 baselineOffset];
  double v27 = v24 - v26;

  double v46 = v11;
  double v28 = v11 + v27;
  double v29 = v14;
  double v30 = round(v28);
  v48.origin.x = v4;
  v48.origin.y = v6;
  v48.size.width = v8;
  v48.size.height = rect;
  double Width = CGRectGetWidth(v48);
  v49.origin.x = 0.0;
  v49.origin.y = v30;
  v49.size.width = v19;
  v49.size.height = v21;
  double v32 = Width - CGRectGetWidth(v49) - v29;
  v50.origin.x = v32;
  v50.origin.y = v30;
  v50.size.width = v19;
  v50.size.height = v21;
  CGRect v51 = CGRectIntegral(v50);
  objc_msgSend(v16, "setFrame:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
  v52.origin.x = v32;
  v52.origin.y = v30;
  v52.size.width = v19;
  v52.size.height = v21;
  if (CGRectGetWidth(v52) <= 2.22044605e-16)
  {
    double v33 = v45;
    double v34 = v8 - v45 - v29;
  }
  else
  {
    v53.origin.x = v32;
    v53.origin.y = v30;
    v53.size.width = v19;
    v53.size.height = v21;
    double v33 = v45;
    double v34 = CGRectGetMinX(v53) - v45 + -10.0;
  }
  v35 = [v15 layout];
  [v35 boundingSize];
  double v37 = v36;
  uint64_t v39 = v38;

  if (v37 >= v34) {
    double v40 = v34;
  }
  else {
    double v40 = v37;
  }
  double v41 = v33;
  double v42 = v46;
  uint64_t v43 = v39;
  CGRect v54 = CGRectIntegral(*(CGRect *)(&v40 - 2));
  objc_msgSend(v15, "setFrame:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(SUUIReviewListTitleView *)self contentInset];
  double v6 = v5;
  double v7 = [(SUUIReviewListTitleView *)self titleView];
  objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
  double v9 = v8;

  double v10 = v6 + v9;
  double v11 = width;
  result.height = v10;
  result.double width = v11;
  return result;
}

+ (id)_dateLabelForViewElement:(id)a3
{
  return (id)[a3 firstChildForElementName:@"subtitle"];
}

+ (id)_textLabelForViewElement:(id)a3
{
  return (id)[a3 firstChildForElementName:@"text"];
}

+ (id)_attributedStringForTitleLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  double v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = SUUIFontPreferredFontForTextStyle(1);
  }
  double v9 = [v6 tintColor];
  double v10 = SUUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    double v10 = [MEMORY[0x263F825C8] blackColor];
  }
  double v11 = [v5 text];
  double v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v12;
}

+ (id)_attributedStringForDateLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  double v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = SUUIFontPreferredFontForTextStyle(21);
  }
  double v9 = [v6 tintColor];
  double v10 = SUUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    double v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
  }
  double v11 = [v5 text];
  double v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v12;
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

- (SUUIAttributedStringView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (SUUIAttributedStringView)dateView
{
  return self->_dateView;
}

- (void)setDateView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end