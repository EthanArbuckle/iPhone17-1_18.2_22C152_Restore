@interface PUPhotoDecoration
+ (id)defaultDecoration;
- (BOOL)isEqual:(id)a3;
- (UIColor)borderColor;
- (UIColor)foregroundColor;
- (double)borderWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)photoDecorationVariantsWithIncreasingAlpha:(int64_t)a3;
- (id)photoDecorationVariantsWithIncreasingBorderBrightness:(int64_t)a3;
- (unint64_t)hash;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setForegroundColor:(id)a3;
@end

@implementation PUPhotoDecoration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

- (void)setForegroundColor:(id)a3
{
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderColor:(id)a3
{
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (id)photoDecorationVariantsWithIncreasingBorderBrightness:(int64_t)a3
{
  if (a3 < 1)
  {
    v5 = 0;
  }
  else
  {
    int64_t v3 = a3;
    v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = 0;
    do
    {
      v7 = (void *)[(PUPhotoDecoration *)self copy];
      if (v6)
      {
        uint64_t v8 = objc_msgSend(v6, "pu_colorWithIncreasedBrightness");

        v6 = (void *)v8;
      }
      else
      {
        v6 = [(PUPhotoDecoration *)self borderColor];
      }
      [v7 setBorderColor:v6];
      [v5 addObject:v7];

      --v3;
    }
    while (v3);
  }
  return v5;
}

- (id)photoDecorationVariantsWithIncreasingAlpha:(int64_t)a3
{
  if (a3 < 1)
  {
    v5 = 0;
  }
  else
  {
    int64_t v3 = a3;
    v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = 0;
    do
    {
      v7 = (void *)[(PUPhotoDecoration *)self copy];
      if (v6)
      {
        uint64_t v8 = objc_msgSend(v6, "pu_colorWithIncreasedAlpha");

        v6 = (void *)v8;
      }
      else
      {
        v6 = [(PUPhotoDecoration *)self foregroundColor];
      }
      [v7 setForegroundColor:v6];
      [v5 addObject:v7];

      --v3;
    }
    while (v3);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PUPhotoDecoration *)self borderColor];
  [v4 setBorderColor:v5];

  [(PUPhotoDecoration *)self borderWidth];
  objc_msgSend(v4, "setBorderWidth:");
  v6 = [(PUPhotoDecoration *)self foregroundColor];
  [v4 setForegroundColor:v6];

  return v4;
}

- (unint64_t)hash
{
  int64_t v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = [(PUPhotoDecoration *)self borderColor];
  v5 = objc_msgSend(v3, "colorWithCGColor:", objc_msgSend(v4, "CGColor"));

  v6 = (void *)MEMORY[0x1E4FB1618];
  id v7 = [(PUPhotoDecoration *)self foregroundColor];
  uint64_t v8 = objc_msgSend(v6, "colorWithCGColor:", objc_msgSend(v7, "CGColor"));

  [(PUPhotoDecoration *)self borderWidth];
  unint64_t v10 = 1319 * ((1319 * (unint64_t)(v9 * 1319.0)) ^ [v5 hash]);
  unint64_t v11 = v10 ^ [v8 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(PUPhotoDecoration *)self borderWidth];
    double v7 = v6;
    [v5 borderWidth];
    if (v7 == v8
      && ([(PUPhotoDecoration *)self borderColor],
          double v9 = objc_claimAutoreleasedReturnValue(),
          [v5 borderColor],
          unint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v9 isEqual:v10],
          v10,
          v9,
          v11))
    {
      v12 = [(PUPhotoDecoration *)self foregroundColor];
      v13 = [v5 foregroundColor];
      char v14 = [v12 isEqual:v13];
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (id)defaultDecoration
{
  v2 = objc_alloc_init(PUPhotoDecoration);
  int64_t v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PUPhotoDecoration *)v2 setBorderColor:v3];

  PLPhysicalScreenScale();
  [(PUPhotoDecoration *)v2 setBorderWidth:1.0 / v4];
  id v5 = [MEMORY[0x1E4FB1618] clearColor];
  [(PUPhotoDecoration *)v2 setForegroundColor:v5];

  return v2;
}

@end