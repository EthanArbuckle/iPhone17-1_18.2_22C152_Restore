@interface UIWebPDFLabelView
- (BOOL)isTimerInstalled;
- (UIWebPDFLabelView)initWithFrame:(CGRect)a3;
- (double)_fadeOutDelay;
- (double)_fadeOutDuration;
- (unint64_t)currentPageIndex;
- (void)_fadeOutAnimationDidStop;
- (void)_makeRoundedCorners;
- (void)clearTimer;
- (void)dealloc;
- (void)fadeOut;
- (void)setCurrentPageIndex:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)showNowInSuperView:(id)a3 atOrigin:(CGPoint)a4 withText:(id)a5 animated:(BOOL)a6;
- (void)sizeToFit;
@end

@implementation UIWebPDFLabelView

- (UIWebPDFLabelView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIWebPDFLabelView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CALayer *)[(UIView *)v3 layer] setAllowsGroupOpacity:0];
    [(CALayer *)[(UIView *)v4 layer] setAllowsGroupBlending:0];
    v5 = [[_UIBackdropView alloc] initWithPrivateStyle:2020];
    v4->_backdropView = v5;
    [(UIView *)v4 addSubview:v5];
    [(UIWebPDFLabelView *)v4 _makeRoundedCorners];
    v6 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    v4->_label = v6;
    [(UIView *)v6 setOpaque:0];
    [(UIView *)v4->_label setBackgroundColor:0];
    [(UILabel *)v4->_label setTextAlignment:1];
    -[UILabel setFont:](v4->_label, "setFont:", [off_1E52D39B8 boldSystemFontOfSize:16.0]);
    [(UILabel *)v4->_label setTextColor:+[UIColor blackColor]];
    [(UIView *)v4->_label setAlpha:0.4];
    v7 = [(UIView *)v4->_label layer];
    -[CALayer setCompositingFilter:](v7, "setCompositingFilter:", [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]]);
    [(UIView *)v4 addSubview:v4->_label];
  }
  return v4;
}

- (void)clearTimer
{
  self->_timer = 0;
}

- (void)dealloc
{
  [(UIWebPDFLabelView *)self clearTimer];

  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFLabelView;
  [(UIView *)&v3 dealloc];
}

- (void)sizeToFit
{
  [(UIView *)self->_label sizeToFit];
  [(UIView *)self->_label frame];
  double v4 = v3 + 20.0;
  double v6 = v5 + 12.0;
  -[UIView setSize:](self->_backdropView, "setSize:", v3 + 20.0, v5 + 12.0);
  -[UIView setSize:](self->_label, "setSize:", v4, v6);
  -[UIView setSize:](self, "setSize:", v4, v6);
}

- (void)setText:(id)a3
{
  [(UILabel *)self->_label setText:a3];
  [(UIWebPDFLabelView *)self sizeToFit];
}

- (BOOL)isTimerInstalled
{
  return self->_timer != 0;
}

- (double)_fadeOutDelay
{
  return 2.0;
}

- (double)_fadeOutDuration
{
  return 0.5;
}

- (void)showNowInSuperView:(id)a3 atOrigin:(CGPoint)a4 withText:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a4.y;
  double x = a4.x;
  [(UIView *)self setAlpha:1.0];
  if (a5) {
    [(UIWebPDFLabelView *)self setText:a5];
  }
  if ([(UIView *)self superview] == a3) {
    [a3 bringSubviewToFront:self];
  }
  else {
    [a3 addSubview:self];
  }
  v13[1] = 3221225472;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[2] = __67__UIWebPDFLabelView_showNowInSuperView_atOrigin_withText_animated___block_invoke_2;
  v13[3] = &unk_1E5310EE0;
  v13[4] = self;
  *(double *)&v13[5] = x + 20.0;
  *(double *)&v13[6] = y + 20.0;
  +[UIView conditionallyAnimate:v6 withAnimation:&__block_literal_global_683 layout:v13 completion:0];
  [(UIWebPDFLabelView *)self _fadeOutDelay];
  timer = self->_timer;
  if (timer) {
    -[NSTimer setFireDate:](timer, "setFireDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:"));
  }
  else {
    self->_timer = (NSTimer *)(id)objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_fadeOut, 0, 1);
  }
}

uint64_t __67__UIWebPDFLabelView_showNowInSuperView_atOrigin_withText_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:0 delay:a2 options:a3 animations:0.3 completion:0.0];
}

uint64_t __67__UIWebPDFLabelView_showNowInSuperView_atOrigin_withText_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrameOrigin:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_fadeOutAnimationDidStop
{
  [(UIView *)self removeFromSuperview];
}

- (void)fadeOut
{
  if ([(UIWebPDFLabelView *)self isTimerInstalled])
  {
    double v3 = self;
    [(UIWebPDFLabelView *)self clearTimer];
    [(UIWebPDFLabelView *)self _fadeOutDuration];
    v4[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __28__UIWebPDFLabelView_fadeOut__block_invoke;
    v5[3] = &unk_1E52DC580;
    v5[4] = self;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __28__UIWebPDFLabelView_fadeOut__block_invoke_2;
    v4[3] = &unk_1E530D518;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v5, v4);
  }
}

uint64_t __28__UIWebPDFLabelView_fadeOut__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __28__UIWebPDFLabelView_fadeOut__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fadeOutAnimationDidStop];
}

- (void)_makeRoundedCorners
{
  [+[UIScreen mainScreen] scale];
  _UIGraphicsBeginImageContextWithOptions(0, 0, 16.0, 16.0, v3);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v5 = 0;
  }
  else {
    double v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v5);
  v10.origin.double x = 0.0;
  v10.origin.double y = 0.0;
  v10.size.width = 16.0;
  v10.size.height = 16.0;
  CGContextAddRect(v5, v10);
  CGContextAddPath(v5, [+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, 0.0, 0.0, 16.0, 16.0, 7.0, 7.0) CGPath]);
  CGContextEOClip(v5);
  UIRectFillUsingOperation(1, 0.0, 0.0, 16.0, 16.0);
  CGContextRestoreGState(v5);
  id ImageFromCurrentImageContext = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();
  v7 = [(_UIBackdropView *)self->_backdropView contentView];
  v8 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", objc_msgSend(ImageFromCurrentImageContext, "resizableImageWithCapInsets:", 7.0, 7.0, 7.0, 7.0));
  [(UIView *)v8 setAlpha:0.0];
  [(UIView *)v8 _setBackdropMaskViewFlags:7];
  [(UIView *)v8 setAutoresizingMask:18];
  [(UIView *)v7 bounds];
  -[UIImageView setFrame:](v8, "setFrame:");
  [(UIView *)v7 addSubview:v8];
}

- (unint64_t)currentPageIndex
{
  return self->currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->currentPageIndedouble x = a3;
}

@end