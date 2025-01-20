@interface SUUIItemCollectionViewCell
- (SUUIItemCellLayout)layout;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBounds:(CGRect)a3;
- (void)setCellLayoutNeedsLayout;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SUUIItemCollectionViewCell

- (SUUIItemCellLayout)layout
{
  return 0;
}

- (void)setCellLayoutNeedsLayout
{
  self->_layoutNeedsLayout = 1;
  [(SUUIItemCollectionViewCell *)self setNeedsLayout];
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIItemCollectionViewCell;
  id v4 = a3;
  [(SUUICollectionViewCell *)&v7 applyLayoutAttributes:v4];
  v5 = [(SUUIItemCollectionViewCell *)self layout];
  v6 = [v4 backgroundColor];

  [v5 setBackgroundColor:v6];
}

- (void)prepareForReuse
{
  v3 = [(SUUIItemCollectionViewCell *)self layout];
  [v3 prepareForReuse];

  v4.receiver = self;
  v4.super_class = (Class)SUUIItemCollectionViewCell;
  [(SUUIItemCollectionViewCell *)&v4 prepareForReuse];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUUIItemCollectionViewCell *)self layout];
  [v5 setHighlighted:v3];

  v6.receiver = self;
  v6.super_class = (Class)SUUIItemCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setHighlighted:v3];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUUIItemCollectionViewCell *)self layout];
  [v5 setSelected:v3];

  v6.receiver = self;
  v6.super_class = (Class)SUUIItemCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setSelected:v3];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIItemCollectionViewCell;
  [(SUUICollectionViewCell *)&v4 layoutSubviews];
  if (self->_layoutNeedsLayout)
  {
    BOOL v3 = [(SUUIItemCollectionViewCell *)self layout];
    [v3 layoutSubviews];
  }
  self->_layoutNeedsLayout = 0;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUUIItemCollectionViewCell *)self bounds];
  if (v9 != width || v8 != height) {
    self->_layoutNeedsLayout = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIItemCollectionViewCell;
  -[SUUIItemCollectionViewCell setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUUIItemCollectionViewCell *)self frame];
  if (v9 != width || v8 != height) {
    self->_layoutNeedsLayout = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIItemCollectionViewCell;
  -[SUUIItemCollectionViewCell setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

@end