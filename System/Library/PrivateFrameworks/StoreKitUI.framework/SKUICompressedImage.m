@interface SKUICompressedImage
- (UIColor)borderColor;
- (double)borderWidth;
- (double)cornerRadius;
- (id)description;
- (int64_t)cornerType;
- (void)description;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCornerType:(int64_t)a3;
@end

@implementation SKUICompressedImage

- (id)description
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUICompressedImage *)v3 description];
      }
    }
  }
  int64_t v11 = [(SKUICompressedImage *)self cornerType];
  v12 = @"SKUICornerTypeArc";
  if (v11 != 1) {
    v12 = 0;
  }
  if (v11) {
    v13 = v12;
  }
  else {
    v13 = @"SKUICornerTypeContinuous";
  }
  v14 = NSString;
  v23.receiver = self;
  v23.super_class = (Class)SKUICompressedImage;
  v15 = [(SKUICompressedImage *)&v23 description];
  [(SKUICompressedImage *)self cornerRadius];
  uint64_t v17 = v16;
  [(SKUICompressedImage *)self borderWidth];
  uint64_t v19 = v18;
  v20 = [(SKUICompressedImage *)self borderColor];
  v21 = [v14 stringWithFormat:@"%@: {%@, %f}; {%f, %@};", v15, v13, v17, v19, v20];

  return v21;
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

- (void)description
{
}

@end