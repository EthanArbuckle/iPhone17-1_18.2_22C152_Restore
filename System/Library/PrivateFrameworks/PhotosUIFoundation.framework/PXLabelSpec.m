@interface PXLabelSpec
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)allowTruncation;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)fallbackTextAttributes;
- (NSDictionary)textAttributes;
- (PXLabelSpec)init;
- (UIColor)textColor;
- (UIEdgeInsets)contentInsets;
- (UIFont)font;
- (double)minimumScaleFactor;
- (double)minimumTruncatedScaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)capitalization;
- (int64_t)fallbackCapitalization;
- (int64_t)textAlignment;
- (int64_t)verticalAlignment;
- (unint64_t)hash;
- (unint64_t)numberOfLines;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAllowTruncation:(BOOL)a3;
- (void)setCapitalization:(int64_t)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setFallbackCapitalization:(int64_t)a3;
- (void)setFallbackTextAttributes:(id)a3;
- (void)setFont:(id)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setMinimumTruncatedScaleFactor:(double)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextAttributes:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setVerticalAlignment:(int64_t)a3;
@end

@implementation PXLabelSpec

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXLabelSpec;
  v4 = [(PXViewSpec *)&v7 copyWithZone:a3];
  objc_storeStrong(v4 + 14, self->_font);
  objc_storeStrong(v4 + 13, self->_textColor);
  objc_storeStrong(v4 + 15, self->_textAttributes);
  objc_storeStrong(v4 + 16, self->_fallbackTextAttributes);
  v4[17] = self->_textAlignment;
  v4[18] = self->_numberOfLines;
  v4[19] = self->_verticalAlignment;
  v4[20] = self->_capitalization;
  v4[21] = self->_fallbackCapitalization;
  long long v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *((_OWORD *)v4 + 12) = *(_OWORD *)&self->_contentInsets.top;
  *((_OWORD *)v4 + 13) = v5;
  *((unsigned char *)v4 + 96) = self->_adjustsFontSizeToFitWidth;
  v4[22] = *(id *)&self->_minimumScaleFactor;
  *((unsigned char *)v4 + 97) = self->_allowTruncation;
  v4[23] = *(id *)&self->_minimumTruncatedScaleFactor;
  return v4;
}

- (PXLabelSpec)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXLabelSpec;
  result = [(PXViewSpec *)&v3 init];
  if (result)
  {
    result->_textAlignment = 4;
    result->_verticalAlignment = 0;
  }
  return result;
}

- (void)setTextColor:(id)a3
{
}

- (void)setTextAttributes:(id)a3
{
}

- (void)setFont:(id)a3
{
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  self->_verticalAlignment = a3;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (void)setCapitalization:(int64_t)a3
{
  self->_capitalization = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setAllowTruncation:(BOOL)a3
{
  self->_allowTruncation = a3;
}

- (void)setFallbackCapitalization:(int64_t)a3
{
  self->_fallbackCapitalization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTextAttributes, 0);
  objc_storeStrong((id *)&self->_textAttributes, 0);
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_textColor, 0);
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  self->_adjustsFontSizeToFitWidth = a3;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setMinimumTruncatedScaleFactor:(double)a3
{
  self->_minimumTruncatedScaleFactor = a3;
}

- (double)minimumTruncatedScaleFactor
{
  return self->_minimumTruncatedScaleFactor;
}

- (BOOL)allowTruncation
{
  return self->_allowTruncation;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)fallbackCapitalization
{
  return self->_fallbackCapitalization;
}

- (int64_t)capitalization
{
  return self->_capitalization;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void)setFallbackTextAttributes:(id)a3
{
}

- (NSDictionary)fallbackTextAttributes
{
  return self->_fallbackTextAttributes;
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PXLabelSpec;
  BOOL v5 = [(PXViewSpec *)&v46 isEqual:v4];
  id v6 = v4;
  objc_super v7 = v6;
  if (v5)
  {
    id v8 = [v6 font];
    id v9 = [(PXLabelSpec *)self font];
    if (v8 == v9)
    {
    }
    else
    {
      v10 = v9;
      char v11 = [v8 isEqual:v9];

      if ((v11 & 1) == 0)
      {
LABEL_26:
        LOBYTE(v5) = 0;
        goto LABEL_27;
      }
    }
    id v12 = [v7 textColor];
    id v13 = [(PXLabelSpec *)self textColor];
    if (v12 == v13)
    {
    }
    else
    {
      v14 = v13;
      char v15 = [v12 isEqual:v13];

      if ((v15 & 1) == 0) {
        goto LABEL_26;
      }
    }
    id v16 = [v7 textAttributes];
    id v17 = [(PXLabelSpec *)self textAttributes];
    if (v16 == v17)
    {
    }
    else
    {
      v18 = v17;
      char v19 = [v16 isEqual:v17];

      if ((v19 & 1) == 0) {
        goto LABEL_26;
      }
    }
    uint64_t v20 = [v7 textAlignment];
    if (v20 != [(PXLabelSpec *)self textAlignment]) {
      goto LABEL_26;
    }
    uint64_t v21 = [v7 verticalAlignment];
    if (v21 != [(PXLabelSpec *)self verticalAlignment]) {
      goto LABEL_26;
    }
    uint64_t v22 = [v7 capitalization];
    if (v22 != [(PXLabelSpec *)self capitalization]) {
      goto LABEL_26;
    }
    uint64_t v23 = [v7 fallbackCapitalization];
    if (v23 != [(PXLabelSpec *)self fallbackCapitalization]) {
      goto LABEL_26;
    }
    uint64_t v24 = [v7 numberOfLines];
    if (v24 != [(PXLabelSpec *)self numberOfLines]) {
      goto LABEL_26;
    }
    [v7 contentInsets];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    [(PXLabelSpec *)self contentInsets];
    LOBYTE(v5) = 0;
    if (v28 == v36 && v26 == v33 && v32 == v35 && v30 == v34)
    {
      int v37 = [v7 adjustsFontSizeToFitWidth];
      if (v37 == [(PXLabelSpec *)self adjustsFontSizeToFitWidth])
      {
        [v7 minimumScaleFactor];
        double v39 = v38;
        [(PXLabelSpec *)self minimumScaleFactor];
        if (v39 == v40)
        {
          int v41 = [v7 allowTruncation];
          if (v41 == [(PXLabelSpec *)self allowTruncation])
          {
            [v7 minimumTruncatedScaleFactor];
            double v44 = v43;
            [(PXLabelSpec *)self minimumTruncatedScaleFactor];
            LOBYTE(v5) = v44 == v45;
            goto LABEL_27;
          }
        }
      }
      goto LABEL_26;
    }
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  v17.receiver = self;
  v17.super_class = (Class)PXLabelSpec;
  unint64_t v3 = [(PXViewSpec *)&v17 hash];
  id v4 = [(PXLabelSpec *)self font];
  uint64_t v5 = [v4 hash];

  id v6 = [(PXLabelSpec *)self textColor];
  uint64_t v7 = v5 ^ [v6 hash];

  id v8 = [(PXLabelSpec *)self textAttributes];
  uint64_t v9 = v7 ^ [v8 hash] ^ v3;

  int64_t v10 = v9 ^ (2 * [(PXLabelSpec *)self textAlignment]);
  int64_t v11 = v10 ^ (4 * [(PXLabelSpec *)self capitalization]);
  unint64_t v12 = v11 ^ (8 * [(PXLabelSpec *)self numberOfLines]);
  if ([(PXLabelSpec *)self adjustsFontSizeToFitWidth]) {
    uint64_t v13 = 16;
  }
  else {
    uint64_t v13 = 0;
  }
  BOOL v14 = [(PXLabelSpec *)self allowTruncation];
  uint64_t v15 = 32;
  if (!v14) {
    uint64_t v15 = 0;
  }
  return v12 ^ v13 ^ v15;
}

@end