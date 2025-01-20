@interface SUUIPageDividerCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIPageDividerCollectionViewCell)initWithFrame:(CGRect)a3;
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

@implementation SUUIPageDividerCollectionViewCell

- (SUUIPageDividerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIPageDividerCollectionViewCell;
  v3 = -[SUUIPageDividerCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    topDividerLine = v3->_topDividerLine;
    v3->_topDividerLine = v4;

    v6 = v3->_topDividerLine;
    v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v6 setBackgroundColor:v7];

    v8 = [(SUUIPageDividerCollectionViewCell *)v3 contentView];
    [v8 addSubview:v3->_topDividerLine];
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

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    double v9 = [v7 style];
    double v10 = SUUIViewElementPaddingForStyle(v9, 0);
    double v12 = v11;
  }
  else
  {
    double v10 = *MEMORY[0x263F834E8];
    double v12 = *(double *)(MEMORY[0x263F834E8] + 16);
  }
  [v8 displayScale];
  double v14 = 1.0 / v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v7;
    if ([v15 dividerType] == 2)
    {
      +[SUUIPageTitledDividerCollectionViewCell viewElementInsetDividerHeight:v15];
      double v14 = v16 + v14 * 2.0;
    }
  }
  double v17 = a3;
  double v18 = v12 + v10 + v14;
  result.height = v18;
  result.width = v17;
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
    [(SUUIPageDividerCollectionViewCell *)self setNeedsLayout];
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
  uint64_t v4 = [a3 primaryTextColor];
  topDividerLine = self->_topDividerLine;
  id v10 = (id)v4;
  if (v4)
  {
    [(UIView *)topDividerLine setBackgroundColor:v4];
    bottomDividerLine = self->_bottomDividerLine;
    if (bottomDividerLine) {
      [(UIView *)bottomDividerLine setBackgroundColor:v10];
    }
  }
  else
  {
    id v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)topDividerLine setBackgroundColor:v7];

    id v8 = self->_bottomDividerLine;
    if (v8)
    {
      double v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)v8 setBackgroundColor:v9];
    }
  }
}

- (void)setColoringWithStyle:(id)a3
{
  uint64_t v4 = [a3 ikBorderColor];
  id v10 = [v4 color];

  topDividerLine = self->_topDividerLine;
  if (v10)
  {
    [(UIView *)self->_topDividerLine setBackgroundColor:v10];
    bottomDividerLine = self->_bottomDividerLine;
    if (bottomDividerLine) {
      [(UIView *)bottomDividerLine setBackgroundColor:v10];
    }
  }
  else
  {
    id v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)topDividerLine setBackgroundColor:v7];

    id v8 = self->_bottomDividerLine;
    if (v8)
    {
      double v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)v8 setBackgroundColor:v9];
    }
  }
}

- (void)setDividerType:(int64_t)a3
{
  if (self->_dividerType != a3)
  {
    self->_dividerType = a3;
    int64_t v4 = [(SUUIPageDividerCollectionViewCell *)self dividerType];
    bottomDividerLine = self->_bottomDividerLine;
    if (v4 == 2)
    {
      if (!bottomDividerLine)
      {
        id v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
        id v7 = self->_bottomDividerLine;
        self->_bottomDividerLine = v6;

        id v8 = self->_bottomDividerLine;
        double v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
        [(UIView *)v8 setBackgroundColor:v9];
      }
      id v10 = [(SUUIPageDividerCollectionViewCell *)self contentView];
      [v10 addSubview:self->_bottomDividerLine];

      if (!self->_insetView)
      {
        double v11 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
        insetView = self->_insetView;
        self->_insetView = v11;

        double v13 = self->_insetView;
        if (self->_insetColor)
        {
          -[UIView setBackgroundColor:](self->_insetView, "setBackgroundColor:");
        }
        else
        {
          id v15 = [MEMORY[0x263F825C8] colorWithWhite:0.968627451 alpha:1.0];
          [(UIView *)v13 setBackgroundColor:v15];
        }
      }
      id v16 = [(SUUIPageDividerCollectionViewCell *)self contentView];
      [v16 addSubview:self->_insetView];
    }
    else
    {
      if (bottomDividerLine) {
        [(UIView *)bottomDividerLine removeFromSuperview];
      }
      double v14 = self->_insetView;
      if (v14)
      {
        [(UIView *)v14 removeFromSuperview];
      }
    }
  }
}

- (void)setInsetColor:(id)a3
{
  int64_t v4 = (UIColor *)a3;
  if (self->_insetColor != v4)
  {
    double v9 = v4;
    v5 = (UIColor *)[(UIColor *)v4 copy];
    insetColor = self->_insetColor;
    self->_insetColor = v5;

    int64_t v4 = v9;
    insetView = self->_insetView;
    if (insetView)
    {
      if (self->_insetColor)
      {
        -[UIView setBackgroundColor:](self->_insetView, "setBackgroundColor:");
      }
      else
      {
        id v8 = [MEMORY[0x263F825C8] colorWithWhite:0.968627451 alpha:1.0];
        [(UIView *)insetView setBackgroundColor:v8];
      }
      int64_t v4 = v9;
    }
  }
}

- (void)setLeftEdgeInset:(double)a3
{
  if (self->_leftEdgeInset != a3)
  {
    self->_leftEdgeInset = a3;
    [(SUUIPageDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setRightEdgeInset:(double)a3
{
  if (self->_rightEdgeInset != a3)
  {
    self->_rightEdgeInset = a3;
    [(SUUIPageDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    [(SUUIPageDividerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = [v4 backgroundColor];
  [(SUUIPageDividerCollectionViewCell *)self setBackgroundColor:v5];

  v6.receiver = self;
  v6.super_class = (Class)SUUIPageDividerCollectionViewCell;
  [(SUUIPageDividerCollectionViewCell *)&v6 applyLayoutAttributes:v4];
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)SUUIPageDividerCollectionViewCell;
  [(SUUIPageDividerCollectionViewCell *)&v29 layoutSubviews];
  v3 = [(SUUIPageDividerCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  int64_t v8 = [(SUUIPageDividerCollectionViewCell *)self dividerType];
  double v9 = [(SUUIPageDividerCollectionViewCell *)self traitCollection];
  [v9 displayScale];
  double v11 = v10;
  if (v10 <= 0.00000011920929)
  {
    double v12 = [MEMORY[0x263F82B60] mainScreen];
    [v12 scale];
    double v11 = v13;
  }
  double v14 = 1.0 / v11;
  if (v8 != 2)
  {
    int64_t verticalAlignment = self->_verticalAlignment;
    if (verticalAlignment)
    {
      if (verticalAlignment != 1)
      {
        double v26 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
        double leftEdgeInset = *MEMORY[0x263F001A8];
        double v24 = *(double *)(MEMORY[0x263F001A8] + 8);
        goto LABEL_11;
      }
      double v24 = v7 - v14;
    }
    else
    {
      double v24 = 0.0;
    }
    double leftEdgeInset = self->_leftEdgeInset;
    double v26 = v5 - leftEdgeInset - self->_rightEdgeInset;
LABEL_11:
    double top = self->_contentInset.top;
    double left = self->_contentInset.left;
    double v18 = leftEdgeInset + left;
    double v20 = v24 + top;
    double v21 = v26 - (left + self->_contentInset.right);
    double v14 = v14 - (top + self->_contentInset.bottom);
    v22 = &OBJC_IVAR___SUUIPageDividerCollectionViewCell__topDividerLine;
    goto LABEL_12;
  }
  -[UIView setFrame:](self->_topDividerLine, "setFrame:", self->_leftEdgeInset, 0.0, v5 - self->_leftEdgeInset - self->_rightEdgeInset, v14);
  double v15 = self->_leftEdgeInset;
  double v16 = v5 - v15 - self->_rightEdgeInset;
  [(SUUIPageDividerCollectionViewCell *)self dividerHeight];
  -[UIView setFrame:](self->_insetView, "setFrame:", v15, v14, v16, v17 + v14 * -2.0);
  double v18 = self->_leftEdgeInset;
  [(SUUIPageDividerCollectionViewCell *)self dividerHeight];
  double v20 = v19;
  double v21 = v5 - self->_leftEdgeInset - self->_rightEdgeInset;
  v22 = &OBJC_IVAR___SUUIPageDividerCollectionViewCell__bottomDividerLine;
LABEL_12:
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v22), "setFrame:", v18, v20, v21, v14);
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

@end