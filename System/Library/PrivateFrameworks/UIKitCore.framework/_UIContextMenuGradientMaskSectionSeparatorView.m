@interface _UIContextMenuGradientMaskSectionSeparatorView
- (_UIContextMenuGradientMaskSectionSeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation _UIContextMenuGradientMaskSectionSeparatorView

- (_UIContextMenuGradientMaskSectionSeparatorView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_UIContextMenuGradientMaskSectionSeparatorView;
  v3 = -[UICollectionReusableView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = objc_alloc_init(UIView);
    [(UIView *)v5 bounds];
    -[UIView setFrame:](v6, "setFrame:");
    [(UIView *)v6 setAutoresizingMask:18];
    [(UIView *)v5 addSubview:v6];
    v7 = objc_alloc_init(UIView);
    v8 = [(UIView *)v5 traitCollection];
    v9 = _UIContextMenuGetPlatformMetrics([v8 userInterfaceIdiom]);
    v10 = [v9 sectionSeparatorColor];

    [(UIView *)v7 setBackgroundColor:v10];
    v11 = [(UIView *)v7 layer];
    [v11 setCompositingFilter:*MEMORY[0x1E4F3A2E0]];

    [(UIView *)v6 bounds];
    -[UIView setFrame:](v7, "setFrame:");
    [(UIView *)v7 setAutoresizingMask:18];
    [(UIView *)v6 addSubview:v7];
    v12 = [(UIView *)v5 layer];

    [v12 setAllowsGroupBlending:0];
    v13 = [(UIView *)v6 layer];
    [v13 setCompositingFilter:*MEMORY[0x1E4F3A308]];
  }
  return v4;
}

@end