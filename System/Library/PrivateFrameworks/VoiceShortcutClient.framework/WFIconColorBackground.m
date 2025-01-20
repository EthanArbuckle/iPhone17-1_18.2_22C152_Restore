@interface WFIconColorBackground
+ (BOOL)supportsSecureCoding;
+ (WFIconColorBackground)clearBackground;
- (BOOL)isEqual:(id)a3;
- (WFColor)color;
- (WFIconColorBackground)initWithCoder:(id)a3;
- (WFIconColorBackground)initWithColor:(id)a3;
- (WFIconColorBackground)initWithColor:(id)a3 blendMode:(int64_t)a4;
- (int64_t)blendMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFIconColorBackground

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFIconColorBackground *)self color];
    v6 = [v4 color];
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

- (WFColor)color
{
  return self->_color;
}

+ (WFIconColorBackground)clearBackground
{
  v2 = [WFIconColorBackground alloc];
  v3 = +[WFColor clearColor];
  id v4 = [(WFIconColorBackground *)v2 initWithColor:v3];

  return v4;
}

- (WFIconColorBackground)initWithColor:(id)a3 blendMode:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFIconBackground.m", 40, @"Invalid parameter not satisfying: %@", @"color" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFIconColorBackground;
  v9 = [(WFIconBackground *)&v14 _init];
  char v10 = (WFIconColorBackground *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    v10->_blendMode = a4;
    v11 = v10;
  }

  return v10;
}

- (WFIconColorBackground)initWithColor:(id)a3
{
  return [(WFIconColorBackground *)self initWithColor:a3 blendMode:0];
}

- (int64_t)blendMode
{
  return self->_blendMode;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
}

- (WFIconColorBackground)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];

  v6 = [(WFIconColorBackground *)self initWithColor:v5];
  return v6;
}

- (unint64_t)hash
{
  return [(WFColor *)self->_color hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end