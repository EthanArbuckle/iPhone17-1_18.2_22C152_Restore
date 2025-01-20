@interface _TUIElementTextStyleObject
- ($0F674443F67B1BBEFA3E91226872A32D)styleRef;
- (TUIFontSpec)fontSpec;
- (UIColor)color;
- (unint64_t)style;
- (void)setColor:(id)a3;
- (void)setFontSpec:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setStyleRef:(id)a3;
@end

@implementation _TUIElementTextStyleObject

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- ($0F674443F67B1BBEFA3E91226872A32D)styleRef
{
  return ($0F674443F67B1BBEFA3E91226872A32D)self->_styleRef;
}

- (void)setStyleRef:(id)a3
{
  self->_styleRef = ($36225AD0C84429F3A125462FE9B8891F)a3;
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_fontSpec, 0);
}

@end