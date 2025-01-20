@interface UICIColor
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (BOOL)getWhite:(double *)a3 alpha:(double *)a4;
- (BOOL)isEqual:(id)a3;
- (CGColor)CGColor;
- (UICIColor)colorWithAlphaComponent:(double)a3;
- (UICIColor)initWithCIColor:(id)a3;
- (id)CIColor;
- (id)_rgbColor;
- (id)description;
- (unint64_t)hash;
- (void)set;
- (void)setFill;
- (void)setStroke;
@end

@implementation UICIColor

- (UICIColor)initWithCIColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICIColor;
  v6 = [(UICIColor *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_ciColor, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  [(CIColor *)self->_ciColor red];
  uint64_t v5 = v4;
  [(CIColor *)self->_ciColor green];
  uint64_t v7 = v6;
  [(CIColor *)self->_ciColor blue];
  uint64_t v9 = v8;
  [(CIColor *)self->_ciColor alpha];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"CIColor %g %g %g %g", v5, v7, v9, v10);
}

- (id)_rgbColor
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    if (!a1[4])
    {
      v2 = (CGColorSpace *)[a1[3] colorSpace];
      if (qword_1EB25E410 != -1) {
        dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
      }
      if (v2 == (CGColorSpace *)qword_1EB25E408)
      {
        uint64_t v10 = [UIDeviceRGBColor alloc];
        [v1[3] red];
        double v12 = v11;
        [v1[3] green];
        double v14 = v13;
        [v1[3] blue];
        double v16 = v15;
        [v1[3] alpha];
        uint64_t v18 = [(UIDeviceRGBColor *)v10 initWithRed:v12 green:v14 blue:v16 alpha:v17];
        id v19 = v1[4];
        v1[4] = (id)v18;
      }
      else
      {
        [v1[3] red];
        components[0] = v3;
        [v1[3] green];
        components[1] = v4;
        [v1[3] blue];
        components[2] = v5;
        [v1[3] alpha];
        components[3] = v6;
        uint64_t v7 = CGColorCreate(v2, components);
        uint64_t v8 = [[UICGColor alloc] initWithCGColor:v7];
        id v9 = v1[4];
        v1[4] = v8;

        CGColorRelease(v7);
      }
    }
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)set
{
  -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 set];
}

- (void)setFill
{
  -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setFill];
}

- (void)setStroke
{
  -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setStroke];
}

- (UICIColor)colorWithAlphaComponent:(double)a3
{
  [(CIColor *)self->_ciColor red];
  double v6 = v5;
  [(CIColor *)self->_ciColor green];
  double v8 = v7;
  [(CIColor *)self->_ciColor blue];
  return (UICIColor *)+[UIColor colorWithRed:v6 green:v8 blue:v9 alpha:a3];
}

- (CGColor)CGColor
{
  -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  id v2 = objc_claimAutoreleasedReturnValue();
  CGFloat v3 = (CGColor *)[v2 CGColor];

  return v3;
}

- (id)CIColor
{
  return self->_ciColor;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(CIColor *)self->_ciColor isEqual:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(CIColor *)self->_ciColor hash];
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  uint64_t v10 = -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  LOBYTE(a6) = [v10 getRed:a3 green:a4 blue:a5 alpha:a6];

  return (char)a6;
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  double v6 = -[UICIColor _rgbColor]((id *)&self->super.super.isa);
  LOBYTE(a4) = [v6 getWhite:a3 alpha:a4];

  return (char)a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rgbColor, 0);
  objc_storeStrong((id *)&self->_ciColor, 0);
}

@end