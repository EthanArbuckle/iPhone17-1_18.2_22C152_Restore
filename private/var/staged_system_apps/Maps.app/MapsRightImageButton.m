@interface MapsRightImageButton
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
@end

@implementation MapsRightImageButton

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MapsRightImageButton;
  -[MapsRightImageButton titleRectForContentRect:](&v17, "titleRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(MapsRightImageButton *)self bounds];
  double MaxX = CGRectGetMaxX(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  double v13 = MaxX - CGRectGetMaxX(v19);
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MapsRightImageButton;
  -[MapsRightImageButton imageRectForContentRect:](&v17, "imageRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(MapsRightImageButton *)self bounds];
  double MaxX = CGRectGetMaxX(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  double v13 = MaxX - CGRectGetMaxX(v19);
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

@end