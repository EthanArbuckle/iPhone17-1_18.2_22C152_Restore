@interface PNPAnimatedHardwareView
- (CALayer)pencilLayer;
- (double)preferredHeightForWidth:(double)a3;
- (id)layerForHardwareType:(unint64_t)a3 deviceType:(int64_t)a4;
- (int64_t)deviceType;
- (unint64_t)hardwareType;
- (void)configureForCurrentHardwareAndDevice;
- (void)layoutSubviews;
- (void)setDeviceType:(int64_t)a3;
- (void)setHardwareType:(unint64_t)a3;
- (void)setHardwareType:(unint64_t)a3 deviceType:(int64_t)a4;
- (void)setPencilLayer:(id)a3;
@end

@implementation PNPAnimatedHardwareView

- (void)setPencilLayer:(id)a3
{
  v4 = (CALayer *)a3;
  [(CALayer *)self->_pencilLayer removeFromSuperlayer];
  pencilLayer = self->_pencilLayer;
  self->_pencilLayer = v4;
  v6 = v4;

  -[CALayer setAnchorPoint:](self->_pencilLayer, "setAnchorPoint:", 0.0, 0.5);
  -[CALayer setPosition:](self->_pencilLayer, "setPosition:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(CALayer *)self->_pencilLayer setGeometryFlipped:1];
  id v7 = [(PNPAnimatedHardwareView *)self layer];
  [v7 addSublayer:self->_pencilLayer];
}

- (void)setHardwareType:(unint64_t)a3 deviceType:(int64_t)a4
{
  [(PNPAnimatedHardwareView *)self setHardwareType:a3];
  [(PNPAnimatedHardwareView *)self setDeviceType:a4];
  [(PNPAnimatedHardwareView *)self configureForCurrentHardwareAndDevice];
}

- (void)configureForCurrentHardwareAndDevice
{
  v3 = [(PNPAnimatedHardwareView *)self layerForHardwareType:[(PNPAnimatedHardwareView *)self hardwareType] deviceType:[(PNPAnimatedHardwareView *)self deviceType]];
  [(PNPAnimatedHardwareView *)self setPencilLayer:v3];

  if ([(PNPAnimatedHardwareView *)self hardwareType] - 1 <= 1)
  {
    id v4 = [(PNPAnimatedHardwareView *)self pencilLayer];
    objc_msgSend(v4, "setAnchorPoint:", 0.0, 0.5);
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PNPAnimatedHardwareView;
  [(PNPAnimatedHardwareView *)&v15 layoutSubviews];
  [(PNPAnimatedHardwareView *)self bounds];
  double v4 = v3;
  v5 = [(PNPAnimatedHardwareView *)self pencilLayer];
  [v5 size];
  double v7 = v6;

  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, v4 / v7, v4 / v7);
  CGAffineTransform v13 = v14;
  v8 = [(PNPAnimatedHardwareView *)self pencilLayer];
  CGAffineTransform v12 = v13;
  [v8 setAffineTransform:&v12];

  [(PNPAnimatedHardwareView *)self bounds];
  double v10 = v9 * 0.5 + 8.0;
  v11 = [(PNPAnimatedHardwareView *)self pencilLayer];
  objc_msgSend(v11, "setPosition:", 0.0, v10);
}

- (id)layerForHardwareType:(unint64_t)a3 deviceType:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v4 = @"DoubleTap";
  if (a3 != 1) {
    double v4 = 0;
  }
  if (a3 == 2) {
    v5 = @"Squeeze";
  }
  else {
    v5 = v4;
  }
  if (a4 == 2)
  {
    double v6 = @"-B332";
  }
  else
  {
    if (a4 != 4) {
      goto LABEL_11;
    }
    double v6 = @"-B532";
  }
  v5 = [(__CFString *)v5 stringByAppendingString:v6];
LABEL_11:
  double v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 URLForResource:v5 withExtension:@"caar"];

  uint64_t v9 = *MEMORY[0x263F15EE0];
  id v15 = 0;
  double v10 = [MEMORY[0x263F15838] packageWithContentsOfURL:v8 type:v9 options:0 error:&v15];
  id v11 = v15;
  if (v11)
  {
    CGAffineTransform v12 = os_log_create("com.apple.pencilpairingui", "");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_2397CD000, v12, OS_LOG_TYPE_DEFAULT, "Error getting animation package: %@", buf, 0xCu);
    }
  }
  CGAffineTransform v13 = [v10 rootLayer];

  return v13;
}

- (double)preferredHeightForWidth:(double)a3
{
  return 76.0;
}

- (unint64_t)hardwareType
{
  return self->_hardwareType;
}

- (void)setHardwareType:(unint64_t)a3
{
  self->_hardwareType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (CALayer)pencilLayer
{
  return self->_pencilLayer;
}

- (void).cxx_destruct
{
}

@end