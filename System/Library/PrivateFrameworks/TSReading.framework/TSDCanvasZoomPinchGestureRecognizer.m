@interface TSDCanvasZoomPinchGestureRecognizer
- (void)p_cancelAfterDelay;
- (void)p_startCancellationTimer;
- (void)p_stopCancellationTimer;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TSDCanvasZoomPinchGestureRecognizer

- (void)reset
{
  [(TSDCanvasZoomPinchGestureRecognizer *)self p_stopCancellationTimer];
  self->mZoomTimedOut = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasZoomPinchGestureRecognizer;
  [(TSDCanvasZoomPinchGestureRecognizer *)&v3 reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (!self->mZoomTimedOut)
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDCanvasZoomPinchGestureRecognizer;
    [(TSDCanvasZoomPinchGestureRecognizer *)&v5 touchesBegan:a3 withEvent:a4];
    if ([(TSDCanvasZoomPinchGestureRecognizer *)self numberOfTouches] == 1) {
      [(TSDCanvasZoomPinchGestureRecognizer *)self p_startCancellationTimer];
    }
    else {
      [(TSDCanvasZoomPinchGestureRecognizer *)self p_stopCancellationTimer];
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (!self->mZoomTimedOut)
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDCanvasZoomPinchGestureRecognizer;
    [(TSDCanvasZoomPinchGestureRecognizer *)&v4 touchesMoved:a3 withEvent:a4];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasZoomPinchGestureRecognizer;
  [(TSDCanvasZoomPinchGestureRecognizer *)&v5 touchesEnded:a3 withEvent:a4];
  [(TSDCanvasZoomPinchGestureRecognizer *)self p_stopCancellationTimer];
  if (self->mZoomTimedOut) {
    [(TSDCanvasZoomPinchGestureRecognizer *)self setState:5];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasZoomPinchGestureRecognizer;
  [(TSDCanvasZoomPinchGestureRecognizer *)&v5 touchesCancelled:a3 withEvent:a4];
  [(TSDCanvasZoomPinchGestureRecognizer *)self p_stopCancellationTimer];
  if (self->mZoomTimedOut) {
    [(TSDCanvasZoomPinchGestureRecognizer *)self setState:5];
  }
}

- (void)p_startCancellationTimer
{
}

- (void)p_stopCancellationTimer
{
}

- (void)p_cancelAfterDelay
{
  self->mZoomTimedOut = 1;
}

@end