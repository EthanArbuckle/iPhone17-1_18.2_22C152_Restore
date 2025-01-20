@interface SUReflectionView
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setImage:(id)a3;
@end

@implementation SUReflectionView

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUReflectionView;
  [(SUReflectionView *)&v3 dealloc];
}

- (void)setImage:(id)a3
{
  image = self->_image;
  if (image != a3)
  {

    self->_image = (UIImage *)a3;
  }
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(UIImage *)self->_image size];
  [(SUReflectionView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, 0.0, v11);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  if (!drawRect____ReflectionGradient)
  {
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0x3FC999999999999AuLL;
    long long v22 = xmmword_227924080;
    drawRect____ReflectionGradient = [objc_alloc(MEMORY[0x263F1C678]) initVerticalWithValues:&v18];
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", vcvtd_n_u64_f64(v11, 2uLL));
  v15 = CGBitmapContextCreate((void *)[v14 mutableBytes], 1uLL, (unint64_t)v11, 8uLL, 4uLL, DeviceRGB, 1u);
  if (v15)
  {
    objc_msgSend((id)drawRect____ReflectionGradient, "fillRect:inContext:", v15, 0.0, 0.0, 1.0, v11);
    Image = CGBitmapContextCreateImage(v15);
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    CGContextClipToMask(CurrentContext, v24, Image);
  }
  else
  {
    Image = 0;
  }
  v17 = self->_image;
  [(SUReflectionView *)self bounds];
  -[UIImage drawInRect:blendMode:alpha:](v17, "drawInRect:blendMode:alpha:", 0);
  CGContextRestoreGState(CurrentContext);
  if (Image) {
    CGImageRelease(Image);
  }
  if (DeviceRGB) {
    CGColorSpaceRelease(DeviceRGB);
  }

  if (v15) {
    CGContextRelease(v15);
  }
}

@end