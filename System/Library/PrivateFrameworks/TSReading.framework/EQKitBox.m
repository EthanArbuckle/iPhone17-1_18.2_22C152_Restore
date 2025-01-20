@interface EQKitBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGAffineTransform)transformFromDescendant:(SEL)a3;
- (CGColor)color;
- (CGRect)erasableBounds;
- (double)depth;
- (double)height;
- (double)layoutDepth;
- (double)layoutHeight;
- (double)layoutVSize;
- (double)vsize;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation EQKitBox

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = objc_opt_class();

  return [a3 isMemberOfClass:v4];
}

- (CGColor)color
{
  return 0;
}

- (double)height
{
  return 0.0;
}

- (double)depth
{
  return 0.0;
}

- (double)width
{
  return 0.0;
}

- (double)vsize
{
  [(EQKitBox *)self height];
  double v4 = v3;
  [(EQKitBox *)self depth];
  return v4 + v5;
}

- (double)layoutHeight
{
  [(EQKitBox *)self height];
  if (v3 < 0.0) {
    return 0.0;
  }

  [(EQKitBox *)self height];
  return result;
}

- (double)layoutDepth
{
  [(EQKitBox *)self depth];
  if (v3 < 0.0) {
    return 0.0;
  }

  [(EQKitBox *)self depth];
  return result;
}

- (double)layoutVSize
{
  [(EQKitBox *)self layoutHeight];
  double v4 = v3;
  [(EQKitBox *)self layoutDepth];
  return v4 + v5;
}

- (CGRect)erasableBounds
{
  [(EQKitBox *)self height];
  double v4 = v3;
  [(EQKitBox *)self width];
  double v6 = v5;
  [(EQKitBox *)self vsize];
  if (v6 >= 0.0) {
    double v8 = v6;
  }
  else {
    double v8 = -v6;
  }
  if (v6 >= 0.0) {
    double v9 = 0.0;
  }
  else {
    double v9 = v6 + 0.0;
  }
  if (v7 >= 0.0) {
    double v10 = v7;
  }
  else {
    double v10 = -v7;
  }
  if (v7 >= 0.0) {
    double v7 = -0.0;
  }
  double v11 = v7 - v4;
  double v12 = v9;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (CGAffineTransform)transformFromDescendant:(SEL)a3
{
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  return (CGAffineTransform *)-[EQKitBox p_getTransform:fromDescendant:](self, "p_getTransform:fromDescendant:");
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  return a4 == self;
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

@end