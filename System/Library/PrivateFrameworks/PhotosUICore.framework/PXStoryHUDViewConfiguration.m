@interface PXStoryHUDViewConfiguration
- (BOOL)isEqual:(id)a3;
- (CGPoint)textInsets;
- (CGPoint)textRelativePosition;
- (NSString)text;
- (NSString)title;
- (PXStoryHUDViewConfiguration)init;
- (UIColor)tintColor;
- (double)borderWidth;
- (double)fontSize;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setBorderWidth:(double)a3;
- (void)setFontSize:(double)a3;
- (void)setText:(id)a3;
- (void)setTextInsets:(CGPoint)a3;
- (void)setTextRelativePosition:(CGPoint)a3;
- (void)setTintColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXStoryHUDViewConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setTextInsets:(CGPoint)a3
{
  self->_textInsets = a3;
}

- (CGPoint)textInsets
{
  double x = self->_textInsets.x;
  double y = self->_textInsets.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTextRelativePosition:(CGPoint)a3
{
  self->_textRelativePosition = a3;
}

- (CGPoint)textRelativePosition
{
  double x = self->_textRelativePosition.x;
  double y = self->_textRelativePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)hash
{
  v3 = [(PXStoryHUDViewConfiguration *)self text];
  uint64_t v4 = [v3 hash];
  v5 = [(PXStoryHUDViewConfiguration *)self title];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXStoryHUDViewConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(PXStoryHUDViewConfiguration *)self text];
      id v7 = [(PXStoryHUDViewConfiguration *)v5 text];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqualToString:v7];

        if (!v8)
        {
LABEL_5:
          LOBYTE(v9) = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      [(PXStoryHUDViewConfiguration *)self textRelativePosition];
      double v11 = v10;
      double v13 = v12;
      [(PXStoryHUDViewConfiguration *)v5 textRelativePosition];
      LOBYTE(v9) = 0;
      if (v11 != v15) {
        goto LABEL_25;
      }
      if (v13 != v14) {
        goto LABEL_25;
      }
      [(PXStoryHUDViewConfiguration *)self textInsets];
      double v17 = v16;
      double v19 = v18;
      [(PXStoryHUDViewConfiguration *)v5 textInsets];
      LOBYTE(v9) = 0;
      if (v17 != v21 || v19 != v20) {
        goto LABEL_25;
      }
      [(PXStoryHUDViewConfiguration *)self fontSize];
      double v23 = v22;
      [(PXStoryHUDViewConfiguration *)v5 fontSize];
      if (v23 != v24) {
        goto LABEL_5;
      }
      id v25 = [(PXStoryHUDViewConfiguration *)self tintColor];
      id v26 = [(PXStoryHUDViewConfiguration *)v5 tintColor];
      if (v25 == v26)
      {
      }
      else
      {
        int v9 = [v25 isEqual:v26];

        if (!v9)
        {
LABEL_24:

          goto LABEL_25;
        }
      }
      [(PXStoryHUDViewConfiguration *)self borderWidth];
      double v28 = v27;
      [(PXStoryHUDViewConfiguration *)v5 borderWidth];
      if (v28 == v29)
      {
        v30 = [(PXStoryHUDViewConfiguration *)self title];
        v31 = [(PXStoryHUDViewConfiguration *)v5 title];
        if (v30 == v31) {
          LOBYTE(v9) = 1;
        }
        else {
          LOBYTE(v9) = [v30 isEqualToString:v31];
        }
      }
      else
      {
        LOBYTE(v9) = 0;
      }
      goto LABEL_24;
    }
    LOBYTE(v9) = 0;
  }
LABEL_26:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_text);
  *((_OWORD *)v4 + 3) = self->_textRelativePosition;
  *((_OWORD *)v4 + 4) = self->_textInsets;
  v4[3] = *(id *)&self->_fontSize;
  objc_storeStrong(v4 + 4, self->_tintColor);
  v4[5] = *(id *)&self->_borderWidth;
  objc_storeStrong(v4 + 2, self->_title);
  return v4;
}

- (PXStoryHUDViewConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryHUDViewConfiguration;
  CGPoint result = [(PXStoryHUDViewConfiguration *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #5.0 }
    result->_textInsets = _Q0;
    result->_fontSize = 11.0;
  }
  return result;
}

@end