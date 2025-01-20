@interface SUUIPageTitledDividerCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 dividerTitle:(id)a4 context:(id)a5;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (UIEdgeInsets)_contentEdgeInsetsForViewElement:(id)a3;
+ (UIEdgeInsets)_imageVerticalPaddingForViewElement:(id)a3;
+ (UIEdgeInsets)_titleVerticalPaddingForViewElement:(id)a3;
+ (double)viewElementInsetDividerHeight:(id)a3;
+ (id)_attributedStringForButtonViewElement:(id)a3 context:(id)a4;
+ (id)_attributedStringForDividerTitle:(id)a3 context:(id)a4;
+ (id)_attributedStringForViewElementText:(id)a3 style:(id)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (NSString)dividerTitle;
- (SUUIPageTitledDividerCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)topEdgeInset;
- (id)_imageForImageViewElement:(id)a3 returningRequestIdentifier:(id *)a4 context:(id)a5;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDividerTitle:(id)a3;
- (void)setTopEdgeInset:(double)a3;
@end

@implementation SUUIPageTitledDividerCollectionViewCell

- (SUUIPageTitledDividerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SUUIPageTitledDividerCollectionViewCell;
  v3 = -[SUUIPageTitledDividerCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
    v6 = (void *)*((void *)v3 + 101);
    *((void *)v3 + 101) = v5;

    [*((id *)v3 + 101) setBackgroundColor:v4];
    v7 = [v3 contentView];
    [v7 addSubview:*((void *)v3 + 101)];

    id v8 = objc_alloc_init(MEMORY[0x263F82E00]);
    v9 = (void *)*((void *)v3 + 102);
    *((void *)v3 + 102) = v8;

    [*((id *)v3 + 102) setBackgroundColor:v4];
    v10 = [v3 contentView];
    [v10 addSubview:*((void *)v3 + 102)];

    *(_OWORD *)(v3 + 776) = xmmword_2568A1280;
    *(_OWORD *)(v3 + 792) = xmmword_2568A1280;
    *((void *)v3 + 80) = 0x3FF0000000000000;
  }
  return (SUUIPageTitledDividerCollectionViewCell *)v3;
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

+ (CGSize)sizeThatFitsWidth:(double)a3 dividerTitle:(id)a4 context:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  double v8 = [(id)objc_opt_class() _attributedStringForDividerTitle:v7 context:v6];

  [v8 size];
  double v10 = v9;
  double v12 = v11;
  [v6 displayScale];

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v11 = [v8 button];
  if (v11)
  {
    double v12 = [a1 _attributedStringForButtonViewElement:v11 context:v9];
    double v13 = [v11 buttonImage];
    if (v13)
    {
      [v9 sizeForImageElement:v13];
      double v15 = v14;
      [a1 _imageVerticalPaddingForViewElement:v8];
      double v10 = v15 + v16 + v17;
    }
  }
  else
  {
    double v13 = [v8 text];
    v18 = [v8 style];
    double v12 = [a1 _attributedStringForViewElementText:v13 style:v18 context:v9];
  }
  [a1 _titleVerticalPaddingForViewElement:v8];
  double v20 = v19;
  double v22 = v21;
  [v12 size];
  if (v23 + v20 + v22 >= v10) {
    double v24 = v23 + v20 + v22;
  }
  else {
    double v24 = v10;
  }
  [a1 _contentEdgeInsetsForViewElement:v8];
  double v27 = v25 + v26 + v24;
  [v9 displayScale];
  double v29 = 1.0 / v28;
  if ([v8 dividerType] == 2)
  {
    +[SUUIPageTitledDividerCollectionViewCell viewElementInsetDividerHeight:v8];
    double v27 = v27 + v30 + v29 * 2.0;
  }
  if (v27 < v29) {
    double v27 = v29;
  }

  double v31 = a3;
  double v32 = v27;
  result.height = v32;
  result.width = v31;
  return result;
}

+ (double)viewElementInsetDividerHeight:(id)a3
{
  v3 = [a3 style];
  v4 = [v3 itemHeight];

  if (v4)
  {
    [v4 floatValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 7.0;
  }

  return v6;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dividerButtonImageRequestIdentifier = self->_dividerButtonImageRequestIdentifier;
  self->_dividerButtonImageRequestIdentifier = 0;

  double v10 = [v7 style];
  double v11 = [v10 ikBorderColor];
  double v12 = [v8 tintColor];
  double v13 = SUUIViewElementPlainColorWithIKColor(v11, v12);

  leftLine = self->_leftLine;
  if (v13)
  {
    [(UIView *)self->_leftLine setBackgroundColor:v13];
    [(UIView *)self->_rightLine setBackgroundColor:v13];
  }
  else
  {
    double v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)leftLine setBackgroundColor:v15];

    rightLine = self->_rightLine;
    double v17 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)rightLine setBackgroundColor:v17];
  }
  [(id)objc_opt_class() _contentEdgeInsetsForViewElement:v7];
  self->_contentEdgeInsets.top = v18;
  self->_contentEdgeInsets.left = v19;
  self->_contentEdgeInsets.bottom = v20;
  self->_contentEdgeInsets.right = v21;
  double v22 = [v7 button];
  buttonViewElement = self->_buttonViewElement;
  self->_buttonViewElement = v22;

  self->_buttonContentHorizontalPadding = 1.0;
  [(id)objc_opt_class() _titleVerticalPaddingForViewElement:v7];
  self->_titleVerticalPadding.top = v24;
  self->_titleVerticalPadding.left = v25;
  self->_titleVerticalPadding.bottom = v26;
  self->_titleVerticalPadding.right = v27;
  [(id)objc_opt_class() _imageVerticalPaddingForViewElement:v7];
  self->_imageVerticalPadding.top = v28;
  self->_imageVerticalPadding.left = v29;
  self->_imageVerticalPadding.bottom = v30;
  self->_imageVerticalPadding.right = v31;
  if (self->_buttonViewElement)
  {
    v91 = v10;
    dividerLabel = self->_dividerLabel;
    if (dividerLabel)
    {
      [(UILabel *)dividerLabel removeFromSuperview];
      v33 = self->_dividerLabel;
      self->_dividerLabel = 0;
    }
    if (!self->_dividerButton)
    {
      v34 = [MEMORY[0x263F824E8] buttonWithType:1];
      dividerButton = self->_dividerButton;
      self->_dividerButton = v34;

      [(UIButton *)self->_dividerButton addTarget:self action:sel__buttonAction_ forControlEvents:64];
      v36 = self->_dividerButton;
      v37 = [(SUUIPageTitledDividerCollectionViewCell *)self backgroundColor];
      [(UIButton *)v36 setBackgroundColor:v37];

      LODWORD(v38) = -1102263091;
      [(UIButton *)self->_dividerButton setCharge:v38];
      [(UIButton *)self->_dividerButton setContentHorizontalAlignment:1];
      v39 = [(SUUIPageTitledDividerCollectionViewCell *)self contentView];
      [v39 addSubview:self->_dividerButton];
    }
    v40 = [(SUUIButtonViewElement *)self->_buttonViewElement buttonTitleStyle];
    v41 = v40;
    if (v40)
    {
      id v42 = v40;
    }
    else
    {
      id v42 = [(SUUIButtonViewElement *)self->_buttonViewElement style];
    }
    v93 = v42;

    v58 = [(id)objc_opt_class() _attributedStringForButtonViewElement:self->_buttonViewElement context:v8];
    v90 = v13;
    if ([v58 length])
    {
      v59 = [v58 attribute:*MEMORY[0x263F81500] atIndex:0 effectiveRange:0];
    }
    else
    {
      v59 = 0;
    }
    v60 = [(SUUIButtonViewElement *)self->_buttonViewElement buttonImage];
    v100[0] = 0;
    id v92 = v8;
    v61 = [(SUUIPageTitledDividerCollectionViewCell *)self _imageForImageViewElement:v60 returningRequestIdentifier:v100 context:v8];
    id v62 = v100[0];
    id v89 = v100[0];

    objc_storeStrong((id *)&self->_dividerButtonImageRequestIdentifier, v62);
    v63 = [(SUUIButtonViewElement *)self->_buttonViewElement buttonImage];
    v64 = [v63 style];

    v65 = [v64 ikColor];
    v66 = SUUIViewElementPlainColorWithIKColor(v65, 0);
    v88 = v61;
    if (v66)
    {
      v67 = [v61 _flatImageWithColor:v66];
      v68 = [v67 imageWithRenderingMode:2];
    }
    else
    {
      v68 = [v61 imageWithRenderingMode:2];
    }
    v69 = (void *)MEMORY[0x263F82E00];
    v96[0] = MEMORY[0x263EF8330];
    v96[1] = 3221225472;
    v96[2] = __79__SUUIPageTitledDividerCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
    v96[3] = &unk_265401E78;
    v96[4] = self;
    id v97 = v58;
    id v98 = v59;
    id v99 = v68;
    id v70 = v68;
    id v71 = v59;
    id v72 = v58;
    [v69 performWithoutAnimation:v96];
    unsigned __int8 v95 = 0;
    double v73 = SUUIViewElementPaddingForStyle(v93, (char *)&v95);
    int v77 = v95;
    if (v95)
    {
      CGFloat v78 = v73;
      CGFloat v79 = v74;
      CGFloat v80 = v75;
      double v81 = v76;
    }
    else
    {
      CGFloat v78 = *MEMORY[0x263F834E8];
      CGFloat v79 = *(double *)(MEMORY[0x263F834E8] + 8);
      CGFloat v80 = *(double *)(MEMORY[0x263F834E8] + 16);
      double v81 = *(double *)(MEMORY[0x263F834E8] + 24);
    }
    char v94 = 0;
    double v82 = SUUIViewElementPaddingForStyle(v64, &v94);
    if (v94)
    {
      if (v95)
      {
        *(double *)((char *)&self->super.super.super.super.super.isa + v87) = v81 + v83;
        double v81 = v85;
      }
      else
      {
        CGFloat v78 = v82;
        CGFloat v79 = v83;
        double v81 = v85;
        CGFloat v80 = v84;
      }
    }
    else if (!v77)
    {
      char v86 = 1;
      goto LABEL_34;
    }
    char v86 = 0;
    self->_internalHorizontalMargins.top = v78;
    self->_internalHorizontalMargins.left = v79;
    self->_internalHorizontalMargins.bottom = v80;
    self->_internalHorizontalMargins.right = v81;
LABEL_34:

    double v10 = v91;
    id v8 = v92;
    double v13 = v90;
    if (v86)
    {
      *(_OWORD *)&self->_internalHorizontalMargins.top = xmmword_2568A1280;
      *(_OWORD *)&self->_internalHorizontalMargins.bottom = xmmword_2568A1280;
    }
    goto LABEL_38;
  }
  v43 = self->_dividerButton;
  if (v43)
  {
    [(UIButton *)v43 removeFromSuperview];
    v44 = self->_dividerButton;
    self->_dividerButton = 0;
  }
  v45 = objc_opt_class();
  v46 = [v7 text];
  v47 = [v45 _attributedStringForViewElementText:v46 style:v10 context:v8];

  [v10 elementPadding];
  self->_internalHorizontalMargins.top = v48;
  self->_internalHorizontalMargins.left = v49;
  self->_internalHorizontalMargins.bottom = v50;
  self->_internalHorizontalMargins.right = v51;
  v52 = self->_dividerLabel;
  if (v47)
  {
    if (!v52)
    {
      v53 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
      v54 = self->_dividerLabel;
      self->_dividerLabel = v53;

      v55 = self->_dividerLabel;
      v56 = [(SUUIPageTitledDividerCollectionViewCell *)self backgroundColor];
      [(UILabel *)v55 setBackgroundColor:v56];

      v57 = [(SUUIPageTitledDividerCollectionViewCell *)self contentView];
      [v57 addSubview:self->_dividerLabel];

      v52 = self->_dividerLabel;
    }
    [(UILabel *)v52 setHidden:0];
    [(UILabel *)self->_dividerLabel setAttributedText:v47];
  }
  else
  {
    [(UILabel *)v52 setHidden:1];
  }

LABEL_38:
  [(SUUIPageTitledDividerCollectionViewCell *)self setNeedsLayout];
}

uint64_t __79__SUUIPageTitledDividerCollectionViewCell_reloadWithViewElement_width_context___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 720) setAttributedTitle:a1[5] forState:0];
  v2 = [*(id *)(a1[4] + 720) titleLabel];
  [v2 _setTextColorFollowsTintColor:a1[6] == 0];

  v3 = *(void **)(a1[4] + 720);
  uint64_t v4 = a1[7];
  return [v3 setImage:v4 forState:0];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIPageTitledDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_dividerButtonImageRequestIdentifier
    && (uint64_t v11 = [v9 requestIdentifier],
        v11 == [(NSNumber *)self->_dividerButtonImageRequestIdentifier unsignedLongLongValue]))
  {
    [(SUUIPageTitledDividerCollectionViewCell *)self setNeedsLayout];
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (NSString)dividerTitle
{
  return [(UILabel *)self->_dividerLabel text];
}

- (void)setColoringWithColorScheme:(id)a3
{
  if (a3)
  {
    id v13 = [a3 primaryTextColor];
    [(UILabel *)self->_dividerLabel setTextColor:v13];
    [(UIButton *)self->_dividerButton setTitleColor:v13 forState:0];
    [(UIButton *)self->_dividerButton setTintColor:v13];
    [(UIView *)self->_leftLine setBackgroundColor:v13];
    rightLine = self->_rightLine;
    uint64_t v5 = (uint64_t)v13;
  }
  else
  {
    dividerLabel = self->_dividerLabel;
    id v7 = [MEMORY[0x263F825C8] blackColor];
    [(UILabel *)dividerLabel setTextColor:v7];

    dividerButton = self->_dividerButton;
    id v9 = [(SUUIPageTitledDividerCollectionViewCell *)self tintColor];
    [(UIButton *)dividerButton setTitleColor:v9 forState:0];

    leftLine = self->_leftLine;
    uint64_t v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)leftLine setBackgroundColor:v11];

    BOOL v12 = self->_rightLine;
    uint64_t v5 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    rightLine = v12;
    id v13 = (id)v5;
  }
  [(UIView *)rightLine setBackgroundColor:v5];
}

- (void)setDividerTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIPageTitledDividerCollectionViewCell *)self dividerTitle];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    dividerLabel = self->_dividerLabel;
    if (v15)
    {
      if (!dividerLabel)
      {
        double v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        id v7 = self->_dividerLabel;
        self->_dividerLabel = v6;

        id v8 = self->_dividerLabel;
        id v9 = [(SUUIPageTitledDividerCollectionViewCell *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        id v10 = self->_dividerLabel;
        uint64_t v11 = SUUIFontPreferredFontForTextStyle(1);
        [(UILabel *)v10 setFont:v11];

        BOOL v12 = self->_dividerLabel;
        id v13 = [MEMORY[0x263F825C8] blackColor];
        [(UILabel *)v12 setTextColor:v13];

        double v14 = [(SUUIPageTitledDividerCollectionViewCell *)self contentView];
        [v14 addSubview:self->_dividerLabel];

        dividerLabel = self->_dividerLabel;
      }
      [(UILabel *)dividerLabel setHidden:0];
      [(UILabel *)self->_dividerLabel setText:v15];
    }
    else
    {
      [(UILabel *)dividerLabel setHidden:1];
    }
    [(SUUIPageTitledDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setTopEdgeInset:(double)a3
{
  if (vabdd_f64(self->_contentEdgeInsets.top, a3) > 0.00000011920929)
  {
    self->_contentEdgeInsets.top = a3;
    [(SUUIPageTitledDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 backgroundColor];
  [(SUUIPageTitledDividerCollectionViewCell *)self setBackgroundColor:v5];

  v6.receiver = self;
  v6.super_class = (Class)SUUIPageTitledDividerCollectionViewCell;
  [(SUUIPageTitledDividerCollectionViewCell *)&v6 applyLayoutAttributes:v4];
}

- (void)layoutSubviews
{
  v67.receiver = self;
  v67.super_class = (Class)SUUIPageTitledDividerCollectionViewCell;
  [(SUUIPageTitledDividerCollectionViewCell *)&v67 layoutSubviews];
  [(SUUIPageTitledDividerCollectionViewCell *)self bounds];
  double v66 = v3;
  double v4 = v3 + -40.0 - self->_internalHorizontalMargins.left;
  double right = self->_internalHorizontalMargins.right;
  objc_super v6 = [(SUUIPageTitledDividerCollectionViewCell *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;

  if (v8 <= 0.00000011920929)
  {
    id v9 = [MEMORY[0x263F82B60] mainScreen];
    [v9 scale];
    double v8 = v10;
  }
  double v11 = v4 - right;
  dividerButton = self->_dividerButton;
  if (dividerButton)
  {
    id v13 = [(UIButton *)dividerButton imageForState:0];

    [(UIButton *)self->_dividerButton layoutIfNeeded];
    double v14 = self->_dividerButton;
    if (v13)
    {
      id v15 = [(UIButton *)v14 imageView];
      objc_msgSend(v15, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      double v17 = v16;

      CGFloat v18 = [(UIButton *)self->_dividerButton titleLabel];
      objc_msgSend(v18, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      double v20 = v19;

      CGFloat v21 = self->_titleVerticalPadding.top - self->_titleVerticalPadding.bottom;
      CGFloat v22 = self->_imageVerticalPadding.top - self->_imageVerticalPadding.bottom;
      double buttonContentHorizontalPadding = self->_buttonContentHorizontalPadding;
      -[UIButton setTitleEdgeInsets:](self->_dividerButton, "setTitleEdgeInsets:", v21, -v17, -v21, v17);
      -[UIButton setImageEdgeInsets:](self->_dividerButton, "setImageEdgeInsets:", v22, v20 + self->_buttonContentHorizontalPadding, -v22, -(v20 + self->_buttonContentHorizontalPadding));
    }
    else
    {
      double v41 = *MEMORY[0x263F834E8];
      double v42 = *(double *)(MEMORY[0x263F834E8] + 8);
      double v44 = *(double *)(MEMORY[0x263F834E8] + 16);
      double v43 = *(double *)(MEMORY[0x263F834E8] + 24);
      -[UIButton setImageEdgeInsets:](v14, "setImageEdgeInsets:", *MEMORY[0x263F834E8], v42, v44, v43);
      -[UIButton setTitleEdgeInsets:](self->_dividerButton, "setTitleEdgeInsets:", v41, v42, v44, v43);
      double buttonContentHorizontalPadding = 0.0;
    }
    double v31 = v66;
    [(UIButton *)self->_dividerButton frame];
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    -[UIButton sizeThatFits:](self->_dividerButton, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v69.size.width = v49;
    CGFloat v51 = v50;
    v69.origin.x = v46;
    v69.origin.y = v48;
    v69.size.height = v51;
    double v52 = buttonContentHorizontalPadding + CGRectGetWidth(v69);
    if (v52 >= v11) {
      double v53 = v11;
    }
    else {
      double v53 = v52;
    }
    CGFloat v54 = v46;
    CGFloat v55 = v48;
    CGFloat v56 = v51;
    CGRectGetWidth(*(CGRect *)(&v53 - 2));
    UICeilToViewScale();
    double v65 = v8;
    UIRectCenteredXInRectScale();
    double v33 = v57;
    double v35 = v58;
    CGFloat v37 = v59;
    CGFloat v39 = v60;
    dividerLabel = self->_dividerButton;
  }
  else
  {
    [(UILabel *)self->_dividerLabel frame];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    -[UILabel sizeThatFits:](self->_dividerLabel, "sizeThatFits:", v11, 1.79769313e308);
    v68.size.width = v28;
    CGFloat v30 = v29;
    v68.origin.x = v25;
    v68.origin.y = v27;
    v68.size.height = v30;
    CGRectGetWidth(v68);
    UICeilToViewScale();
    double v65 = v8;
    double v31 = v66;
    UIRectCenteredXInRectScale();
    double v33 = v32;
    double v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    dividerLabel = self->_dividerLabel;
  }
  [dividerLabel setFrame:*(void *)&v65];
  double v61 = 1.0 / v8;
  UIFloorToViewScale();
  double v63 = v35 + v62;
  v70.origin.x = v33;
  v70.origin.y = v35;
  v70.size.width = v37;
  v70.size.height = v39;
  CGFloat v64 = CGRectGetMaxX(v70) + self->_internalHorizontalMargins.right;
  -[UIView setFrame:](self->_leftLine, "setFrame:", self->_contentEdgeInsets.left + self->_contentInset.left, v63, v33 - self->_internalHorizontalMargins.left - self->_contentEdgeInsets.left - self->_contentInset.left, v61);
  -[UIView setFrame:](self->_rightLine, "setFrame:", v64, v63, v31 - v64 - self->_contentEdgeInsets.right - self->_contentInset.right, v61);
}

- (void)setBackgroundColor:(id)a3
{
  dividerLabel = self->_dividerLabel;
  id v5 = a3;
  [(UILabel *)dividerLabel setBackgroundColor:v5];
  [(UIButton *)self->_dividerButton setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIPageTitledDividerCollectionViewCell;
  [(SUUIPageTitledDividerCollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void)_buttonAction:(id)a3
{
  buttonViewElement = self->_buttonViewElement;
  if (buttonViewElement) {
    [(SUUIButtonViewElement *)buttonViewElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

+ (id)_attributedStringForButtonViewElement:(id)a3 context:(id)a4
{
  id v4 = a3;
  id v5 = [v4 buttonTitleStyle];
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 style];
  }
  double v8 = v7;

  id v9 = SUUIViewElementPlainColorWithStyle(v8, 0);
  double v10 = SUUIViewElementFontWithStyle(v8);
  if (!v10)
  {
    double v10 = SUUIFontPreferredFontForTextStyle(1);
  }
  double v11 = [v4 buttonText];
  BOOL v12 = [v4 style];
  id v13 = [v11 attributedStringWithDefaultFont:v10 foregroundColor:v9 style:v12];

  return v13;
}

+ (id)_attributedStringForDividerTitle:(id)a3 context:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x263F086A0];
    id v5 = a3;
    id v6 = [v4 alloc];
    v12[0] = *MEMORY[0x263F81500];
    id v7 = [MEMORY[0x263F825C8] blackColor];
    v13[0] = v7;
    v12[1] = *MEMORY[0x263F814F0];
    double v8 = SUUIFontPreferredFontForTextStyle(1);
    v13[1] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    double v10 = (void *)[v6 initWithString:v5 attributes:v9];
  }
  else
  {
    double v10 = 0;
  }
  return v10;
}

+ (id)_attributedStringForViewElementText:(id)a3 style:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3)
  {
    id v9 = a3;
    double v10 = SUUIViewElementFontWithStyle(v7);
    if (!v10)
    {
      double v10 = SUUIFontPreferredFontForTextStyle(1);
    }
    double v11 = [v8 tintColor];
    BOOL v12 = SUUIViewElementPlainColorWithStyle(v7, v11);
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x263F825C8] blackColor];
    }
    double v16 = v14;

    id v15 = [v9 attributedStringWithDefaultFont:v10 foregroundColor:v16 style:v7];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (UIEdgeInsets)_contentEdgeInsetsForViewElement:(id)a3
{
  double v3 = [a3 style];
  id v4 = [v3 valueForStyle:*MEMORY[0x263F4B388]];
  id v5 = v4;
  if (v4)
  {
    [v4 UIEdgeInsetsValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = 0.0;
    double v11 = 15.0;
    double v9 = 0.0;
    double v13 = 0.0;
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.double right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

+ (UIEdgeInsets)_imageVerticalPaddingForViewElement:(id)a3
{
  double v4 = *MEMORY[0x263F834E8];
  double v3 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
  double v7 = [a3 button];
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 buttonImage];
    char v18 = 0;
    double v10 = [v9 style];
    double v11 = SUUIViewElementPaddingForStyle(v10, &v18);
    double v13 = v12;

    if (v18)
    {
      double v6 = v13;
      double v4 = v11;
    }
  }
  double v14 = v4;
  double v15 = v3;
  double v16 = v6;
  double v17 = v5;
  result.double right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

+ (UIEdgeInsets)_titleVerticalPaddingForViewElement:(id)a3
{
  id v3 = a3;
  double v4 = [v3 button];
  double v5 = v4;
  char v19 = 0;
  if (!v4)
  {
    double v6 = [v3 style];
    double v7 = v6;
LABEL_5:
    double v8 = SUUIViewElementPaddingForStyle(v6, &v19);
    double v10 = v9;
    goto LABEL_7;
  }
  double v6 = [v4 buttonTitleStyle];
  double v7 = v6;
  if (v6) {
    goto LABEL_5;
  }
  double v11 = [v5 style];
  double v8 = SUUIViewElementPaddingForStyle(v11, &v19);
  double v10 = v12;

LABEL_7:
  double v13 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v14 = *(double *)(MEMORY[0x263F834E8] + 24);
  if (!v19)
  {
    double v10 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v8 = *MEMORY[0x263F834E8];
  }

  double v15 = v8;
  double v16 = v13;
  double v17 = v10;
  double v18 = v14;
  result.double right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (id)_imageForImageViewElement:(id)a3 returningRequestIdentifier:(id *)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = [v7 resourceName];
  double v10 = v9;
  if (v9)
  {
    double v11 = SUUIImageWithResourceName(v9);
    double v12 = 0;
  }
  else
  {
    double v12 = [v8 requestIdentifierForViewElement:v7];
    if (!v12
      || ([v8 resourceLoader],
          double v13 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "cachedResourceForRequestIdentifier:", objc_msgSend(v12, "unsignedIntegerValue")),
          double v11 = objc_claimAutoreleasedReturnValue(),
          v13,
          !v11))
    {
      [v8 loadImageForImageElement:v7 reason:1];
      double v11 = 0;
    }
  }
  if (a4) {
    *a4 = v12;
  }

  return v11;
}

- (double)topEdgeInset
{
  return self->_topEdgeInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightLine, 0);
  objc_storeStrong((id *)&self->_leftLine, 0);
  objc_storeStrong((id *)&self->_dividerLabel, 0);
  objc_storeStrong((id *)&self->_dividerButtonImageRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_dividerButton, 0);
  objc_storeStrong((id *)&self->_buttonViewElement, 0);
}

@end