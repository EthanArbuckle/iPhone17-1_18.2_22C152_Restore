@interface VUIWatchNowTemplateBackgroundLayer
- (VUIWatchNowTemplateBackgroundLayer)initWithRect:(CGRect)a3 withStyle:(int64_t)a4;
- (int64_t)uiStyle;
- (void)drawInContext:(CGContext *)a3;
- (void)setUiStyle:(int64_t)a3;
- (void)updateStyle:(int64_t)a3;
@end

@implementation VUIWatchNowTemplateBackgroundLayer

- (VUIWatchNowTemplateBackgroundLayer)initWithRect:(CGRect)a3 withStyle:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)VUIWatchNowTemplateBackgroundLayer;
  v9 = [(VUIWatchNowTemplateBackgroundLayer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(VUIWatchNowTemplateBackgroundLayer *)v9 setNeedsDisplay];
    -[VUIWatchNowTemplateBackgroundLayer setFrame:](v10, "setFrame:", x, y, width, height);
    v10->_uiStyle = a4;
  }
  return v10;
}

- (void)updateStyle:(int64_t)a3
{
  self->_uiStyle = a3;
  [(VUIWatchNowTemplateBackgroundLayer *)self setNeedsDisplay];
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = xmmword_1E38FE718;
  long long v16 = unk_1E38FE728;
  long long v17 = xmmword_1E38FE738;
  long long v18 = unk_1E38FE748;
  long long v11 = xmmword_1E38FE758;
  long long v12 = unk_1E38FE768;
  long long v13 = xmmword_1E38FE778;
  long long v14 = unk_1E38FE788;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v6 = DeviceRGB;
  if (self->_uiStyle == 1) {
    v7 = &v15;
  }
  else {
    v7 = &v11;
  }
  v8 = CGGradientCreateWithColorComponents(DeviceRGB, (const CGFloat *)v7, 0, 2uLL);
  CGColorSpaceRelease(v6);
  [(VUIWatchNowTemplateBackgroundLayer *)self bounds];
  CGFloat MidX = CGRectGetMidX(v22);
  [(VUIWatchNowTemplateBackgroundLayer *)self bounds];
  CGFloat v10 = CGRectGetHeight(v23) * 0.800000012;
  v20.double y = 0.0;
  v21.double y = 0.0;
  v20.double x = MidX;
  v21.double x = MidX;
  CGContextDrawRadialGradient(a3, v8, v20, 0.0, v21, v10, 2u);
  CGGradientRelease(v8);
}

- (int64_t)uiStyle
{
  return self->_uiStyle;
}

- (void)setUiStyle:(int64_t)a3
{
  self->_uiStyle = a3;
}

@end