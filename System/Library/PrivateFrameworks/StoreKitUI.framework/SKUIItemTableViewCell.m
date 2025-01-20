@interface SKUIItemTableViewCell
- (SKUIItemCellLayout)layout;
- (void)configureForItem:(id)a3 rowIndex:(int64_t)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setCellLayoutNeedsLayout;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SKUIItemTableViewCell

- (void)configureForItem:(id)a3 rowIndex:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIItemTableViewCell configureForItem:rowIndex:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  [(SKUIItemTableViewCell *)self configureForItem:v6 clientContext:0 rowIndex:a4];
}

- (SKUIItemCellLayout)layout
{
  return 0;
}

- (void)setCellLayoutNeedsLayout
{
}

- (void)prepareForReuse
{
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIItemTableViewCell setHighlighted:animated:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v15 = [(SKUIItemTableViewCell *)self layout];
  [v15 setHighlighted:v5];

  v16.receiver = self;
  v16.super_class = (Class)SKUIItemTableViewCell;
  [(SKUITableViewCell *)&v16 setHighlighted:v5 animated:v4];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIItemTableViewCell setSelected:animated:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v15 = [(SKUIItemTableViewCell *)self layout];
  [v15 setSelected:v5];

  v16.receiver = self;
  v16.super_class = (Class)SKUIItemTableViewCell;
  [(SKUITableViewCell *)&v16 setSelected:v5 animated:v4];
}

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIItemTableViewCell setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(SKUIItemTableViewCell *)self layout];
  [v13 setBackgroundColor:v4];

  v14.receiver = self;
  v14.super_class = (Class)SKUIItemTableViewCell;
  [(SKUIItemTableViewCell *)&v14 setBackgroundColor:v4];
}

- (void)configureForItem:(uint64_t)a3 rowIndex:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setHighlighted:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSelected:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end