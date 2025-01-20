@interface TPInComingCallBottomBarSupplementalButton
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (TPInComingCallBottomBarSupplementalButton)initWithFrame:(CGRect)a3;
- (UIView)backdropEffectView;
- (void)setBackdropEffectView:(id)a3;
@end

@implementation TPInComingCallBottomBarSupplementalButton

- (TPInComingCallBottomBarSupplementalButton)initWithFrame:(CGRect)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)TPInComingCallBottomBarSupplementalButton;
  v3 = -[TPInComingCallBottomBarSupplementalButton initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(TPInComingCallBottomBarSupplementalButton *)v3 titleLabel];
    [v5 setTextAlignment:1];

    v6 = +[TPUIConfiguration defaultFont];
    v7 = [(TPInComingCallBottomBarSupplementalButton *)v4 titleLabel];
    [v7 setFont:v6];

    v8 = [(TPInComingCallBottomBarSupplementalButton *)v4 titleLabel];
    [v8 setLineBreakMode:4];

    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(TPInComingCallBottomBarSupplementalButton *)v4 setTintColor:v9];

    v10 = [(TPInComingCallBottomBarSupplementalButton *)v4 titleLabel];
    [v10 setNumberOfLines:2];

    v35 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:40.0];
    v11 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v35];
    v38[0] = v35;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    [(UIView *)v11 setBackgroundEffects:v12];

    v13 = [MEMORY[0x1E4FB1618] blackColor];
    v14 = [v13 colorWithAlphaComponent:0.15];
    [(UIView *)v11 setBackgroundColor:v14];

    v15 = [(UIView *)v11 layer];
    [v15 setMasksToBounds:1];

    v16 = [(UIView *)v11 layer];
    [v16 setCornerRadius:22.0];

    [(UIView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(TPInComingCallBottomBarSupplementalButton *)v4 imageView];
    [(TPInComingCallBottomBarSupplementalButton *)v4 insertSubview:v11 belowSubview:v17];

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [(UIView *)v11 centerXAnchor];
    v34 = [(TPInComingCallBottomBarSupplementalButton *)v4 imageView];
    v32 = [v34 centerXAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v37[0] = v31;
    v29 = [(UIView *)v11 centerYAnchor];
    v30 = [(TPInComingCallBottomBarSupplementalButton *)v4 imageView];
    v18 = [v30 centerYAnchor];
    v19 = [v29 constraintEqualToAnchor:v18];
    v37[1] = v19;
    v20 = [(UIView *)v11 widthAnchor];
    v21 = [v20 constraintEqualToConstant:44.0];
    v37[2] = v21;
    v22 = [(UIView *)v11 heightAnchor];
    v23 = [(UIView *)v11 widthAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v37[3] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v28 activateConstraints:v25];

    backdropEffectView = v4->_backdropEffectView;
    v4->_backdropEffectView = v11;
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  +[TPUIConfiguration defaultHeight];
  double v4 = v3;
  v5 = [(TPInComingCallBottomBarSupplementalButton *)self image];
  [v5 size];
  double v7 = v6;

  v8 = [(TPInComingCallBottomBarSupplementalButton *)self titleLabel];
  [v8 intrinsicContentSize];
  double v10 = v9;

  if (v7 >= v10) {
    double v11 = v7;
  }
  else {
    double v11 = v10;
  }
  if (v4 >= v11) {
    double v11 = v4;
  }
  double v12 = ceil(v11);
  if (v12 <= 100.0) {
    double v13 = v12;
  }
  else {
    double v13 = 100.0;
  }
  +[TPUIConfiguration defaultHeight];
  double v15 = v14;
  double v16 = v13;
  result.height = v15;
  result.width = v16;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)TPInComingCallBottomBarSupplementalButton;
  -[TPInComingCallBottomBarSupplementalButton imageRectForContentRect:](&v8, sel_imageRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width * 0.5 - v4 * 0.5;
  double v7 = 2.0;
  result.size.height = v5;
  result.size.double width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double width = a3.size.width;
  v21[1] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)TPInComingCallBottomBarSupplementalButton;
  -[TPInComingCallBottomBarSupplementalButton titleRectForContentRect:](&v19, sel_titleRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = [(TPInComingCallBottomBarSupplementalButton *)self imageForState:0];
  [v5 size];
  double v7 = v6 + 20.0;

  +[TPUIConfiguration defaultHeight];
  double v9 = v8 - v7;
  double v10 = [(TPInComingCallBottomBarSupplementalButton *)self currentTitle];
  uint64_t v20 = *MEMORY[0x1E4FB06F8];
  double v11 = +[TPUIConfiguration defaultFont];
  v21[0] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, width, 3.40282347e38);
  double v14 = v13;

  if (v9 >= v14) {
    double v15 = v14;
  }
  else {
    double v15 = v9;
  }
  double v16 = 0.0;
  double v17 = v7;
  double v18 = width;
  result.size.height = v15;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (UIView)backdropEffectView
{
  return (UIView *)objc_getProperty(self, a2, 744, 1);
}

- (void)setBackdropEffectView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end