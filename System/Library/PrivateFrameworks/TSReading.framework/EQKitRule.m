@interface EQKitRule
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (CGColor)color;
- (EQKitRule)init;
- (EQKitRule)initWithHeight:(double)a3 depth:(double)a4 width:(double)a5 cgColor:(CGColor *)a6;
- (double)depth;
- (double)height;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4;
@end

@implementation EQKitRule

- (EQKitRule)initWithHeight:(double)a3 depth:(double)a4 width:(double)a5 cgColor:(CGColor *)a6
{
  v14.receiver = self;
  v14.super_class = (Class)EQKitRule;
  v10 = [(EQKitRule *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->mHeight = a3;
    v10->mDepth = a4;
    v10->mWidth = a5;
    if (a6) {
      v12 = (CGColor *)CFRetain(a6);
    }
    else {
      v12 = 0;
    }
    v11->mCGColor = v12;
  }
  return v11;
}

- (EQKitRule)init
{
  return [(EQKitRule *)self initWithHeight:0 depth:0.0 width:0.0 cgColor:0.0];
}

- (void)dealloc
{
  CGColorRelease(self->mCGColor);
  v3.receiver = self;
  v3.super_class = (Class)EQKitRule;
  [(EQKitRule *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(EQKitRule *)self height];
  double v6 = v5;
  [(EQKitRule *)self depth];
  double v8 = v7;
  [(EQKitRule *)self width];
  mCGColor = self->mCGColor;

  return (id)[v4 initWithHeight:mCGColor depth:v6 width:v8 cgColor:v9];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!a3) {
    goto LABEL_10;
  }
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  [(EQKitRule *)self height];
  double v7 = v6;
  [a3 height];
  if (v7 != v8
    || (-[EQKitRule depth](self, "depth"), double v10 = v9, [a3 depth], v10 != v11)
    || (-[EQKitRule width](self, "width"), double v13 = v12, [a3 width], v13 != v14))
  {
LABEL_10:
    LOBYTE(v5) = 0;
    return v5;
  }
  v15 = [(EQKitRule *)self color];
  v16 = (CGColor *)[a3 color];

  LOBYTE(v5) = CGColorEqualToColor(v15, v16);
  return v5;
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  if (a3)
  {
    double y = a4.y;
    double x = a4.x;
    [(EQKitRule *)self width];
    double v9 = v8;
    [(EQKitBox *)self vsize];
    if (v9 > 0.0)
    {
      double v11 = v10;
      if (v10 > 0.0)
      {
        if (self->mCGColor)
        {
          CGContextSaveGState(a3);
          CGContextSetFillColorWithColor(a3, self->mCGColor);
        }
        [(EQKitRule *)self height];
        double v13 = y - v12;
        if (v9 >= 0.0) {
          double v14 = v9;
        }
        else {
          double v14 = -v9;
        }
        double v15 = -0.0;
        if (v9 >= 0.0) {
          double v16 = -0.0;
        }
        else {
          double v16 = v9;
        }
        double v17 = x + v16;
        double v18 = -v11;
        if (v11 < 0.0) {
          double v15 = v11;
        }
        else {
          double v18 = v11;
        }
        double v19 = v15 + v13;
        CGContextFillRect(a3, *(CGRect *)(&v14 - 2));
        if (self->mCGColor)
        {
          CGContextRestoreGState(a3);
        }
      }
    }
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  int v4 = *((_DWORD *)a3 + 6);
  if (v4 == 2)
  {
    a4.double x = a4.x + self->mWidth;
  }
  else if (v4)
  {
    return 1;
  }
  EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, a4, self->mHeight);
  return 1;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitRule *)self height];
  uint64_t v6 = v5;
  [(EQKitRule *)self depth];
  uint64_t v8 = v7;
  [(EQKitRule *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f", v4, self, v6, v8, v9];
}

- (double)height
{
  return self->mHeight;
}

- (double)depth
{
  return self->mDepth;
}

- (double)width
{
  return self->mWidth;
}

- (CGColor)color
{
  return self->mCGColor;
}

@end