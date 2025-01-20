@interface SXRepeatableImageFillView
- (CGRect)contentFrame;
- (CGRect)fillFrameWithBoundingSize:(CGSize)a3;
- (CGSize)patternSize;
- (SXClippingView)clippingView;
- (SXRepeatableImageFillView)initWithRepeatableImageFill:(id)a3 imageView:(id)a4;
- (SXRepeatableImageView)imageView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)load;
- (void)pause;
- (void)play;
- (void)setContentFrame:(CGRect)a3;
- (void)setPatternSize:(CGSize)a3;
@end

@implementation SXRepeatableImageFillView

- (SXRepeatableImageFillView)initWithRepeatableImageFill:(id)a3 imageView:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXRepeatableImageFillView;
  v8 = [(SXFillView *)&v14 initWithFill:a3];
  v9 = v8;
  if (v8)
  {
    p_imageView = (id *)&v8->_imageView;
    objc_storeStrong((id *)&v8->_imageView, a4);
    [*p_imageView setIsDecorative:1];
    [*p_imageView setContentMode:1];
    v11 = [[SXClippingView alloc] initWithContentView:v7];
    clippingView = v9->_clippingView;
    v9->_clippingView = v11;

    [(SXClippingView *)v9->_clippingView setClippingMode:0];
    [(SXRepeatableImageFillView *)v9 addSubview:v9->_clippingView];
  }

  return v9;
}

- (void)load
{
  v3.receiver = self;
  v3.super_class = (Class)SXRepeatableImageFillView;
  [(SXFillView *)&v3 load];
  if (![(SXImageView *)self->_imageView objectHasQualityInterest:self quality:0])[(SXImageView *)self->_imageView addInterestInImageQuality:0 forObject:self]; {
}
  }

- (void)dealloc
{
  if ([(SXImageView *)self->_imageView objectHasQualityInterest:self quality:0])
  {
    [(SXImageView *)self->_imageView giveUpInterestForObject:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)SXRepeatableImageFillView;
  [(SXRepeatableImageFillView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SXRepeatableImageFillView;
  [(SXRepeatableImageFillView *)&v4 layoutSubviews];
  objc_super v3 = [(SXRepeatableImageFillView *)self clippingView];
  [(SXRepeatableImageFillView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (CGRect)fillFrameWithBoundingSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6 = [(SXFillView *)self fill];
  if ([v6 repeat] == 3)
  {
    BOOL v7 = 1;
  }
  else
  {
    v8 = [(SXFillView *)self fill];
    BOOL v7 = [v8 repeat] == 1;
  }
  v9 = [(SXFillView *)self fill];
  if ([v9 repeat] == 3)
  {
    BOOL v10 = 1;
  }
  else
  {
    v11 = [(SXFillView *)self fill];
    BOOL v10 = [v11 repeat] == 2;
  }
  v12 = [(SXFillView *)self fill];
  uint64_t v13 = [v12 verticalAlignment];

  objc_super v14 = [(SXFillView *)self fill];
  uint64_t v15 = [v14 horizontalAlignment];

  double v16 = height;
  if (!v10)
  {
    [(SXRepeatableImageFillView *)self patternSize];
    double v16 = v17;
  }
  double v18 = width;
  if (!v7)
  {
    [(SXRepeatableImageFillView *)self patternSize];
    double v18 = v19;
  }
  uint64_t v20 = MEMORY[0x263F00148];
  if (v15 == 2)
  {
    if (v7)
    {
      [(SXRepeatableImageFillView *)self patternSize];
      double v27 = v26;
      [(SXRepeatableImageFillView *)self patternSize];
      double v18 = v18 + v27 - fmod(width, v28);
      [(SXRepeatableImageFillView *)self patternSize];
      double v30 = v29;
      [(SXRepeatableImageFillView *)self patternSize];
      double v25 = -(v30 - fmod(width, v31));
    }
    else
    {
      double v25 = width - v18;
    }
  }
  else if (v15 == 1)
  {
    if (v7)
    {
      [(SXRepeatableImageFillView *)self patternSize];
      unint64_t v22 = vcvtmd_u64_f64(width / v21);
      double v23 = (double)(v22 + (v22 & 1) + 1);
      [(SXRepeatableImageFillView *)self patternSize];
      double v18 = v24 * v23;
    }
    double v25 = (width - v18) * 0.5;
  }
  else
  {
    double v25 = *MEMORY[0x263F00148];
  }
  if (v13 == 2)
  {
    if (v10)
    {
      [(SXRepeatableImageFillView *)self patternSize];
      double v38 = v37;
      [(SXRepeatableImageFillView *)self patternSize];
      double v16 = v16 + v38 - fmod(height, v39);
      [(SXRepeatableImageFillView *)self patternSize];
      double v41 = v40;
      [(SXRepeatableImageFillView *)self patternSize];
      double v36 = -(v41 - fmod(height, v42));
    }
    else
    {
      double v36 = height - v16;
    }
  }
  else if (v13 == 1)
  {
    if (v10)
    {
      [(SXRepeatableImageFillView *)self patternSize];
      unint64_t v33 = vcvtmd_u64_f64(height / v32);
      double v34 = (double)(v33 + (v33 & 1) + 1);
      [(SXRepeatableImageFillView *)self patternSize];
      double v16 = v35 * v34;
    }
    double v36 = (height - v16) * 0.5;
  }
  else
  {
    double v36 = *(double *)(v20 + 8);
  }
  double v43 = v25;
  double v44 = v18;
  double v45 = v16;
  result.size.CGFloat height = v45;
  result.size.CGFloat width = v44;
  result.origin.y = v36;
  result.origin.x = v43;
  return result;
}

- (CGRect)contentFrame
{
  v2 = [(SXRepeatableImageFillView *)self clippingView];
  [v2 contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
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
  id v7 = [(SXRepeatableImageFillView *)self clippingView];
  objc_msgSend(v7, "setContentFrame:", x, y, width, height);
}

- (void)setPatternSize:(CGSize)a3
{
  p_patternSize = &self->_patternSize;
  if (self->_patternSize.width != a3.width || self->_patternSize.height != a3.height)
  {
    p_patternSize->double width = a3.width;
    self->_patternSize.double height = a3.height;
    double v6 = [(SXRepeatableImageFillView *)self imageView];
    id v7 = [v6 imageResource];
    [v7 dimensions];
    double v9 = v8;
    double v11 = v10;

    double width = p_patternSize->width;
    double height = p_patternSize->height;
    double v14 = v9 / fmax(v11, 1.0);
    if (p_patternSize->width >= 2.22044605e-16 || height <= 0.0)
    {
      if (width > 0.0 && height < 2.22044605e-16) {
        p_patternSize->double height = width / v14;
      }
    }
    else
    {
      p_patternSize->double width = v14 * height;
    }
    double v16 = [(SXRepeatableImageFillView *)self imageView];
    objc_msgSend(v16, "setPreferredImageSize:", p_patternSize->width, p_patternSize->height);

    [(SXRepeatableImageFillView *)self setNeedsLayout];
  }
}

- (void)play
{
  id v2 = [(SXRepeatableImageFillView *)self imageView];
  [v2 resume];
}

- (void)pause
{
  id v2 = [(SXRepeatableImageFillView *)self imageView];
  [v2 pause];
}

- (CGSize)patternSize
{
  double width = self->_patternSize.width;
  double height = self->_patternSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SXRepeatableImageView)imageView
{
  return self->_imageView;
}

- (SXClippingView)clippingView
{
  return self->_clippingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end