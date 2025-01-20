@interface _PXVisualDiagnosticsDrawTextConfiguration
- (CGPoint)relativePosition;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIColor)backgroundColor;
- (UIColor)textColor;
- (UIFont)font;
- (_PXVisualDiagnosticsDrawTextConfiguration)init;
- (double)fontSize;
- (void)setAttributedText:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setRelativePosition:(CGPoint)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation _PXVisualDiagnosticsDrawTextConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setRelativePosition:(CGPoint)a3
{
  self->_relativePosition = a3;
}

- (CGPoint)relativePosition
{
  double x = self->_relativePosition.x;
  double y = self->_relativePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setFont:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setAttributedText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (_PXVisualDiagnosticsDrawTextConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)_PXVisualDiagnosticsDrawTextConfiguration;
  CGPoint result = [(_PXVisualDiagnosticsDrawTextConfiguration *)&v3 init];
  if (result) {
    result->_relativePosition = (CGPoint)*MEMORY[0x263F00148];
  }
  return result;
}

@end