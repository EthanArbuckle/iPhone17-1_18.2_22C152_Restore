@interface THThemeProvider
- (BOOL)forceThemeColors;
- (BOOL)shouldInvertContent;
- (CGColor)backgroundColor;
- (CGColor)textColor;
- (THThemeProvider)init;
- (int)annotationBlendMode;
- (int64_t)annotationPageTheme;
- (void)dealloc;
@end

@implementation THThemeProvider

- (THThemeProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)THThemeProvider;
  v2 = [(THThemeProvider *)&v5 init];
  if (v2)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_344B60;
    long long v9 = unk_344B70;
    v2->_backgroundColor = CGColorCreate(DeviceRGB, components);
    *(_OWORD *)v6 = xmmword_344B80;
    long long v7 = unk_344B90;
    v2->_textColor = CGColorCreate(DeviceRGB, v6);
    CGColorSpaceRelease(DeviceRGB);
  }
  return v2;
}

- (void)dealloc
{
  CGColorRelease(self->_backgroundColor);
  CGColorRelease(self->_textColor);
  v3.receiver = self;
  v3.super_class = (Class)THThemeProvider;
  [(THThemeProvider *)&v3 dealloc];
}

- (BOOL)forceThemeColors
{
  return 0;
}

- (BOOL)shouldInvertContent
{
  return 0;
}

- (CGColor)textColor
{
  return self->_textColor;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)annotationPageTheme
{
  return 4;
}

- (int)annotationBlendMode
{
  return 0;
}

@end