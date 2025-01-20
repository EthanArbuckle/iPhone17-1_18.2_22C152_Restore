@interface SSVellumOpacityControl
+ (double)preferredWidth;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SSVellumOpacityControl)initWithFrame:(CGRect)a3;
- (double)value;
- (id)_leftImageView;
- (id)_rightImageView;
- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)layoutSubviews;
- (void)setValue:(double)a3;
@end

@implementation SSVellumOpacityControl

- (SSVellumOpacityControl)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)SSVellumOpacityControl;
  v3 = -[SSVellumOpacityControl initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UISlider *)objc_alloc_init(MEMORY[0x263F1C990]);
  slider = v3->_slider;
  v3->_slider = v4;

  [(UISlider *)v3->_slider setMinimumValue:0.0];
  LODWORD(v6) = *(_DWORD *)"fff?";
  [(UISlider *)v3->_slider setMaximumValue:v6];
  [(UISlider *)v3->_slider setValue:0.0];
  v7 = [MEMORY[0x263F1C550] whiteColor];
  v8 = [v7 colorWithAlphaComponent:0.4];

  [(UISlider *)v3->_slider setMinimumTrackTintColor:v8];
  [(UISlider *)v3->_slider setMaximumTrackTintColor:v8];
  v9 = v3->_slider;
  if (SSVellumOpacityControlKnobImage_onceToken != -1) {
    dispatch_once(&SSVellumOpacityControlKnobImage_onceToken, &__block_literal_global_4);
  }
  [(UISlider *)v9 setThumbImage:__SSVellumOpacityControlKnobImage forState:0];
  v10 = +[SSMaterial vellumOpacitySliderTrack];
  v11 = [(UISlider *)v3->_slider _minTrackView];
  [v10 applyToView:v11];

  v12 = [(UISlider *)v3->_slider _maxTrackView];
  [v10 applyToView:v12];

  v13 = [MEMORY[0x263F1C6B0] systemImageNamed:@"app"];
  uint64_t v14 = *MEMORY[0x263F1D260];
  v15 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D260] scale:2];
  v16 = [v13 imageWithSymbolConfiguration:v15];

  v17 = [v16 imageWithRenderingMode:2];

  v18 = [MEMORY[0x263F1C6B0] systemImageNamed:@"app.fill"];
  v19 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:v14 scale:2];
  v20 = [v18 imageWithSymbolConfiguration:v19];

  v21 = [v20 imageWithRenderingMode:2];

  uint64_t v22 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v17];
  leadingImageView = v3->_leadingImageView;
  v3->_leadingImageView = (UIImageView *)v22;

  uint64_t v24 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v21];
  trailingImageView = v3->_trailingImageView;
  v3->_trailingImageView = (UIImageView *)v24;

  [(UIImageView *)v3->_leadingImageView _setOverrideUserInterfaceStyle:2];
  [(UIImageView *)v3->_trailingImageView _setOverrideUserInterfaceStyle:2];
  v26 = v3->_leadingImageView;
  v27 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [(UIImageView *)v26 setTintColor:v27];

  v28 = v3->_trailingImageView;
  v29 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [(UIImageView *)v28 setTintColor:v29];

  [(UIImageView *)v3->_leadingImageView setShowsLargeContentViewer:1];
  [(UIImageView *)v3->_trailingImageView setShowsLargeContentViewer:1];
  v30 = +[SSMaterial vellumOpacitySliderValueImage];
  [v30 applyToView:v3->_leadingImageView];
  [(SSVellumOpacityControl *)v3 addSubview:v3->_slider];
  [(SSVellumOpacityControl *)v3 addSubview:v3->_leadingImageView];
  [(SSVellumOpacityControl *)v3 addSubview:v3->_trailingImageView];

  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F1D7C8];
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(SSVellumOpacityControl *)self intrinsicContentSize];
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

+ (double)preferredWidth
{
  return 233.0;
}

- (void)layoutSubviews
{
  [(SSVellumOpacityControl *)self bounds];
  double v4 = v3;
  UIRectCenteredYInRect();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(SSVellumOpacityControl *)self _leftImageView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  uint64_t v14 = [(SSVellumOpacityControl *)self _rightImageView];
  objc_msgSend(v14, "setFrame:", v4 - v10, v8, v10, v12);

  UIRectCenteredIntegralRect();
  slider = self->_slider;
  -[UISlider setFrame:](slider, "setFrame:");
}

- (id)_leftImageView
{
  uint64_t v3 = [(SSVellumOpacityControl *)self effectiveUserInterfaceLayoutDirection];
  double v4 = &OBJC_IVAR___SSVellumOpacityControl__trailingImageView;
  if (!v3) {
    double v4 = &OBJC_IVAR___SSVellumOpacityControl__leadingImageView;
  }
  double v5 = *(Class *)((char *)&self->super.super.super.super.isa + *v4);
  return v5;
}

- (id)_rightImageView
{
  uint64_t v3 = [(SSVellumOpacityControl *)self effectiveUserInterfaceLayoutDirection];
  double v4 = &OBJC_IVAR___SSVellumOpacityControl__leadingImageView;
  if (!v3) {
    double v4 = &OBJC_IVAR___SSVellumOpacityControl__trailingImageView;
  }
  double v5 = *(Class *)((char *)&self->super.super.super.super.isa + *v4);
  return v5;
}

- (void)setValue:(double)a3
{
  *(float *)&a3 = a3;
  [(UISlider *)self->_slider setValue:a3];
  [(SSVellumOpacityControl *)self setNeedsLayout];
}

- (double)value
{
  [(UISlider *)self->_slider value];
  return v2;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end