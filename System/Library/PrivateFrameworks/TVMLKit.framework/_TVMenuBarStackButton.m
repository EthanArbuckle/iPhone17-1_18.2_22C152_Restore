@interface _TVMenuBarStackButton
- (CGSize)intrinsicContentSize;
- (NSDictionary)tabBarItem;
- (_TVMenuBarStackButton)initWithCoder:(id)a3;
- (_TVMenuBarStackButton)initWithFrame:(CGRect)a3;
- (void)_configureSubviews;
- (void)_setSelectedOrHighlighted:(BOOL)a3;
- (void)_updateImageEdgeInsets;
- (void)setSelected:(BOOL)a3;
- (void)setTabBarItem:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _TVMenuBarStackButton

- (_TVMenuBarStackButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVMenuBarStackButton;
  v3 = [(_TVMenuBarStackButton *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_TVMenuBarStackButton *)v3 _configureSubviews];
  }
  return v4;
}

- (_TVMenuBarStackButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVMenuBarStackButton;
  v3 = -[_TVMenuBarStackButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVMenuBarStackButton *)v3 _configureSubviews];
  }
  return v4;
}

- (void)setTabBarItem:(id)a3
{
  v5 = (NSDictionary *)a3;
  p_tabBarItem = &self->_tabBarItem;
  if (self->_tabBarItem != v5)
  {
    v24 = v5;
    objc_storeStrong((id *)&self->_tabBarItem, a3);
    [(_TVMenuBarStackButton *)self setShowsTouchWhenHighlighted:0];
    v7 = [(NSDictionary *)*p_tabBarItem objectForKey:*MEMORY[0x263F4B338]];
    if ([v7 length]) {
      [(_TVMenuBarStackButton *)self setTitle:v7 forState:0];
    }
    v8 = [(NSDictionary *)*p_tabBarItem objectForKey:@"p-image-off"];
    if (![v8 length])
    {
      uint64_t v9 = [(NSDictionary *)*p_tabBarItem objectForKey:*MEMORY[0x263F4B320]];

      v8 = (void *)v9;
    }
    if ([v8 length])
    {
      v10 = [NSURL URLWithString:v8];
      v11 = +[TVInterfaceFactory sharedInterfaceFactory];
      v12 = objc_msgSend(v10, "tv_resourceName");
      v13 = [v11 imageForResource:v12];

      [(_TVMenuBarStackButton *)self setImage:v13 forState:0];
    }
    v14 = [(NSDictionary *)*p_tabBarItem objectForKey:@"p-image-on"];
    if (![v14 length])
    {
      uint64_t v15 = [(NSDictionary *)*p_tabBarItem objectForKey:*MEMORY[0x263F4B328]];

      v14 = (void *)v15;
    }
    if ([v14 length])
    {
      v16 = [NSURL URLWithString:v14];
      v17 = +[TVInterfaceFactory sharedInterfaceFactory];
      v18 = objc_msgSend(v16, "tv_resourceName");
      v19 = [v17 imageForResource:v18];

      [(_TVMenuBarStackButton *)self setImage:v19 forState:5];
      [(_TVMenuBarStackButton *)self setImage:v19 forState:4];
    }
    v20 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
    [(_TVMenuBarStackButton *)self _setImageColor:v20 forState:4];

    v21 = [MEMORY[0x263F1C550] systemGrayColor];
    [(_TVMenuBarStackButton *)self _setImageColor:v21 forState:0];

    v22 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
    [(_TVMenuBarStackButton *)self setTitleColor:v22 forState:4];

    v23 = [MEMORY[0x263F1C550] systemGrayColor];
    [(_TVMenuBarStackButton *)self setTitleColor:v23 forState:0];

    v5 = v24;
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_TVMenuBarStackButton;
  -[_TVMenuBarStackButton setSelected:](&v5, sel_setSelected_);
  [(_TVMenuBarStackButton *)self _setSelectedOrHighlighted:v3];
}

- (CGSize)intrinsicContentSize
{
  v5.receiver = self;
  v5.super_class = (Class)_TVMenuBarStackButton;
  [(_TVMenuBarStackButton *)&v5 intrinsicContentSize];
  double v3 = v2 + 8.0;
  double v4 = 1.79769313e308;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVMenuBarStackButton;
  [(_TVMenuBarStackButton *)&v4 traitCollectionDidChange:a3];
  [(_TVMenuBarStackButton *)self _updateImageEdgeInsets];
}

- (void)_configureSubviews
{
  [(_TVMenuBarStackButton *)self setTintAdjustmentMode:2];
  [(_TVMenuBarStackButton *)self _updateImageEdgeInsets];
  [(_TVMenuBarStackButton *)self setNeedsLayout];
  [(_TVMenuBarStackButton *)self invalidateIntrinsicContentSize];
}

- (void)_setSelectedOrHighlighted:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2;
  }
  [(_TVMenuBarStackButton *)self setTintAdjustmentMode:v4];
  [(_TVMenuBarStackButton *)self setNeedsLayout];
  [(_TVMenuBarStackButton *)self layoutIfNeeded];
}

- (void)_updateImageEdgeInsets
{
  [(_TVMenuBarStackButton *)self imageEdgeInsets];
  double v4 = v3;
  double v6 = v5;
  v7 = [(_TVMenuBarStackButton *)self traitCollection];
  uint64_t v8 = [v7 layoutDirection];

  if (v8 == 1) {
    double v9 = 8.0;
  }
  else {
    double v9 = 0.0;
  }
  if (v8 == 1) {
    double v10 = 0.0;
  }
  else {
    double v10 = 8.0;
  }
  -[_TVMenuBarStackButton setImageEdgeInsets:](self, "setImageEdgeInsets:", v4, v9, v6, v10);
}

- (NSDictionary)tabBarItem
{
  return self->_tabBarItem;
}

- (void).cxx_destruct
{
}

@end