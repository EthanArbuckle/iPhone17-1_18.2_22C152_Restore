@interface THWKeynoteShowRepAccessibilityElement
- (CALayer)showLayer;
- (CGRect)accessibilityFrame;
- (CGRect)frameInShowLayer;
- (void)setFrameInShowLayer:(CGRect)a3;
- (void)setShowLayer:(id)a3;
@end

@implementation THWKeynoteShowRepAccessibilityElement

- (CGRect)accessibilityFrame
{
  v3 = [(THWKeynoteShowRepAccessibilityElement *)self showLayer];
  [(THWKeynoteShowRepAccessibilityElement *)self frameInShowLayer];
  [v3 convertRect:0 toLayer:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)frameInShowLayer
{
  double x = self->_frameInShowLayer.origin.x;
  double y = self->_frameInShowLayer.origin.y;
  double width = self->_frameInShowLayer.size.width;
  double height = self->_frameInShowLayer.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameInShowLayer:(CGRect)a3
{
  self->_frameInShowLayer = a3;
}

- (CALayer)showLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showLayer);

  return (CALayer *)WeakRetained;
}

- (void)setShowLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end