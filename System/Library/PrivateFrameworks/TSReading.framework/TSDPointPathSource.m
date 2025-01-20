@interface TSDPointPathSource
+ (id)doubleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4;
+ (id)leftSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4;
+ (id)pathSourceWithType:(int)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5;
+ (id)plusWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4;
+ (id)rightSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4;
+ (id)starWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4;
- (BOOL)isCircular;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRectangular;
- (BOOL)p_isFlippedDoubleArrow;
- (BOOL)p_isRightFacingArrow;
- (CGPath)newFeedbackPathForKnob:(unint64_t)a3;
- (CGPath)p_newArrowPath;
- (CGPath)p_newPlusPath;
- (CGPath)p_newStarPath;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGPoint)maxPointValue;
- (CGPoint)minPointValue;
- (CGPoint)p_getControlKnobPointForArrow;
- (CGPoint)p_getControlKnobPointForPlus;
- (CGPoint)p_getControlKnobPointForStarInnerRadius;
- (CGPoint)p_getControlKnobPointForStarPoints;
- (CGPoint)point;
- (CGSize)naturalSize;
- (CGSize)scaleFactorForInscribedRectangle;
- (TSDPointPathSource)init;
- (TSDPointPathSource)initWithType:(int)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5;
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
- (void)p_setControlKnobPointForArrow:(CGPoint)a3;
- (void)p_setControlKnobPointForPlus:(CGPoint)a3;
- (void)p_setControlKnobPointForStarInnerRadius:(CGPoint)a3;
- (void)p_setControlKnobPointForStarPoints:(CGPoint)a3;
- (void)scaleToNaturalSize:(CGSize)a3;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setNaturalSize:(CGSize)a3;
- (void)setPoint:(CGPoint)a3;
- (void)setPointValue:(id)a3;
- (void)setType:(int)a3;
@end

@implementation TSDPointPathSource

+ (id)rightSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 1, a3.x, a3.y, a4.width, a4.height);
}

+ (id)leftSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 0, a3.x, a3.y, a4.width, a4.height);
}

+ (id)doubleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 10, a3.x, a3.y, a4.width, a4.height);
}

+ (id)starWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 100, a3.x, a3.y, a4.width, a4.height);
}

+ (id)plusWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 200, a3.x, a3.y, a4.width, a4.height);
}

+ (id)pathSourceWithType:(int)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5
{
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithType:point:naturalSize:", *(void *)&a3, a4.x, a4.y, a5.width, a5.height);

  return v5;
}

- (TSDPointPathSource)initWithType:(int)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  uint64_t v9 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)TSDPointPathSource;
  v10 = [(TSDPointPathSource *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(TSDPointPathSource *)v10 setType:v9];
    -[TSDPointPathSource setPoint:](v11, "setPoint:", x, y);
    -[TSDPointPathSource setNaturalSize:](v11, "setNaturalSize:", width, height);
  }
  return v11;
}

- (TSDPointPathSource)init
{
  return -[TSDPointPathSource initWithType:point:naturalSize:](self, "initWithType:point:naturalSize:", 0, 25.0, 25.0, 100.0, 100.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDPointPathSource;
  id v4 = [(TSDPathSource *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setType:", -[TSDPointPathSource type](self, "type"));
  [(TSDPointPathSource *)self point];
  objc_msgSend(v4, "setPoint:");
  [(TSDPointPathSource *)self naturalSize];
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
    uint64_t v25 = v6;
    uint64_t v26 = v5;
    uint64_t v27 = v3;
    uint64_t v28 = v4;
    v24.receiver = self;
    v24.super_class = (Class)TSDPointPathSource;
    BOOL v9 = -[TSDPathSource isEqual:](&v24, sel_isEqual_);
    if (v9)
    {
      int v10 = [(TSDPointPathSource *)self type];
      if (v10 == [a3 type])
      {
        [(TSDPointPathSource *)self point];
        double v12 = v11;
        double v14 = v13;
        [a3 point];
        LOBYTE(v9) = 0;
        if (v12 == v16 && v14 == v15)
        {
          [(TSDPointPathSource *)self naturalSize];
          double v18 = v17;
          double v20 = v19;
          [a3 naturalSize];
          LOBYTE(v9) = v20 == v22 && v18 == v21;
        }
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
  v8.receiver = self;
  v8.super_class = (Class)TSDPointPathSource;
  uint64_t v3 = objc_msgSend(-[TSDPointPathSource description](&v8, sel_description), "mutableCopy");
  uint64_t v4 = NSString;
  uint64_t v5 = [(TSDPointPathSource *)self type];
  [(TSDPointPathSource *)self point];
  uint64_t v6 = NSStringFromCGPoint(v9);
  [(TSDPointPathSource *)self naturalSize];
  objc_msgSend(v3, "appendString:", objc_msgSend(v4, "stringWithFormat:", @"; type=%d; point=%@; natural size=%@",
      v5,
      v6,
      NSStringFromCGSize(v10)));
  return v3;
}

- (CGPoint)minPointValue
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  int v4 = [(TSDPointPathSource *)self type];
  if (v4 == 100) {
    double v5 = 0.1;
  }
  else {
    double v5 = v3;
  }
  double v6 = 3.0;
  if (v4 != 100) {
    double v6 = v2;
  }
  result.double y = v5;
  result.double x = v6;
  return result;
}

- (CGPoint)maxPointValue
{
  double v4 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  int v5 = [(TSDPointPathSource *)self type];
  if (v5 > 99)
  {
    if (v5 == 100)
    {
      double v3 = 1.0;
      double v4 = 100.0;
    }
    else if (v5 == 200)
    {
      [(TSDPointPathSource *)self naturalSize];
      double v4 = v7 * 0.5;
      double v3 = v8 * 0.5;
    }
  }
  else if (v5 >= 2)
  {
    if (v5 == 10)
    {
      [(TSDPointPathSource *)self naturalSize];
      double v3 = 0.5;
      double v4 = v9 * 0.5;
    }
  }
  else
  {
    [(TSDPointPathSource *)self naturalSize];
    double v4 = v6;
    double v3 = 0.5;
  }
  double v10 = v4;
  double v11 = v3;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unsigned int v6 = [(TSDPointPathSource *)self type];
  if (v6 <= 0xA && ((1 << v6) & 0x403) != 0 || v6 == 200)
  {
    -[TSDPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:", width, height);
    *(double *)&self->mType = v7 * *(double *)&self->mType;
  }
  self->mPoint.double y = width;
  self->mNaturalSize.double width = height;
}

- (void)setPointValue:(id)a3
{
  [a3 CGPointValue];

  -[TSDPointPathSource setPoint:](self, "setPoint:");
}

- (unint64_t)numberOfControlKnobs
{
  if ([(TSDPointPathSource *)self type] == 100) {
    return 2;
  }
  else {
    return 1;
  }
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  unsigned int v5 = [(TSDPointPathSource *)self type];
  if (v5 <= 0xA && ((1 << v5) & 0x403) != 0)
  {
    [(TSDPointPathSource *)self p_getControlKnobPointForArrow];
  }
  else if (v5 == 100)
  {
    if (a3 == 12) {
      [(TSDPointPathSource *)self p_getControlKnobPointForStarPoints];
    }
    else {
      [(TSDPointPathSource *)self p_getControlKnobPointForStarInnerRadius];
    }
  }
  else if (v5 == 200)
  {
    [(TSDPointPathSource *)self p_getControlKnobPointForPlus];
  }
  else
  {
    double v6 = *MEMORY[0x263F00148];
    double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  unsigned int v8 = [(TSDPointPathSource *)self type];
  if (v8 <= 0xA && ((1 << v8) & 0x403) != 0)
  {
    -[TSDPointPathSource p_setControlKnobPointForArrow:](self, "p_setControlKnobPointForArrow:", x, y);
  }
  else if (v8 == 100)
  {
    if (a3 == 12)
    {
      -[TSDPointPathSource p_setControlKnobPointForStarPoints:](self, "p_setControlKnobPointForStarPoints:", x, y);
    }
    else
    {
      -[TSDPointPathSource p_setControlKnobPointForStarInnerRadius:](self, "p_setControlKnobPointForStarInnerRadius:", x, y);
    }
  }
  else if (v8 == 200)
  {
    -[TSDPointPathSource p_setControlKnobPointForPlus:](self, "p_setControlKnobPointForPlus:", x, y);
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  if ([(TSDPointPathSource *)self type] != 100) {
    return &stru_26D688A48;
  }
  unsigned int v5 = NSString;
  double v6 = (void *)TSDBundle();
  if (a3 == 12)
  {
    uint64_t v7 = [v6 localizedStringForKey:@"Points: %d" value:&stru_26D688A48 table:@"TSDrawables"];
    [(TSDPointPathSource *)self point];
  }
  else
  {
    uint64_t v7 = [v6 localizedStringForKey:@"Radius: %d%%" value:&stru_26D688A48 table:@"TSDrawables"];
    [(TSDPointPathSource *)self point];
    double v8 = v10 * 100.0;
  }
  return (id)objc_msgSend(v5, "stringWithFormat:", v7, (int)v8);
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  int v5 = [(TSDPointPathSource *)self type];
  Mutable = 0;
  if (a3 == 12 && v5 == 100)
  {
    objc_msgSend(-[TSDPathSource bezierPath](self, "bezierPath"), "bounds");
    double v8 = v7;
    double v10 = v9;
    Mutable = CGPathCreateMutable();
    [(TSDPointPathSource *)self naturalSize];
    CGFloat v12 = -(v8 - v11 * 0.15);
    [(TSDPointPathSource *)self naturalSize];
    CGFloat v14 = -(v10 - v13 * 0.15);
    [(TSDPointPathSource *)self naturalSize];
    CGFloat v16 = v15 * 0.7;
    [(TSDPointPathSource *)self naturalSize];
    v19.size.double height = v17 * 0.7;
    v19.origin.double x = v12;
    v19.origin.double y = v14;
    v19.size.double width = v16;
    CGPathAddEllipseInRect(Mutable, 0, v19);
  }
  return Mutable;
}

- (id)valueForSetSelector:(SEL)a3
{
  if (sel_setPointValue_ == a3)
  {
    double v4 = (void *)MEMORY[0x263F08D40];
    [(TSDPointPathSource *)self point];
    return (id)objc_msgSend(v4, "valueWithCGPoint:");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDPointPathSource;
    return -[TSDPathSource valueForSetSelector:](&v5, sel_valueForSetSelector_);
  }
}

- (id)bezierPathWithoutFlips
{
  unsigned int v3 = [(TSDPointPathSource *)self type];
  if (v3 <= 0xA && ((1 << v3) & 0x403) != 0)
  {
    double v4 = [(TSDPointPathSource *)self p_newArrowPath];
  }
  else if (v3 == 100)
  {
    double v4 = [(TSDPointPathSource *)self p_newStarPath];
  }
  else
  {
    if (v3 != 200)
    {
      objc_super v5 = 0;
      goto LABEL_9;
    }
    double v4 = [(TSDPointPathSource *)self p_newPlusPath];
  }
  objc_super v5 = v4;
LABEL_9:
  double v6 = +[TSDBezierPath bezierPathWithCGPath:v5];
  CGPathRelease(v5);
  return v6;
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (CGSize)scaleFactorForInscribedRectangle
{
  v28[6] = *(double *)MEMORY[0x263EF8340];
  unsigned int v3 = [(TSDPointPathSource *)self type];
  double v4 = 1.0;
  if (v3 > 0xA)
  {
    double v6 = 1.0;
  }
  else
  {
    unsigned int v5 = v3;
    double v6 = 1.0;
    if (((1 << v3) & 0x403) != 0)
    {
      [(TSDPointPathSource *)self naturalSize];
      double v8 = v7;
      double v10 = v9;
      double v11 = (double *)MEMORY[0x263F001B0];
      double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
      [(TSDPointPathSource *)self point];
      if (v5 == 1)
      {
        TSUClamp();
        double v15 = v8 - v18;
        double v16 = v10 * 0.5;
        TSUClamp();
      }
      else
      {
        if (v5 == 10)
        {
          double v13 = v8 * 0.5;
          TSUClamp();
          double v15 = v14;
          double v16 = v10 * 0.5;
          TSUClamp();
          goto LABEL_13;
        }
        TSUClamp();
        double v15 = v19;
        double v16 = v10 * 0.5;
        TSUClamp();
        if (v5 >= 2)
        {
          double v13 = v8 * 0.5;
LABEL_13:
          uint64_t v22 = 0;
          double v21 = *v11;
          double v23 = v10 + v17 * -2.0;
          v28[0] = v8 + v15 * -2.0 * (v23 / v10);
          v28[1] = v23;
          v28[2] = v15 * 0.5;
          v28[3] = v16;
          float v24 = v16;
          *(float *)&double v23 = v23;
          v28[4] = v13;
          v28[5] = fminf(v24, *(float *)&v23);
          double v25 = 0.0;
          do
          {
            double v27 = v28[v22];
            double v26 = v28[v22 + 1];
            if (v26 * v27 >= v25)
            {
              double v21 = v28[v22];
              double v12 = v28[v22 + 1];
              double v25 = v26 * v27;
            }
            v22 += 2;
          }
          while (v22 != 6);
          goto LABEL_17;
        }
      }
      double v20 = v10 + v17 * -2.0;
      double v21 = v15 + v12 / v10 * (v8 - v15);
      if (v20 * v21 > v16 * ((v8 - v15) * 0.5))
      {
        double v12 = v20;
      }
      else
      {
        double v21 = (v8 - v15) * 0.5;
        double v12 = v16;
      }
LABEL_17:
      double v4 = v21 / v8;
      double v6 = v12 / v10;
    }
  }
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__TSDPointPathSource_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __43__TSDPointPathSource_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  double v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    unsigned int v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDPointPathSource mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPointPathSource.m"), 477, @"nil object after cast");
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
    [*(id *)(a1 + 40) point];
    double v13 = v12;
    double v15 = v14;
    [v2 point];
    if (TSDNearlyEqualPoints(v13, v15, v16, v17)) {
      return 4;
    }
  }
  if ([*(id *)(a1 + 40) type] != 100) {
    return 3;
  }
  [*(id *)(a1 + 40) point];
  double v20 = v19;
  [v2 point];
  if (vabdd_f64(v20, v21) <= 2.0) {
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
  v5[2] = __55__TSDPointPathSource_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDPointPathSource *__55__TSDPointPathSource_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  double v2 = (void *)TSUDynamicCast();
  [*(id *)(a1 + 40) point];
  double v4 = v3;
  double v6 = v5;
  [v2 point];
  TSDMixPoints(v4, v6, v7, v8, *(double *)(a1 + 48));
  double v9 = TSDRoundedPoint();
  double v11 = v10;
  [*(id *)(a1 + 40) naturalSize];
  double v13 = v12;
  double v15 = v14;
  [v2 naturalSize];
  double v18 = TSDMixSizes(v13, v15, v16, v17, *(double *)(a1 + 48));
  double v20 = v19;
  uint64_t v21 = [*(id *)(a1 + 40) type];

  return +[TSDPointPathSource pathSourceWithType:point:naturalSize:](TSDPointPathSource, "pathSourceWithType:point:naturalSize:", v21, v9, v11, v18, v20);
}

- (CGPath)p_newArrowPath
{
  Mutable = CGPathCreateMutable();
  [(TSDPointPathSource *)self naturalSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = (CGFloat *)MEMORY[0x263F00148];
  [(TSDPointPathSource *)self point];
  [(TSDPointPathSource *)self naturalSize];
  if (*(_DWORD *)(&self->super.mVerticalFlip + 3) == 1)
  {
    TSUClamp();
    double v11 = v5 - v9;
  }
  else
  {
    TSUClamp();
    double v11 = v10;
  }
  CGFloat v13 = *v8;
  CGFloat v12 = v8[1];
  TSUClamp();
  CGFloat v15 = v14;
  int v16 = *(_DWORD *)(&self->super.mVerticalFlip + 3);
  if (v16 == 10)
  {
    double v17 = v7 - v14;
    CGPathMoveToPoint(Mutable, 0, v11, v7 - v14);
    v41.origin.double x = v13;
    v41.origin.double y = v12;
    v41.size.double width = v5;
    v41.size.double height = v7;
    CGFloat MaxY = CGRectGetMaxY(v41);
    CGPathAddLineToPoint(Mutable, 0, v11, MaxY);
    v42.origin.double x = v13;
    v42.origin.double y = v12;
    v42.size.double width = v5;
    v42.size.double height = v7;
    CGFloat MinX = CGRectGetMinX(v42);
    v43.origin.double x = v13;
    v43.origin.double y = v12;
    v43.size.double width = v5;
    v43.size.double height = v7;
    CGFloat MidY = CGRectGetMidY(v43);
    CGPathAddLineToPoint(Mutable, 0, MinX, MidY);
    CGPathAddLineToPoint(Mutable, 0, v11, 0.0);
    CGPathAddLineToPoint(Mutable, 0, v11, v15);
    CGFloat v26 = v5 - v11;
    CGPathAddLineToPoint(Mutable, 0, v26, v15);
    CGPathAddLineToPoint(Mutable, 0, v26, 0.0);
    v44.origin.double x = v13;
    v44.origin.double y = v12;
    v44.size.double width = v5;
    v44.size.double height = v7;
    CGFloat MaxX = CGRectGetMaxX(v44);
    v45.origin.double x = v13;
    v45.origin.double y = v12;
    v45.size.double width = v5;
    v45.size.double height = v7;
    CGFloat v28 = CGRectGetMidY(v45);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v28);
    v46.origin.double x = v13;
    v46.origin.double y = v12;
    v46.size.double width = v5;
    v46.size.double height = v7;
    CGFloat v29 = CGRectGetMaxY(v46);
    CGPathAddLineToPoint(Mutable, 0, v26, v29);
    v30 = Mutable;
    double v22 = v26;
  }
  else
  {
    if (v16 == 1)
    {
      double v17 = v7 - v14;
      CGPathMoveToPoint(Mutable, 0, v11, v7 - v14);
      v47.origin.double x = v13;
      v47.origin.double y = v12;
      v47.size.double width = v5;
      v47.size.double height = v7;
      CGFloat v31 = CGRectGetMaxY(v47);
      CGPathAddLineToPoint(Mutable, 0, v11, v31);
      v48.origin.double x = v13;
      v48.origin.double y = v12;
      v48.size.double width = v5;
      v48.size.double height = v7;
      CGFloat v32 = CGRectGetMaxX(v48);
      v49.origin.double x = v13;
      v49.origin.double y = v12;
      v49.size.double width = v5;
      v49.size.double height = v7;
      CGFloat v33 = CGRectGetMidY(v49);
      CGPathAddLineToPoint(Mutable, 0, v32, v33);
      CGPathAddLineToPoint(Mutable, 0, v11, 0.0);
      CGPathAddLineToPoint(Mutable, 0, v11, v15);
      v50.origin.double x = v13;
      v50.origin.double y = v12;
      v50.size.double width = v5;
      v50.size.double height = v7;
      CGFloat v34 = CGRectGetMinX(v50);
      CGPathAddLineToPoint(Mutable, 0, v34, v15);
      v51.origin.double x = v13;
      v51.origin.double y = v12;
      v51.size.double width = v5;
      v51.size.double height = v7;
      double v22 = CGRectGetMinX(v51);
    }
    else
    {
      if (v16) {
        return Mutable;
      }
      double v17 = v7 - v14;
      CGPathMoveToPoint(Mutable, 0, v11, v7 - v14);
      v36.origin.double x = v13;
      v36.origin.double y = v12;
      v36.size.double width = v5;
      v36.size.double height = v7;
      CGFloat v18 = CGRectGetMaxY(v36);
      CGPathAddLineToPoint(Mutable, 0, v11, v18);
      v37.origin.double x = v13;
      v37.origin.double y = v12;
      v37.size.double width = v5;
      v37.size.double height = v7;
      CGFloat v19 = CGRectGetMinX(v37);
      v38.origin.double x = v13;
      v38.origin.double y = v12;
      v38.size.double width = v5;
      v38.size.double height = v7;
      CGFloat v20 = CGRectGetMidY(v38);
      CGPathAddLineToPoint(Mutable, 0, v19, v20);
      CGPathAddLineToPoint(Mutable, 0, v11, 0.0);
      CGPathAddLineToPoint(Mutable, 0, v11, v15);
      v39.origin.double x = v13;
      v39.origin.double y = v12;
      v39.size.double width = v5;
      v39.size.double height = v7;
      CGFloat v21 = CGRectGetMaxX(v39);
      CGPathAddLineToPoint(Mutable, 0, v21, v15);
      v40.origin.double x = v13;
      v40.origin.double y = v12;
      v40.size.double width = v5;
      v40.size.double height = v7;
      double v22 = CGRectGetMaxX(v40);
    }
    v30 = Mutable;
  }
  CGPathAddLineToPoint(v30, 0, v22, v17);
  if (vabdd_f64(v15, v17) > 0.01) {
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (CGPath)p_newStarPath
{
  Mutable = CGPathCreateMutable();
  [(TSDPointPathSource *)self point];
  if (v4 >= 3.0)
  {
    [(TSDPointPathSource *)self point];
    int v5 = 2 * (int)v6;
  }
  else
  {
    int v5 = 6;
  }
  [(TSDPointPathSource *)self naturalSize];
  double v8 = v7;
  double v10 = v9;
  double v11 = v7 * 0.5;
  [(TSDPointPathSource *)self point];
  double v13 = v12;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeScale(&m, 1.0, v10 / v8);
  CGAffineTransform v19 = m;
  CGAffineTransformTranslate(&v20, &v19, v11, v11);
  CGAffineTransform m = v20;
  if (v5 >= 1)
  {
    int v14 = 0;
    double v15 = v13 * v11;
    double v16 = 0.0;
    while (1)
    {
      v20.a = 0.0;
      v20.b = 0.0;
      double v17 = 6.28318531 / (double)v5 * v16 + -1.57079633;
      if (v14) {
        break;
      }
      TSDOriginRotate(&v20.a, v11, v17);
      if (v14) {
        goto LABEL_10;
      }
      CGPathMoveToPoint(Mutable, &m, v20.a, v20.b);
LABEL_11:
      double v16 = v16 + 1.0;
      if (v5 == ++v14) {
        goto LABEL_12;
      }
    }
    TSDOriginRotate(&v20.a, v15, v17);
LABEL_10:
    CGPathAddLineToPoint(Mutable, &m, v20.a, v20.b);
    goto LABEL_11;
  }
LABEL_12:
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)p_newPlusPath
{
  Mutable = CGPathCreateMutable();
  [(TSDPointPathSource *)self naturalSize];
  double v5 = v4;
  double v7 = v6;
  [(TSDPointPathSource *)self point];
  TSUClamp();
  CGFloat v9 = v8;
  TSUClamp();
  CGFloat v11 = v10;
  CGPathMoveToPoint(Mutable, 0, v9, 0.0);
  CGPathAddLineToPoint(Mutable, 0, v5 - v9, 0.0);
  CGPathAddLineToPoint(Mutable, 0, v5 - v9, v11);
  CGPathAddLineToPoint(Mutable, 0, v5, v11);
  CGPathAddLineToPoint(Mutable, 0, v5, v7 - v11);
  CGPathAddLineToPoint(Mutable, 0, v5 - v9, v7 - v11);
  CGPathAddLineToPoint(Mutable, 0, v5 - v9, v7);
  CGPathAddLineToPoint(Mutable, 0, v9, v7);
  CGPathAddLineToPoint(Mutable, 0, v9, v7 - v11);
  CGPathAddLineToPoint(Mutable, 0, 0.0, v7 - v11);
  CGPathAddLineToPoint(Mutable, 0, 0.0, v11);
  CGPathAddLineToPoint(Mutable, 0, v9, v11);
  CGPathAddLineToPoint(Mutable, 0, v9, 0.0);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (void)p_setControlKnobPointForArrow:(CGPoint)a3
{
  [(TSDPointPathSource *)self naturalSize];
  double v5 = v4;
  TSUClamp();
  double v7 = v6;
  if ([(TSDPointPathSource *)self p_isRightFacingArrow]) {
    double v7 = v5 - v7;
  }
  TSUClamp();
  *(double *)&self->mType = v7;
  self->mPoint.double x = v8;
}

- (CGPoint)p_getControlKnobPointForArrow
{
  [(TSDPointPathSource *)self naturalSize];
  [(TSDPointPathSource *)self p_isRightFacingArrow];
  TSUClamp();
  double v4 = v3;
  TSUClamp();
  double v6 = v5;
  double v7 = v4;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (void)p_setControlKnobPointForStarPoints:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSDPointPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  BOOL v10 = [(TSDPathSource *)self hasVerticalFlip];
  double v11 = v9 - y;
  if (!v10) {
    double v11 = y;
  }
  double v12 = x - v7 * 0.5;
  double v13 = v7 / v9 * (v11 - v9 * 0.5);
  double v14 = TSDPointLength(v12, v13);
  double v15 = acos(-v12 / v14);
  if (v13 > 0.0) {
    double v15 = 6.28318531 - v15;
  }
  double v16 = v15 / 6.28318531 + -0.25;
  if (v16 < 0.0) {
    double v16 = v16 + 1.0;
  }
  int v17 = (int)(v16 * 18.0 + 3.5);
  if (v17 > 20) {
    int v17 = 3;
  }
  int v18 = (int)*(double *)&self->mType;
  if ((v18 != 3 || v17 == 4) && (v18 != 20 || v17 == 19)) {
    *(double *)&self->mType = (double)v17;
  }
}

- (CGPoint)p_getControlKnobPointForStarPoints
{
  double v3 = *(double *)&self->mType;
  [(TSDPointPathSource *)self naturalSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = v4 * 0.5;
  double v14 = 0.0;
  double v15 = 0.0;
  double v9 = v4 * 0.5 * 0.7;
  double v10 = ((float)((float)((int)v3 - 3) / 18.0) + -0.25) * 6.28318531;
  if (v3 < 3.0) {
    double v10 = -1.57079633;
  }
  TSDOriginRotate(&v14, v9, v10);
  double v14 = v8 + v14;
  double v15 = v7 * 0.5 + v7 / v5 * v15;
  BOOL v11 = [(TSDPathSource *)self hasVerticalFlip];
  double v12 = v14;
  double v13 = v15;
  if (v11) {
    double v13 = v7 - v15;
  }
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)p_setControlKnobPointForStarInnerRadius:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSDPointPathSource *)self naturalSize];
  double v7 = v6;
  double v9 = v8;
  if ([(TSDPathSource *)self hasVerticalFlip]) {
    double v10 = v9 - y;
  }
  else {
    double v10 = y;
  }
  TSDPointLength(x - v7 * 0.5, v7 / v9 * (v10 - v9 * 0.5));
  p_mType = &self->mType;
  uint64_t v12 = *(void *)p_mType;
  TSUClamp();
  *(void *)p_mType = v12;
  *((void *)p_mType + 1) = v13;
}

- (CGPoint)p_getControlKnobPointForStarInnerRadius
{
  p_mType = &self->mType;
  double v4 = *(double *)&self->mType;
  [(TSDPointPathSource *)self naturalSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = v5 * 0.5;
  double v10 = *((double *)p_mType + 1) * (v5 * 0.5);
  double v15 = 0.0;
  double v16 = 0.0;
  double v11 = 3.14159265 / (double)(int)v4 + -1.57079633;
  if (v4 < 3.0) {
    double v11 = -0.523598776;
  }
  TSDOriginRotate(&v15, v10, v11);
  double v15 = v9 + v15;
  double v16 = v8 * 0.5 + v8 / v6 * v16;
  BOOL v12 = [(TSDPathSource *)self hasVerticalFlip];
  double v13 = v15;
  double v14 = v16;
  if (v12) {
    double v14 = v8 - v16;
  }
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)p_setControlKnobPointForPlus:(CGPoint)a3
{
  [(TSDPointPathSource *)self naturalSize];
  TSUClamp();
  uint64_t v5 = v4;
  TSUClamp();
  *(void *)&self->mType = v5;
  self->mPoint.double x = v6;
}

- (CGPoint)p_getControlKnobPointForPlus
{
  [(TSDPointPathSource *)self naturalSize];
  double v4 = (v3 - *(double *)&self->mType) * 0.5;
  double v6 = (v5 - self->mPoint.x) * 0.5;
  result.double y = v6;
  result.double x = v4;
  return result;
}

- (BOOL)p_isRightFacingArrow
{
  if (*(_DWORD *)(&self->super.mVerticalFlip + 3) == 1) {
    return ![(TSDPathSource *)self hasHorizontalFlip];
  }
  else {
    return 0;
  }
}

- (BOOL)p_isFlippedDoubleArrow
{
  return *(_DWORD *)(&self->super.mVerticalFlip + 3) == 10
      && [(TSDPathSource *)self hasHorizontalFlip];
}

- (int)type
{
  return *(_DWORD *)(&self->super.mVerticalFlip + 3);
}

- (void)setType:(int)a3
{
  *(_DWORD *)(&self->super.mVerticalFlip + 3) = a3;
}

- (CGPoint)point
{
  objc_copyStruct(v4, &self->mType, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->mType, &v3, 16, 1, 0);
}

- (CGSize)naturalSize
{
  objc_copyStruct(v4, &self->mPoint.y, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->mPoint.y, &v3, 16, 1, 0);
}

@end