@interface TSDLayoutGeometry
+ (id)geometryFromFullTransform:(CGAffineTransform *)a3;
- (BOOL)differsInMoreThanTranslationFrom:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)fullTransform;
- (CGAffineTransform)inverseTransform;
- (CGAffineTransform)transform;
- (CGAffineTransform)transformByConcatenatingTransformTo:(SEL)a3;
- (CGPoint)center;
- (CGRect)frame;
- (CGSize)size;
- (TSDLayoutGeometry)init;
- (TSDLayoutGeometry)initWithFrame:(CGRect)a3;
- (TSDLayoutGeometry)initWithInfoGeometry:(id)a3;
- (TSDLayoutGeometry)initWithSize:(CGSize)a3 transform:(CGAffineTransform *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)geometryByOutsettingBy:(CGSize)a3;
- (id)geometryByTransformingBy:(CGAffineTransform *)a3;
- (id)geometryByTranslatingBy:(CGPoint)a3;
- (id)infoGeometry;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation TSDLayoutGeometry

- (CGRect)frame
{
  v5.origin.x = TSDRectWithSize();
  long long v3 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&v4.c = v3;
  *(_OWORD *)&v4.tx = *(_OWORD *)&self->mTransform.tx;
  return CGRectApplyAffineTransform(v5, &v4);
}

- (id)geometryByTranslatingBy:(CGPoint)a3
{
  CGAffineTransformMakeTranslation(&v5, a3.x, a3.y);
  return [(TSDLayoutGeometry *)self geometryByTransformingBy:&v5];
}

- (TSDLayoutGeometry)init
{
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return -[TSDLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", v4, 100.0, 100.0);
}

- (id)geometryByTransformingBy:(CGAffineTransform *)a3
{
  memset(&v18, 0, sizeof(v18));
  if (self) {
    [(TSDLayoutGeometry *)self transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v5;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v18, &t1, &t2);
  CGAffineTransform t2 = v18;
  double v6 = TSDTransformXYScale(&t2.a);
  double v8 = v7;
  CGAffineTransform v15 = v18;
  memset(&t2, 0, sizeof(t2));
  CGAffineTransformScale(&t2, &v15, 1.0 / v6, 1.0 / v7);
  [(TSDLayoutGeometry *)self size];
  double v10 = v6 * v9;
  [(TSDLayoutGeometry *)self size];
  double v12 = v8 * v11;
  v13 = [TSDLayoutGeometry alloc];
  CGAffineTransform v15 = t2;
  return -[TSDLayoutGeometry initWithSize:transform:](v13, "initWithSize:transform:", &v15, v10, v12);
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double width = self->mSize.width;
  double height = self->mSize.height;
  long long v7 = *(_OWORD *)&self->mTransform.c;
  v9[0] = *(_OWORD *)&self->mTransform.a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&self->mTransform.tx;
  return (id)objc_msgSend(v4, "initWithSize:transform:", v9, width, height);
}

- (TSDLayoutGeometry)initWithSize:(CGSize)a3 transform:(CGAffineTransform *)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)TSDLayoutGeometry;
  CGSize result = [(TSDLayoutGeometry *)&v10 init];
  if (result)
  {
    result->mSize.CGFloat width = width;
    result->mSize.CGFloat height = height;
    long long v8 = *(_OWORD *)&a4->a;
    long long v9 = *(_OWORD *)&a4->c;
    *(_OWORD *)&result->mTransform.tx = *(_OWORD *)&a4->tx;
    *(_OWORD *)&result->mTransform.c = v9;
    *(_OWORD *)&result->mTransform.a = v8;
  }
  return result;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].b;
  return self;
}

- (TSDLayoutGeometry)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGAffineTransformMakeTranslation(&v7, a3.origin.x, a3.origin.y);
  return -[TSDLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", &v7, width, height);
}

- (TSDLayoutGeometry)initWithInfoGeometry:(id)a3
{
  if (a3)
  {
    if (![a3 heightValid] || (objc_msgSend(a3, "widthValid") & 1) == 0)
    {
      long long v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDLayoutGeometry initWithInfoGeometry:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayoutGeometry.m"), 49, @"can't create layout geometry from info geometry if width and height are not valid");
    }
    [a3 size];
    double v8 = v7;
    double v10 = v9;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    [a3 transform];
    v14[0] = v15;
    v14[1] = v16;
    v14[2] = v17;
    return -[TSDLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", v14, v8, v10);
  }
  else
  {
    double v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDLayoutGeometry initWithInfoGeometry:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayoutGeometry.m"), 45, @"invalid nil value for '%s'", "infoGeometry");
    return 0;
  }
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3
{
  double a = a3->a;
  double b = a3->b;
  double v6 = sqrt(b * b + a * a);
  double c = a3->c;
  double d = a3->d;
  double v9 = sqrt(d * d + c * c);
  if (v6 > 0.01)
  {
    a3->double a = a / v6;
    a3->double b = b / v6;
  }
  if (v9 > 0.01)
  {
    a3->double c = c / v9;
    a3->double d = d / v9;
  }
  double v10 = [TSDLayoutGeometry alloc];
  long long v11 = *(_OWORD *)&a3->c;
  v13[0] = *(_OWORD *)&a3->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a3->tx;
  return -[TSDLayoutGeometry initWithSize:transform:](v10, "initWithSize:transform:", v13, v6, v9);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [TSDMutableLayoutGeometry alloc];
  double width = self->mSize.width;
  double height = self->mSize.height;
  long long v7 = *(_OWORD *)&self->mTransform.c;
  v9[0] = *(_OWORD *)&self->mTransform.a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&self->mTransform.tx;
  return -[TSDLayoutGeometry initWithSize:transform:](v4, "initWithSize:transform:", v9, width, height);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (self->mSize.width != *((double *)a3 + 1) || self->mSize.height != *((double *)a3 + 2)) {
    return 0;
  }
  long long v7 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&t1.double a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&t1.double c = v7;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->mTransform.tx;
  long long v8 = *(_OWORD *)((char *)a3 + 40);
  *(_OWORD *)&v9.double a = *(_OWORD *)((char *)a3 + 24);
  *(_OWORD *)&v9.double c = v8;
  *(_OWORD *)&v9.tx = *(_OWORD *)((char *)a3 + 56);
  return CGAffineTransformEqualToTransform(&t1, &v9);
}

- (id)description
{
  long long v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  [(TSDLayoutGeometry *)self frame];
  double v6 = NSStringFromCGRect(v11);
  long long v7 = NSStringFromCGSize(self->mSize);
  long long v8 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&transform.double a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&transform.double c = v8;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->mTransform.tx;
  return (id)[v3 stringWithFormat:@"<%@ %p frame=%@ size=%@ xform=%@>", v5, self, v6, v7, NSStringFromCGAffineTransform(&transform)];
}

- (CGPoint)center
{
  float64x2_t v2 = vaddq_f64(*(float64x2_t *)&self->mTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->mTransform.c, self->mSize.height * 0.5), *(float64x2_t *)&self->mTransform.a, self->mSize.width * 0.5));
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (CGAffineTransform)inverseTransform
{
  long long v3 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&v5.double a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&v5.double c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)&self->mTransform.tx;
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGAffineTransform)fullTransform
{
  CGFloat width = self->mSize.width;
  CGFloat height = self->mSize.height;
  long long v5 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&v7.double a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&v7.double c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->mTransform.tx;
  return CGAffineTransformScale(retstr, &v7, width, height);
}

- (id)infoGeometry
{
  long long v3 = [TSDInfoGeometry alloc];
  if (self)
  {
    [(TSDLayoutGeometry *)self transform];
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
  }
  [(TSDLayoutGeometry *)self size];
  return -[TSDInfoGeometry initWithTransform:size:](v3, "initWithTransform:size:", &v5);
}

- (id)geometryByOutsettingBy:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  long long v5 = (void *)[(TSDLayoutGeometry *)self mutableCopy];
  objc_msgSend(v5, "outsetBy:", width, height);

  return v5;
}

- (CGAffineTransform)transformByConcatenatingTransformTo:(SEL)a3
{
  long long v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.double a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.double c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  long long v5 = *(_OWORD *)&self->mTransform.c;
  *(_OWORD *)&v7.double a = *(_OWORD *)&self->mTransform.a;
  *(_OWORD *)&v7.double c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->mTransform.tx;
  return CGAffineTransformConcat(retstr, &t1, &v7);
}

- (BOOL)differsInMoreThanTranslationFrom:(id)a3
{
  if (!a3) {
    return 1;
  }
  [(TSDLayoutGeometry *)self frame];
  double v6 = v5;
  double v8 = v7;
  [a3 frame];
  if (v6 != v10 || v8 != v9) {
    return 1;
  }
  if (self) {
    [(TSDLayoutGeometry *)self transform];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  [a3 transform];
  return !TSDTransformsDifferOnlyByTranslation((double *)v14, &v13);
}

@end