@interface TSDPathSource
+ (id)pathSourceForShapeType:(int)a3 naturalSize:(CGSize)a4;
- (BOOL)hasHorizontalFlip;
- (BOOL)hasVerticalFlip;
- (BOOL)isCircular;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRectangular;
- (BOOL)isRectangularForever;
- (CGAffineTransform)pathFlipTransform;
- (CGSize)naturalSize;
- (Class)preferredControllerClass;
- (double)uniformScaleForScalingToNaturalSize:(CGSize)a3;
- (id)bezierPath;
- (id)bezierPathWithoutFlips;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)valueForSetSelector:(SEL)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (void)setHasHorizontalFlip:(BOOL)a3;
- (void)setHasVerticalFlip:(BOOL)a3;
- (void)setNaturalSize:(CGSize)a3;
@end

@implementation TSDPathSource

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setHasHorizontalFlip:", -[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip"));
    objc_msgSend(v4, "setHasVerticalFlip:", -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"));
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  int v6 = [(TSDPathSource *)self hasHorizontalFlip];
  if (v6 != [a3 hasHorizontalFlip]) {
    return 0;
  }
  BOOL v8 = [(TSDPathSource *)self hasVerticalFlip];
  return v8 ^ [a3 hasVerticalFlip] ^ 1;
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isRectangularForever
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (id)bezierPath
{
  id v3 = [(TSDPathSource *)self bezierPathWithoutFlips];
  if (self) {
    [(TSDPathSource *)self pathFlipTransform];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  [v3 transformUsingAffineTransform:v5];
  return v3;
}

- (id)bezierPathWithoutFlips
{
  return 0;
}

- (Class)preferredControllerClass
{
  return 0;
}

- (CGSize)naturalSize
{
  [(id)objc_msgSend(MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488], objc_msgSend(NSString, "stringWithFormat:", @"Concrete subclass %@ must implement -naturalSize.", objc_opt_class()), 0), "raise" reason userInfo];
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  double v3 = (void *)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488], objc_msgSend(NSString, "stringWithFormat:", @"Concrete subclass %@ must implement -setNaturalSize:.", objc_opt_class()), 0 reason userInfo];

  [v3 raise];
}

- (double)uniformScaleForScalingToNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(TSDPathSource *)self naturalSize];
  double v7 = 1.0;
  if (v5 <= 1.0 || v6 <= 1.0) {
    return v7;
  }
  double v9 = width / v5;
  double v10 = height / v6;
  if (v9 >= 1.0 || v10 >= 1.0)
  {
    BOOL v12 = v10 <= 1.0 || v9 <= 1.0;
    double v13 = fmin(v9, v10);
    if (!v12) {
      return v13;
    }
    return v7;
  }
  return fmax(v9, v10);
}

- (CGAffineTransform)pathFlipTransform
{
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v24 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v25 = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v24;
  long long v23 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&retstr->tx = v23;
  BOOL v6 = [(TSDPathSource *)self hasHorizontalFlip];
  CGSize result = (CGAffineTransform *)[(TSDPathSource *)self hasVerticalFlip];
  int v8 = (int)result;
  if (v6 || result)
  {
    if (v6) {
      double v9 = -1.0;
    }
    else {
      double v9 = 1.0;
    }
    CGFloat v10 = *MEMORY[0x263F00148];
    CGFloat v11 = *(double *)(MEMORY[0x263F00148] + 8);
    [(TSDPathSource *)self naturalSize];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    v28.origin.x = v10;
    v28.origin.y = v11;
    v28.size.double width = v13;
    v28.size.double height = v15;
    double MidX = CGRectGetMidX(v28);
    v29.origin.x = v10;
    v29.origin.y = v11;
    v29.size.double width = v13;
    v29.size.double height = v15;
    double MidY = CGRectGetMidY(v29);
    *(_OWORD *)&v27.a = v25;
    *(_OWORD *)&v27.c = v24;
    *(_OWORD *)&v27.tx = v23;
    CGAffineTransformTranslate(retstr, &v27, MidX, MidY);
    if (v8) {
      double v18 = -1.0;
    }
    else {
      double v18 = 1.0;
    }
    long long v19 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v26.c = v19;
    *(_OWORD *)&v26.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v27, &v26, v9, v18);
    long long v20 = *(_OWORD *)&v27.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v27.a;
    *(_OWORD *)&retstr->c = v20;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v27.tx;
    long long v21 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v26.c = v21;
    *(_OWORD *)&v26.tx = *(_OWORD *)&retstr->tx;
    CGSize result = CGAffineTransformTranslate(&v27, &v26, -MidX, -MidY);
    long long v22 = *(_OWORD *)&v27.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v27.a;
    *(_OWORD *)&retstr->c = v22;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v27.tx;
  }
  return result;
}

- (id)valueForSetSelector:(SEL)a3
{
  return 0;
}

+ (id)pathSourceForShapeType:(int)a3 naturalSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = a4.height / 100.0;
  switch(a3)
  {
    case 0:
    case 3:
      CGFloat v10 = +[TSDBezierPathSource pathSourceWithBezierPath:](TSDBezierPathSource, "pathSourceWithBezierPath:", +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", 0.0, 0.0, 100.0, 100.0));
      -[TSDBezierPathSource setNaturalSize:](v10, "setNaturalSize:", width, height);
      goto LABEL_7;
    case 1:
    case 15:
    case 16:
      int v8 = +[TSDBezierPath bezierPathWithStart:end:](TSDBezierPath, "bezierPathWithStart:end:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), sqrt(width * width + a4.height * a4.height), 0.0);
      goto LABEL_24;
    case 2:
    case 18:
    case 19:
      double v9 = +[TSDConnectionLinePathSource pathSourceAtAngleOfSize:forType:](TSDConnectionLinePathSource, "pathSourceAtAngleOfSize:forType:", a3 == 18, width, a4.height);
      CGFloat v10 = v9;
      if (a3 == 2) {
        [(TSDBezierPathSource *)v9 bend];
      }
      goto LABEL_7;
    case 4:
      return +[TSDScalarPathSource roundedRectangleWithScalar:naturalSize:](TSDScalarPathSource, "roundedRectangleWithScalar:naturalSize:", 15.0, width, a4.height);
    case 5:
      double v12 = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, width, a4.height);
      CGFloat v13 = v12;
      goto LABEL_23;
    case 6:
      CGFloat v13 = +[TSDBezierPath bezierPath];
      -[TSDBezierPath moveToPoint:](v13, "moveToPoint:", width * 0.5, 0.0);
      -[TSDBezierPath lineToPoint:](v13, "lineToPoint:", width, height);
      double v14 = 0.0;
      CGFloat v15 = v13;
      goto LABEL_14;
    case 7:
      CGFloat v13 = +[TSDBezierPath bezierPath];
      -[TSDBezierPath moveToPoint:](v13, "moveToPoint:", 0.0, 0.0);
      -[TSDBezierPath lineToPoint:](v13, "lineToPoint:", 0.0, width);
      CGFloat v15 = v13;
      double v14 = width;
LABEL_14:
      double v16 = height;
      goto LABEL_22;
    case 8:
      double v17 = v7 * 64.0;
      return +[TSDPointPathSource rightSingleArrowWithPoint:naturalSize:](TSDPointPathSource, "rightSingleArrowWithPoint:naturalSize:", v17, 0.34, width, a4.height);
    case 9:
      double v18 = v7 * 44.0;
      return +[TSDPointPathSource doubleArrowWithPoint:naturalSize:](TSDPointPathSource, "doubleArrowWithPoint:naturalSize:", v18, 0.34, width, a4.height);
    case 10:
      CGFloat v13 = +[TSDBezierPath bezierPath];
      -[TSDBezierPath moveToPoint:](v13, "moveToPoint:", 0.0, height * 0.5);
      -[TSDBezierPath lineToPoint:](v13, "lineToPoint:", width * 0.5, height);
      -[TSDBezierPath lineToPoint:](v13, "lineToPoint:", width, height * 0.5);
      double v16 = 0.0;
      CGFloat v15 = v13;
      double v14 = width * 0.5;
LABEL_22:
      -[TSDBezierPath lineToPoint:](v15, "lineToPoint:", v14, v16);
      double v12 = v13;
LABEL_23:
      [(TSDBezierPath *)v12 closePath];
      int v8 = v13;
LABEL_24:
      id result = +[TSDBezierPathSource pathSourceWithBezierPath:v8];
      break;
    case 11:
      id result = +[TSDCalloutPathSource quoteBubbleWithTailPosition:tailSize:naturalSize:](TSDCalloutPathSource, "quoteBubbleWithTailPosition:tailSize:naturalSize:", v7, v7 * 96.0, v7 * 10.0, width, a4.height * 0.8);
      break;
    case 12:
      id result = +[TSDCalloutPathSource calloutWithCornerRadius:tailPosition:tailSize:naturalSize:](TSDCalloutPathSource, "calloutWithCornerRadius:tailPosition:tailSize:naturalSize:", 5.0, v7 * -20.0, v7 * 50.0, v7 * 10.0, width, a4.height);
      break;
    case 13:
      id result = +[TSDScalarPathSource regularPolygonWithScalar:naturalSize:](TSDScalarPathSource, "regularPolygonWithScalar:naturalSize:", 5.0, width, a4.height);
      break;
    case 14:
      id result = +[TSDPointPathSource starWithPoint:naturalSize:](TSDPointPathSource, "starWithPoint:naturalSize:", 5.0, 0.382, width, a4.height);
      break;
    case 17:
      long long v19 = objc_alloc_init(TSDEditableBezierPathSource);
      [(TSDEditableBezierPathSource *)v19 addNode:+[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8))];
      id result = v19;
      break;
    default:
      CGFloat v10 = 0;
LABEL_7:
      id result = v10;
      break;
  }
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)&__block_literal_global_29);
}

uint64_t __38__TSDPathSource_mixingTypeWithObject___block_invoke()
{
  v0 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"-[TSDPathSource mixingTypeWithObject:]_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPathSource.m"), 271, @"Called on superclass!");
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a4, a3);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDPathSource mixedObjectWithFraction:ofObject:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPathSource.m"), 280, @"Called on superclass!");
  return 0;
}

- (BOOL)hasHorizontalFlip
{
  return self->mHorizontalFlip;
}

- (void)setHasHorizontalFlip:(BOOL)a3
{
  self->mHorizontalFlip = a3;
}

- (BOOL)hasVerticalFlip
{
  return self->mVerticalFlip;
}

- (void)setHasVerticalFlip:(BOOL)a3
{
  self->mVerticalFlip = a3;
}

@end