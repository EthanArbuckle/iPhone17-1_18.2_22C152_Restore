@interface PLProgressView
- (BOOL)showsCancelButton;
- (PLProgressView)initWithFrame:(CGRect)a3;
- (UIView)backgroundTintedView;
- (UIView)backgroundView;
- (_UIBackdropView)backgroundBlurredView;
- (float)percentComplete;
- (id)cancelationHandler;
- (int64_t)backgroundType;
- (void)_cancel:(id)a3;
- (void)_installBackgroundBlurredView;
- (void)_installBackgroundTintedView;
- (void)_installBackgroundView;
- (void)_removeBackgroundBlurredView;
- (void)_removeBackgroundTintedView;
- (void)_syncToBackgroundType;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundBlurredView:(id)a3;
- (void)setBackgroundTintedView:(id)a3;
- (void)setBackgroundType:(int64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCancelationHandler:(id)a3;
- (void)setLabelText:(id)a3;
- (void)setPercentComplete:(float)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)updateUIForPublishingAgent:(id)a3;
@end

@implementation PLProgressView

- (void)setCancelationHandler:(id)a3
{
}

- (id)cancelationHandler
{
  return self->_cancelationHandler;
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (void)setBackgroundBlurredView:(id)a3
{
}

- (_UIBackdropView)backgroundBlurredView
{
  return self->_backgroundBlurredView;
}

- (void)setBackgroundTintedView:(id)a3
{
}

- (UIView)backgroundTintedView
{
  return self->_backgroundTintedView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (void)setShowsCancelButton:(BOOL)a3
{
  if (self->_showsCancelButton != a3)
  {
    self->_showsCancelButton = a3;
    if (a3)
    {
      cancelButton = self->_cancelButton;
      if (!cancelButton)
      {
        v5 = (UIButton *)[MEMORY[0x1E4F427E0] buttonWithType:122];
        self->_cancelButton = v5;
        [(UIButton *)v5 setExclusiveTouch:1];
        [(UIButton *)self->_cancelButton addTarget:self action:sel__cancel_ forControlEvents:64];
        [(UIButton *)self->_cancelButton sizeToFit];
        cancelButton = self->_cancelButton;
      }
      [(PLProgressView *)self addSubview:cancelButton];
      BOOL v6 = !self->_showsCancelButton;
    }
    else
    {
      BOOL v6 = 1;
    }
    [(UIButton *)self->_cancelButton setHidden:v6];
    [(UIButton *)self->_cancelButton setEnabled:1];
    [(PLProgressView *)self setNeedsLayout];
  }
}

- (void)_cancel:(id)a3
{
  [(UIButton *)self->_cancelButton setEnabled:0];
  cancelationHandler = (void (**)(void))self->_cancelationHandler;
  if (cancelationHandler)
  {
    cancelationHandler[2]();
    [(PLProgressView *)self setCancelationHandler:0];
  }
}

- (float)percentComplete
{
  progressView = self->_progressView;
  if (!progressView) {
    return 0.0;
  }
  [(UIProgressView *)progressView progress];
  return result;
}

- (void)setPercentComplete:(float)a3
{
}

- (void)setLabelText:(id)a3
{
  labelView = self->_labelView;
  if (!labelView)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F42B38]);
    v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    self->_labelView = v7;
    [(UILabel *)v7 setAutoresizingMask:2];
    -[UILabel setFont:](self->_labelView, "setFont:", [MEMORY[0x1E4F42A30] systemFontOfSize:12.0]);
    -[UILabel setBackgroundColor:](self->_labelView, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
    -[UILabel setTextColor:](self->_labelView, "setTextColor:", [MEMORY[0x1E4F428B8] blackColor]);
    [(UILabel *)self->_labelView setTextAlignment:1];
    [(PLProgressView *)self addSubview:self->_labelView];
    labelView = self->_labelView;
  }
  [(UILabel *)labelView setText:a3];
  [(PLProgressView *)self setNeedsLayout];
}

- (void)updateUIForPublishingAgent:(id)a3
{
  if ([a3 isRemaking])
  {
    [a3 remakingPercentComplete];
    -[PLProgressView setPercentComplete:](self, "setPercentComplete:");
    if ((*((unsigned char *)self + 440) & 2) == 0)
    {
      -[PLProgressView setLabelText:](self, "setLabelText:", [a3 progressViewMessageDuringRemake]);
      *((unsigned char *)self + 440) |= 2u;
    }
  }
  else
  {
    [a3 snapshot];
    [a3 estimatedTimeRemaining];
    double v6 = v5;
    [a3 percentComplete];
    int v8 = v7;
    [(PLProgressView *)self setNeedsLayout];
    LODWORD(v9) = v8;
    [(PLProgressView *)self setPercentComplete:v9];
    if (v6 <= 0.0)
    {
      PLLocalizedFrameworkString();
      labelView = self->_labelView;
      [a3 serviceName];
      uint64_t v13 = PFStringWithValidatedFormat();
      v14 = labelView;
    }
    else
    {
      if (v6 <= 1.0)
      {
        PLLocalizedFrameworkString();
      }
      else
      {
        timeRemainingFormatter = self->_timeRemainingFormatter;
        if (!timeRemainingFormatter)
        {
          v11 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
          self->_timeRemainingFormatter = v11;
          [(NSDateComponentsFormatter *)v11 setUnitsStyle:3];
          [(NSDateComponentsFormatter *)self->_timeRemainingFormatter setIncludesApproximationPhrase:1];
          [(NSDateComponentsFormatter *)self->_timeRemainingFormatter setIncludesTimeRemainingPhrase:1];
          [(NSDateComponentsFormatter *)self->_timeRemainingFormatter setAllowedUnits:64];
          timeRemainingFormatter = self->_timeRemainingFormatter;
        }
        [(NSDateComponentsFormatter *)timeRemainingFormatter stringFromTimeInterval:v6];
      }
      PLLocalizedFrameworkString();
      [a3 serviceName];
      uint64_t v13 = PFStringWithValidatedFormat();
      v14 = self->_labelView;
    }
    [(UILabel *)v14 setText:v13];
  }
}

- (void)_removeBackgroundTintedView
{
  if ([(PLProgressView *)self backgroundTintedView])
  {
    [(UIView *)[(PLProgressView *)self backgroundTintedView] removeFromSuperview];
    [(PLProgressView *)self setBackgroundTintedView:0];
  }
}

- (void)_installBackgroundTintedView
{
  if (![(PLProgressView *)self backgroundTintedView])
  {
    v3 = [(PLProgressView *)self backgroundView];
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(UIView *)v3 bounds];
    id v5 = (id)objc_msgSend(v4, "initWithFrame:");
    [(PLProgressView *)self setBackgroundTintedView:v5];
    [v5 setOpaque:0];
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", 0.101960786, 0.75));
    [(UIView *)v3 addSubview:v5];
    [(UIView *)v3 sendSubviewToBack:v5];
    [v5 setAutoresizingMask:18];
  }
}

- (void)_removeBackgroundBlurredView
{
  if ([(PLProgressView *)self backgroundBlurredView])
  {
    [(_UIBackdropView *)[(PLProgressView *)self backgroundBlurredView] removeFromSuperview];
    [(PLProgressView *)self setBackgroundBlurredView:0];
  }
}

- (void)_installBackgroundBlurredView
{
  if (![(PLProgressView *)self backgroundBlurredView])
  {
    v3 = [(PLProgressView *)self backgroundView];
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:2010];
    [(PLProgressView *)self setBackgroundBlurredView:v4];
    [(UIView *)v3 addSubview:v4];
    [(UIView *)v3 sendSubviewToBack:v4];
  }
}

- (void)_installBackgroundView
{
  if (![(PLProgressView *)self backgroundView])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(PLProgressView *)self bounds];
    id v4 = (id)objc_msgSend(v3, "initWithFrame:");
    [(PLProgressView *)self setBackgroundView:v4];
    [v4 setOpaque:0];
    objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "clearColor"));
    [(PLProgressView *)self addSubview:v4];
    [(PLProgressView *)self sendSubviewToBack:v4];
    [v4 setAutoresizingMask:18];
  }
}

- (void)_syncToBackgroundType
{
  switch([(PLProgressView *)self backgroundType])
  {
    case 0:
      [(PLProgressView *)self _removeBackgroundTintedView];
      [(PLProgressView *)self _removeBackgroundBlurredView];
      goto LABEL_5;
    case 1:
      [(PLProgressView *)self _removeBackgroundTintedView];
      [(PLProgressView *)self _removeBackgroundBlurredView];
      goto LABEL_7;
    case 2:
      [(PLProgressView *)self _removeBackgroundTintedView];
      [(PLProgressView *)self _installBackgroundBlurredView];
LABEL_5:
      labelView = self->_labelView;
      uint64_t v4 = [MEMORY[0x1E4F428B8] blackColor];
      goto LABEL_8;
    case 3:
      [(PLProgressView *)self _removeBackgroundBlurredView];
      [(PLProgressView *)self _installBackgroundTintedView];
LABEL_7:
      labelView = self->_labelView;
      uint64_t v4 = [MEMORY[0x1E4F428B8] whiteColor];
LABEL_8:
      [(UILabel *)labelView setTextColor:v4];
      break;
    default:
      return;
  }
}

- (void)setBackgroundType:(int64_t)a3
{
  if (self->_backgroundType != a3)
  {
    self->_backgroundType = a3;
    [(PLProgressView *)self _syncToBackgroundType];
  }
}

- (void)layoutSubviews
{
  [(PLProgressView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PLProgressView *)self setOpaque:0];
  -[PLProgressView setBackgroundColor:](self, "setBackgroundColor:", [MEMORY[0x1E4F428B8] clearColor]);
  if (![(PLProgressView *)self backgroundView]) {
    [(PLProgressView *)self _installBackgroundView];
  }
  [(PLProgressView *)self _syncToBackgroundType];
  if (!self->_topDivider)
  {
    v33.origin.double x = v4;
    v33.origin.y = v6;
    v33.size.width = v8;
    v33.size.height = v10;
    double MinX = CGRectGetMinX(v33);
    v34.origin.double x = v4;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    double MinY = CGRectGetMinY(v34);
    v35.origin.double x = v4;
    v35.origin.y = v6;
    v35.size.width = v8;
    v35.size.height = v10;
    double Width = CGRectGetWidth(v35);
    PLPhysicalScreenScale();
    if (v14 <= 1.0) {
      double v15 = 1.0;
    }
    else {
      double v15 = 0.5;
    }
    v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", MinX, MinY, Width, v15);
    self->_topDivider = v16;
    [(PLProgressView *)self addSubview:v16];
    [(UIView *)self->_topDivider setAutoresizingMask:34];
    -[UIView setBackgroundColor:](self->_topDivider, "setBackgroundColor:", [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.200000003]);
  }
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  if (self->_cancelButton
    && [(PLProgressView *)self showsCancelButton]
    && ([(UIButton *)self->_cancelButton isHidden] & 1) == 0)
  {
    [(UIButton *)self->_cancelButton frame];
    double v19 = v18;
    double v21 = v20;
    v36.origin.double x = v4;
    v36.origin.y = v6;
    v36.size.width = v8;
    v36.size.height = v10;
    v37.origin.double x = CGRectGetMaxX(v36) + -10.0 - v19;
    v37.origin.y = (v10 - v21) * 0.5;
    v37.size.width = v19;
    v37.size.height = v21;
    CGRect v38 = CGRectIntegral(v37);
    double v17 = v38.size.width;
    -[UIButton setFrame:](self->_cancelButton, "setFrame:", v38.origin.x, v38.origin.y);
  }
  progressView = self->_progressView;
  if (!progressView)
  {
    v23 = (UIProgressView *)[objc_alloc(MEMORY[0x1E4F42D28]) initWithProgressViewStyle:0];
    self->_progressView = v23;
    [(UIProgressView *)v23 setAutoresizingMask:34];
    [(PLProgressView *)self addSubview:self->_progressView];
    [(PLProgressView *)self bounds];
    CGRect v40 = CGRectInset(v39, 10.0, 0.0);
    double x = v40.origin.x;
    double v25 = v17 + 20.0;
    if (v17 == 0.0) {
      double v25 = 0.0;
    }
    CGFloat v26 = v40.size.width - v25;
    CGFloat v27 = v40.origin.y + 12.0;
    [(UIProgressView *)self->_progressView bounds];
    -[UIProgressView setFrame:](self->_progressView, "setFrame:", x, v27, v26, CGRectGetHeight(v41));
    [(PLProgressView *)self setPercentComplete:0.0];
    progressView = self->_progressView;
  }
  [(UIProgressView *)progressView frame];
  labelView = self->_labelView;
  double v31 = v28 + v29 + 4.0;
  -[UILabel setFrame:](labelView, "setFrame:", v4, v31, v8, 20.0);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLProgressView;
  [(PLProgressView *)&v3 dealloc];
}

- (PLProgressView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLProgressView;
  float result = -[PLProgressView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_backgroundType = 2;
  }
  return result;
}

@end