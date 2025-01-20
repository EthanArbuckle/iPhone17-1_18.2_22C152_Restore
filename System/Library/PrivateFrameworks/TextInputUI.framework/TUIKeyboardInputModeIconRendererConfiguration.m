@interface TUIKeyboardInputModeIconRendererConfiguration
- (CGSize)size;
- (NSString)artwork;
- (NSString)fontFamily;
- (NSString)language;
- (TUIKeyboardInputModeIconRendererConfiguration)init;
- (UIColor)backgroundColor;
- (UIColor)tintColor;
- (double)backgroundCornerRadius;
- (double)baseFontSize;
- (double)detailLabelAlpha;
- (int64_t)style;
- (void)setArtwork:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundCornerRadius:(double)a3;
- (void)setBaseFontSize:(double)a3;
- (void)setDetailLabelAlpha:(double)a3;
- (void)setFontFamily:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTintColor:(id)a3;
@end

@implementation TUIKeyboardInputModeIconRendererConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_fontFamily, 0);
}

- (void)setArtwork:(id)a3
{
}

- (NSString)artwork
{
  return self->_artwork;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setDetailLabelAlpha:(double)a3
{
  self->_detailLabelAlpha = a3;
}

- (double)detailLabelAlpha
{
  return self->_detailLabelAlpha;
}

- (void)setTintColor:(id)a3
{
}

- (void)setBackgroundCornerRadius:(double)a3
{
  self->_backgroundCornerRadius = a3;
}

- (double)backgroundCornerRadius
{
  return self->_backgroundCornerRadius;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setFontFamily:(id)a3
{
}

- (NSString)fontFamily
{
  return self->_fontFamily;
}

- (void)setBaseFontSize:(double)a3
{
  self->_baseFontSize = a3;
}

- (double)baseFontSize
{
  return self->_baseFontSize;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIColor)tintColor
{
  tintColor = self->_tintColor;
  if (!tintColor)
  {
    v4 = [MEMORY[0x1E4FB1618] labelColor];
    v5 = self->_tintColor;
    self->_tintColor = v4;

    tintColor = self->_tintColor;
  }
  return tintColor;
}

- (UIColor)backgroundColor
{
  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
  {
    v4 = [MEMORY[0x1E4FB1618] blackColor];
    v5 = self->_backgroundColor;
    self->_backgroundColor = v4;

    backgroundColor = self->_backgroundColor;
  }
  return backgroundColor;
}

- (TUIKeyboardInputModeIconRendererConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUIKeyboardInputModeIconRendererConfiguration;
  v2 = [(TUIKeyboardInputModeIconRendererConfiguration *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(TUIKeyboardInputModeIconRendererConfiguration *)v2 setBaseFontSize:1.0];
    [(TUIKeyboardInputModeIconRendererConfiguration *)v3 setDetailLabelAlpha:0.8];
    [(TUIKeyboardInputModeIconRendererConfiguration *)v3 setBackgroundCornerRadius:4.0];
  }
  return v3;
}

@end