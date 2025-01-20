@interface PXRelaxedScreenEdgePanGestureRecognizer
- (PXRelaxedScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UIEdgeInsets)edgeAllowances;
- (double)minAngleToEdge;
- (double)translationDistanceInView:(id)a3;
- (unint64_t)edges;
- (unint64_t)trackingEdge;
- (void)setEdgeAllowances:(UIEdgeInsets)a3;
- (void)setEdges:(unint64_t)a3;
- (void)setMinAngleToEdge:(double)a3;
- (void)setTrackingEdge:(unint64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PXRelaxedScreenEdgePanGestureRecognizer

- (void)setMinAngleToEdge:(double)a3
{
  self->_minAngleToEdge = a3;
}

- (PXRelaxedScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PXRelaxedScreenEdgePanGestureRecognizer;
  if ([(PXRelaxedScreenEdgePanGestureRecognizer *)&v5 initWithTarget:a3 action:a4]) {
    PXEdgeInsetsMake();
  }
  return 0;
}

- (void)setTrackingEdge:(unint64_t)a3
{
  self->_trackingEdge = a3;
}

- (unint64_t)trackingEdge
{
  return self->_trackingEdge;
}

- (double)minAngleToEdge
{
  return self->_minAngleToEdge;
}

- (void)setEdgeAllowances:(UIEdgeInsets)a3
{
  self->_edgeAllowances = a3;
}

- (UIEdgeInsets)edgeAllowances
{
  double top = self->_edgeAllowances.top;
  double left = self->_edgeAllowances.left;
  double bottom = self->_edgeAllowances.bottom;
  double right = self->_edgeAllowances.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
}

- (unint64_t)edges
{
  return self->_edges;
}

- (double)translationDistanceInView:(id)a3
{
  [(PXRelaxedScreenEdgePanGestureRecognizer *)self translationInView:a3];
  return hypot(v3, v4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(PXRelaxedScreenEdgePanGestureRecognizer *)self state])
  {
    id v21 = v7;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v14 = [(PXRelaxedScreenEdgePanGestureRecognizer *)self view];
          [v13 locationInView:v14];
          double v16 = v15;
          double v18 = v17;

          double v19 = v16 - self->_initialTouchLocation.x;
          double v20 = v18 - self->_initialTouchLocation.y;
          if (hypot(v19, v20) > 0.0)
          {
            MEMORY[0x1AD10AEE0](v20, v19);
            PXRadiansToDegrees();
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    id v7 = v21;
  }
  v22.receiver = self;
  v22.super_class = (Class)PXRelaxedScreenEdgePanGestureRecognizer;
  [(PXRelaxedScreenEdgePanGestureRecognizer *)&v22 touchesMoved:v6 withEvent:v7];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXRelaxedScreenEdgePanGestureRecognizer *)self view];
  uint64_t v9 = [v8 window];
  [v9 screen];
  objc_claimAutoreleasedReturnValue();

  [(PXRelaxedScreenEdgePanGestureRecognizer *)self edgeAllowances];
  [(PXRelaxedScreenEdgePanGestureRecognizer *)self edges];
  PXEdgeInsetsForEdges();
}

@end