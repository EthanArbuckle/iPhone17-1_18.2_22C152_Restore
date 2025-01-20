@interface SKUIEditorialCollectionViewCell
- (SKUIEditorialCellLayout)layout;
- (SKUIEditorialCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setCellLayoutNeedsLayout;
@end

@implementation SKUIEditorialCollectionViewCell

- (SKUIEditorialCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorialCollectionViewCell initWithFrame:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIEditorialCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [[SKUIEditorialCellLayout alloc] initWithCollectionViewCell:v8];
    layout = v8->_layout;
    v8->_layout = v9;
  }
  return v8;
}

- (void)setCellLayoutNeedsLayout
{
  self->_layoutNeedsLayout = 1;
  [(SKUIEditorialCollectionViewCell *)self setNeedsLayout];
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIEditorialCollectionViewCell;
  id v4 = a3;
  [(SKUICollectionViewCell *)&v7 applyLayoutAttributes:v4];
  v5 = [(SKUIEditorialCollectionViewCell *)self layout];
  v6 = [v4 backgroundColor];

  [v5 setBackgroundColor:v6];
}

- (void)prepareForReuse
{
  v3 = [(SKUIEditorialCollectionViewCell *)self layout];
  [v3 prepareForReuse];

  v4.receiver = self;
  v4.super_class = (Class)SKUIEditorialCollectionViewCell;
  [(SKUIEditorialCollectionViewCell *)&v4 prepareForReuse];
}

- (void)layoutSubviews
{
  v3 = [(SKUIEditorialCollectionViewCell *)self contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  v12.receiver = self;
  v12.super_class = (Class)SKUIEditorialCollectionViewCell;
  [(SKUICollectionViewCell *)&v12 layoutSubviews];
  if (self->_layoutNeedsLayout || (([v3 frame], v9 == v5) ? (BOOL v10 = v8 == v7) : (BOOL v10 = 0), !v10))
  {
    v11 = [(SKUIEditorialCollectionViewCell *)self layout];
    [v11 layoutSubviews];
  }
  self->_layoutNeedsLayout = 0;
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIEditorialCollectionViewCell;
  id v4 = a3;
  [(SKUICollectionViewCell *)&v6 setBackgroundColor:v4];
  double v5 = [(SKUIEditorialCollectionViewCell *)self layout];
  [v5 setBackgroundColor:v4];
}

- (SKUIEditorialCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEditorialCollectionViewCell initWithFrame:]";
}

@end