@interface _UIImageViewUncommonProperties
- (UIImageSymbolConfiguration)overridingSymbolConfiguration;
- (_UIImageCIImageRenderer)CIRenderer;
- (_UIImageSymbolVariant)preferredSymbolVariant;
- (int64_t)defaultRenderingMode;
- (unsigned)drawMode;
- (void)setCIRenderer:(id)a3;
- (void)setDefaultRenderingMode:(int64_t)a3;
- (void)setDrawMode:(unsigned int)a3;
- (void)setOverridingSymbolConfiguration:(id)a3;
- (void)setPreferredSymbolVariant:(id)a3;
@end

@implementation _UIImageViewUncommonProperties

- (_UIImageSymbolVariant)preferredSymbolVariant
{
  return self->_preferredSymbolVariant;
}

- (unsigned)drawMode
{
  return self->_drawMode;
}

- (_UIImageCIImageRenderer)CIRenderer
{
  return self->_CIRenderer;
}

- (void)setDrawMode:(unsigned int)a3
{
  self->_drawMode = a3;
}

- (int64_t)defaultRenderingMode
{
  return self->_defaultRenderingMode;
}

- (void)setDefaultRenderingMode:(int64_t)a3
{
  self->_defaultRenderingMode = a3;
}

- (UIImageSymbolConfiguration)overridingSymbolConfiguration
{
  return self->_overridingSymbolConfiguration;
}

- (void)setOverridingSymbolConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CIRenderer, 0);
  objc_storeStrong((id *)&self->_preferredSymbolVariant, 0);
  objc_storeStrong((id *)&self->_overridingSymbolConfiguration, 0);
}

- (void)setPreferredSymbolVariant:(id)a3
{
}

- (void)setCIRenderer:(id)a3
{
}

@end