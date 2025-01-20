@interface PUImportSectionedGridLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)bottomStrokeColor;
- (double)strokeWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBottomStrokeColor:(id)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation PUImportSectionedGridLayoutAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomStrokeColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)setBottomStrokeColor:(id)a3
{
}

- (UIColor)bottomStrokeColor
{
  return self->_bottomStrokeColor;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PUImportSectionedGridLayoutAttributes *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PUImportSectionedGridLayoutAttributes *)self backgroundColor];
      v7 = [(PUImportSectionedGridLayoutAttributes *)v5 backgroundColor];
      int v8 = [v6 isEqual:v7];

      if (!v8) {
        goto LABEL_9;
      }
      [(PUImportSectionedGridLayoutAttributes *)self strokeWidth];
      double v10 = v9;
      [(PUImportSectionedGridLayoutAttributes *)v5 strokeWidth];
      if (v10 != v11) {
        goto LABEL_9;
      }
      v12 = [(PUImportSectionedGridLayoutAttributes *)self bottomStrokeColor];
      v13 = [(PUImportSectionedGridLayoutAttributes *)v5 bottomStrokeColor];
      int v14 = [v12 isEqual:v13];

      if (v14)
      {
        v17.receiver = self;
        v17.super_class = (Class)PUImportSectionedGridLayoutAttributes;
        BOOL v15 = [(PUSectionedGridLayoutAttributes *)&v17 isEqual:v5];
      }
      else
      {
LABEL_9:
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUImportSectionedGridLayoutAttributes;
  v4 = [(PUSectionedGridLayoutAttributes *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 46, self->_backgroundColor);
  v4[47] = *(id *)&self->_strokeWidth;
  objc_storeStrong(v4 + 48, self->_bottomStrokeColor);
  return v4;
}

@end