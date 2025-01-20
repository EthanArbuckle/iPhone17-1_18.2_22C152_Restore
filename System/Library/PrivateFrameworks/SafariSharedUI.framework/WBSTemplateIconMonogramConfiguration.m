@interface WBSTemplateIconMonogramConfiguration
+ (WBSTemplateIconMonogramConfiguration)configurationWithBackgroundColor:(id)a3;
+ (WBSTemplateIconMonogramConfiguration)configurationWithIconSize:(CGSize)a3 fontSize:(double)a4 fontWeight:(int64_t)a5 fontDesign:(int64_t)a6 baselineOffset:(double)a7 backgroundColor:(id)a8 cornerRadius:(double)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)skipMonogramGeneration;
- (CGSize)iconSize;
- (UIColor)backgroundColor;
- (UIColor)foregroundColor;
- (double)baselineOffset;
- (double)cornerRadius;
- (double)fontSize;
- (int64_t)fontDesign;
- (int64_t)fontWeight;
- (unint64_t)hash;
- (void)setBackgroundColor:(id)a3;
- (void)setBaselineOffset:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFontDesign:(int64_t)a3;
- (void)setFontSize:(double)a3;
- (void)setFontWeight:(int64_t)a3;
- (void)setForegroundColor:(id)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setSkipMonogramGeneration:(BOOL)a3;
@end

@implementation WBSTemplateIconMonogramConfiguration

+ (WBSTemplateIconMonogramConfiguration)configurationWithIconSize:(CGSize)a3 fontSize:(double)a4 fontWeight:(int64_t)a5 fontDesign:(int64_t)a6 baselineOffset:(double)a7 backgroundColor:(id)a8 cornerRadius:(double)a9
{
  double height = a3.height;
  double width = a3.width;
  id v16 = a8;
  v17 = objc_alloc_init(WBSTemplateIconMonogramConfiguration);
  -[WBSTemplateIconMonogramConfiguration setIconSize:](v17, "setIconSize:", width, height);
  [(WBSTemplateIconMonogramConfiguration *)v17 setFontSize:a4];
  [(WBSTemplateIconMonogramConfiguration *)v17 setFontWeight:a5];
  [(WBSTemplateIconMonogramConfiguration *)v17 setFontDesign:a6];
  [(WBSTemplateIconMonogramConfiguration *)v17 setBaselineOffset:a7];
  [(WBSTemplateIconMonogramConfiguration *)v17 setBackgroundColor:v16];
  [(WBSTemplateIconMonogramConfiguration *)v17 setCornerRadius:a9];

  return v17;
}

+ (WBSTemplateIconMonogramConfiguration)configurationWithBackgroundColor:(id)a3
{
  v3 = objc_msgSend(a1, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", 1, 0, a3, 16.0, 16.0, 11.0, 4.0, 4.0);
  return (WBSTemplateIconMonogramConfiguration *)v3;
}

- (unint64_t)hash
{
  uint64_t v3 = 0;
  unint64_t result = self->_skipMonogramGeneration;
  do
    unint64_t result = *((char *)&self->_iconSize.width + v3++) | (result << 8);
  while (v3 != 16);
  uint64_t v5 = 0;
  do
    unint64_t result = *((char *)&self->_fontSize + v5++) | (result << 8);
  while (v5 != 8);
  uint64_t v6 = 0;
  do
    unint64_t result = *((char *)&self->_fontWeight + v6++) | (result << 8);
  while (v6 != 8);
  uint64_t v7 = 0;
  do
    unint64_t result = *((char *)&self->_baselineOffset + v7++) | (result << 8);
  while (v7 != 8);
  uint64_t v8 = 0;
  p_cornerRadius = &self->_cornerRadius;
  do
    unint64_t result = *((char *)p_cornerRadius + v8++) | (result << 8);
  while (v8 != 8);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSTemplateIconMonogramConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = [(WBSTemplateIconMonogramConfiguration *)self skipMonogramGeneration];
      if (v6 != [(WBSTemplateIconMonogramConfiguration *)v5 skipMonogramGeneration]) {
        goto LABEL_13;
      }
      [(WBSTemplateIconMonogramConfiguration *)self iconSize];
      double v8 = v7;
      double v10 = v9;
      [(WBSTemplateIconMonogramConfiguration *)v5 iconSize];
      BOOL v12 = 0;
      if (v8 != v13 || v10 != v11) {
        goto LABEL_14;
      }
      [(WBSTemplateIconMonogramConfiguration *)self fontSize];
      double v15 = v14;
      [(WBSTemplateIconMonogramConfiguration *)v5 fontSize];
      if (v15 != v16) {
        goto LABEL_13;
      }
      int64_t v17 = [(WBSTemplateIconMonogramConfiguration *)self fontWeight];
      if (v17 != [(WBSTemplateIconMonogramConfiguration *)v5 fontWeight]) {
        goto LABEL_13;
      }
      [(WBSTemplateIconMonogramConfiguration *)self baselineOffset];
      double v19 = v18;
      [(WBSTemplateIconMonogramConfiguration *)v5 baselineOffset];
      if (v19 != v20) {
        goto LABEL_13;
      }
      v21 = [(WBSTemplateIconMonogramConfiguration *)self backgroundColor];
      v22 = [(WBSTemplateIconMonogramConfiguration *)v5 backgroundColor];
      char v23 = [v21 isEqual:v22];

      if (v23)
      {
        [(WBSTemplateIconMonogramConfiguration *)self cornerRadius];
        double v25 = v24;
        [(WBSTemplateIconMonogramConfiguration *)v5 cornerRadius];
        BOOL v12 = v25 == v26;
      }
      else
      {
LABEL_13:
        BOOL v12 = 0;
      }
LABEL_14:

      goto LABEL_15;
    }
    BOOL v12 = 0;
  }
LABEL_15:

  return v12;
}

- (BOOL)skipMonogramGeneration
{
  return self->_skipMonogramGeneration;
}

- (void)setSkipMonogramGeneration:(BOOL)a3
{
  self->_skipMonogramGeneration = a3;
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (int64_t)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(int64_t)a3
{
  self->_fontWeight = a3;
}

- (int64_t)fontDesign
{
  return self->_fontDesign;
}

- (void)setFontDesign:(int64_t)a3
{
  self->_fontDesign = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end