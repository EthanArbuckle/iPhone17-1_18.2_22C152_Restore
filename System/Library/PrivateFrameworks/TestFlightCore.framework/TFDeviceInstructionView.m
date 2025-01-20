@interface TFDeviceInstructionView
+ (UIEdgeInsets)imageLayoutInsets;
+ (double)cornerRadius;
+ (id)backgroundColor;
- (TFDeviceInstructionView)initWithFrame:(CGRect)a3;
- (UIImageView)deviceImageView;
- (void)displayDeviceImage:(id)a3 inOrientation:(int64_t)a4;
- (void)layoutSubviews;
- (void)updateCurrentDeviceImageToOrientation:(int64_t)a3;
@end

@implementation TFDeviceInstructionView

- (TFDeviceInstructionView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TFDeviceInstructionView;
  v3 = -[TFDeviceInstructionView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    deviceImageView = v3->_deviceImageView;
    v3->_deviceImageView = (UIImageView *)v5;

    [(UIImageView *)v3->_deviceImageView setContentMode:1];
    [(TFDeviceInstructionView *)v3 addSubview:v3->_deviceImageView];
    v7 = +[TFDeviceInstructionView backgroundColor];
    [(TFDeviceInstructionView *)v3 setBackgroundColor:v7];

    +[TFDeviceInstructionView cornerRadius];
    double v9 = v8;
    v10 = [(TFDeviceInstructionView *)v3 layer];
    [v10 setCornerRadius:v9];
  }
  return v3;
}

+ (double)cornerRadius
{
  return 15.0;
}

+ (id)backgroundColor
{
  v2 = (void *)MEMORY[0x263F1C550];
  v3 = [MEMORY[0x263F1C550] colorWithWhite:0.965 alpha:1.0];
  id v4 = [MEMORY[0x263F1C550] colorWithWhite:0.855 alpha:1.0];
  uint64_t v5 = [v2 dynamicColorWithLightColor:v3 darkColor:v4];

  return v5;
}

+ (UIEdgeInsets)imageLayoutInsets
{
  v2.n128_u64[0] = 20.0;
  v3.n128_u64[0] = 20.0;
  PPMScaledFloatValue(a1, a2, v2, v3);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)displayDeviceImage:(id)a3 inOrientation:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(TFDeviceInstructionView *)self deviceImageView];
  [v7 setImage:v6];

  [(TFDeviceInstructionView *)self updateCurrentDeviceImageToOrientation:a4];
}

- (void)updateCurrentDeviceImageToOrientation:(int64_t)a3
{
  CGFloat v4 = 0.0;
  if ((unint64_t)(a3 - 2) <= 2) {
    CGFloat v4 = dbl_223084838[a3 - 2];
  }
  CGAffineTransformMakeRotation(&v7, v4);
  double v5 = [(TFDeviceInstructionView *)self deviceImageView];
  CGAffineTransform v6 = v7;
  [v5 setTransform:&v6];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)TFDeviceInstructionView;
  [(TFDeviceInstructionView *)&v20 layoutSubviews];
  [(TFDeviceInstructionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  +[TFDeviceInstructionView imageLayoutInsets];
  double v12 = v4 + v11;
  double v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  double v18 = v10 - (v13 + v17);
  v19 = [(TFDeviceInstructionView *)self deviceImageView];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);
}

- (UIImageView)deviceImageView
{
  return self->_deviceImageView;
}

- (void).cxx_destruct
{
}

@end