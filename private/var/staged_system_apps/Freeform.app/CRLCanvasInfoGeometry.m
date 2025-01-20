@interface CRLCanvasInfoGeometry
+ (id)geometryFromFullTransform:(CGAffineTransform *)a3;
+ (id)geometryFromFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5;
+ (id)geometryFromTransform:(CGAffineTransform *)a3 withSize:(CGSize)a4;
- (BOOL)allValuesValidNumbers;
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
- (CRLCanvasInfoGeometry)geometryWithNewBounds:(CGRect)a3;
- (CRLCanvasInfoGeometry)geometryWithParentGeometry:(id)a3;
- (CRLCanvasInfoGeometry)geometryWithValidNumbers;
- (CRLCanvasInfoGeometry)init;
- (CRLCanvasInfoGeometry)initWithCenter:(CGPoint)a3 size:(CGSize)a4;
- (CRLCanvasInfoGeometry)initWithFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5;
- (CRLCanvasInfoGeometry)initWithHeight:(double)a3;
- (CRLCanvasInfoGeometry)initWithLayoutGeometry:(id)a3;
- (CRLCanvasInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4;
- (CRLCanvasInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5;
- (CRLCanvasInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 widthValid:(BOOL)a5 heightValid:(BOOL)a6 horizontalFlip:(BOOL)a7 verticalFlip:(BOOL)a8 angle:(double)a9;
- (CRLCanvasInfoGeometry)initWithSize:(CGSize)a3;
- (CRLCanvasInfoGeometry)initWithTransform:(CGAffineTransform *)a3 size:(CGSize)a4;
- (CRLCanvasInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5;
- (CRLCanvasInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 horizontalFlip:(BOOL)a5 verticalFlip:(BOOL)a6 angle:(double)a7;
- (CRLCanvasInfoGeometry)initWithWidth:(double)a3;
- (double)angle;
- (id)description;
- (id)geometryByAppendingTransform:(CGAffineTransform *)a3;
- (id)geometryRelativeToGeometry:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)normalizedGeometry;
- (unint64_t)hash;
@end

@implementation CRLCanvasInfoGeometry

- (CRLCanvasInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 widthValid:(BOOL)a5 heightValid:(BOOL)a6 horizontalFlip:(BOOL)a7 verticalFlip:(BOOL)a8 angle:(double)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v25.receiver = self;
  v25.super_class = (Class)CRLCanvasInfoGeometry;
  v18 = [(CRLCanvasInfoGeometry *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_position.CGFloat x = x;
    v18->_position.CGFloat y = y;
    v18->_size.CGFloat width = width;
    v18->_size.CGFloat height = height;
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
    *(unsigned char *)&v18->_flags = v20 | a5 | v21 | v22 | *(unsigned char *)&v18->_flags & 0xF0;
    sub_100065C2C(a9);
    v19->_angle = v23;
  }
  return v19;
}

- (CRLCanvasInfoGeometry)initWithFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5
{
  unsigned int v5 = a5;
  BOOL v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CRLCanvasInfoGeometry;
  v8 = [(CRLCanvasInfoGeometry *)&v29 init];
  if (v8)
  {
    double v9 = (double)v6;
    double v10 = (double)v5;
    long long v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v28.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v28.c = v11;
    *(_OWORD *)&v28.tCGFloat x = *(_OWORD *)&a3->tx;
    double v12 = 0.0;
    uint64_t v13 = 0;
    *(void *)&long long v11 = 0;
    CGRect v30 = CGRectApplyAffineTransform(*(CGRect *)(&v9 - 2), &v28);
    double v14 = 0.0;
    if (v6) {
      double v14 = sqrt(a3->b * a3->b + a3->a * a3->a);
    }
    if (v5)
    {
      double v12 = sqrt(a3->d * a3->d + a3->c * a3->c);
      LOBYTE(v5) = 2;
    }
    v8->_size.CGFloat width = v14;
    v8->_size.CGFloat height = v12;
    double v15 = sub_100065738(v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    v8->_position.CGFloat x = sub_100064698(v15, v16, v14 * -0.5);
    v8->_position.CGFloat y = v17;
    double v18 = sub_100064680(a3->tx + CGPointZero.y * a3->c + a3->a * CGPointZero.x, a3->ty + CGPointZero.y * a3->d + a3->b * CGPointZero.x, a3->tx + a3->c * 0.0 + a3->a * -1000.0);
    double v20 = sub_100065C1C(v18, v19) * -57.2957795;
    v8->_angle = v20;
    char v21 = v5 | v6;
    char v22 = v5 | v6 | *(unsigned char *)&v8->_flags & 0xFC;
    *(unsigned char *)&v8->_flags = v21 | *(unsigned char *)&v8->_flags & 0xFC;
    double v23 = sub_100064F08(a3->a, a3->c, a3->b, a3->d);
    BOOL v24 = v23 <= 0.0;
    *(unsigned char *)&v8->_flags = v22 & 0xF3 | (4 * (v23 > 0.0));
    double v25 = v20 + -180.0;
    if (v24) {
      double v25 = v20;
    }
    sub_100065C2C(v25);
    v8->_angle = v26;
  }
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CRLCanvasMutableInfoGeometry alloc];
  $CB6DE01367A4C750E2FF2F6D92039807 flags = self->_flags;
  double angle = self->_angle;
  double x = self->_position.x;
  double y = self->_position.y;
  double width = self->_size.width;
  double height = self->_size.height;

  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v4, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(unsigned char *)&flags & 1, (*(unsigned int *)&flags >> 1) & 1, (*(unsigned int *)&flags >> 2) & 1, (*(unsigned int *)&flags >> 3) & 1, x, y, width, height, angle);
}

- (CRLCanvasInfoGeometry)init
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, CGPointZero.x, CGPointZero.y, 100.0, 100.0, 0.0);
}

- (CRLCanvasInfoGeometry)initWithSize:(CGSize)a3
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, CGPointZero.x, CGPointZero.y, a3.width, a3.height, 0.0);
}

- (CRLCanvasInfoGeometry)initWithWidth:(double)a3
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 0, 0, 0, CGPointZero.x, CGPointZero.y, a3, 0.0, 0.0);
}

- (CRLCanvasInfoGeometry)initWithHeight:(double)a3
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 0, 1, 0, 0, CGPointZero.x, CGPointZero.y, 0.0, a3, 0.0);
}

- (CRLCanvasInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, a3.x, a3.y, a4.width, a4.height, 0.0);
}

- (CRLCanvasInfoGeometry)initWithPosition:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5
{
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, 0, 0, a3.x, a3.y, a4.width, a4.height, a5);
}

- (CRLCanvasInfoGeometry)initWithCenter:(CGPoint)a3 size:(CGSize)a4
{
  return [(CRLCanvasInfoGeometry *)self initWithPosition:a3.x - a4.width * 0.5 size:a3.y - a4.height * 0.5];
}

- (CRLCanvasInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 angle:(double)a5
{
  return -[CRLCanvasInfoGeometry initWithTransformedBoundsOrigin:size:horizontalFlip:verticalFlip:angle:](self, "initWithTransformedBoundsOrigin:size:horizontalFlip:verticalFlip:angle:", 0, 0, a3.x, a3.y, a4.width, a4.height, a5);
}

- (CRLCanvasInfoGeometry)initWithTransformedBoundsOrigin:(CGPoint)a3 size:(CGSize)a4 horizontalFlip:(BOOL)a5 verticalFlip:(BOOL)a6 angle:(double)a7
{
  double y = a3.y;
  double x = a3.x;
  double v9 = -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, a5, a6, CGPointZero.x, CGPointZero.y, a4.width, a4.height, a7);
  double v10 = v9;
  if (v9)
  {
    [(CRLCanvasInfoGeometry *)v9 transformedBoundsOrigin];
    double v12 = sub_100064680(v10->_position.x, v10->_position.y, v11);
    v10->_position.double x = sub_100064698(x, y, v12);
    v10->_position.double y = v13;
  }
  return v10;
}

- (CRLCanvasInfoGeometry)initWithTransform:(CGAffineTransform *)a3 size:(CGSize)a4
{
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformScale(&v11, &v10, a4.width, a4.height);
  long long v7 = *(_OWORD *)&v11.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&a3->c = v7;
  *(_OWORD *)&a3->tdouble x = *(_OWORD *)&v11.tx;
  long long v8 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v11.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v11.c = v8;
  *(_OWORD *)&v11.tdouble x = *(_OWORD *)&a3->tx;
  return [(CRLCanvasInfoGeometry *)self initWithFullTransform:&v11 widthValid:1 heightValid:1];
}

- (CRLCanvasInfoGeometry)initWithLayoutGeometry:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  if (v4)
  {
    [v4 transform];
    long long v18 = v21;
    long long v19 = v22;
    long long v20 = v23;
    BOOL v6 = sub_10007F7EC((double *)&v18);
    [v5 transform];
  }
  else
  {
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    long long v18 = 0uLL;
    BOOL v6 = sub_10007F7EC((double *)&v18);
    memset(v17, 0, sizeof(v17));
  }
  sub_10007F788(v17);
  [v5 size];
  double v8 = v7;
  [v5 frame];
  double v13 = sub_100065738(v9, v10, v11, v12);
  double v15 = -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](self, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, v6, 0, sub_100064698(v13, v14, v8 * -0.5));

  return v15;
}

- (BOOL)widthValid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)heightValid
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)horizontalFlip
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)verticalFlip
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (CGRect)boundsBeforeRotation
{
  [(CRLCanvasInfoGeometry *)self position];
  id v3 = [(CRLCanvasInfoGeometry *)self size];

  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v3, v4);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGPoint)center
{
  [(CRLCanvasInfoGeometry *)self boundsBeforeRotation];

  double v6 = sub_100065738(v2, v3, v4, v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGAffineTransform)transform
{
  [(CRLCanvasInfoGeometry *)self boundsBeforeRotation];

  return -[CRLCanvasInfoGeometry transformBasedOnRect:](self, "transformBasedOnRect:");
}

- (CGAffineTransform)transformBasedOnRect:(SEL)a3
{
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = sub_100065738(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);

  return -[CRLCanvasInfoGeometry transformBasedOnPoint:centeredAtPoint:](self, "transformBasedOnPoint:centeredAtPoint:", x, y, v8, v7);
}

- (CGAffineTransform)transformBasedOnPoint:(SEL)a3 centeredAtPoint:(CGPoint)a4
{
  return -[CRLCanvasInfoGeometry transformBasedOnPoint:centeredAtPoint:withFlips:](self, "transformBasedOnPoint:centeredAtPoint:withFlips:", 1, a4.x, a4.y, a5.x, a5.y);
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
  CGPoint result = (CGAffineTransform *)[(CRLCanvasInfoGeometry *)self angle];
  double v14 = v13;
  if (v13 != 0.0
    || v6
    && ([(CRLCanvasInfoGeometry *)self horizontalFlip]
     || (CGPoint result = (CGAffineTransform *)[(CRLCanvasInfoGeometry *)self verticalFlip], result)))
  {
    double v15 = sub_100064680(x, y, v9);
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
      if ([(CRLCanvasInfoGeometry *)self horizontalFlip])
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
      if ([(CRLCanvasInfoGeometry *)self verticalFlip])
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
  [(CRLCanvasInfoGeometry *)self boundsBeforeRotation];
  double v5 = v4;
  double v7 = v6;
  double v11 = sub_100065738(v4, v6, v8, v9);

  return -[CRLCanvasInfoGeometry transformBasedOnPoint:centeredAtPoint:withFlips:](self, "transformBasedOnPoint:centeredAtPoint:withFlips:", 0, v5, v7, v11, v10);
}

- (CGRect)transformedBounds
{
  double v3 = sub_100064070();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [(CRLCanvasInfoGeometry *)self transform];
  v11.origin.double x = v3;
  v11.origin.double y = v5;
  v11.size.double width = v7;
  v11.size.double height = v9;
  return CGRectApplyAffineTransform(v11, &v10);
}

- (BOOL)allValuesValidNumbers
{
  [(CRLCanvasInfoGeometry *)self size];
  int v5 = sub_100065BC8(v3, v4);
  [(CRLCanvasInfoGeometry *)self position];
  double v7 = v6;
  double v9 = v8;
  [(CRLCanvasInfoGeometry *)self angle];
  if (!v5) {
    return 0;
  }
  double v11 = fabs(v10);
  BOOL v12 = v11 > INFINITY || v11 < INFINITY;
  return sub_100065BC8(v7, v9) & v12;
}

- (CRLCanvasInfoGeometry)geometryWithValidNumbers
{
  CGFloat v2 = self;
  if ([(CRLCanvasInfoGeometry *)v2 allValuesValidNumbers])
  {
    double v3 = v2;
  }
  else
  {
    double v3 = (CRLCanvasInfoGeometry *)[(CRLCanvasInfoGeometry *)v2 mutableCopy];
    [(CRLCanvasInfoGeometry *)v2 size];
    if ((sub_100065BC8(v4, v5) & 1) == 0)
    {
      -[CRLCanvasInfoGeometry setSize:](v3, "setSize:", 1.0, 1.0);
      if (![(CRLCanvasInfoGeometry *)v2 widthValid])
      {
        [(CRLCanvasInfoGeometry *)v3 size];
        [(CRLCanvasInfoGeometry *)v3 setSize:0.0];
      }
      if (![(CRLCanvasInfoGeometry *)v2 heightValid])
      {
        [(CRLCanvasInfoGeometry *)v3 size];
        -[CRLCanvasInfoGeometry setSize:](v3, "setSize:");
      }
    }
    [(CRLCanvasInfoGeometry *)v2 position];
    if ((sub_100065BC8(v6, v7) & 1) == 0) {
      -[CRLCanvasInfoGeometry setPosition:](v3, "setPosition:", CGPointZero.x, CGPointZero.y);
    }
    [(CRLCanvasInfoGeometry *)v2 angle];
    double v9 = fabs(v8);
    if (v9 >= INFINITY && v9 <= INFINITY) {
      [(CRLCanvasInfoGeometry *)v3 setAngle:0.0];
    }
  }

  return v3;
}

- (unint64_t)hash
{
  return sub_1000C8080((char *)&self->_flags, 4, 0xCBF29CE484222325);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (CRLCanvasInfoGeometry *)a3;
  double v5 = (double *)v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && sub_100064084(self->_position.x, self->_position.y, v5[1], v5[2])) {
    BOOL v6 = [(CRLCanvasInfoGeometry *)self isEqualExceptForPosition:v5];
  }
  else {
LABEL_6:
  }
    BOOL v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)isEqualExceptForPosition:(id)a3
{
  double v4 = (CRLCanvasInfoGeometry *)a3;
  double v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      BOOL v7 = 1;
    }
    else
    {
      BOOL v6 = v4;
      if (sub_100064084(self->_size.width, self->_size.height, v6->_size.width, v6->_size.height)
        && ((*(unsigned char *)&v6->_flags ^ *(unsigned char *)&self->_flags) & 0xF) == 0)
      {
        double angle = self->_angle;
        double v9 = v6->_angle;
        BOOL v7 = vabdd_f64(angle, v9) < 0.00999999978 || angle == v9;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CGAffineTransform)fullTransform
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v15 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)self, *(Swift::String *)&a3);
  [(CRLCanvasInfoGeometry *)self transformBasedOnRect:v15.recordType._object];
  CGFloat v6 = 1.0;
  CGFloat v7 = 1.0;
  if ([(CRLCanvasInfoGeometry *)self widthValid])
  {
    [(CRLCanvasInfoGeometry *)self size];
    CGFloat v7 = v8;
  }
  if ([(CRLCanvasInfoGeometry *)self heightValid])
  {
    [(CRLCanvasInfoGeometry *)self size];
    CGFloat v6 = v9;
  }
  long long v10 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v13.c = v10;
  *(_OWORD *)&v13.tdouble x = *(_OWORD *)&retstr->tx;
  CGPoint result = CGAffineTransformScale(&v14, &v13, v7, v6);
  long long v12 = *(_OWORD *)&v14.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v14.a;
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v14.tx;
  return result;
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3 widthValid:(BOOL)a4 heightValid:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double v8 = [CRLCanvasInfoGeometry alloc];
  long long v9 = *(_OWORD *)&a3->c;
  v12[0] = *(_OWORD *)&a3->a;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&a3->tx;
  long long v10 = [(CRLCanvasInfoGeometry *)v8 initWithFullTransform:v12 widthValid:v6 heightValid:v5];

  return v10;
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&a3->tx;
  double v4 = +[CRLCanvasInfoGeometry geometryFromFullTransform:v6 widthValid:1 heightValid:1];

  return v4;
}

+ (id)geometryFromTransform:(CGAffineTransform *)a3 withSize:(CGSize)a4
{
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformScale(&v8, &v7, a4.width, a4.height);
  BOOL v5 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v8];

  return v5;
}

- (id)geometryByAppendingTransform:(CGAffineTransform *)a3
{
  [(CRLCanvasInfoGeometry *)self fullTransform];
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v8.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v8.c = v5;
  *(_OWORD *)&v8.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v10, &t1, &v8);
  BOOL v6 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v10 widthValid:[(CRLCanvasInfoGeometry *)self widthValid] heightValid:[(CRLCanvasInfoGeometry *)self heightValid]];

  return v6;
}

- (CRLCanvasInfoGeometry)geometryWithParentGeometry:(id)a3
{
  id v4 = a3;
  [(CRLCanvasInfoGeometry *)self fullTransform];
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  CGAffineTransformConcat(&v9, &t1, &v7);
  long long v5 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v9 widthValid:[(CRLCanvasInfoGeometry *)self widthValid] heightValid:[(CRLCanvasInfoGeometry *)self heightValid]];

  return (CRLCanvasInfoGeometry *)v5;
}

- (id)geometryRelativeToGeometry:(id)a3
{
  id v4 = a3;
  [(CRLCanvasInfoGeometry *)self fullTransform];
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  CGAffineTransformInvert(&t2, &v7);
  CGAffineTransformConcat(&v10, &t1, &t2);
  long long v5 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v10 widthValid:[(CRLCanvasInfoGeometry *)self widthValid] heightValid:[(CRLCanvasInfoGeometry *)self heightValid]];

  return v5;
}

- (CRLCanvasInfoGeometry)geometryWithNewBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = [(CRLCanvasInfoGeometry *)self mutableCopy];
  [v8 setSize:width, height];
  double v9 = sub_100065738(x, y, width, height);
  double v11 = v10;
  [(CRLCanvasInfoGeometry *)self size];
  double v13 = v12 * 0.5;
  [(CRLCanvasInfoGeometry *)self size];
  double v14 = sub_100064680(v9, v11, v13);
  double v16 = v15;
  [(CRLCanvasInfoGeometry *)self transform];
  double v17 = sub_1000664E0(v22, v14, v16);
  double v19 = v18;
  [(CRLCanvasInfoGeometry *)self center];
  [v8 setCenter:sub_100064698(v17, v19, v20)];

  return (CRLCanvasInfoGeometry *)v8;
}

- (id)normalizedGeometry
{
  double angle = self->_angle;
  $CB6DE01367A4C750E2FF2F6D92039807 flags = self->_flags;
  unsigned int v5 = (*(unsigned int *)&flags >> 2) & 1;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if (v5) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
    sub_100065C2C(angle + 180.0);
    double angle = v7;
  }
  else
  {
    double v6 = (double)v5;
  }
  id v8 = -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(unsigned char *)&self->_flags & 1, (*(unsigned char *)&self->_flags >> 1) & 1, v6 != 0.0, 0, self->_position.x, self->_position.y, self->_size.width, self->_size.height, angle);

  return v8;
}

- (id)description
{
  if (*(unsigned char *)&self->_flags) {
    CFStringRef v3 = @"%g";
  }
  else {
    CFStringRef v3 = @"auto(%g)";
  }
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, *(void *)&self->_size.width);
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    CFStringRef v5 = @"%g";
  }
  else {
    CFStringRef v5 = @"auto(%g)";
  }
  double v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, *(void *)&self->_size.height);
  double v7 = +[NSString stringWithFormat:@"{%@, %@}", v4, v6];
  if (self->_angle == 0.0)
  {
    id v8 = &stru_101538650;
  }
  else
  {
    +[NSString stringWithFormat:@" angle=%g", *(void *)&self->_angle];
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  CFStringRef v9 = @" flip=h+v";
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    CFStringRef v9 = @" flip=h";
  }
  CFStringRef v10 = @" flip=v";
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    CFStringRef v10 = &stru_101538650;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    CFStringRef v11 = v9;
  }
  else {
    CFStringRef v11 = v10;
  }
  double v12 = (objc_class *)objc_opt_class();
  double v13 = NSStringFromClass(v12);
  double v14 = NSStringFromCGPoint(self->_position);
  double v15 = +[NSString stringWithFormat:@"<%@ %p pos=%@ size=%@%@%@>", v13, self, v14, v7, v8, v11];

  return v15;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)angle
{
  return self->_angle;
}

@end