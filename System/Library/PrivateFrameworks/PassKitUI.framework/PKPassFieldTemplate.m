@interface PKPassFieldTemplate
+ (PKPassFieldTemplate)fieldTemplateWithTextAlignment:(int64_t)a3;
+ (PKPassFieldTemplate)fieldTemplateWithVerticalPadding:(double)a3;
+ (PKPassFieldTemplate)fieldTemplateWithViewSubclass:(Class)a3;
+ (id)_templateByResolvingTemplate:(id)a3 withDefault:(id)a4;
- (BOOL)suppressesEmptyLabel;
- (BOOL)suppressesLabel;
- (BOOL)valueCanWrap;
- (BOOL)valueSignificant;
- (Class)viewSubclass;
- (NSNumber)boxedLabelCaseStyle;
- (NSNumber)boxedPreferredSingleStyle;
- (NSNumber)boxedSuppressesEmptyLabel;
- (NSNumber)boxedSuppressesLabel;
- (NSNumber)boxedTextAlignment;
- (NSNumber)boxedValueCanWrap;
- (NSNumber)boxedValueSignificant;
- (NSNumber)boxedVerticalPadding;
- (NSString)automaticVibrantLabelBlendMode;
- (NSString)automaticVibrantValueBlendMode;
- (UIColor)automaticVibrantLabelColor;
- (UIColor)automaticVibrantValueColor;
- (UIFont)labelFont;
- (UIFont)valueFont;
- (double)verticalPadding;
- (int64_t)labelCaseStyle;
- (int64_t)preferredSingleStyle;
- (int64_t)textAlignment;
- (void)setAutomaticVibrantLabelBlendMode:(id)a3;
- (void)setAutomaticVibrantLabelColor:(id)a3;
- (void)setAutomaticVibrantValueBlendMode:(id)a3;
- (void)setAutomaticVibrantValueColor:(id)a3;
- (void)setBoxedLabelCaseStyle:(id)a3;
- (void)setBoxedPreferredSingleStyle:(id)a3;
- (void)setBoxedSuppressesEmptyLabel:(id)a3;
- (void)setBoxedSuppressesLabel:(id)a3;
- (void)setBoxedTextAlignment:(id)a3;
- (void)setBoxedValueCanWrap:(id)a3;
- (void)setBoxedValueSignificant:(id)a3;
- (void)setBoxedVerticalPadding:(id)a3;
- (void)setLabelCaseStyle:(int64_t)a3;
- (void)setLabelFont:(id)a3;
- (void)setPreferredSingleStyle:(int64_t)a3;
- (void)setSuppressesEmptyLabel:(BOOL)a3;
- (void)setSuppressesLabel:(BOOL)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setValueCanWrap:(BOOL)a3;
- (void)setValueFont:(id)a3;
- (void)setValueSignificant:(BOOL)a3;
- (void)setVerticalPadding:(double)a3;
- (void)setViewSubclass:(Class)a3;
@end

@implementation PKPassFieldTemplate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxedPreferredSingleStyle, 0);
  objc_storeStrong((id *)&self->_boxedSuppressesEmptyLabel, 0);
  objc_storeStrong((id *)&self->_boxedValueCanWrap, 0);
  objc_storeStrong((id *)&self->_boxedValueSignificant, 0);
  objc_storeStrong((id *)&self->_boxedLabelCaseStyle, 0);
  objc_storeStrong((id *)&self->_boxedSuppressesLabel, 0);
  objc_storeStrong((id *)&self->_boxedVerticalPadding, 0);
  objc_storeStrong((id *)&self->_boxedTextAlignment, 0);
  objc_storeStrong((id *)&self->_automaticVibrantValueColor, 0);
  objc_storeStrong((id *)&self->_automaticVibrantValueBlendMode, 0);
  objc_storeStrong((id *)&self->_automaticVibrantLabelColor, 0);
  objc_storeStrong((id *)&self->_automaticVibrantLabelBlendMode, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);

  objc_storeStrong((id *)&self->_labelFont, 0);
}

+ (id)_templateByResolvingTemplate:(id)a3 withDefault:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(PKPassFieldTemplate);
  v8 = [v5 boxedTextAlignment];
  if (v8)
  {
    [(PKPassFieldTemplate *)v7 setBoxedTextAlignment:v8];
  }
  else
  {
    v9 = [v6 boxedTextAlignment];
    [(PKPassFieldTemplate *)v7 setBoxedTextAlignment:v9];
  }
  v10 = [v5 boxedVerticalPadding];
  if (v10)
  {
    [(PKPassFieldTemplate *)v7 setBoxedVerticalPadding:v10];
  }
  else
  {
    v11 = [v6 boxedVerticalPadding];
    [(PKPassFieldTemplate *)v7 setBoxedVerticalPadding:v11];
  }
  v12 = [v5 boxedSuppressesLabel];
  if (v12)
  {
    [(PKPassFieldTemplate *)v7 setBoxedSuppressesLabel:v12];
  }
  else
  {
    v13 = [v6 boxedSuppressesLabel];
    [(PKPassFieldTemplate *)v7 setBoxedSuppressesLabel:v13];
  }
  v14 = [v5 boxedSuppressesEmptyLabel];
  if (v14)
  {
    [(PKPassFieldTemplate *)v7 setBoxedSuppressesEmptyLabel:v14];
  }
  else
  {
    v15 = [v6 boxedSuppressesEmptyLabel];
    [(PKPassFieldTemplate *)v7 setBoxedSuppressesEmptyLabel:v15];
  }
  v16 = [v5 boxedLabelCaseStyle];
  if (v16)
  {
    [(PKPassFieldTemplate *)v7 setBoxedLabelCaseStyle:v16];
  }
  else
  {
    v17 = [v6 boxedLabelCaseStyle];
    [(PKPassFieldTemplate *)v7 setBoxedLabelCaseStyle:v17];
  }
  v18 = [v5 boxedValueSignificant];
  if (v18)
  {
    [(PKPassFieldTemplate *)v7 setBoxedValueSignificant:v18];
  }
  else
  {
    v19 = [v6 boxedValueSignificant];
    [(PKPassFieldTemplate *)v7 setBoxedValueSignificant:v19];
  }
  v20 = [v5 boxedValueCanWrap];
  if (v20)
  {
    [(PKPassFieldTemplate *)v7 setBoxedValueCanWrap:v20];
  }
  else
  {
    v21 = [v6 boxedValueCanWrap];
    [(PKPassFieldTemplate *)v7 setBoxedValueCanWrap:v21];
  }
  v22 = [v5 labelFont];
  if (v22)
  {
    [(PKPassFieldTemplate *)v7 setLabelFont:v22];
  }
  else
  {
    v23 = [v6 labelFont];
    [(PKPassFieldTemplate *)v7 setLabelFont:v23];
  }
  v24 = [v5 valueFont];
  if (v24)
  {
    [(PKPassFieldTemplate *)v7 setValueFont:v24];
  }
  else
  {
    v25 = [v6 valueFont];
    [(PKPassFieldTemplate *)v7 setValueFont:v25];
  }
  uint64_t v26 = [v5 viewSubclass];
  if (!v26) {
    uint64_t v26 = [v6 viewSubclass];
  }
  [(PKPassFieldTemplate *)v7 setViewSubclass:v26];
  v27 = [v5 boxedPreferredSingleStyle];
  if (v27)
  {
    [(PKPassFieldTemplate *)v7 setBoxedPreferredSingleStyle:v27];
  }
  else
  {
    v28 = [v6 boxedPreferredSingleStyle];
    [(PKPassFieldTemplate *)v7 setBoxedPreferredSingleStyle:v28];
  }
  v29 = [v5 automaticVibrantLabelBlendMode];
  if (v29)
  {
    [(PKPassFieldTemplate *)v7 setAutomaticVibrantLabelBlendMode:v29];
  }
  else
  {
    v30 = [v6 automaticVibrantLabelBlendMode];
    [(PKPassFieldTemplate *)v7 setAutomaticVibrantLabelBlendMode:v30];
  }
  v31 = [v5 automaticVibrantLabelColor];
  if (v31)
  {
    [(PKPassFieldTemplate *)v7 setAutomaticVibrantLabelColor:v31];
  }
  else
  {
    v32 = [v6 automaticVibrantLabelColor];
    [(PKPassFieldTemplate *)v7 setAutomaticVibrantLabelColor:v32];
  }
  v33 = [v5 automaticVibrantValueBlendMode];
  if (v33)
  {
    [(PKPassFieldTemplate *)v7 setAutomaticVibrantValueBlendMode:v33];
  }
  else
  {
    v34 = [v6 automaticVibrantValueBlendMode];
    [(PKPassFieldTemplate *)v7 setAutomaticVibrantValueBlendMode:v34];
  }
  v35 = [v5 automaticVibrantValueColor];
  if (v35)
  {
    [(PKPassFieldTemplate *)v7 setAutomaticVibrantValueColor:v35];
  }
  else
  {
    v36 = [v6 automaticVibrantValueColor];
    [(PKPassFieldTemplate *)v7 setAutomaticVibrantValueColor:v36];
  }

  return v7;
}

- (void)setValueFont:(id)a3
{
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (NSNumber)boxedTextAlignment
{
  return self->_boxedTextAlignment;
}

- (void)setLabelFont:(id)a3
{
}

- (BOOL)suppressesLabel
{
  v2 = [(PKPassFieldTemplate *)self boxedSuppressesLabel];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)boxedSuppressesLabel
{
  return self->_boxedSuppressesLabel;
}

- (BOOL)valueCanWrap
{
  v2 = [(PKPassFieldTemplate *)self boxedValueCanWrap];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)boxedValueCanWrap
{
  return self->_boxedValueCanWrap;
}

- (Class)viewSubclass
{
  return self->_viewSubclass;
}

- (NSNumber)boxedValueSignificant
{
  return self->_boxedValueSignificant;
}

- (NSString)automaticVibrantValueBlendMode
{
  return self->_automaticVibrantValueBlendMode;
}

- (NSString)automaticVibrantLabelBlendMode
{
  return self->_automaticVibrantLabelBlendMode;
}

- (void)setBoxedSuppressesLabel:(id)a3
{
}

- (NSNumber)boxedSuppressesEmptyLabel
{
  return self->_boxedSuppressesEmptyLabel;
}

- (void)setBoxedValueCanWrap:(id)a3
{
}

- (double)verticalPadding
{
  v2 = [(PKPassFieldTemplate *)self boxedVerticalPadding];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (NSNumber)boxedVerticalPadding
{
  return self->_boxedVerticalPadding;
}

- (NSNumber)boxedPreferredSingleStyle
{
  return self->_boxedPreferredSingleStyle;
}

- (NSNumber)boxedLabelCaseStyle
{
  return self->_boxedLabelCaseStyle;
}

- (UIColor)automaticVibrantValueColor
{
  return self->_automaticVibrantValueColor;
}

- (UIColor)automaticVibrantLabelColor
{
  return self->_automaticVibrantLabelColor;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(PKPassFieldTemplate *)self setBoxedTextAlignment:v4];
}

- (void)setBoxedTextAlignment:(id)a3
{
}

- (void)setBoxedSuppressesEmptyLabel:(id)a3
{
}

- (void)setVerticalPadding:(double)a3
{
  *(float *)&a3 = a3;
  id v4 = [NSNumber numberWithFloat:a3];
  [(PKPassFieldTemplate *)self setBoxedVerticalPadding:v4];
}

- (void)setBoxedVerticalPadding:(id)a3
{
}

- (void)setViewSubclass:(Class)a3
{
  self->_viewSubclass = a3;
}

- (void)setBoxedValueSignificant:(id)a3
{
}

- (void)setBoxedPreferredSingleStyle:(id)a3
{
}

- (void)setBoxedLabelCaseStyle:(id)a3
{
}

- (void)setAutomaticVibrantValueColor:(id)a3
{
}

- (void)setAutomaticVibrantValueBlendMode:(id)a3
{
}

- (void)setAutomaticVibrantLabelColor:(id)a3
{
}

- (void)setAutomaticVibrantLabelBlendMode:(id)a3
{
}

- (void)setValueCanWrap:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(PKPassFieldTemplate *)self setBoxedValueCanWrap:v4];
}

- (void)setSuppressesLabel:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(PKPassFieldTemplate *)self setBoxedSuppressesLabel:v4];
}

- (void)setSuppressesEmptyLabel:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(PKPassFieldTemplate *)self setBoxedSuppressesEmptyLabel:v4];
}

- (int64_t)textAlignment
{
  v2 = [(PKPassFieldTemplate *)self boxedTextAlignment];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)valueSignificant
{
  v2 = [(PKPassFieldTemplate *)self boxedValueSignificant];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (BOOL)suppressesEmptyLabel
{
  v2 = [(PKPassFieldTemplate *)self boxedSuppressesEmptyLabel];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)labelCaseStyle
{
  int64_t result = (int64_t)self->_boxedLabelCaseStyle;
  if (result) {
    return [(id)result integerValue];
  }
  return result;
}

- (int64_t)preferredSingleStyle
{
  int64_t result = (int64_t)self->_boxedPreferredSingleStyle;
  if (result) {
    return [(id)result integerValue];
  }
  return result;
}

+ (PKPassFieldTemplate)fieldTemplateWithTextAlignment:(int64_t)a3
{
  id v4 = objc_alloc_init(PKPassFieldTemplate);
  [(PKPassFieldTemplate *)v4 setTextAlignment:a3];

  return v4;
}

+ (PKPassFieldTemplate)fieldTemplateWithVerticalPadding:(double)a3
{
  id v4 = objc_alloc_init(PKPassFieldTemplate);
  [(PKPassFieldTemplate *)v4 setVerticalPadding:a3];

  return v4;
}

+ (PKPassFieldTemplate)fieldTemplateWithViewSubclass:(Class)a3
{
  id v4 = objc_alloc_init(PKPassFieldTemplate);
  [(PKPassFieldTemplate *)v4 setViewSubclass:a3];

  return v4;
}

- (void)setLabelCaseStyle:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(PKPassFieldTemplate *)self setBoxedLabelCaseStyle:v4];
}

- (void)setValueSignificant:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(PKPassFieldTemplate *)self setBoxedValueSignificant:v4];
}

- (void)setPreferredSingleStyle:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(PKPassFieldTemplate *)self setBoxedPreferredSingleStyle:v4];
}

@end