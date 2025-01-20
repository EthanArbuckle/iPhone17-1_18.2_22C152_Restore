@interface IPAStraightenOperator
+ (id)operatorWithAngleZ:(double)a3;
+ (id)operatorWithIdentifier:(id)a3 angleZ:(double)a4;
- (id)description;
- (id)transformForGeometry:(id)a3;
@end

@implementation IPAStraightenOperator

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@.%p zAngle:%f>", v5, self, *(void *)&self->_zAngle];

  return v6;
}

- (id)transformForGeometry:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F38A5400])
  {
    id v5 = v4;
    v6 = v5;
    double zAngle = self->_zAngle;
    if (zAngle == 0.0)
    {
      memset(&v34[8], 0, 32);
      long long v35 = 0u;
      float64x2_t v36 = 0u;
      memset(&v37[8], 0, 32);
      *(void *)v34 = 0x3FF0000000000000;
      *(void *)&v34[40] = 0x3FF0000000000000;
      *(void *)v37 = 0x3FF0000000000000;
      *(void *)&v37[40] = 0x3FF0000000000000;
      v8 = (IPAImageGeometry *)v5;
    }
    else
    {
      if (v5) {
        [v5 imageQuad];
      }
      else {
        memset(v33, 0, sizeof(v33));
      }
      *(void *)&long long v9 = PA::Quad2d::areaCenter(v33);
      double v11 = v10;
      v26[2] = 0x3FF0000000000000;
      *(void *)v27 = 0x3FF0000000000000;
      memset(&v27[8], 0, 32);
      *(void *)&v27[40] = 0x3FF0000000000000;
      long long v28 = 0u;
      float64x2_t v29 = 0u;
      long long v30 = xmmword_1DD424080;
      *(void *)&v31.f64[0] = v9;
      v31.f64[1] = v10;
      long long v32 = xmmword_1DD424090;
      v26[0] = 0;
      v26[1] = 0;
      long long v25 = v9;
      PA::Matrix4d::rotateAxis((long long *)v27, (uint64_t)v26, self->_zAngle);
      float64x2_t v31 = vaddq_f64(v31, vmlaq_f64(vmlsq_lane_f64(vmulq_n_f64(*(float64x2_t *)&v27[32], -v11), *(float64x2_t *)v27, *(double *)&v25, 0), (float64x2_t)0, v29));
      *(double *)&long long v32 = *(double *)&v32
                      + -(v11 * *(double *)&v28)
                      - *(double *)&v27[16] * *(double *)&v25
                      + *(double *)&v30 * 0.0;
      float64x2_t v36 = v29;
      *(_OWORD *)v37 = v30;
      *(_OWORD *)v34 = *(_OWORD *)v27;
      *(_OWORD *)&v34[16] = *(_OWORD *)&v27[16];
      *(_OWORD *)&v34[32] = *(_OWORD *)&v27[32];
      long long v35 = v28;
      *(float64x2_t *)&v37[16] = v31;
      *(_OWORD *)&v37[32] = v32;
      PA::operator*((uint64_t)v27, (double *)v34, (long long *)v33);
      [v6 domain];
      double v13 = v12;
      double v15 = v14;
      PA::Quad2d::boundingRect((float64x2_t *)v27);
      double v17 = v16;
      double v19 = v18;
      v20 = [IPAImageGeometry alloc];
      double v21 = v13 / v17;
      if (v15 / v19 < v13 / v17) {
        double v21 = v15 / v19;
      }
      v8 = [(IPAImageGeometry *)v20 initWithIdentifier:@"straightened", v27, (v13 - v13 * v21) * 0.5, (v15 - v15 * v21) * 0.5, v25 extent imageQuad];
    }
    v22 = v8;
    v23 = [[IPAAffineImageTransform alloc] initWithInputGeometry:v6 intrinsicGeometry:v8 matrix:v34 canAlignToPixelsExactly:zAngle == 0.0];

    return v23;
  }
  else
  {
    id result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

+ (id)operatorWithIdentifier:(id)a3 angleZ:(double)a4
{
  id v5 = a3;
  if (a4 < -0.785398163 || a4 > 0.785398163)
  {
    id result = (id)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    v6 = [(IPAGeometryOperator *)[IPAStraightenOperator alloc] initWithIdentifier:v5];
    v7 = v6;
    double v8 = 0.0;
    if (fabs(a4) >= 0.0001) {
      double v8 = a4;
    }
    v6->_double zAngle = v8;

    return v7;
  }
  return result;
}

+ (id)operatorWithAngleZ:(double)a3
{
  return (id)[a1 operatorWithIdentifier:@"straighten" angleZ:a3];
}

@end