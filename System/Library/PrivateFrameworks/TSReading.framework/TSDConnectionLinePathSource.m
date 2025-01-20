@interface TSDConnectionLinePathSource
+ (id)pathSourceAtAngleOfSize:(CGSize)a3 forType:(int)a4;
+ (id)pathSourceOfLength:(double)a3;
- (BOOL)isCircular;
- (BOOL)isLineSegment;
- (BOOL)isRectangular;
- (CGPath)newFeedbackPathForKnob:(unint64_t)a3;
- (CGPoint)fixedPointForControlKnobChange;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (TSDConnectionLinePathSource)initWithBezierPath:(id)a3;
- (double)outsetFrom;
- (double)outsetTo;
- (id)bezierPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getFeedbackStringForKnob:(unint64_t)a3;
- (int)type;
- (int64_t)pathElementIndexForKnobTag:(unint64_t)a3;
- (unint64_t)numberOfControlKnobs;
- (void)bend;
- (void)p_setBezierPath:(id)a3;
- (void)scaleToNaturalSize:(CGSize)a3;
- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4;
- (void)setOutsetFrom:(double)a3;
- (void)setOutsetTo:(double)a3;
- (void)setType:(int)a3;
@end

@implementation TSDConnectionLinePathSource

- (TSDConnectionLinePathSource)initWithBezierPath:(id)a3
{
  id v3 = a3;
  if ([a3 elementCount] < 1)
  {
    double v5 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  else
  {
    [v3 controlPointBounds];
  }
  BOOL v7 = v5 == *MEMORY[0x263F001B0] && v6 == *(double *)(MEMORY[0x263F001B0] + 8);
  if (v7 || (TSDRectHasNaNComponents() & 1) != 0 || [v3 elementCount] != 3)
  {
    id v3 = +[TSDBezierPath bezierPath];
    objc_msgSend(v3, "moveToPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    objc_msgSend(v3, "lineToPoint:", 50.0, 50.0);
    objc_msgSend(v3, "lineToPoint:", 100.0, 100.0);
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDConnectionLinePathSource;
  return [(TSDBezierPathSource *)&v9 initWithBezierPath:v3];
}

+ (id)pathSourceOfLength:(double)a3
{
  id v4 = +[TSDBezierPath bezierPath];
  objc_msgSend(v4, "moveToPoint:", 0.0, 0.0);
  objc_msgSend(v4, "lineToPoint:", a3 * 0.5, 0.0);
  objc_msgSend(v4, "lineToPoint:", a3, 0.0);
  double v5 = [[TSDConnectionLinePathSource alloc] initWithBezierPath:v4];

  return v5;
}

+ (id)pathSourceAtAngleOfSize:(CGSize)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double height = a3.height;
  double width = a3.width;
  id v7 = +[TSDBezierPath bezierPath];
  v8 = v7;
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    objc_msgSend(v7, "moveToPoint:", 0.0, 0.0);
    objc_msgSend(v8, "lineToPoint:", 0.0, height);
  }
  else
  {
    objc_msgSend(v7, "moveToPoint:", 0.0, height);
    objc_msgSend(v8, "lineToPoint:", width * 0.5, height * 0.5);
    double height = 0.0;
  }
  objc_msgSend(v8, "lineToPoint:", width, height);
LABEL_6:
  objc_super v9 = [[TSDConnectionLinePathSource alloc] initWithBezierPath:v8];
  [(TSDConnectionLinePathSource *)v9 setType:v4];

  return v9;
}

- (void)bend
{
  [(TSDConnectionLinePathSource *)self getControlKnobPosition:12];
  double v4 = v3;
  double v6 = v5;
  [(TSDConnectionLinePathSource *)self getControlKnobPosition:10];
  double v8 = v7;
  [(TSDConnectionLinePathSource *)self getControlKnobPosition:11];
  double v11 = TSDSubtractPoints(v9, v10, v8);
  double v13 = TSDNormalizePoint(v11, v12);
  double v15 = TSDRotatePoint90Degrees(1, v13, v14);
  double v17 = v15;
  double v18 = v16;
  if (v16 > 0.0)
  {
    double v17 = TSDMultiplyPointScalar(v15, v16, -1.0);
    double v18 = v19;
  }
  [(TSDBezierPathSource *)self naturalSize];
  double v21 = v20;
  [(TSDBezierPathSource *)self naturalSize];
  double v23 = v22;
  [(TSDBezierPathSource *)self naturalSize];
  double v25 = v24;
  [(TSDBezierPathSource *)self naturalSize];
  double v27 = TSDMultiplyPointScalar(v17, v18, sqrt(v25 * v26 + v21 * v23) * 0.3);
  double v28 = TSDAddPoints(v4, v6, v27);

  [(TSDConnectionLinePathSource *)self setControlKnobPosition:12 toPoint:v28];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLinePathSource;
  id v4 = [(TSDBezierPathSource *)&v6 copyWithZone:a3];
  [v4 setType:self->mType];
  [(TSDConnectionLinePathSource *)self outsetFrom];
  objc_msgSend(v4, "setOutsetFrom:");
  [(TSDConnectionLinePathSource *)self outsetTo];
  objc_msgSend(v4, "setOutsetTo:");
  return v4;
}

- (unint64_t)numberOfControlKnobs
{
  return 1;
}

- (int64_t)pathElementIndexForKnobTag:(unint64_t)a3
{
  if (a3 - 10 > 2) {
    return -1;
  }
  else {
    return qword_22383A6C8[a3 - 10];
  }
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  long long v7 = *MEMORY[0x263F00148];
  int64_t v4 = [(TSDConnectionLinePathSource *)self pathElementIndexForKnobTag:a3];
  if ((v4 & 0x8000000000000000) == 0) {
    [(TSDBezierPath *)self->super.mPath elementAtIndex:v4 associatedPoints:&v7];
  }
  double v6 = *((double *)&v7 + 1);
  double v5 = *(double *)&v7;
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  int64_t v5 = -[TSDConnectionLinePathSource pathElementIndexForKnobTag:](self, "pathElementIndexForKnobTag:", a3, *(void *)&a4.x, *(void *)&a4.y);
  if ((v5 & 0x8000000000000000) == 0) {
    [(TSDBezierPath *)self->super.mPath setAssociatedPoints:&v6 atIndex:v5];
  }
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(TSDBezierPath *)self->super.mPath bounds];
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, width / v6, height / v7);
  mPath = self->super.mPath;
  CGAffineTransform v9 = v10;
  [(TSDBezierPath *)mPath transformUsingAffineTransform:&v9];
  -[TSDBezierPathSource setNaturalSize:](self, "setNaturalSize:", width, height);
}

- (id)bezierPath
{
  return self->super.mPath;
}

- (CGPoint)fixedPointForControlKnobChange
{
  double v4 = 0.0;
  double v5 = 0.0;
  [(TSDBezierPath *)self->super.mPath elementAtIndex:0 associatedPoints:&v4];
  double v2 = v4;
  double v3 = v5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  return &stru_26D688A48;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  return 0;
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (BOOL)isLineSegment
{
  return 0;
}

- (void)p_setBezierPath:(id)a3
{
  double v3 = (TSDBezierPath *)a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDConnectionLinePathSource p_setBezierPath:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLinePathSource.m"), 199, @"invalid nil value for '%s'", "path");
  }
  if ([(TSDBezierPath *)v3 elementCount] == 2
    && [(TSDBezierPath *)v3 elementAtIndex:1] == 2)
  {
    [(TSDBezierPath *)v3 elementAtIndex:1 allPoints:v11];
    double v3 = +[TSDBezierPath bezierPath];
    [(TSDBezierPath *)v3 moveToPoint:*(_OWORD *)v11];
    [(TSDBezierPath *)v3 lineToPoint:TSDPointOnCurve(v11, 0.5)];
    -[TSDBezierPath lineToPoint:](v3, "lineToPoint:", v12, v13);
  }
  double v7 = v3;

  self->super.mPath = v3;
  p_mNaturalSize = &self->super.mNaturalSize;
  [(TSDBezierPath *)v3 bounds];
  p_mNaturalSize->double width = v9;
  p_mNaturalSize->double height = v10;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)TSDConnectionLinePathSource;
  double v3 = objc_msgSend(-[TSDBezierPathSource description](&v8, sel_description), "mutableCopy");
  double v4 = NSString;
  int v5 = [(TSDConnectionLinePathSource *)self type];
  uint64_t v6 = @"curved";
  if (v5 == 1) {
    uint64_t v6 = @"orthogonal";
  }
  [v3 appendString:objc_msgSend(v4, "stringWithFormat:", @"; connection type: %@", v6)];
  return v3;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (double)outsetFrom
{
  return self->mOutsetFrom;
}

- (void)setOutsetFrom:(double)a3
{
  self->mOutsetFrom = a3;
}

- (double)outsetTo
{
  return self->mOutsetTo;
}

- (void)setOutsetTo:(double)a3
{
  self->mOutsetTo = a3;
}

@end