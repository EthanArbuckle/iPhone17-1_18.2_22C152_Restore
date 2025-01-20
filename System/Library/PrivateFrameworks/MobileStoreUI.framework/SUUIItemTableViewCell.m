@interface SUUIItemTableViewCell
- (SUUIItemCellLayout)layout;
- (void)configureForItem:(id)a3 rowIndex:(int64_t)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setCellLayoutNeedsLayout;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SUUIItemTableViewCell

- (void)configureForItem:(id)a3 rowIndex:(int64_t)a4
{
}

- (SUUIItemCellLayout)layout
{
  return 0;
}

- (void)setCellLayoutNeedsLayout
{
  self->_layoutNeedsLayout = 1;
  [(SUUIItemTableViewCell *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  v3 = [(SUUIItemTableViewCell *)self layout];
  [v3 prepareForReuse];

  v4.receiver = self;
  v4.super_class = (Class)SUUIItemTableViewCell;
  [(SUUITableViewCell *)&v4 prepareForReuse];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(SUUIItemTableViewCell *)self layout];
  [v7 setHighlighted:v5];

  v8.receiver = self;
  v8.super_class = (Class)SUUIItemTableViewCell;
  [(SUUITableViewCell *)&v8 setHighlighted:v5 animated:v4];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(SUUIItemTableViewCell *)self layout];
  [v7 setSelected:v5];

  v8.receiver = self;
  v8.super_class = (Class)SUUIItemTableViewCell;
  [(SUUITableViewCell *)&v8 setSelected:v5 animated:v4];
}

- (void)layoutSubviews
{
  v3 = [(SUUIItemTableViewCell *)self contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  v12.receiver = self;
  v12.super_class = (Class)SUUIItemTableViewCell;
  [(SUUITableViewCell *)&v12 layoutSubviews];
  if (self->_layoutNeedsLayout || (([v3 frame], v9 == v5) ? (BOOL v10 = v8 == v7) : (BOOL v10 = 0), !v10))
  {
    v11 = [(SUUIItemTableViewCell *)self layout];
    [v11 layoutSubviews];
  }
  self->_layoutNeedsLayout = 0;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIItemTableViewCell *)self layout];
  [v5 setBackgroundColor:v4];

  v6.receiver = self;
  v6.super_class = (Class)SUUIItemTableViewCell;
  [(SUUIItemTableViewCell *)&v6 setBackgroundColor:v4];
}

@end