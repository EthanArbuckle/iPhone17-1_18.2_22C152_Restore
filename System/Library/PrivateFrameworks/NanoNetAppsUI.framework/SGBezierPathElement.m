@interface SGBezierPathElement
- (CGPoint)endPoint;
- (CGPoint)pointOnPathForX:(double)a3;
- (CGPoint)points;
- (CGPoint)startPoint;
- (SGBezierPathElement)initWithStartPoint:(CGPoint)a3 pathElement:(const CGPathElement *)a4;
- (double)computeLength;
- (double)length;
- (int)type;
- (unint64_t)numberOfPointsForCGPathElementType:(int)a3;
- (unint64_t)pointCount;
- (void)dealloc;
- (void)setLength:(double)a3;
- (void)setPointCount:(unint64_t)a3;
- (void)setPoints:(CGPoint *)a3;
- (void)setType:(int)a3;
@end

@implementation SGBezierPathElement

- (SGBezierPathElement)initWithStartPoint:(CGPoint)a3 pathElement:(const CGPathElement *)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)SGBezierPathElement;
  v7 = [(SGBezierPathElement *)&v15 init];
  v8 = v7;
  if (v7)
  {
    uint64_t type = a4->type;
    uint64_t v10 = [(SGBezierPathElement *)v7 numberOfPointsForCGPathElementType:type];
    v11 = (CGFloat *)malloc_type_malloc(16 * (v10 + 1), 0x5BACF1ACuLL);
    v12 = v11;
    CGFloat *v11 = x;
    v11[1] = y;
    if (v10) {
      memcpy(v11 + 2, a4->points, 16 * v10);
    }
    [(SGBezierPathElement *)v8 setPoints:v12];
    [(SGBezierPathElement *)v8 setType:type];
    [(SGBezierPathElement *)v8 setPointCount:v10 + 1];
    [(SGBezierPathElement *)v8 computeLength];
    -[SGBezierPathElement setLength:](v8, "setLength:");
    v13 = v8;
  }

  return v8;
}

- (void)dealloc
{
  if ([(SGBezierPathElement *)self points]) {
    free([(SGBezierPathElement *)self points]);
  }
  v3.receiver = self;
  v3.super_class = (Class)SGBezierPathElement;
  [(SGBezierPathElement *)&v3 dealloc];
}

- (CGPoint)startPoint
{
  v2 = [(SGBezierPathElement *)self points];
  double x = v2->x;
  double y = v2->y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  objc_super v3 = [(SGBezierPathElement *)self points];
  v4 = &v3[[(SGBezierPathElement *)self pointCount]];
  double x = v4[-1].x;
  double y = v4[-1].y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)pointOnPathForX:(double)a3
{
  if ([(SGBezierPathElement *)self type] == 3)
  {
    [(SGBezierPathElement *)self startPoint];
    double v8 = v7;
    double v10 = v9;
    [(SGBezierPathElement *)self endPoint];
    double v12 = v11;
    double v14 = v13;
    objc_super v15 = [(SGBezierPathElement *)self points];
    double x = v15[1].x;
    double y = v15[1].y;
    v18 = [(SGBezierPathElement *)self points];
    double v6 = SGComputeCubicBezierYForX(a3, v8, v10, x, y, v18[2].x, v18[2].y, v19, v12, v14);
    double v5 = a3;
  }
  else
  {
    [(SGBezierPathElement *)self endPoint];
  }
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (unint64_t)numberOfPointsForCGPathElementType:(int)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return qword_257345940[a3];
  }
}

- (double)computeLength
{
  int v3 = [(SGBezierPathElement *)self type];
  if (v3 == 3)
  {
    double v13 = [(SGBezierPathElement *)self points];
    CGFloat x = v13[1].x;
    float64_t y = v13[1].y;
    v16 = [(SGBezierPathElement *)self points];
    CGFloat v17 = v16[2].x;
    float64_t v18 = v16[2].y;
    [(SGBezierPathElement *)self startPoint];
    float64_t v20 = v19;
    float64_t v22 = v21;
    [(SGBezierPathElement *)self endPoint];
    v24.f64[0] = v25.f64[0];
    v25.f64[0] = v20;
    v26.f64[0] = x;
    v27.f64[0] = v17;
    return SGComputeCubicBezierLength(v25, v22, v26, y, v27, v18, v24, v23);
  }
  else if (v3 == 1)
  {
    [(SGBezierPathElement *)self startPoint];
    unint64_t v5 = v4;
    unint64_t v7 = v6;
    uint64_t v8 = [(SGBezierPathElement *)self endPoint];
    v9.n128_u64[0] = v11.n128_u64[0];
    v10.n128_u64[0] = v12.n128_u64[0];
    v11.n128_u64[0] = v5;
    v12.n128_u64[0] = v7;
    MEMORY[0x270F82CF0](v8, v11, v12, v9, v10);
  }
  else
  {
    return 0.0;
  }
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

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

@end