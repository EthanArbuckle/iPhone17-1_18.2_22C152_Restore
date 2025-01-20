@interface SiriUIAcousticIDSpinner
- (BOOL)isShowing;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriUIAcousticIDSpinner)initWithFrame:(CGRect)a3;
- (SiriUIAcousticIDSpinnerDelegate)delegate;
- (id)_imageForSpinner;
- (id)_spinningAnimation;
- (void)animateIn;
- (void)animateOut;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation SiriUIAcousticIDSpinner

- (SiriUIAcousticIDSpinner)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SiriUIAcousticIDSpinner;
  v3 = -[SiriUIAcousticIDSpinner initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB98]);
    v5 = (void *)MEMORY[0x263F1CB58];
    v6 = [MEMORY[0x263F1C480] effectWithStyle:2];
    v7 = [v5 effectForBlurEffect:v6];
    uint64_t v8 = [v4 initWithEffect:v7];
    vibrancyView = v3->_vibrancyView;
    v3->_vibrancyView = (UIVisualEffectView *)v8;

    [(UIVisualEffectView *)v3->_vibrancyView setAutoresizingMask:18];
    [(UIVisualEffectView *)v3->_vibrancyView setUserInteractionEnabled:0];
    [(SiriUIAcousticIDSpinner *)v3 insertSubview:v3->_vibrancyView atIndex:0];
    v10 = [(SiriUIAcousticIDSpinner *)v3 layer];
    [v10 setAllowsGroupBlending:0];

    id v11 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [v11 setAutoresizingMask:18];
    [v11 setUserInteractionEnabled:0];
    id v12 = objc_alloc(MEMORY[0x263F1C6D0]);
    v13 = (void *)MEMORY[0x263F1C6B0];
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v13 imageNamed:@"MusicNote" inBundle:v14];
    v16 = [MEMORY[0x263F1C550] whiteColor];
    v17 = [v15 _flatImageWithColor:v16];
    uint64_t v18 = [v12 initWithImage:v17];
    musicNoteView = v3->_musicNoteView;
    v3->_musicNoteView = (UIImageView *)v18;

    [(UIImageView *)v3->_musicNoteView setUserInteractionEnabled:0];
    v20 = [(UIImageView *)v3->_musicNoteView layer];
    [v20 setOpacity:0.0];

    [v11 addSubview:v3->_musicNoteView];
    id v21 = objc_alloc(MEMORY[0x263F1C6D0]);
    v22 = [(SiriUIAcousticIDSpinner *)v3 _imageForSpinner];
    uint64_t v23 = [v21 initWithImage:v22];
    spinnerView = v3->_spinnerView;
    v3->_spinnerView = (UIImageView *)v23;

    [(UIImageView *)v3->_spinnerView setUserInteractionEnabled:0];
    v25 = [(UIImageView *)v3->_spinnerView layer];
    [v25 setOpacity:0.0];

    [v11 addSubview:v3->_spinnerView];
    v26 = [(UIVisualEffectView *)v3->_vibrancyView contentView];
    [v26 addSubview:v11];
  }
  return v3;
}

- (id)_spinningAnimation
{
  v2 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.z"];
  UIAnimationDragCoefficient();
  [v2 setDuration:v3];
  LODWORD(v4) = 2139095040;
  [v2 setRepeatCount:v4];
  [v2 setFromValue:&unk_26D658068];
  [v2 setToValue:&unk_26D658078];
  return v2;
}

- (id)_imageForSpinner
{
  v8.width = 22.0;
  v8.height = 22.0;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v3 = [MEMORY[0x263F1C550] whiteColor];
  double v4 = (CGColor *)[v3 CGColor];

  CGContextSetStrokeColorWithColor(CurrentContext, v4);
  CGContextAddArc(CurrentContext, 11.0, 11.0, 10.0, 1.57079633, 1.91986218, 1);
  CGContextStrokePath(CurrentContext);
  v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v5;
}

- (BOOL)isShowing
{
  v2 = [(UIImageView *)self->_musicNoteView layer];
  [v2 opacity];
  BOOL v4 = v3 == 1.0;

  return v4;
}

- (void)animateIn
{
  float v3 = [(UIImageView *)self->_musicNoteView layer];
  [v3 opacity];
  float v5 = v4;

  if (v5 == 0.0)
  {
    id v16 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v16 setFromValue:&unk_26D657E30];
    [v16 setToValue:&unk_26D657E48];
    v6 = [(UIImageView *)self->_musicNoteView layer];
    [v6 addAnimation:v16 forKey:@"AcousticIDOpacityAnimationIn"];

    v7 = [(UIImageView *)self->_spinnerView layer];
    [v7 addAnimation:v16 forKey:@"AcousticIDOpacityAnimationIn"];

    CGSize v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
    [v8 setFromValue:&unk_26D657E30];
    [v8 setToValue:&unk_26D657E48];
    v9 = [(UIImageView *)self->_spinnerView layer];
    [v9 addAnimation:v8 forKey:@"AcousticIDScaleAnimationIn"];

    v10 = [(SiriUIAcousticIDSpinner *)self _spinningAnimation];
    [v10 setBeginTime:CACurrentMediaTime()];
    id v11 = [(UIImageView *)self->_spinnerView layer];
    [v11 addAnimation:v10 forKey:@"kAcousticIDSpinnerAnimation"];

    id v12 = [(UIImageView *)self->_musicNoteView layer];
    LODWORD(v13) = 1.0;
    [v12 setOpacity:v13];

    v14 = [(UIImageView *)self->_spinnerView layer];
    LODWORD(v15) = 1.0;
    [v14 setOpacity:v15];
  }
}

- (void)animateOut
{
  float v3 = [(UIImageView *)self->_musicNoteView layer];
  [v3 opacity];
  float v5 = v4;

  if (v5 != 0.0)
  {
    [MEMORY[0x263F158F8] begin];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __37__SiriUIAcousticIDSpinner_animateOut__block_invoke;
    v11[3] = &unk_26469EFA8;
    v11[4] = self;
    [MEMORY[0x263F158F8] setCompletionBlock:v11];
    v6 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v6 setFromValue:&unk_26D657E48];
    [v6 setToValue:&unk_26D657E30];
    v7 = [(UIImageView *)self->_musicNoteView layer];
    [v7 addAnimation:v6 forKey:@"AcousticIDOpacityAnimationOut"];

    CGSize v8 = [(UIImageView *)self->_spinnerView layer];
    [v8 addAnimation:v6 forKey:@"AcousticIDOpacityAnimationOut"];

    v9 = [(UIImageView *)self->_musicNoteView layer];
    [v9 setOpacity:0.0];

    v10 = [(UIImageView *)self->_spinnerView layer];
    [v10 setOpacity:0.0];

    [MEMORY[0x263F158F8] commit];
  }
}

void __37__SiriUIAcousticIDSpinner_animateOut__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 432));
  [WeakRetained acousticIDSpinnerDidHide:*(void *)(a1 + 32)];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 22.0;
  double v4 = 22.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  [(SiriUIAcousticIDSpinner *)self bounds];
  [(UIImageView *)self->_spinnerView frame];
  -[UIImageView setFrame:](self->_spinnerView, "setFrame:", 0.0, 0.0);
  [(UIImageView *)self->_musicNoteView sizeToFit];
  [(UIImageView *)self->_musicNoteView frame];
  UIRectCenteredIntegralRectScale();
  musicNoteView = self->_musicNoteView;
  double v5 = v4 + -1.0;
  [(UIImageView *)musicNoteView setFrame:v5];
}

- (SiriUIAcousticIDSpinnerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUIAcousticIDSpinnerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_musicNoteView, 0);
}

@end