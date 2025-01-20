@interface SUUICompressedImage
- (UIColor)borderColor;
- (double)borderWidth;
- (double)cornerRadius;
- (id)description;
- (int64_t)cornerType;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCornerType:(int64_t)a3;
@end

@implementation SUUICompressedImage

- (id)description
{
  int64_t v3 = [(SUUICompressedImage *)self cornerType];
  v4 = @"SUUICornerTypeArc";
  if (v3 != 1) {
    v4 = 0;
  }
  if (v3) {
    v5 = v4;
  }
  else {
    v5 = @"SUUICornerTypeContinuous";
  }
  v6 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)SUUICompressedImage;
  v7 = [(SUUICompressedImage *)&v15 description];
  [(SUUICompressedImage *)self cornerRadius];
  uint64_t v9 = v8;
  [(SUUICompressedImage *)self borderWidth];
  uint64_t v11 = v10;
  v12 = [(SUUICompressedImage *)self borderColor];
  v13 = [v6 stringWithFormat:@"%@: {%@, %f}; {%f, %@};", v7, v5, v9, v11, v12];

  return v13;
}

- (int64_t)cornerType
{
  return self->_cornerType;
}

- (void)setCornerType:(int64_t)a3
{
  self->_cornerType = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end