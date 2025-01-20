@interface UISoftwareDimmingWindow
- (BOOL)_ignoresHitTest;
- (UISoftwareDimmingWindow)initWithFrame:(CGRect)a3;
- (float)overlayLevel;
- (id)_roleHint;
- (void)setOverlayLevel:(float)a3;
- (void)updateOverlayColor;
@end

@implementation UISoftwareDimmingWindow

- (UISoftwareDimmingWindow)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISoftwareDimmingWindow;
  v3 = -[UIWindow initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIWindow *)v3 setWindowLevel:2150.0];
    [(UIView *)v4 setAlpha:0.0];
    [(UIView *)v4 setUserInteractionEnabled:0];
    [(UISoftwareDimmingWindow *)v4 updateOverlayColor];
  }
  return v4;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (void)updateOverlayColor
{
  int v3 = _AXSInvertColorsEnabled();
  double v4 = 1.0;
  if (!v3) {
    double v4 = 0.0;
  }
  id v5 = +[UIColor colorWithWhite:v4 alpha:1.0];
  [(UIView *)self setBackgroundColor:v5];
}

- (void)setOverlayLevel:(float)a3
{
  double v6 = a3;
  if (a3 < -1.0 || a3 >= 0.0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIScreen.m", 280, @"%f is not a valid overlay level value", *(void *)&v6);
  }
  self->_overlayLevel = a3;
  [(UIView *)self setAlpha:-v6];
}

- (id)_roleHint
{
  return @"_UIWindowRoleHintSoftwareDimming";
}

- (float)overlayLevel
{
  return self->_overlayLevel;
}

@end