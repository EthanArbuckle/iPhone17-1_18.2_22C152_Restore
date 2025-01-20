@interface _UIEditMenuListSeparatorView
- (_UIEditMenuListSeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation _UIEditMenuListSeparatorView

- (_UIEditMenuListSeparatorView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_UIEditMenuListSeparatorView;
  v3 = -[UICollectionReusableView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 traitCollection];
    v6 = _UIEditMenuGetPlatformMetrics([v5 userInterfaceIdiom]);
    v7 = [UIVisualEffectView alloc];
    v8 = [v6 separatorEffect];
    v9 = [(UIVisualEffectView *)v7 initWithEffect:v8];

    v10 = [v6 separatorEffectColor];
    v11 = [(UIVisualEffectView *)v9 contentView];
    [v11 setBackgroundColor:v10];

    v12 = [(UIVisualEffectView *)v9 contentView];
    v13 = [v12 layer];
    [v13 setAllowsEdgeAntialiasing:1];

    v14 = [(UIVisualEffectView *)v9 contentView];
    [v14 setClipsToBounds:0];

    [(UIView *)v4 bounds];
    -[UIView setFrame:](v9, "setFrame:");
    [(UIView *)v9 setAutoresizingMask:18];
    [(UIView *)v4 addSubview:v9];
  }
  return v4;
}

@end