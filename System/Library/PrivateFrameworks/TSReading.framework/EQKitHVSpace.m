@interface EQKitHVSpace
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (EQKitHVSpace)init;
- (EQKitHVSpace)initWithWidth:(double)a3 height:(double)a4 depth:(double)a5;
- (double)depth;
- (double)height;
- (double)layoutDepth;
- (double)layoutHeight;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation EQKitHVSpace

- (EQKitHVSpace)init
{
  return [(EQKitHVSpace *)self initWithWidth:0.0 height:0.0 depth:0.0];
}

- (EQKitHVSpace)initWithWidth:(double)a3 height:(double)a4 depth:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)EQKitHVSpace;
  result = [(EQKitHVSpace *)&v9 init];
  if (result)
  {
    result->mWidth = a3;
    result->mHeight = a4;
    result->mDepth = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(EQKitHVSpace *)self width];
  double v6 = v5;
  [(EQKitHVSpace *)self height];
  double v8 = v7;
  [(EQKitHVSpace *)self depth];

  return (id)[v4 initWithWidth:v6 height:v8 depth:v9];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!a3) {
    goto LABEL_8;
  }
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    [(EQKitHVSpace *)self width];
    double v7 = v6;
    [a3 width];
    if (v7 == v8)
    {
      [(EQKitHVSpace *)self height];
      double v10 = v9;
      [a3 height];
      if (v10 == v11)
      {
        [(EQKitHVSpace *)self depth];
        double v13 = v12;
        [a3 depth];
        LOBYTE(v5) = v13 == v14;
        return v5;
      }
    }
LABEL_8:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitHVSpace *)self height];
  uint64_t v6 = v5;
  [(EQKitHVSpace *)self depth];
  uint64_t v8 = v7;
  [(EQKitHVSpace *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f", v4, self, v6, v8, v9];
}

- (double)layoutHeight
{
  return self->mHeight;
}

- (double)layoutDepth
{
  return self->mDepth;
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 0;
}

- (double)width
{
  return self->mWidth;
}

- (double)height
{
  return self->mHeight;
}

- (double)depth
{
  return self->mDepth;
}

@end