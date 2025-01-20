@interface PTTapToTrackPrediction
- (CGRect)rect;
- (PTTapToTrackPrediction)initWithRect:(CGRect)a3 confidence:(float)a4;
- (float)confidence;
- (void)setConfidence:(float)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation PTTapToTrackPrediction

- (PTTapToTrackPrediction)initWithRect:(CGRect)a3 confidence:(float)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PTTapToTrackPrediction;
  v9 = [(PTTapToTrackPrediction *)&v13 init];
  v10 = v9;
  if (v9)
  {
    -[PTTapToTrackPrediction setRect:](v9, "setRect:", x, y, width, height);
    *(float *)&double v11 = a4;
    [(PTTapToTrackPrediction *)v10 setConfidence:v11];
  }
  return v10;
}

- (CGRect)rect
{
  objc_copyStruct(v6, &self->_rect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_rect, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end