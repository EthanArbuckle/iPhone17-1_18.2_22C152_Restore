@interface _UIAlertControlleriOSHighlightedBackgroundView
- (_UIAlertControlleriOSHighlightedBackgroundView)init;
- (_UIAlertControlleriOSHighlightedBackgroundView)initWithStyle:(int64_t)a3;
- (int64_t)style;
- (void)_configureWithStyle:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRoundedCornerPosition:(unint64_t)a3;
@end

@implementation _UIAlertControlleriOSHighlightedBackgroundView

- (_UIAlertControlleriOSHighlightedBackgroundView)init
{
  return [(_UIAlertControlleriOSHighlightedBackgroundView *)self initWithStyle:0];
}

- (_UIAlertControlleriOSHighlightedBackgroundView)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControlleriOSHighlightedBackgroundView;
  v4 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    [(_UIAlertControlleriOSHighlightedBackgroundView *)v4 _configureWithStyle:a3];
  }
  return v5;
}

- (void)_configureWithStyle:(int64_t)a3
{
  if (a3 == 1)
  {
    -[UIView setHidden:](self, "setHidden:");
    id v9 = +[UIColor whiteColor];
    -[UIView setBackgroundColor:](self, "setBackgroundColor:");
  }
  else
  {
    id v9 = +[UIBlurEffect effectWithStyle:1200];
    v4 = +[UIVibrancyEffect _effectForBlurEffect:vibrancyStyle:](UIVibrancyEffect, "_effectForBlurEffect:vibrancyStyle:");
    v5 = [[UIVisualEffectView alloc] initWithEffect:v4];
    v6 = +[UIColor whiteColor];
    objc_super v7 = [(UIVisualEffectView *)v5 contentView];
    [v7 setBackgroundColor:v6];

    [(UIView *)self bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(UIView *)v5 setAutoresizingMask:18];
    [(UIView *)v5 setHidden:1];
    [(UIView *)self addSubview:v5];
    effectView = self->_effectView;
    self->_effectView = v5;
  }
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(UIView *)self layer];
  [v4 setCornerRadius:a3];
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  id v4 = [(UIView *)self layer];
  [v4 setMaskedCorners:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_style != 1) {
    self = (_UIAlertControlleriOSHighlightedBackgroundView *)self->_effectView;
  }
  [(UIView *)self setHidden:!a3];
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end