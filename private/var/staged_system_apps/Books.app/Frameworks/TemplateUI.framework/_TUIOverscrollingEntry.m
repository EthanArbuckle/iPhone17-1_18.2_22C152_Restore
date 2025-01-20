@interface _TUIOverscrollingEntry
- (CGPoint)defaultOrigin;
- (CGSize)defaultSize;
- (TUIOverscrollingLiveTransform)overscrollingLiveTransform;
- (double)currentScale;
- (double)defaultScale;
- (void)setCurrentScale:(double)a3;
- (void)setDefaultOrigin:(CGPoint)a3;
- (void)setDefaultScale:(double)a3;
- (void)setDefaultSize:(CGSize)a3;
- (void)setOverscrollingLiveTransform:(id)a3;
@end

@implementation _TUIOverscrollingEntry

- (TUIOverscrollingLiveTransform)overscrollingLiveTransform
{
  return self->_overscrollingLiveTransform;
}

- (void)setOverscrollingLiveTransform:(id)a3
{
}

- (double)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(double)a3
{
  self->_currentScale = a3;
}

- (CGPoint)defaultOrigin
{
  double x = self->_defaultOrigin.x;
  double y = self->_defaultOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDefaultOrigin:(CGPoint)a3
{
  self->_defaultOrigin = a3;
}

- (CGSize)defaultSize
{
  double width = self->_defaultSize.width;
  double height = self->_defaultSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDefaultSize:(CGSize)a3
{
  self->_defaultSize = a3;
}

- (double)defaultScale
{
  return self->_defaultScale;
}

- (void)setDefaultScale:(double)a3
{
  self->_defaultScale = a3;
}

- (void).cxx_destruct
{
}

@end