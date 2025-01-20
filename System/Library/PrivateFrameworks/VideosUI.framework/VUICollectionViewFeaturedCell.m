@interface VUICollectionViewFeaturedCell
+ (double)_iOSLockupWidthWithWindowWidth:(double)result safeAreaInsets:(UIEdgeInsets)a4 showsPageControl:(BOOL)a5;
- (VUICollectionViewFeaturedCell)initWithFrame:(CGRect)a3;
- (VUICollectionViewFeaturedView)featuredView;
- (void)_commonInitWithFrame:(CGRect)a3;
- (void)setFeaturedView:(id)a3;
@end

@implementation VUICollectionViewFeaturedCell

+ (double)_iOSLockupWidthWithWindowWidth:(double)result safeAreaInsets:(UIEdgeInsets)a4 showsPageControl:(BOOL)a5
{
  if (!a5) {
    return result - a4.left * 0.5 - a4.right * 0.5;
  }
  return result;
}

- (VUICollectionViewFeaturedCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)VUICollectionViewFeaturedCell;
  v7 = -[VUIBaseCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_);
  v8 = v7;
  if (v7) {
    -[VUICollectionViewFeaturedCell _commonInitWithFrame:](v7, "_commonInitWithFrame:", x, y, width, height);
  }
  return v8;
}

- (void)_commonInitWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = [VUICollectionViewFeaturedView alloc];
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  objc_super v10 = -[VUICollectionViewFeaturedView initWithFrame:](v8, "initWithFrame:", 0.0, 0.0, v9, CGRectGetHeight(v15));
  featuredView = self->_featuredView;
  self->_featuredView = v10;

  [(VUICollectionViewFeaturedView *)self->_featuredView setTranslatesAutoresizingMaskIntoConstraints:1];
  [(VUICollectionViewFeaturedView *)self->_featuredView setAutoresizingMask:18];
  id v12 = [(VUIBaseCollectionViewCell *)self vuiContentView];
  objc_msgSend(v12, "vui_addSubview:oldView:", self->_featuredView, 0);
}

- (VUICollectionViewFeaturedView)featuredView
{
  return self->_featuredView;
}

- (void)setFeaturedView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end