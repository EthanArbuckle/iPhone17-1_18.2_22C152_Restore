@interface EQKitVShift
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)erasableBounds;
- (EQKitBox)box;
- (EQKitVShift)init;
- (EQKitVShift)initWithBox:(id)a3 offset:(double)a4;
- (double)depth;
- (double)height;
- (double)offset;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4;
@end

@implementation EQKitVShift

- (EQKitVShift)init
{
  return [(EQKitVShift *)self initWithBox:0 offset:0.0];
}

- (EQKitVShift)initWithBox:(id)a3 offset:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EQKitVShift;
  v6 = [(EQKitVShift *)&v8 init];
  if (v6)
  {
    v6->mBox = (EQKitBox *)a3;
    v6->mOffset = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitVShift;
  [(EQKitVShift *)&v3 dealloc];
}

- (double)width
{
  [(EQKitBox *)self->mBox width];
  return result;
}

- (double)height
{
  [(EQKitBox *)self->mBox height];
  return v3 + self->mOffset;
}

- (double)depth
{
  [(EQKitBox *)self->mBox depth];
  return v3 - self->mOffset;
}

- (CGRect)erasableBounds
{
  [(EQKitBox *)self->mBox erasableBounds];
  double v7 = -self->mOffset;

  return CGRectOffset(*(CGRect *)&v3, 0.0, v7);
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)EQKitVShift;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_);
  -[EQKitBox renderIntoContext:offset:](self->mBox, "renderIntoContext:offset:", a3, x, y - self->mOffset);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return -[EQKitBox appendOpticalAlignToSpec:offset:](self->mBox, "appendOpticalAlignToSpec:offset:", a3, a4.x, a4.y - self->mOffset);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  if (a4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v14 = v4;
    uint64_t v15 = v5;
    BOOL v8 = -[EQKitBox p_getTransform:fromDescendant:](self->mBox, "p_getTransform:fromDescendant:");
    if (v8)
    {
      long long v9 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v12.c = v9;
      *(_OWORD *)&v12.tdouble x = *(_OWORD *)&a3->tx;
      CGAffineTransformTranslate(&v13, &v12, 0.0, -self->mOffset);
      long long v10 = *(_OWORD *)&v13.c;
      *(_OWORD *)&a3->a = *(_OWORD *)&v13.a;
      *(_OWORD *)&a3->c = v10;
      *(_OWORD *)&a3->tdouble x = *(_OWORD *)&v13.tx;
      LOBYTE(v8) = 1;
    }
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(EQKitVShift *)self box];
  [(EQKitVShift *)self offset];

  return (id)objc_msgSend(v4, "initWithBox:offset:", v5);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = self;
  BOOL v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = [a3 isMemberOfClass:objc_opt_class()];
      if (self)
      {
        [(EQKitVShift *)v3 offset];
        double v7 = v6;
        [a3 offset];
        if (v7 == v8)
        {
          long long v9 = [(EQKitVShift *)v3 box];
          self = (EQKitVShift *)[a3 box];
          if (v9 == self)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            long long v10 = self;
            LOBYTE(self) = 0;
            if (v9 && v10)
            {
              LOBYTE(self) = -[EQKitVShift isEqual:](v9, "isEqual:");
            }
          }
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitVShift *)self height];
  uint64_t v6 = v5;
  [(EQKitVShift *)self depth];
  uint64_t v8 = v7;
  [(EQKitVShift *)self width];
  uint64_t v10 = v9;
  [(EQKitVShift *)self offset];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f offset=%f box=%@ ", v4, self, v6, v8, v10, v11, -[EQKitVShift box](self, "box")];
}

- (EQKitBox)box
{
  return self->mBox;
}

- (double)offset
{
  return self->mOffset;
}

@end