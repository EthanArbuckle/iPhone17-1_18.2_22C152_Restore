@interface TSDContentLocation
+ (id)contentLocation;
+ (id)contentLocationInterpolatingFromLocation:(id)a3 toLocation:(id)a4 fraction:(double)a5;
+ (id)contentLocationWithUnscaledPoint:(CGPoint)a3 viewScale:(double)a4;
- (CGPoint)unscaledPoint;
- (double)viewScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setUnscaledPoint:(CGPoint)a3;
- (void)setViewScale:(double)a3;
@end

@implementation TSDContentLocation

+ (id)contentLocation
{
  v2 = objc_alloc_init(TSDContentLocation);

  return v2;
}

+ (id)contentLocationWithUnscaledPoint:(CGPoint)a3 viewScale:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = objc_alloc_init(TSDContentLocation);
  -[TSDContentLocation setUnscaledPoint:](v7, "setUnscaledPoint:", x, y);
  [(TSDContentLocation *)v7 setViewScale:a4];

  return v7;
}

+ (id)contentLocationInterpolatingFromLocation:(id)a3 toLocation:(id)a4 fraction:(double)a5
{
  v8 = objc_alloc_init(TSDContentLocation);
  [a3 unscaledPoint];
  double v10 = v9;
  double v12 = v11;
  [a4 unscaledPoint];
  [(TSDContentLocation *)v8 setUnscaledPoint:TSDInterpolatePoints(v10, v12, v13, v14, a5)];
  [a3 viewScale];
  double v16 = v15;
  [a4 viewScale];
  [(TSDContentLocation *)v8 setViewScale:TSDInterpolateFloats(v16, v17, a5)];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TSDContentLocation allocWithZone:a3] init];
  -[TSDContentLocation setUnscaledPoint:](v4, "setUnscaledPoint:", self->_unscaledPoint.x, self->_unscaledPoint.y);
  [(TSDContentLocation *)v4 setViewScale:self->_viewScale];
  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)[v3 stringWithFormat:@"<%@ %p unscaledPoint=%@ viewScale=%f>", v5, self, NSStringFromCGPoint(self->_unscaledPoint), *(void *)&self->_viewScale];
}

- (CGPoint)unscaledPoint
{
  double x = self->_unscaledPoint.x;
  double y = self->_unscaledPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setUnscaledPoint:(CGPoint)a3
{
  self->_unscaledPoint = a3;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

@end