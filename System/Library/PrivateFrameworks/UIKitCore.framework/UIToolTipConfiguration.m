@interface UIToolTipConfiguration
+ (UIToolTipConfiguration)configurationWithToolTip:(NSString *)toolTip;
+ (UIToolTipConfiguration)configurationWithToolTip:(NSString *)toolTip inRect:(CGRect)sourceRect;
- (CGRect)sourceRect;
- (NSString)toolTip;
- (void)setSourceRect:(CGRect)a3;
- (void)setToolTip:(id)a3;
@end

@implementation UIToolTipConfiguration

+ (UIToolTipConfiguration)configurationWithToolTip:(NSString *)toolTip
{
  return +[UIToolTipConfiguration configurationWithToolTip:inRect:](UIToolTipConfiguration, "configurationWithToolTip:inRect:", toolTip, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

+ (UIToolTipConfiguration)configurationWithToolTip:(NSString *)toolTip inRect:(CGRect)sourceRect
{
  double height = sourceRect.size.height;
  double width = sourceRect.size.width;
  double y = sourceRect.origin.y;
  double x = sourceRect.origin.x;
  v8 = toolTip;
  v9 = objc_opt_new();
  [v9 setToolTip:v8];

  objc_msgSend(v9, "setSourceRect:", x, y, width, height);
  return (UIToolTipConfiguration *)v9;
}

- (NSString)toolTip
{
  return self->_toolTip;
}

- (void)setToolTip:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (void).cxx_destruct
{
}

@end