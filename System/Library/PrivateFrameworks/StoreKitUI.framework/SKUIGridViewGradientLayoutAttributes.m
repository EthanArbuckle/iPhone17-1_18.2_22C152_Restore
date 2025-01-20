@interface SKUIGridViewGradientLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (IKColor)gradientColor;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setGradientColor:(id)a3;
@end

@implementation SKUIGridViewGradientLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKUIGridViewGradientLayoutAttributes;
  v4 = [(UICollectionViewLayoutAttributes *)&v8 copyWithZone:a3];
  uint64_t v5 = [(IKColor *)self->_gradientColor copy];
  v6 = (void *)v4[44];
  v4[44] = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SKUIGridViewGradientLayoutAttributes *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((gradientColor = v4->_gradientColor, gradientColor == self->_gradientColor)
       || -[IKColor isEqual:](gradientColor, "isEqual:")))
    {
      v8.receiver = self;
      v8.super_class = (Class)SKUIGridViewGradientLayoutAttributes;
      BOOL v6 = [(UICollectionViewLayoutAttributes *)&v8 isEqual:v4];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIGridViewGradientLayoutAttributes;
  unint64_t v3 = [(UICollectionViewLayoutAttributes *)&v5 hash];
  return [(IKColor *)self->_gradientColor hash] ^ v3;
}

- (IKColor)gradientColor
{
  return self->_gradientColor;
}

- (void)setGradientColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end