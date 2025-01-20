@interface SFAirDropActiveIconView
+ (id)baseImage;
- (BOOL)isMasked;
- (SFAirDropActiveIconView)initWithFrame:(CGRect)a3 grayscale:(BOOL)a4;
- (void)layoutSubviews;
- (void)setMasked:(BOOL)a3;
@end

@implementation SFAirDropActiveIconView

+ (id)baseImage
{
  if (baseImage_onceToken != -1) {
    dispatch_once(&baseImage_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)baseImage_image;
  return v2;
}

void __36__SFAirDropActiveIconView_baseImage__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v0 bundleURL];

  v1 = [NSURL fileURLWithFileSystemRepresentation:"AirDrop-active.png" isDirectory:0 relativeToURL:v6];
  v2 = (void *)MEMORY[0x263F827E8];
  v3 = [v1 path];
  uint64_t v4 = [v2 imageWithContentsOfFile:v3];
  v5 = (void *)baseImage_image;
  baseImage_image = v4;
}

- (SFAirDropActiveIconView)initWithFrame:(CGRect)a3 grayscale:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(id)objc_opt_class() baseImage];
  [v6 size];
  double v8 = v7;
  [v6 size];
  v14.receiver = self;
  v14.super_class = (Class)SFAirDropActiveIconView;
  v10 = -[SFAirDropActiveIconView initWithFrame:](&v14, sel_initWithFrame_, 0.0, 0.0, v8, v9);
  if (v10)
  {
    if (v4)
    {
      uint64_t v11 = [v6 imageWithRenderingMode:2];

      v12 = [MEMORY[0x263F825C8] grayColor];
      [(SFAirDropActiveIconView *)v10 setTintColor:v12];

      id v6 = (void *)v11;
    }
    [(SFAirDropActiveIconView *)v10 setImage:v6];
    [(SFAirDropActiveIconView *)v10 setContentMode:4];
  }

  return v10;
}

- (void)layoutSubviews
{
  if (!self->_circleMaskView)
  {
    id v3 = objc_alloc(MEMORY[0x263F82E00]);
    [(SFAirDropActiveIconView *)self bounds];
    BOOL v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    circleMaskView = self->_circleMaskView;
    self->_circleMaskView = v4;

    id v6 = [MEMORY[0x263F825C8] blackColor];
    [(UIView *)self->_circleMaskView setBackgroundColor:v6];

    [(UIView *)self->_circleMaskView bounds];
    CGFloat v7 = CGRectGetWidth(v14) * 0.5;
    double v8 = [(UIView *)self->_circleMaskView layer];
    [v8 setCornerRadius:v7];

    CGAffineTransformMakeScale(&v13, 0.0, 0.0);
    double v9 = self->_circleMaskView;
    CGAffineTransform v12 = v13;
    [(UIView *)v9 setTransform:&v12];
    v10 = [(UIView *)self->_circleMaskView layer];
    [v10 setCompositingFilter:@"destOut"];

    [(SFAirDropActiveIconView *)self addSubview:self->_circleMaskView];
    self->_masked = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)SFAirDropActiveIconView;
  [(SFAirDropActiveIconView *)&v11 layoutSubviews];
}

- (void)setMasked:(BOOL)a3
{
  if (self->_masked != a3)
  {
    self->_masked = a3;
    memset(&v7, 0, sizeof(v7));
    if (a3)
    {
      CGFloat v4 = 1.0;
      CGFloat v5 = 1.0;
    }
    else
    {
      CGFloat v4 = 0.0;
      CGFloat v5 = 0.0;
    }
    CGAffineTransformMakeScale(&v7, v4, v5);
    CGAffineTransform v6 = v7;
    [(UIView *)self->_circleMaskView setTransform:&v6];
  }
}

- (BOOL)isMasked
{
  return self->_masked;
}

- (void).cxx_destruct
{
}

@end