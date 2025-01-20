@interface TSDInfoGeometry
+ (id)geometryFromFullTransform:(CGAffineTransform *)a3;
+ (id)geometryFromFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5;
+ (id)geometryFromTransform:(CGAffineTransform *)a3 withSize:(CGSize)a4;
- (BOOL)heightValid;
- (BOOL)horizontalFlip;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualExceptForPosition:(id)a3;
- (BOOL)verticalFlip;
- (BOOL)widthValid;
- (CGAffineTransform)fullTransform;
- (CGAffineTransform)transform;
- (CGAffineTransform)transformBasedOnPoint:(SEL)a3 centeredAtPoint:(CGPoint)a4;
- (CGAffineTransform)transformBasedOnPoint:(SEL)a3 centeredAtPoint:(CGPoint)a4 withFlips:(CGPoint)a5;
- (CGAffineTransform)transformBasedOnRect:(SEL)a3;
- (CGAffineTransform)transformWithoutFlips;
- (CGPoint)center;
- (CGPoint)position;
- (CGRect)boundsBeforeRotation;
- (CGRect)transformedBounds;
- (CGSize)size;
- (TSDInfoGeometry)geometryWithNewBounds:(CGRect)a3;
- (TSDInfoGeometry)geometryWithParentGeometry:(id)a3;
- (TSDInfoGeometry)init;
- (TSDInfoGeometry)initWithCenter:(CGPoint)a3 size:(CGSize)a4;
- (TSDInfoGeometry)initWithFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5;
- (TSDInfoGeometry)initWithHeight:(double)a3;
- (TSDInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4;
- (TSDInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5;
- (TSDInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 widthValid:(BOOL)a5 heightValid:(BOOL)a6 horizontalFlip:(BOOL)a7 verticalFlip:(BOOL)a8 angle:(double)a9;
- (TSDInfoGeometry)initWithSize:(CGSize)a3;
- (TSDInfoGeometry)initWithTransform:(CGAffineTransform *)a3 size:(CGSize)a4;
- (TSDInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5;
- (TSDInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 horizontalFlip:(BOOL)a5 verticalFlip:(BOOL)a6 angle:(double)a7;
- (TSDInfoGeometry)initWithWidth:(double)a3;
- (double)angle;
- (id)description;
- (id)geometryByAppendingGeometry:(id)a3;
- (id)geometryByAppendingTransform:(CGAffineTransform *)a3;
- (id)geometryRelativeToGeometry:(id)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)normalizedGeometry;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
@end

@implementation TSDInfoGeometry

- (TSDInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 widthValid:(BOOL)a5 heightValid:(BOOL)a6 horizontalFlip:(BOOL)a7 verticalFlip:(BOOL)a8 angle:(double)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v25.receiver = self;
  v25.super_class = (Class)TSDInfoGeometry;
  v18 = [(TSDInfoGeometry *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->mPosition.CGFloat x = x;
    v18->mPosition.CGFloat y = y;
    v18->mSize.CGFloat width = width;
    v18->mSize.CGFloat height = height;
    if (v11) {
      char v20 = 2;
    }
    else {
      char v20 = 0;
    }
    if (v10) {
      char v21 = 4;
    }
    else {
      char v21 = 0;
    }
    if (v9) {
      char v22 = 8;
    }
    else {
      char v22 = 0;
    }
    *(unsigned char *)&v18->mFlags = v20 | a5 | v21 | v22 | *(unsigned char *)&v18->mFlags & 0xF0;
    TSDNormalizeAngleInDegrees(a9);
    v19->mAngle = v23;
  }
  return v19;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [TSDMutableInfoGeometry alloc];
  $CB6DE01367A4C750E2FF2F6D92039807 mFlags = self->mFlags;
  double mAngle = self->mAngle;
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  double width = self->mSize.width;
  double height = self->mSize.height;

  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v4, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(unsigned char *)&mFlags & 1, (*(unsigned int *)&mFlags >> 1) & 1, (*(unsigned int *)&mFlags >> 2) & 1, (*(unsigned int *)&mFlags >> 3) & 1, x, y, width, height, mAngle);
}

- (TSDInfoGeometry)init
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 100.0, 100.0, 0.0);
}

- (TSDInfoGeometry)initWithSize:(CGSize)a3
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), a3.width, a3.height, 0.0);
}

- (TSDInfoGeometry)initWithWidth:(double)a3
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 0, 0, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), a3, 0.0, 0.0);
}

- (TSDInfoGeometry)initWithHeight:(double)a3
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 0, 1, 0, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 0.0, a3, 0.0);
}

- (TSDInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, a3.x, a3.y, a4.width, a4.height, 0.0);
}

- (TSDInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5
{
  return -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, a3.x, a3.y, a4.width, a4.height, a5);
}

- (TSDInfoGeometry)initWithCenter:(CGPoint)a3 size:(CGSize)a4
{
  return [(TSDInfoGeometry *)self initWithPosition:a3.x - a4.width * 0.5 size:a3.y - a4.height * 0.5];
}

- (TSDInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5
{
  return -[TSDInfoGeometry initWithTransformedBoundsOrigin:size:horizontalFlip:verticalFlip:angle:](self, "initWithTransformedBoundsOrigin:size:horizontalFlip:verticalFlip:angle:", 0, 0, a3.x, a3.y, a4.width, a4.height, a5);
}

- (TSDInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 horizontalFlip:(BOOL)a5 verticalFlip:(BOOL)a6 angle:(double)a7
{
  double y = a3.y;
  double x = a3.x;
  BOOL v9 = -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, a5, a6, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), a4.width, a4.height, a7);
  BOOL v10 = v9;
  if (v9)
  {
    [(TSDInfoGeometry *)v9 transformedBoundsOrigin];
    double v12 = TSDSubtractPoints(v10->mPosition.x, v10->mPosition.y, v11);
    v10->mPosition.double x = TSDAddPoints(x, y, v12);
    v10->mPosition.double y = v13;
  }
  return v10;
}

- (BOOL)widthValid
{
  return *(unsigned char *)&self->mFlags & 1;
}

- (BOOL)heightValid
{
  return (*(unsigned char *)&self->mFlags >> 1) & 1;
}

- (BOOL)horizontalFlip
{
  return (*(unsigned char *)&self->mFlags >> 2) & 1;
}

- (BOOL)verticalFlip
{
  return (*(unsigned char *)&self->mFlags >> 3) & 1;
}

- (CGRect)boundsBeforeRotation
{
  [(TSDInfoGeometry *)self position];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(TSDInfoGeometry *)self size];

  double v10 = TSDRectWithOriginAndSize(v7, v4, v6, v8, v9);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGPoint)center
{
  [(TSDInfoGeometry *)self boundsBeforeRotation];

  double v6 = TSDCenterOfRect(v2, v3, v4, v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGAffineTransform)transform
{
  CGPoint result = (CGAffineTransform *)[(TSDInfoGeometry *)self boundsBeforeRotation];
  if (self)
  {
    return -[TSDInfoGeometry transformBasedOnRect:](self, "transformBasedOnRect:");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (CGAffineTransform)transformBasedOnRect:(SEL)a3
{
  if (self)
  {
    double y = a4.origin.y;
    double x = a4.origin.x;
    double v6 = self;
    double v8 = TSDCenterOfRect(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    return (CGAffineTransform *)-[CGAffineTransform transformBasedOnPoint:centeredAtPoint:](v6, "transformBasedOnPoint:centeredAtPoint:", x, y, v8, v7);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return self;
}

- (CGAffineTransform)transformBasedOnPoint:(SEL)a3 centeredAtPoint:(CGPoint)a4
{
  if (self) {
    return (CGAffineTransform *)-[CGAffineTransform transformBasedOnPoint:centeredAtPoint:withFlips:](self, "transformBasedOnPoint:centeredAtPoint:withFlips:", 1, a4.x, a4.y, a5.x, a5.y);
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (CGAffineTransform)transformBasedOnPoint:(SEL)a3 centeredAtPoint:(CGPoint)a4 withFlips:(CGPoint)a5
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.x;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(retstr, a4.x, a4.y);
  CGPoint result = (CGAffineTransform *)[(TSDInfoGeometry *)self angle];
  double v14 = v13;
  if (v13 != 0.0
    || v6
    && ([(TSDInfoGeometry *)self horizontalFlip]
     || (CGPoint result = (CGAffineTransform *)[(TSDInfoGeometry *)self verticalFlip], result)))
  {
    double v15 = TSDSubtractPoints(x, y, v9);
    CGFloat v17 = v16;
    long long v18 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v28.c = v18;
    *(_OWORD *)&v28.tdouble x = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v29, &v28, v15, v17);
    long long v19 = *(_OWORD *)&v29.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
    *(_OWORD *)&retstr->c = v19;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v29.tx;
    if (v14 != 0.0)
    {
      long long v20 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v28.c = v20;
      *(_OWORD *)&v28.tdouble x = *(_OWORD *)&retstr->tx;
      CGAffineTransformRotate(&v29, &v28, (v14 * -3.14159265 + v14 * -3.14159265) / 360.0);
      long long v21 = *(_OWORD *)&v29.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
      *(_OWORD *)&retstr->c = v21;
      *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v29.tx;
    }
    if (v6)
    {
      if ([(TSDInfoGeometry *)self horizontalFlip])
      {
        long long v22 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&v28.c = v22;
        *(_OWORD *)&v28.tdouble x = *(_OWORD *)&retstr->tx;
        CGAffineTransformScale(&v29, &v28, -1.0, 1.0);
        long long v23 = *(_OWORD *)&v29.c;
        *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
        *(_OWORD *)&retstr->c = v23;
        *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v29.tx;
      }
      if ([(TSDInfoGeometry *)self verticalFlip])
      {
        long long v24 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&v28.c = v24;
        *(_OWORD *)&v28.tdouble x = *(_OWORD *)&retstr->tx;
        CGAffineTransformScale(&v29, &v28, 1.0, -1.0);
        long long v25 = *(_OWORD *)&v29.c;
        *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
        *(_OWORD *)&retstr->c = v25;
        *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v29.tx;
      }
    }
    long long v26 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v28.c = v26;
    *(_OWORD *)&v28.tdouble x = *(_OWORD *)&retstr->tx;
    CGPoint result = CGAffineTransformTranslate(&v29, &v28, -v15, -v17);
    long long v27 = *(_OWORD *)&v29.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v29.tx;
  }
  return result;
}

- (CGAffineTransform)transformWithoutFlips
{
  CGPoint result = (CGAffineTransform *)[(TSDInfoGeometry *)self boundsBeforeRotation];
  if (self)
  {
    double v10 = v6;
    double v11 = v7;
    double v13 = TSDCenterOfRect(v6, v7, v8, v9);
    return -[TSDInfoGeometry transformBasedOnPoint:centeredAtPoint:withFlips:](self, "transformBasedOnPoint:centeredAtPoint:withFlips:", 0, v10, v11, v13, v12);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (CGRect)transformedBounds
{
  [(TSDInfoGeometry *)self transform];
  v3.origin.double x = TSDRectWithSize();
  return CGRectApplyAffineTransform(v3, &v2);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  BOOL v5 = TSDNearlyEqualPoints(self->mPosition.x, self->mPosition.y, *((double *)a3 + 1), *((double *)a3 + 2));
  if (v5)
  {
    BOOL v5 = TSDNearlyEqualSizes(self->mSize.width, self->mSize.height, *((double *)a3 + 3), *((double *)a3 + 4));
    if (v5)
    {
      if (((*((unsigned char *)a3 + 40) ^ *(unsigned char *)&self->mFlags) & 0xF) == 0)
      {
        LOBYTE(v5) = vabdd_f64(self->mAngle, *((double *)a3 + 6)) < 0.00999999978;
        return v5;
      }
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  CGFloat v2 = self->mPosition.y
     + (double)(41 * (unint64_t)(self->mPosition.x + 41.0 + 1.0))
     + (double)(unint64_t)(self->mPosition.x + 41.0 + 1.0);
  CGFloat v3 = self->mSize.width + (double)(41 * (unint64_t)v2) + (double)(unint64_t)v2;
  double v4 = self->mSize.height + (double)(41 * (unint64_t)v3) + (double)(unint64_t)v3;
  uint64_t v5 = 131;
  if ((*(unsigned char *)&self->mFlags & 1) == 0) {
    uint64_t v5 = 137;
  }
  unint64_t v6 = v5 + (unint64_t)v4 + 41 * (unint64_t)v4;
  uint64_t v7 = 139;
  if ((*(unsigned char *)&self->mFlags & 2) == 0) {
    uint64_t v7 = 149;
  }
  uint64_t v8 = v6 + v7 + 41 * v6;
  uint64_t v9 = 151;
  if ((*(unsigned char *)&self->mFlags & 4) == 0) {
    uint64_t v9 = 157;
  }
  uint64_t v10 = v8 + v9 + 41 * v8;
  uint64_t v11 = 163;
  if ((*(unsigned char *)&self->mFlags & 8) == 0) {
    uint64_t v11 = 167;
  }
  return (unint64_t)(self->mAngle
                          + (double)(unint64_t)(41 * (v10 + v11 + 41 * v10))
                          + (double)(unint64_t)(v10 + v11 + 41 * v10));
}

- (BOOL)isEqualExceptForPosition:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  BOOL result = (objc_opt_isKindOfClass() & 1) != 0
        && (self->mSize.width == *((double *)a3 + 3) ? (BOOL v5 = self->mSize.height == *((double *)a3 + 4)) : (BOOL v5 = 0),
            v5 && ((*((unsigned char *)a3 + 40) ^ *(unsigned char *)&self->mFlags) & 0xF) == 0)
        && self->mAngle == *((double *)a3 + 6);
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__TSDInfoGeometry_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __40__TSDInfoGeometry_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  CGFloat v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    CGFloat v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInfoGeometry mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInfoGeometry.m"), 345, @"nil object after cast");
  }
  int v5 = [*(id *)(a1 + 40) horizontalFlip];
  if (v5 != [v2 horizontalFlip]) {
    return 2;
  }
  int v6 = [*(id *)(a1 + 40) verticalFlip];
  if (v6 != [v2 verticalFlip]) {
    return 2;
  }
  if ([*(id *)(a1 + 40) isEqual:v2]) {
    return 5;
  }
  return 4;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__TSDInfoGeometry_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDInfoGeometry *__52__TSDInfoGeometry_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  CGFloat v2 = (void *)TSUDynamicCast();
  CGFloat v3 = [TSDInfoGeometry alloc];
  [*(id *)(a1 + 40) position];
  double v5 = v4;
  double v7 = v6;
  [v2 position];
  double v10 = TSDMixPoints(v5, v7, v8, v9, *(double *)(a1 + 48));
  double v12 = v11;
  [*(id *)(a1 + 40) size];
  double v14 = v13;
  double v16 = v15;
  [v2 size];
  double v19 = TSDMixSizes(v14, v16, v17, v18, *(double *)(a1 + 48));
  double v21 = v20;
  uint64_t v22 = [*(id *)(a1 + 40) widthValid];
  uint64_t v23 = [*(id *)(a1 + 40) heightValid];
  uint64_t v24 = [*(id *)(a1 + 40) horizontalFlip];
  uint64_t v25 = [*(id *)(a1 + 40) verticalFlip];
  [*(id *)(a1 + 40) angle];
  long double v27 = v26;
  [v2 angle];
  TSDMixAnglesInDegrees(v27, v28, *(double *)(a1 + 48));
  v30 = -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v3, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", v22, v23, v24, v25, v10, v12, v19, v21, v29);

  return v30;
}

- (CGAffineTransform)fullTransform
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  double height = 0.0;
  double width = 0.0;
  if (*(unsigned char *)&self->mFlags) {
    double width = self->mSize.width;
  }
  if ((*(unsigned char *)&self->mFlags & 2) != 0) {
    double height = self->mSize.height;
  }
  [(TSDInfoGeometry *)self transformBasedOnRect:TSDRectWithOriginAndSize(self, self->mPosition.x, self->mPosition.y, width, height)];
  CGFloat v7 = 1.0;
  CGFloat v8 = 1.0;
  if ([(TSDInfoGeometry *)self widthValid])
  {
    [(TSDInfoGeometry *)self size];
    CGFloat v8 = v9;
  }
  if ([(TSDInfoGeometry *)self heightValid])
  {
    [(TSDInfoGeometry *)self size];
    CGFloat v7 = v10;
  }
  long long v11 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v14.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v14.c = v11;
  *(_OWORD *)&v14.tdouble x = *(_OWORD *)&retstr->tx;
  BOOL result = CGAffineTransformScale(&v15, &v14, v8, v7);
  long long v13 = *(_OWORD *)&v15.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v15.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v15.tx;
  return result;
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  CGFloat v8 = [TSDInfoGeometry alloc];
  long long v9 = *(_OWORD *)&a3->c;
  v11[0] = *(_OWORD *)&a3->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a3->tx;
  return [(TSDInfoGeometry *)v8 initWithFullTransform:v11 widthValid:v6 heightValid:v5];
}

- (TSDInfoGeometry)initWithFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5
{
  unsigned int v5 = a5;
  BOOL v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)TSDInfoGeometry;
  CGFloat v8 = [(TSDInfoGeometry *)&v31 init];
  if (v8)
  {
    double v9 = (double)v6;
    double v10 = (double)v5;
    long long v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v30.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v30.c = v11;
    *(_OWORD *)&v30.tdouble x = *(_OWORD *)&a3->tx;
    double v12 = 0.0;
    uint64_t v13 = 0;
    *(void *)&long long v11 = 0;
    CGRect v32 = CGRectApplyAffineTransform(*(CGRect *)(&v9 - 2), &v30);
    double v14 = 0.0;
    if (v6) {
      double v14 = sqrt(a3->b * a3->b + a3->a * a3->a);
    }
    if (v5)
    {
      double v12 = sqrt(a3->d * a3->d + a3->c * a3->c);
      LOBYTE(v5) = 2;
    }
    v8->mSize.double width = v14;
    v8->mSize.double height = v12;
    double v15 = TSDCenterOfRect(v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    double v17 = TSDAddPoints(v15, v16, v14 * -0.5);
    double v18 = (double *)MEMORY[0x263F00148];
    v8->mPosition.double x = v17;
    v8->mPosition.double y = v19;
    double v20 = TSDSubtractPoints(a3->tx + v18[1] * a3->c + a3->a * *v18, a3->ty + v18[1] * a3->d + a3->b * *v18, a3->tx + a3->c * 0.0 + a3->a * -1000.0);
    double v22 = TSDAngleFromDelta(v20, v21) * -57.2957795;
    v8->double mAngle = v22;
    char v23 = v5 | v6;
    char v24 = v5 | v6 | *(unsigned char *)&v8->mFlags & 0xFC;
    *(unsigned char *)&v8->$CB6DE01367A4C750E2FF2F6D92039807 mFlags = v23 | *(unsigned char *)&v8->mFlags & 0xFC;
    double v25 = TSDCrossPoints(a3->a, a3->c, a3->b, a3->d);
    BOOL v26 = v25 <= 0.0;
    *(unsigned char *)&v8->$CB6DE01367A4C750E2FF2F6D92039807 mFlags = v24 & 0xF3 | (4 * (v25 > 0.0));
    double v27 = v22 + -180.0;
    if (v26) {
      double v27 = v22;
    }
    TSDNormalizeAngleInDegrees(v27);
    v8->double mAngle = v28;
  }
  return v8;
}

- (TSDInfoGeometry)initWithTransform:(CGAffineTransform *)a3 size:(CGSize)a4
{
  BOOL v6 = a4.width > 0.001;
  if (a4.width <= 0.001) {
    a4.double width = 1.0;
  }
  BOOL v7 = a4.height > 0.001;
  if (a4.height <= 0.001) {
    a4.double height = 1.0;
  }
  long long v8 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v12.c = v8;
  *(_OWORD *)&v12.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformScale(&v13, &v12, a4.width, a4.height);
  long long v9 = *(_OWORD *)&v13.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v13.a;
  *(_OWORD *)&a3->c = v9;
  *(_OWORD *)&a3->tdouble x = *(_OWORD *)&v13.tx;
  long long v10 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v13.c = v10;
  *(_OWORD *)&v13.tdouble x = *(_OWORD *)&a3->tx;
  return [(TSDInfoGeometry *)self initWithFullTransform:&v13 widthValid:v6 heightValid:v7];
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  return +[TSDInfoGeometry geometryFromFullTransform:v5 widthValid:1 heightValid:1];
}

+ (id)geometryFromTransform:(CGAffineTransform *)a3 withSize:(CGSize)a4
{
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v6.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformScale(&v7, &v6, a4.width, a4.height);
  return +[TSDInfoGeometry geometryFromFullTransform:&v7];
}

- (id)geometryByAppendingTransform:(CGAffineTransform *)a3
{
  if (self) {
    [(TSDInfoGeometry *)self fullTransform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v9, &t1, &v7);
  return +[TSDInfoGeometry geometryFromFullTransform:&v9 widthValid:[(TSDInfoGeometry *)self widthValid] heightValid:[(TSDInfoGeometry *)self heightValid]];
}

- (TSDInfoGeometry)geometryWithParentGeometry:(id)a3
{
  if (!self)
  {
    memset(&t1, 0, sizeof(t1));
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v6, 0, sizeof(v6));
    goto LABEL_6;
  }
  [(TSDInfoGeometry *)self fullTransform];
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  [a3 transform];
LABEL_6:
  CGAffineTransformConcat(&v8, &t1, &v6);
  return (TSDInfoGeometry *)+[TSDInfoGeometry geometryFromFullTransform:&v8 widthValid:[(TSDInfoGeometry *)self widthValid] heightValid:[(TSDInfoGeometry *)self heightValid]];
}

- (id)geometryByAppendingGeometry:(id)a3
{
  if (!a3)
  {
    memset(&t1, 0, sizeof(t1));
    if (self) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v6, 0, sizeof(v6));
    goto LABEL_6;
  }
  [a3 fullTransform];
  if (!self) {
    goto LABEL_5;
  }
LABEL_3:
  [(TSDInfoGeometry *)self transform];
LABEL_6:
  CGAffineTransformConcat(&v8, &t1, &v6);
  return +[TSDInfoGeometry geometryFromFullTransform:widthValid:heightValid:](TSDInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v8, [a3 widthValid], objc_msgSend(a3, "heightValid"));
}

- (id)geometryRelativeToGeometry:(id)a3
{
  if (!self)
  {
    memset(&t1, 0, sizeof(t1));
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v6, 0, sizeof(v6));
    goto LABEL_6;
  }
  [(TSDInfoGeometry *)self fullTransform];
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  [a3 transform];
LABEL_6:
  CGAffineTransformInvert(&t2, &v6);
  CGAffineTransformConcat(&v9, &t1, &t2);
  return +[TSDInfoGeometry geometryFromFullTransform:&v9 widthValid:[(TSDInfoGeometry *)self widthValid] heightValid:[(TSDInfoGeometry *)self heightValid]];
}

- (TSDInfoGeometry)geometryWithNewBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGAffineTransform v8 = (void *)[(TSDInfoGeometry *)self mutableCopy];
  objc_msgSend(v8, "setSize:", width, height);
  [(TSDInfoGeometry *)self size];
  double v10 = v9;
  [(TSDInfoGeometry *)self size];
  if (self) {
    [(TSDInfoGeometry *)self transform];
  }
  else {
    memset(v20, 0, sizeof(v20));
  }
  double v11 = TSDCenterOfRect(x, y, width, height);
  double v13 = TSDSubtractPoints(v11, v12, v10 * 0.5);
  double v15 = TSDDeltaApplyAffineTransform(v20, v13, v14);
  double v17 = v16;
  [(TSDInfoGeometry *)self center];
  objc_msgSend(v8, "setCenter:", TSDAddPoints(v15, v17, v18));
  return (TSDInfoGeometry *)v8;
}

- (id)normalizedGeometry
{
  double mAngle = self->mAngle;
  $CB6DE01367A4C750E2FF2F6D92039807 mFlags = self->mFlags;
  unsigned int v5 = (*(unsigned int *)&mFlags >> 2) & 1;
  if ((*(unsigned char *)&mFlags & 8) != 0)
  {
    if (v5) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
    TSDNormalizeAngleInDegrees(mAngle + 180.0);
    double mAngle = v7;
  }
  else
  {
    double v6 = (double)v5;
  }
  CGAffineTransform v8 = -[TSDInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:]([TSDInfoGeometry alloc], "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(unsigned char *)&self->mFlags & 1, (*(unsigned char *)&self->mFlags >> 1) & 1, v6 != 0.0, 0, self->mPosition.x, self->mPosition.y, self->mSize.width, self->mSize.height, mAngle);

  return v8;
}

- (id)description
{
  if (*(unsigned char *)&self->mFlags) {
    long long v3 = @"%g";
  }
  else {
    long long v3 = @"auto(%g)";
  }
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", v3, *(void *)&self->mSize.width);
  if ((*(unsigned char *)&self->mFlags & 2) != 0) {
    unsigned int v5 = @"%g";
  }
  else {
    unsigned int v5 = @"auto(%g)";
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v5, *(void *)&self->mSize.height);
  uint64_t v7 = [NSString stringWithFormat:@"{%@, %@}", v4, v6];
  if (self->mAngle == 0.0) {
    CGAffineTransform v8 = &stru_26D688A48;
  }
  else {
    CGAffineTransform v8 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" angle=%g", *(void *)&self->mAngle);
  }
  double v9 = @" flip=h+v";
  if ((*(unsigned char *)&self->mFlags & 8) == 0) {
    double v9 = @" flip=h";
  }
  double v10 = @" flip=v";
  if ((*(unsigned char *)&self->mFlags & 8) == 0) {
    double v10 = &stru_26D688A48;
  }
  if ((*(unsigned char *)&self->mFlags & 4) != 0) {
    double v11 = v9;
  }
  else {
    double v11 = v10;
  }
  double v12 = NSString;
  double v13 = (objc_class *)objc_opt_class();
  double v14 = NSStringFromClass(v13);
  return (id)[v12 stringWithFormat:@"<%@ %p pos=%@ size=%@%@%@>", v14, self, NSStringFromCGPoint(self->mPosition), v7, v8, v11];
}

- (CGPoint)position
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)angle
{
  return self->mAngle;
}

@end