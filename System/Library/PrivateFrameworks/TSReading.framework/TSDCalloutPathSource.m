@interface TSDCalloutPathSource
+ (id)calloutWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6;
+ (id)quoteBubbleWithTailPosition:(CGPoint)a3 tailSize:(double)a4 naturalSize:(CGSize)a5;
- (BOOL)isCircular;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOval;
- (BOOL)isRectangular;
- (BOOL)isTailAtCenter;
- (CGPath)newFeedbackPathForKnob:(unint64_t)a3;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)p_adjustedCenterForPath:(id)a3;
- (CGPoint)p_getControlKnobPointForRoundedRect;
- (CGPoint)p_tailPosition;
- (CGPoint)tailCenter;
- (CGPoint)tailKnobPosition;
- (CGPoint)tailSizeKnobPosition;
- (CGSize)naturalSize;
- (TSDCalloutPathSource)init;
- (TSDCalloutPathSource)initWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6 tailAtCenter:(BOOL)a7;
- (double)cornerRadius;
- (double)maxCornerRadius;
- (double)maxTailSize;
- (double)tailSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getFeedbackStringForKnob:(unint64_t)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)p_basePath;
- (id)p_buildPath;
- (id)valueForSetSelector:(SEL)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (unint64_t)numberOfControlKnobs;
- (void)p_getTailPath:(id)a3 center:(CGPoint *)a4 tailSize:(double *)a5 intersections:(CGPoint)a6[2];
- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3;
- (void)p_setCornerRadius:(double)a3;
- (void)p_setNaturalSize:(CGSize)a3;
- (void)p_setTailAtCenter:(BOOL)a3;
- (void)p_setTailPosition:(CGPoint)a3;
- (void)p_setTailSize:(double)a3;
- (void)scaleToNaturalSize:(CGSize)a3;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setCornerRadius:(double)a3;
- (void)setTailKnobPosition:(CGPoint)a3;
- (void)setTailSize:(double)a3;
- (void)setTailSizeKnobPosition:(CGPoint)a3;
@end

@implementation TSDCalloutPathSource

- (TSDCalloutPathSource)initWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6 tailAtCenter:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.height;
  double width = a6.width;
  double y = a4.y;
  double x = a4.x;
  v17.receiver = self;
  v17.super_class = (Class)TSDCalloutPathSource;
  v14 = [(TSDCalloutPathSource *)&v17 init];
  v15 = v14;
  if (v14)
  {
    -[TSDCalloutPathSource p_setNaturalSize:](v14, "p_setNaturalSize:", width, height);
    [(TSDCalloutPathSource *)v15 p_setCornerRadius:a3];
    -[TSDCalloutPathSource p_setTailPosition:](v15, "p_setTailPosition:", x, y);
    [(TSDCalloutPathSource *)v15 p_setTailSize:a5];
    [(TSDCalloutPathSource *)v15 p_setTailAtCenter:v7];
  }
  return v15;
}

- (TSDCalloutPathSource)init
{
  return -[TSDCalloutPathSource initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:](self, "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", 0, 10.0, -50.0, 50.0, 10.0, 100.0, 100.0);
}

+ (id)calloutWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6
{
  v6 = objc_msgSend(objc_alloc((Class)a1), "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", 0, a3, a4.x, a4.y, a5, a6.width, a6.height);

  return v6;
}

+ (id)quoteBubbleWithTailPosition:(CGPoint)a3 tailSize:(double)a4 naturalSize:(CGSize)a5
{
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", 1, a5.width + 10.0, a3.x, a3.y, a4, a5.width, a5.height);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDCalloutPathSource;
  id v4 = [(TSDPathSource *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "p_setNaturalSize:", self->mNaturalSize.width, self->mNaturalSize.height);
  objc_msgSend(v4, "p_setCornerRadius:", self->mCornerRadius);
  objc_msgSend(v4, "p_setTailPosition:", self->mTailPosition.x, self->mTailPosition.y);
  objc_msgSend(v4, "p_setTailSize:", self->mTailSize);
  objc_msgSend(v4, "p_setTailAtCenter:", self->mIsTailAtCenter);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  uint64_t v20 = v6;
  uint64_t v21 = v5;
  uint64_t v22 = v3;
  uint64_t v23 = v4;
  v19.receiver = self;
  v19.super_class = (Class)TSDCalloutPathSource;
  unsigned int v9 = -[TSDPathSource isEqual:](&v19, sel_isEqual_);
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    [a3 naturalSize];
    unsigned int v9 = TSDNearlyEqualSizes(self->mNaturalSize.width, self->mNaturalSize.height, v10, v11);
    if (!v9) {
      return v9;
    }
    double mCornerRadius = self->mCornerRadius;
    [a3 cornerRadius];
    if (vabdd_f64(mCornerRadius, v13) >= 0.00999999978)
    {
LABEL_9:
      LOBYTE(v9) = 0;
      return v9;
    }
    objc_msgSend(a3, "p_tailPosition");
    unsigned int v9 = TSDNearlyEqualPoints(self->mTailPosition.x, self->mTailPosition.y, v14, v15);
    if (v9)
    {
      double mTailSize = self->mTailSize;
      [a3 tailSize];
      LOBYTE(v9) = vabdd_f64(mTailSize, v17) < 0.00999999978;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);

  return [(NSString *)v3 hash];
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)TSDCalloutPathSource;
  uint64_t v3 = objc_msgSend(-[TSDCalloutPathSource description](&v8, sel_description), "mutableCopy");
  double mCornerRadius = self->mCornerRadius;
  uint64_t v5 = NSString;
  uint64_t v6 = NSStringFromCGPoint(self->mTailPosition);
  objc_msgSend(v3, "appendString:", objc_msgSend(v5, "stringWithFormat:", @"; corner radius=%f; tail position=%@, tail size=%f natural size=%@",
      *(void *)&mCornerRadius,
      v6,
      *(void *)&self->mTailSize,
      NSStringFromCGSize(self->mNaturalSize)));
  return v3;
}

- (unint64_t)numberOfControlKnobs
{
  return 3;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  switch(a3)
  {
    case 0xEuLL:
      [(TSDCalloutPathSource *)self tailSizeKnobPosition];
      break;
    case 0xDuLL:
      [(TSDCalloutPathSource *)self p_getControlKnobPointForRoundedRect];
      break;
    case 0xCuLL:
      [(TSDCalloutPathSource *)self tailKnobPosition];
      break;
    default:
      double v3 = *MEMORY[0x263F00148];
      double v4 = *(double *)(MEMORY[0x263F00148] + 8);
      break;
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  switch(a3)
  {
    case 0xEuLL:
      -[TSDCalloutPathSource setTailSizeKnobPosition:](self, "setTailSizeKnobPosition:", a4.x, a4.y);
      break;
    case 0xDuLL:
      -[TSDCalloutPathSource p_setControlKnobPointForRoundedRect:](self, "p_setControlKnobPointForRoundedRect:", a4.x, a4.y);
      break;
    case 0xCuLL:
      -[TSDCalloutPathSource setTailKnobPosition:](self, "setTailKnobPosition:", a4.x, a4.y);
      break;
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  if (a3 != 13) {
    return &stru_26D688A48;
  }
  [(TSDCalloutPathSource *)self cornerRadius];
  double v5 = v4;
  [(TSDCalloutPathSource *)self maxCornerRadius];
  if (v5 < v6) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"Radius: %d pt", &stru_26D688A48, @"TSDrawables"), (int)self->mCornerRadius);
  }
  objc_super v8 = (void *)TSDBundle();

  return (id)[v8 localizedStringForKey:@"Oval" value:&stru_26D688A48 table:@"TSDrawables"];
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  return 0;
}

- (void)setCornerRadius:(double)a3
{
  [(TSDCalloutPathSource *)self p_setCornerRadius:a3];
  double mCornerRadius = self->mCornerRadius;
  double v5 = 0.0;
  if (mCornerRadius >= 0.0)
  {
    [(TSDCalloutPathSource *)self maxCornerRadius];
    if (mCornerRadius < v6) {
      return;
    }
    [(TSDCalloutPathSource *)self maxCornerRadius];
    double v5 = v7 + 1.0;
  }
  self->double mCornerRadius = v5;
}

- (BOOL)isOval
{
  double mCornerRadius = self->mCornerRadius;
  [(TSDCalloutPathSource *)self maxCornerRadius];
  return mCornerRadius >= v3;
}

- (double)cornerRadius
{
  return self->mCornerRadius;
}

- (double)maxCornerRadius
{
  return fmin(self->mNaturalSize.height, self->mNaturalSize.width) * 0.5;
}

- (void)setTailSize:(double)a3
{
  [(TSDCalloutPathSource *)self p_setTailSize:a3];
  CGFloat height = self->mNaturalSize.height;
  if (height <= self->mNaturalSize.width) {
    CGFloat height = self->mNaturalSize.width;
  }
  double mTailSize = self->mTailSize;
  if (mTailSize > height || (CGFloat height = -height, mTailSize < height)) {
    self->double mTailSize = height;
  }
}

- (double)tailSize
{
  return self->mTailSize;
}

- (CGPoint)tailSizeKnobPosition
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(TSDCalloutPathSource *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  [(TSDCalloutPathSource *)self p_getTailPath:[(TSDCalloutPathSource *)self p_basePath] center:0 tailSize:0 intersections:&v12];
  if (v12 + v13 >= v14 + v15) {
    double v7 = v15;
  }
  else {
    double v7 = v13;
  }
  if (v12 + v13 >= v14 + v15) {
    double v8 = v14;
  }
  else {
    double v8 = v12;
  }
  if ([(TSDPathSource *)self hasHorizontalFlip]) {
    double v9 = v4 - v8;
  }
  else {
    double v9 = v8;
  }
  if ([(TSDPathSource *)self hasVerticalFlip]) {
    double v10 = v6 - v7;
  }
  else {
    double v10 = v7;
  }
  double v11 = v9;
  result.double y = v10;
  result.double x = v11;
  return result;
}

- (double)maxTailSize
{
  v34[4] = *(double *)MEMORY[0x263EF8340];
  [(TSDCalloutPathSource *)self p_tailPosition];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(TSDCalloutPathSource *)self p_basePath];
  [(TSDCalloutPathSource *)self p_adjustedCenterForPath:v7];
  double v9 = v8;
  double v11 = v10;
  double v12 = TSDDistance(v4, v6, v8, v10);
  v34[0] = v4;
  v34[1] = v6;
  v34[2] = v9;
  v34[3] = v11;
  double v27 = 0.0;
  double v28 = 0.0;
  uint64_t v13 = [v7 elementCount];
  if (v13 < 1)
  {
    double v24 = 0.0;
    double v25 = 0.0;
    return fmin(v25, -v24) * 0.899999976;
  }
  uint64_t v14 = v13;
  double v15 = TSDSubtractPoints(v9, v11, v4);
  double v17 = TSDNormalizePoint(v15, v16);
  double v19 = v18;
  for (uint64_t i = 0; i != v14; ++i)
  {
    uint64_t v21 = [v7 elementAtIndex:i allPoints:&v29];
    if (v21 == 2)
    {
      p_getMaxMinTailSize(v34, &v28, &v27, v29.f64[0], v29.f64[1], v17, v19, v4, v6, v12);
      p_getMaxMinTailSize(v34, &v28, &v27, v32, v33, v17, v19, v4, v6, v12);
      double v22 = TSDPointOnCurve(&v29, 0.5);
    }
    else
    {
      if (v21 != 1) {
        continue;
      }
      p_getMaxMinTailSize(v34, &v28, &v27, v29.f64[0], v29.f64[1], v17, v19, v4, v6, v12);
      double v22 = v30;
      double v23 = v31;
    }
    p_getMaxMinTailSize(v34, &v28, &v27, v22, v23, v17, v19, v4, v6, v12);
  }
  double v24 = v27;
  double v25 = v28;
  return fmin(v25, -v24) * 0.899999976;
}

- (void)setTailSizeKnobPosition:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v31 = *MEMORY[0x263EF8340];
  [(TSDCalloutPathSource *)self naturalSize];
  double v6 = v5;
  if ([(TSDPathSource *)self hasHorizontalFlip]) {
    double x = v6 - x;
  }
  [(TSDPathSource *)self hasVerticalFlip];
  double v28 = 0.0;
  double v29 = 0.0;
  [(TSDCalloutPathSource *)self p_getTailPath:[(TSDCalloutPathSource *)self p_basePath] center:&v28 tailSize:0 intersections:v30];
  [(TSDCalloutPathSource *)self p_tailPosition];
  double v8 = v7;
  double v10 = v9;
  double v11 = TSDSubtractPoints(v7, v9, x);
  double v13 = TSDNormalizePoint(v11, v12);
  double v15 = v14;
  double v16 = v28;
  double v17 = v29;
  double v18 = TSDSubtractPoints(v8, v10, v28);
  double v20 = TSDNormalizePoint(v18, v19);
  double v22 = v21;
  double v27 = TSDDotPoints(v13, v15, v20, v21);
  double v23 = TSDRotatePoint90Degrees(1, v20, v22);
  double v25 = fabs(TSDDotPoints(v13, v15, v23, v24));
  double v26 = v25 * (TSDDistance(v8, v10, v16, v17) / v27);
  if (fabs(v26) < 1.0) {
    double v26 = 1.0;
  }
  self->double mTailSize = v26;
}

- (void)setTailKnobPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSDCalloutPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  if ([(TSDPathSource *)self hasHorizontalFlip]) {
    double x = v7 - x;
  }
  if ([(TSDPathSource *)self hasVerticalFlip]) {
    double v10 = v9 - y;
  }
  else {
    double v10 = y;
  }
  double v11 = TSDMultiplyPointScalar(x, v10, 1.0);

  [(TSDCalloutPathSource *)self p_setTailPosition:v11];
}

- (CGPoint)tailKnobPosition
{
  double x = self->mTailPosition.x;
  double y = self->mTailPosition.y;
  [(TSDCalloutPathSource *)self naturalSize];
  double v6 = v5;
  double v8 = v7;
  if ([(TSDPathSource *)self hasHorizontalFlip]) {
    double v9 = v6 - x;
  }
  else {
    double v9 = x;
  }
  if ([(TSDPathSource *)self hasVerticalFlip]) {
    double v10 = v8 - y;
  }
  else {
    double v10 = y;
  }
  double v11 = v9;
  result.double y = v10;
  result.double x = v11;
  return result;
}

- (id)valueForSetSelector:(SEL)a3
{
  if (sel_setCornerRadiusValue_ == a3)
  {
    double v4 = NSNumber;
    [(TSDCalloutPathSource *)self cornerRadius];
  }
  else
  {
    if (sel_setTailPositionValue_ == a3)
    {
      double v6 = (void *)MEMORY[0x263F08D40];
      [(TSDCalloutPathSource *)self tailKnobPosition];
LABEL_13:
      return (id)objc_msgSend(v6, "valueWithCGPoint:");
    }
    if (sel_setTailSizeValue_ != a3)
    {
      if (sel_setTailSizeKnobPosition_ != a3)
      {
        v7.receiver = self;
        v7.super_class = (Class)TSDCalloutPathSource;
        return -[TSDPathSource valueForSetSelector:](&v7, sel_valueForSetSelector_);
      }
      double v6 = NSNumber;
      [(TSDCalloutPathSource *)self tailSizeKnobPosition];
      goto LABEL_13;
    }
    double v4 = NSNumber;
    [(TSDCalloutPathSource *)self tailSize];
  }
  *(float *)&double v5 = v5;

  return (id)[v4 numberWithFloat:v5];
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[TSDPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:");
  double v7 = v6;
  [(TSDCalloutPathSource *)self naturalSize];
  double v9 = v8;
  BOOL v10 = [(TSDCalloutPathSource *)self isOval];
  p_mTailPosition = &self->mTailPosition;
  double v12 = *MEMORY[0x263F00148];
  if (self->mTailPosition.x > v9 * 0.5)
  {
    double v13 = width / v9 + -1.0;
    if (fabs(v13) > 0.001) {
      double v12 = (width - v9) * ((width / v9 - v7) / v13);
    }
  }
  self->double mTailSize = v7 * self->mTailSize;
  double v14 = TSDMultiplyPointScalar(p_mTailPosition->x, self->mTailPosition.y, v7);
  p_mTailPosition->double x = TSDAddPoints(v14, v15, v12);
  self->mTailPosition.double y = v16;
  -[TSDCalloutPathSource p_setNaturalSize:](self, "p_setNaturalSize:", width, height);
  [(TSDCalloutPathSource *)self maxCornerRadius];
  if (v10) {
    double v18 = v17 + 1.0;
  }
  else {
    double v18 = fmin(v17 + -0.001, v7 * self->mCornerRadius);
  }
  self->double mCornerRadius = v18;
}

- (CGSize)naturalSize
{
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)tailCenter
{
  if (self->mIsTailAtCenter)
  {
    double v3 = self->mNaturalSize.width * 0.5;
    double v4 = self->mNaturalSize.height * 0.5;
  }
  else
  {
    [(TSDCalloutPathSource *)self p_tailPosition];
    double v3 = v6;
    double v8 = v7;
    [(TSDCalloutPathSource *)self cornerRadius];
    double v4 = v9;
    if (v3 <= v9 || v3 >= self->mNaturalSize.width - v9)
    {
      if (v8 <= v9 || v8 >= self->mNaturalSize.height - v9)
      {
        BOOL v10 = v3 > v9;
        double v3 = v9;
        if (v10) {
          double v3 = self->mNaturalSize.width - v9;
        }
        if (v8 > v9) {
          double v4 = self->mNaturalSize.height - v9;
        }
      }
      else
      {
        double v3 = self->mNaturalSize.width * 0.5;
        double v4 = v8;
      }
    }
    else
    {
      double v4 = self->mNaturalSize.height * 0.5;
    }
  }
  double v5 = v3;
  result.double y = v4;
  result.double x = v5;
  return result;
}

- (BOOL)isTailAtCenter
{
  return self->mIsTailAtCenter;
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__TSDCalloutPathSource_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __45__TSDCalloutPathSource_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (unsigned __int8 *)TSUDynamicCast();
  if (!v2)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDCalloutPathSource mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCalloutPathSource.m"), 498, @"nil object after cast");
  }
  double v5 = *(unsigned __int8 **)(a1 + 40);
  if (v5[64] != v2[64]) {
    return 1;
  }
  [v5 naturalSize];
  double v7 = v6;
  double v9 = v8;
  [v2 naturalSize];
  if (!TSDNearlyEqualSizes(v7, v9, v10, v11)) {
    return 3;
  }
  objc_msgSend(*(id *)(a1 + 40), "p_tailPosition");
  double v13 = v12;
  double v15 = v14;
  objc_msgSend(v2, "p_tailPosition");
  if (!TSDNearlyEqualPoints(v13, v15, v16, v17)) {
    return 3;
  }
  [*(id *)(a1 + 40) cornerRadius];
  double v19 = v18;
  [v2 cornerRadius];
  if (vabdd_f64(v19, v20) < 0.00999999978
    && ([*(id *)(a1 + 40) tailSize],
        double v22 = v21,
        [v2 tailSize],
        vabdd_f64(v22, v23) < 0.00999999978))
  {
    return 4;
  }
  else
  {
    return 3;
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__TSDCalloutPathSource_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDCalloutPathSource *__57__TSDCalloutPathSource_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  double v3 = [TSDCalloutPathSource alloc];
  [*(id *)(a1 + 40) cornerRadius];
  [v2 cornerRadius];
  TSUMix();
  double v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "p_tailPosition");
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(v2, "p_tailPosition");
  double v12 = TSDMixPoints(v7, v9, v10, v11, *(double *)(a1 + 48));
  double v14 = v13;
  [*(id *)(a1 + 40) tailSize];
  [v2 tailSize];
  TSUMix();
  double v16 = v15;
  [*(id *)(a1 + 40) naturalSize];
  double v18 = v17;
  double v20 = v19;
  [v2 naturalSize];
  double v23 = TSDMixSizes(v18, v20, v21, v22, *(double *)(a1 + 48));
  double v25 = -[TSDCalloutPathSource initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:](v3, "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", *(unsigned __int8 *)(*(void *)(a1 + 40) + 64), v5, v12, v14, v16, v23, v24);

  return v25;
}

- (void)p_setCornerRadius:(double)a3
{
  self->double mCornerRadius = a3;
}

- (void)p_setTailPosition:(CGPoint)a3
{
  self->mTailPosition = a3;
}

- (CGPoint)p_tailPosition
{
  double x = self->mTailPosition.x;
  double y = self->mTailPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)p_setTailSize:(double)a3
{
  self->double mTailSize = a3;
}

- (void)p_setNaturalSize:(CGSize)a3
{
  self->mNaturalSize = a3;
}

- (void)p_setTailAtCenter:(BOOL)a3
{
  self->mIsTailAtCenter = a3;
}

- (CGPoint)p_adjustedCenterForPath:(id)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  [(TSDCalloutPathSource *)self tailCenter];
  double v6 = v5;
  double v8 = v7;
  [(TSDCalloutPathSource *)self p_tailPosition];
  v16[0] = v9;
  v16[1] = v10;
  *(double *)&v16[2] = v6;
  *(double *)&v16[3] = v8;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  [a3 addIntersectionsWithLine:v16 to:v11];
  if ([v11 count])
  {
    objc_msgSend((id)objc_msgSend(v11, "lastObject"), "point");
    double v6 = v12;
    double v8 = v13;
  }

  double v14 = v6;
  double v15 = v8;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)p_getTailPath:(id)a3 center:(CGPoint *)a4 tailSize:(double *)a5 intersections:(CGPoint)a6[2]
{
  v87[4] = *(double *)MEMORY[0x263EF8340];
  [(TSDCalloutPathSource *)self tailSize];
  double v12 = v11;
  [(TSDCalloutPathSource *)self p_tailPosition];
  double v14 = v13;
  double v16 = v15;
  [(TSDCalloutPathSource *)self p_adjustedCenterForPath:a3];
  double v18 = v17;
  double v20 = v19;
  [(TSDCalloutPathSource *)self maxTailSize];
  double v22 = fmin(fabs(v12), v21);
  double v23 = TSDSubtractPoints(v14, v16, v18);
  double v25 = TSDNormalizePoint(v23, v24);
  double v84 = v22;
  double v27 = TSDMultiplyPointScalar(v25, v26, v22);
  double v29 = TSDRotatePoint90Degrees(1, v27, v28);
  v87[0] = v14;
  v87[1] = v16;
  double v30 = TSDAddPoints(v18, v20, v29);
  double v32 = TSDSubtractPoints(v30, v31, v14);
  double v34 = TSDMultiplyPointScalar(v32, v33, 20.0);
  v87[2] = TSDAddPoints(v14, v16, v34);
  v87[3] = v35;
  v86[0] = v14;
  v86[1] = v16;
  CGFloat v85 = v20;
  double v36 = TSDSubtractPoints(v18, v20, v29);
  double v38 = TSDSubtractPoints(v36, v37, v14);
  double v40 = TSDMultiplyPointScalar(v38, v39, 20.0);
  v86[2] = TSDAddPoints(v14, v16, v40);
  v86[3] = v41;
  id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
  [a3 addIntersectionsWithLine:v87 to:v42];
  [a3 addIntersectionsWithLine:v86 to:v43];
  if ([v42 count])
  {
    objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", 0), "point");
    double v45 = v44;
    double v47 = v46;
    objc_msgSend((id)objc_msgSend(v42, "lastObject"), "point");
    double v49 = v48;
    double v51 = v50;
    double v52 = TSDDistance(v45, v47, v14, v16);
    double v53 = TSDDistance(v49, v51, v14, v16);
    BOOL v54 = v52 < v53;
    if (v52 >= v53) {
      double v55 = v51;
    }
    else {
      double v55 = v47;
    }
    if (v54) {
      double v56 = v45;
    }
    else {
      double v56 = v49;
    }
    double v57 = TSDSubtractPoints(v56, v55, v14);
    double v59 = TSDNormalizePoint(v57, v58);
    double v60 = TSDAddPoints(v56, v55, v59);
  }
  else
  {
    double v60 = TSDPathNearestAngleOnPathToLine((const CGPath *)[a3 CGPath], v87);
  }
  CGFloat v62 = v60;
  CGFloat v63 = v61;
  if ([v43 count])
  {
    objc_msgSend((id)objc_msgSend(v43, "objectAtIndex:", 0), "point");
    double v83 = v62;
    double v65 = v64;
    double v67 = v66;
    objc_msgSend((id)objc_msgSend(v43, "lastObject"), "point");
    double v69 = v68;
    double v82 = v18;
    double v71 = v70;
    double v72 = TSDDistance(v65, v67, v14, v16);
    if (v72 >= TSDDistance(v69, v71, v14, v16)) {
      double v65 = v69;
    }
    else {
      double v71 = v67;
    }
    double v73 = TSDSubtractPoints(v65, v71, v14);
    double v75 = TSDNormalizePoint(v73, v74);
    double v76 = v65;
    double v77 = v71;
    double v18 = v82;
    CGFloat v62 = v83;
    double v78 = TSDAddPoints(v76, v77, v75);
  }
  else
  {
    double v78 = TSDPathNearestAngleOnPathToLine((const CGPath *)[a3 CGPath], v86);
  }
  CGFloat v80 = v78;
  CGFloat v81 = v79;

  a6->double x = v62;
  a6->double y = v63;
  a6[1].double x = v80;
  a6[1].double y = v81;
  if (a4)
  {
    a4->double x = v18;
    a4->double y = v85;
  }
  if (a5) {
    *a5 = v84;
  }
}

- (id)p_basePath
{
  [(TSDCalloutPathSource *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  [(TSDCalloutPathSource *)self cornerRadius];
  double v8 = v7;
  [(TSDCalloutPathSource *)self maxCornerRadius];
  double v10 = v9;
  id v11 = +[TSDBezierPath bezierPath];
  [(TSDCalloutPathSource *)self cornerRadius];
  double v13 = v12;
  [(TSDCalloutPathSource *)self maxCornerRadius];
  if (v13 >= v14)
  {
    objc_msgSend(v11, "appendBezierPathWithOvalInRect:", -0.5, -0.5, 1.0, 1.0);
    [v11 closePath];
    memset(&v30, 0, sizeof(v30));
    CGAffineTransformMakeScale(&v30, self->mNaturalSize.width, self->mNaturalSize.height);
    CGAffineTransform v28 = v30;
    CGAffineTransformTranslate(&v29, &v28, 0.5, 0.5);
    CGAffineTransform v30 = v29;
    CGAffineTransform v28 = v29;
    CGAffineTransformRotate(&v29, &v28, 0.785398163);
    CGAffineTransform v30 = v29;
    [v11 transformUsingAffineTransform:&v29];
  }
  else
  {
    double v15 = *MEMORY[0x263F00148];
    double v16 = *(double *)(MEMORY[0x263F00148] + 8);
    double v17 = fmin(v8, v10);
    double v18 = TSDAddPoints(0.0, v6, 0.0);
    double v20 = v19;
    objc_msgSend(v11, "moveToPoint:");
    double v21 = TSDAddPoints(v15, v16, v17);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", v15, v16, v21, v22, v17);
    double v23 = TSDSubtractPoints(v4, 0.0, 0.0);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", v4, 0.0, v23, v24, v17);
    double v25 = TSDSubtractPoints(v4, v6, v17);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", v4, v6, v25, v26, v17);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", 0.0, v6, v18, v20, v17);
    [v11 closePath];
  }
  return v11;
}

- (id)p_buildPath
{
  v11[4] = *(double *)MEMORY[0x263EF8340];
  id v3 = [(TSDCalloutPathSource *)self p_basePath];
  [(TSDCalloutPathSource *)self p_tailPosition];
  double v5 = v4;
  double v7 = v6;
  if ((objc_msgSend(v3, "containsPoint:") & 1) == 0)
  {
    [(TSDCalloutPathSource *)self p_getTailPath:v3 center:0 tailSize:0 intersections:v11];
    id v8 = +[TSDBezierPath bezierPath];
    objc_msgSend(v8, "moveToPoint:", v11[0], v11[1]);
    objc_msgSend(v8, "lineToPoint:", v5, v7);
    objc_msgSend(v8, "lineToPoint:", v11[2], v11[3]);
    id v9 = +[TSDBezierPath uniteBezierPaths:](TSDBezierPath, "uniteBezierPaths:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v3, v8, 0));
    if ([v9 elementCount]) {
      return v9;
    }
  }
  return v3;
}

- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3
{
  [(TSDCalloutPathSource *)self maxCornerRadius];
  TSUClamp();

  -[TSDCalloutPathSource setCornerRadius:](self, "setCornerRadius:");
}

- (CGPoint)p_getControlKnobPointForRoundedRect
{
  [(TSDCalloutPathSource *)self maxCornerRadius];
  TSUClamp();
  *(float *)&double v2 = v2;
  double v3 = *(float *)&v2;
  double v4 = 0.0;
  result.double y = v4;
  result.double x = v3;
  return result;
}

@end