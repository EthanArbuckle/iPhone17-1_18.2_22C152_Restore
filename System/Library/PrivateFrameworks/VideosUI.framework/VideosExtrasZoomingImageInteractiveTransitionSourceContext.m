@interface VideosExtrasZoomingImageInteractiveTransitionSourceContext
- (NSString)identifier;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (unint64_t)itemIndex;
- (unint64_t)supportedZoomingImageTransitionDirections;
- (void)setIdentifier:(id)a3;
- (void)setItemIndex:(unint64_t)a3;
- (void)setPinchGestureRecognizer:(id)a3;
- (void)setSupportedZoomingImageTransitionDirections:(unint64_t)a3;
@end

@implementation VideosExtrasZoomingImageInteractiveTransitionSourceContext

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndex = a3;
}

- (unint64_t)supportedZoomingImageTransitionDirections
{
  return self->_supportedZoomingImageTransitionDirections;
}

- (void)setSupportedZoomingImageTransitionDirections:(unint64_t)a3
{
  self->_supportedZoomingImageTransitionDirections = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
}

@end