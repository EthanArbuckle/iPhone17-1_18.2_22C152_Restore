@interface IPACropOperator
+ (id)operatorWithCropRect:(CGRect)a3;
+ (id)operatorWithIdentifier:(id)a3 cropRect:(CGRect)a4;
- (id)description;
- (id)transformForGeometry:(id)a3;
@end

@implementation IPACropOperator

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromRect(self->_cropRect);
  v7 = [v3 stringWithFormat:@"<%@.%p cropRect:%@>", v5, self, v6];

  return v7;
}

- (id)transformForGeometry:(id)a3
{
  id v4 = a3;
  [v4 domain];
  p_cropRect = &self->_cropRect;
  if (v5 + p_cropRect->origin.x >= v5) {
    double v10 = v5 + p_cropRect->origin.x;
  }
  else {
    double v10 = v5;
  }
  if (v6 + p_cropRect->origin.y >= v6) {
    double v11 = v6 + p_cropRect->origin.y;
  }
  else {
    double v11 = v6;
  }
  double v12 = v5 + v7;
  if (p_cropRect->size.width + v10 <= v12) {
    double width = p_cropRect->size.width;
  }
  else {
    double width = v12 - v10;
  }
  double v14 = v6 + v8;
  if (p_cropRect->size.height + v11 <= v14) {
    double height = p_cropRect->size.height;
  }
  else {
    double height = v14 - v11;
  }
  double v16 = v10;
  double v17 = v11;
  double v18 = width;
  if (CGRectIsEmpty(*(CGRect *)(&height - 3)))
  {
    id result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    uint64_t v22 = 0x3FF0000000000000;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v25 = 0x3FF0000000000000;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = xmmword_1DD424080;
    double v29 = -v10;
    double v30 = -v11;
    long long v31 = xmmword_1DD424090;
    v19 = [[IPAImageGeometry alloc] initWithIdentifier:@"cropped", 0.0, 0.0, width, p_cropRect->size.width extent];
    v20 = [[IPAAffineImageTransform alloc] initWithInputGeometry:v4 intrinsicGeometry:v19 matrix:&v22 canAlignToPixelsExactly:1];

    return v20;
  }
  return result;
}

+ (id)operatorWithIdentifier:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  if (CGRectIsEmpty(v12))
  {
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    NSStringFromRect(v13);
    objc_claimAutoreleasedReturnValue();
    id result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    v9 = [(IPAGeometryOperator *)[IPACropOperator alloc] initWithIdentifier:v8];
    v9->_cropRect.origin.CGFloat x = x;
    v9->_cropRect.origin.CGFloat y = y;
    v9->_cropRect.size.CGFloat width = width;
    v9->_cropRect.size.CGFloat height = height;

    return v9;
  }
  return result;
}

+ (id)operatorWithCropRect:(CGRect)a3
{
  return (id)objc_msgSend(a1, "operatorWithIdentifier:cropRect:", @"crop", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end