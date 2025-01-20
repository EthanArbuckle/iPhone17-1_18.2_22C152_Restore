@interface WFImageIcon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (WFImage)image;
- (WFImageIcon)initWithCoder:(id)a3;
- (WFImageIcon)initWithImage:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFImageIcon

- (void).cxx_destruct
{
}

- (WFImage)image
{
  return self->_image;
}

- (void)encodeWithCoder:(id)a3
{
}

- (WFImageIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];

  v6 = [(WFImageIcon *)self initWithImage:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFImageIcon *)self image];
    v6 = [v4 image];
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

- (unint64_t)hash
{
  return [(WFImage *)self->_image hash];
}

- (WFImageIcon)initWithImage:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFIcon.m", 219, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFImageIcon;
  id v7 = [(WFIcon *)&v12 _init];
  id v8 = (WFImageIcon *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end