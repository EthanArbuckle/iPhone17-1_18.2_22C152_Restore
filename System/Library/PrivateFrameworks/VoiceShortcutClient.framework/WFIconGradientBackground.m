@interface WFIconGradientBackground
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (WFGradient)gradient;
- (WFIconGradientBackground)initWithCoder:(id)a3;
- (WFIconGradientBackground)initWithGradient:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFIconGradientBackground

- (WFIconGradientBackground)initWithGradient:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFIconBackground.m", 90, @"Invalid parameter not satisfying: %@", @"gradient" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFIconGradientBackground;
  v7 = [(WFIconBackground *)&v12 _init];
  v8 = (WFIconGradientBackground *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    v9 = v8;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFIconGradientBackground *)self gradient];
    id v6 = [v4 gradient];
    id v7 = v5;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v7 && v8) {
        char v10 = [v7 isEqual:v8];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (WFGradient)gradient
{
  return self->_gradient;
}

- (void)encodeWithCoder:(id)a3
{
}

- (WFIconGradientBackground)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gradient"];

  id v6 = [(WFIconGradientBackground *)self initWithGradient:v5];
  return v6;
}

- (unint64_t)hash
{
  return [(WFGradient *)self->_gradient hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end