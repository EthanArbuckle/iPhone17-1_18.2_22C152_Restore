@interface ICCollapsibleImageView
- (UIColor)tintColor;
- (UIImage)image;
- (UIImageView)imageView;
- (void)performSetup;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation ICCollapsibleImageView

- (void)performSetup
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  [(ICCollapsibleImageView *)self frame];
  v4 = objc_msgSend(v3, "initWithFrame:");
  [(ICCollapsibleImageView *)self setImageView:v4];

  v5 = [(ICCollapsibleImageView *)self imageView];
  [(ICCollapsibleBaseView *)self performSetUpWithContentView:v5];

  v6 = [(ICCollapsibleImageView *)self tintColor];
  v7 = [(ICCollapsibleImageView *)self imageView];
  [v7 setTintColor:v6];

  id v9 = [(ICCollapsibleImageView *)self image];
  v8 = [(ICCollapsibleImageView *)self imageView];
  [v8 setImage:v9];
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  id v6 = [(ICCollapsibleImageView *)self imageView];
  [v6 setImage:v5];
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
  id v5 = a3;
  id v6 = [(ICCollapsibleImageView *)self imageView];
  [v6 setTintColor:v5];
}

- (UIImage)image
{
  return self->_image;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end