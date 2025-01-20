@interface TUIHostingGeometry
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGeometry:(id)a3;
- (CGSize)layoutSize;
- (CGSize)requestedSize;
- (TUIHostingGeometry)initWithRequestedSize:(CGSize)a3 layoutSize:(CGSize)a4 erasableInsets:(UIEdgeInsets)a5;
- (UIEdgeInsets)erasableInsets;
- (id)description;
@end

@implementation TUIHostingGeometry

- (TUIHostingGeometry)initWithRequestedSize:(CGSize)a3 layoutSize:(CGSize)a4 erasableInsets:(UIEdgeInsets)a5
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v11 = a3.height;
  CGFloat v12 = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)TUIHostingGeometry;
  result = [(TUIHostingGeometry *)&v14 init];
  if (result)
  {
    result->_requestedSize.CGFloat width = v12;
    result->_requestedSize.CGFloat height = v11;
    result->_layoutSize.CGFloat width = width;
    result->_layoutSize.CGFloat height = height;
    result->_erasableInsets.CGFloat top = top;
    result->_erasableInsets.CGFloat left = left;
    result->_erasableInsets.CGFloat bottom = bottom;
    result->_erasableInsets.CGFloat right = right;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class() || v4 == 0) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = [(TUIHostingGeometry *)self isEqualToGeometry:v4];
  }

  return v7;
}

- (BOOL)isEqualToGeometry:(id)a3
{
  id v4 = a3;
  [v4 requestedSize];
  BOOL v7 = self->_requestedSize.width == v6 && self->_requestedSize.height == v5;
  if (v7
    && (([v4 layoutSize], self->_layoutSize.width == v9)
      ? (BOOL v10 = self->_layoutSize.height == v8)
      : (BOOL v10 = 0),
        v10))
  {
    [v4 erasableInsets];
    BOOL v15 = self->_erasableInsets.left == v14;
    if (self->_erasableInsets.top != v16) {
      BOOL v15 = 0;
    }
    if (self->_erasableInsets.right != v13) {
      BOOL v15 = 0;
    }
    BOOL v11 = self->_erasableInsets.bottom == v12 && v15;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  double v5 = NSStringFromCGSize(self->_requestedSize);
  double v6 = NSStringFromCGSize(self->_layoutSize);
  BOOL v7 = NSStringFromUIEdgeInsets(self->_erasableInsets);
  double v8 = +[NSString stringWithFormat:@"<%@ %p requestedSize=%@ layoutSize=%@ erasableInsets=%@>", v4, self, v5, v6, v7];

  return v8;
}

- (CGSize)requestedSize
{
  double width = self->_requestedSize.width;
  double height = self->_requestedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)layoutSize
{
  double width = self->_layoutSize.width;
  double height = self->_layoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)erasableInsets
{
  double top = self->_erasableInsets.top;
  double left = self->_erasableInsets.left;
  double bottom = self->_erasableInsets.bottom;
  double right = self->_erasableInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end