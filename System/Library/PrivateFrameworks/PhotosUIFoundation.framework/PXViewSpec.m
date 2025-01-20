@interface PXViewSpec
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (NSString)cornerCurve;
- (PXViewSpec)init;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (UIColor)selectionHighlightColor;
- (double)borderWidth;
- (double)cornerRadius;
- (double)displayScale;
- (double)rotationAngle;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compositingFilterType;
- (unint64_t)cornerMask;
- (unint64_t)hash;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCompositingFilterType:(int64_t)a3;
- (void)setCornerCurve:(id)a3;
- (void)setCornerMask:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDisplayScale:(double)a3;
- (void)setHidden:(BOOL)a3;
- (void)setRotationAngle:(double)a3;
- (void)setSelectionHighlightColor:(id)a3;
@end

@implementation PXViewSpec

- (void)setBackgroundColor:(id)a3
{
}

- (void)setCompositingFilterType:(int64_t)a3
{
  self->_compositingFilterType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_selectionHighlightColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_backgroundColor);
  objc_storeStrong((id *)(v4 + 24), self->_selectionHighlightColor);
  objc_storeStrong((id *)(v4 + 32), self->_borderColor);
  *(double *)(v4 + 40) = self->_borderWidth;
  *(double *)(v4 + 48) = self->_cornerRadius;
  uint64_t v5 = [(NSString *)self->_cornerCurve copy];
  v6 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v5;

  *(void *)(v4 + 64) = self->_cornerMask;
  *(double *)(v4 + 72) = self->_displayScale;
  *(void *)(v4 + 88) = self->_compositingFilterType;
  *(unsigned char *)(v4 + 8) = self->_hidden;
  *(double *)(v4 + 80) = self->_rotationAngle;
  return (id)v4;
}

- (PXViewSpec)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXViewSpec;
  result = [(PXViewSpec *)&v3 init];
  if (result) {
    result->_displayScale = 1.0;
  }
  return result;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (int64_t)compositingFilterType
{
  return self->_compositingFilterType;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setCornerMask:(unint64_t)a3
{
  self->_cornerMask = a3;
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (void)setCornerCurve:(id)a3
{
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
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

- (void)setSelectionHighlightColor:(id)a3
{
}

- (UIColor)selectionHighlightColor
{
  return self->_selectionHighlightColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PXViewSpec *)self backgroundColor];
    id v7 = [v5 backgroundColor];
    if (v6 == v7)
    {
    }
    else
    {
      v8 = v7;
      char v9 = [v6 isEqual:v7];

      if ((v9 & 1) == 0) {
        goto LABEL_25;
      }
    }
    id v11 = [(PXViewSpec *)self selectionHighlightColor];
    id v12 = [v5 selectionHighlightColor];
    if (v11 == v12)
    {
    }
    else
    {
      v13 = v12;
      char v14 = [v11 isEqual:v12];

      if ((v14 & 1) == 0) {
        goto LABEL_25;
      }
    }
    id v15 = [(PXViewSpec *)self borderColor];
    id v16 = [v5 borderColor];
    if (v15 == v16)
    {
    }
    else
    {
      v17 = v16;
      char v18 = [v15 isEqual:v16];

      if ((v18 & 1) == 0) {
        goto LABEL_25;
      }
    }
    [(PXViewSpec *)self borderWidth];
    double v20 = v19;
    [v5 borderWidth];
    if (v20 != v21) {
      goto LABEL_25;
    }
    [(PXViewSpec *)self cornerRadius];
    double v23 = v22;
    [v5 cornerRadius];
    if (v23 != v24) {
      goto LABEL_25;
    }
    id v25 = [(PXViewSpec *)self cornerCurve];
    id v26 = [v5 cornerCurve];
    if (v25 == v26)
    {
    }
    else
    {
      v27 = v26;
      char v28 = [v25 isEqual:v26];

      if ((v28 & 1) == 0) {
        goto LABEL_25;
      }
    }
    unint64_t v29 = [(PXViewSpec *)self cornerMask];
    if (v29 == [v5 cornerMask])
    {
      [(PXViewSpec *)self displayScale];
      double v31 = v30;
      [v5 displayScale];
      if (v31 == v32)
      {
        int64_t v33 = [(PXViewSpec *)self compositingFilterType];
        if (v33 == [v5 compositingFilterType])
        {
          int v34 = [(PXViewSpec *)self isHidden];
          if (v34 == [v5 isHidden])
          {
            [(PXViewSpec *)self rotationAngle];
            double v37 = v36;
            [v5 rotationAngle];
            BOOL v10 = v37 == v38;
            goto LABEL_26;
          }
        }
      }
    }
LABEL_25:
    BOOL v10 = 0;
LABEL_26:

    goto LABEL_27;
  }
  BOOL v10 = 0;
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  objc_super v3 = [(PXViewSpec *)self backgroundColor];
  uint64_t v4 = [v3 hash];

  id v5 = [(PXViewSpec *)self selectionHighlightColor];
  uint64_t v6 = [v5 hash] ^ v4;

  id v7 = [(PXViewSpec *)self borderColor];
  uint64_t v8 = v6 ^ [v7 hash];

  return v8 ^ (2 * (uint64_t)self->_borderWidth) ^ (4 * (uint64_t)self->_cornerRadius) ^ (8 * self->_cornerMask) ^ (16 * (uint64_t)self->_displayScale) ^ (32 * self->_hidden);
}

@end