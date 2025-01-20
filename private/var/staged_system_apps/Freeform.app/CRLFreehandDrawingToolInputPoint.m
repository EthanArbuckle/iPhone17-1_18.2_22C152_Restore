@interface CRLFreehandDrawingToolInputPoint
- ($DFF4DC44DB28EA937F31517ED997C956)PKInputPoint;
- (BOOL)hasEstimatedAltitudeAndAzimuth;
- (BOOL)isPredicted;
- (BOOL)wasAddedByTouchesEnded;
- (CGPoint)unscaledPoint;
- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 time:(double)a4 inputType:(int64_t)a5 isPredicted:(BOOL)a6 activeInputProperties:(unint64_t)a7 altitudeAngleInRadians:(double)a8 azimuthAngleInRadians:(double)a9 rollAngleInRadians:(double)a10 force:(double)a11 estimationUpdateIndex:(int64_t)a12 hasEstimatedAltitudeAndAzimuth:(BOOL)a13 wasAddedByTouchesEnded:(BOOL)a14;
- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 time:(double)a4 inputType:(int64_t)a5 isPredicted:(BOOL)a6 wasAddedByTouchesEnded:(BOOL)a7;
- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 touch:(id)a4 activeInputProperties:(unint64_t)a5 isPredicted:(BOOL)a6 wasAddedByTouchesEnded:(BOOL)a7;
- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 touch:(id)a4 event:(id)a5 isPredicted:(BOOL)a6 wasAddedByTouchesEnded:(BOOL)a7;
- (double)altitudeAngleInRadians;
- (double)azimuthAngleInRadians;
- (double)force;
- (double)rollAngleInRadians;
- (double)time;
- (int64_t)PKInputType;
- (int64_t)estimationUpdateIndex;
- (int64_t)inputType;
- (unint64_t)activeInputProperties;
@end

@implementation CRLFreehandDrawingToolInputPoint

- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 time:(double)a4 inputType:(int64_t)a5 isPredicted:(BOOL)a6 activeInputProperties:(unint64_t)a7 altitudeAngleInRadians:(double)a8 azimuthAngleInRadians:(double)a9 rollAngleInRadians:(double)a10 force:(double)a11 estimationUpdateIndex:(int64_t)a12 hasEstimatedAltitudeAndAzimuth:(BOOL)a13 wasAddedByTouchesEnded:(BOOL)a14
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v28.receiver = self;
  v28.super_class = (Class)CRLFreehandDrawingToolInputPoint;
  result = [(CRLFreehandDrawingToolInputPoint *)&v28 init];
  if (result)
  {
    result->_unscaledPoint.CGFloat x = x;
    result->_unscaledPoint.CGFloat y = y;
    result->_time = a4;
    result->_isPredicted = a6;
    result->_inputType = a5;
    result->_activeInputProperties = a7;
    result->_altitudeAngleInRadians = a8;
    result->_azimuthAngleInRadians = a9;
    result->_rollAngleInRadians = a10;
    result->_force = a11;
    result->_estimationUpdateIndeCGFloat x = a12;
    result->_hasEstimatedAltitudeAndAzimuth = a13;
    result->_wasAddedByTouchesEnded = a14;
  }
  return result;
}

- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 touch:(id)a4 activeInputProperties:(unint64_t)a5 isPredicted:(BOOL)a6 wasAddedByTouchesEnded:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  if ([v13 type] == (id)2)
  {
    [v13 altitudeAngle];
    if (fabs(v14) == INFINITY)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB540);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109ABE0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB560);
      }
      v21 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v21);
      }
      v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:]");
      v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolInputPoint.m"];
      +[CRLAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:90 isFatal:0 description:"UITouch altitudeAngle is invalid; using a default in its place."];

      double v15 = 0.785398163;
    }
    else
    {
      double v15 = 1.57079633 - v14;
    }
    [v13 azimuthAngleInView:0];
    if (fabs(v24) == INFINITY)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB580);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109AB58();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EB5A0);
      }
      v25 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v25);
      }
      v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:]");
      v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolInputPoint.m"];
      +[CRLAssertionHandler handleFailureInFunction:v26 file:v27 lineNumber:97 isFatal:0 description:"UITouch azimuth is invalid; using a default in its place."];

      double v20 = 0.0;
    }
    else
    {
      double v20 = v24 + -3.14159265;
    }
    [v13 _rollAngle];
    if (fabs(v28) == INFINITY) {
      double v28 = 0.0;
    }
    double v17 = v28;
    [v13 maximumPossibleForce];
    double v18 = -1.0;
    if (v29 > 0.0)
    {
      [v13 force];
      if (fabs(v30) == INFINITY)
      {
        [v13 maximumPossibleForce];
        double v33 = v32;
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EB5C0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109AAD0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EB5E0);
        }
        v34 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v34);
        }
        double v18 = v33 * 0.5;
        v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:]");
        v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolInputPoint.m"];
        +[CRLAssertionHandler handleFailureInFunction:v35 file:v36 lineNumber:114 isFatal:0 description:"UITouch force is invalid; using a default in its place."];
      }
      else
      {
        [v13 force];
        double v18 = v31;
      }
    }
    v37 = [v13 estimationUpdateIndex];
    v38 = v37;
    if (v37) {
      uint64_t v19 = (uint64_t)[v37 integerValue];
    }
    else {
      uint64_t v19 = -1;
    }
    BOOL v16 = ((unint64_t)[v13 estimatedProperties] & 6) != 0;
  }
  else
  {
    BOOL v16 = 0;
    double v17 = 0.0;
    double v18 = -1.0;
    uint64_t v19 = -1;
    double v15 = 0.785398163;
    double v20 = 0.0;
  }
  [v13 timestamp];
  v40 = -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:time:inputType:isPredicted:activeInputProperties:altitudeAngleInRadians:azimuthAngleInRadians:rollAngleInRadians:force:estimationUpdateIndex:hasEstimatedAltitudeAndAzimuth:wasAddedByTouchesEnded:](self, "initWithUnscaledPoint:time:inputType:isPredicted:activeInputProperties:altitudeAngleInRadians:azimuthAngleInRadians:rollAngleInRadians:force:estimationUpdateIndex:hasEstimatedAltitudeAndAzimuth:wasAddedByTouchesEnded:", sub_10036FEA4((BOOL)[v13 type]), v8, a5, v19, v16, v7, x, y, v39, v15, v20, v17, v18);

  return v40;
}

- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 touch:(id)a4 event:(id)a5 isPredicted:(BOOL)a6 wasAddedByTouchesEnded:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  double v14 = -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:](self, "initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:", v13, +[PKDrawingGestureRecognizer activeInputPropertiesForTouch:event:](PKDrawingGestureRecognizer, "activeInputPropertiesForTouch:event:", v13, a5), v8, v7, x, y);

  return v14;
}

- (CRLFreehandDrawingToolInputPoint)initWithUnscaledPoint:(CGPoint)a3 time:(double)a4 inputType:(int64_t)a5 isPredicted:(BOOL)a6 wasAddedByTouchesEnded:(BOOL)a7
{
  return -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:time:inputType:isPredicted:activeInputProperties:altitudeAngleInRadians:azimuthAngleInRadians:rollAngleInRadians:force:estimationUpdateIndex:hasEstimatedAltitudeAndAzimuth:wasAddedByTouchesEnded:](self, "initWithUnscaledPoint:time:inputType:isPredicted:activeInputProperties:altitudeAngleInRadians:azimuthAngleInRadians:rollAngleInRadians:force:estimationUpdateIndex:hasEstimatedAltitudeAndAzimuth:wasAddedByTouchesEnded:", a3.x, a3.y, a4, 0.785398163, 0.0, 0.0, 0.0);
}

- (int64_t)PKInputType
{
  return (id)[(CRLFreehandDrawingToolInputPoint *)self inputType] == (id)2;
}

- ($DFF4DC44DB28EA937F31517ED997C956)PKInputPoint
{
  long long v3 = PKInputPointZero[5];
  long long v4 = PKInputPointZero[6];
  long long v5 = PKInputPointZero[3];
  *(_OWORD *)&retstr->var7 = PKInputPointZero[4];
  *(_OWORD *)&retstr->var9 = v3;
  long long v6 = PKInputPointZero[7];
  *(_OWORD *)&retstr->var11 = v4;
  *(_OWORD *)&retstr->var13 = v6;
  long long v7 = PKInputPointZero[1];
  *(_OWORD *)&retstr->var3 = PKInputPointZero[2];
  *(_OWORD *)&retstr->var5 = v5;
  retstr->var0 = *($B819F82C29202E081AA078F1B52C391D *)&self->var9;
  *(_OWORD *)&retstr->var1 = v7;
  retstr->var7 = self->var1;
  *(int8x16_t *)&retstr->var2 = vextq_s8(*(int8x16_t *)&self->var4, *(int8x16_t *)&self->var4, 8uLL);
  *(double *)&long long v4 = self->var7;
  retstr->var12 = self->var6;
  retstr->var8 = LOBYTE(self->var0.var1.y);
  *(void *)&retstr->var1 = v4;
  retstr->var9 = *(void *)&self->var8;
  retstr->var11 = BYTE1(self->var0.var1.y);
  return self;
}

- (CGPoint)unscaledPoint
{
  double x = self->_unscaledPoint.x;
  double y = self->_unscaledPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)time
{
  return self->_time;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (BOOL)isPredicted
{
  return self->_isPredicted;
}

- (unint64_t)activeInputProperties
{
  return self->_activeInputProperties;
}

- (double)altitudeAngleInRadians
{
  return self->_altitudeAngleInRadians;
}

- (double)azimuthAngleInRadians
{
  return self->_azimuthAngleInRadians;
}

- (double)rollAngleInRadians
{
  return self->_rollAngleInRadians;
}

- (double)force
{
  return self->_force;
}

- (int64_t)estimationUpdateIndex
{
  return self->_estimationUpdateIndex;
}

- (BOOL)hasEstimatedAltitudeAndAzimuth
{
  return self->_hasEstimatedAltitudeAndAzimuth;
}

- (BOOL)wasAddedByTouchesEnded
{
  return self->_wasAddedByTouchesEnded;
}

@end