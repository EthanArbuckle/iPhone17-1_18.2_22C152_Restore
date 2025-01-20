@interface _UIKeyShortcutHUDSeparatorView
- (BOOL)isSeparatorHidden;
- (UIColor)separatorColor;
- (UIVisualEffect)visualEffect;
- (UIVisualEffectView)separatorVisualEffectView;
- (_UIKeyShortcutHUDSeparatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setSeparatorVisualEffectView:(id)a3;
- (void)setVisualEffect:(id)a3;
@end

@implementation _UIKeyShortcutHUDSeparatorView

- (_UIKeyShortcutHUDSeparatorView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyShortcutHUDSeparatorView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    v5 = [UIVisualEffectView alloc];
    [(UIView *)v4 bounds];
    uint64_t v6 = -[UIVisualEffectView initWithFrame:](v5, "initWithFrame:");
    separatorVisualEffectView = v4->_separatorVisualEffectView;
    v4->_separatorVisualEffectView = (UIVisualEffectView *)v6;

    [(UIView *)v4 addSubview:v4->_separatorVisualEffectView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDSeparatorView;
  [(UIView *)&v4 layoutSubviews];
  v3 = [(UIView *)self layoutMarginsGuide];
  [v3 layoutFrame];
  -[UIView setFrame:](self->_separatorVisualEffectView, "setFrame:");
}

- (BOOL)isSeparatorHidden
{
  return [(UIView *)self->_separatorVisualEffectView isHidden];
}

- (void)setSeparatorHidden:(BOOL)a3
{
}

- (UIColor)separatorColor
{
  v2 = [(UIVisualEffectView *)self->_separatorVisualEffectView contentView];
  v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (void)setSeparatorColor:(id)a3
{
  separatorVisualEffectView = self->_separatorVisualEffectView;
  id v4 = a3;
  id v5 = [(UIVisualEffectView *)separatorVisualEffectView contentView];
  [v5 setBackgroundColor:v4];
}

- (UIVisualEffect)visualEffect
{
  return [(UIVisualEffectView *)self->_separatorVisualEffectView effect];
}

- (void)setVisualEffect:(id)a3
{
}

- (UIVisualEffectView)separatorVisualEffectView
{
  return self->_separatorVisualEffectView;
}

- (void)setSeparatorVisualEffectView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end