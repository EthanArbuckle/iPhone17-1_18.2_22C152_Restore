@interface _UIContextMenuSeparatorView
- (_UIContextMenuSeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation _UIContextMenuSeparatorView

- (_UIContextMenuSeparatorView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuSeparatorView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    id v5 = _UIContextMenuConfigureSeparatorView(v3);
  }
  return v4;
}

@end