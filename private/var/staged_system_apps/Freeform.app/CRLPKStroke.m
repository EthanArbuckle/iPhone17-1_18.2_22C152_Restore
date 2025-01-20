@interface CRLPKStroke
- (BOOL)_inflight;
- (BOOL)_isClipped;
- (BOOL)_isHidden;
- (BOOL)_shouldSolveMath;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)_transform;
- (CGPath)newPathRepresentation;
- (CGPoint)_clipNormal;
- (CGPoint)_clipOrigin;
- (CGPoint)_interpolatedPointForSplineSegment:(int64_t)a3 t:(double)a4;
- (CGPoint)_splineControlPoint:(int64_t)a3;
- (CGPoint)clipNormal;
- (CGPoint)clipOrigin;
- (CGRect)_bounds;
- (CRLPKCompressedStrokePoint)_completedPoints;
- (CRLPKStroke)init;
- (CRLPKStroke)initWithStroke:(id)a3 hidden:(BOOL)a4 version:(_CRLPKStrokeID *)a5;
- (CRLPKStroke)initWithStroke:(id)a3 hidden:(BOOL)a4 version:(_CRLPKStrokeID *)a5 transform:(CGAffineTransform *)a6;
- (CRLPKStroke)initWithStroke:(id)a3 points:(CRLPKCompressedStrokePoint *)a4 count:(unint64_t)a5 copy:(BOOL)a6;
- (_CRLPKInflightStrokePoint)_inflightPoints;
- (_CRLPKStrokeID)_strokeID;
- (_CRLPKStrokeID)_version;
- (_CRLPKStrokePoint)_baseValues;
- (double)_interpolatedTimeForSplineSegment:(int64_t)a3 t:(double)a4;
- (double)_lengthOfSplineSegment:(unint64_t)a3;
- (double)_renderCost;
- (double)_strokeLength;
- (double)timestamp;
- (id)_strokeData;
- (id)description;
- (id)descriptionExtended;
- (id)p_points;
- (int64_t)_inputType;
- (int64_t)compareToStroke:(id)a3;
- (unint64_t)_pointsCount;
- (unint64_t)hash;
- (unsigned)_randomSeed;
- (void)_addStrokePoint:(void *)a3;
- (void)_applyTransform:(CGAffineTransform *)a3;
- (void)_insertStrokePoint:(void *)a3 atIndex:(unint64_t)a4;
- (void)_invalidateBounds;
- (void)_points;
- (void)_removeLastStrokePoint;
- (void)_removeStrokePointAtIndex:(unint64_t)a3;
- (void)_replaceStrokePointAtIndex:(unint64_t)a3 withStrokePoint:(void *)a4;
- (void)_setBaseValues:(_CRLPKStrokePoint *)a3;
- (void)_setClipNormal:(CGPoint)a3;
- (void)_setClipOrigin:(CGPoint)a3;
- (void)_setInputType:(int64_t)a3;
- (void)_setIsClipped:(BOOL)a3;
- (void)_setPoints:(CRLPKCompressedStrokePoint *)a3 count:(unint64_t)a4 copy:(BOOL)a5;
- (void)_setShouldSolveMath:(BOOL)a3;
- (void)_setStrokeID:(_CRLPKStrokeID *)a3;
- (void)_setTransform:(CGAffineTransform *)a3;
- (void)_strokePointAtIndex:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)set_bounds:(CGRect)a3;
- (void)set_hidden:(BOOL)a3;
- (void)set_inflight:(BOOL)a3;
- (void)set_version:(_CRLPKStrokeID *)a3;
@end

@implementation CRLPKStroke

- (CRLPKStroke)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRLPKStroke;
  v2 = [(CRLPKStroke *)&v8 init];
  v2->_inflight = 1;
  v2->_inputType = 1;
  v3 = objc_alloc_init(_CRLPKStrokeData);
  strokeData = v2->_strokeData;
  v2->_strokeData = v3;

  CGSize size = CGRectNull.size;
  v2->_bounds.origin = CGRectNull.origin;
  v2->_bounds.CGSize size = size;
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v2->_transform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v2->_transform.c = v6;
  *(_OWORD *)&v2->_transform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return v2;
}

- (CRLPKStroke)initWithStroke:(id)a3 points:(CRLPKCompressedStrokePoint *)a4 count:(unint64_t)a5 copy:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = [v10 _isHidden];
  if (v10) {
    [v10 _version];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  v12 = [(CRLPKStroke *)self initWithStroke:v10 hidden:v11 version:v16];
  v13 = [[_CRLPKStrokeData alloc] initWithPoints:a4 count:a5 copy:v6];
  strokeData = v12->_strokeData;
  v12->_strokeData = v13;

  v12->_inputType = (int64_t)[v10 _inputType];
  return v12;
}

- (CRLPKStroke)initWithStroke:(id)a3 hidden:(BOOL)a4 version:(_CRLPKStrokeID *)a5
{
  _CRLPKStrokeID v8 = *a5;
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v7[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [(CRLPKStroke *)self initWithStroke:a3 hidden:a4 version:&v8 transform:v7];
}

- (CRLPKStroke)initWithStroke:(id)a3 hidden:(BOOL)a4 version:(_CRLPKStrokeID *)a5 transform:(CGAffineTransform *)a6
{
  id v10 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRLPKStroke;
  id v11 = [(CRLPKStroke *)&v23 init];
  v11[233] = 0;
  *((void *)v11 + 31) = [v10 _inputType];
  v11[232] = a4;
  long long v12 = *(_OWORD *)&a5->clock;
  *((void *)v11 + 34) = *(void *)&a5->replicaUUID[12];
  *((_OWORD *)v11 + 16) = v12;
  if (v10)
  {
    [v10 _strokeID];
    *(_OWORD *)(v11 + 24) = v24;
    *((void *)v11 + 5) = v25;
    [v10 _baseValues];
  }
  else
  {
    *((void *)v11 + 3) = 0;
    *((void *)v11 + 4) = 0;
    *((void *)v11 + 5) = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
  }
  long long v14 = v27;
  long long v13 = v28;
  *((_OWORD *)v11 + 5) = v26;
  *((_OWORD *)v11 + 6) = v14;
  *((_OWORD *)v11 + 7) = v13;
  long long v15 = v25;
  *((_OWORD *)v11 + 3) = v24;
  *((_OWORD *)v11 + 4) = v15;
  uint64_t v16 = [v10 _strokeData];
  v17 = (void *)*((void *)v11 + 1);
  *((void *)v11 + 1) = v16;

  CGSize size = CGRectNull.size;
  *(CGPoint *)(v11 + 280) = CGRectNull.origin;
  *(CGSize *)(v11 + 296) = size;
  [v10 timestamp];
  *((void *)v11 + 30) = v19;
  long long v20 = *(_OWORD *)&a6->a;
  long long v21 = *(_OWORD *)&a6->tx;
  *((_OWORD *)v11 + 12) = *(_OWORD *)&a6->c;
  *((_OWORD *)v11 + 13) = v21;
  *((_OWORD *)v11 + 11) = v20;

  return (CRLPKStroke *)v11;
}

- (id)_strokeData
{
  return self->_strokeData;
}

- (CGPath)newPathRepresentation
{
  v2 = [(CRLPKStroke *)self p_points];
  v3 = sub_10031C4A0(v2, 0);

  return v3;
}

- (id)p_points
{
  pointsArray = self->_pointsArray;
  if (!pointsArray)
  {
    v4 = [[CRLPKCompressedStrokePointArray alloc] initWithStroke:self];
    long long v5 = self->_pointsArray;
    self->_pointsArray = &v4->super;

    pointsArray = self->_pointsArray;
  }

  return pointsArray;
}

- (void)_setPoints:(CRLPKCompressedStrokePoint *)a3 count:(unint64_t)a4 copy:(BOOL)a5
{
  BOOL v6 = [[_CRLPKStrokeData alloc] initWithPoints:a3 count:a4 copy:a5];
  strokeData = self->_strokeData;
  self->_strokeData = v6;
}

- (unint64_t)_pointsCount
{
  return self->_strokeData->_pointsCount;
}

- (double)_renderCost
{
  return (double)self->_strokeData->_pointsCount;
}

- (void)_points
{
  return self->_strokeData->_points;
}

- (_CRLPKInflightStrokePoint)_inflightPoints
{
  if (self->_inflight) {
    return (_CRLPKInflightStrokePoint *)self->_strokeData->_points;
  }
  else {
    return 0;
  }
}

- (CRLPKCompressedStrokePoint)_completedPoints
{
  if (self->_inflight) {
    return 0;
  }
  else {
    return (CRLPKCompressedStrokePoint *)self->_strokeData->_points;
  }
}

- (void)_strokePointAtIndex:(unint64_t)a3
{
  if (self->_strokeData->_pointsCount <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9700);
    }
    BOOL v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_1010B22EC();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9720);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    _CRLPKStrokeID v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _strokePointAtIndex:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    id v10 = NSStringFromSelector(a2);
    +[CRLAssertionHandler handleFailureInFunction:v8, v9, 242, 0, "Invalid index in %@", v10 file lineNumber isFatal description];
  }
  points = self->_strokeData->_points;
  long long v12 = &points[80 * a3];
  long long v13 = &points[24 * a3];
  if (self->_inflight) {
    return v12;
  }
  else {
    return v13;
  }
}

- (void)_insertStrokePoint:(void *)a3 atIndex:(unint64_t)a4
{
  strokeData = self->_strokeData;
  unint64_t pointsCount = strokeData->_pointsCount;
  if (pointsCount < a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9740);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_1010B2354();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9760);
    }
    id v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    long long v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _insertStrokePoint:atIndex:]");
    long long v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    long long v14 = NSStringFromSelector(a2);
    +[CRLAssertionHandler handleFailureInFunction:v12, v13, 256, 0, "Invalid index in %@", v14 file lineNumber isFatal description];

    strokeData = self->_strokeData;
    unint64_t pointsCount = strokeData->_pointsCount;
  }
  if (self->_inflight) {
    uint64_t v15 = 80;
  }
  else {
    uint64_t v15 = 24;
  }
  unint64_t pointsMaxCount = strokeData->_pointsMaxCount;
  if (pointsCount + 1 >= pointsMaxCount)
  {
    strokeData->_unint64_t pointsMaxCount = 2 * pointsMaxCount;
    self->_strokeData->_points = (char *)malloc_type_realloc(self->_strokeData->_points, self->_strokeData->_pointsMaxCount * v15, 0xF9837A5EuLL);
    strokeData = self->_strokeData;
    unint64_t pointsCount = strokeData->_pointsCount;
  }
  memmove(&strokeData->_points[v15 * a4 + v15], &strokeData->_points[v15 * a4], (pointsCount - a4) * v15);
  [(CRLPKStroke *)self _replaceStrokePointAtIndex:a4 withStrokePoint:a3];
  ++self->_strokeData->_pointsCount;
}

- (void)_removeStrokePointAtIndex:(unint64_t)a3
{
  strokeData = self->_strokeData;
  unint64_t pointsCount = strokeData->_pointsCount;
  if (pointsCount <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9780);
    }
    _CRLPKStrokeID v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_1010B23BC();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F97A0);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _removeStrokePointAtIndex:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    long long v12 = NSStringFromSelector(a2);
    +[CRLAssertionHandler handleFailureInFunction:v10, v11, 275, 0, "Invalid index in %@", v12 file lineNumber isFatal description];

    strokeData = self->_strokeData;
    unint64_t pointsCount = strokeData->_pointsCount;
  }
  uint64_t v13 = 80;
  if (!self->_inflight) {
    uint64_t v13 = 24;
  }
  memmove(&strokeData->_points[v13 * a3], &strokeData->_points[v13 * a3 + v13], (pointsCount + ~a3) * v13);
  --self->_strokeData->_pointsCount;
}

- (void)_addStrokePoint:(void *)a3
{
}

- (void)_removeLastStrokePoint
{
}

- (void)_replaceStrokePointAtIndex:(unint64_t)a3 withStrokePoint:(void *)a4
{
  points = self->_strokeData->_points;
  if (self->_inflight)
  {
    long long v5 = &points[80 * a3];
    *(_OWORD *)long long v5 = *(_OWORD *)a4;
    long long v6 = *((_OWORD *)a4 + 1);
    long long v7 = *((_OWORD *)a4 + 2);
    long long v8 = *((_OWORD *)a4 + 4);
    *((_OWORD *)v5 + 3) = *((_OWORD *)a4 + 3);
    *((_OWORD *)v5 + 4) = v8;
    *((_OWORD *)v5 + 1) = v6;
    *((_OWORD *)v5 + 2) = v7;
  }
  else
  {
    long long v9 = *(_OWORD *)a4;
    id v10 = &points[24 * a3];
    *((void *)v10 + 2) = *((void *)a4 + 2);
    *(_OWORD *)id v10 = v9;
  }
}

- (void)_applyTransform:(CGAffineTransform *)a3
{
  long long v5 = [(CRLPKStroke *)self _completedPoints];
  long long v6 = *(_OWORD *)&a3->c;
  v15[0] = *(_OWORD *)&a3->a;
  v15[1] = v6;
  v15[2] = *(_OWORD *)&a3->tx;
  double v7 = sub_10007F788(v15);
  uint64_t v8 = [(CRLPKStroke *)self _pointsCount];
  if (v8 >= 1)
  {
    uint64_t v9 = v8;
    do
    {
      double v10 = sub_10007B508((uint64_t)v5);
      float64x2_t v12 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v11), *(float64x2_t *)&a3->a, v10));
      *(float *)&double v13 = sub_10007B4F8((uint64_t)v5, v12.f64[0], v12.f64[1]);
      double v14 = sub_10007B5A0((uint64_t)v5, v13);
      sub_10007B558((uint64_t)v5++, v7 + v14);
      --v9;
    }
    while (v9);
  }
  [(CRLPKStroke *)self _invalidateBounds];
}

- (unsigned)_randomSeed
{
  return [(CRLPKStroke *)self hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && ((long long v12 = *(_OWORD *)&self->_strokeID.clock, v13 = *(void *)&self->_strokeID.replicaUUID[12], !v4)
      ? (v5 = 0, v9 = 0, uint64_t v10 = 0, v11 = 0)
      : ([v4 _strokeID], int v5 = v8),
        v12 == v5 && !sub_1003E6610((const unsigned __int8 *)&v12 + 4, (const unsigned __int8 *)&v9))
    && HIDWORD(v13) == HIDWORD(v11);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = self->_strokeID.clock ^ (self->_strokeID.subclock << 16);
  return sub_100435520((uint64_t)self->_strokeID.replicaUUID, 16) ^ v2;
}

- (void)_setBaseValues:(_CRLPKStrokePoint *)a3
{
  *(_OWORD *)&self->_baseValues.timestamp = *(_OWORD *)&a3->timestamp;
  long long v3 = *(_OWORD *)&a3->location.y;
  long long v4 = *(_OWORD *)&a3->aspectRatio;
  long long v5 = *(_OWORD *)&a3->altitude;
  *(_OWORD *)&self->_baseValues.force = *(_OWORD *)&a3->force;
  *(_OWORD *)&self->_baseValues.altitude = v5;
  *(_OWORD *)&self->_baseValues.location.y = v3;
  *(_OWORD *)&self->_baseValues.aspectRatio = v4;
}

- (_CRLPKStrokePoint)_baseValues
{
  long long v3 = *(_OWORD *)&self[1].location.y;
  *(_OWORD *)&retstr->aspectRatio = *(_OWORD *)&self[1].timestamp;
  *(_OWORD *)&retstr->force = v3;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self[1].aspectRatio;
  long long v4 = *(_OWORD *)&self->altitude;
  *(_OWORD *)&retstr->timestamp = *(_OWORD *)&self->force;
  *(_OWORD *)&retstr->location.y = v4;
  return self;
}

- (void)_setIsClipped:(BOOL)a3
{
  self->_clipped = a3;
}

- (BOOL)_isClipped
{
  return self->_clipped;
}

- (void)_setClipOrigin:(CGPoint)a3
{
  self->_clipOrigin = a3;
}

- (CGPoint)_clipOrigin
{
  double x = self->_clipOrigin.x;
  double y = self->_clipOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setClipNormal:(CGPoint)a3
{
  self->_clipNormal = a3;
}

- (CGPoint)_clipNormal
{
  double x = self->_clipNormal.x;
  double y = self->_clipNormal.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setShouldSolveMath:(BOOL)a3
{
  self->_shouldSolveMath = a3;
}

- (BOOL)_shouldSolveMath
{
  return self->_shouldSolveMath;
}

- (CGRect)_bounds
{
  if (!self->_inflight && CGRectIsNull(self->_bounds))
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
    strokeData = self->_strokeData;
    if (strokeData->_pointsCount)
    {
      unint64_t v8 = 0;
      points = strokeData->_points;
      do
      {
        long long v10 = *(_OWORD *)points;
        uint64_t v23 = *((void *)points + 2);
        long long v22 = v10;
        double v11 = sub_10007B518((uint64_t)&v22, *(double *)&v10);
        double v12 = sub_10007B544((uint64_t)&v22, v11);
        double v13 = sub_10007B52C((uint64_t)&v22, v12);
        double v14 = 1.0;
        if (v13 > 1.0) {
          double v14 = sub_10007B52C((uint64_t)&v22, 1.0);
        }
        double v15 = (v11 + v12) * v14 + 2.0;
        double v16 = sub_10007B508((uint64_t)&v22);
        v28.origin.CGFloat x = self->_transform.tx + v17 * self->_transform.c + self->_transform.a * v16 - v15;
        v28.origin.CGFloat y = self->_transform.ty + v17 * self->_transform.d + self->_transform.b * v16 - v15;
        v28.size.CGFloat width = v15 + v15;
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        v28.size.CGFloat height = v15 + v15;
        CGRect v25 = CGRectUnion(v24, v28);
        CGFloat x = v25.origin.x;
        CGFloat y = v25.origin.y;
        CGFloat width = v25.size.width;
        CGFloat height = v25.size.height;
        ++v8;
        points += 24;
      }
      while (v8 < self->_strokeData->_pointsCount);
    }
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    self->_bounds = CGRectIntegral(v26);
  }
  double v18 = self->_bounds.origin.x;
  double v19 = self->_bounds.origin.y;
  double v20 = self->_bounds.size.width;
  double v21 = self->_bounds.size.height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)_invalidateBounds
{
  CGSize size = CGRectNull.size;
  self->_bounds.origin = CGRectNull.origin;
  self->_bounds.CGSize size = size;
}

- (_CRLPKStrokeID)_version
{
  *retstr = *(_CRLPKStrokeID *)((char *)self + 256);
  return self;
}

- (void)_setStrokeID:(_CRLPKStrokeID *)a3
{
  long long v3 = *(_OWORD *)&a3->clock;
  *(void *)&self->_strokeID.replicaUUID[12] = *(void *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_strokeID.clock = v3;
}

- (_CRLPKStrokeID)_strokeID
{
  *retstr = self[1];
  return self;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:self->_strokeID.replicaUUID];
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:self->_version.replicaUUID];
  long long v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  double v7 = [v3 UUIDString];
  uint64_t clock = self->_strokeID.clock;
  subuint64_t clock = self->_strokeID.subclock;
  uint64_t v10 = [v4 UUIDString];
  double v11 = (void *)v10;
  if (self->_hidden) {
    CFStringRef v12 = @" hidden";
  }
  else {
    CFStringRef v12 = &stru_101538650;
  }
  double v13 = +[NSString stringWithFormat:@"<%@: %p id=%@:%d.%d v=%@:%d.%d%@>", v6, self, v7, clock, subclock, v10, self->_version.clock, self->_version.subclock, v12];

  return v13;
}

- (id)descriptionExtended
{
  id v32 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:self->_strokeID.replicaUUID];
  id v31 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:self->_version.replicaUUID];
  v30 = [[CRLPKStrokePoint alloc] initWithStroke:self strokePoint:&self->_baseValues inflight:1];
  id v3 = [(CRLPKStrokePoint *)v30 description];
  v29 = [v3 stringByReplacingOccurrencesOfString:@"\t" withString:@"\t\t"];

  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t clock = self->_strokeID.clock;
  subuint64_t clock = self->_strokeID.subclock;
  uint64_t v8 = self->_version.clock;
  uint64_t v9 = self->_version.subclock;
  double timestamp = self->_timestamp;
  if (self->_inflight) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  if (self->_hidden) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  unint64_t pointsCount = self->_strokeData->_pointsCount;
  CGRect v28 = (void *)v5;
  [(CRLPKStroke *)self _bounds];
  long long v27 = NSStringFromCGRect(v35);
  CFStringRef v23 = v12;
  CFStringRef v24 = v11;
  NSStringFromCGPoint(self->_clipOrigin);
  v26 = uint64_t v13 = v8;
  uint64_t v22 = clock;
  double v14 = NSStringFromCGPoint(self->_clipNormal);
  BOOL clipped = self->_clipped;
  long long v16 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&transform.c = v16;
  *(_OWORD *)&transform.tCGFloat x = *(_OWORD *)&self->_transform.tx;
  uint64_t v17 = NSStringFromCGAffineTransform(&transform);
  double v18 = (void *)v17;
  if (clipped) {
    CFStringRef v19 = @"YES";
  }
  else {
    CFStringRef v19 = @"NO";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %p (id: %@ %d.%d, version: %@ %d.%d)\n\ttimestamp: %g\n\tinflight: %@\n\thidden: %@\n\t%lu points\n\tbounds: %@\n\tclip origin: %@\n\tclip normal: %@\n\tclipped: %@\n\tbase values:%@\n \ttransform:%@\n", v28, self, v32, v22, subclock, v31, v13, v9, *(void *)&timestamp, v24, v23, pointsCount, v27, v26, v14, v19,
    v29,
  double v20 = v17);

  return v20;
}

- (int64_t)compareToStroke:(id)a3
{
  id v4 = a3;
  [(CRLPKStroke *)self _strokeID];
  if (v4) {
    [v4 _strokeID];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  int64_t v5 = sub_1004355FC((uint64_t)v8, (uint64_t)v7);

  return v5;
}

- (CGPoint)_splineControlPoint:(int64_t)a3
{
  if (a3 < -1 || (strokeData = self->_strokeData, (int64_t)strokeData->_pointsCount < a3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F97C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B24AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F97E0);
    }
    BOOL v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _splineControlPoint:]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 436, 0, "%ld is out of bounds", a3);

    strokeData = self->_strokeData;
  }
  uint64_t points = (uint64_t)strokeData->_points;
  unint64_t v10 = [(CRLPKStroke *)self _pointsCount];
  if (a3 < 0)
  {
    double v16 = sub_10007B508(points);
    double v44 = v17;
    double v47 = v16;
    [(CRLPKStroke *)self _transform];
    float64x2_t v35 = (float64x2_t)v56[2];
    float64x2_t v38 = (float64x2_t)v56[3];
    float64x2_t v40 = (float64x2_t)v56[1];
    double v42 = sub_10007B508(points + 24);
    double v37 = v18;
    [(CRLPKStroke *)self _transform];
    CFStringRef v19 = (float64x2_t *)&v55;
    double v20 = (float64x2_t *)v56;
    float64x2_t v21 = vaddq_f64(v38, vmlaq_n_f64(vmulq_n_f64(v35, v44), v40, v47));
    float64x2_t v22 = (float64x2_t)v54[4];
LABEL_18:
    __asm { FMOV            V2.2D, #2.0 }
    float64x2_t v15 = vmlaq_f64(vnegq_f64(vaddq_f64(*v20, vmlaq_n_f64(vmulq_n_f64(*v19, v37), v22, v42))), _Q2, v21);
    goto LABEL_19;
  }
  unint64_t v11 = v10;
  unint64_t v12 = v10;
  if ((v10 & 0x8000000000000000) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9800);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2424();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9820);
    }
    id v32 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _splineControlPoint:]");
    v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v33 file:v34 lineNumber:448 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];

    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v12 <= a3)
  {
    double v23 = sub_10007B508(points + 24 * v11 - 24);
    double v45 = v24;
    double v48 = v23;
    [(CRLPKStroke *)self _transform];
    float64x2_t v36 = (float64x2_t)v54[2];
    float64x2_t v39 = (float64x2_t)v54[3];
    float64x2_t v41 = (float64x2_t)v54[1];
    double v42 = sub_10007B508(points + 24 * v11 - 48);
    double v37 = v25;
    [(CRLPKStroke *)self _transform];
    CFStringRef v19 = (float64x2_t *)&v53;
    double v20 = (float64x2_t *)v54;
    float64x2_t v21 = vaddq_f64(v39, vmlaq_n_f64(vmulq_n_f64(v36, v45), v41, v48));
    float64x2_t v22 = v52;
    goto LABEL_18;
  }
  double v13 = sub_10007B508(points + 24 * a3);
  double v43 = v14;
  double v46 = v13;
  [(CRLPKStroke *)self _transform];
  float64x2_t v15 = vaddq_f64(v51, vmlaq_n_f64(vmulq_n_f64(v50, v43), v49, v46));
LABEL_19:
  double v31 = v15.f64[1];
  result.CGFloat x = v15.f64[0];
  result.CGFloat y = v31;
  return result;
}

- (CGPoint)_interpolatedPointForSplineSegment:(int64_t)a3 t:(double)a4
{
  if (a3 < 0 || (char *)[(CRLPKStroke *)self _pointsCount] - 2 < (char *)a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9840);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2538();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9860);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _interpolatedPointForSplineSegment:t:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 463, 0, "Segment index %ld is out of bounds", a3);
  }
  uint64_t v10 = 0;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  int64_t v13 = a3 - 1;
  double v14 = 0.0;
  do
  {
    [(CRLPKStroke *)self _splineControlPoint:v13 + v10];
    double v16 = v15;
    double v18 = v17;
    double v19 = sub_10031BD2C((int)v10 - 2, a4);
    double x = x + v19 * v16;
    double y = y + v19 * v18;
    double v14 = v14 + v19;
    ++v10;
  }
  while (v10 != 4);
  double v20 = x / v14;
  double v21 = y / v14;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (double)_interpolatedTimeForSplineSegment:(int64_t)a3 t:(double)a4
{
  if (a3 < 0 || (char *)[(CRLPKStroke *)self _pointsCount] - 2 < (char *)a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9880);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B25C4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F98A0);
    }
    BOOL v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _interpolatedTimeForSplineSegment:t:]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 482, 0, "Segment index %ld is out of bounds", a3);
  }
  uint64_t points = self->_strokeData->_points;
  [(CRLPKStroke *)self timestamp];
  double v11 = sub_10007B4E8((float *)&points[24 * a3], v10);
  [(CRLPKStroke *)self timestamp];
  return v11 + (sub_10007B4E8((float *)&points[24 * a3 + 24], v12) - v11) * (double)a3;
}

- (double)_lengthOfSplineSegment:(unint64_t)a3
{
  if ((char *)[(CRLPKStroke *)self _pointsCount] - 2 < (char *)a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F98C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2650();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F98E0);
    }
    int64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    BOOL v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _lengthOfSplineSegment:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 493, 0, "Segment index %ld is out of bounds", a3);
  }
  [(CRLPKStroke *)self _splineControlPoint:a3 - 1];
  double v9 = v8;
  double v11 = v10;
  [(CRLPKStroke *)self _splineControlPoint:a3];
  double v13 = v12;
  double v15 = v14;
  [(CRLPKStroke *)self _splineControlPoint:a3 + 1];
  double v17 = v16;
  double v19 = v18;
  [(CRLPKStroke *)self _splineControlPoint:a3 + 2];
  return sub_10031BF18(v9, v11, v13, v15, v17, v19, v20, v21);
}

- (double)_strokeLength
{
  double v3 = 0.0;
  if ((id)[(CRLPKStroke *)self _pointsCount] != (id)1)
  {
    [(CRLPKStroke *)self _pointsCount];
    id v4 = 0;
    do
    {
      [(CRLPKStroke *)self _lengthOfSplineSegment:v4];
      double v3 = v3 + v5;
      ++v4;
    }
    while (v4 <= (char *)[(CRLPKStroke *)self _pointsCount] - 2);
  }
  return v3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (BOOL)_isHidden
{
  return self->_hidden;
}

- (void)set_hidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void)set_version:(_CRLPKStrokeID *)a3
{
  long long v3 = *(_OWORD *)&a3->clock;
  *(void *)&self->_version.replicaUUID[12] = *(void *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_version.uint64_t clock = v3;
}

- (void)set_bounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (BOOL)_inflight
{
  return self->_inflight;
}

- (void)set_inflight:(BOOL)a3
{
  self->_inflight = a3;
}

- (int64_t)_inputType
{
  return self->_inputType;
}

- (void)_setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (CGAffineTransform)_transform
{
  long long v3 = *(_OWORD *)&self[4].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[4].c;
  return self;
}

- (void)_setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tdouble x = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIDWrapper, 0);
  objc_storeStrong((id *)&self->_pointsArray, 0);

  objc_storeStrong((id *)&self->_strokeData, 0);
}

- (CGPoint)clipOrigin
{
  [(CRLPKStroke *)self _clipOrigin];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)clipNormal
{
  [(CRLPKStroke *)self _clipNormal];
  result.double y = v3;
  result.double x = v2;
  return result;
}

@end