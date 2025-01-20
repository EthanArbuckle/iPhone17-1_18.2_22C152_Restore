@interface PXCuratedLibraryLabelConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (UIColor)textColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)textAlignment;
- (unint64_t)hash;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PXCuratedLibraryLabelConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
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
  v2 = [(PXCuratedLibraryLabelConfiguration *)self text];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXCuratedLibraryLabelConfiguration *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(PXCuratedLibraryLabelConfiguration *)self text];
      id v7 = [(PXCuratedLibraryLabelConfiguration *)v5 text];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqualToString:v7];

        if (!v8) {
          goto LABEL_11;
        }
      }
      int64_t v10 = [(PXCuratedLibraryLabelConfiguration *)self textAlignment];
      if (v10 == [(PXCuratedLibraryLabelConfiguration *)v5 textAlignment])
      {
        v11 = [(PXCuratedLibraryLabelConfiguration *)self textColor];
        v12 = [(PXCuratedLibraryLabelConfiguration *)v5 textColor];
        BOOL v9 = v11 == v12;

LABEL_12:
        goto LABEL_13;
      }
LABEL_11:
      BOOL v9 = 0;
      goto LABEL_12;
    }
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PXCuratedLibraryLabelConfiguration *)self text];
  [v4 setText:v5];

  objc_msgSend(v4, "setTextAlignment:", -[PXCuratedLibraryLabelConfiguration textAlignment](self, "textAlignment"));
  id v6 = [(PXCuratedLibraryLabelConfiguration *)self textColor];
  [v4 setTextColor:v6];

  return v4;
}

@end