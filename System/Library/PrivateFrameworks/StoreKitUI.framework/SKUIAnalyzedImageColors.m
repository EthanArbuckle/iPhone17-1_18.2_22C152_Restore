@interface SKUIAnalyzedImageColors
- (BOOL)isBackgroundLight;
- (UIColor)backgroundColor;
- (UIColor)textPrimaryColor;
- (UIColor)textSecondaryColor;
- (void)setBackgroundColor:(id)a3;
- (void)setIsBackgroundLight:(BOOL)a3;
- (void)setTextPrimaryColor:(id)a3;
- (void)setTextSecondaryColor:(id)a3;
@end

@implementation SKUIAnalyzedImageColors

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)textPrimaryColor
{
  return self->_textPrimaryColor;
}

- (void)setTextPrimaryColor:(id)a3
{
}

- (UIColor)textSecondaryColor
{
  return self->_textSecondaryColor;
}

- (void)setTextSecondaryColor:(id)a3
{
}

- (BOOL)isBackgroundLight
{
  return self->_isBackgroundLight;
}

- (void)setIsBackgroundLight:(BOOL)a3
{
  self->_isBackgroundLight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSecondaryColor, 0);
  objc_storeStrong((id *)&self->_textPrimaryColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end