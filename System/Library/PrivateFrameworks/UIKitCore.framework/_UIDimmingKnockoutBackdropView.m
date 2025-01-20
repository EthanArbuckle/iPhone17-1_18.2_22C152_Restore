@interface _UIDimmingKnockoutBackdropView
- (_UIDimmingKnockoutBackdropView)initWithStyle:(int64_t)a3;
- (double)cornerRadius;
- (id)_dimmingKnockoutBackgroundColorForBackdropStyle:(int64_t)a3;
- (id)_dimmingKnockoutFilterForBackdropStyle:(int64_t)a3;
- (id)_vibrancyEffectForStyle:(int64_t)a3;
- (id)_visualEffectForStyle:(int64_t)a3;
- (int64_t)style;
- (void)_configureViewsWithStyle:(int64_t)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateBackdropViewWithStyle:(int64_t)a3 alpha:(double)a4;
- (void)_updateCornerRadius;
- (void)setAlpha:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRoundedCornerPosition:(unint64_t)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation _UIDimmingKnockoutBackdropView

- (_UIDimmingKnockoutBackdropView)initWithStyle:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIDimmingKnockoutBackdropView;
  v4 = [(UIView *)&v10 init];
  v5 = v4;
  if (v4)
  {
    [(UIView *)v4 alpha];
    v5->_alpha = v6;
    v5->_style = a3;
    [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(UIView *)v5 layer];
    [v7 setAllowsGroupBlending:0];

    v8 = [(UIView *)v5 layer];
    [v8 setAllowsGroupOpacity:0];

    [(_UIDimmingKnockoutBackdropView *)v5 _configureViewsWithStyle:a3];
  }
  return v5;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[_UIDimmingKnockoutBackdropView _configureViewsWithStyle:](self, "_configureViewsWithStyle:");
  }
}

- (void)_configureViewsWithStyle:(int64_t)a3
{
  dimmingKnockoutView = self->dimmingKnockoutView;
  if (!a3 || dimmingKnockoutView)
  {
    if (!a3 && dimmingKnockoutView)
    {
      [(UIView *)dimmingKnockoutView removeFromSuperview];
      v8 = self->dimmingKnockoutView;
      self->dimmingKnockoutView = 0;
    }
  }
  else
  {
    double v6 = objc_alloc_init(UIView);
    v7 = self->dimmingKnockoutView;
    self->dimmingKnockoutView = v6;

    [(UIView *)self insertSubview:self->dimmingKnockoutView atIndex:0];
    [(UIView *)self bounds];
    -[UIView setFrame:](self->dimmingKnockoutView, "setFrame:");
    [(UIView *)self->dimmingKnockoutView setAutoresizingMask:18];
  }
  v9 = [(UIView *)self->dimmingKnockoutView layer];
  objc_super v10 = [(_UIDimmingKnockoutBackdropView *)self _dimmingKnockoutFilterForBackdropStyle:a3];
  [v9 setCompositingFilter:v10];

  v11 = self->dimmingKnockoutView;
  v12 = [(_UIDimmingKnockoutBackdropView *)self _dimmingKnockoutBackgroundColorForBackdropStyle:a3];
  [(UIView *)v11 setBackgroundColor:v12];

  if (!self->backdropView)
  {
    v13 = [UIVisualEffectView alloc];
    v14 = [(_UIDimmingKnockoutBackdropView *)self _visualEffectForStyle:a3];
    v15 = [(UIVisualEffectView *)v13 initWithEffect:v14];
    backdropView = self->backdropView;
    self->backdropView = v15;

    [(UIView *)self addSubview:self->backdropView];
    [(UIView *)self bounds];
    -[UIView setFrame:](self->backdropView, "setFrame:");
    [(UIView *)self->backdropView setAutoresizingMask:18];
  }
  double alpha = self->_alpha;
  [(_UIDimmingKnockoutBackdropView *)self _updateBackdropViewWithStyle:a3 alpha:alpha];
}

- (void)_updateBackdropViewWithStyle:(int64_t)a3 alpha:(double)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  backdropView = self->backdropView;
  if (a4 == 0.0)
  {
    [(UIVisualEffectView *)self->backdropView setEffect:0];
  }
  else
  {
    v8 = [(_UIDimmingKnockoutBackdropView *)self _visualEffectForStyle:a3];
    [(UIVisualEffectView *)backdropView setEffect:v8];
  }
  uint64_t v9 = [(_UIDimmingKnockoutBackdropView *)self _vibrancyEffectForStyle:a3];
  objc_super v10 = (void *)v9;
  if (a4 > 0.0 && v9)
  {
    v15[0] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(UIVisualEffectView *)self->backdropView setContentEffects:v11];

    v12 = +[UIColor whiteColor];
    v13 = [(UIVisualEffectView *)self->backdropView contentView];
    [v13 setBackgroundColor:v12];
  }
  else
  {
    [(UIVisualEffectView *)self->backdropView setContentEffects:MEMORY[0x1E4F1CBF0]];
    v14 = [(UIVisualEffectView *)self->backdropView contentView];
    [v14 setBackgroundColor:0];
  }
}

- (id)_visualEffectForStyle:(int64_t)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      uint64_t v3 = 1200;
      goto LABEL_6;
    case 1:
      uint64_t v3 = 0;
      goto LABEL_6;
    case 2:
      uint64_t v3 = 1;
LABEL_6:
      v4 = +[UIBlurEffect effectWithStyle:v3];
      break;
    case 3:
      v5 = +[UIBlurEffect _effectWithBlurRadius:18.0 scale:0.25];
      double v6 = +[UIColorEffect _colorEffectSourceOver:](UIColorEffect, "_colorEffectSourceOver:", 0.175, 0.175, 0.175, 0.35);
      v7 = +[UIColorEffect _colorEffectSourceOver:](UIColorEffect, "_colorEffectSourceOver:", 0.0, 0.0, 0.0, 0.35);
      v8 = +[_UIZoomEffect zoomEffectWithMagnitude:0.025];
      v11[0] = v5;
      v11[1] = v6;
      v11[2] = v7;
      v11[3] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
      v4 = +[UIVisualEffect effectCombiningEffects:v9];

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)_vibrancyEffectForStyle:(int64_t)a3
{
  return 0;
}

- (id)_dimmingKnockoutFilterForBackdropStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:", *MEMORY[0x1E4F3A2C8], v3);
  }
  return v5;
}

- (id)_dimmingKnockoutBackgroundColorForBackdropStyle:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      double v4 = 0.0;
LABEL_7:
      uint64_t v3 = +[UIColor colorWithWhite:v4 alpha:0.5];
      break;
    case 2:
      double v4 = 1.0;
      goto LABEL_7;
    case 1:
      uint64_t v3 = +[UIColor whiteColor];
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v3;
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_double alpha = a3;
    [(_UIDimmingKnockoutBackdropView *)self _updateBackdropViewWithStyle:[(_UIDimmingKnockoutBackdropView *)self style] alpha:a3];
    dimmingKnockoutView = self->dimmingKnockoutView;
    [(UIView *)dimmingKnockoutView setAlpha:a3];
  }
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDimmingKnockoutBackdropView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIDimmingKnockoutBackdropView *)self _updateCornerRadius];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  self->_currentCornerRadius = a3;
  [(_UIDimmingKnockoutBackdropView *)self _updateCornerRadius];
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  v5 = [(UIView *)self layer];
  [v5 setMaskedCorners:a3];

  double v6 = [(UIView *)self->backdropView layer];
  [v6 setMaskedCorners:a3];

  v7 = [(UIView *)self->dimmingKnockoutView layer];
  [v7 setMaskedCorners:a3];

  [(_UIDimmingKnockoutBackdropView *)self _updateCornerRadius];
}

- (void)_updateCornerRadius
{
  double currentCornerRadius = self->_currentCornerRadius;
  [(UIView *)self->backdropView bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = [(UIView *)self->backdropView layer];
  double v13 = _UIClampedCornerRadius([v12 maskedCorners], currentCornerRadius, v5, v7, v9, v11);

  v14.receiver = self;
  v14.super_class = (Class)_UIDimmingKnockoutBackdropView;
  [(UIView *)&v14 _setContinuousCornerRadius:v13];
  [(UIVisualEffectView *)self->backdropView _setContinuousCornerRadius:v13];
  [(UIView *)self->dimmingKnockoutView _setContinuousCornerRadius:v13];
  [(UIView *)self setClipsToBounds:v13 > 0.0];
  [(UIView *)self->backdropView setClipsToBounds:v13 > 0.0];
  [(UIView *)self->dimmingKnockoutView setClipsToBounds:v13 > 0.0];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->backdropView, 0);
  objc_storeStrong((id *)&self->dimmingKnockoutView, 0);
}

@end