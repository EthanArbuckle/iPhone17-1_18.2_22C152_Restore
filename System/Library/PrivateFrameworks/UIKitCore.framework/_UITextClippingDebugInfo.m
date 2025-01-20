@interface _UITextClippingDebugInfo
- (BOOL)bottomEdgeClipped;
- (BOOL)hasClippedEdges;
- (BOOL)ignoresResult;
- (BOOL)leftEdgeClipped;
- (BOOL)rightEdgeClipped;
- (BOOL)topEdgeClipped;
- (CGRect)visibleBounds;
- (UIView)clippingView;
- (_UITextClippingDebugInfo)initWithClippingView:(id)a3 visibleBounds:(CGRect)a4 ignoresResult:(BOOL)a5 edgesClipped:(unint64_t)a6;
- (unint64_t)edgesClipped;
- (void)setBottomEdgeClipped:(BOOL)a3;
- (void)setClippingView:(id)a3;
- (void)setEdgesClipped:(unint64_t)a3;
- (void)setIgnoresResult:(BOOL)a3;
- (void)setLeftEdgeClipped:(BOOL)a3;
- (void)setRightEdgeClipped:(BOOL)a3;
- (void)setTopEdgeClipped:(BOOL)a3;
- (void)setVisibleBounds:(CGRect)a3;
@end

@implementation _UITextClippingDebugInfo

- (_UITextClippingDebugInfo)initWithClippingView:(id)a3 visibleBounds:(CGRect)a4 ignoresResult:(BOOL)a5 edgesClipped:(unint64_t)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  objc_storeWeak((id *)&self->_clippingView, a3);
  self->_visibleBounds.origin.CGFloat x = x;
  self->_visibleBounds.origin.CGFloat y = y;
  self->_visibleBounds.size.CGFloat width = width;
  self->_visibleBounds.size.CGFloat height = height;
  self->_ignoresResult = a5;
  self->_edgesClipped = a6;
  return self;
}

- (BOOL)hasClippedEdges
{
  return self->_edgesClipped != 0;
}

- (BOOL)leftEdgeClipped
{
  return (LOBYTE(self->_edgesClipped) >> 1) & 1;
}

- (BOOL)rightEdgeClipped
{
  return (LOBYTE(self->_edgesClipped) >> 3) & 1;
}

- (BOOL)bottomEdgeClipped
{
  return (LOBYTE(self->_edgesClipped) >> 2) & 1;
}

- (BOOL)topEdgeClipped
{
  return self->_edgesClipped & 1;
}

- (UIView)clippingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clippingView);
  return (UIView *)WeakRetained;
}

- (void)setClippingView:(id)a3
{
}

- (CGRect)visibleBounds
{
  double x = self->_visibleBounds.origin.x;
  double y = self->_visibleBounds.origin.y;
  double width = self->_visibleBounds.size.width;
  double height = self->_visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisibleBounds:(CGRect)a3
{
  self->_visibleBounds = a3;
}

- (BOOL)ignoresResult
{
  return self->_ignoresResult;
}

- (void)setIgnoresResult:(BOOL)a3
{
  self->_ignoresResult = a3;
}

- (unint64_t)edgesClipped
{
  return self->_edgesClipped;
}

- (void)setEdgesClipped:(unint64_t)a3
{
  self->_edgesClipped = a3;
}

- (void)setLeftEdgeClipped:(BOOL)a3
{
  self->_leftEdgeClipped = a3;
}

- (void)setRightEdgeClipped:(BOOL)a3
{
  self->_rightEdgeClipped = a3;
}

- (void)setBottomEdgeClipped:(BOOL)a3
{
  self->_bottomEdgeClipped = a3;
}

- (void)setTopEdgeClipped:(BOOL)a3
{
  self->_topEdgeClipped = a3;
}

- (void).cxx_destruct
{
}

@end