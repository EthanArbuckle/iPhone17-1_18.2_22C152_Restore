@interface VKCImageDataDetectorViewHighlightButton
- (UIImageView)blurImageView;
- (UIImageView)imageView;
- (VKCImageDataDetectorViewHighlightButton)initWithFrame:(CGRect)a3;
- (double)rotation;
- (id)blurImage:(id)a3 withRadius:(double)a4;
- (void)setBlurImageView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImageView:(id)a3;
- (void)setRotation:(double)a3;
@end

@implementation VKCImageDataDetectorViewHighlightButton

- (VKCImageDataDetectorViewHighlightButton)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VKCImageDataDetectorViewHighlightButton;
  v3 = -[VKCImageDataDetectorViewHighlightButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    v6 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_symbolImageWithName:", @"chevron.down.square.fill");
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    blurImageView = v3->_blurImageView;
    v3->_blurImageView = v7;

    v9 = [MEMORY[0x1E4F42A98] configurationWithPointSize:5 weight:2 scale:13.0];
    v10 = [v6 imageWithConfiguration:v9];

    v11 = [MEMORY[0x1E4F428B8] lightGrayColor];
    [(UIImageView *)v3->_imageView setVk_contentTintColor:v11];

    [(UIImageView *)v3->_imageView setImage:v10];
    [(VKCImageDataDetectorViewHighlightButton *)v3 addSubview:v3->_blurImageView];
    [(VKCImageDataDetectorViewHighlightButton *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
  v4 = [(VKCImageDataDetectorViewHighlightButton *)self layer];
  [v4 anchorPoint];
  if (v6 != 0.5 || v5 != 0.5)
  {
    [v4 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);
    objc_msgSend(v4, "setFrame:", v9, v11, v13, v15);
  }
  CGAffineTransformMakeRotation(&v17, a3);
  CGAffineTransform v16 = v17;
  [v4 setAffineTransform:&v16];
}

- (void)setFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)VKCImageDataDetectorViewHighlightButton;
  -[VKCImageDataDetectorViewHighlightButton setFrame:](&v30, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VKCImageDataDetectorViewHighlightButton *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(VKCImageDataDetectorViewHighlightButton *)self imageView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  double v13 = VKMCenterOfRect(v5, v7, v9, v11);
  double v15 = v14;
  double v16 = VKMMultiplyPointScalar(v9, v11, 0.5);
  double v17 = VKMRectWithCenterAndSize(v13, v15, v16);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(VKCImageDataDetectorViewHighlightButton *)self blurImageView];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  v25 = [(VKCImageDataDetectorViewHighlightButton *)self blurImageView];
  [v25 frame];
  v26 = -[UIView vk_renderImageFromViewBackingStoreWithSubrect:](self, "vk_renderImageFromViewBackingStoreWithSubrect:");

  v27 = objc_msgSend(v26, "vk_scaledImageMaxDimension:scale:", 44.0, 1.0);
  v28 = [(VKCImageDataDetectorViewHighlightButton *)self blurImage:v27 withRadius:5.0];
  v29 = [(VKCImageDataDetectorViewHighlightButton *)self blurImageView];
  [v29 setImage:v28];
}

- (id)blurImage:(id)a3 withRadius:(double)a4
{
  double v5 = (objc_class *)MEMORY[0x1E4F1E050];
  id v6 = a3;
  id v7 = [v5 alloc];
  uint64_t v8 = objc_msgSend(v6, "vk_cgImage");

  double v9 = (void *)[v7 initWithCGImage:v8 options:0];
  double v10 = [MEMORY[0x1E4F1E040] filterWithName:@"CIGaussianBlur"];
  double v11 = [NSNumber numberWithDouble:a4];
  [v10 setValue:v11 forKey:@"inputRadius"];

  [v10 setValue:v9 forKey:@"inputImage"];
  double v12 = [v10 valueForKey:@"outputImage"];
  [v12 extent];
  double v17 = VKMCenterOfRect(v13, v14, v15, v16);
  double v19 = v18;
  [v9 extent];
  double v21 = VKMRectWithCenterAndSize(v17, v19, v20);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [MEMORY[0x1E4F1E018] contextWithOptions:0];
  v29 = (CGImage *)objc_msgSend(v28, "createCGImage:fromRect:", v12, v21, v23, v25, v27);
  objc_super v30 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_imageWithCGImage:", v29);
  CGImageRelease(v29);

  return v30;
}

- (double)rotation
{
  return self->_rotation;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)blurImageView
{
  return self->_blurImageView;
}

- (void)setBlurImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end