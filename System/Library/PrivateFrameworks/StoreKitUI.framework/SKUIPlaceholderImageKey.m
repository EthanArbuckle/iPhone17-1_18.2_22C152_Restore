@interface SKUIPlaceholderImageKey
- (BOOL)isEqual:(id)a3;
- (SKUIPlaceholderImageKey)initWithSize:(CGSize)a3 imageTreatment:(int64_t)a4 placeholderBackgroundColor:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation SKUIPlaceholderImageKey

- (SKUIPlaceholderImageKey)initWithSize:(CGSize)a3 imageTreatment:(int64_t)a4 placeholderBackgroundColor:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SKUIPlaceholderImageKey;
  v11 = [(SKUIPlaceholderImageKey *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_double height = (uint64_t)height;
    v11->_imageTreatment = a4;
    v11->_double width = (uint64_t)width;
    objc_storeStrong((id *)&v11->_placeholderBackgroundColor, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  int64_t v2 = self->_width + self->_imageTreatment;
  return v2 + [(IKColor *)self->_placeholderBackgroundColor hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && self->_height == v4[1] && self->_width == v4[3] && self->_imageTreatment == v4[2])
  {
    placeholderBackgroundColor = self->_placeholderBackgroundColor;
    if (placeholderBackgroundColor == (IKColor *)v4[4]) {
      char v7 = 1;
    }
    else {
      char v7 = -[IKColor isEqual:](placeholderBackgroundColor, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIPlaceholderImageKey;
  v4 = [(SKUIPlaceholderImageKey *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: {%ld, %ld}, %ld, %@", v4, self->_width, self->_height, self->_imageTreatment, self->_placeholderBackgroundColor];

  return v5;
}

- (void).cxx_destruct
{
}

@end