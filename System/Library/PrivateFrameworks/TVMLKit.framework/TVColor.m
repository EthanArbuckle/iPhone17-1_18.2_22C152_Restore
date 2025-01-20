@interface TVColor
- (IKColor)ikColor;
- (NSArray)gradientColors;
- (NSArray)gradientPoints;
- (TVColor)initWithColor:(id)a3;
- (UIColor)color;
- (int64_t)colorType;
@end

@implementation TVColor

- (TVColor)initWithColor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVColor;
  v5 = [(TVColor *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_ikColor, v4);
  }

  return v6;
}

- (UIColor)color
{
  if ([(TVColor *)self colorType] == 1)
  {
    v3 = [(TVColor *)self ikColor];
    id v4 = [v3 color];
  }
  else
  {
    id v4 = 0;
  }
  return (UIColor *)v4;
}

- (int64_t)colorType
{
  v3 = [(TVColor *)self ikColor];
  uint64_t v4 = [v3 colorType];

  if (!v4) {
    return 1;
  }
  v5 = [(TVColor *)self ikColor];
  if ([v5 colorType] != 3)
  {

    return 0;
  }
  v6 = [(TVColor *)self ikColor];
  uint64_t v7 = [v6 gradientType];

  if (v7 != 1) {
    return 0;
  }
  objc_super v8 = [(TVColor *)self ikColor];
  uint64_t v9 = [v8 gradientDirectionType];

  if (v9 == 1) {
    return 2;
  }
  v11 = [(TVColor *)self ikColor];
  uint64_t v12 = [v11 gradientDirectionType];

  if (v12 == 2) {
    return 3;
  }
  else {
    return 0;
  }
}

- (NSArray)gradientColors
{
  if (([(TVColor *)self colorType] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v3 = [(TVColor *)self ikColor];
    uint64_t v4 = [v3 gradientColors];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSArray *)v4;
}

- (NSArray)gradientPoints
{
  if (([(TVColor *)self colorType] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v3 = [(TVColor *)self ikColor];
    uint64_t v4 = [v3 gradientPoints];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSArray *)v4;
}

- (IKColor)ikColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ikColor);
  return (IKColor *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end