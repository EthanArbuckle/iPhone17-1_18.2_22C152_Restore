@interface _UIPlatterClippingView
- (_UIPlatterClippingView)initWithFrame:(CGRect)a3;
@end

@implementation _UIPlatterClippingView

- (_UIPlatterClippingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPlatterClippingView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(UIView *)v3 _setShouldAdaptToMaterials:0];
  }
  return v4;
}

@end