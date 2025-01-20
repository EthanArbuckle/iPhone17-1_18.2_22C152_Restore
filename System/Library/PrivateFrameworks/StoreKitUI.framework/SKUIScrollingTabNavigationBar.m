@interface SKUIScrollingTabNavigationBar
- (UIOffset)positionOffset;
- (void)positionOffset;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPositionOffset:(UIOffset)a3;
@end

@implementation SKUIScrollingTabNavigationBar

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIScrollingTabNavigationBar setCenter:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  double v14 = x + self->_positionOffset.horizontal;
  double v15 = y + self->_positionOffset.vertical;
  v16.receiver = self;
  v16.super_class = (Class)SKUIScrollingTabNavigationBar;
  -[SKUIScrollingTabNavigationBar setCenter:](&v16, sel_setCenter_, v14, v15);
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
        -[SKUIScrollingTabNavigationBar setFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v16 = x + self->_positionOffset.horizontal;
  double v17 = y + self->_positionOffset.vertical;
  v18.receiver = self;
  v18.super_class = (Class)SKUIScrollingTabNavigationBar;
  -[SKUIScrollingTabNavigationBar setFrame:](&v18, sel_setFrame_, v16, v17, width, height);
}

- (UIOffset)positionOffset
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIScrollingTabNavigationBar *)v3 positionOffset];
      }
    }
  }
  double horizontal = self->_positionOffset.horizontal;
  double vertical = self->_positionOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setPositionOffset:(UIOffset)a3
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIScrollingTabNavigationBar setPositionOffset:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  p_positionOffset = &self->_positionOffset;
  if (self->_positionOffset.horizontal != horizontal || self->_positionOffset.vertical != vertical)
  {
    [(SKUIScrollingTabNavigationBar *)self center];
    double v16 = self->_positionOffset.vertical;
    double v18 = v17 - p_positionOffset->horizontal;
    p_positionOffset->double horizontal = horizontal;
    self->_positionOffset.double vertical = vertical;
    v20.receiver = self;
    v20.super_class = (Class)SKUIScrollingTabNavigationBar;
    -[SKUIScrollingTabNavigationBar setCenter:](&v20, sel_setCenter_, horizontal + v18, v19 - v16 + vertical);
  }
}

- (void)setCenter:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)positionOffset
{
}

- (void)setPositionOffset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end