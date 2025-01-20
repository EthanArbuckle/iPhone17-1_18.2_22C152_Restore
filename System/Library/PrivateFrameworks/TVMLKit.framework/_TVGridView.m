@interface _TVGridView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)tv_sizeThatFits:(CGSize)a3 withContentInset:(UIEdgeInsets)a4;
- (_TVGridView)initWithFrame:(CGRect)a3;
- (_TVGridView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setGridFlowLayout:(id)a3;
@end

@implementation _TVGridView

- (_TVGridView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_alloc_init(_TVCollectionViewFlowLayout);
  [(UICollectionViewFlowLayout *)v8 setScrollDirection:0];
  [(UICollectionViewFlowLayout *)v8 setMinimumInteritemSpacing:0.0];
  [(UICollectionViewFlowLayout *)v8 setMinimumLineSpacing:0.0];
  v9 = -[_TVGridView initWithFrame:collectionViewLayout:](self, "initWithFrame:collectionViewLayout:", v8, x, y, width, height);

  return v9;
}

- (_TVGridView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_TVGridView;
  v4 = -[_TVCollectionView initWithFrame:collectionViewLayout:](&v7, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(_TVCollectionView *)v4 setScrollEnabled:0];
    [(_TVGridView *)v5 _setShouldDeriveVisibleBoundsFromContainingScrollView:1];
    [(_TVGridView *)v5 _setNeedsLayoutOnVisibleBoundsChange:1];
    [(_TVGridView *)v5 setOpaque:0];
    [(_TVGridView *)v5 setBackgroundColor:0];
    [(_TVGridView *)v5 setClipsToBounds:0];
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVGridView;
  id v4 = a3;
  [(_TVCollectionView *)&v6 setDelegate:v4];
  char v5 = objc_opt_respondsToSelector();

  self->_delegateRespondsToIndexPathForPreferredFocusedView = v5 & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_TVGridView *)self contentInset];
  -[_TVGridView tv_sizeThatFits:withContentInset:](self, "tv_sizeThatFits:withContentInset:", width, height, v6, v7, v8, v9);
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)tv_sizeThatFits:(CGSize)a3 withContentInset:(UIEdgeInsets)a4
{
  double bottom = a4.bottom;
  double top = a4.top;
  CGFloat width = a3.width;
  double v7 = a3.width - a4.left - a4.right;
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  else {
    double v8 = 0.0;
  }
  double v9 = [(_TVGridView *)self gridFlowLayout];
  [v9 contentHeightThatFitsItemCount:0 expectedWidth:v8];
  double v11 = bottom + top + v10;

  double v12 = width;
  double v13 = v11;
  result.double height = v13;
  result.CGFloat width = v12;
  return result;
}

- (void)setGridFlowLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end