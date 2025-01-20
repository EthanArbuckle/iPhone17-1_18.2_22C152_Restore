@interface TSDPathIntersection
- (CGPoint)point;
- (TSDPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 atPoint:(CGPoint)a5;
- (TSDPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 onSegmentB:(int64_t)a5 atT:(double)a6 atPoint:(CGPoint)a7;
- (double)t;
- (double)tB;
- (id)description;
- (int64_t)compareSegmentAndT:(id)a3;
- (int64_t)compareT:(id)a3;
- (int64_t)segment;
- (int64_t)segmentB;
- (void)setPoint:(CGPoint)a3;
@end

@implementation TSDPathIntersection

- (TSDPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 atPoint:(CGPoint)a5
{
  return -[TSDPathIntersection initWithSegment:atT:onSegmentB:atT:atPoint:](self, "initWithSegment:atT:onSegmentB:atT:atPoint:", a3, 0, a4, 0.0, a5.x, a5.y);
}

- (TSDPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 onSegmentB:(int64_t)a5 atT:(double)a6 atPoint:(CGPoint)a7
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  v14.receiver = self;
  v14.super_class = (Class)TSDPathIntersection;
  result = [(TSDPathIntersection *)&v14 init];
  if (result)
  {
    result->mPoint.CGFloat x = x;
    result->mPoint.CGFloat y = y;
    result->mSegment = a3;
    result->mSegmentB = a5;
    result->mT = a4;
    result->mTB = a6;
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(A:(%ld, %.2f) B:(%ld, %.2f) @:(%.2f, %.2f))", self->mSegment, *(void *)&self->mT, self->mSegmentB, *(void *)&self->mTB, *(void *)&self->mPoint.x, *(void *)&self->mPoint.y];
}

- (int64_t)compareSegmentAndT:(id)a3
{
  int64_t v5 = [(TSDPathIntersection *)self segment];
  uint64_t v6 = [a3 segment];
  if (v5 < v6) {
    return -1;
  }
  if (v5 > v6) {
    return 1;
  }

  return [(TSDPathIntersection *)self compareT:a3];
}

- (int64_t)compareT:(id)a3
{
  [(TSDPathIntersection *)self t];
  double v5 = v4;
  [a3 t];
  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (int64_t)segment
{
  return self->mSegment;
}

- (double)t
{
  return self->mT;
}

- (CGPoint)point
{
  double x = self->mPoint.x;
  double y = self->mPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->mPoint = a3;
}

- (int64_t)segmentB
{
  return self->mSegmentB;
}

- (double)tB
{
  return self->mTB;
}

@end