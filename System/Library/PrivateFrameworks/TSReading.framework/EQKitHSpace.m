@interface EQKitHSpace
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (EQKitHSpace)init;
- (EQKitHSpace)initWithWidth:(double)a3;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation EQKitHSpace

- (EQKitHSpace)initWithWidth:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitHSpace;
  result = [(EQKitHSpace *)&v5 init];
  if (result) {
    result->mWidth = a3;
  }
  return result;
}

- (EQKitHSpace)init
{
  return [(EQKitHSpace *)self initWithWidth:0.0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(EQKitHSpace *)self width];

  return (id)objc_msgSend(v4, "initWithWidth:");
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3)
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      [(EQKitHSpace *)self width];
      double v7 = v6;
      [a3 width];
      LOBYTE(v5) = v7 == v8;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitHSpace *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: width=%f", v4, self, v5];
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 0;
}

- (double)width
{
  return self->mWidth;
}

@end