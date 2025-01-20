@interface PBFPosterGalleryAsset
- (UIImage)image;
- (UIImage)keyFrameImage;
- (UIView)imageView;
- (UIViewController)liveViewController;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setKeyFrameImage:(id)a3;
- (void)setLiveViewController:(id)a3;
@end

@implementation PBFPosterGalleryAsset

- (UIImage)image
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_image);
  return (UIImage *)WeakRetained;
}

- (void)setImage:(id)a3
{
}

- (UIImage)keyFrameImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyFrameImage);
  return (UIImage *)WeakRetained;
}

- (void)setKeyFrameImage:(id)a3
{
}

- (UIView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  return (UIView *)WeakRetained;
}

- (void)setImageView:(id)a3
{
}

- (UIViewController)liveViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setLiveViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_liveViewController);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_keyFrameImage);
  objc_destroyWeak((id *)&self->_image);
}

@end