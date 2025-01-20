@interface SKUIItemCollectionViewCell
- (SKUIItemCellLayout)layout;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBounds:(CGRect)a3;
- (void)setCellLayoutNeedsLayout;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SKUIItemCollectionViewCell

- (SKUIItemCellLayout)layout
{
  return 0;
}

- (void)setCellLayoutNeedsLayout
{
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
        -[SKUIItemCollectionViewCell applyLayoutAttributes:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIItemCollectionViewCell;
  [(SKUICollectionViewCell *)&v15 applyLayoutAttributes:v4];
  v13 = [(SKUIItemCollectionViewCell *)self layout];
  v14 = [v4 backgroundColor];

  [v13 setBackgroundColor:v14];
}

- (void)prepareForReuse
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIItemCollectionViewCell setHighlighted:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [(SKUIItemCollectionViewCell *)self layout];
  [v13 setHighlighted:v3];

  v14.receiver = self;
  v14.super_class = (Class)SKUIItemCollectionViewCell;
  [(SKUICollectionViewCell *)&v14 setHighlighted:v3];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIItemCollectionViewCell setSelected:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [(SKUIItemCollectionViewCell *)self layout];
  [v13 setSelected:v3];

  v14.receiver = self;
  v14.super_class = (Class)SKUIItemCollectionViewCell;
  [(SKUICollectionViewCell *)&v14 setSelected:v3];
}

- (void)layoutSubviews
{
}

- (void)setBounds:(CGRect)a3
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
        -[SKUIItemCollectionViewCell setBounds:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  [(SKUIItemCollectionViewCell *)self bounds];
  if (v17 != width || v16 != height) {
    self->_layoutNeedsLayout = 1;
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIItemCollectionViewCell;
  -[SKUIItemCollectionViewCell setBounds:](&v19, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
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
        -[SKUIItemCollectionViewCell setFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  [(SKUIItemCollectionViewCell *)self frame];
  if (v17 != width || v16 != height) {
    self->_layoutNeedsLayout = 1;
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIItemCollectionViewCell;
  -[SKUIItemCollectionViewCell setFrame:](&v19, sel_setFrame_, x, y, width, height);
}

- (void)applyLayoutAttributes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setHighlighted:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSelected:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBounds:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end