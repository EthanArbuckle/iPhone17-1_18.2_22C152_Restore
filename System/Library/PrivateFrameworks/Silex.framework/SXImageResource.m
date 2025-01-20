@interface SXImageResource
- (BOOL)wideColorSpace;
- (CGSize)sizeThatFills:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (double)heightForImageWidth:(double)a3;
- (double)widthForImageHeight:(double)a3;
@end

@implementation SXImageResource

- (BOOL)wideColorSpace
{
  return 0;
}

- (double)heightForImageWidth:(double)a3
{
  [(SXImageResource *)self dimensions];
  double v6 = 0.0;
  if (v4 != *MEMORY[0x263F001B0] || v5 != *(double *)(MEMORY[0x263F001B0] + 8)) {
    return v5 * (a3 / v4);
  }
  return v6;
}

- (double)widthForImageHeight:(double)a3
{
  [(SXImageResource *)self dimensions];
  double v6 = 0.0;
  if (v4 != *MEMORY[0x263F001B0] || v5 != *(double *)(MEMORY[0x263F001B0] + 8)) {
    return v4 * (a3 / v5);
  }
  return v6;
}

- (CGSize)sizeThatFills:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *MEMORY[0x263F001B0];
  double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  [(SXImageResource *)self dimensions];
  if (v9 != v6 || v8 != v7)
  {
    [(SXImageResource *)self dimensions];
    double v6 = v11 * (height / v12);
    if (v6 >= width)
    {
      double v7 = height;
    }
    else
    {
      double v7 = v12 * (width / v11);
      double v6 = width;
    }
  }
  double v13 = v6;
  double v14 = v7;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *MEMORY[0x263F001B0];
  double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  [(SXImageResource *)self dimensions];
  if (v9 != v6 || v8 != v7)
  {
    [(SXImageResource *)self dimensions];
    double v12 = width / v11;
    [(SXImageResource *)self dimensions];
    if (v12 >= height / v13) {
      double v14 = height / v13;
    }
    else {
      double v14 = v12;
    }
    [(SXImageResource *)self dimensions];
    *(float *)&double v15 = v15 * v14;
    double v6 = roundf(*(float *)&v15);
    [(SXImageResource *)self dimensions];
    float v17 = v16 * v14;
    double v7 = roundf(v17);
  }
  double v18 = v6;
  double v19 = v7;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(SXImageResource *)self URL];
  [(SXImageResource *)self dimensions];
  double v6 = NSStringFromCGSize(v10);
  double v7 = [v3 stringWithFormat:@"<%@: %p; URL: '%@' SIZE: '%@'>", v4, self, v5, v6];

  return (NSString *)v7;
}

@end