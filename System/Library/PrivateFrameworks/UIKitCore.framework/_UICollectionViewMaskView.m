@interface _UICollectionViewMaskView
- (_UICollectionViewMaskView)initWithFrame:(CGRect)a3;
@end

@implementation _UICollectionViewMaskView

- (_UICollectionViewMaskView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewMaskView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor blackColor];
    [(UIView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

@end