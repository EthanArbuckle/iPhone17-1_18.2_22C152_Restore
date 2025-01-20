@interface SUUITabBarBackgroundView
- (BOOL)barWantsAdaptiveBackdrop;
- (BOOL)isTranslucent;
- (NSString)backdropGroupName;
- (SUUITabBarBackgroundView)initWithFrame:(CGRect)a3;
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

@implementation SUUITabBarBackgroundView

- (SUUITabBarBackgroundView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SUUITabBarBackgroundView;
  v3 = -[SUUITabBarBackgroundView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SUUITabBarBackgroundView *)v3 setAutoresizingMask:18];
    [(SUUITabBarBackgroundView *)v4 setUserInteractionEnabled:0];
    uint64_t v5 = [objc_alloc(MEMORY[0x263F82EB8]) initWithPrivateStyle:10060];
    backdropView = v4->_backdropView;
    v4->_backdropView = (_UIBackdropView *)v5;

    [(SUUITabBarBackgroundView *)v4 addSubview:v4->_backdropView];
    v7 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    borderView = v4->_borderView;
    v4->_borderView = v7;

    v9 = v4->_borderView;
    v10 = [MEMORY[0x263F825C8] _barHairlineShadowColor];
    [(UIView *)v9 setBackgroundColor:v10];

    [(SUUITabBarBackgroundView *)v4 addSubview:v4->_borderView];
  }
  return v4;
}

- (NSString)backdropGroupName
{
  return (NSString *)[(_UIBackdropView *)self->_backdropView groupName];
}

- (void)setBackdropGroupName:(id)a3
{
  id v5 = a3;
  id v4 = [(SUUITabBarBackgroundView *)self backdropGroupName];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0) {
    [(_UIBackdropView *)self->_backdropView setGroupName:v5];
  }
}

- (void)setBackdropStyle:(int64_t)a3
{
  borderView = self->_borderView;
  if (a3 == 11050) {
    [MEMORY[0x263F825C8] _barStyleBlackHairlineShadowColor];
  }
  else {
  v6 = [MEMORY[0x263F825C8] _barHairlineShadowColor];
  }
  [(UIView *)borderView setBackgroundColor:v6];

  backdropView = self->_backdropView;
  [(_UIBackdropView *)backdropView transitionToPrivateStyle:a3];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SUUITabBarBackgroundView;
  [(SUUITabBarBackgroundView *)&v8 layoutSubviews];
  [(SUUITabBarBackgroundView *)self bounds];
  double v4 = v3;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  id v5 = [MEMORY[0x263F82B60] mainScreen];
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

@end