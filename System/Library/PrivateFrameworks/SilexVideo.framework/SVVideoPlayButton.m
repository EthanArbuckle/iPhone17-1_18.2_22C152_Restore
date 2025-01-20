@interface SVVideoPlayButton
+ (id)disabledPlayImage;
+ (id)enabledPlayImage;
- (BOOL)isAccessibilityElement;
- (SVVideoPlayButton)initWithFrame:(CGRect)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (void)dealloc;
- (void)displayAsPaused;
- (void)layoutSubviews;
- (void)updateBackgroundColor;
@end

@implementation SVVideoPlayButton

- (SVVideoPlayButton)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SVVideoPlayButton;
  v3 = -[SVButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] whiteColor];
    [(SVVideoPlayButton *)v3 setTintColor:v4];

    v5 = (void *)MEMORY[0x263F1C550];
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.9;
    }
    v7 = [v5 colorWithRed:0.282352941 green:0.282352941 blue:0.290196078 alpha:v6];
    [(SVVideoPlayButton *)v3 setBackgroundColor:v7];
    v8 = [(SVVideoPlayButton *)v3 imageView];
    [v8 setContentMode:4];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v3 selector:sel_updateBackgroundColor name:*MEMORY[0x263F1CE58] object:0];

    [(SVVideoPlayButton *)v3 displayAsPaused];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1CE58] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SVVideoPlayButton;
  [(SVVideoPlayButton *)&v4 dealloc];
}

- (void)updateBackgroundColor
{
  v3 = [(SVVideoPlayButton *)self backgroundColor];
  id v6 = [v3 colorWithAlphaComponent:0.9];

  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    uint64_t v4 = [v6 colorWithAlphaComponent:1.0];

    id v5 = (id)v4;
  }
  else
  {
    id v5 = v6;
  }
  id v7 = v5;
  [(SVVideoPlayButton *)self setBackgroundColor:v5];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SVVideoPlayButton;
  [(SVVideoPlayButton *)&v7 layoutSubviews];
  v3 = [(SVVideoPlayButton *)self layer];
  [(SVVideoPlayButton *)self bounds];
  [v3 setCornerRadius:CGRectGetHeight(v8) * 0.5];

  uint64_t v4 = [(SVVideoPlayButton *)self imageView];
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, 40.0, 40.0);

  id v5 = [(SVVideoPlayButton *)self imageView];
  [(SVVideoPlayButton *)self bounds];
  double MidX = CGRectGetMidX(v9);
  [(SVVideoPlayButton *)self bounds];
  objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(v10));
}

- (BOOL)isAccessibilityElement
{
  return ![self svax_shouldBeOccluded];
}

- (id)accessibilityLabel
{
  v2 = SVBundle();
  v3 = [v2 localizedStringForKey:@"Play" value:&stru_26D969BC8 table:0];

  return v3;
}

- (id)accessibilityHint
{
  v2 = SVBundle();
  v3 = [v2 localizedStringForKey:@"Double tap to begin video playback" value:&stru_26D969BC8 table:0];

  return v3;
}

+ (id)enabledPlayImage
{
  if (enabledPlayImage_onceToken != -1) {
    dispatch_once(&enabledPlayImage_onceToken, &__block_literal_global);
  }
  v2 = (void *)enabledPlayImage_image;

  return v2;
}

void __37__SVVideoPlayButton_enabledPlayImage__block_invoke()
{
  id v4 = [MEMORY[0x263F1C6C8] configurationWithPointSize:40.0];
  v0 = [MEMORY[0x263F1C6B0] systemImageNamed:@"play.fill" withConfiguration:v4];
  v1 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v2 = [v0 imageWithTintColor:v1];
  v3 = (void *)enabledPlayImage_image;
  enabledPlayImage_image = v2;
}

+ (id)disabledPlayImage
{
  if (disabledPlayImage_onceToken != -1) {
    dispatch_once(&disabledPlayImage_onceToken, &__block_literal_global_21);
  }
  uint64_t v2 = (void *)disabledPlayImage_image;

  return v2;
}

void __38__SVVideoPlayButton_disabledPlayImage__block_invoke()
{
  id v4 = [MEMORY[0x263F1C6C8] configurationWithPointSize:40.0];
  v0 = [MEMORY[0x263F1C6B0] systemImageNamed:@"play.slash.fill" withConfiguration:v4];
  v1 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v2 = [v0 imageWithTintColor:v1];
  v3 = (void *)disabledPlayImage_image;
  disabledPlayImage_image = v2;
}

- (void)displayAsPaused
{
  id v4 = +[SVVideoPlayButton enabledPlayImage];
  v3 = +[SVVideoPlayButton disabledPlayImage];
  [(SVVideoPlayButton *)self setImage:v4 forState:0];
  [(SVVideoPlayButton *)self setImage:v3 forState:2];
}

@end