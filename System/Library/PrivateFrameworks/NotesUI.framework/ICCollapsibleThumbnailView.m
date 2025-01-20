@interface ICCollapsibleThumbnailView
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)showAsMovie;
- (ICImageAndMovieThumbnailView)thumbnailView;
- (UIImage)image;
- (unint64_t)imageScaling;
- (void)performSetup;
- (void)setImage:(id)a3;
- (void)setImageScaling:(unint64_t)a3;
- (void)setShowAsMovie:(BOOL)a3;
- (void)setThumbnailView:(id)a3;
@end

@implementation ICCollapsibleThumbnailView

- (void)performSetup
{
  v3 = [ICImageAndMovieThumbnailView alloc];
  [(ICCollapsibleThumbnailView *)self frame];
  v4 = -[ICImageAndMovieThumbnailView initWithFrame:showMovieDuration:](v3, "initWithFrame:showMovieDuration:", 0);
  [(ICCollapsibleThumbnailView *)self setThumbnailView:v4];

  v5 = [(ICCollapsibleThumbnailView *)self thumbnailView];
  [(ICCollapsibleBaseView *)self performSetUpWithContentView:v5];

  v6 = [(ICCollapsibleThumbnailView *)self image];
  v7 = [(ICCollapsibleThumbnailView *)self thumbnailView];
  [v7 setImage:v6];

  unint64_t v8 = [(ICCollapsibleThumbnailView *)self imageScaling];
  v9 = [(ICCollapsibleThumbnailView *)self thumbnailView];
  [v9 setImageScaling:v8];

  BOOL v10 = [(ICCollapsibleThumbnailView *)self showAsMovie];
  id v11 = [(ICCollapsibleThumbnailView *)self thumbnailView];
  [v11 setShowAsMovie:v10];
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  id v6 = [(ICCollapsibleThumbnailView *)self thumbnailView];
  [v6 setImage:v5];
}

- (void)setImageScaling:(unint64_t)a3
{
  self->_imageScaling = a3;
  id v4 = [(ICCollapsibleThumbnailView *)self thumbnailView];
  [v4 setImageScaling:a3];
}

- (void)setShowAsMovie:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showAsMovie = a3;
  id v4 = [(ICCollapsibleThumbnailView *)self thumbnailView];
  [v4 setShowAsMovie:v3];
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (UIImage)image
{
  return self->_image;
}

- (unint64_t)imageScaling
{
  return self->_imageScaling;
}

- (BOOL)showAsMovie
{
  return self->_showAsMovie;
}

- (ICImageAndMovieThumbnailView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end