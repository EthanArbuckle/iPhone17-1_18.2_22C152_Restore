@interface TSDGuidedPanController
- ($73314616FDF354EDC5180AB8A0BD2955)centerPlusMovementContentPlacement;
- ($73314616FDF354EDC5180AB8A0BD2955)touchContentPlacement;
- (CATransform3D)p_transformForContentLocation:(SEL)a3 placement:(id)a4;
- (CGPoint)movement;
- (CGPoint)p_boundsOffsetForContentLocation:(id)a3 placement:(id)a4;
- (CGPoint)startPoint;
- (CGPoint)velocity;
- (TSDCanvasLayer)canvasLayer;
- (TSDCanvasView)canvasView;
- (TSDGuidedPanController)initWithInteractiveCanvasController:(id)a3;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (TSDPanGuide)guide;
- (UIScrollView)canvasScrollView;
- (id)p_convertContentLocation:(id)a3 fromPlacement:(id)a4 toPlacement:(id)a5;
- (id)p_currentContentLocationWithPlacement:(id)a3;
- (void)dealloc;
- (void)handlePanGesture:(id)a3;
- (void)p_didEnd;
- (void)p_scrollToContentLocation:(id)a3 placement:(id)a4;
- (void)p_willBegin;
- (void)setCanvasLayer:(id)a3;
- (void)setCanvasScrollView:(id)a3;
- (void)setCanvasView:(id)a3;
- (void)setGuide:(id)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setMovement:(CGPoint)a3;
- (void)setStartPoint:(CGPoint)a3;
- (void)setVelocity:(CGPoint)a3;
@end

@implementation TSDGuidedPanController

- (TSDGuidedPanController)initWithInteractiveCanvasController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDGuidedPanController;
  v4 = [(TSDGuidedPanController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_interactiveCanvasController = (TSDInteractiveCanvasController *)a3;
    v4->_canvasView = (TSDCanvasView *)objc_msgSend((id)objc_msgSend(a3, "layerHost"), "canvasView");
    v5->_canvasLayer = (TSDCanvasLayer *)objc_msgSend((id)objc_msgSend(a3, "layerHost"), "canvasLayer");
    v5->_canvasScrollView = (UIScrollView *)[(TSDCanvasView *)v5->_canvasView enclosingScrollView];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDGuidedPanController;
  [(TSDGuidedPanController *)&v3 dealloc];
}

- (void)handlePanGesture:(id)a3
{
  objc_msgSend(a3, "translationInView:", -[TSDCanvasView superview](self->_canvasView, "superview"));
  self->_movement.x = v5;
  self->_movement.y = v6;
  objc_msgSend(a3, "velocityInView:", -[TSDCanvasView superview](self->_canvasView, "superview"));
  self->_velocity.x = v7;
  self->_velocity.y = v8;
  id v9 = -[TSDGuidedPanController p_currentContentLocationWithPlacement:](self, "p_currentContentLocationWithPlacement:", 0.5, 0.5);
  switch([a3 state])
  {
    case 1:
      [a3 locationInView:self->_canvasView];
      self->_startPoint.x = v10;
      self->_startPoint.y = v11;
      [(TSDGuidedPanController *)self p_willBegin];
      break;
    case 2:
      [(TSDGuidedPanController *)self touchContentPlacement];
      double v36 = v12;
      double v37 = v13;
      uint64_t v14 = -[TSDPanGuide contentLocationForMovement:velocity:placement:currentLocation:](self->_guide, "contentLocationForMovement:velocity:placement:currentLocation:", &v36, v9, self->_movement.x, self->_movement.y, self->_velocity.x, self->_velocity.y);
      if (v14)
      {
        -[TSDGuidedPanController p_transformForContentLocation:placement:](self, "p_transformForContentLocation:placement:", v14, v36, v37);
        canvasLayer = self->_canvasLayer;
        v35[4] = v35[12];
        v35[5] = v35[13];
        v35[6] = v35[14];
        v35[7] = v35[15];
        v35[0] = v35[8];
        v35[1] = v35[9];
        v35[2] = v35[10];
        v35[3] = v35[11];
        [(TSDCanvasLayer *)canvasLayer setTransform:v35];
        -[TSDPanGuide guidedPanDidPanWithContentLocation:](self->_guide, "guidedPanDidPanWithContentLocation:", -[TSDGuidedPanController p_currentContentLocationWithPlacement:](self, "p_currentContentLocationWithPlacement:", 0.5, 0.5));
      }
      else
      {
        v29 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v30 = [NSString stringWithUTF8String:"-[TSDGuidedPanController handlePanGesture:]"];
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGuidedPanController.m"), 100, @"invalid nil value for '%s'", "contentLocation");
      }
      break;
    case 3:
      v16 = self->_canvasLayer;
      long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
      v34[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      v34[5] = v17;
      long long v18 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      v34[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      v34[7] = v18;
      long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
      v34[0] = *MEMORY[0x263F15740];
      v34[1] = v19;
      long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      v34[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      v34[3] = v20;
      [(TSDCanvasLayer *)v16 setTransform:v34];
      uint64_t v21 = -[TSDPanGuide completionAnimationFromContentLocation:movement:velocity:](self->_guide, "completionAnimationFromContentLocation:movement:velocity:", v9, self->_movement.x, self->_movement.y, self->_velocity.x, self->_velocity.y);
      if (!v21)
      {
        -[TSDGuidedPanController p_scrollToContentLocation:placement:](self, "p_scrollToContentLocation:placement:", v9, 0.5, 0.5);
        goto LABEL_12;
      }
      v22 = (void *)v21;
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
      v23 = self->_canvasLayer;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __43__TSDGuidedPanController_handlePanGesture___block_invoke;
      v33[3] = &unk_2646B2228;
      v33[4] = self;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __43__TSDGuidedPanController_handlePanGesture___block_invoke_2;
      v32[3] = &unk_2646B2250;
      v32[4] = self;
      objc_msgSend(v22, "i_applyToLayer:withTransformBlock:completionBlock:", v23, v33, v32);
      break;
    case 4:
      v24 = self->_canvasLayer;
      long long v25 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
      v31[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      v31[5] = v25;
      long long v26 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      v31[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      v31[7] = v26;
      long long v27 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
      v31[0] = *MEMORY[0x263F15740];
      v31[1] = v27;
      long long v28 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      v31[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      v31[3] = v28;
      [(TSDCanvasLayer *)v24 setTransform:v31];
LABEL_12:
      [(TSDGuidedPanController *)self p_didEnd];
      break;
    default:
      return;
  }
}

double __43__TSDGuidedPanController_handlePanGesture___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  objc_super v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "p_transformForContentLocation:placement:", a2, 0.5, 0.5);
  }
  else
  {
    double result = 0.0;
    a3[6] = 0u;
    a3[7] = 0u;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t __43__TSDGuidedPanController_handlePanGesture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 40) guidedPanDidFinishCompletionAnimation];
  if ([*(id *)(*(void *)(a1 + 32) + 40) guidedPanShouldPreserveCompletionAnimationEndLocation])objc_msgSend(*(id *)(a1 + 32), "p_scrollToContentLocation:placement:", a2, 0.5, 0.5); {
  objc_msgSend(*(id *)(a1 + 32), "p_didEnd");
  }
  v4 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  return [v4 endIgnoringInteractionEvents];
}

- ($73314616FDF354EDC5180AB8A0BD2955)touchContentPlacement
{
  [(UIScrollView *)self->_canvasScrollView contentOffset];
  double v4 = TSDSubtractPoints(self->_startPoint.x, self->_startPoint.y, v3);
  double v6 = TSDAddPoints(v4, v5, self->_movement.x);
  double v8 = v7;
  [(UIScrollView *)self->_canvasScrollView bounds];
  double v10 = v6 / v9;
  uint64_t v11 = [(UIScrollView *)self->_canvasScrollView bounds];
  v14.n128_f64[0] = v10;

  v12.n128_f64[0] = v8 / v13;
  TSDContentPlacementWithAnchorPoint(v11, v14, v12);
  result.var0.y = v16;
  result.var0.x = v15;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)centerPlusMovementContentPlacement
{
  double x = self->_movement.x;
  double y = self->_movement.y;
  [(UIScrollView *)self->_canvasScrollView bounds];
  double v6 = x / v5;
  uint64_t v7 = [(UIScrollView *)self->_canvasScrollView bounds];

  v8.n128_f64[0] = v6 + 0.5;
  v9.n128_f64[0] = y / v10 + 0.5;
  TSDContentPlacementWithAnchorPoint(v7, v8, v9);
  result.var0.double y = v12;
  result.var0.double x = v11;
  return result;
}

- (id)p_currentContentLocationWithPlacement:(id)a3
{
  double y = a3.var0.y;
  double x = a3.var0.x;
  double v6 = (void *)[(UIScrollView *)self->_canvasScrollView layer];
  [(UIScrollView *)self->_canvasScrollView bounds];
  objc_msgSend(v6, "convertRect:toLayer:", self->_canvasLayer);
  double v8 = v7;
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:");
  double v10 = v9;
  double v12 = v11;
  [(UIScrollView *)self->_canvasScrollView bounds];
  double v14 = v13 / v8;
  [(TSDCanvasLayer *)self->_canvasLayer viewScale];
  double v16 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v10, v12, v15 * v14);

  return -[TSDGuidedPanController p_convertContentLocation:fromPlacement:toPlacement:](self, "p_convertContentLocation:fromPlacement:toPlacement:", v16, 0.0, 0.0, x, y);
}

- (CGPoint)p_boundsOffsetForContentLocation:(id)a3 placement:(id)a4
{
  double y = a4.var0.y;
  double x = a4.var0.x;
  interactiveCanvasController = self->_interactiveCanvasController;
  [a3 unscaledPoint];
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](interactiveCanvasController, "convertUnscaledToBoundsPoint:");
  double v9 = v8;
  double v11 = v10;
  [(UIScrollView *)self->_canvasScrollView contentOffset];
  double v13 = TSDSubtractPoints(v9, v11, v12);
  double v15 = v14;
  [(UIScrollView *)self->_canvasScrollView bounds];
  double v17 = v13 - v16 * x;
  [(UIScrollView *)self->_canvasScrollView bounds];
  double v19 = v15 - v18 * y;
  double v20 = v17;
  result.double y = v19;
  result.double x = v20;
  return result;
}

- (CATransform3D)p_transformForContentLocation:(SEL)a3 placement:(id)a4
{
  [(TSDGuidedPanController *)self p_boundsOffsetForContentLocation:a5.var0.x placement:a5.var0.y];
  double v9 = v8;
  double v11 = v10;
  interactiveCanvasController = self->_interactiveCanvasController;
  [a4 unscaledPoint];
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](interactiveCanvasController, "convertUnscaledToBoundsPoint:");
  double v14 = v13;
  double v16 = v15;
  [a4 viewScale];
  double v18 = v17;
  [(TSDCanvasLayer *)self->_canvasLayer viewScale];
  CGPoint result = (CATransform3D *)self->_canvasLayer;
  if (result)
  {
    double v21 = v18 / v19;
    return (CATransform3D *)-[CATransform3D transformToScale:aroundBoundsPoint:afterOffset:](result, "transformToScale:aroundBoundsPoint:afterOffset:", v21, v14, v16, -v9, -v11);
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }
  return result;
}

- (void)p_scrollToContentLocation:(id)a3 placement:(id)a4
{
  if (a3)
  {
    id v5 = -[TSDGuidedPanController p_convertContentLocation:fromPlacement:toPlacement:](self, "p_convertContentLocation:fromPlacement:toPlacement:", a4.var0.x, a4.var0.y, 0.0, 0.0);
    interactiveCanvasController = self->_interactiveCanvasController;
    [v5 viewScale];
    double v8 = v7;
    [v5 unscaledPoint];
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](interactiveCanvasController, "setViewScale:contentOffset:clampOffset:animated:", 1, 0, v8, v9, v10);
  }
  else
  {
    double v11 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a4.var0.x, a4.var0.y);
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDGuidedPanController p_scrollToContentLocation:placement:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGuidedPanController.m"), 239, @"invalid nil value for '%s'", "contentLocation");
  }
}

- (id)p_convertContentLocation:(id)a3 fromPlacement:(id)a4 toPlacement:(id)a5
{
  return -[TSDInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](self->_interactiveCanvasController, "convertContentLocation:fromPlacement:toPlacement:", a3, a4.var0.x, a4.var0.y, a5.var0.x, a5.var0.y);
}

- (void)p_willBegin
{
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:", self->_startPoint.x, self->_startPoint.y);
  double v4 = v3;
  double v6 = v5;
  id v7 = -[TSDGuidedPanController p_currentContentLocationWithPlacement:](self, "p_currentContentLocationWithPlacement:", 0.5, 0.5);
  guide = self->_guide;
  [v7 unscaledPoint];

  -[TSDPanGuide guidedPanWillBeginAtPoint:withCenterPoint:](guide, "guidedPanWillBeginAtPoint:withCenterPoint:", v4, v6, v9, v10);
}

- (void)p_didEnd
{
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  self->_interactiveCanvasController = (TSDInteractiveCanvasController *)a3;
}

- (TSDCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
  self->_canvasView = (TSDCanvasView *)a3;
}

- (TSDCanvasLayer)canvasLayer
{
  return self->_canvasLayer;
}

- (void)setCanvasLayer:(id)a3
{
  self->_canvasLayer = (TSDCanvasLayer *)a3;
}

- (UIScrollView)canvasScrollView
{
  return self->_canvasScrollView;
}

- (void)setCanvasScrollView:(id)a3
{
  self->_canvasScrollView = (UIScrollView *)a3;
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
}

- (CGPoint)movement
{
  double x = self->_movement.x;
  double y = self->_movement.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMovement:(CGPoint)a3
{
  self->_movement = a3;
}

- (CGPoint)velocity
{
  double x = self->_velocity.x;
  double y = self->_velocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setVelocity:(CGPoint)a3
{
  self->_velocitdouble y = a3;
}

- (TSDPanGuide)guide
{
  return self->_guide;
}

- (void)setGuide:(id)a3
{
}

@end