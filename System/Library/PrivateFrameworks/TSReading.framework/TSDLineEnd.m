@interface TSDLineEnd
+ (id)filledArrow;
+ (id)filledCircle;
+ (id)filledDiamond;
+ (id)filledSquare;
+ (id)invertedArrow;
+ (id)line;
+ (id)lineEndWithIdentifier:(id)a3;
+ (id)lineEndWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6;
+ (id)lineEndWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7;
+ (id)lineEndWithType:(int)a3;
+ (id)none;
+ (id)openArrow;
+ (id)openCircle;
+ (id)openSquare;
+ (id)simpleArrow;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFilled;
- (BOOL)isNone;
- (CGImage)newLineEndImageOnRight:(BOOL)a3 forContentsScale:(double)a4 withSize:(CGSize)a5;
- (CGPath)path;
- (CGPath)wrapPath;
- (CGPoint)endPoint;
- (NSString)identifier;
- (TSDLineEnd)initWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6;
- (TSDLineEnd)initWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)lineJoin;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSDLineEnd

+ (id)simpleArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[TSDLineEnd lineEndWithPath:Mutable, 1, @"simple arrow", 3.0, 0.0 endPoint isFilled identifier];
  CGPathRelease(Mutable);
  return v3;
}

+ (id)filledCircle
{
  v10.origin.CGFloat x = 0.0;
  v10.origin.CGFloat y = 0.0;
  v10.size.CGFloat width = 6.0;
  v10.size.CGFloat height = 6.0;
  CGRect v11 = CGRectInset(v10, 0.5, 0.5);
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGPathAddEllipseInRect(Mutable, 0, v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  v8 = +[TSDLineEnd lineEndWithPath:Mutable, 1, @"filled circle", MidX, CGRectGetMinY(v14) endPoint isFilled identifier];
  CGPathRelease(Mutable);
  return v8;
}

+ (id)filledDiamond
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[TSDLineEnd lineEndWithPath:Mutable, 1, @"filled diamond", 3.0, 0.331400007 endPoint isFilled identifier];
  CGPathRelease(Mutable);
  return v3;
}

+ (id)openArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  v3 = [[TSDLineEnd alloc] initWithPath:Mutable, 0, 0, @"open arrow", 1, 3.0, 0.0 wrapPath endPoint isFilled identifier lineJoin];
  CGPathRelease(Mutable);
  return v3;
}

+ (id)filledArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 1.5);
  CGPathCloseSubpath(Mutable);
  v3 = +[TSDLineEnd lineEndWithPath:Mutable, 1, @"filled arrow", 3.0, 1.5 endPoint isFilled identifier];
  CGPathRelease(Mutable);
  return v3;
}

+ (id)filledSquare
{
  v10.origin.CGFloat x = 0.0;
  v10.origin.CGFloat y = 0.0;
  v10.size.CGFloat width = 6.0;
  v10.size.CGFloat height = 6.0;
  CGRect v11 = CGRectInset(v10, 0.5, 0.5);
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  v8 = +[TSDLineEnd lineEndWithPath:Mutable, 1, @"filled square", MidX, CGRectGetMinY(v14) endPoint isFilled identifier];
  CGPathRelease(Mutable);
  return v8;
}

+ (id)openSquare
{
  v10.origin.CGFloat x = 0.0;
  v10.origin.CGFloat y = 0.0;
  v10.size.CGFloat width = 6.0;
  v10.size.CGFloat height = 6.0;
  CGRect v11 = CGRectInset(v10, 1.0, 1.0);
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  v8 = +[TSDLineEnd lineEndWithPath:Mutable, 0, @"open square", MidX, CGRectGetMinY(v14) + -0.800000012 endPoint isFilled identifier];
  CGPathRelease(Mutable);
  return v8;
}

+ (id)openCircle
{
  v10.origin.CGFloat x = 0.0;
  v10.origin.CGFloat y = 0.0;
  v10.size.CGFloat width = 6.0;
  v10.size.CGFloat height = 6.0;
  CGRect v11 = CGRectInset(v10, 0.5, 0.5);
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGPathAddEllipseInRect(Mutable, 0, v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  v8 = +[TSDLineEnd lineEndWithPath:Mutable, 0, @"open circle", MidX, CGRectGetMinY(v14) + -0.800000012 endPoint isFilled identifier];
  CGPathRelease(Mutable);
  return v8;
}

+ (id)invertedArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[TSDLineEnd lineEndWithPath:Mutable, 1, @"inverted arrow", 3.0, 0.331400007 endPoint isFilled identifier];
  CGPathRelease(Mutable);
  return v3;
}

+ (id)line
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  v3 = +[TSDLineEnd lineEndWithPath:Mutable, 0, @"line", 3.0, -0.800000012 endPoint isFilled identifier];
  CGPathRelease(Mutable);
  return v3;
}

+ (id)none
{
  return +[TSDLineEnd lineEndWithPath:0, 0, @"none", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8) endPoint isFilled identifier];
}

+ (id)lineEndWithType:(int)a3
{
  switch(a3)
  {
    case 0:
      id result = +[TSDLineEnd simpleArrow];
      break;
    case 1:
      id result = +[TSDLineEnd filledCircle];
      break;
    case 2:
      id result = +[TSDLineEnd filledDiamond];
      break;
    case 3:
      id result = +[TSDLineEnd openArrow];
      break;
    case 4:
      id result = +[TSDLineEnd filledArrow];
      break;
    case 5:
      id result = +[TSDLineEnd filledSquare];
      break;
    case 6:
      id result = +[TSDLineEnd openSquare];
      break;
    case 7:
      id result = +[TSDLineEnd openCircle];
      break;
    case 8:
      id result = +[TSDLineEnd invertedArrow];
      break;
    case 9:
      id result = +[TSDLineEnd line];
      break;
    case 10:
      id result = +[TSDLineEnd none];
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

+ (id)lineEndWithIdentifier:(id)a3
{
  if ([a3 isEqualToString:@"simple arrow"])
  {
    return +[TSDLineEnd simpleArrow];
  }
  else if ([a3 isEqualToString:@"filled circle"])
  {
    return +[TSDLineEnd filledCircle];
  }
  else if ([a3 isEqualToString:@"filled diamond"])
  {
    return +[TSDLineEnd filledDiamond];
  }
  else if ([a3 isEqualToString:@"open arrow"])
  {
    return +[TSDLineEnd openArrow];
  }
  else if ([a3 isEqualToString:@"filled arrow"])
  {
    return +[TSDLineEnd filledArrow];
  }
  else if ([a3 isEqualToString:@"filled square"])
  {
    return +[TSDLineEnd filledSquare];
  }
  else if ([a3 isEqualToString:@"open square"])
  {
    return +[TSDLineEnd openSquare];
  }
  else if ([a3 isEqualToString:@"open circle"])
  {
    return +[TSDLineEnd openCircle];
  }
  else if ([a3 isEqualToString:@"inverted arrow"])
  {
    return +[TSDLineEnd invertedArrow];
  }
  else if ([a3 isEqualToString:@"line"])
  {
    return +[TSDLineEnd line];
  }
  else if ([a3 isEqualToString:@"none"])
  {
    return +[TSDLineEnd none];
  }
  else
  {
    return 0;
  }
}

+ (id)lineEndWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPath:endPoint:isFilled:identifier:", a3, a5, a6, a4.x, a4.y);

  return v6;
}

+ (id)lineEndWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7
{
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, a4, a6, a7, 0, a5.x, a5.y);

  return v7;
}

- (TSDLineEnd)initWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  v17.receiver = self;
  v17.super_class = (Class)TSDLineEnd;
  v15 = [(TSDLineEnd *)&v17 init];
  if (v15)
  {
    v15->mIdentifier = (NSString *)[a7 copy];
    v15->mLineJoin = a8;
    v15->mPath = CGPathCreateMutableCopy(a3);
    v15->mWrapPath = CGPathCreateMutableCopy(a4);
    v15->mEndPoint.CGFloat x = x;
    v15->mEndPoint.CGFloat y = y;
    v15->mIsFilled = a6;
  }
  return v15;
}

- (TSDLineEnd)initWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  return -[TSDLineEnd initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](self, "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, 0, a5, a6, 0, a4.x, a4.y);
}

- (void)dealloc
{
  CGPathRelease(self->mPath);
  CGPathRelease(self->mWrapPath);

  v3.receiver = self;
  v3.super_class = (Class)TSDLineEnd;
  [(TSDLineEnd *)&v3 dealloc];
}

- (unint64_t)hash
{
  return [(NSString *)self->mIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      mIdentifier = self->mIdentifier;
      uint64_t v7 = [a3 identifier];
      LOBYTE(v5) = [(NSString *)mIdentifier isEqualToString:v7];
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  mPath = self->mPath;
  mWrapPath = self->mWrapPath;
  BOOL mIsFilled = self->mIsFilled;
  mIdentifier = self->mIdentifier;
  uint64_t mLineJoin = self->mLineJoin;
  double x = self->mEndPoint.x;
  double y = self->mEndPoint.y;

  return (id)objc_msgSend(v4, "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", mPath, mWrapPath, mIsFilled, mIdentifier, mLineJoin, x, y);
}

- (CGImage)newLineEndImageOnRight:(BOOL)a3 forContentsScale:(double)a4 withSize:(CGSize)a5
{
  double width = a5.width;
  BOOL v7 = a3;
  v9 = TSDBitmapContextCreate(11, a5.width * a4);
  CGContextScaleCTM(v9, a4, a4);
  CGContextSetRGBFillColor(v9, 0.0, 0.0, 0.0, 1.0);
  CGContextSetRGBStrokeColor(v9, 0.0, 0.0, 0.0, 1.0);
  long long v10 = *MEMORY[0x263F000D0];
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v23.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v23.c = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v23.tdouble x = v12;
  double v13 = -width;
  if (v7)
  {
    *(_OWORD *)&transform.a = v10;
    *(_OWORD *)&transform.c = v11;
    *(_OWORD *)&transform.tdouble x = v12;
    CGAffineTransformScale(&v23, &transform, -1.0, 1.0);
    CGAffineTransform v21 = v23;
    CGAffineTransformTranslate(&transform, &v21, v13, 0.0);
    CGAffineTransform v23 = transform;
  }
  CGAffineTransform v21 = v23;
  CGAffineTransformTranslate(&transform, &v21, 3.0, 1.0);
  CGAffineTransform v23 = transform;
  if (![(TSDLineEnd *)self isFilled])
  {
    CGAffineTransform v21 = v23;
    CGAffineTransformTranslate(&transform, &v21, 0.5, 0.0);
    CGAffineTransform v23 = transform;
  }
  CGAffineTransform v21 = v23;
  CGAffineTransformScale(&transform, &v21, 1.5, 1.5);
  CGAffineTransform v23 = transform;
  BoundingBodouble x = CGPathGetBoundingBox([(TSDLineEnd *)self path]);
  CGFloat MaxY = CGRectGetMaxY(BoundingBox);
  CGAffineTransform v21 = v23;
  CGAffineTransformTranslate(&transform, &v21, MaxY, 0.0);
  CGAffineTransform v23 = transform;
  CGAffineTransform v21 = transform;
  CGAffineTransformRotate(&transform, &v21, 1.57079633);
  CGAffineTransform v23 = transform;
  CGContextConcatCTM(v9, &transform);
  CGContextSetLineJoin(v9, (CGLineJoin)[(TSDLineEnd *)self lineJoin]);
  CGContextSetLineWidth(v9, 0.5);
  CGContextAddPath(v9, [(TSDLineEnd *)self path]);
  if ([(TSDLineEnd *)self isFilled]) {
    CGContextFillPath(v9);
  }
  else {
    CGContextStrokePath(v9);
  }
  [(TSDLineEnd *)self endPoint];
  CGFloat v16 = v15;
  [(TSDLineEnd *)self endPoint];
  CGContextMoveToPoint(v9, v16, v17 + 1.0);
  [(TSDLineEnd *)self endPoint];
  CGContextAddLineToPoint(v9, v18, v13);
  CGContextStrokePath(v9);
  Image = CGBitmapContextCreateImage(v9);
  CGContextRelease(v9);
  return Image;
}

- (CGPath)wrapPath
{
  id result = self->mWrapPath;
  if (!result) {
    return self->mPath;
  }
  return result;
}

- (BOOL)isNone
{
  v2 = [(TSDLineEnd *)self identifier];

  return [(NSString *)v2 isEqualToString:@"none"];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p %@>", NSStringFromClass(v4), self, -[TSDLineEnd identifier](self, "identifier")];
}

- (NSString)identifier
{
  return self->mIdentifier;
}

- (CGPath)path
{
  return self->mPath;
}

- (CGPoint)endPoint
{
  double x = self->mEndPoint.x;
  double y = self->mEndPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isFilled
{
  return self->mIsFilled;
}

- (int)lineJoin
{
  return self->mLineJoin;
}

@end