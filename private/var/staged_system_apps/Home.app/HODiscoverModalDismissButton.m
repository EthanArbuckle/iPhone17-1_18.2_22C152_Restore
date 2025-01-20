@interface HODiscoverModalDismissButton
+ (id)effectMappingColors:(id)a3 whitePoint:(id)a4;
+ (id)vibrancyEffectMappingColorsToColors:(id)a3 blackPointOut:(id)a4 whitePointIn:(id)a5 whitePointOut:(id)a6;
- (HODiscoverModalDismissButton)init;
- (HODiscoverModalDismissButton)initWithCoder:(id)a3;
- (HODiscoverModalDismissButton)initWithFrame:(CGRect)a3;
- (NSArray)layoutConstraints;
- (UIView)dismissButtonForegroundView;
- (UIVisualEffectView)dismissButtonEffectView;
- (void)setDismissButtonEffectView:(id)a3;
- (void)setDismissButtonForegroundView:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation HODiscoverModalDismissButton

- (HODiscoverModalDismissButton)initWithCoder:(id)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  v6 = NSStringFromSelector("initWithURL:");
  [v5 handleFailureInMethod:a2 object:self file:@"HODiscoverModalDismissButton.m" lineNumber:27 description:@"%s is unavailable; use %@ instead"];
    "-[HODiscoverModalDismissButton initWithCoder:]",
    v6);

  return 0;
}

- (HODiscoverModalDismissButton)init
{
  v4 = +[NSAssertionHandler currentHandler];
  v5 = NSStringFromSelector("initWithURL:");
  [v4 handleFailureInMethod:a2 object:self file:@"HODiscoverModalDismissButton.m" lineNumber:31 description:@"%s is unavailable; use %@ instead"];
    "-[HODiscoverModalDismissButton init]",
    v5);

  return 0;
}

- (HODiscoverModalDismissButton)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)HODiscoverModalDismissButton;
  v3 = -[HODiscoverModalDismissButton initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HODiscoverModalDismissButton *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HODiscoverModalDismissButton *)v4 setClipsToBounds:1];
    [(HODiscoverModalDismissButton *)v4 setUserInteractionEnabled:1];
    v5 = [(HODiscoverModalDismissButton *)v4 layer];
    [v5 setCornerRadius:17.5];

    v6 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
    v23 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
    v24 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
    v7 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    v8 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
    dismissButtonEffectView = v4->_dismissButtonEffectView;
    v4->_dismissButtonEffectView = v8;

    v26 = +[UIBlurEffect _effectWithInfiniteRadiusScale:0.0625];
    v10 = +[UIImage imageNamed:@"dismiss-button-color-map"];
    v25 = +[UIColorEffect colorEffectLuminanceMap:v10 blendingAmount:1.0];

    v11 = +[HODiscoverModalDismissButton effectMappingColors:v6 whitePoint:v23];
    v29[0] = v26;
    v29[1] = v25;
    v29[2] = v11;
    v12 = +[NSArray arrayWithObjects:v29 count:3];
    [(UIVisualEffectView *)v4->_dismissButtonEffectView setBackgroundEffects:v12];

    v13 = +[HODiscoverModalDismissButton vibrancyEffectMappingColorsToColors:v6 blackPointOut:v24 whitePointIn:v23 whitePointOut:v7];
    v28 = v13;
    v14 = +[NSArray arrayWithObjects:&v28 count:1];
    [(UIVisualEffectView *)v4->_dismissButtonEffectView setContentEffects:v14];

    [(UIVisualEffectView *)v4->_dismissButtonEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)v4->_dismissButtonEffectView setUserInteractionEnabled:0];
    [(HODiscoverModalDismissButton *)v4 addSubview:v4->_dismissButtonEffectView];
    v15 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:20.0];
    id v16 = objc_alloc((Class)UIImageView);
    v17 = +[UIImage systemImageNamed:@"multiply" withConfiguration:v15];
    v18 = (UIView *)[v16 initWithImage:v17];
    dismissButtonForegroundView = v4->_dismissButtonForegroundView;
    v4->_dismissButtonForegroundView = v18;

    [(UIView *)v4->_dismissButtonForegroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = +[UIColor tintColor];
    [(UIView *)v4->_dismissButtonForegroundView setTintColor:v20];

    [(UIView *)v4->_dismissButtonForegroundView setUserInteractionEnabled:0];
    v21 = [(UIVisualEffectView *)v4->_dismissButtonEffectView contentView];
    [v21 addSubview:v4->_dismissButtonForegroundView];
  }
  return v4;
}

- (void)updateConstraints
{
  v3 = [(HODiscoverModalDismissButton *)self layoutConstraints];

  if (!v3)
  {
    v4 = +[NSMutableArray array];
    v5 = [(HODiscoverModalDismissButton *)self dismissButtonEffectView];
    v6 = [v5 contentView];
    v7 = [v6 topAnchor];
    v8 = [(HODiscoverModalDismissButton *)self topAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    [v4 addObject:v9];

    v10 = [(HODiscoverModalDismissButton *)self dismissButtonEffectView];
    v11 = [v10 contentView];
    v12 = [v11 bottomAnchor];
    v13 = [(HODiscoverModalDismissButton *)self bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    [v4 addObject:v14];

    v15 = [(HODiscoverModalDismissButton *)self dismissButtonEffectView];
    id v16 = [v15 contentView];
    v17 = [v16 trailingAnchor];
    v18 = [(HODiscoverModalDismissButton *)self trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v4 addObject:v19];

    v20 = [(HODiscoverModalDismissButton *)self dismissButtonEffectView];
    v21 = [v20 contentView];
    v22 = [v21 leadingAnchor];
    v23 = [(HODiscoverModalDismissButton *)self leadingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v4 addObject:v24];

    v25 = [(HODiscoverModalDismissButton *)self dismissButtonForegroundView];
    v26 = [v25 centerXAnchor];
    objc_super v27 = [(HODiscoverModalDismissButton *)self dismissButtonEffectView];
    v28 = [v27 contentView];
    v29 = [v28 centerXAnchor];
    v30 = [v26 constraintEqualToAnchor:v29];
    [v4 addObject:v30];

    v31 = [(HODiscoverModalDismissButton *)self dismissButtonForegroundView];
    v32 = [v31 centerYAnchor];
    v33 = [(HODiscoverModalDismissButton *)self dismissButtonEffectView];
    v34 = [v33 contentView];
    v35 = [v34 centerYAnchor];
    v36 = [v32 constraintEqualToAnchor:v35];
    [v4 addObject:v36];

    +[NSLayoutConstraint activateConstraints:v4];
    [(HODiscoverModalDismissButton *)self setLayoutConstraints:v4];
  }
  v37.receiver = self;
  v37.super_class = (Class)HODiscoverModalDismissButton;
  [(HODiscoverModalDismissButton *)&v37 updateConstraints];
}

+ (id)effectMappingColors:(id)a3 whitePoint:(id)a4
{
  double v28 = 0.0;
  double v29 = 0.0;
  double v26 = 0.0;
  double v27 = 0.0;
  id v5 = a4;
  [a3 getRed:&v29 green:&v28 blue:&v27 alpha:&v26];
  double v24 = 0.0;
  double v25 = 0.0;
  double v22 = 0.0;
  double v23 = 0.0;
  [v5 getRed:&v25 green:&v24 blue:&v23 alpha:&v22];

  long long v30 = 0uLL;
  long long v31 = 0uLL;
  double v8 = v25 - v29;
  long long v9 = 0u;
  long long v10 = 0u;
  double v11 = v24 - v28;
  long long v12 = 0uLL;
  long long v13 = 0uLL;
  double v14 = v23 - v27;
  long long v15 = 0u;
  long long v16 = 0u;
  double v17 = v22 - v26;
  double v18 = v29 * v26;
  double v19 = v28 * v26;
  double v20 = v27 * v26;
  double v21 = v26;
  v6 = +[UIColorEffect colorEffectMatrix:&v8];

  return v6;
}

+ (id)vibrancyEffectMappingColorsToColors:(id)a3 blackPointOut:(id)a4 whitePointIn:(id)a5 whitePointOut:(id)a6
{
  double v40 = 0.0;
  double v41 = 0.0;
  double v38 = 0.0;
  double v39 = 0.0;
  id v7 = a6;
  [a4 getRed:&v41 green:&v40 blue:&v39 alpha:&v38];
  double v36 = 0.0;
  double v37 = 0.0;
  double v35 = 0.0;
  double v34 = 0.0;
  [v7 getRed:&v37 green:&v36 blue:&v35 alpha:&v34];

  float v8 = v37 - v41;
  float v9 = v41 * v38;
  float v10 = v36 - v40;
  float v11 = v40 * v38;
  float v12 = v35 - v39;
  float v13 = v39 * v38;
  float v14 = v34 - v38;
  float v15 = v38;
  float v18 = v8;
  uint64_t v19 = 0;
  int v20 = 0;
  float v21 = v9;
  int v22 = 0;
  float v23 = v10;
  uint64_t v24 = 0;
  float v25 = v11;
  uint64_t v26 = 0;
  float v27 = v12;
  int v28 = 0;
  float v29 = v13;
  uint64_t v30 = 0;
  int v31 = 0;
  float v32 = v14;
  float v33 = v15;
  long long v16 = +[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:&v18 alpha:1.0];

  return v16;
}

- (UIVisualEffectView)dismissButtonEffectView
{
  return self->_dismissButtonEffectView;
}

- (void)setDismissButtonEffectView:(id)a3
{
}

- (UIView)dismissButtonForegroundView
{
  return self->_dismissButtonForegroundView;
}

- (void)setDismissButtonForegroundView:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_dismissButtonForegroundView, 0);

  objc_storeStrong((id *)&self->_dismissButtonEffectView, 0);
}

@end