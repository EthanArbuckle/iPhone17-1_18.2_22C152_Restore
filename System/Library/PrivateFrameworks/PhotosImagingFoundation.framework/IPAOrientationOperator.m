@interface IPAOrientationOperator
+ (id)operatorWithIdentifier:(id)a3 orientation:(int64_t)a4;
+ (id)operatorWithOrientation:(int64_t)a3;
- (id)description;
- (id)transformForGeometry:(id)a3;
@end

@implementation IPAOrientationOperator

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t orientation = self->_orientation;
  if ((unint64_t)(orientation - 1) >= 8) {
    int64_t orientation = 0;
  }
  v7 = IPAOrientationName_names[orientation];
  v8 = [v3 stringWithFormat:@"<%@.%p orientation:%@>", v5, self, v7];

  return v8;
}

- (id)transformForGeometry:(id)a3
{
  id v4 = a3;
  [v4 extent];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  IPAOrientationMakeTransformWithSize(self->_orientation, (uint64_t)&v37, v9, v11);
  long long v28 = v37;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  long long v31 = v38;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = xmmword_1DD424080;
  long long v35 = v39;
  long long v36 = xmmword_1DD424090;
  *(double *)&long long v21 = v6;
  *((double *)&v21 + 1) = v8;
  double v22 = v6 + v10;
  double v23 = v8;
  double v24 = v6;
  double v25 = v8 + v12;
  double v26 = v6 + v10;
  double v27 = v8 + v12;
  PA::operator*((uint64_t)v20, (double *)&v28, &v21);
  double v13 = PA::Quad2d::boundingRect(v20);
  v17 = [[IPAImageGeometry alloc] initWithIdentifier:@"oriented", v13, v14, v15, v16 extent];
  v18 = [[IPAAffineImageTransform alloc] initWithInputGeometry:v4 intrinsicGeometry:v17 matrix:&v28 canAlignToPixelsExactly:1];

  return v18;
}

+ (id)operatorWithIdentifier:(id)a3 orientation:(int64_t)a4
{
  id v5 = a3;
  if (a4)
  {
    double v6 = [(IPAGeometryOperator *)[IPAOrientationOperator alloc] initWithIdentifier:v5];
    v6->_int64_t orientation = a4;

    return v6;
  }
  else
  {
    id result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

+ (id)operatorWithOrientation:(int64_t)a3
{
  return (id)[a1 operatorWithIdentifier:@"orientation" orientation:a3];
}

@end