@interface SKUIIPhoneSlideshowCell
- (BOOL)isVideo;
- (CGRect)imageFrame;
- (CGSize)imageSize;
- (SKUIIPhoneSlideshowCell)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setVideo:(BOOL)a3;
@end

@implementation SKUIIPhoneSlideshowCell

- (SKUIIPhoneSlideshowCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPhoneSlideshowCell initWithFrame:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIIPhoneSlideshowCell;
  v8 = -[SKUIIPhoneSlideshowCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v8->_imageView;
    v8->_imageView = v9;

    [(UIImageView *)v8->_imageView setContentMode:1];
    v11 = [(SKUIIPhoneSlideshowCell *)v8 contentView];
    [v11 addSubview:v8->_imageView];
  }
  return v8;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (CGRect)imageFrame
{
  [(UIImageView *)self->_imageView frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setImage:(id)a3
{
  id v6 = a3;
  id v4 = [(UIImageView *)self->_imageView image];

  double v5 = v6;
  if (v4 != v6)
  {
    [(UIImageView *)self->_imageView setImage:v6];
    [(SKUIIPhoneSlideshowCell *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    [(SKUIIPhoneSlideshowCell *)self setNeedsLayout];
  }
}

- (void)setVideo:(BOOL)a3
{
  playIcon = self->_playIcon;
  if ((((playIcon == 0) ^ a3) & 1) == 0)
  {
    BOOL v5 = a3;
    [(UIImageView *)playIcon removeFromSuperview];
    id v6 = self->_playIcon;
    self->_playIcon = 0;

    if (v5)
    {
      id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v7 = (void *)MEMORY[0x1E4FB1818];
      if ([(SKUIIPhoneSlideshowCell *)self isHighlighted]) {
        v8 = @"PlayControlPressed";
      }
      else {
        v8 = @"PlayControl";
      }
      v9 = [v7 imageNamed:v8 inBundle:v13];
      v10 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
      v11 = self->_playIcon;
      self->_playIcon = v10;

      v12 = [(SKUIIPhoneSlideshowCell *)self contentView];
      [v12 addSubview:self->_playIcon];

      [(SKUIIPhoneSlideshowCell *)self setNeedsLayout];
    }
  }
}

- (BOOL)isVideo
{
  return self->_playIcon != 0;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIIPhoneSlideshowCell;
  -[SKUIIPhoneSlideshowCell setHighlighted:](&v9, sel_setHighlighted_);
  if (self->_playIcon)
  {
    BOOL v5 = (void *)MEMORY[0x1E4FB1818];
    if (v3) {
      id v6 = @"PlayControlPressed";
    }
    else {
      id v6 = @"PlayControl";
    }
    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = [v5 imageNamed:v6 inBundle:v7];

    [(UIImageView *)self->_playIcon setImage:v8];
    [(SKUIIPhoneSlideshowCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SKUIIPhoneSlideshowCell;
  [(SKUIIPhoneSlideshowCell *)&v19 layoutSubviews];
  BOOL v3 = [(SKUIIPhoneSlideshowCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  imageView = self->_imageView;
  if (imageView)
  {
    double width = self->_imageSize.width;
    double height = self->_imageSize.height;
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      v12 = [(UIImageView *)imageView image];
      [v12 size];
      double width = v13;
      double height = v14;

      imageView = self->_imageView;
    }
    float v15 = (v5 - fmin(width, v5)) * 0.5;
    float v16 = (v7 - fmin(height, v7)) * 0.5;
    -[UIImageView setFrame:](imageView, "setFrame:", roundf(v15), roundf(v16));
  }
  playIcon = self->_playIcon;
  if (playIcon)
  {
    [(UIImageView *)playIcon sizeToFit];
    [(UIImageView *)self->_playIcon frame];
    v18 = self->_playIcon;
    [(SKUIIPhoneSlideshowCell *)self center];
    -[UIImageView setCenter:](v18, "setCenter:");
    [(SKUIIPhoneSlideshowCell *)self bringSubviewToFront:self->_playIcon];
  }
}

- (void)prepareForReuse
{
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playIcon, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIPhoneSlideshowCell initWithFrame:]";
}

@end