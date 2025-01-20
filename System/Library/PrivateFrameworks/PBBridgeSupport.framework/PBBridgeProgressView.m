@interface PBBridgeProgressView
- (CGSize)_size;
- (PBBridgeProgressView)initWithStyle:(unint64_t)a3;
- (PBBridgeProgressView)initWithStyle:(unint64_t)a3 andVersion:(unint64_t)a4;
- (PBBridgeProgressView)initWithStyle:(unint64_t)a3 andVersion:(unint64_t)a4 overrideSize:(unint64_t)a5;
- (UIImageView)appleLogo;
- (double)_tickLength;
- (double)currentProgress;
- (unint64_t)style;
- (unint64_t)tickCount;
- (unint64_t)version;
- (unint64_t)watchSize;
- (void)drawRect:(CGRect)a3;
- (void)setAppleLogo:(id)a3;
- (void)setCurrentProgress:(double)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTickCount:(unint64_t)a3;
- (void)setVersion:(unint64_t)a3;
- (void)setWatchSize:(unint64_t)a3;
@end

@implementation PBBridgeProgressView

- (PBBridgeProgressView)initWithStyle:(unint64_t)a3 andVersion:(unint64_t)a4 overrideSize:(unint64_t)a5
{
  v34[2] = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)PBBridgeProgressView;
  v8 = -[PBBridgeProgressView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    v8->_version = a4;
    v8->_tickCount = 100;
    if (a5)
    {
      v8->_watchSize = a5;
    }
    else
    {
      v10 = +[PBBridgeWatchAttributeController sharedDeviceController];
      v9->_watchSize = [v10 size];
    }
    if (a4 == 1)
    {
      v11 = [@"syncLogo" stringByAppendingString:@"-v2"];
    }
    else
    {
      v11 = @"syncLogo";
    }
    if (v9->_style) {
      v12 = @"syncGizmoLogo";
    }
    else {
      v12 = v11;
    }
    v13 = +[PBBridgeWatchAttributeController resourceString:v12 material:0 size:7 forAttributes:4];
    if (v9->_style != 2)
    {
      id v14 = objc_alloc(MEMORY[0x263F1C6D0]);
      v15 = (void *)MEMORY[0x263F1C6B0];
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = [v15 imageNamed:v13 inBundle:v16];
      uint64_t v18 = [v14 initWithImage:v17];
      appleLogo = v9->_appleLogo;
      v9->_appleLogo = (UIImageView *)v18;

      [(UIImageView *)v9->_appleLogo setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PBBridgeProgressView *)v9 addSubview:v9->_appleLogo];
      v32 = v11;
      v20 = v13;
      v21 = (void *)MEMORY[0x263F08938];
      v22 = [(UIImageView *)v9->_appleLogo centerXAnchor];
      v23 = [(PBBridgeProgressView *)v9 centerXAnchor];
      v24 = [v22 constraintEqualToAnchor:v23];
      v34[0] = v24;
      v25 = [(UIImageView *)v9->_appleLogo centerYAnchor];
      v26 = [(PBBridgeProgressView *)v9 centerYAnchor];
      v27 = [v25 constraintEqualToAnchor:v26];
      v34[1] = v27;
      v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
      v29 = v21;
      v13 = v20;
      v11 = v32;
      [v29 activateConstraints:v28];
    }
    v30 = [MEMORY[0x263F1C550] greenColor];
    [(PBBridgeProgressView *)v9 setBackgroundColor:v30];
  }
  return v9;
}

- (PBBridgeProgressView)initWithStyle:(unint64_t)a3 andVersion:(unint64_t)a4
{
  return [(PBBridgeProgressView *)self initWithStyle:a3 andVersion:a4 overrideSize:0];
}

- (PBBridgeProgressView)initWithStyle:(unint64_t)a3
{
  return [(PBBridgeProgressView *)self initWithStyle:a3 andVersion:0];
}

- (double)_tickLength
{
  if (self->_style == 2) {
    return 6.0;
  }
  unint64_t watchSize = self->_watchSize;
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];
  double v5 = v4;

  unint64_t v6 = watchSize - 1;
  if (v5 <= 2.0)
  {
    double result = 0.0;
    if (v6 >= 0x15) {
      return result;
    }
    v8 = (double *)&unk_21C494978;
  }
  else
  {
    double result = 0.0;
    if (v6 >= 0x15) {
      return result;
    }
    v8 = (double *)&unk_21C4948D0;
  }
  return v8[v6];
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  CurrentContext = UIGraphicsGetCurrentContext();
  unint64_t style = self->_style;
  [(PBBridgeProgressView *)self _size];
  double v7 = v6;
  double v9 = v8;
  v10 = [MEMORY[0x263F1C550] blackColor];
  [v10 setFill];

  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = v7;
  v32.size.height = v9;
  CGContextFillRect(CurrentContext, v32);
  double v11 = 2.0;
  if (style != 1)
  {
    v12 = [MEMORY[0x263F1C920] mainScreen];
    [v12 scale];
    double v11 = 2.0 / v13;
  }
  double v14 = v7 * 0.5;
  [(PBBridgeProgressView *)self _tickLength];
  double v16 = v15;
  CGContextSaveGState(CurrentContext);
  *(_OWORD *)components = xmmword_21C494890;
  long long v30 = unk_21C4948A0;
  int tickCount = self->_tickCount;
  long long v27 = xmmword_21C4948B0;
  long long v28 = unk_21C4948C0;
  if (self->_style == 2) {
    int v18 = 36;
  }
  else {
    int v18 = tickCount;
  }
  if (self->_style == 2) {
    double v19 = 1.0;
  }
  else {
    double v19 = 100.0 / (double)tickCount;
  }
  if (style == 1)
  {
    CGContextSetLineWidth(CurrentContext, v19);
  }
  else
  {
    v20 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", 100.0 / (double)tickCount, v27, v28, *(void *)&components[0], *(void *)&components[1], v30);
    [v20 scale];
    CGContextSetLineWidth(CurrentContext, v19 * (2.0 / v21));
  }
  CGContextTranslateCTM(CurrentContext, v14, v9 * 0.5);
  CGContextRotateCTM(CurrentContext, 3.14159265);
  double currentProgress = self->_currentProgress;
  CGContextSetStrokeColor(CurrentContext, components);
  if (v18 >= 1)
  {
    signed int v23 = 0;
    char v24 = 0;
    float v25 = currentProgress * (double)v18;
    signed int v26 = llroundf(v25);
    do
    {
      if (v23 > v26 && (v24 & 1) == 0)
      {
        CGContextSetStrokeColor(CurrentContext, (const CGFloat *)&v27);
        char v24 = 1;
      }
      CGContextMoveToPoint(CurrentContext, 0.0, v14 - v16 * v11);
      CGContextAddLineToPoint(CurrentContext, 0.0, v14);
      CGContextStrokePath(CurrentContext);
      CGContextRotateCTM(CurrentContext, 6.28318531 / (double)v18);
      ++v23;
    }
    while (v18 != v23);
  }
  CGContextRestoreGState(CurrentContext);
}

- (void)setCurrentProgress:(double)a3
{
  self->_double currentProgress = a3;
  [(PBBridgeProgressView *)self setNeedsDisplay];
}

- (CGSize)_size
{
  unint64_t watchSize = self->_watchSize;
  unint64_t style = self->_style;
  if (style == 2)
  {
    double v8 = 40.0;
    if (watchSize != 2) {
      double v8 = 44.0;
    }
    goto LABEL_13;
  }
  if (!style)
  {
    double v4 = [MEMORY[0x263F1C920] mainScreen];
    [v4 scale];
    double v6 = v5;

    if (v6 <= 2.0) {
      double v7 = (double *)&unk_21C494870;
    }
    else {
      double v7 = (double *)&unk_21C494880;
    }
    double v8 = v7[watchSize == 19];
LABEL_13:
    double v9 = v8;
    goto LABEL_14;
  }
  double v9 = *MEMORY[0x263F001B0];
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  unint64_t v10 = watchSize - 1;
  if (watchSize - 1 <= 0x14 && ((0x1C30C3u >> v10) & 1) != 0)
  {
    double v8 = dbl_21C494A20[v10];
    double v9 = dbl_21C494AC8[v10];
  }
LABEL_14:
  result.height = v8;
  result.width = v9;
  return result;
}

- (double)currentProgress
{
  return self->_currentProgress;
}

- (unint64_t)tickCount
{
  return self->_tickCount;
}

- (void)setTickCount:(unint64_t)a3
{
  self->_int tickCount = a3;
}

- (UIImageView)appleLogo
{
  return self->_appleLogo;
}

- (void)setAppleLogo:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)watchSize
{
  return self->_watchSize;
}

- (void)setWatchSize:(unint64_t)a3
{
  self->_unint64_t watchSize = a3;
}

- (void).cxx_destruct
{
}

@end