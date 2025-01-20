@interface UPQuiltView
- (BOOL)isAnimating;
- (CALayer)quiltImageLayer;
- (CGRect)landscapeWidgetRect;
- (CGRect)originalFrame;
- (CGRect)timeRect;
- (UPQuiltViewDelegate)quiltViewDelegate;
- (void)setLandscapeWidgetRect:(CGRect)a3;
- (void)setOriginalFrame:(CGRect)a3;
- (void)setQuiltImageLayer:(id)a3;
- (void)setQuiltViewDelegate:(id)a3;
- (void)setTimeRect:(CGRect)a3;
@end

@implementation UPQuiltView

- (UPQuiltViewDelegate)quiltViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quiltViewDelegate);
  return (UPQuiltViewDelegate *)WeakRetained;
}

- (void)setQuiltViewDelegate:(id)a3
{
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (CALayer)quiltImageLayer
{
  return self->_quiltImageLayer;
}

- (void)setQuiltImageLayer:(id)a3
{
}

- (CGRect)timeRect
{
  double x = self->_timeRect.origin.x;
  double y = self->_timeRect.origin.y;
  double width = self->_timeRect.size.width;
  double height = self->_timeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTimeRect:(CGRect)a3
{
  self->_timeRect = a3;
}

- (CGRect)landscapeWidgetRect
{
  double x = self->_landscapeWidgetRect.origin.x;
  double y = self->_landscapeWidgetRect.origin.y;
  double width = self->_landscapeWidgetRect.size.width;
  double height = self->_landscapeWidgetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLandscapeWidgetRect:(CGRect)a3
{
  self->_landscapeWidgetRect = a3;
}

- (CGRect)originalFrame
{
  double x = self->_originalFrame.origin.x;
  double y = self->_originalFrame.origin.y;
  double width = self->_originalFrame.size.width;
  double height = self->_originalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalFrame:(CGRect)a3
{
  self->_originalFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quiltImageLayer, 0);
  objc_destroyWeak((id *)&self->_quiltViewDelegate);
}

@end