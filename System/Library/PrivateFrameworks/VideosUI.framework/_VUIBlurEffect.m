@interface _VUIBlurEffect
- (BOOL)isProgressBar;
- (id)effectSettings;
- (void)setIsProgressBar:(BOOL)a3;
@end

@implementation _VUIBlurEffect

- (id)effectSettings
{
  v8.receiver = self;
  v8.super_class = (Class)_VUIBlurEffect;
  v3 = [(UIBlurEffect *)&v8 effectSettings];
  if (self->_isProgressBar)
  {
    v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    [v3 setColorTint:v4];

    double v5 = 10.0;
    double v6 = 0.7;
  }
  else
  {
    double v5 = 5.0;
    double v6 = 0.94;
  }
  [v3 setSaturationDeltaFactor:v6];
  [v3 setBlurRadius:v5];
  return v3;
}

- (BOOL)isProgressBar
{
  return self->_isProgressBar;
}

- (void)setIsProgressBar:(BOOL)a3
{
  self->_isProgressBar = a3;
}

@end