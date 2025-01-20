@interface CRLPKStrokeGenerator
+ (_CRLPKStrokePoint)outputPointFromInputPoint:(SEL)a3;
+ (vector<CRLPKInputPoint,)inputPointsFromPath:(id)a2;
+ (void)initialize;
- (BOOL)canSnapToRuler;
- (BOOL)isSnappedToRuler;
- (BOOL)isSnappedToRulerTopSide;
- (BOOL)lastPointIsMasked;
- (BOOL)shouldSnapPointToRuler:(CGPoint)a3;
- (BOOL)useRuler;
- (CGAffineTransform)rulerTransform;
- (CGPoint)getRulerSnapLineOriginAndTangent:(CGPoint *)a3 andNormal:(CGPoint *)a4;
- (CGPoint)lastPoint;
- (CGPoint)snapPointToRuler:(CGPoint)a3;
- (CRLPKStrokeGenerator)init;
- (OS_dispatch_queue)outputQueue;
- (_CRLPKStrokePoint)outputCurrentStrokePoint:(SEL)a3;
- (_CRLPKStrokePoint)outputPoint:(SEL)a3 baseValues:(id *)a4;
- (double)distanceToRulerCenter:(CGPoint)a3;
- (double)eraserIndicatorAlpha;
- (double)inputScale;
- (double)rulerWidth;
- (double)strokeMaxForce;
- (double)touchSensitivity;
- (id).cxx_construct;
- (id)strokeFromPath:(CGPath *)a3 inputScale:(double)a4;
- (int64_t)fetchFilteredPointsFromIndex:(int64_t)a3 intoVector:(void *)a4;
- (unint64_t)copyInputUpdatedRangeFromIndex:(unint64_t)a3 into:(void *)a4;
- (void)_drawingAddPoint:(id *)a3;
- (void)addPoint:(id *)a3;
- (void)addPoints:()vector<CRLPKInputPoint;
- (void)allowSnappingToRuler:(CGAffineTransform *)a3 width:(double)a4;
- (void)azimuthFilter;
- (void)compressionFilter;
- (void)dealloc;
- (void)decompressionFilter;
- (void)drawingBeganWithStroke:(id)a3 inputType:(int64_t)a4 inputScale:(double)a5 start:(id)a6;
- (void)drawingCancelledWithCompletion:(id)a3;
- (void)drawingEndedWithCompletion:(id)a3;
- (void)drawingUpdateAllPoints;
- (void)drawingUpdatePoint:(id *)a3;
- (void)endCapFilter;
- (void)endHookFilter;
- (void)estimatedAltitudeAndAzimuthFilter;
- (void)getInputUpdatedRangeFromIndex:(unint64_t *)a3;
- (void)getUpdatedRangeFromIndex:(unint64_t *)a3;
- (void)inputProvider;
- (void)inputSmoother;
- (void)inputToOutputFilter;
- (void)maskToRuler;
- (void)noiseSmoother;
- (void)outputFilter;
- (void)pixelSmoothingFilter;
- (void)pointReductionFilter;
- (void)removePredictedTouches;
- (void)reset;
- (void)rulerExtremaFilter;
- (void)setAzimuthFilter:(void *)a3;
- (void)setCanSnapToRuler:(BOOL)a3;
- (void)setCompressionFilter:(void *)a3;
- (void)setDecompressionFilter:(void *)a3;
- (void)setEndCapFilter:(void *)a3;
- (void)setEndHookFilter:(void *)a3;
- (void)setEraserIndicatorAlpha:(double)a3;
- (void)setEstimatedAltitudeAndAzimuthFilter:(void *)a3;
- (void)setInputProvider:(void *)a3;
- (void)setInputScale:(double)a3;
- (void)setInputSmoother:(void *)a3;
- (void)setInputToOutputFilter:(void *)a3;
- (void)setIsSnappedToRuler:(BOOL)a3;
- (void)setIsSnappedToRulerTopSide:(BOOL)a3;
- (void)setLastPoint:(CGPoint)a3;
- (void)setNoiseSmoother:(void *)a3;
- (void)setOutputQueue:(id)a3;
- (void)setPixelSmoothingFilter:(void *)a3;
- (void)setPointReductionFilter:(void *)a3;
- (void)setPointReductionFilterThresholdMultiplier:(double)a3;
- (void)setRulerExtremaFilter:(void *)a3;
- (void)setRulerTransform:(CGAffineTransform *)a3;
- (void)setRulerWidth:(double)a3;
- (void)setSmoothingThresholdMultiplier:(double)a3;
- (void)setStartCapFilter:(void *)a3;
- (void)setStartHookFilter:(void *)a3;
- (void)setStrokeMaxForce:(double)a3;
- (void)setTouchSensitivity:(double)a3;
- (void)setUseRuler:(BOOL)a3;
- (void)setVelocityFilter:(void *)a3;
- (void)snapToRuler;
- (void)startCapFilter;
- (void)startHookFilter;
- (void)updateImmutableCount;
- (void)updateRulerSnapping;
- (void)velocityFilter;
- (void)whenFinishedProcessingPointsCallCompletion:(id)a3;
@end

@implementation CRLPKStrokeGenerator

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CRLPKStrokeGenerator;
  [super initialize];
  objc_opt_class();
}

- (CRLPKStrokeGenerator)init
{
  v9.receiver = self;
  v9.super_class = (Class)CRLPKStrokeGenerator;
  objc_super v2 = [(CRLPKStrokeGenerator *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.freeform.pencilkit.draw-input", v3);
    inputQueue = v2->_inputQueue;
    v2->_inputQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.freeform.pencilkit.draw-output", v3);
    outputQueue = v2->_outputQueue;
    v2->_outputQueue = (OS_dispatch_queue *)v6;

    v2->_inputScale = 1.0;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  inputProvider = self->_inputProvider;
  if (inputProvider) {
    (*(void (**)(void *, SEL))(*(void *)inputProvider + 8))(inputProvider, a2);
  }
  pixelSmoothingFilter = self->_pixelSmoothingFilter;
  if (pixelSmoothingFilter) {
    (*(void (**)(void *, SEL))(*(void *)pixelSmoothingFilter + 8))(pixelSmoothingFilter, a2);
  }
  pointReductionFilter = self->_pointReductionFilter;
  if (pointReductionFilter) {
    (*(void (**)(void *, SEL))(*(void *)pointReductionFilter + 8))(pointReductionFilter, a2);
  }
  noiseSmoother = self->_noiseSmoother;
  if (noiseSmoother) {
    (*(void (**)(void *, SEL))(*(void *)noiseSmoother + 8))(noiseSmoother, a2);
  }
  startHookFilter = self->_startHookFilter;
  if (startHookFilter) {
    (*(void (**)(void *, SEL))(*(void *)startHookFilter + 8))(startHookFilter, a2);
  }
  endHookFilter = self->_endHookFilter;
  if (endHookFilter) {
    (*(void (**)(void *, SEL))(*(void *)endHookFilter + 8))(endHookFilter, a2);
  }
  velocityFilter = self->_velocityFilter;
  if (velocityFilter) {
    (*(void (**)(void *, SEL))(*(void *)velocityFilter + 8))(velocityFilter, a2);
  }
  inputSmoother = self->_inputSmoother;
  if (inputSmoother) {
    (*(void (**)(void *, SEL))(*(void *)inputSmoother + 8))(inputSmoother, a2);
  }
  inputToOutputFilter = self->_inputToOutputFilter;
  if (inputToOutputFilter) {
    (*(void (**)(void *, SEL))(*(void *)inputToOutputFilter + 8))(inputToOutputFilter, a2);
  }
  startCapFilter = self->_startCapFilter;
  if (startCapFilter) {
    (*(void (**)(void *, SEL))(*(void *)startCapFilter + 8))(startCapFilter, a2);
  }
  azimuthFilter = self->_azimuthFilter;
  if (azimuthFilter) {
    (*(void (**)(void *, SEL))(*(void *)azimuthFilter + 8))(azimuthFilter, a2);
  }
  endCapFilter = self->_endCapFilter;
  if (endCapFilter) {
    (*(void (**)(void *, SEL))(*(void *)endCapFilter + 8))(endCapFilter, a2);
  }
  compressionFilter = self->_compressionFilter;
  if (compressionFilter) {
    (*(void (**)(void *, SEL))(*(void *)compressionFilter + 8))(compressionFilter, a2);
  }
  decompressionFilter = self->_decompressionFilter;
  if (decompressionFilter) {
    (*(void (**)(void *, SEL))(*(void *)decompressionFilter + 8))(decompressionFilter, a2);
  }
  rulerExtremaFilter = self->_rulerExtremaFilter;
  if (rulerExtremaFilter) {
    (*(void (**)(void *, SEL))(*(void *)rulerExtremaFilter + 8))(rulerExtremaFilter, a2);
  }
  estimatedAltitudeAndAzimuthFilter = self->_estimatedAltitudeAndAzimuthFilter;
  if (estimatedAltitudeAndAzimuthFilter) {
    (*(void (**)(void *, SEL))(*(void *)estimatedAltitudeAndAzimuthFilter + 8))(estimatedAltitudeAndAzimuthFilter, a2);
  }
  v19.receiver = self;
  v19.super_class = (Class)CRLPKStrokeGenerator;
  [(CRLPKStrokeGenerator *)&v19 dealloc];
}

- (void)drawingBeganWithStroke:(id)a3 inputType:(int64_t)a4 inputScale:(double)a5 start:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  inputQueue = self->_inputQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016B0A8;
  block[3] = &unk_1014DAEC0;
  block[4] = self;
  id v16 = v10;
  double v19 = a5;
  id v17 = v11;
  int64_t v18 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(inputQueue, block);
}

- (void)allowSnappingToRuler:(CGAffineTransform *)a3 width:(double)a4
{
  inputQueue = self->_inputQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  long long v5 = *(_OWORD *)&a3->c;
  long long v7 = *(_OWORD *)&a3->a;
  v6[2] = sub_10016B31C;
  v6[3] = &unk_1014DAEE8;
  v6[4] = self;
  long long v8 = v5;
  long long v9 = *(_OWORD *)&a3->tx;
  double v10 = a4;
  dispatch_async(inputQueue, v6);
}

- (CGPoint)getRulerSnapLineOriginAndTangent:(CGPoint *)a3 andNormal:(CGPoint *)a4
{
  float64x2_t v23 = 0u;
  float64x2_t v24 = 0u;
  float64x2_t v22 = 0u;
  [(CRLPKStrokeGenerator *)self rulerTransform];
  [(CRLPKStrokeGenerator *)self rulerWidth];
  double v8 = v7 * 0.5;
  if ([(CRLPKStrokeGenerator *)self isSnappedToRuler]) {
    double v8 = v8 + 1.0;
  }
  unsigned int v9 = [(CRLPKStrokeGenerator *)self isSnappedToRulerTopSide];
  double v10 = -v8;
  if (v9) {
    double v10 = v8;
  }
  float64x2_t v11 = v22;
  float64x2_t v12 = v24;
  double v13 = v10 * v23.f64[0];
  double v14 = v10 * v23.f64[1];
  if (a3)
  {
    CGFloat v15 = v24.f64[1] + v14 + v22.f64[1] * 100.0;
    a3->x = v24.f64[0] + v13 + v22.f64[0] * 100.0;
    a3->y = v15;
  }
  if (a4)
  {
    v21[0] = v22;
    v21[1] = v23;
    v21[2] = v24;
    double v16 = sub_1000664E0(v21, 0.0, v10 + v10);
    a4->x = sub_100064660(v16, v17);
    a4->y = v18;
  }
  double v19 = v12.f64[0] + v13 + v11.f64[0] * -100.0;
  double v20 = v12.f64[1] + v14 + v11.f64[1] * -100.0;
  result.y = v20;
  result.x = v19;
  return result;
}

- (double)distanceToRulerCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLPKStrokeGenerator *)self rulerTransform];
  *(void *)&double v16 = *(_OWORD *)&vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGPointZero.y), (float64x2_t)0, CGPointZero.x));
  [(CRLPKStrokeGenerator *)self rulerWidth];
  float64x2_t v15 = vaddq_f64((float64x2_t)0, vmlaq_f64(vmulq_n_f64((float64x2_t)0, v6 * 0.5), (float64x2_t)0, (float64x2_t)0));
  double v7 = sub_100064680(x, y, v16);
  double v9 = v8;
  double v10 = sub_100064680(v15.f64[0], v15.f64[1], v16);
  double v12 = sub_100064660(v10, v11);
  return sub_10006468C(v7, v9, v12, v13);
}

- (BOOL)shouldSnapPointToRuler:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(CRLPKStrokeGenerator *)self useRuler];
  if (v6)
  {
    if (self->_currentInputType == 1) {
      double v7 = 25.0;
    }
    else {
      double v7 = 45.0;
    }
    [(CRLPKStrokeGenerator *)self rulerWidth];
    double v9 = v8 * 0.5 + v7;
    [(CRLPKStrokeGenerator *)self rulerTransform];
    double v10 = v9 * sub_10007F808(&v13);
    -[CRLPKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", x, y);
    LOBYTE(v6) = fabs(v11) < v10;
  }
  return v6;
}

- (void)snapToRuler
{
  -[CRLPKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1));
  [(CRLPKStrokeGenerator *)self setIsSnappedToRulerTopSide:v3 > 0.0];
  [(CRLPKStrokeGenerator *)self setIsSnappedToRuler:1];
  [(CRLPKStroke *)self->_currentStroke _setIsClipped:0];
  begin = self->_drawPoints.__begin_;
  end = self->_drawPoints.__end_;
  while (begin != end)
  {
    -[CRLPKStrokeGenerator snapPointToRuler:](self, "snapPointToRuler:", *(double *)begin, *((double *)begin + 1));
    *(void *)begin = v6;
    *((void *)begin + 1) = v7;
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 88);
  }
}

- (void)maskToRuler
{
  -[CRLPKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1));
  [(CRLPKStrokeGenerator *)self setIsSnappedToRulerTopSide:v3 > 0.0];
  [(CRLPKStrokeGenerator *)self setIsSnappedToRuler:0];
  [(CRLPKStrokeGenerator *)self getRulerSnapLineOriginAndTangent:0 andNormal:v8];
  double v5 = v4;
  double v7 = v6;
  [(CRLPKStroke *)self->_currentStroke _setIsClipped:1];
  -[CRLPKStroke _setClipOrigin:](self->_currentStroke, "_setClipOrigin:", v5, v7);
  -[CRLPKStroke _setClipNormal:](self->_currentStroke, "_setClipNormal:", v8[0], v8[1]);
}

- (CGPoint)snapPointToRuler:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(CRLPKStrokeGenerator *)self isSnappedToRuler])
  {
    [(CRLPKStrokeGenerator *)self getRulerSnapLineOriginAndTangent:v11 andNormal:0];
    double x = sub_100064618(v6, v7, v11[0], v11[1], x, y);
    double y = v8;
  }
  double v9 = x;
  double v10 = y;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)updateRulerSnapping
{
  if ([(CRLPKStrokeGenerator *)self canSnapToRuler])
  {
    begin = (double *)self->_drawPoints.__begin_;
    end = self->_drawPoints.__end_;
    if (end != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)begin)
    {
      if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)begin) >> 3)) >= 2)
      {
        double v5 = sub_100064680(*((double *)end - 11), *((double *)end - 10), *begin);
        double v7 = v6;
        [(CRLPKStrokeGenerator *)self rulerTransform];
        double v8 = sub_1000664E0(v17, 1.0, 0.0);
        double v10 = v9;
        if (sub_1000653A8(v5, v7) > self->_inputScale * (self->_inputScale * 225.0))
        {
          double v11 = sub_100064660(v5, v7);
          double v13 = v12;
          double v14 = sub_100064660(v8, v10);
          double v16 = sub_10006468C(v11, v13, v14, v15);
          if (-[CRLPKStrokeGenerator shouldSnapPointToRuler:](self, "shouldSnapPointToRuler:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1))&& fabs(v16) > 0.86)
          {
            [(CRLPKStrokeGenerator *)self snapToRuler];
          }
          else
          {
            [(CRLPKStrokeGenerator *)self maskToRuler];
          }
          [(CRLPKStrokeGenerator *)self setCanSnapToRuler:0];
        }
      }
      if ([(CRLPKStrokeGenerator *)self canSnapToRuler])
      {
        if (![(CRLPKStroke *)self->_currentStroke _isClipped]) {
          [(CRLPKStrokeGenerator *)self maskToRuler];
        }
      }
    }
  }
}

- (BOOL)lastPointIsMasked
{
  [(CRLPKStrokeGenerator *)self lastPoint];
  BOOL v5 = v4 == INFINITY && v3 == INFINITY;
  BOOL result = 0;
  if (!v5
    && [(CRLPKStrokeGenerator *)self useRuler]
    && ![(CRLPKStrokeGenerator *)self isSnappedToRuler])
  {
    [(CRLPKStrokeGenerator *)self lastPoint];
    -[CRLPKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:");
    double v8 = v7;
    [(CRLPKStrokeGenerator *)self rulerWidth];
    double v10 = v9 * 0.5;
    [(CRLPKStrokeGenerator *)self rulerTransform];
    double v11 = v10 * sub_10007F808(&v12);
    if ([(CRLPKStrokeGenerator *)self isSnappedToRulerTopSide])
    {
      if (v8 < v11) {
        return 1;
      }
    }
    if (![(CRLPKStrokeGenerator *)self isSnappedToRulerTopSide] && v11 > -v8) {
      return 1;
    }
  }
  return result;
}

- (void)setSmoothingThresholdMultiplier:(double)a3
{
}

- (void)setPointReductionFilterThresholdMultiplier:(double)a3
{
}

- (void)outputFilter
{
  return [(CRLPKStrokeGenerator *)self decompressionFilter];
}

- (void)getUpdatedRangeFromIndex:(unint64_t *)a3
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  outputQueue = self->_outputQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016BCC0;
  block[3] = &unk_1014DAF10;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(outputQueue, block);
  double v4 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)getInputUpdatedRangeFromIndex:(unint64_t *)a3
{
}

- (unint64_t)copyInputUpdatedRangeFromIndex:(unint64_t)a3 into:(void *)a4
{
  return self->_immutableCount;
}

- (void)reset
{
  self->_drawPoints.__end_ = self->_drawPoints.__begin_;
  self->_immutableCount = 0;
  [(CRLPKStrokeGenerator *)self setIsSnappedToRuler:0];
  sub_10016BE28((uint64_t)&self->_outputPoints, 0);
  self->_outputImmutableCount = 0;
  self->_inputHasChanged = 0;
}

+ (_CRLPKStrokePoint)outputPointFromInputPoint:(SEL)a3
{
  long long v4 = *(_OWORD *)&a4->var1;
  retstr->location = a4->var0;
  double var5 = a4->var5;
  *(_OWORD *)&retstr->force = v4;
  retstr->altitude = a4->var3;
  retstr->opacitdouble y = 1.0;
  retstr->edgeWidth = 0.0;
  *(_OWORD *)&retstr->radius = xmmword_101175C30;
  retstr->timestamp = var5;
  return result;
}

- (_CRLPKStrokePoint)outputCurrentStrokePoint:(SEL)a3
{
  long long v5 = *(_OWORD *)&a4->var5;
  v10[2] = *(_OWORD *)&a4->var3;
  v10[3] = v5;
  v10[4] = *(_OWORD *)&a4->var7;
  uint64_t v11 = *(void *)&a4->var9;
  long long v6 = *(_OWORD *)&a4->var1;
  v10[0] = a4->var0;
  v10[1] = v6;
  currentStroke = self->_currentStroke;
  if (currentStroke) {
    [(CRLPKStroke *)currentStroke _baseValues];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  return [(CRLPKStrokeGenerator *)self outputPoint:v10 baseValues:v9];
}

- (_CRLPKStrokePoint)outputPoint:(SEL)a3 baseValues:(id *)a4
{
  double strokeMaxForce = self->_strokeMaxForce;
  if (strokeMaxForce <= a4->var1) {
    double strokeMaxForce = a4->var1;
  }
  self->_double strokeMaxForce = strokeMaxForce;
  self->_eraserIndicatorAlpha = 1.0;
  long long v6 = *(_OWORD *)&a4->var5;
  v9[2] = *(_OWORD *)&a4->var3;
  v9[3] = v6;
  v9[4] = *(_OWORD *)&a4->var7;
  uint64_t v10 = *(void *)&a4->var9;
  long long v7 = *(_OWORD *)&a4->var1;
  v9[0] = a4->var0;
  v9[1] = v7;
  return +[CRLPKStrokeGenerator outputPointFromInputPoint:](CRLPKStrokeGenerator, "outputPointFromInputPoint:", v9, a5);
}

- (int64_t)fetchFilteredPointsFromIndex:(int64_t)a3 intoVector:(void *)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  outputQueue = self->_outputQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016C26C;
  v7[3] = &unk_1014DAF78;
  v7[6] = a4;
  v7[7] = a3;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(outputQueue, v7);
  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)drawingUpdatePoint:(id *)a3
{
  outputQueue = self->_outputQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  long long v5 = *(_OWORD *)&a3->var5;
  long long v10 = *(_OWORD *)&a3->var3;
  long long v11 = v5;
  long long v12 = *(_OWORD *)&a3->var7;
  long long v6 = *(_OWORD *)&a3->var1;
  CGPoint var0 = a3->var0;
  v7[2] = sub_10016C404;
  v7[3] = &unk_1014DAFA0;
  v7[4] = self;
  uint64_t v13 = *(void *)&a3->var9;
  long long v9 = v6;
  dispatch_async(outputQueue, v7);
  [(CRLPKStrokeGenerator *)self drawingUpdateAllPoints];
}

- (void)drawingUpdateAllPoints
{
  outputQueue = self->_outputQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016C60C;
  block[3] = &unk_1014D0800;
  block[4] = self;
  dispatch_async(outputQueue, block);
}

- (void)updateImmutableCount
{
  double v3 = +[NSProcessInfo processInfo];
  [v3 systemUptime];
  double v5 = v4;

  if (![(CRLPKStrokeGenerator *)self canSnapToRuler])
  {
    begin = self->_drawPoints.__begin_;
    uint64_t v7 = self->_drawPoints.__end_ - begin;
    if (v7)
    {
      unint64_t v8 = 0x2E8BA2E8BA2E8BA3 * (v7 >> 3);
      for (unint64_t i = self->_immutableCount; i < v8; self->_immutableCount = i)
      {
        long long v10 = (char *)begin + 88 * i;
        uint64_t v12 = *((void *)v10 + 8);
        long long v11 = v10 + 64;
        if ((v12 & 0x8000000000000000) == 0)
        {
          if (*((double *)begin + 11 * i + 6) >= v5 + -0.1) {
            return;
          }
          *long long v11 = -1;
        }
        if (*((unsigned char *)begin + 88 * i + 56)) {
          break;
        }
        unint64_t i = self->_immutableCount + 1;
      }
    }
  }
}

- (void)removePredictedTouches
{
  begin = self->_drawPoints.__begin_;
  end = self->_drawPoints.__end_;
  p_drawPoints = &self->_drawPoints;
  uint64_t v5 = (unsigned __int128)((end - begin) * (__int128)0x2E8BA2E8BA2E8BA3) >> 64;
  uint64_t v6 = (v5 >> 4) + ((unint64_t)v5 >> 63);
  for (unint64_t i = (unsigned __int8 *)begin + 88 * v6 - 32; v6-- >= 1; i -= 88)
  {
    if (!*i)
    {
      sub_10000453C((uint64_t)p_drawPoints, v6 + 1);
      return;
    }
  }
}

- (void)addPoints:()vector<CRLPKInputPoint
{
  inputQueue = self->_inputQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3321888768;
  v4[2] = sub_10016C9C0;
  v4[3] = &unk_1014DAFC8;
  v4[4] = self;
  __p = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  sub_100174080(&__p, a3->__begin_, (uint64_t)a3->__end_, 0x2E8BA2E8BA2E8BA3 * ((a3->__end_ - a3->__begin_) >> 3));
  dispatch_async(inputQueue, v4);
  if (__p)
  {
    uint64_t v6 = __p;
    operator delete(__p);
  }
}

- (void)addPoint:(id *)a3
{
  inputQueue = self->_inputQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  long long v4 = *(_OWORD *)&a3->var5;
  long long v9 = *(_OWORD *)&a3->var3;
  long long v10 = v4;
  long long v11 = *(_OWORD *)&a3->var7;
  long long v5 = *(_OWORD *)&a3->var1;
  CGPoint var0 = a3->var0;
  v6[2] = sub_10016CC14;
  v6[3] = &unk_1014DAFA0;
  v6[4] = self;
  uint64_t v12 = *(void *)&a3->var9;
  long long v8 = v5;
  dispatch_async(inputQueue, v6);
}

- (void)_drawingAddPoint:(id *)a3
{
  self->_inputHasChanged = 1;
  if (!a3->var6) {
    [(CRLPKStrokeGenerator *)self removePredictedTouches];
  }
  -[CRLPKStrokeGenerator snapPointToRuler:](self, "snapPointToRuler:", a3->var0.x, a3->var0.y);
  a3->var0.double x = v5;
  a3->var0.double y = v6;
  value = self->_drawPoints.__end_cap_.__value_;
  end = self->_drawPoints.__end_;
  if (end >= value)
  {
    begin = self->_drawPoints.__begin_;
    uint64_t v15 = 0x2E8BA2E8BA2E8BA3 * ((end - begin) >> 3);
    unint64_t v16 = v15 + 1;
    if ((unint64_t)(v15 + 1) > 0x2E8BA2E8BA2E8BALL) {
      sub_100004E40();
    }
    unint64_t v17 = 0x2E8BA2E8BA2E8BA3 * ((value - begin) >> 3);
    if (2 * v17 > v16) {
      unint64_t v16 = 2 * v17;
    }
    if (v17 >= 0x1745D1745D1745DLL) {
      unint64_t v18 = 0x2E8BA2E8BA2E8BALL;
    }
    else {
      unint64_t v18 = v16;
    }
    if (v18) {
      double v19 = (char *)sub_100004EE8((uint64_t)&self->_drawPoints.__end_cap_, v18);
    }
    else {
      double v19 = 0;
    }
    double v20 = &v19[88 * v15];
    v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v19[88 * v18];
    long long v22 = *(_OWORD *)&a3->var1;
    *(CGPoint *)double v20 = a3->var0;
    *((_OWORD *)v20 + 1) = v22;
    long long v23 = *(_OWORD *)&a3->var3;
    long long v24 = *(_OWORD *)&a3->var5;
    long long v25 = *(_OWORD *)&a3->var7;
    *((void *)v20 + 10) = *(void *)&a3->var9;
    *((_OWORD *)v20 + 3) = v24;
    *((_OWORD *)v20 + 4) = v25;
    *((_OWORD *)v20 + 2) = v23;
    uint64_t v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 88);
    v27 = self->_drawPoints.__begin_;
    v26 = self->_drawPoints.__end_;
    if (v26 != v27)
    {
      do
      {
        long long v28 = *(_OWORD *)((char *)v26 - 88);
        *(_OWORD *)(v20 - 72) = *(_OWORD *)((char *)v26 - 72);
        *(_OWORD *)(v20 - 88) = v28;
        long long v29 = *(_OWORD *)((char *)v26 - 56);
        long long v30 = *(_OWORD *)((char *)v26 - 40);
        long long v31 = *(_OWORD *)((char *)v26 - 24);
        *((void *)v20 - 1) = *((void *)v26 - 1);
        *(_OWORD *)(v20 - 24) = v31;
        *(_OWORD *)(v20 - 40) = v30;
        *(_OWORD *)(v20 - 56) = v29;
        v20 -= 88;
        v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v26 - 88);
      }
      while (v26 != v27);
      v26 = self->_drawPoints.__begin_;
    }
    self->_drawPoints.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v20;
    self->_drawPoints.__end_ = v13;
    self->_drawPoints.__end_cap_.__value_ = v21;
    if (v26) {
      operator delete(v26);
    }
  }
  else
  {
    long long v9 = *(_OWORD *)&a3->var1;
    *(CGPoint *)end = a3->var0;
    *((_OWORD *)end + 1) = v9;
    long long v10 = *(_OWORD *)&a3->var3;
    long long v11 = *(_OWORD *)&a3->var5;
    long long v12 = *(_OWORD *)&a3->var7;
    *((void *)end + 10) = *(void *)&a3->var9;
    *((_OWORD *)end + 3) = v11;
    *((_OWORD *)end + 4) = v12;
    *((_OWORD *)end + 2) = v10;
    uint64_t v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 88);
  }
  self->_drawPoints.__end_ = v13;
  [(CRLPKStrokeGenerator *)self updateRulerSnapping];
  [(CRLPKStrokeGenerator *)self drawingUpdateAllPoints];
  [(CRLPKStrokeGenerator *)self updateImmutableCount];
  double x = a3->var0.x;
  double y = a3->var0.y;

  -[CRLPKStrokeGenerator setLastPoint:](self, "setLastPoint:", x, y);
}

- (void)drawingEndedWithCompletion:(id)a3
{
  id v4 = a3;
  inputQueue = self->_inputQueue;
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  long long v9 = sub_10016CFC4;
  long long v10 = &unk_1014DB028;
  long long v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(inputQueue, &v7);
  -[CRLPKStrokeGenerator setLastPoint:](self, "setLastPoint:", INFINITY, INFINITY, v7, v8, v9, v10, v11);
}

- (void)drawingCancelledWithCompletion:(id)a3
{
  id v4 = a3;
  inputQueue = self->_inputQueue;
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  long long v9 = sub_10016D4E4;
  long long v10 = &unk_1014DB050;
  long long v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(inputQueue, &v7);
  -[CRLPKStrokeGenerator setLastPoint:](self, "setLastPoint:", INFINITY, INFINITY, v7, v8, v9, v10, v11);
}

+ (vector<CRLPKInputPoint,)inputPointsFromPath:(id)a2
{
  v66 = 0;
  v67 = 0;
  uint64_t v68 = 0;
  sub_1001AEEF4(a4, &v66);
  v63 = 0;
  v64 = 0;
  uint64_t v65 = 0;
  v61 = 0;
  uint64_t v62 = 0;
  __p = 0;
  sub_100174154(&__p, v66, (uint64_t)v67, ((char *)v67 - (char *)v66) >> 4);
  sub_1001AEF8C((uint64_t *)&__p, (uint64_t)&v63);
  if (__p)
  {
    v61 = __p;
    operator delete(__p);
  }
  v57 = 0;
  v58 = 0;
  uint64_t v59 = 0;
  sub_100174154(&v57, v66, (uint64_t)v67, ((char *)v67 - (char *)v66) >> 4);
  double v5 = sub_1001AE7CC(&v57) * 0.01;
  double v6 = fabs(sqrt(v5));
  if (v5 == -INFINITY) {
    double v7 = INFINITY;
  }
  else {
    double v7 = v6;
  }
  if (v57)
  {
    v58 = v57;
    operator delete(v57);
  }
  v54 = 0;
  v55 = 0;
  uint64_t v56 = 0;
  v52 = 0;
  uint64_t v53 = 0;
  v51 = 0;
  sub_100174154(&v51, v66, (uint64_t)v67, ((char *)v67 - (char *)v66) >> 4);
  sub_10044AD6C((uint64_t)&v51, (uint64_t)&v54);
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  v48 = 0;
  v49 = 0;
  v50 = 0;
  if (v67 != v66)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    double v10 = 0.0;
    do
    {
      double v10 = v10 + v63[v9] * *((double *)v54 + v9);
      if (v8 >= v50)
      {
        long long v11 = v48;
        uint64_t v12 = v8 - v48;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 61) {
          sub_100004E40();
        }
        uint64_t v14 = (char *)v50 - (char *)v48;
        if (((char *)v50 - (char *)v48) >> 2 > v13) {
          unint64_t v13 = v14 >> 2;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v15)
        {
          unint64_t v16 = (char *)sub_10002B494((uint64_t)&v50, v15);
          long long v11 = v48;
          uint64_t v8 = v49;
        }
        else
        {
          unint64_t v16 = 0;
        }
        unint64_t v17 = (double *)&v16[8 * v12];
        *unint64_t v17 = v10;
        unint64_t v18 = v17 + 1;
        while (v8 != v11)
        {
          uint64_t v19 = *((void *)v8-- - 1);
          *((void *)v17-- - 1) = v19;
        }
        v48 = v17;
        v50 = (double *)&v16[8 * v15];
        if (v11) {
          operator delete(v11);
        }
        uint64_t v8 = v18;
      }
      else
      {
        *v8++ = v10;
      }
      v49 = v8;
      ++v9;
    }
    while (v9 < ((char *)v67 - (char *)v66) >> 4);
    uint64_t v20 = (char *)v8 - (char *)v48;
    if (v20)
    {
      uint64_t v21 = v20 >> 3;
      BOOL v22 = v20 >> 3 != 0;
      uint64_t v23 = (v20 >> 3) - 1;
      if (v23 == 0 || !v22) {
        uint64_t v21 = 1;
      }
      long long v24 = v48;
      do
      {
        *long long v24 = *v24 / v48[v23];
        ++v24;
        --v21;
      }
      while (v21);
    }
  }
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  +[NSDate timeIntervalSinceReferenceDate];
  v26 = v66;
  if (v67 != v66)
  {
    double v27 = v25;
    unint64_t v28 = 0;
    p_end_cap = &retstr->__end_cap_;
    end = retstr->__end_;
    do
    {
      unint64_t v31 = v49 - v48 - 1;
      if (v28 < v31) {
        unint64_t v31 = v28;
      }
      double v32 = v27 + v7 * v48[v31];
      v33 = (long long *)((char *)v26 + 16 * v28);
      long long v47 = *v33;
      if (end >= p_end_cap->__value_)
      {
        uint64_t v34 = 0x2E8BA2E8BA2E8BA3 * ((end - retstr->__begin_) >> 3);
        unint64_t v35 = v34 + 1;
        if ((unint64_t)(v34 + 1) > 0x2E8BA2E8BA2E8BALL) {
          sub_100004E40();
        }
        if (0x5D1745D1745D1746 * ((p_end_cap->__value_ - retstr->__begin_) >> 3) > v35) {
          unint64_t v35 = 0x5D1745D1745D1746 * ((p_end_cap->__value_ - retstr->__begin_) >> 3);
        }
        if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((p_end_cap->__value_ - retstr->__begin_) >> 3)) >= 0x1745D1745D1745DLL) {
          unint64_t v36 = 0x2E8BA2E8BA2E8BALL;
        }
        else {
          unint64_t v36 = v35;
        }
        if (v36) {
          v37 = (char *)sub_100004EE8((uint64_t)&retstr->__end_cap_, v36);
        }
        else {
          v37 = 0;
        }
        v38 = &v37[88 * v34];
        *(_OWORD *)v38 = v47;
        *((void *)v38 + 4) = 0;
        *((void *)v38 + 5) = 0;
        *((void *)v38 + 2) = 0xBFF0000000000000;
        *((void *)v38 + 3) = 0;
        *((double *)v38 + 6) = v32;
        *(_OWORD *)(v38 + 56) = xmmword_101175370;
        *((void *)v38 + 9) = 0;
        *((void *)v38 + 10) = 0;
        begin = retstr->__begin_;
        v39 = retstr->__end_;
        v41 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v38;
        if (v39 != retstr->__begin_)
        {
          do
          {
            long long v42 = *(_OWORD *)((char *)v39 - 88);
            *(_OWORD *)((char *)v41 - 72) = *(_OWORD *)((char *)v39 - 72);
            *(_OWORD *)((char *)v41 - 88) = v42;
            long long v43 = *(_OWORD *)((char *)v39 - 56);
            long long v44 = *(_OWORD *)((char *)v39 - 40);
            long long v45 = *(_OWORD *)((char *)v39 - 24);
            *((void *)v41 - 1) = *((void *)v39 - 1);
            *(_OWORD *)((char *)v41 - 24) = v45;
            *(_OWORD *)((char *)v41 - 40) = v44;
            *(_OWORD *)((char *)v41 - 56) = v43;
            v41 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v41 - 88);
            v39 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v39 - 88);
          }
          while (v39 != begin);
          v39 = begin;
        }
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v38 + 88);
        retstr->__begin_ = v41;
        retstr->__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v38 + 88);
        retstr->__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v37[88 * v36];
        if (v39) {
          operator delete(v39);
        }
      }
      else
      {
        *(_OWORD *)end = *v33;
        *((void *)end + 2) = 0xBFF0000000000000;
        *(_OWORD *)((char *)end + 24) = 0uLL;
        *((void *)end + 5) = 0;
        *((double *)end + 6) = v32;
        *(_OWORD *)((char *)end + 56) = xmmword_101175370;
        *(_OWORD *)((char *)end + 72) = 0uLL;
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 88);
      }
      retstr->__end_ = end;
      ++v28;
      v26 = v66;
    }
    while (v28 < ((char *)v67 - (char *)v66) >> 4);
  }
  if (v48) {
    operator delete(v48);
  }
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
  if (v63)
  {
    v64 = v63;
    operator delete(v63);
  }
  BOOL result = v66;
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
  return result;
}

- (id)strokeFromPath:(CGPath *)a3 inputScale:(double)a4
{
  double v7 = objc_opt_class();
  if (v7)
  {
    [v7 inputPointsFromPath:a3];
  }
  else
  {
    long long v24 = 0;
    double v25 = 0;
    uint64_t v26 = 0;
  }
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10016DDAC;
  BOOL v22 = sub_10016DDBC;
  uint64_t v23 = objc_alloc_init(CRLPKStroke);
  [(CRLPKStrokeGenerator *)self drawingBeganWithStroke:v19[5] inputType:0 inputScale:0 start:a4];
  __p = 0;
  unint64_t v16 = 0;
  uint64_t v17 = 0;
  sub_100174080(&__p, v24, (uint64_t)v25, 0x2E8BA2E8BA2E8BA3 * ((v25 - (unsigned char *)v24) >> 3));
  [(CRLPKStrokeGenerator *)self addPoints:&__p];
  if (__p)
  {
    unint64_t v16 = __p;
    operator delete(__p);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016DDC4;
  v12[3] = &unk_1014DB078;
  uint64_t v14 = &v18;
  unint64_t v9 = v8;
  unint64_t v13 = v9;
  [(CRLPKStrokeGenerator *)self drawingEndedWithCompletion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  if (v24)
  {
    double v25 = v24;
    operator delete(v24);
  }

  return v10;
}

- (void)whenFinishedProcessingPointsCallCompletion:(id)a3
{
  id v4 = a3;
  inputQueue = self->_inputQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016DEBC;
  v7[3] = &unk_1014DB028;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(inputQueue, v7);
}

- (CGAffineTransform)rulerTransform
{
  long long v3 = *(_OWORD *)&self[7].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[7].ty;
  return self;
}

- (void)setRulerTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_rulerTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_rulerTransform.tdouble x = v4;
  *(_OWORD *)&self->_rulerTransform.a = v3;
}

- (BOOL)useRuler
{
  return self->_useRuler;
}

- (void)setUseRuler:(BOOL)a3
{
  self->_useRuler = a3;
}

- (double)rulerWidth
{
  return self->_rulerWidth;
}

- (void)setRulerWidth:(double)a3
{
  self->_rulerWidth = a3;
}

- (BOOL)isSnappedToRulerTopSide
{
  return self->_isSnappedToRulerTopSide;
}

- (void)setIsSnappedToRulerTopSide:(BOOL)a3
{
  self->_isSnappedToRulerTopSide = a3;
}

- (BOOL)canSnapToRuler
{
  return self->_canSnapToRuler;
}

- (void)setCanSnapToRuler:(BOOL)a3
{
  self->_canSnapToRuler = a3;
}

- (double)strokeMaxForce
{
  return self->_strokeMaxForce;
}

- (void)setStrokeMaxForce:(double)a3
{
  self->_double strokeMaxForce = a3;
}

- (CGPoint)lastPoint
{
  objc_copyStruct(v4, &self->_lastPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setLastPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_lastPoint, &v3, 16, 1, 0);
}

- (OS_dispatch_queue)outputQueue
{
  return self->_outputQueue;
}

- (void)setOutputQueue:(id)a3
{
}

- (void)inputProvider
{
  return self->_inputProvider;
}

- (void)setInputProvider:(void *)a3
{
  self->_inputProvider = a3;
}

- (void)pixelSmoothingFilter
{
  return self->_pixelSmoothingFilter;
}

- (void)setPixelSmoothingFilter:(void *)a3
{
  self->_pixelSmoothingFilter = a3;
}

- (void)pointReductionFilter
{
  return self->_pointReductionFilter;
}

- (void)setPointReductionFilter:(void *)a3
{
  self->_pointReductionFilter = a3;
}

- (void)startHookFilter
{
  return self->_startHookFilter;
}

- (void)setStartHookFilter:(void *)a3
{
  self->_startHookFilter = a3;
}

- (void)endHookFilter
{
  return self->_endHookFilter;
}

- (void)setEndHookFilter:(void *)a3
{
  self->_endHookFilter = a3;
}

- (void)velocityFilter
{
  return self->_velocityFilter;
}

- (void)setVelocityFilter:(void *)a3
{
  self->_velocityFilter = a3;
}

- (void)inputSmoother
{
  return self->_inputSmoother;
}

- (void)setInputSmoother:(void *)a3
{
  self->_inputSmoother = a3;
}

- (void)inputToOutputFilter
{
  return self->_inputToOutputFilter;
}

- (void)setInputToOutputFilter:(void *)a3
{
  self->_inputToOutputFilter = a3;
}

- (void)startCapFilter
{
  return self->_startCapFilter;
}

- (void)setStartCapFilter:(void *)a3
{
  self->_startCapFilter = a3;
}

- (void)azimuthFilter
{
  return self->_azimuthFilter;
}

- (void)setAzimuthFilter:(void *)a3
{
  self->_azimuthFilter = a3;
}

- (void)endCapFilter
{
  return self->_endCapFilter;
}

- (void)setEndCapFilter:(void *)a3
{
  self->_endCapFilter = a3;
}

- (void)rulerExtremaFilter
{
  return self->_rulerExtremaFilter;
}

- (void)setRulerExtremaFilter:(void *)a3
{
  self->_rulerExtremaFilter = a3;
}

- (void)estimatedAltitudeAndAzimuthFilter
{
  return self->_estimatedAltitudeAndAzimuthFilter;
}

- (void)setEstimatedAltitudeAndAzimuthFilter:(void *)a3
{
  self->_estimatedAltitudeAndAzimuthFilter = a3;
}

- (void)compressionFilter
{
  return self->_compressionFilter;
}

- (void)setCompressionFilter:(void *)a3
{
  self->_compressionFilter = a3;
}

- (void)decompressionFilter
{
  return self->_decompressionFilter;
}

- (void)setDecompressionFilter:(void *)a3
{
  self->_decompressionFilter = a3;
}

- (BOOL)isSnappedToRuler
{
  return self->_isSnappedToRuler;
}

- (void)setIsSnappedToRuler:(BOOL)a3
{
  self->_isSnappedToRuler = a3;
}

- (double)eraserIndicatorAlpha
{
  return self->_eraserIndicatorAlpha;
}

- (void)setEraserIndicatorAlpha:(double)a3
{
  self->_eraserIndicatorAlpha = a3;
}

- (double)inputScale
{
  return self->_inputScale;
}

- (void)setInputScale:(double)a3
{
  self->_inputScale = a3;
}

- (double)touchSensitivity
{
  return self->_touchSensitivity;
}

- (void)setTouchSensitivity:(double)a3
{
  self->_touchSensitivitdouble y = a3;
}

- (void)noiseSmoother
{
  return self->_noiseSmoother;
}

- (void)setNoiseSmoother:(void *)a3
{
  self->_noiseSmoother = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_drawingWaitForFinishSemaphore, 0);
  begin = self->_updatedDrawPoints.__begin_;
  if (begin)
  {
    self->_updatedDrawPoints.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_currentStroke, 0);
  objc_storeStrong((id *)&self->_inputQueue, 0);
  long long v4 = self->_outputPoints.__begin_;
  if (v4)
  {
    self->_outputPoints.__end_ = v4;
    operator delete(v4);
  }
  double v5 = self->_drawPoints.__begin_;
  if (v5)
  {
    self->_drawPoints.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end