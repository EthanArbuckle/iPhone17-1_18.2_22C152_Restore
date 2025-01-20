@interface SKUIPageDividerCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUIPageDividerCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)dividerHeight;
- (double)leftEdgeInset;
- (double)rightEdgeInset;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)dividerType;
- (int64_t)verticalAlignment;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setColoringWithStyle:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDividerHeight:(double)a3;
- (void)setDividerType:(int64_t)a3;
- (void)setInsetColor:(id)a3;
- (void)setLeftEdgeInset:(double)a3;
- (void)setRightEdgeInset:(double)a3;
- (void)setVerticalAlignment:(int64_t)a3;
@end

@implementation SKUIPageDividerCollectionViewCell

- (SKUIPageDividerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SKUIPageDividerCollectionViewCell;
  v3 = -[SKUIPageDividerCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topDividerLine = v3->_topDividerLine;
    v3->_topDividerLine = v4;

    v6 = v3->_topDividerLine;
    v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v6 setBackgroundColor:v7];

    v8 = [(SKUIPageDividerCollectionViewCell *)v3 contentView];
    [v8 addSubview:v3->_topDividerLine];
  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIPageDividerCollectionViewCell prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIPageDividerCollectionViewCell preferredSizeForViewElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
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
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v5) {
      +[SKUIPageDividerCollectionViewCell requestLayoutForViewElement:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && (BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)))
  {
    +[SKUIPageDividerCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
    if (v7) {
      goto LABEL_5;
    }
  }
  else if (v7)
  {
LABEL_5:
    double v17 = [v7 style];
    double v18 = SKUIViewElementPaddingForStyle(v17, 0);
    double v20 = v19;

    goto LABEL_8;
  }
  double v18 = *MEMORY[0x1E4FB2848];
  double v20 = *(double *)(MEMORY[0x1E4FB2848] + 16);
LABEL_8:
  [v8 displayScale];
  double v22 = 1.0 / v21;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v7;
    if ([v23 dividerType] == 2)
    {
      +[SKUIPageTitledDividerCollectionViewCell viewElementInsetDividerHeight:v23];
      double v22 = v24 + v22 * 2.0;
    }
  }
  double v25 = a3;
  double v26 = v20 + v18 + v22;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUIPageDividerCollectionViewCell *)self setNeedsLayout];
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

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPageDividerCollectionViewCell setColoringWithColorScheme:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v4 primaryTextColor];
  topDividerLine = self->_topDividerLine;
  if (v13)
  {
    [(UIView *)self->_topDividerLine setBackgroundColor:v13];
    bottomDividerLine = self->_bottomDividerLine;
    if (bottomDividerLine) {
      [(UIView *)bottomDividerLine setBackgroundColor:v13];
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)topDividerLine setBackgroundColor:v16];

    double v17 = self->_bottomDividerLine;
    if (v17)
    {
      double v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)v17 setBackgroundColor:v18];
    }
  }
}

- (void)setColoringWithStyle:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPageDividerCollectionViewCell setColoringWithStyle:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [v4 ikBorderColor];
  uint64_t v14 = [v13 color];

  topDividerLine = self->_topDividerLine;
  if (v14)
  {
    [(UIView *)self->_topDividerLine setBackgroundColor:v14];
    bottomDividerLine = self->_bottomDividerLine;
    if (bottomDividerLine) {
      [(UIView *)bottomDividerLine setBackgroundColor:v14];
    }
  }
  else
  {
    double v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)topDividerLine setBackgroundColor:v17];

    double v18 = self->_bottomDividerLine;
    if (v18)
    {
      double v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)v18 setBackgroundColor:v19];
    }
  }
}

- (void)setDividerType:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPageDividerCollectionViewCell setDividerType:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_dividerType != a3)
  {
    self->_dividerType = a3;
    int64_t v13 = [(SKUIPageDividerCollectionViewCell *)self dividerType];
    bottomDividerLine = self->_bottomDividerLine;
    if (v13 == 2)
    {
      if (!bottomDividerLine)
      {
        uint64_t v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        uint64_t v16 = self->_bottomDividerLine;
        self->_bottomDividerLine = v15;

        double v17 = self->_bottomDividerLine;
        double v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
        [(UIView *)v17 setBackgroundColor:v18];
      }
      double v19 = [(SKUIPageDividerCollectionViewCell *)self contentView];
      [v19 addSubview:self->_bottomDividerLine];

      if (!self->_insetView)
      {
        double v20 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        insetView = self->_insetView;
        self->_insetView = v20;

        double v22 = self->_insetView;
        if (self->_insetColor)
        {
          -[UIView setBackgroundColor:](self->_insetView, "setBackgroundColor:");
        }
        else
        {
          double v24 = [MEMORY[0x1E4FB1618] colorWithWhite:0.968627451 alpha:1.0];
          [(UIView *)v22 setBackgroundColor:v24];
        }
      }
      double v25 = [(SKUIPageDividerCollectionViewCell *)self contentView];
      [v25 addSubview:self->_insetView];
    }
    else
    {
      if (bottomDividerLine) {
        [(UIView *)bottomDividerLine removeFromSuperview];
      }
      id v23 = self->_insetView;
      if (v23) {
        [(UIView *)v23 removeFromSuperview];
      }
    }
  }
}

- (void)setInsetColor:(id)a3
{
  id v4 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPageDividerCollectionViewCell setInsetColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_insetColor != v4)
  {
    int64_t v13 = (UIColor *)[(UIColor *)v4 copy];
    insetColor = self->_insetColor;
    self->_insetColor = v13;

    insetView = self->_insetView;
    if (insetView)
    {
      if (self->_insetColor)
      {
        -[UIView setBackgroundColor:](self->_insetView, "setBackgroundColor:");
      }
      else
      {
        uint64_t v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.968627451 alpha:1.0];
        [(UIView *)insetView setBackgroundColor:v16];
      }
    }
  }
}

- (void)setLeftEdgeInset:(double)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPageDividerCollectionViewCell setLeftEdgeInset:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_leftEdgeInset != a3)
  {
    self->_leftEdgeInset = a3;
    [(SKUIPageDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setRightEdgeInset:(double)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPageDividerCollectionViewCell setRightEdgeInset:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_rightEdgeInset != a3)
  {
    self->_rightEdgeInset = a3;
    [(SKUIPageDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPageDividerCollectionViewCell setVerticalAlignment:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    [(SKUIPageDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPageDividerCollectionViewCell applyLayoutAttributes:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  int64_t v13 = [v4 backgroundColor];
  [(SKUIPageDividerCollectionViewCell *)self setBackgroundColor:v13];

  v14.receiver = self;
  v14.super_class = (Class)SKUIPageDividerCollectionViewCell;
  [(SKUIPageDividerCollectionViewCell *)&v14 applyLayoutAttributes:v4];
}

- (void)layoutSubviews
{
}

- (double)dividerHeight
{
  return self->_dividerHeight;
}

- (void)setDividerHeight:(double)a3
{
  self->_dividerHeight = a3;
}

- (int64_t)dividerType
{
  return self->_dividerType;
}

- (double)leftEdgeInset
{
  return self->_leftEdgeInset;
}

- (double)rightEdgeInset
{
  return self->_rightEdgeInset;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insetColor, 0);
  objc_storeStrong((id *)&self->_insetView, 0);
  objc_storeStrong((id *)&self->_bottomDividerLine, 0);

  objc_storeStrong((id *)&self->_topDividerLine, 0);
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

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setColoringWithStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setDividerType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setInsetColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setLeftEdgeInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setRightEdgeInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setVerticalAlignment:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)applyLayoutAttributes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end