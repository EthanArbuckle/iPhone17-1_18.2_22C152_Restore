@interface TSDScalarPathSource
+ (id)chevronWithScalar:(double)a3 naturalSize:(CGSize)a4;
+ (id)pathSourceWithType:(int)a3 scalar:(double)a4 naturalSize:(CGSize)a5;
+ (id)rectangleWithNaturalSize:(CGSize)a3;
+ (id)regularPolygonWithScalar:(double)a3 naturalSize:(CGSize)a4;
+ (id)roundedRectangleWithScalar:(double)a3 naturalSize:(CGSize)a4;
- (BOOL)isCircular;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRectangular;
- (CGPath)newFeedbackPathForKnob:(unint64_t)a3;
- (CGPath)p_newChevronPath;
- (CGPath)p_newRegularPolygonPath;
- (CGPath)p_newRoundedRectPath;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)p_getControlKnobPointForChevron;
- (CGPoint)p_getControlKnobPointForRegularPolygon;
- (CGPoint)p_getControlKnobPointForRoundedRect;
- (CGSize)naturalSize;
- (CGSize)scaleFactorForInscribedRectangle;
- (TSDScalarPathSource)init;
- (TSDScalarPathSource)initWithType:(int)a3 scalar:(double)a4 naturalSize:(CGSize)a5;
- (double)maxScalar;
- (double)scalar;
- (id)bezierPathWithoutFlips;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getFeedbackStringForKnob:(unint64_t)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)valueForSetSelector:(SEL)a3;
- (int)type;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (unint64_t)numberOfControlKnobs;
- (void)p_setControlKnobPointForChevron:(CGPoint)a3;
- (void)p_setControlKnobPointForRegularPolygon:(CGPoint)a3;
- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3;
- (void)scaleToNaturalSize:(CGSize)a3;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setNaturalSize:(CGSize)a3;
- (void)setScalar:(double)a3;
- (void)setScalarValue:(id)a3;
- (void)setType:(int)a3;
@end

@implementation TSDScalarPathSource

+ (id)rectangleWithNaturalSize:(CGSize)a3
{
  return +[TSDScalarPathSource roundedRectangleWithScalar:naturalSize:](TSDScalarPathSource, "roundedRectangleWithScalar:naturalSize:", 0.0, a3.width, a3.height);
}

+ (id)roundedRectangleWithScalar:(double)a3 naturalSize:(CGSize)a4
{
  v4 = -[TSDScalarPathSource initWithType:scalar:naturalSize:]([TSDScalarPathSource alloc], "initWithType:scalar:naturalSize:", 0, a3, a4.width, a4.height);
  return v4;
}

+ (id)regularPolygonWithScalar:(double)a3 naturalSize:(CGSize)a4
{
  v4 = -[TSDScalarPathSource initWithType:scalar:naturalSize:]([TSDScalarPathSource alloc], "initWithType:scalar:naturalSize:", 1, a3, a4.width, a4.height);
  return v4;
}

+ (id)chevronWithScalar:(double)a3 naturalSize:(CGSize)a4
{
  v4 = -[TSDScalarPathSource initWithType:scalar:naturalSize:]([TSDScalarPathSource alloc], "initWithType:scalar:naturalSize:", 2, a3, a4.width, a4.height);
  return v4;
}

+ (id)pathSourceWithType:(int)a3 scalar:(double)a4 naturalSize:(CGSize)a5
{
  v5 = -[TSDScalarPathSource initWithType:scalar:naturalSize:]([TSDScalarPathSource alloc], "initWithType:scalar:naturalSize:", *(void *)&a3, a4, a5.width, a5.height);
  return v5;
}

- (TSDScalarPathSource)initWithType:(int)a3 scalar:(double)a4 naturalSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v8 = *(void *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)TSDScalarPathSource;
  v9 = [(TSDScalarPathSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(TSDScalarPathSource *)v9 setType:v8];
    [(TSDScalarPathSource *)v10 setScalar:a4];
    -[TSDScalarPathSource setNaturalSize:](v10, "setNaturalSize:", width, height);
  }
  return v10;
}

- (TSDScalarPathSource)init
{
  return -[TSDScalarPathSource initWithType:scalar:naturalSize:](self, "initWithType:scalar:naturalSize:", 0, 5.0, 100.0, 100.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDScalarPathSource;
  id v4 = [(TSDPathSource *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setType:", -[TSDScalarPathSource type](self, "type"));
  [(TSDScalarPathSource *)self scalar];
  objc_msgSend(v4, "setScalar:");
  [(TSDScalarPathSource *)self naturalSize];
  objc_msgSend(v4, "setNaturalSize:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    uint64_t v22 = v6;
    uint64_t v23 = v5;
    uint64_t v24 = v3;
    uint64_t v25 = v4;
    v21.receiver = self;
    v21.super_class = (Class)TSDScalarPathSource;
    BOOL v9 = -[TSDPathSource isEqual:](&v21, sel_isEqual_);
    if (v9)
    {
      int v10 = [(TSDScalarPathSource *)self type];
      if (v10 == [a3 type]
        && ([(TSDScalarPathSource *)self scalar],
            double v12 = v11,
            [a3 scalar],
            vabdd_f64(v12, v13) < 0.00999999978))
      {
        [(TSDScalarPathSource *)self naturalSize];
        double v15 = v14;
        double v17 = v16;
        [a3 naturalSize];
        LOBYTE(v9) = v17 == v19 && v15 == v18;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
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
  v5.receiver = self;
  v5.super_class = (Class)TSDScalarPathSource;
  uint64_t v3 = objc_msgSend(-[TSDScalarPathSource description](&v5, sel_description), "mutableCopy");
  objc_msgSend(v3, "appendString:", objc_msgSend(NSString, "stringWithFormat:", @"; type=%d; scalar=%f; natural size=%@",
      *(unsigned int *)(&self->super.mVerticalFlip + 3),
      *(void *)&self->mType,
      NSStringFromCGSize(*(CGSize *)&self->mScalar)));
  return v3;
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if (![(TSDScalarPathSource *)self type])
  {
    -[TSDPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:", width, height);
    *(double *)&self->mType = v6 * *(double *)&self->mType;
  }
  self->mScalar = width;
  self->mNaturalSize.CGFloat width = height;
}

- (void)setScalarValue:(id)a3
{
  [a3 floatValue];
  double v5 = v4;
  [(TSDScalarPathSource *)self setScalar:v5];
}

- (double)maxScalar
{
  int v3 = [(TSDScalarPathSource *)self type];
  if (v3 == 2)
  {
    [(TSDScalarPathSource *)self naturalSize];
    return v11 / v12;
  }
  else if (v3 == 1)
  {
    return 100.0;
  }
  else
  {
    double result = 0.0;
    if (!v3)
    {
      [(TSDScalarPathSource *)self naturalSize];
      double v6 = v5;
      double v7 = *MEMORY[0x263F00148];
      double v8 = *(double *)(MEMORY[0x263F00148] + 8);
      double v10 = TSDDistance(*MEMORY[0x263F00148], v8, 0.0, v9) * 0.5;
      double result = TSDDistance(v7, v8, v6, 0.0) * 0.5;
      if (v10 < result) {
        return v10;
      }
    }
  }
  return result;
}

- (unint64_t)numberOfControlKnobs
{
  return 1;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  int v4 = [(TSDScalarPathSource *)self type];
  if (v4 == 2)
  {
    [(TSDScalarPathSource *)self p_getControlKnobPointForChevron];
  }
  else if (v4 == 1)
  {
    [(TSDScalarPathSource *)self p_getControlKnobPointForRegularPolygon];
  }
  else if (v4)
  {
    double v5 = *MEMORY[0x263F00148];
    double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  else
  {
    [(TSDScalarPathSource *)self p_getControlKnobPointForRoundedRect];
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  int v7 = [(TSDScalarPathSource *)self type];
  switch(v7)
  {
    case 2:
      -[TSDScalarPathSource p_setControlKnobPointForChevron:](self, "p_setControlKnobPointForChevron:", x, y);
      break;
    case 1:
      -[TSDScalarPathSource p_setControlKnobPointForRegularPolygon:](self, "p_setControlKnobPointForRegularPolygon:", x, y);
      break;
    case 0:
      -[TSDScalarPathSource p_setControlKnobPointForRoundedRect:](self, "p_setControlKnobPointForRoundedRect:", x, y);
      break;
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  int v4 = [(TSDScalarPathSource *)self type];
  if (!v4)
  {
    double v5 = @"Radius: %d pt";
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    double v5 = @"Sides: %d";
LABEL_5:
    double v6 = NSString;
    uint64_t v7 = [(id)TSDBundle() localizedStringForKey:v5 value:&stru_26D688A48 table:@"TSDrawables"];
    [(TSDScalarPathSource *)self scalar];
    return (id)objc_msgSend(v6, "stringWithFormat:", v7, (int)v8);
  }
  return &stru_26D688A48;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  if ([(TSDScalarPathSource *)self type] != 1) {
    return 0;
  }
  objc_msgSend(-[TSDPathSource bezierPath](self, "bezierPath"), "bounds");
  double v5 = v4;
  double v7 = v6;
  Mutable = CGPathCreateMutable();
  [(TSDScalarPathSource *)self naturalSize];
  CGFloat v10 = -(v5 - v9 * 0.15);
  [(TSDScalarPathSource *)self naturalSize];
  CGFloat v12 = -(v7 - v11 * 0.15);
  [(TSDScalarPathSource *)self naturalSize];
  CGFloat v14 = v13 * 0.7;
  [(TSDScalarPathSource *)self naturalSize];
  v17.size.double height = v15 * 0.7;
  v17.origin.double x = v10;
  v17.origin.double y = v12;
  v17.size.CGFloat width = v14;
  CGPathAddEllipseInRect(Mutable, 0, v17);
  return Mutable;
}

- (id)valueForSetSelector:(SEL)a3
{
  if (sel_setScalarValue_ == a3)
  {
    double v4 = NSNumber;
    [(TSDScalarPathSource *)self scalar];
    *(float *)&double v5 = v5;
    return (id)[v4 numberWithFloat:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDScalarPathSource;
    return -[TSDPathSource valueForSetSelector:](&v6, sel_valueForSetSelector_);
  }
}

- (id)bezierPathWithoutFlips
{
  int v3 = [(TSDScalarPathSource *)self type];
  if (v3 == 2)
  {
    double v4 = [(TSDScalarPathSource *)self p_newChevronPath];
  }
  else if (v3 == 1)
  {
    double v4 = [(TSDScalarPathSource *)self p_newRegularPolygonPath];
  }
  else
  {
    if (v3)
    {
      double v5 = 0;
      goto LABEL_9;
    }
    double v4 = [(TSDScalarPathSource *)self p_newRoundedRectPath];
  }
  double v5 = v4;
LABEL_9:
  objc_super v6 = +[TSDBezierPath bezierPathWithCGPath:v5];
  CGPathRelease(v5);
  return v6;
}

- (BOOL)isRectangular
{
  if ([(TSDScalarPathSource *)self type]) {
    return 0;
  }
  [(TSDScalarPathSource *)self scalar];
  return v4 == 0.0;
}

- (BOOL)isCircular
{
  return 0;
}

- (CGSize)scaleFactorForInscribedRectangle
{
  double v3 = 1.0;
  if ([(TSDScalarPathSource *)self type])
  {
    double v4 = 1.0;
  }
  else
  {
    [(TSDScalarPathSource *)self naturalSize];
    double v6 = v5;
    double v8 = v7;
    double v9 = *MEMORY[0x263F00148];
    double v10 = *(double *)(MEMORY[0x263F00148] + 8);
    [(TSDScalarPathSource *)self scalar];
    double v12 = v11;
    double v13 = TSDDistance(v9, v10, 0.0, v8) * 0.5;
    double v14 = TSDDistance(v9, v10, v6, 0.0) * 0.5;
    if (v13 < v14) {
      double v14 = v13;
    }
    if (v12 < v14) {
      [(TSDScalarPathSource *)self scalar];
    }
    float v15 = v14;
    double v4 = 1.0;
    if (v15 != 0.0)
    {
      double v16 = (float)(v15 + v15);
      double v3 = (v6 - v16) / v6;
      double v4 = (v8 - v16) / v8;
    }
  }
  double v17 = v3;
  result.double height = v4;
  result.CGFloat width = v17;
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__TSDScalarPathSource_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __44__TSDScalarPathSource_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDScalarPathSource mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDScalarPathSource.m"), 398, @"nil object after cast");
  }
  int v5 = [*(id *)(a1 + 40) type];
  if (v5 != [v2 type]) {
    return 1;
  }
  [*(id *)(a1 + 40) naturalSize];
  double v7 = v6;
  double v9 = v8;
  [v2 naturalSize];
  if (TSDNearlyEqualSizes(v7, v9, v10, v11))
  {
    [*(id *)(a1 + 40) scalar];
    double v13 = v12;
    [v2 scalar];
    if (vabdd_f64(v13, v14) < 0.00999999978) {
      return 4;
    }
  }
  if ([*(id *)(a1 + 40) type] != 1) {
    return 3;
  }
  [*(id *)(a1 + 40) scalar];
  double v17 = v16;
  [v2 scalar];
  if (vabdd_f64(v17, v18) <= 2.0) {
    return 2;
  }
  else {
    return 3;
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__TSDScalarPathSource_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDScalarPathSource *__56__TSDScalarPathSource_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  [*(id *)(a1 + 40) scalar];
  [v2 scalar];
  TSUMix();
  double v4 = v3;
  [*(id *)(a1 + 40) naturalSize];
  double v6 = v5;
  double v8 = v7;
  [v2 naturalSize];
  double v11 = TSDMixSizes(v6, v8, v9, v10, *(double *)(a1 + 48));
  double v13 = v12;
  uint64_t v14 = [*(id *)(a1 + 40) type];
  return +[TSDScalarPathSource pathSourceWithType:scalar:naturalSize:](TSDScalarPathSource, "pathSourceWithType:scalar:naturalSize:", v14, v4, v11, v13);
}

- (CGPath)p_newRoundedRectPath
{
  [(TSDScalarPathSource *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = *MEMORY[0x263F00148];
  double v8 = *(double *)(MEMORY[0x263F00148] + 8);
  [(TSDScalarPathSource *)self scalar];
  double v10 = v9;
  double v11 = TSDDistance(v7, v8, 0.0, v6) * 0.5;
  double v12 = TSDDistance(v7, v8, v4, 0.0) * 0.5;
  if (v11 < v12) {
    double v12 = v11;
  }
  if (v10 < v12) {
    [(TSDScalarPathSource *)self scalar];
  }
  float v13 = v12;
  double v14 = TSDRectWithSize();
  return TSDCreateRoundRectPathForRectWithRadius(v14, v15, v16, v17, v13);
}

- (CGPath)p_newRegularPolygonPath
{
  Mutable = CGPathCreateMutable();
  [(TSDScalarPathSource *)self scalar];
  if (v4 >= 3.0)
  {
    [(TSDScalarPathSource *)self scalar];
    int v5 = (int)v6;
  }
  else
  {
    int v5 = 3;
  }
  [(TSDScalarPathSource *)self naturalSize];
  float v8 = v7 * 0.5;
  CGFloat v17 = 0.0;
  CGFloat v18 = 0.0;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeScale(&m, 1.0, v9 / v7);
  double v10 = v8;
  CGAffineTransform v14 = m;
  CGAffineTransformTranslate(&v15, &v14, v10, v10);
  CGAffineTransform m = v15;
  if (v5 >= 1)
  {
    for (int i = 0; i != v5; ++i)
    {
      float v12 = 6.28318531 / (double)v5;
      TSDOriginRotate(&v17, v10, (float)(v12 * (float)i) + -1.57079633);
      if (i) {
        CGPathAddLineToPoint(Mutable, &m, v17, v18);
      }
      else {
        CGPathMoveToPoint(Mutable, &m, v17, v18);
      }
    }
  }
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)p_newChevronPath
{
  Mutable = CGPathCreateMutable();
  [(TSDScalarPathSource *)self naturalSize];
  double v5 = v4;
  double v7 = v6;
  [(TSDScalarPathSource *)self scalar];
  TSUClamp();
  float v9 = v8;
  if (v9 == 0.0)
  {
    v15.origin.double x = TSDRectWithSize();
    CGPathAddRect(Mutable, 0, v15);
  }
  else
  {
    CGFloat v10 = *MEMORY[0x263F00148];
    CGFloat v11 = *(double *)(MEMORY[0x263F00148] + 8);
    CGFloat v12 = v9;
    CGFloat v13 = v5 - v9;
    CGPathMoveToPoint(Mutable, 0, *MEMORY[0x263F00148], v11);
    CGPathAddLineToPoint(Mutable, 0, v13, 0.0);
    CGPathAddLineToPoint(Mutable, 0, v5, v7 * 0.5);
    CGPathAddLineToPoint(Mutable, 0, v13, v7);
    CGPathAddLineToPoint(Mutable, 0, 0.0, v7);
    CGPathAddLineToPoint(Mutable, 0, v12, v7 * 0.5);
    CGPathAddLineToPoint(Mutable, 0, v10, v11);
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3
{
  [(TSDScalarPathSource *)self naturalSize];
  double v5 = v4;
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  TSDDistance(*MEMORY[0x263F00148], v7, 0.0, v8);
  TSDDistance(v6, v7, v5, 0.0);
  TSUClamp();
  -[TSDScalarPathSource setScalar:](self, "setScalar:");
}

- (CGPoint)p_getControlKnobPointForRoundedRect
{
  [(TSDScalarPathSource *)self naturalSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = *MEMORY[0x263F00148];
  double v8 = *(double *)(MEMORY[0x263F00148] + 8);
  [(TSDScalarPathSource *)self scalar];
  TSDDistance(v7, v8, 0.0, v6);
  TSDDistance(v7, v8, v4, 0.0);
  TSUClamp();
  *(float *)&double v9 = v9;
  double v10 = *(float *)&v9;
  double v11 = 0.0;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)p_setControlKnobPointForRegularPolygon:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSDScalarPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  if ([(TSDPathSource *)self hasVerticalFlip]) {
    double v10 = v9 - y;
  }
  else {
    double v10 = y;
  }
  double v11 = x - v7 * 0.5;
  double v12 = v7 / v9 * (v10 - v9 * 0.5);
  double v13 = -v11;
  double v14 = TSDPointLength(v11, v12);
  double v15 = acos(v13 / v14);
  if (v12 > 0.0) {
    double v15 = 6.28318531 - v15;
  }
  double v16 = v15 / 6.28318531 + -0.25;
  if (v16 < 0.0) {
    double v16 = v16 + 1.0;
  }
  if ((int)(v16 * 9.0 + 3.5) <= 11) {
    int v17 = (int)(v16 * 9.0 + 3.5);
  }
  else {
    int v17 = 3;
  }
  [(TSDScalarPathSource *)self scalar];
  if ((int)v18 != 3 || v17 == 4)
  {
    [(TSDScalarPathSource *)self scalar];
    if ((int)v19 != 11 || v17 == 10)
    {
      [(TSDScalarPathSource *)self setScalar:(double)v17];
    }
  }
}

- (CGPoint)p_getControlKnobPointForRegularPolygon
{
  [(TSDScalarPathSource *)self scalar];
  float v3 = 0.0;
  if (v4 >= 3.0)
  {
    [(TSDScalarPathSource *)self scalar];
    float v3 = (float)((int)v5 - 3);
  }
  [(TSDScalarPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = v6 * 0.5;
  double v14 = 0.0;
  double v15 = 0.0;
  TSDOriginRotate(&v14, v6 * 0.5 * 0.7, ((float)(v3 / 9.0) + -0.25) * 6.28318531);
  double v14 = v10 + v14;
  double v15 = v9 * 0.5 + v9 / v7 * v15;
  BOOL v11 = [(TSDPathSource *)self hasVerticalFlip];
  double v12 = v14;
  double v13 = v15;
  if (v11) {
    double v13 = v9 - v15;
  }
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)p_setControlKnobPointForChevron:(CGPoint)a3
{
  [(TSDScalarPathSource *)self naturalSize];
  double v5 = v4;
  TSUClamp();
  double v7 = v6 / v5;
  [(TSDScalarPathSource *)self setScalar:v7];
}

- (CGPoint)p_getControlKnobPointForChevron
{
  [(TSDScalarPathSource *)self naturalSize];
  double v4 = v3;
  [(TSDScalarPathSource *)self scalar];
  TSUClamp();
  *(float *)&double v5 = v5;
  double v6 = *(float *)&v5;
  double v7 = v4 * 0.5;
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (int)type
{
  return *(_DWORD *)(&self->super.mVerticalFlip + 3);
}

- (void)setType:(int)a3
{
  *(_DWORD *)(&self->super.mVerticalFlip + 3) = a3;
}

- (double)scalar
{
  return *(double *)&self->mType;
}

- (void)setScalar:(double)a3
{
  *(double *)&self->mType = a3;
}

- (CGSize)naturalSize
{
  double mScalar = self->mScalar;
  double width = self->mNaturalSize.width;
  result.double height = width;
  result.double width = mScalar;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  *(CGSize *)&self->double mScalar = a3;
}

@end