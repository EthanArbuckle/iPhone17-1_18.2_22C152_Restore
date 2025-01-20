@interface THiOSThemeProvider
- (BOOL)forceThemeColors;
- (BOOL)shouldInvertContent;
- (CGColor)backgroundColor;
- (CGColor)textColor;
- (NSString)themeIdentifier;
- (UIColor)uiBackgroundColor;
- (UIColor)uiTextColor;
- (int)annotationBlendMode;
- (int64_t)annotationPageTheme;
- (int64_t)userInterfaceStyle;
- (void)dealloc;
- (void)setAnnotationBlendMode:(int)a3;
- (void)setAnnotationPageTheme:(int64_t)a3;
- (void)setForceThemeColors:(BOOL)a3;
- (void)setShouldInvertContent:(BOOL)a3;
- (void)setThemeIdentifier:(id)a3;
- (void)setUiBackgroundColor:(id)a3;
- (void)setUiTextColor:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)updateWithTheme:(id)a3 traitCollection:(id)a4;
@end

@implementation THiOSThemeProvider

- (void)updateWithTheme:(id)a3 traitCollection:(id)a4
{
  -[THiOSThemeProvider setThemeIdentifier:](self, "setThemeIdentifier:", [a3 themeIdentifier]);
  id v7 = [a3 themeIdentifier];
  if ([v7 isEqualToString:kIMThemeIdentifierGrayPageTheme])
  {
    id v8 = &dword_0 + 1;
  }
  else
  {
    id v9 = [a3 themeIdentifier];
    id v8 = [v9 isEqualToString:kIMThemeIdentifierNightPageTheme];
  }
  [(THiOSThemeProvider *)self setForceThemeColors:v8];
  -[THiOSThemeProvider setShouldInvertContent:](self, "setShouldInvertContent:", [a3 shouldInvertContent]);
  -[THiOSThemeProvider setUiBackgroundColor:](self, "setUiBackgroundColor:", [a3 backgroundColorForTraitCollection:a4]);
  -[THiOSThemeProvider setUiTextColor:](self, "setUiTextColor:", objc_msgSend(objc_msgSend(a3, "contentTextColor"), "resolvedColorWithTraitCollection:", a4));
  -[THiOSThemeProvider setAnnotationPageTheme:](self, "setAnnotationPageTheme:", [a3 annotationPageTheme]);
  -[THiOSThemeProvider setAnnotationBlendMode:](self, "setAnnotationBlendMode:", [a3 annotationBlendMode]);
  id v10 = [a3 userInterfaceStyle];

  [(THiOSThemeProvider *)self setUserInterfaceStyle:v10];
}

- (void)dealloc
{
  self->_themeIdentifier = 0;
  self->_uiBackgroundColor = 0;

  self->_uiTextColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)THiOSThemeProvider;
  [(THThemeProvider *)&v3 dealloc];
}

- (CGColor)backgroundColor
{
  v2 = [(THiOSThemeProvider *)self uiBackgroundColor];

  return [(UIColor *)v2 CGColor];
}

- (CGColor)textColor
{
  v2 = [(THiOSThemeProvider *)self uiTextColor];

  return [(UIColor *)v2 CGColor];
}

- (NSString)themeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setThemeIdentifier:(id)a3
{
}

- (BOOL)forceThemeColors
{
  return self->_forceThemeColors;
}

- (void)setForceThemeColors:(BOOL)a3
{
  self->_forceThemeColors = a3;
}

- (BOOL)shouldInvertContent
{
  return self->_shouldInvertContent;
}

- (void)setShouldInvertContent:(BOOL)a3
{
  self->_shouldInvertContent = a3;
}

- (UIColor)uiBackgroundColor
{
  return (UIColor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUiBackgroundColor:(id)a3
{
}

- (UIColor)uiTextColor
{
  return (UIColor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUiTextColor:(id)a3
{
}

- (int64_t)annotationPageTheme
{
  return self->_annotationPageTheme;
}

- (void)setAnnotationPageTheme:(int64_t)a3
{
  self->_annotationPageTheme = a3;
}

- (int)annotationBlendMode
{
  return self->_annotationBlendMode;
}

- (void)setAnnotationBlendMode:(int)a3
{
  self->_annotationBlendMode = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

@end