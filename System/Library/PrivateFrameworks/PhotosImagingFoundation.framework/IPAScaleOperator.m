@interface IPAScaleOperator
+ (id)operatorWithIdentifier:(id)a3 scaleX:(double)a4 Y:(double)a5;
+ (id)operatorWithScaleX:(double)a3 Y:(double)a4;
- (id)description;
- (id)transformForGeometry:(id)a3;
@end

@implementation IPAScaleOperator

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@.%p xScale:%f yScale:%f>", v5, self, *(void *)&self->_xScale, *(void *)&self->_yScale];

  return v6;
}

- (id)transformForGeometry:(id)a3
{
  id v4 = a3;
  v5 = v4;
  double xScale = self->_xScale;
  double yScale = self->_yScale;
  BOOL v8 = yScale == 1.0 && xScale == 1.0;
  if (v8)
  {
    v9 = (IPAImageGeometry *)v4;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v28 = 0x3FF0000000000000;
    uint64_t v31 = 0x3FF0000000000000;
    uint64_t v34 = 0x3FF0000000000000;
    uint64_t v37 = 0x3FF0000000000000;
  }
  else
  {
    objc_msgSend(v4, "extent", *(void *)&xScale, 0, 0, 0, 0, *(void *)&yScale, 0, 0, 0, 0, 0x3FF0000000000000, 0, 0, 0, 0, 0x3FF0000000000000);
    double v10 = self->_xScale;
    double v11 = self->_yScale;
    v39.origin.double x = v12 * v10;
    v39.origin.double y = v13 * v11;
    v39.size.double width = v14 * v10;
    v39.size.double height = v15 * v11;
    CGRect v40 = CGRectStandardize(v39);
    double x = v40.origin.x;
    double y = v40.origin.y;
    double width = v40.size.width;
    double height = v40.size.height;
    [v5 domain];
    double v20 = self->_xScale;
    double v21 = self->_yScale;
    v41.origin.double x = v22 * v20;
    v41.origin.double y = v23 * v21;
    v41.size.double width = v24 * v20;
    v41.size.double height = v25 * v21;
    CGRect v42 = CGRectStandardize(v41);
    v9 = [[IPAImageGeometry alloc] initWithIdentifier:@"scaled", x, y, width, height, v42.origin.x, v42.origin.y, v42.size.width, v42.size.height extent domain];
  }
  v26 = [[IPAAffineImageTransform alloc] initWithInputGeometry:v5 intrinsicGeometry:v9 matrix:&v28 canAlignToPixelsExactly:v8];

  return v26;
}

+ (id)operatorWithIdentifier:(id)a3 scaleX:(double)a4 Y:(double)a5
{
  id v7 = a3;
  if (a4 <= 0.0 || a5 <= 0.0)
  {
    id result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    BOOL v8 = [(IPAGeometryOperator *)[IPAScaleOperator alloc] initWithIdentifier:v7];
    v8->_double xScale = a4;
    v8->_double yScale = a5;

    return v8;
  }
  return result;
}

+ (id)operatorWithScaleX:(double)a3 Y:(double)a4
{
  return (id)[a1 operatorWithIdentifier:@"scale" scaleX:a3 Y:a4];
}

@end