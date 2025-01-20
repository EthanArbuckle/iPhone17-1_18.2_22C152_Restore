@interface CRLCalloutPathSource
+ (id)calloutWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6;
+ (id)quoteBubbleWithTailPosition:(CGPoint)a3 tailSize:(double)a4 naturalSize:(CGSize)a5;
- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3;
- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3;
- (BOOL)isCircular;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOval;
- (BOOL)isRectangular;
- (BOOL)isTailAtCenter;
- (CGPath)newFeedbackPathForKnob:(unint64_t)a3;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)p_adjustedCenterForPath:(id)a3;
- (CGPoint)p_getControlKnobPointForRoundedRect;
- (CGPoint)p_tailCenter;
- (CGPoint)p_tailPosition;
- (CGPoint)rawTailPosition;
- (CGPoint)tailKnobPosition;
- (CGPoint)tailSizeKnobPosition;
- (CGSize)naturalSize;
- (CRLCalloutPathSource)init;
- (CRLCalloutPathSource)initWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6 tailAtCenter:(BOOL)a7;
- (double)clampedCalloutTailSize;
- (double)clampedCornerRadius;
- (double)cornerRadius;
- (double)maxCornerRadius;
- (double)maxTailSize;
- (double)minCornerRadius;
- (double)minTailSize;
- (double)tailSize;
- (id)bezierPathWithoutFlips;
- (id)copy;
- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3;
- (id)crlaxValueForKnobTag:(unint64_t)a3;
- (id)description;
- (id)getFeedbackStringForKnob:(unint64_t)a3;
- (id)inferredAccessibilityDescription;
- (id)inferredAccessibilityDescriptionNoShapeNames;
- (id)inferredLocalizedAccessibilityDescriptionPlaceholder;
- (id)name;
- (id)p_basePath;
- (id)p_buildPath;
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
- (void)setRawTailPosition:(CGPoint)a3;
- (void)setTailKnobPosition:(CGPoint)a3;
- (void)setTailSize:(double)a3;
- (void)setTailSizeKnobPosition:(CGPoint)a3;
@end

@implementation CRLCalloutPathSource

- (CRLCalloutPathSource)initWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6 tailAtCenter:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.height;
  double width = a6.width;
  double y = a4.y;
  double x = a4.x;
  v17.receiver = self;
  v17.super_class = (Class)CRLCalloutPathSource;
  v14 = [(CRLCalloutPathSource *)&v17 init];
  v15 = v14;
  if (v14)
  {
    -[CRLCalloutPathSource p_setNaturalSize:](v14, "p_setNaturalSize:", width, height);
    [(CRLCalloutPathSource *)v15 p_setCornerRadius:a3];
    -[CRLCalloutPathSource p_setTailPosition:](v15, "p_setTailPosition:", x, y);
    [(CRLCalloutPathSource *)v15 p_setTailSize:a5];
    [(CRLCalloutPathSource *)v15 p_setTailAtCenter:v7];
  }
  return v15;
}

- (CRLCalloutPathSource)init
{
  return -[CRLCalloutPathSource initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:](self, "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", 0, 10.0, -50.0, 50.0, 10.0, 100.0, 100.0);
}

+ (id)calloutWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6
{
  id v6 = [objc_alloc((Class)a1) initWithCornerRadius:0 tailPosition:a3 tailSize:a4.x tailAtCenter:a4.y naturalSize:a5 tailAtCenter:a6.width naturalSize:a6.height];

  return v6;
}

+ (id)quoteBubbleWithTailPosition:(CGPoint)a3 tailSize:(double)a4 naturalSize:(CGSize)a5
{
  id v5 = [objc_alloc((Class)a1) initWithCornerRadius:1 tailPosition:a5.width + 10.0 tailSize:a3.x tailAtCenter:a3.y naturalSize:a5.width tailAtCenter:a5.height];

  return v5;
}

- (id)copy
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCalloutPathSource;
  id v3 = [(CRLCalloutPathSource *)&v5 copy];
  [v3 p_setNaturalSize:self->_naturalSize.width, self->_naturalSize.height];
  [v3 p_setCornerRadius:self->_cornerRadius];
  [v3 p_setTailPosition:self->_tailPosition.x, self->_tailPosition.y];
  [v3 p_setTailSize:self->_tailSize];
  [v3 p_setTailAtCenter:self->_isTailAtCenter];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRLCalloutPathSource *)a3;
  if (v4 == self)
  {
    BOOL v16 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CRLCalloutPathSource;
    if ([(CRLPathSource *)&v18 isEqual:v4])
    {
      uint64_t v5 = objc_opt_class();
      id v6 = sub_1002469D0(v5, v4);
      BOOL v7 = v6;
      if (v6
        && ([v6 naturalSize], sub_100064084(self->_naturalSize.width, self->_naturalSize.height, v8, v9))
        && ((double cornerRadius = self->_cornerRadius, [v7 cornerRadius], cornerRadius == v11)
         || vabdd_f64(cornerRadius, v11) < 0.00999999978)
        && (objc_msgSend(v7, "p_tailPosition"), sub_100064084(self->_tailPosition.x, self->_tailPosition.y, v12, v13)))
      {
        double tailSize = self->_tailSize;
        [v7 tailSize];
        BOOL v16 = vabdd_f64(tailSize, v15) < 0.00999999978 || tailSize == v15;
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)CRLCalloutPathSource;
  id v3 = [(CRLCalloutPathSource *)&v11 description];
  id v4 = [v3 mutableCopy];

  double cornerRadius = self->_cornerRadius;
  id v6 = NSStringFromCGPoint(self->_tailPosition);
  double tailSize = self->_tailSize;
  double v8 = NSStringFromCGSize(self->_naturalSize);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"; corner radius=%f; tail position=%@, tail size=%f natural size=%@",
    *(void *)&cornerRadius,
    v6,
    *(void *)&tailSize,
  double v9 = v8);
  [v4 appendString:v9];

  return v4;
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
      [(CRLCalloutPathSource *)self tailSizeKnobPosition];
      break;
    case 0xDuLL:
      [(CRLCalloutPathSource *)self p_getControlKnobPointForRoundedRect];
      break;
    case 0xCuLL:
      [(CRLCalloutPathSource *)self tailKnobPosition];
      break;
    default:
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      break;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  switch(a3)
  {
    case 0xEuLL:
      -[CRLCalloutPathSource setTailSizeKnobPosition:](self, "setTailSizeKnobPosition:", a4.x, a4.y);
      break;
    case 0xDuLL:
      -[CRLCalloutPathSource p_setControlKnobPointForRoundedRect:](self, "p_setControlKnobPointForRoundedRect:", a4.x, a4.y);
      break;
    case 0xCuLL:
      -[CRLCalloutPathSource setTailKnobPosition:](self, "setTailKnobPosition:", a4.x, a4.y);
      break;
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  if (a3 == 13)
  {
    [(CRLCalloutPathSource *)self cornerRadius];
    double v5 = v4;
    [(CRLCalloutPathSource *)self maxCornerRadius];
    if (v5 >= v6)
    {
      BOOL v7 = +[NSBundle mainBundle];
      double v9 = [v7 localizedStringForKey:@"Oval" value:0 table:0];
    }
    else
    {
      BOOL v7 = +[NSBundle mainBundle];
      double v8 = [v7 localizedStringForKey:@"Radius: %d pt" value:0 table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, (int)self->_cornerRadius);
      double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    double v9 = &stru_101538650;
  }

  return v9;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  return 0;
}

- (void)setCornerRadius:(double)a3
{
  [(CRLCalloutPathSource *)self p_setCornerRadius:a3];
  double cornerRadius = self->_cornerRadius;
  double v5 = 0.0;
  if (cornerRadius >= 0.0)
  {
    [(CRLCalloutPathSource *)self maxCornerRadius];
    if (cornerRadius < v6) {
      return;
    }
    [(CRLCalloutPathSource *)self maxCornerRadius];
    double v5 = v7 + 1.0;
  }
  self->_double cornerRadius = v5;
}

- (BOOL)isOval
{
  double cornerRadius = self->_cornerRadius;
  [(CRLCalloutPathSource *)self maxCornerRadius];
  return cornerRadius >= v3;
}

- (double)clampedCornerRadius
{
  [(CRLCalloutPathSource *)self cornerRadius];
  double v4 = v3;
  [(CRLCalloutPathSource *)self maxCornerRadius];
  return fmin(v4, v5);
}

- (double)maxCornerRadius
{
  return fmin(self->_naturalSize.height, self->_naturalSize.width) * 0.5;
}

- (double)minCornerRadius
{
  return 0.0;
}

- (void)setTailSize:(double)a3
{
  [(CRLCalloutPathSource *)self p_setTailSize:a3];
  CGFloat height = self->_naturalSize.height;
  if (height < self->_naturalSize.width) {
    CGFloat height = self->_naturalSize.width;
  }
  double tailSize = self->_tailSize;
  if (tailSize > height || (CGFloat height = -height, tailSize < height)) {
    self->_double tailSize = height;
  }
}

- (CGPoint)tailSizeKnobPosition
{
  [(CRLCalloutPathSource *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CRLCalloutPathSource *)self p_basePath];
  [(CRLCalloutPathSource *)self p_getTailPath:v7 center:0 tailSize:0 intersections:&v14];
  if (v14 + v15 >= v16 + v17) {
    double v8 = v17;
  }
  else {
    double v8 = v15;
  }
  if (v14 + v15 >= v16 + v17) {
    double v9 = v16;
  }
  else {
    double v9 = v14;
  }
  if ([(CRLPathSource *)self hasHorizontalFlip]) {
    double v10 = v4 - v9;
  }
  else {
    double v10 = v9;
  }
  if ([(CRLPathSource *)self hasVerticalFlip]) {
    double v11 = v6 - v8;
  }
  else {
    double v11 = v8;
  }

  double v12 = v10;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (double)minTailSize
{
  return 5.0;
}

- (double)maxTailSize
{
  [(CRLCalloutPathSource *)self p_tailPosition];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CRLCalloutPathSource *)self p_basePath];
  [(CRLCalloutPathSource *)self p_adjustedCenterForPath:v7];
  double v9 = v8;
  double v11 = v10;
  double v12 = sub_1000653B4(v4, v6, v8, v10);
  v39[0] = v4;
  v39[1] = v6;
  v39[2] = v9;
  v39[3] = v11;
  double v32 = 0.0;
  double v33 = 0.0;
  uint64_t v13 = (uint64_t)[v7 elementCount];
  if (v13 < 1)
  {
    double v25 = 0.0;
    double v26 = 0.0;
    goto LABEL_11;
  }
  uint64_t v15 = v13;
  double v16 = sub_100064680(v9, v11, v4);
  double v18 = sub_100064660(v16, v17);
  double v20 = v19;
  for (uint64_t i = 0; i != v15; ++i)
  {
    id v22 = [v7 elementAtIndex:i allPoints:&v34];
    if (v22 == (id)2)
    {
      sub_10024BCE4(v39, &v33, &v32, v34.f64[0], v34.f64[1], v18, v20, v4, v6, v12);
      sub_10024BCE4(v39, &v33, &v32, v37, v38, v18, v20, v4, v6, v12);
      double v23 = sub_100064570(&v34, 0.5);
    }
    else
    {
      if (v22 != (id)1) {
        continue;
      }
      sub_10024BCE4(v39, &v33, &v32, v34.f64[0], v34.f64[1], v18, v20, v4, v6, v12);
      double v23 = v35;
      double v24 = v36;
    }
    double v14 = sub_10024BCE4(v39, &v33, &v32, v23, v24, v18, v20, v4, v6, v12);
  }
  double v25 = v32;
  double v26 = v33;
LABEL_11:
  [(CRLCalloutPathSource *)self minTailSize];
  double v28 = v27;

  float v29 = fmin(v26, -v25) * 0.899999976;
  float v30 = v28;
  return fmaxf(v29, v30);
}

- (double)clampedCalloutTailSize
{
  [(CRLCalloutPathSource *)self tailSize];
  double v4 = v3;
  [(CRLCalloutPathSource *)self maxTailSize];
  return fmin(v4, v5);
}

- (void)setTailSizeKnobPosition:(CGPoint)a3
{
  double x = a3.x;
  [(CRLCalloutPathSource *)self naturalSize];
  double v6 = v5;
  if ([(CRLPathSource *)self hasHorizontalFlip]) {
    double x = v6 - x;
  }
  [(CRLPathSource *)self hasVerticalFlip];
  double v29 = 0.0;
  double v30 = 0.0;
  double v7 = [(CRLCalloutPathSource *)self p_basePath];
  [(CRLCalloutPathSource *)self p_getTailPath:v7 center:&v29 tailSize:0 intersections:v31];
  [(CRLCalloutPathSource *)self p_tailPosition];
  double v9 = v8;
  double v11 = v10;
  double v12 = sub_100064680(v8, v10, x);
  double v14 = sub_100064660(v12, v13);
  double v16 = v15;
  double v17 = v29;
  double v18 = v30;
  double v19 = sub_100064680(v9, v11, v29);
  double v21 = sub_100064660(v19, v20);
  double v23 = v22;
  double v28 = sub_10006468C(v14, v16, v21, v22);
  double v24 = sub_100066394(1, v21, v23);
  double v26 = fabs(sub_10006468C(v14, v16, v24, v25));
  double v27 = v26 * (sub_1000653B4(v9, v11, v17, v18) / v28);
  if (fabs(v27) < 1.0) {
    double v27 = 1.0;
  }
  self->_double tailSize = v27;
}

- (void)setTailKnobPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLCalloutPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  if ([(CRLPathSource *)self hasHorizontalFlip]) {
    double x = v7 - x;
  }
  if ([(CRLPathSource *)self hasVerticalFlip]) {
    double v10 = v9 - y;
  }
  else {
    double v10 = y;
  }

  -[CRLCalloutPathSource p_setTailPosition:](self, "p_setTailPosition:", x, v10);
}

- (CGPoint)tailKnobPosition
{
  double x = self->_tailPosition.x;
  double y = self->_tailPosition.y;
  [(CRLCalloutPathSource *)self naturalSize];
  double v6 = v5;
  double v8 = v7;
  if ([(CRLPathSource *)self hasHorizontalFlip]) {
    double v9 = v6 - x;
  }
  else {
    double v9 = x;
  }
  if ([(CRLPathSource *)self hasVerticalFlip]) {
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

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[CRLPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:");
  double v7 = v6;
  [(CRLCalloutPathSource *)self naturalSize];
  double v9 = v8;
  unsigned int v10 = [(CRLCalloutPathSource *)self isOval];
  p_tailPosition = &self->_tailPosition;
  double x = CGPointZero.x;
  if (self->_tailPosition.x > v9 * 0.5)
  {
    double v13 = width / v9 + -1.0;
    if (fabs(v13) > 0.001) {
      double x = (width - v9) * ((width / v9 - v7) / v13);
    }
  }
  self->_double tailSize = v7 * self->_tailSize;
  double v14 = sub_1000646A4(p_tailPosition->x, self->_tailPosition.y, v7);
  p_tailPosition->double x = sub_100064698(v14, v15, x);
  self->_tailPosition.double y = v16;
  -[CRLCalloutPathSource p_setNaturalSize:](self, "p_setNaturalSize:", width, height);
  [(CRLCalloutPathSource *)self maxCornerRadius];
  if (v10) {
    double v18 = v17 + 1.0;
  }
  else {
    double v18 = fmin(v17 + -0.001, v7 * self->_cornerRadius);
  }
  self->_double cornerRadius = v18;
}

- (CGPoint)p_tailCenter
{
  if (self->_isTailAtCenter)
  {
    double v3 = self->_naturalSize.width * 0.5;
    double v4 = self->_naturalSize.height * 0.5;
  }
  else
  {
    [(CRLCalloutPathSource *)self p_tailPosition];
    double v3 = v6;
    double v8 = v7;
    [(CRLCalloutPathSource *)self cornerRadius];
    double v4 = v9;
    if (v3 <= v9 || v3 >= self->_naturalSize.width - v9)
    {
      if (v8 <= v9 || v8 >= self->_naturalSize.height - v9)
      {
        BOOL v10 = v3 > v9;
        double v3 = v9;
        if (v10) {
          double v3 = self->_naturalSize.width - v9;
        }
        if (v8 > v9) {
          double v4 = self->_naturalSize.height - v9;
        }
      }
      else
      {
        double v3 = self->_naturalSize.width * 0.5;
        double v4 = v8;
      }
    }
    else
    {
      double v4 = self->_naturalSize.height * 0.5;
    }
  }
  double v5 = v3;
  result.double y = v4;
  result.double x = v5;
  return result;
}

- (id)bezierPathWithoutFlips
{
  return [(CRLCalloutPathSource *)self p_buildPath];
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (id)name
{
  unsigned int v2 = [(CRLCalloutPathSource *)self isTailAtCenter];
  double v3 = +[NSBundle mainBundle];
  double v4 = v3;
  if (v2) {
    CFStringRef v5 = @"Quote Bubble";
  }
  else {
    CFStringRef v5 = @"Callout";
  }
  double v6 = [v3 localizedStringForKey:v5 value:0 table:0];

  return v6;
}

- (void)p_setCornerRadius:(double)a3
{
  self->_double cornerRadius = a3;
}

- (void)p_setTailPosition:(CGPoint)a3
{
  self->_tailPosition = a3;
}

- (CGPoint)p_tailPosition
{
  double x = self->_tailPosition.x;
  double y = self->_tailPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)p_setTailSize:(double)a3
{
  self->_double tailSize = a3;
}

- (void)p_setNaturalSize:(CGSize)a3
{
  self->_naturalSize = a3;
}

- (void)p_setTailAtCenter:(BOOL)a3
{
  self->_isTailAtCenter = a3;
}

- (CGPoint)p_adjustedCenterForPath:(id)a3
{
  id v4 = a3;
  [(CRLCalloutPathSource *)self p_tailCenter];
  double v6 = v5;
  double v8 = v7;
  [(CRLCalloutPathSource *)self p_tailPosition];
  v17[0] = v9;
  v17[1] = v10;
  *(double *)&v17[2] = v6;
  *(double *)&v17[3] = v8;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  [v4 addIntersectionsWithLine:v17 to:v11];

  if ([v11 count])
  {
    double v12 = [v11 lastObject];
    [v12 point];
    double v6 = v13;
    double v8 = v14;
  }
  double v15 = v6;
  double v16 = v8;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)p_getTailPath:(id)a3 center:(CGPoint *)a4 tailSize:(double *)a5 intersections:(CGPoint)a6[2]
{
  id v10 = a3;
  [(CRLCalloutPathSource *)self tailSize];
  double v12 = v11;
  [(CRLCalloutPathSource *)self p_tailPosition];
  double v14 = v13;
  double v16 = v15;
  [(CRLCalloutPathSource *)self p_adjustedCenterForPath:v10];
  double v18 = v17;
  double v20 = v19;
  [(CRLCalloutPathSource *)self maxTailSize];
  double v22 = fmin(fabs(v12), v21);
  double v23 = sub_100064680(v14, v16, v18);
  double v25 = sub_100064660(v23, v24);
  double v86 = v22;
  double v27 = sub_1000646A4(v25, v26, v22);
  double v29 = sub_100066394(1, v27, v28);
  v89[0] = v14;
  v89[1] = v16;
  double v30 = sub_100064698(v18, v20, v29);
  double v32 = sub_100064680(v30, v31, v14);
  double v34 = sub_1000646A4(v32, v33, 20.0);
  v89[2] = sub_100064698(v14, v16, v34);
  v89[3] = v35;
  v88[0] = v14;
  v88[1] = v16;
  CGFloat v87 = v20;
  double v36 = sub_100064680(v18, v20, v29);
  double v38 = sub_100064680(v36, v37, v14);
  double v40 = sub_1000646A4(v38, v39, 20.0);
  v88[2] = sub_100064698(v14, v16, v40);
  v88[3] = v41;
  id v42 = objc_alloc_init((Class)NSMutableArray);
  id v43 = objc_alloc_init((Class)NSMutableArray);
  [v10 addIntersectionsWithLine:v89 to:v42];
  [v10 addIntersectionsWithLine:v88 to:v43];
  if ([v42 count])
  {
    v44 = [v42 objectAtIndexedSubscript:0];
    [v44 point];
    double v46 = v45;
    double v48 = v47;

    v49 = [v42 lastObject];
    [v49 point];
    double v51 = v50;
    double v53 = v52;

    double v54 = sub_1000653B4(v46, v48, v14, v16);
    double v55 = sub_1000653B4(v51, v53, v14, v16);
    BOOL v56 = v54 < v55;
    if (v54 >= v55) {
      double v57 = v53;
    }
    else {
      double v57 = v48;
    }
    if (v56) {
      double v58 = v46;
    }
    else {
      double v58 = v51;
    }
    double v59 = sub_100064680(v58, v57, v14);
    double v61 = sub_100064660(v59, v60);
    double v62 = sub_100064698(v58, v57, v61);
  }
  else
  {
    double v62 = sub_10034C66C((const CGPath *)[v10 CGPath], v89);
  }
  CGFloat v64 = v62;
  CGFloat v65 = v63;
  if ([v43 count])
  {
    v66 = [v43 objectAtIndexedSubscript:0];
    [v66 point];
    double v85 = v64;
    double v68 = v67;
    double v70 = v69;

    v71 = [v43 lastObject];
    [v71 point];
    double v73 = v72;
    double v84 = v18;
    double v75 = v74;

    double v76 = sub_1000653B4(v68, v70, v14, v16);
    if (v76 >= sub_1000653B4(v73, v75, v14, v16)) {
      double v68 = v73;
    }
    else {
      double v75 = v70;
    }
    double v77 = sub_100064680(v68, v75, v14);
    double v79 = sub_100064660(v77, v78);
    double v80 = v68;
    double v81 = v75;
    double v18 = v84;
    CGFloat v64 = v85;
    double v82 = sub_100064698(v80, v81, v79);
  }
  else
  {
    double v82 = sub_10034C66C((const CGPath *)[v10 CGPath], v88);
  }
  a6->double x = v64;
  a6->double y = v65;
  a6[1].double x = v82;
  a6[1].double y = v83;
  if (a4)
  {
    a4->double x = v18;
    a4->double y = v87;
  }
  if (a5) {
    *a5 = v86;
  }
}

- (id)p_basePath
{
  [(CRLCalloutPathSource *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  [(CRLCalloutPathSource *)self cornerRadius];
  double v8 = v7;
  [(CRLCalloutPathSource *)self maxCornerRadius];
  double v10 = v9;
  double v11 = +[CRLBezierPath bezierPath];
  [(CRLCalloutPathSource *)self cornerRadius];
  double v13 = v12;
  [(CRLCalloutPathSource *)self maxCornerRadius];
  if (v13 >= v14)
  {
    [v11 appendBezierPathWithOvalInRect:-0.5, -0.5, 1.0, 1.0];
    [v11 closePath];
    memset(&v29, 0, sizeof(v29));
    CGAffineTransformMakeScale(&v29, self->_naturalSize.width, self->_naturalSize.height);
    CGAffineTransform v27 = v29;
    CGAffineTransformTranslate(&v28, &v27, 0.5, 0.5);
    CGAffineTransform v29 = v28;
    CGAffineTransform v27 = v28;
    CGAffineTransformRotate(&v28, &v27, 0.785398163);
    CGAffineTransform v29 = v28;
    [v11 transformUsingAffineTransform:&v28];
  }
  else
  {
    double y = CGPointZero.y;
    double v16 = fmin(v8, v10);
    double v17 = sub_100064698(0.0, v6, 0.0);
    double v19 = v18;
    [v11 moveToPoint:];
    double v20 = sub_100064698(CGPointZero.x, y, v16);
    [v11 appendBezierPathWithArcFromPoint:CGPointZero.x, y, v20, v21, v16];
    double v22 = sub_100064680(v4, 0.0, 0.0);
    [v11 appendBezierPathWithArcFromPoint:v4 toPoint:0.0 radius:v22];
    double v24 = sub_100064680(v4, v6, v16);
    [v11 appendBezierPathWithArcFromPoint:v4 toPoint:v6 radius:v24];
    [v11 appendBezierPathWithArcFromPoint:0.0 toPoint:v6 radius:v17];
    [v11 closePath];
  }

  return v11;
}

- (id)p_buildPath
{
  double v3 = [(CRLCalloutPathSource *)self p_basePath];
  [(CRLCalloutPathSource *)self p_tailPosition];
  double v5 = v4;
  double v7 = v6;
  if (objc_msgSend(v3, "containsPoint:"))
  {
    id v8 = v3;
  }
  else
  {
    [(CRLCalloutPathSource *)self p_getTailPath:v3 center:0 tailSize:0 intersections:v14];
    double v9 = +[CRLBezierPath bezierPath];
    [v9 moveToPoint:v14[0], v14[1]];
    [v9 lineToPoint:v5, v7];
    [v9 lineToPoint:v14[2], v14[3]];
    double v10 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v9, 0);
    double v11 = +[CRLBezierPath uniteBezierPaths:v10];

    if ([v11 elementCount]) {
      double v12 = v11;
    }
    else {
      double v12 = v3;
    }
    id v8 = v12;
  }

  return v8;
}

- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3
{
  double x = a3.x;
  [(CRLCalloutPathSource *)self maxCornerRadius];
  double v6 = sub_100407E48(x, 0.0, v5);

  [(CRLCalloutPathSource *)self setCornerRadius:v6];
}

- (CGPoint)p_getControlKnobPointForRoundedRect
{
  double cornerRadius = self->_cornerRadius;
  [(CRLCalloutPathSource *)self maxCornerRadius];
  float v4 = sub_100407E48(cornerRadius, 0.0, v3);
  double v5 = v4;
  double v6 = 0.0;
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (id)inferredAccessibilityDescriptionNoShapeNames
{
  double v3 = [(CRLPathSource *)self userDefinedName];
  if (![v3 length])
  {
    uint64_t v4 = [(CRLCalloutPathSource *)self inferredAccessibilityDescription];

    double v3 = (void *)v4;
  }

  return v3;
}

- (id)inferredAccessibilityDescription
{
  unsigned int v2 = [(CRLCalloutPathSource *)self isTailAtCenter];
  double v3 = +[NSBundle mainBundle];
  uint64_t v4 = v3;
  if (v2) {
    CFStringRef v5 = @"Quote bubble";
  }
  else {
    CFStringRef v5 = @"Callout";
  }
  double v6 = [v3 localizedStringForKey:v5 value:0 table:0];

  return v6;
}

- (id)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  unsigned int v2 = [(CRLCalloutPathSource *)self isTailAtCenter];
  double v3 = +[NSBundle mainBundle];
  uint64_t v4 = v3;
  if (v2) {
    CFStringRef v5 = @"Describe the selected quote bubble.";
  }
  else {
    CFStringRef v5 = @"Describe the selected callout.";
  }
  double v6 = [v3 localizedStringForKey:v5 value:0 table:0];

  return v6;
}

- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3
{
  switch(a3)
  {
    case 0xEuLL:
      double v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Tail width";
      goto LABEL_7;
    case 0xDuLL:
      double v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Corner radius";
      goto LABEL_7;
    case 0xCuLL:
      double v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Tail position";
LABEL_7:
      double v6 = [v3 localizedStringForKey:v5 value:0 table:0];

      goto LABEL_9;
  }
  double v6 = 0;
LABEL_9:

  return v6;
}

- (id)crlaxValueForKnobTag:(unint64_t)a3
{
  if (a3 == 14)
  {
    double v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"%d points" value:0 table:0];
    float tailSize = self->_tailSize;
    uint64_t cornerRadius = llroundf(tailSize);
  }
  else
  {
    if (a3 != 13)
    {
      double v11 = 0;
      goto LABEL_10;
    }
    [(CRLCalloutPathSource *)self cornerRadius];
    double v5 = v4;
    [(CRLCalloutPathSource *)self maxCornerRadius];
    if (v5 >= v6)
    {
      double v7 = +[NSBundle mainBundle];
      double v11 = [v7 localizedStringForKey:@"Oval" value:0 table:0];
      goto LABEL_9;
    }
    double v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"%d points" value:0 table:0];
    uint64_t cornerRadius = (int)self->_cornerRadius;
  }
  double v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, cornerRadius);

LABEL_9:
LABEL_10:

  return v11;
}

- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3
{
  return a3 - 13 < 2;
}

- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3
{
  return a3 == 12;
}

- (CGPoint)rawTailPosition
{
  double x = self->_tailPosition.x;
  double y = self->_tailPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRawTailPosition:(CGPoint)a3
{
  self->_tailPosition = a3;
}

- (double)tailSize
{
  return self->_tailSize;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGSize)naturalSize
{
  double width = self->_naturalSize.width;
  double height = self->_naturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isTailAtCenter
{
  return self->_isTailAtCenter;
}

@end