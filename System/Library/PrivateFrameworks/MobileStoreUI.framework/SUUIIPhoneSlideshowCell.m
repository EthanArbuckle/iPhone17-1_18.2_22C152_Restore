@interface SUUIIPhoneSlideshowCell
- (BOOL)isVideo;
- (CGRect)imageFrame;
- (CGSize)imageSize;
- (SUUIIPhoneSlideshowCell)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setVideo:(BOOL)a3;
@end

@implementation SUUIIPhoneSlideshowCell

- (SUUIIPhoneSlideshowCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIIPhoneSlideshowCell;
  v3 = -[SUUIIPhoneSlideshowCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(UIImageView *)v3->_imageView setContentMode:1];
    v6 = [(SUUIIPhoneSlideshowCell *)v3 contentView];
    [v6 addSubview:v3->_imageView];
  }
  return v3;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (CGRect)imageFrame
{
  [(UIImageView *)self->_imageView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
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
    [(SUUIIPhoneSlideshowCell *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    [(SUUIIPhoneSlideshowCell *)self setNeedsLayout];
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
      id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = (void *)MEMORY[0x263F827E8];
      if ([(SUUIIPhoneSlideshowCell *)self isHighlighted]) {
        objc_super v8 = @"PlayControlPressed";
      }
      else {
        objc_super v8 = @"PlayControl";
      }
      v9 = [v7 imageNamed:v8 inBundle:v13];
      v10 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v9];
      v11 = self->_playIcon;
      self->_playIcon = v10;

      v12 = [(SUUIIPhoneSlideshowCell *)self contentView];
      [v12 addSubview:self->_playIcon];

      [(SUUIIPhoneSlideshowCell *)self setNeedsLayout];
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
  v9.super_class = (Class)SUUIIPhoneSlideshowCell;
  -[SUUIIPhoneSlideshowCell setHighlighted:](&v9, sel_setHighlighted_);
  if (self->_playIcon)
  {
    BOOL v5 = (void *)MEMORY[0x263F827E8];
    if (v3) {
      id v6 = @"PlayControlPressed";
    }
    else {
      id v6 = @"PlayControl";
    }
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v8 = [v5 imageNamed:v6 inBundle:v7];

    [(UIImageView *)self->_playIcon setImage:v8];
    [(SUUIIPhoneSlideshowCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SUUIIPhoneSlideshowCell;
  [(SUUIIPhoneSlideshowCell *)&v19 layoutSubviews];
  BOOL v3 = [(SUUIIPhoneSlideshowCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  imageView = self->_imageView;
  if (imageView)
  {
    double width = self->_imageSize.width;
    double height = self->_imageSize.height;
    if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
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
    [(SUUIIPhoneSlideshowCell *)self center];
    -[UIImageView setCenter:](v18, "setCenter:");
    [(SUUIIPhoneSlideshowCell *)self bringSubviewToFront:self->_playIcon];
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

@end