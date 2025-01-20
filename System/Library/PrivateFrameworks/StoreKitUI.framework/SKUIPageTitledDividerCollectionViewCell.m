@interface SKUIPageTitledDividerCollectionViewCell
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
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (NSString)dividerTitle;
- (SKUIPageTitledDividerCollectionViewCell)initWithFrame:(CGRect)a3;
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

@implementation SKUIPageTitledDividerCollectionViewCell

- (SKUIPageTitledDividerCollectionViewCell)initWithFrame:(CGRect)a3
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
        -[SKUIPageTitledDividerCollectionViewCell initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIPageTitledDividerCollectionViewCell;
  v16 = -[SKUIPageTitledDividerCollectionViewCell initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    id v18 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v19 = (void *)*((void *)v16 + 101);
    *((void *)v16 + 101) = v18;

    [*((id *)v16 + 101) setBackgroundColor:v17];
    v20 = [v16 contentView];
    [v20 addSubview:*((void *)v16 + 101)];

    id v21 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v22 = (void *)*((void *)v16 + 102);
    *((void *)v16 + 102) = v21;

    [*((id *)v16 + 102) setBackgroundColor:v17];
    v23 = [v16 contentView];
    [v23 addSubview:*((void *)v16 + 102)];

    *(_OWORD *)(v16 + 776) = xmmword_1C1CCB140;
    *(_OWORD *)(v16 + 792) = xmmword_1C1CCB140;
    *((void *)v16 + 80) = 0x3FF0000000000000;
  }
  return (SKUIPageTitledDividerCollectionViewCell *)v16;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIPageTitledDividerCollectionViewCell prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIPageTitledDividerCollectionViewCell preferredSizeForViewElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
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
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIPageTitledDividerCollectionViewCell requestLayoutForViewElement:width:context:]();
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 dividerTitle:(id)a4 context:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIPageTitledDividerCollectionViewCell sizeThatFitsWidth:dividerTitle:context:]();
  }
  BOOL v8 = [(id)objc_opt_class() _attributedStringForDividerTitle:v7 context:v6];

  [v8 size];
  double v10 = v9;
  double v12 = v11;
  [v6 displayScale];

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUIPageTitledDividerCollectionViewCell sizeThatFitsWidth:viewElement:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v19 = [v8 button];
  if (v19)
  {
    double v20 = [a1 _attributedStringForButtonViewElement:v19 context:v9];
    double v21 = [v19 buttonImage];
    if (v21)
    {
      [v9 sizeForImageElement:v21];
      double v23 = v22;
      [a1 _imageVerticalPaddingForViewElement:v8];
      double v18 = v23 + v24 + v25;
    }
  }
  else
  {
    double v21 = [v8 text];
    v26 = [v8 style];
    double v20 = [a1 _attributedStringForViewElementText:v21 style:v26 context:v9];
  }
  [a1 _titleVerticalPaddingForViewElement:v8];
  double v28 = v27;
  double v30 = v29;
  [v20 size];
  if (v31 + v28 + v30 >= v18) {
    double v32 = v31 + v28 + v30;
  }
  else {
    double v32 = v18;
  }
  [a1 _contentEdgeInsetsForViewElement:v8];
  double v35 = v33 + v34 + v32;
  [v9 displayScale];
  double v37 = 1.0 / v36;
  if ([v8 dividerType] == 2)
  {
    +[SKUIPageTitledDividerCollectionViewCell viewElementInsetDividerHeight:v8];
    double v35 = v35 + v38 + v37 * 2.0;
  }
  if (v35 < v37) {
    double v35 = v37;
  }

  double v39 = a3;
  double v40 = v35;
  result.double height = v40;
  result.double width = v39;
  return result;
}

+ (double)viewElementInsetDividerHeight:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIPageTitledDividerCollectionViewCell viewElementInsetDividerHeight:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [v3 style];
  uint64_t v13 = [v12 itemHeight];

  if (v13)
  {
    [v13 floatValue];
    double v15 = v14;
  }
  else
  {
    double v15 = 7.0;
  }

  return v15;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dividerButtonImageRequestIdentifier = self->_dividerButtonImageRequestIdentifier;
  self->_dividerButtonImageRequestIdentifier = 0;

  uint64_t v10 = [v7 style];
  uint64_t v11 = [v10 ikBorderColor];
  uint64_t v12 = [v8 tintColor];
  uint64_t v13 = SKUIViewElementPlainColorWithIKColor(v11, v12);

  leftLine = self->_leftLine;
  if (v13)
  {
    [(UIView *)self->_leftLine setBackgroundColor:v13];
    [(UIView *)self->_rightLine setBackgroundColor:v13];
  }
  else
  {
    double v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)leftLine setBackgroundColor:v15];

    rightLine = self->_rightLine;
    uint64_t v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
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
      double v33 = self->_dividerLabel;
      self->_dividerLabel = 0;
    }
    if (!self->_dividerButton)
    {
      double v34 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
      dividerButton = self->_dividerButton;
      self->_dividerButton = v34;

      [(UIButton *)self->_dividerButton addTarget:self action:sel__buttonAction_ forControlEvents:64];
      double v36 = self->_dividerButton;
      double v37 = [(SKUIPageTitledDividerCollectionViewCell *)self backgroundColor];
      [(UIButton *)v36 setBackgroundColor:v37];

      LODWORD(v38) = -1102263091;
      [(UIButton *)self->_dividerButton setCharge:v38];
      [(UIButton *)self->_dividerButton setContentHorizontalAlignment:1];
      double v39 = [(SKUIPageTitledDividerCollectionViewCell *)self contentView];
      [v39 addSubview:self->_dividerButton];
    }
    double v40 = [(SKUIButtonViewElement *)self->_buttonViewElement buttonTitleStyle];
    v41 = v40;
    if (v40)
    {
      id v42 = v40;
    }
    else
    {
      id v42 = [(SKUIButtonViewElement *)self->_buttonViewElement style];
    }
    v93 = v42;

    v58 = [(id)objc_opt_class() _attributedStringForButtonViewElement:self->_buttonViewElement context:v8];
    v90 = v13;
    if ([v58 length])
    {
      v59 = [v58 attribute:*MEMORY[0x1E4FB0700] atIndex:0 effectiveRange:0];
    }
    else
    {
      v59 = 0;
    }
    v60 = [(SKUIButtonViewElement *)self->_buttonViewElement buttonImage];
    v100[0] = 0;
    id v92 = v8;
    v61 = [(SKUIPageTitledDividerCollectionViewCell *)self _imageForImageViewElement:v60 returningRequestIdentifier:v100 context:v8];
    id v62 = v100[0];
    id v89 = v100[0];

    objc_storeStrong((id *)&self->_dividerButtonImageRequestIdentifier, v62);
    v63 = [(SKUIButtonViewElement *)self->_buttonViewElement buttonImage];
    v64 = [v63 style];

    v65 = [v64 ikColor];
    v66 = SKUIViewElementPlainColorWithIKColor(v65, 0);
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
    v69 = (void *)MEMORY[0x1E4FB1EB0];
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __79__SKUIPageTitledDividerCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
    v96[3] = &unk_1E6423618;
    v96[4] = self;
    id v97 = v58;
    id v98 = v59;
    id v99 = v68;
    id v70 = v68;
    id v71 = v59;
    id v72 = v58;
    [v69 performWithoutAnimation:v96];
    unsigned __int8 v95 = 0;
    double v73 = SKUIViewElementPaddingForStyle(v93, (char *)&v95);
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
      CGFloat v78 = *MEMORY[0x1E4FB2848];
      CGFloat v79 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      CGFloat v80 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v81 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    char v94 = 0;
    double v82 = SKUIViewElementPaddingForStyle(v64, &v94);
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

    uint64_t v10 = v91;
    id v8 = v92;
    uint64_t v13 = v90;
    if (v86)
    {
      *(_OWORD *)&self->_internalHorizontalMargins.top = xmmword_1C1CCB140;
      *(_OWORD *)&self->_internalHorizontalMargins.bottom = xmmword_1C1CCB140;
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
      v53 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v54 = self->_dividerLabel;
      self->_dividerLabel = v53;

      v55 = self->_dividerLabel;
      v56 = [(SKUIPageTitledDividerCollectionViewCell *)self backgroundColor];
      [(UILabel *)v55 setBackgroundColor:v56];

      v57 = [(SKUIPageTitledDividerCollectionViewCell *)self contentView];
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
  [(SKUIPageTitledDividerCollectionViewCell *)self setNeedsLayout];
}

uint64_t __79__SKUIPageTitledDividerCollectionViewCell_reloadWithViewElement_width_context___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 720) setAttributedTitle:a1[5] forState:0];
  v2 = [*(id *)(a1[4] + 720) titleLabel];
  [v2 _setTextColorFollowsTintColor:a1[6] == 0];

  id v3 = *(void **)(a1[4] + 720);
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
    [(SKUIPageTitledDividerCollectionViewCell *)self setNeedsLayout];
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
    [(SKUIPageTitledDividerCollectionViewCell *)self setNeedsLayout];
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
    id v7 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)dividerLabel setTextColor:v7];

    dividerButton = self->_dividerButton;
    id v9 = [(SKUIPageTitledDividerCollectionViewCell *)self tintColor];
    [(UIButton *)dividerButton setTitleColor:v9 forState:0];

    leftLine = self->_leftLine;
    uint64_t v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)leftLine setBackgroundColor:v11];

    BOOL v12 = self->_rightLine;
    uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    rightLine = v12;
    id v13 = (id)v5;
  }
  [(UIView *)rightLine setBackgroundColor:v5];
}

- (void)setDividerTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(SKUIPageTitledDividerCollectionViewCell *)self dividerTitle];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    dividerLabel = self->_dividerLabel;
    if (v15)
    {
      if (!dividerLabel)
      {
        uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        id v7 = self->_dividerLabel;
        self->_dividerLabel = v6;

        id v8 = self->_dividerLabel;
        id v9 = [(SKUIPageTitledDividerCollectionViewCell *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        id v10 = self->_dividerLabel;
        uint64_t v11 = SKUIFontPreferredFontForTextStyle(1);
        [(UILabel *)v10 setFont:v11];

        BOOL v12 = self->_dividerLabel;
        id v13 = [MEMORY[0x1E4FB1618] blackColor];
        [(UILabel *)v12 setTextColor:v13];

        float v14 = [(SKUIPageTitledDividerCollectionViewCell *)self contentView];
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
    [(SKUIPageTitledDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setTopEdgeInset:(double)a3
{
  if (vabdd_f64(self->_contentEdgeInsets.top, a3) > 0.00000011920929)
  {
    self->_contentEdgeInsets.top = a3;
    [(SKUIPageTitledDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 backgroundColor];
  [(SKUIPageTitledDividerCollectionViewCell *)self setBackgroundColor:v5];

  v6.receiver = self;
  v6.super_class = (Class)SKUIPageTitledDividerCollectionViewCell;
  [(SKUIPageTitledDividerCollectionViewCell *)&v6 applyLayoutAttributes:v4];
}

- (void)layoutSubviews
{
  v67.receiver = self;
  v67.super_class = (Class)SKUIPageTitledDividerCollectionViewCell;
  [(SKUIPageTitledDividerCollectionViewCell *)&v67 layoutSubviews];
  [(SKUIPageTitledDividerCollectionViewCell *)self bounds];
  double v66 = v3;
  double v4 = v3 + -40.0 - self->_internalHorizontalMargins.left;
  double right = self->_internalHorizontalMargins.right;
  objc_super v6 = [(SKUIPageTitledDividerCollectionViewCell *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;

  if (v8 <= 0.00000011920929)
  {
    id v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 scale];
    double v8 = v10;
  }
  double v11 = v4 - right;
  dividerButton = self->_dividerButton;
  if (dividerButton)
  {
    id v13 = [(UIButton *)dividerButton imageForState:0];

    [(UIButton *)self->_dividerButton layoutIfNeeded];
    float v14 = self->_dividerButton;
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
      double v41 = *MEMORY[0x1E4FB2848];
      double v42 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v44 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v43 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      -[UIButton setImageEdgeInsets:](v14, "setImageEdgeInsets:", *MEMORY[0x1E4FB2848], v42, v44, v43);
      -[UIButton setTitleEdgeInsets:](self->_dividerButton, "setTitleEdgeInsets:", v41, v42, v44, v43);
      double buttonContentHorizontalPadding = 0.0;
    }
    double v31 = v66;
    [(UIButton *)self->_dividerButton frame];
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    -[UIButton sizeThatFits:](self->_dividerButton, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v69.size.double width = v49;
    CGFloat v51 = v50;
    v69.origin.double x = v46;
    v69.origin.double y = v48;
    v69.size.double height = v51;
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
    v68.size.double width = v28;
    CGFloat v30 = v29;
    v68.origin.double x = v25;
    v68.origin.double y = v27;
    v68.size.double height = v30;
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
  v70.origin.double x = v33;
  v70.origin.double y = v35;
  v70.size.double width = v37;
  v70.size.double height = v39;
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
  v6.super_class = (Class)SKUIPageTitledDividerCollectionViewCell;
  [(SKUIPageTitledDividerCollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (void)_buttonAction:(id)a3
{
  buttonViewElement = self->_buttonViewElement;
  if (buttonViewElement) {
    [(SKUIButtonViewElement *)buttonViewElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
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

  id v9 = SKUIViewElementPlainColorWithStyle(v8, 0);
  double v10 = SKUIViewElementFontWithStyle(v8);
  if (!v10)
  {
    double v10 = SKUIFontPreferredFontForTextStyle(1);
  }
  double v11 = [v4 buttonText];
  BOOL v12 = [v4 style];
  id v13 = [v11 attributedStringWithDefaultFont:v10 foregroundColor:v9 style:v12];

  return v13;
}

+ (id)_attributedStringForDividerTitle:(id)a3 context:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F28B18];
    id v5 = a3;
    id v6 = [v4 alloc];
    v12[0] = *MEMORY[0x1E4FB0700];
    id v7 = [MEMORY[0x1E4FB1618] blackColor];
    v13[0] = v7;
    v12[1] = *MEMORY[0x1E4FB06F8];
    double v8 = SKUIFontPreferredFontForTextStyle(1);
    v13[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
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
    double v10 = SKUIViewElementFontWithStyle(v7);
    if (!v10)
    {
      double v10 = SKUIFontPreferredFontForTextStyle(1);
    }
    double v11 = [v8 tintColor];
    BOOL v12 = SKUIViewElementPlainColorWithStyle(v7, v11);
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x1E4FB1618] blackColor];
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
  id v4 = [v3 valueForStyle:*MEMORY[0x1E4F6EFD0]];
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
  double v4 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double v7 = [a3 button];
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 buttonImage];
    char v18 = 0;
    double v10 = [v9 style];
    double v11 = SKUIViewElementPaddingForStyle(v10, &v18);
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
    double v8 = SKUIViewElementPaddingForStyle(v6, &v19);
    double v10 = v9;
    goto LABEL_7;
  }
  double v6 = [v4 buttonTitleStyle];
  double v7 = v6;
  if (v6) {
    goto LABEL_5;
  }
  double v11 = [v5 style];
  double v8 = SKUIViewElementPaddingForStyle(v11, &v19);
  double v10 = v12;

LABEL_7:
  double v13 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (!v19)
  {
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v8 = *MEMORY[0x1E4FB2848];
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
    double v11 = SKUIImageWithResourceName(v9);
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

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForViewElement:width:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIPageTitledDividerCollectionViewCell requestLayoutForViewElement:width:context:]";
}

+ (void)sizeThatFitsWidth:dividerTitle:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIPageTitledDividerCollectionViewCell sizeThatFitsWidth:dividerTitle:context:]";
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)viewElementInsetDividerHeight:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end