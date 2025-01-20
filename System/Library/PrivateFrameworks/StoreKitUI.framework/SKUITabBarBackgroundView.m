@interface SKUITabBarBackgroundView
- (BOOL)barWantsAdaptiveBackdrop;
- (BOOL)isTranslucent;
- (NSString)backdropGroupName;
- (SKUITabBarBackgroundView)initWithFrame:(CGRect)a3;
- (UIColor)barTintColor;
- (UIView)_shadowView;
- (_UINavigationBarAppearanceStorage)appearanceStorage;
- (id)_currentCustomBackground;
- (id)_currentCustomBackgroundRespectOversize_legacy:(BOOL *)a3;
- (int64_t)backdropStyle;
- (int64_t)barStyle;
- (void)_setShadowView:(id)a3;
- (void)layoutSubviews;
- (void)setAppearanceStorage:(id)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setBackdropStyle:(int64_t)a3;
- (void)setBarStyle:(int64_t)a3;
- (void)setBarTintColor:(id)a3;
- (void)setBarWantsAdaptiveBackdrop:(BOOL)a3;
- (void)setTranslucent:(BOOL)a3;
@end

@implementation SKUITabBarBackgroundView

- (SKUITabBarBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITabBarBackgroundView initWithFrame:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUITabBarBackgroundView;
  v8 = -[SKUITabBarBackgroundView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    [(SKUITabBarBackgroundView *)v8 setAutoresizingMask:18];
    [(SKUITabBarBackgroundView *)v9 setUserInteractionEnabled:0];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:10060];
    backdropView = v9->_backdropView;
    v9->_backdropView = (_UIBackdropView *)v10;

    [(SKUITabBarBackgroundView *)v9 addSubview:v9->_backdropView];
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    borderView = v9->_borderView;
    v9->_borderView = v12;

    v14 = v9->_borderView;
    v15 = [MEMORY[0x1E4FB1618] _barHairlineShadowColor];
    [(UIView *)v14 setBackgroundColor:v15];

    [(SKUITabBarBackgroundView *)v9 addSubview:v9->_borderView];
  }
  return v9;
}

- (NSString)backdropGroupName
{
  return (NSString *)[(_UIBackdropView *)self->_backdropView groupName];
}

- (void)setBackdropGroupName:(id)a3
{
  id v5 = a3;
  id v4 = [(SKUITabBarBackgroundView *)self backdropGroupName];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0) {
    [(_UIBackdropView *)self->_backdropView setGroupName:v5];
  }
}

- (void)setBackdropStyle:(int64_t)a3
{
  borderView = self->_borderView;
  if (a3 == 11050) {
    [MEMORY[0x1E4FB1618] _barStyleBlackHairlineShadowColor];
  }
  else {
  v6 = [MEMORY[0x1E4FB1618] _barHairlineShadowColor];
  }
  [(UIView *)borderView setBackgroundColor:v6];

  backdropView = self->_backdropView;

  [(_UIBackdropView *)backdropView transitionToPrivateStyle:a3];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SKUITabBarBackgroundView;
  [(SKUITabBarBackgroundView *)&v8 layoutSubviews];
  [(SKUITabBarBackgroundView *)self bounds];
  double v4 = v3;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  double v7 = 1.0 / v6;

  -[UIView setFrame:](self->_borderView, "setFrame:", 0.0, 0.0, v4, v7);
}

- (id)_currentCustomBackground
{
  return 0;
}

- (id)_currentCustomBackgroundRespectOversize_legacy:(BOOL *)a3
{
  return 0;
}

- (_UINavigationBarAppearanceStorage)appearanceStorage
{
  return self->appearanceStorage;
}

- (void)setAppearanceStorage:(id)a3
{
}

- (int64_t)barStyle
{
  return self->barStyle;
}

- (void)setBarStyle:(int64_t)a3
{
  self->barStyle = a3;
}

- (UIColor)barTintColor
{
  return self->barTintColor;
}

- (void)setBarTintColor:(id)a3
{
}

- (BOOL)barWantsAdaptiveBackdrop
{
  return self->barWantsAdaptiveBackdrop;
}

- (void)setBarWantsAdaptiveBackdrop:(BOOL)a3
{
  self->barWantsAdaptiveBackdrop = a3;
}

- (UIView)_shadowView
{
  return self->_shadowView;
}

- (void)_setShadowView:(id)a3
{
}

- (BOOL)isTranslucent
{
  return self->translucent;
}

- (void)setTranslucent:(BOOL)a3
{
  self->translucent = a3;
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->barTintColor, 0);
  objc_storeStrong((id *)&self->appearanceStorage, 0);
  objc_storeStrong((id *)&self->_borderView, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITabBarBackgroundView initWithFrame:]";
}

@end