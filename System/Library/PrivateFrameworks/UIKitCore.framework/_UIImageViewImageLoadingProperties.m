@interface _UIImageViewImageLoadingProperties
- (BOOL)isEnqueueingLoad;
- (BOOL)isStartingLoad;
- (BOOL)isStoppingLoad;
- (UIImage)imageBeingSetByLoader;
- (UIView)placeholderView;
- (_UIImageLoader)imageLoader;
- (_UIImageViewLoadingDelegate)loadingDelegate;
- (void)setEnqueueingLoad:(BOOL)a3;
- (void)setImageBeingSetByLoader:(id)a3;
- (void)setImageLoader:(id)a3;
- (void)setLoadingDelegate:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setStartingLoad:(BOOL)a3;
- (void)setStoppingLoad:(BOOL)a3;
@end

@implementation _UIImageViewImageLoadingProperties

- (_UIImageLoader)imageLoader
{
  return self->_imageLoader;
}

- (void)setImageLoader:(id)a3
{
}

- (_UIImageViewLoadingDelegate)loadingDelegate
{
  return self->_loadingDelegate;
}

- (void)setLoadingDelegate:(id)a3
{
}

- (UIImage)imageBeingSetByLoader
{
  return self->_imageBeingSetByLoader;
}

- (void)setImageBeingSetByLoader:(id)a3
{
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
}

- (BOOL)isStartingLoad
{
  return self->_startingLoad;
}

- (void)setStartingLoad:(BOOL)a3
{
  self->_startingLoad = a3;
}

- (BOOL)isEnqueueingLoad
{
  return self->_enqueueingLoad;
}

- (void)setEnqueueingLoad:(BOOL)a3
{
  self->_enqueueingLoad = a3;
}

- (BOOL)isStoppingLoad
{
  return self->_stoppingLoad;
}

- (void)setStoppingLoad:(BOOL)a3
{
  self->_stoppingLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_imageBeingSetByLoader, 0);
  objc_storeStrong((id *)&self->_loadingDelegate, 0);
  objc_storeStrong((id *)&self->_imageLoader, 0);
}

@end