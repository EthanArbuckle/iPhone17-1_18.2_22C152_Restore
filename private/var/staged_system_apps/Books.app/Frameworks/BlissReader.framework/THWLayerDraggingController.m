@interface THWLayerDraggingController
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)handleGesture:(id)a3;
- (BOOL)shouldDragTargetLayer;
- (CALayer)layer;
- (CALayer)wrapperLayer;
- (THWLayerDraggingController)initWithLayer:(id)a3 hostView:(id)a4 gesture:(id)a5 anchorPoint:(CGPoint)a6 delegate:(id)a7;
- (THWLayerDraggingDelegate)delegate;
- (UIView)hostView;
- (UIView)wrapperView;
- (void)dealloc;
- (void)p_didBeginWithPosition:(CGPoint)a3 boundsPosition:(CGPoint)a4;
- (void)p_didEndWithPosition:(CGPoint)a3;
- (void)p_dragLayerToPosition:(CGPoint)a3 boundsPosition:(CGPoint)a4;
- (void)setDelegate:(id)a3;
- (void)setShouldDragTargetLayer:(BOOL)a3;
- (void)setWrapperView:(id)a3;
- (void)teardown;
@end

@implementation THWLayerDraggingController

- (THWLayerDraggingController)initWithLayer:(id)a3 hostView:(id)a4 gesture:(id)a5 anchorPoint:(CGPoint)a6 delegate:(id)a7
{
  if (a3)
  {
    if (a7) {
      goto LABEL_3;
    }
  }
  else
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWLayerDraggingController initWithLayer:hostView:gesture:anchorPoint:delegate:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWLayerDraggingController.m"] lineNumber:43 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "layer"]];
    if (a7) {
      goto LABEL_3;
    }
  }
  [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWLayerDraggingController initWithLayer:hostView:gesture:anchorPoint:delegate:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWLayerDraggingController.m"] lineNumber:44 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"delegate"];
LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)THWLayerDraggingController;
  v12 = [(THWLayerDraggingController *)&v29 init];
  v13 = v12;
  if (v12)
  {
    v12->_delegate = (THWLayerDraggingDelegate *)a7;
    v12->_hostView = (UIView *)a4;
    v13->_layer = (CALayer *)a3;
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(CALayer *)v13->_layer bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v13->_wrapperLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    [(CALayer *)v13->_wrapperLayer setDelegate:[(CALayer *)v13->_layer delegate]];
    -[CALayer setBounds:](v13->_wrapperLayer, "setBounds:", v15, v17, v19, v21);
    -[CALayer setAnchorPoint:](v13->_wrapperLayer, "setAnchorPoint:", 0.5, 0.5);
    [(CALayer *)v13->_wrapperLayer addSublayer:v13->_layer];
    [(CALayer *)v13->_wrapperLayer frame];
    wrapperView = v13->_wrapperView;
    if (!wrapperView)
    {
      TSDRectWithSize();
      wrapperView = [objc_alloc((Class)UIView) initWithFrame:v23, v24, v25, v26];
      v13->_wrapperView = wrapperView;
    }
    [(CALayer *)[(UIView *)wrapperView layer] addSublayer:v13->_wrapperLayer];
    [(CALayer *)[(UIView *)v13->_wrapperView layer] setZPosition:5.0];
    [(UIView *)v13->_hostView addSubview:v13->_wrapperView];
    delegate = v13->_delegate;
    [(THWLayerDraggingDelegate *)delegate layerDragging:v13 naturalPositionWithGesture:a5];
    -[THWLayerDraggingDelegate layerDragging:convertNaturalPointToBounds:](delegate, "layerDragging:convertNaturalPointToBounds:", v13);
    TSDRoundedPoint();
    -[CALayer setPosition:](v13->_wrapperLayer, "setPosition:");
    -[CALayer setAnchorPoint:](v13->_layer, "setAnchorPoint:", 0.5, 0.5);
    TSDRoundedPoint();
    -[CALayer setPosition:](v13->_layer, "setPosition:");
    +[CATransaction commit];
    +[CATransaction flush];
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWLayerDraggingController;
  [(THWLayerDraggingController *)&v3 dealloc];
}

- (void)teardown
{
}

- (void)p_dragLayerToPosition:(CGPoint)a3 boundsPosition:(CGPoint)a4
{
  +[CATransaction begin];
  +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
  TSDRoundedPoint();
  -[CALayer setPosition:](self->_wrapperLayer, "setPosition:");

  +[CATransaction commit];
}

- (BOOL)canHandleGesture:(id)a3
{
  id v3 = [a3 gestureKind];
  return v3 == (id)TSWPImmediatePress;
}

- (BOOL)handleGesture:(id)a3
{
  [(THWLayerDraggingDelegate *)self->_delegate layerDragging:self naturalPositionWithGesture:a3];
  double v6 = v5;
  double v8 = v7;
  -[THWLayerDraggingDelegate layerDragging:convertNaturalPointToBounds:](self->_delegate, "layerDragging:convertNaturalPointToBounds:", self);
  double v10 = v9;
  double v12 = v11;
  id v13 = [a3 gestureKind];
  id v14 = (id)TSWPImmediatePress;
  if (v13 == (id)TSWPImmediatePress)
  {
    switch([a3 gestureState])
    {
      case 1u:
        -[THWLayerDraggingController p_didBeginWithPosition:boundsPosition:](self, "p_didBeginWithPosition:boundsPosition:", v6, v8, v10, v12);
        goto LABEL_6;
      case 2u:
        -[THWLayerDraggingDelegate layerDraggingDidMove:withPosition:](self->_delegate, "layerDraggingDidMove:withPosition:", self, v6, v8);
LABEL_6:
        -[THWLayerDraggingController p_dragLayerToPosition:boundsPosition:](self, "p_dragLayerToPosition:boundsPosition:", v6, v8, v10, v12);
        break;
      case 3u:
      case 4u:
      case 5u:
        -[THWLayerDraggingController p_didEndWithPosition:](self, "p_didEndWithPosition:", v6, v8);
        break;
      default:
        return v13 == v14;
    }
  }
  return v13 == v14;
}

- (void)p_didBeginWithPosition:(CGPoint)a3 boundsPosition:(CGPoint)a4
{
}

- (void)p_didEndWithPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = self;
  delegate = self->_delegate;

  -[THWLayerDraggingDelegate layerDraggingDidEnd:withPosition:](delegate, "layerDraggingDidEnd:withPosition:", self, x, y);
}

- (CALayer)layer
{
  return self->_layer;
}

- (CALayer)wrapperLayer
{
  return self->_wrapperLayer;
}

- (UIView)hostView
{
  return self->_hostView;
}

- (THWLayerDraggingDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWLayerDraggingDelegate *)a3;
}

- (BOOL)shouldDragTargetLayer
{
  return self->_shouldDragTargetLayer;
}

- (void)setShouldDragTargetLayer:(BOOL)a3
{
  self->_shouldDragTargetLayer = a3;
}

- (UIView)wrapperView
{
  return self->_wrapperView;
}

- (void)setWrapperView:(id)a3
{
}

@end