@interface FxShape
+ (id)infiniteShape;
+ (id)shapeWithRect:(CGRect)a3;
- (BOOL)isInfinite;
- (CGRect)extent;
- (FxShape)initWithInfiniteBounds;
- (FxShape)initWithRect:(CGRect)a3;
- (id)intersectWithShape:(id)a3;
- (void)dealloc;
@end

@implementation FxShape

+ (id)infiniteShape
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInfiniteBounds];

  return v2;
}

+ (id)shapeWithRect:(CGRect)a3
{
  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return v3;
}

- (FxShape)initWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)FxShape;
  v7 = [(FxShape *)&v10 init];
  if (v7)
  {
    v8 = (FxShapePriv *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004074F221ECuLL);
    v7->_priv = v8;
    if (v8)
    {
      v8->var0.origin.CGFloat x = x;
      v8->var0.origin.CGFloat y = y;
      v8->var0.size.CGFloat width = width;
      v8->var0.size.CGFloat height = height;
      v8->var1 = 0;
    }
  }
  return v7;
}

- (FxShape)initWithInfiniteBounds
{
  v6.receiver = self;
  v6.super_class = (Class)FxShape;
  v2 = [(FxShape *)&v6 init];
  if (v2)
  {
    v3 = (FxShapePriv *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004074F221ECuLL);
    v2->_priv = v3;
    if (v3)
    {
      CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v3->var0.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v3->var0.size = v4;
      v2->_priv->var1 = 1;
    }
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_priv);
  v9.receiver = self;
  v9.super_class = (Class)FxShape;
  [(FxShape *)&v9 dealloc];
}

- (CGRect)extent
{
  priv = self->_priv;
  if (priv->var1)
  {
    double width = 3.40282347e38;
    double y = -1.70141173e38;
    double x = -1.70141173e38;
    double height = 3.40282347e38;
  }
  else
  {
    double x = priv->var0.origin.x;
    double y = priv->var0.origin.y;
    double width = priv->var0.size.width;
    double height = priv->var0.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isInfinite
{
  return self->_priv->var1;
}

- (id)intersectWithShape:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (CGRect *)*((void *)self + 1);
    [a3 extent];
    v10.origin.double x = v4;
    v10.origin.double y = v5;
    v10.size.double width = v6;
    v10.size.double height = v7;
    CGRect v9 = CGRectIntersection(*v3, v10);
    return +[FxShape shapeWithRect:](FxShape, "shapeWithRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  }
  return self;
}

@end