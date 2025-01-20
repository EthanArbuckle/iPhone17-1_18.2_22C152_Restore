@interface SXImageFillView
- (CGRect)contentFrame;
- (CGRect)fillFrameWithBoundingSize:(CGSize)a3;
- (SXAnimatedImage)animatedImage;
- (SXClippingView)clippingView;
- (SXImageFill)imageFill;
- (SXImageFillView)initWithImageFill:(id)a3 imageResource:(id)a4 imageViewFactory:(id)a5;
- (SXImageResource)imageResource;
- (SXImageView)imageView;
- (UIImage)image;
- (void)dealloc;
- (void)layoutSubviews;
- (void)load;
- (void)pause;
- (void)play;
- (void)setClippingView:(id)a3;
- (void)setContentFrame:(CGRect)a3;
@end

@implementation SXImageFillView

- (SXImageFillView)initWithImageFill:(id)a3 imageResource:(id)a4 imageViewFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SXImageFillView;
  v12 = [(SXFillView *)&v21 initWithFill:v9];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageFill, a3);
    objc_storeStrong((id *)&v13->_imageResource, a4);
    uint64_t v14 = [v11 imageViewForResource:v10];
    imageView = v13->_imageView;
    v13->_imageView = (SXImageView *)v14;

    v16 = v13->_imageView;
    v17 = [MEMORY[0x263F1C550] clearColor];
    [(SXImageView *)v16 setBackgroundColor:v17];

    v18 = [[SXClippingView alloc] initWithContentView:v13->_imageView];
    clippingView = v13->_clippingView;
    v13->_clippingView = v18;

    [(SXImageFillView *)v13 addSubview:v13->_clippingView];
  }

  return v13;
}

- (void)dealloc
{
  if ([(SXImageView *)self->_imageView objectHasQualityInterest:self quality:0])
  {
    [(SXImageView *)self->_imageView giveUpInterestForObject:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)SXImageFillView;
  [(SXImageFillView *)&v3 dealloc];
}

- (void)load
{
  v5.receiver = self;
  v5.super_class = (Class)SXImageFillView;
  [(SXFillView *)&v5 load];
  if (![(SXImageView *)self->_imageView objectHasQualityInterest:self quality:0])
  {
    [(SXImageFillView *)self contentFrame];
    -[SXImageView setPreferredImageSize:](self->_imageView, "setPreferredImageSize:", v3, v4);
    [(SXImageView *)self->_imageView addInterestInImageQuality:0 forObject:self];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SXImageFillView;
  [(SXImageFillView *)&v4 layoutSubviews];
  double v3 = [(SXImageFillView *)self clippingView];
  [(SXImageFillView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (CGRect)fillFrameWithBoundingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(SXImageFillView *)self imageResource];
  [v6 dimensions];
  double v8 = v7;
  double v10 = v9;

  id v11 = [(SXFillView *)self fill];
  uint64_t v12 = [v11 fillMode];

  v13 = [(SXFillView *)self fill];
  uint64_t v14 = [v13 horizontalAlignment];

  v15 = [(SXFillView *)self fill];
  uint64_t v16 = [v15 verticalAlignment];

  +[SXFillPositioning frameForFillWithDimensions:withinBounds:fillMode:horizontalAlignment:verticalAlignment:](SXFillPositioning, "frameForFillWithDimensions:withinBounds:fillMode:horizontalAlignment:verticalAlignment:", v12, v14, v16, v8, v10, width, height);
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (UIImage)image
{
  v2 = [(SXImageFillView *)self imageView];
  double v3 = [v2 image];

  return (UIImage *)v3;
}

- (SXAnimatedImage)animatedImage
{
  v2 = [(SXImageFillView *)self imageView];
  double v3 = [v2 animatedImage];

  return (SXAnimatedImage *)v3;
}

- (void)play
{
  id v2 = [(SXImageFillView *)self imageView];
  [v2 resume];
}

- (void)pause
{
  id v2 = [(SXImageFillView *)self imageView];
  [v2 pause];
}

- (CGRect)contentFrame
{
  id v2 = [(SXImageFillView *)self clippingView];
  [v2 contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(SXImageFillView *)self clippingView];
  objc_msgSend(v7, "setContentFrame:", x, y, width, height);
}

- (SXClippingView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (SXImageFill)imageFill
{
  return self->_imageFill;
}

- (SXImageResource)imageResource
{
  return self->_imageResource;
}

- (SXImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageResource, 0);
  objc_storeStrong((id *)&self->_imageFill, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
}

@end