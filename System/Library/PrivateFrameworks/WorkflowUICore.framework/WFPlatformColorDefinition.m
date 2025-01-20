@interface WFPlatformColorDefinition
- (BOOL)isDarkMode;
- (BOOL)isHighContrast;
- (WFPlatformColorDefinition)initWithDarkMode:(BOOL)a3 highContrast:(BOOL)a4 red:(double)a5 green:(double)a6 blue:(double)a7 alpha:(double)a8;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
@end

@implementation WFPlatformColorDefinition

- (double)alpha
{
  return self->_alpha;
}

- (double)blue
{
  return self->_blue;
}

- (double)green
{
  return self->_green;
}

- (double)red
{
  return self->_red;
}

- (BOOL)isHighContrast
{
  return self->_isHighContrast;
}

- (BOOL)isDarkMode
{
  return self->_isDarkMode;
}

- (WFPlatformColorDefinition)initWithDarkMode:(BOOL)a3 highContrast:(BOOL)a4 red:(double)a5 green:(double)a6 blue:(double)a7 alpha:(double)a8
{
  v18.receiver = self;
  v18.super_class = (Class)WFPlatformColorDefinition;
  v14 = [(WFPlatformColorDefinition *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_isDarkMode = a3;
    v14->_isHighContrast = a4;
    v14->_red = a5;
    v14->_green = a6;
    v14->_blue = a7;
    v14->_alpha = a8;
    v16 = v14;
  }

  return v15;
}

@end