@interface _UIBannerView
- (BOOL)highlighted;
- (CALayer)backgroundLayer;
- (UIImageView)imageView;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (UIView)highlightView;
- (_UIBannerContent)content;
- (_UIBannerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundLayer:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setContent:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 initialPress:(BOOL)a4;
- (void)setImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation _UIBannerView

- (_UIBannerView)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)_UIBannerView;
  v3 = -[UIView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F39BE8] layer];
    backgroundLayer = v3->_backgroundLayer;
    v3->_backgroundLayer = (CALayer *)v4;

    uint64_t v6 = *MEMORY[0x1E4F39EA8];
    [(CALayer *)v3->_backgroundLayer setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [(CALayer *)v3->_backgroundLayer setCornerRadius:13.0];
    id v7 = +[UIColor blackColor];
    -[CALayer setShadowColor:](v3->_backgroundLayer, "setShadowColor:", [v7 CGColor]);

    [(CALayer *)v3->_backgroundLayer setShadowRadius:10.0];
    -[CALayer setShadowOffset:](v3->_backgroundLayer, "setShadowOffset:", 0.0, 5.0);
    LODWORD(v8) = 1045220557;
    [(CALayer *)v3->_backgroundLayer setShadowOpacity:v8];
    v9 = [(UIView *)v3 layer];
    [v9 addSublayer:v3->_backgroundLayer];

    v10 = [UILabel alloc];
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v15 = -[UILabel initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v15;

    [(UIView *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v17 = [off_1E52D39B8 defaultFontForTextStyle:@"UICTFontTextStyleEmphasizedSubhead"];
    [(UILabel *)v3->_titleLabel setFont:v17];

    [(UIView *)v3 addSubview:v3->_titleLabel];
    v18 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v11, v12, v13, v14);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = v18;

    [(UIView *)v3->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_bodyLabel setNumberOfLines:0];
    v20 = [off_1E52D39C0 defaultFontDescriptorWithTextStyle:@"UICTFontTextStyleFootnote"];
    v21 = [off_1E52D39B8 fontWithDescriptor:v20 size:0.0];
    [(UILabel *)v3->_bodyLabel setFont:v21];

    [(UIView *)v3 addSubview:v3->_bodyLabel];
    v22 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v11, v12, v13, v14);
    imageView = v3->_imageView;
    v3->_imageView = v22;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v24) = 1148829696;
    [(UIView *)v3->_imageView setContentHuggingPriority:1 forAxis:v24];
    LODWORD(v25) = 1148829696;
    [(UIView *)v3->_imageView setContentHuggingPriority:0 forAxis:v25];
    LODWORD(v26) = 1148829696;
    [(UIView *)v3->_imageView setContentCompressionResistancePriority:1 forAxis:v26];
    LODWORD(v27) = 1148829696;
    [(UIView *)v3->_imageView setContentCompressionResistancePriority:0 forAxis:v27];
    [(UIView *)v3 addSubview:v3->_imageView];
    v28 = objc_alloc_init(UIView);
    highlightView = v3->_highlightView;
    v3->_highlightView = v28;

    v30 = +[UIColor blackColor];
    [(UIView *)v3->_highlightView setBackgroundColor:v30];

    [(UIView *)v3->_highlightView setAlpha:0.0];
    v31 = [(UIView *)v3->_highlightView layer];
    [v31 setCornerCurve:v6];

    [(CALayer *)v3->_backgroundLayer cornerRadius];
    double v33 = v32;
    v34 = [(UIView *)v3->_highlightView layer];
    [v34 setCornerRadius:v33];

    [(UIView *)v3 addSubview:v3->_highlightView];
    [(UIView *)v3 setNeedsUpdateConstraints];
  }
  return v3;
}

- (void)updateConstraints
{
  v34.receiver = self;
  v34.super_class = (Class)_UIBannerView;
  [(UIView *)&v34 updateConstraints];
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(UIView *)self->_imageView topAnchor];
  v5 = [(UIView *)self topAnchor];
  uint64_t v6 = [v4 constraintEqualToAnchor:v5 constant:16.0];
  [v3 addObject:v6];

  id v7 = [(UIView *)self->_imageView leadingAnchor];
  double v8 = [(UIView *)self leadingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8 constant:16.0];
  [v3 addObject:v9];

  v10 = [(UIView *)self->_imageView bottomAnchor];
  double v11 = [(UIView *)self bottomAnchor];
  double v12 = [v10 constraintLessThanOrEqualToAnchor:v11 constant:-16.0];
  [v3 addObject:v12];

  double v13 = [(UIView *)self->_titleLabel firstBaselineAnchor];
  double v14 = [(UIView *)self topAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14 constant:28.0];
  [v3 addObject:v15];

  v16 = [(UIView *)self->_titleLabel leadingAnchor];
  v17 = [(UIView *)self->_imageView trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:12.0];
  [v3 addObject:v18];

  v19 = [(UIView *)self->_titleLabel trailingAnchor];
  v20 = [(UIView *)self trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 constant:-16.0];
  [v3 addObject:v21];

  v22 = [(UIView *)self->_bodyLabel firstBaselineAnchor];
  v23 = [(UIView *)self->_titleLabel lastBaselineAnchor];
  double v24 = [v22 constraintEqualToAnchor:v23 constant:20.0];
  [v3 addObject:v24];

  double v25 = [(UIView *)self->_bodyLabel leadingAnchor];
  double v26 = [(UIView *)self->_titleLabel leadingAnchor];
  double v27 = [v25 constraintEqualToAnchor:v26];
  [v3 addObject:v27];

  v28 = [(UIView *)self->_bodyLabel trailingAnchor];
  v29 = [(UIView *)self->_titleLabel trailingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v3 addObject:v30];

  v31 = [(UIView *)self->_bodyLabel lastBaselineAnchor];
  double v32 = [(UIView *)self bottomAnchor];
  double v33 = [v31 constraintLessThanOrEqualToAnchor:v32 constant:-16.0];
  [v3 addObject:v33];

  [MEMORY[0x1E4F5B268] activateConstraints:v3];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)_UIBannerView;
  [(UIView *)&v12 layoutSubviews];
  v3 = [(UIView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_highlightView, "setFrame:", v5, v7, v9, v11);
}

- (void)setContent:(id)a3
{
  id v4 = a3;
  double v5 = [v4 title];
  [(UILabel *)self->_titleLabel setText:v5];

  double v6 = [v4 contentColor];
  [(UILabel *)self->_titleLabel setTextColor:v6];

  double v7 = [v4 body];
  [(UILabel *)self->_bodyLabel setText:v7];

  double v8 = [v4 contentColor];
  [(UILabel *)self->_bodyLabel setTextColor:v8];

  double v9 = [v4 image];
  [(UIImageView *)self->_imageView setImage:v9];

  double v10 = [v4 contentColor];
  [(UIView *)self->_imageView setTintColor:v10];

  double v11 = [v4 backgroundColor];

  if (!v11)
  {
    double v11 = +[UIColor grayColor];
  }
  id v12 = v11;
  -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", [v12 CGColor]);
}

- (void)setHighlighted:(BOOL)a3 initialPress:(BOOL)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->_highlighted != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_highlighted = a3;
    v10[0] = self;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45___UIBannerView_setHighlighted_initialPress___block_invoke;
    v8[3] = &unk_1E5304DB8;
    BOOL v9 = v5;
    v8[4] = self;
    +[UIButton _setVisuallyHighlighted:v5 forViews:v7 initialPress:v4 highlightBlock:v8];
  }
}

- (void)setHighlighted:(BOOL)a3
{
}

- (_UIBannerContent)content
{
  return self->_content;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end