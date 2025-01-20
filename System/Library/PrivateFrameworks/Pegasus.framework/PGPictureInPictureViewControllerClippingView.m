@interface PGPictureInPictureViewControllerClippingView
- (BOOL)ignoreCornerRadiusUpdates;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)setIgnoreCornerRadiusUpdates:(BOOL)a3;
@end

@implementation PGPictureInPictureViewControllerClippingView

- (void)_setContinuousCornerRadius:(double)a3
{
  if (!self->_ignoreCornerRadiusUpdates)
  {
    v3.receiver = self;
    v3.super_class = (Class)PGPictureInPictureViewControllerClippingView;
    [(PGPictureInPictureViewControllerClippingView *)&v3 _setContinuousCornerRadius:a3];
  }
}

- (BOOL)ignoreCornerRadiusUpdates
{
  return self->_ignoreCornerRadiusUpdates;
}

- (void)setIgnoreCornerRadiusUpdates:(BOOL)a3
{
  self->_ignoreCornerRadiusUpdates = a3;
}

@end