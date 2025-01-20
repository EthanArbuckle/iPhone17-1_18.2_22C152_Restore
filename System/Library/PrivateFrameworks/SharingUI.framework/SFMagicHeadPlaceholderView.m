@interface SFMagicHeadPlaceholderView
- (SFMagicHeadPlaceholderView)initWithFrame:(CGRect)a3;
- (double)alpha;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
- (void)setTiltedTooFarColor:(BOOL)a3 useRaiseLabel:(BOOL)a4 useNoUWBCapableLabel:(BOOL)a5;
- (void)updateForCurrentState;
@end

@implementation SFMagicHeadPlaceholderView

- (SFMagicHeadPlaceholderView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SFMagicHeadPlaceholderView;
  v3 = -[SFMagicHeadPlaceholderView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFMagicHeadPlaceholderView setBounds:](v3, "setBounds:", 0.0, 0.0, 128.0, 128.0);
    v5 = [MEMORY[0x263F825C8] clearColor];
    [(SFMagicHeadPlaceholderView *)v4 setBackgroundColor:v5];

    v6 = [SFMagicHeadCircleView alloc];
    [(SFMagicHeadPlaceholderView *)v4 bounds];
    uint64_t v7 = -[SFMagicHeadCircleView initWithFrame:](v6, "initWithFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (SFMagicHeadCircleView *)v7;

    v9 = [MEMORY[0x263F824D8] effectWithStyle:9];
    v10 = [MEMORY[0x263F82DF0] effectForBlurEffect:v9 style:6];
    uint64_t v11 = [objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v10];
    backgroundVisualEffectView = v4->_backgroundVisualEffectView;
    v4->_backgroundVisualEffectView = (UIVisualEffectView *)v11;

    v13 = [(UIVisualEffectView *)v4->_backgroundVisualEffectView contentView];
    [v13 addSubview:v4->_backgroundView];

    [(SFMagicHeadPlaceholderView *)v4 addSubview:v4->_backgroundVisualEffectView];
    id v14 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v4->_label;
    v4->_label = (UILabel *)v15;

    [(UILabel *)v4->_label setTextAlignment:1];
    v17 = SFFontForTextStyleWithAdditionalSymbolicTraits((void *)*MEMORY[0x263F835B8], 32770);
    [(UILabel *)v4->_label setFont:v17];

    [(UILabel *)v4->_label setNumberOfLines:2];
    v18 = [MEMORY[0x263F82818] configurationWithPointSize:5 weight:2 scale:64.0];
    v19 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.up" withConfiguration:v18];
    uint64_t v20 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v19];
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v20;

    v22 = [MEMORY[0x263F82DF0] effectForBlurEffect:v9 style:1];

    uint64_t v23 = [objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v22];
    contentVisualEffectView = v4->_contentVisualEffectView;
    v4->_contentVisualEffectView = (UIVisualEffectView *)v23;

    v25 = [(UIVisualEffectView *)v4->_contentVisualEffectView contentView];
    [v25 addSubview:v4->_label];

    v26 = [(UIVisualEffectView *)v4->_contentVisualEffectView contentView];
    [v26 addSubview:v4->_imageView];

    [(SFMagicHeadPlaceholderView *)v4 addSubview:v4->_contentVisualEffectView];
    [(SFMagicHeadPlaceholderView *)v4 updateForCurrentState];
  }
  return v4;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SFMagicHeadPlaceholderView;
  [(SFMagicHeadPlaceholderView *)&v6 layoutSubviews];
  [(SFMagicHeadPlaceholderView *)self bounds];
  -[UIVisualEffectView setFrame:](self->_backgroundVisualEffectView, "setFrame:");
  [(UIVisualEffectView *)self->_backgroundVisualEffectView bounds];
  CGRect v8 = CGRectInset(v7, 30.0, 30.0);
  -[SFMagicHeadCircleView setFrame:](self->_backgroundView, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
  [(SFMagicHeadPlaceholderView *)self bounds];
  CGRect v10 = CGRectInset(v9, 46.0, 65.0);
  -[UIVisualEffectView setFrame:](self->_contentVisualEffectView, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  [(UIVisualEffectView *)self->_contentVisualEffectView bounds];
  double MidX = CGRectGetMidX(v11);
  [(UIVisualEffectView *)self->_contentVisualEffectView bounds];
  double MidY = CGRectGetMidY(v12);
  [(UIVisualEffectView *)self->_contentVisualEffectView bounds];
  -[UILabel setFrame:](self->_label, "setFrame:");
  [(SFMagicHeadCircleView *)self->_backgroundView frame];
  CGFloat v5 = CGRectGetWidth(v13) * 0.5;
  [(SFMagicHeadCircleView *)self->_backgroundView frame];
  -[UIImageView setBounds:](self->_imageView, "setBounds:", 0.0, 0.0, v5, CGRectGetHeight(v14) * 0.5);
  -[UIImageView setCenter:](self->_imageView, "setCenter:", MidX, MidY);
}

- (void)setTiltedTooFarColor:(BOOL)a3 useRaiseLabel:(BOOL)a4 useNoUWBCapableLabel:(BOOL)a5
{
  if (self->_titledTooFarColor != a3 || self->_useRaiseLabel != a4 || self->_useNoUWBCapableLabel != a5)
  {
    self->_titledTooFarColor = a3;
    self->_useRaiseLabel = a4;
    self->_useNoUWBCapableLabel = 0;
    self->_canShowArrow = 1;
    [(SFMagicHeadPlaceholderView *)self updateForCurrentState];
  }
}

- (void)updateForCurrentState
{
  v3 = [MEMORY[0x263F6C2C0] rootSettings];
  id v7 = [v3 magicHeadSettings];

  if (self->_titledTooFarColor) {
    [v7 guidanceTiltedTooFarAlpha];
  }
  else {
    double v4 = 1.0;
  }
  [(UIVisualEffectView *)self->_backgroundVisualEffectView setAlpha:v4];
  if (self->_useRaiseLabel || self->_useNoUWBCapableLabel)
  {
    CGFloat v5 = SFLocalizedStringForKeyInStringsFileNamed();
    [(UILabel *)self->_label setText:v5];

    [(UILabel *)self->_label setAlpha:1.0];
    double v6 = 0.0;
  }
  else
  {
    [(UILabel *)self->_label setText:0];
    [(UILabel *)self->_label setAlpha:0.0];
    double v6 = 0.6;
    if (!self->_canShowArrow) {
      double v6 = 0.0;
    }
  }
  [(UIImageView *)self->_imageView setAlpha:v6];
  [(SFMagicHeadPlaceholderView *)self setNeedsLayout];
}

- (void)setAlpha:(double)a3
{
  -[UIVisualEffectView setAlpha:](self->_backgroundVisualEffectView, "setAlpha:");
  contentVisualEffectView = self->_contentVisualEffectView;
  [(UIVisualEffectView *)contentVisualEffectView setAlpha:a3];
}

- (double)alpha
{
  [(UIVisualEffectView *)self->_contentVisualEffectView alpha];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contentVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
}

@end