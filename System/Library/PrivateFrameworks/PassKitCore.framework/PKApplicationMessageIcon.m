@interface PKApplicationMessageIcon
+ (BOOL)supportsSecureCoding;
+ (CGSize)maximumSizeForStyle:(int64_t)a3;
+ (id)createWithImage:(id)a3 style:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (PKApplicationMessageIcon)init;
- (PKApplicationMessageIcon)initWithCoder:(id)a3;
- (PKImageDescriptor)image;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationMessageIcon

+ (CGSize)maximumSizeForStyle:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      double v3 = PKGetMaxPassWidth();
      double v4 = round(v3 / 375.0 * 236.0);
      double v5 = 45.0 / v3;
      if (v3 == 0.0) {
        double v5 = 1.0;
      }
      double v6 = 45.0 / v4;
      if (v4 == 0.0) {
        double v6 = 1.0;
      }
      if (fmin(v5, v6) != 1.0)
      {
        if (v5 >= v6)
        {
          double v3 = v3 / v4 * 45.0;
          double v4 = 45.0;
        }
        else
        {
          double v7 = v4 / v3;
          double v3 = 45.0;
          double v4 = v7 * 45.0;
        }
      }
    }
    else
    {
      double v3 = *MEMORY[0x1E4F1DB30];
      double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  else
  {
    double v3 = 45.0;
    double v4 = 45.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)createWithImage:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  double v7 = [PKApplicationMessageIcon alloc];
  id v8 = v6;
  v9 = v8;
  if (v7 && v8)
  {
    v14.receiver = v7;
    v14.super_class = (Class)PKApplicationMessageIcon;
    v10 = objc_msgSendSuper2(&v14, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, a3);
      v11[2] = (id)a4;
    }
    double v7 = v11;
    v12 = v7;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PKApplicationMessageIcon)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplicationMessageIcon;
  double v5 = [(PKApplicationMessageIcon *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (PKImageDescriptor *)v6;

    v5->_style = [v4 decodeIntegerForKey:@"style"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  image = self->_image;
  id v5 = a3;
  [v5 encodeObject:image forKey:@"image"];
  [v5 encodeInteger:self->_style forKey:@"style"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKApplicationMessageIcon *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      double v7 = v4;
      id v8 = v7;
      if (self && v7->_style == self->_style)
      {
        image = self->_image;
        v10 = v8->_image;
        if (image && v10) {
          char v6 = -[PKImageDescriptor isEqual:](image, "isEqual:");
        }
        else {
          char v6 = image == v10;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return SipHash();
}

- (PKImageDescriptor)image
{
  return self->_image;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end