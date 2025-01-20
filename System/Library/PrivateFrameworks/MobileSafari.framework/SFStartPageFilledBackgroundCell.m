@interface SFStartPageFilledBackgroundCell
- (SFStartPageFilledBackgroundCell)initWithFrame:(CGRect)a3;
- (UIVisualEffectView)backgroundEffectView;
- (_UIVisualEffectBackdropView)backdropCaptureView;
- (id)defaultBackgroundConfiguration;
- (void)setBackdropCaptureView:(id)a3;
- (void)setBackgroundEffectView:(id)a3;
@end

@implementation SFStartPageFilledBackgroundCell

- (id)defaultBackgroundConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)SFStartPageFilledBackgroundCell;
  v3 = [(SFStartPageFilledBackgroundCell *)&v5 defaultBackgroundConfiguration];
  [v3 setCustomView:self->_backgroundEffectView];

  return v3;
}

- (SFStartPageFilledBackgroundCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFStartPageFilledBackgroundCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1F00], "sf_startPageCellBackgroundEffectViewWithShadow:shadowRadius:", 1, 8.0);
    backgroundEffectView = v3->_backgroundEffectView;
    v3->_backgroundEffectView = (UIVisualEffectView *)v4;

    [(UIVisualEffectView *)v3->_backgroundEffectView sf_configureAsStartPageBackground];
    v6 = v3->_backgroundEffectView;
    v7 = objc_msgSend(MEMORY[0x1E4FB1F00], "sf_startPageBackgroundTraits");
    id v8 = (id)[(UIVisualEffectView *)v6 registerForTraitChanges:v7 withTarget:v3->_backgroundEffectView action:sel_sf_configureAsStartPageBackground];

    v9 = [(SFStartPageFilledBackgroundCell *)v3 defaultBackgroundConfiguration];
    [(SFStartPageFilledBackgroundCell *)v3 setBackgroundConfiguration:v9];

    v10 = v3;
  }

  return v3;
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return (_UIVisualEffectBackdropView *)[(UIVisualEffectView *)self->_backgroundEffectView _captureView];
}

- (void)setBackdropCaptureView:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(UIVisualEffectView *)self->_backgroundEffectView _captureView];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0) {
    [(UIVisualEffectView *)self->_backgroundEffectView _setCaptureView:v6];
  }
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setBackgroundEffectView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end