@interface EQKitVSpace
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (EQKitVSpace)init;
- (EQKitVSpace)initWithHeight:(double)a3 depth:(double)a4;
- (double)depth;
- (double)height;
- (double)layoutDepth;
- (double)layoutHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation EQKitVSpace

- (EQKitVSpace)initWithHeight:(double)a3 depth:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EQKitVSpace;
  result = [(EQKitVSpace *)&v7 init];
  if (result)
  {
    result->mHeight = a3;
    result->mDepth = a4;
  }
  return result;
}

- (EQKitVSpace)init
{
  return [(EQKitVSpace *)self initWithHeight:0.0 depth:0.0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(EQKitVSpace *)self height];
  double v6 = v5;
  [(EQKitVSpace *)self depth];

  return (id)[v4 initWithHeight:v6 depth:v7];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!a3) {
    goto LABEL_7;
  }
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    [(EQKitVSpace *)self height];
    double v7 = v6;
    [a3 height];
    if (v7 == v8)
    {
      [(EQKitVSpace *)self depth];
      double v10 = v9;
      [a3 depth];
      LOBYTE(v5) = v10 == v11;
      return v5;
    }
LABEL_7:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitVSpace *)self height];
  uint64_t v6 = v5;
  [(EQKitVSpace *)self depth];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f", v4, self, v6, v7];
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

- (double)height
{
  return self->mHeight;
}

- (double)depth
{
  return self->mDepth;
}

@end