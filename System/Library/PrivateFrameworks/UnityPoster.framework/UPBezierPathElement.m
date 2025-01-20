@interface UPBezierPathElement
- (CGPoint)endPoint;
- (CGPoint)points;
- (CGPoint)startPoint;
- (UPBezierPathElement)initWithStartPoint:(CGPoint)a3 pathElement:(const CGPathElement *)a4;
- (int)type;
- (uint64_t)numberOfPointsForCGPathElementType:(uint64_t)a1;
- (unint64_t)pointCount;
- (void)dealloc;
- (void)setPointCount:(unint64_t)a3;
- (void)setPoints:(CGPoint *)a3;
- (void)setType:(int)a3;
@end

@implementation UPBezierPathElement

- (UPBezierPathElement)initWithStartPoint:(CGPoint)a3 pathElement:(const CGPathElement *)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v18.receiver = self;
  v18.super_class = (Class)UPBezierPathElement;
  v7 = [(UPBezierPathElement *)&v18 init];
  if (v7)
  {
    uint64_t type = a4->type;
    uint64_t v9 = 3;
    uint64_t v10 = 2;
    BOOL v11 = type != 2;
    if (type != 2) {
      uint64_t v10 = 0;
    }
    if (type == 3) {
      BOOL v11 = 0;
    }
    else {
      uint64_t v9 = v10;
    }
    BOOL v12 = type >= 2 && v11;
    if (type >= 2) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = 1;
    }
    v14 = (CGFloat *)malloc_type_malloc(16 * (v13 + 1), 0xC8931B9CuLL);
    v15 = v14;
    CGFloat *v14 = x;
    v14[1] = y;
    if (!v12) {
      memcpy(v14 + 2, a4->points, 16 * v13);
    }
    [(UPBezierPathElement *)v7 setPoints:v15];
    [(UPBezierPathElement *)v7 setType:type];
    [(UPBezierPathElement *)v7 setPointCount:v13 + 1];
    v16 = v7;
  }

  return v7;
}

- (uint64_t)numberOfPointsForCGPathElementType:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1)
  {
    if (a2 <= 3) {
      return qword_2352C31C0[a2];
    }
  }
  return result;
}

- (void)dealloc
{
  if ([(UPBezierPathElement *)self points]) {
    free([(UPBezierPathElement *)self points]);
  }
  v3.receiver = self;
  v3.super_class = (Class)UPBezierPathElement;
  [(UPBezierPathElement *)&v3 dealloc];
}

- (CGPoint)startPoint
{
  v2 = [(UPBezierPathElement *)self points];
  double x = v2->x;
  double y = v2->y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  objc_super v3 = [(UPBezierPathElement *)self points];
  v4 = &v3[[(UPBezierPathElement *)self pointCount]];
  double x = v4[-1].x;
  double y = v4[-1].y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (unint64_t)pointCount
{
  return self->_pointCount;
}

- (void)setPointCount:(unint64_t)a3
{
  self->_pointCount = a3;
}

- (CGPoint)points
{
  return self->_points;
}

- (void)setPoints:(CGPoint *)a3
{
  self->_points = a3;
}

@end