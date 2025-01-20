@interface NTKSolarPath
- (BOOL)verticallyFitsPathToBounds;
- (CGRect)bounds;
- (NTKSolarPath)initWithBounds:(CGRect)a3 solarTimeModel:(id)a4 verticallyFitsPathToBounds:(BOOL)a5 usePlaceholderData:(BOOL)a6;
- (NTKSolarTimeModel)solarTimeModel;
- (UIBezierPath)bezierPath;
- (double)altitudeAtPercentage:(double)a3;
- (double)altitudeAtX:(double)a3;
- (id)_computeSolarPath;
@end

@implementation NTKSolarPath

- (NTKSolarPath)initWithBounds:(CGRect)a3 solarTimeModel:(id)a4 verticallyFitsPathToBounds:(BOOL)a5 usePlaceholderData:(BOOL)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NTKSolarPath;
  v15 = [(NTKSolarPath *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_bounds.origin.CGFloat x = x;
    v15->_bounds.origin.CGFloat y = y;
    v15->_bounds.size.CGFloat width = width;
    v15->_bounds.size.CGFloat height = height;
    objc_storeStrong((id *)&v15->_solarTimeModel, a4);
    v16->_verticallyFitsPathToBounds = a5;
    v16->_usePlaceholderData = a6;
    uint64_t v17 = [(NTKSolarPath *)v16 _computeSolarPath];
    bezierPath = v16->_bezierPath;
    v16->_bezierPath = (UIBezierPath *)v17;
  }
  return v16;
}

- (id)_computeSolarPath
{
  [(NTKSolarTimeModel *)self->_solarTimeModel effectiveSolarDayLength];
  double v4 = v3;
  v5 = [(NTKSolarTimeModel *)self->_solarTimeModel localSolarMidnightDate];
  v6 = [(NTKSolarTimeModel *)self->_solarTimeModel referenceLocation];
  [v6 coordinate];
  double v36 = v7;
  [v6 coordinate];
  double v35 = v8;
  uint64_t v9 = 0;
  double width = self->_bounds.size.width;
  double v11 = self->_bounds.size.height * 0.5;
  double v12 = -v11;
  double v13 = 1.17549435e-38;
  double v14 = 3.40282347e38;
  uint64_t v15 = 8;
  do
  {
    double v16 = (double)((int)v9 - 3) / 24.0;
    uint64_t v17 = [v5 dateByAddingTimeInterval:v4 * v16];
    if (self->_usePlaceholderData)
    {
      float v18 = v16 * 6.28318531 + -1.57079633;
      float v19 = sinf(v18);
      *(double *)&(&self->_bezierPath)[v15] = v11 + v12 * v19;
      self->_altitude[v9] = (float)(v19 * 30.0);
    }
    else
    {
      objc_super v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645D8]), "initWithLocation:date:body:", v17, 0, v36, v35);
      [v20 altitude];
      *(float *)&double v21 = v21 * 0.0174532924;
      *(double *)&(&self->_bezierPath)[v15] = v11 + v12 * sinf(*(float *)&v21);
      [v20 altitude];
      self->_altitude[v9] = v22;
    }
    *(double *)((char *)&self->super.isa + v15 * 8) = width * v16;
    v23 = (&self->_bezierPath)[v15];
    if (v14 > *(double *)&v23) {
      double v14 = *(double *)&(&self->_bezierPath)[v15];
    }
    if (v13 < *(double *)&v23) {
      double v13 = *(double *)&(&self->_bezierPath)[v15];
    }

    ++v9;
    v15 += 2;
  }
  while (v9 != 29);
  if (self->_verticallyFitsPathToBounds)
  {
    uint64_t v24 = 0;
    double v25 = self->_bounds.size.height / (v13 - v14);
    do
    {
      self->_points[v24].CGFloat y = v25 * (self->_points[v24].y - v14);
      ++v24;
    }
    while (v24 != 29);
  }
  v26 = [MEMORY[0x1E4FB14C0] bezierPath];
  objc_msgSend(v26, "moveToPoint:", self->_points[3].x, self->_points[3].y);
  uint64_t v27 = 0;
  v28 = &self->_points[5];
  __asm { FMOV            V0.2D, #6.0 }
  float64x2_t v37 = _Q0;
  do
  {
    objc_msgSend(v26, "addCurveToPoint:controlPoint1:controlPoint2:", v28[v27 - 1].x, v28[v27 - 1].y, vaddq_f64((float64x2_t)v28[v27 - 2], vdivq_f64(vsubq_f64((float64x2_t)v28[v27 - 1], (float64x2_t)v28[v27 - 3]), v37)), vaddq_f64((float64x2_t)v28[v27 - 1], vdivq_f64(vsubq_f64((float64x2_t)v28[v27 - 2], (float64x2_t)v28[v27]), v37)));
    ++v27;
  }
  while (v27 != 24);

  return v26;
}

- (double)altitudeAtPercentage:(double)a3
{
  [(NTKSolarPath *)self altitudeAtX:self->_bounds.size.width * a3];
  return result;
}

- (double)altitudeAtX:(double)a3
{
  uint64_t v3 = 0;
  points = self->_points;
  altitude = self->_altitude;
  while (v3 != 28)
  {
    double x = points[v3].x;
    double v7 = points[v3 + 1].x;
    ++altitude;
    ++v3;
    if (x <= a3 && v7 >= a3)
    {
      CLKInterpolateBetweenFloatsClipped();
      return result;
    }
  }
  return 0.0;
}

- (UIBezierPath)bezierPath
{
  return self->_bezierPath;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NTKSolarTimeModel)solarTimeModel
{
  return self->_solarTimeModel;
}

- (BOOL)verticallyFitsPathToBounds
{
  return self->_verticallyFitsPathToBounds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solarTimeModel, 0);
  objc_storeStrong((id *)&self->_bezierPath, 0);
}

@end