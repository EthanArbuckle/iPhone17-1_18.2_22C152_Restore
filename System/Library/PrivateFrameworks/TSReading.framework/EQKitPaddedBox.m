@interface EQKitPaddedBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)erasableBounds;
- (EQKitBox)box;
- (EQKitPaddedBox)init;
- (EQKitPaddedBox)initWithBox:(id)a3 height:(double)a4 width:(double)a5 depth:(double)a6 lspace:(double)a7 voffset:(double)a8;
- (double)depth;
- (double)height;
- (double)lspace;
- (double)opticalAlignWidth;
- (double)voffset;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4;
@end

@implementation EQKitPaddedBox

- (EQKitPaddedBox)init
{
  return [(EQKitPaddedBox *)self initWithBox:0 height:0.0 width:0.0 depth:0.0 lspace:0.0 voffset:0.0];
}

- (EQKitPaddedBox)initWithBox:(id)a3 height:(double)a4 width:(double)a5 depth:(double)a6 lspace:(double)a7 voffset:(double)a8
{
  v16.receiver = self;
  v16.super_class = (Class)EQKitPaddedBox;
  v14 = [(EQKitPaddedBox *)&v16 init];
  if (v14)
  {
    v14->mBox = (EQKitBox *)a3;
    v14->mHeight = a4;
    v14->mWidth = a5;
    v14->mDepth = a6;
    v14->mLspace = a7;
    v14->mVoffset = a8;
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitPaddedBox;
  [(EQKitPaddedBox *)&v3 dealloc];
}

- (double)width
{
  return self->mWidth + self->mLspace;
}

- (double)opticalAlignWidth
{
  [(EQKitBox *)self->mBox opticalAlignWidth];
  return result;
}

- (double)height
{
  return self->mHeight + self->mVoffset;
}

- (double)depth
{
  return self->mDepth - self->mVoffset;
}

- (CGRect)erasableBounds
{
  [(EQKitBox *)self->mBox erasableBounds];
  double mLspace = self->mLspace;
  double v8 = -self->mVoffset;

  return CGRectOffset(*(CGRect *)&v3, mLspace, v8);
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)EQKitPaddedBox;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_);
  -[EQKitBox renderIntoContext:offset:](self->mBox, "renderIntoContext:offset:", a3, x + self->mLspace, y - self->mVoffset);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  switch(*((_DWORD *)a3 + 6))
  {
    case 0:
    case 2:
      a4.double y = a4.y - self->mVoffset;
      break;
    case 1:
    case 3:
      a4.double x = a4.x + self->mLspace;
      break;
    default:
      return [(EQKitBox *)self->mBox appendOpticalAlignToSpec:a4.x offset:a4.y];
  }
  return [(EQKitBox *)self->mBox appendOpticalAlignToSpec:a4.x offset:a4.y];
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  if (a4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v15 = v4;
    uint64_t v16 = v5;
    BOOL v8 = -[EQKitBox p_getTransform:fromDescendant:](self->mBox, "p_getTransform:fromDescendant:");
    if (v8)
    {
      long long v9 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v13.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v13.c = v9;
      double mLspace = self->mLspace;
      *(_OWORD *)&v13.tdouble x = *(_OWORD *)&a3->tx;
      CGAffineTransformTranslate(&v14, &v13, mLspace, -self->mVoffset);
      long long v11 = *(_OWORD *)&v14.c;
      *(_OWORD *)&a3->a = *(_OWORD *)&v14.a;
      *(_OWORD *)&a3->c = v11;
      *(_OWORD *)&a3->tdouble x = *(_OWORD *)&v14.tx;
      LOBYTE(v8) = 1;
    }
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(EQKitPaddedBox *)self box];
  [(EQKitPaddedBox *)self height];
  double v7 = v6;
  [(EQKitPaddedBox *)self width];
  double v9 = v8;
  [(EQKitPaddedBox *)self depth];
  double v11 = v10;
  [(EQKitPaddedBox *)self lspace];
  double v13 = v12;
  [(EQKitPaddedBox *)self voffset];

  return (id)[v4 initWithBox:v5 height:v7 width:v9 depth:v11 lspace:v13 voffset:v14];
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
        [(EQKitPaddedBox *)v3 height];
        double v7 = v6;
        [a3 height];
        if (v7 != v8) {
          goto LABEL_15;
        }
        [(EQKitPaddedBox *)v3 width];
        double v10 = v9;
        [a3 width];
        if (v10 != v11) {
          goto LABEL_15;
        }
        [(EQKitPaddedBox *)v3 depth];
        double v13 = v12;
        [a3 depth];
        if (v13 != v14) {
          goto LABEL_15;
        }
        [(EQKitPaddedBox *)v3 lspace];
        double v16 = v15;
        [a3 lspace];
        if (v16 == v17
          && (-[EQKitPaddedBox voffset](v3, "voffset"), double v19 = v18, [a3 voffset], v19 == v20))
        {
          v21 = [(EQKitPaddedBox *)v3 box];
          self = (EQKitPaddedBox *)[a3 box];
          if (v21 == self)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            v22 = self;
            LOBYTE(self) = 0;
            if (v21 && v22)
            {
              LOBYTE(self) = -[EQKitPaddedBox isEqual:](v21, "isEqual:");
            }
          }
        }
        else
        {
LABEL_15:
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
  [(EQKitPaddedBox *)self height];
  uint64_t v6 = v5;
  [(EQKitPaddedBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitPaddedBox *)self width];
  uint64_t v10 = v9;
  [(EQKitPaddedBox *)self lspace];
  uint64_t v12 = v11;
  [(EQKitPaddedBox *)self voffset];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f lspace=%f voffset=%f box=%@ ", v4, self, v6, v8, v10, v12, v13, -[EQKitPaddedBox box](self, "box")];
}

- (EQKitBox)box
{
  return self->mBox;
}

- (double)lspace
{
  return self->mLspace;
}

- (double)voffset
{
  return self->mVoffset;
}

@end