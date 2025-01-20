@interface PXUIAutoScroller
- (BOOL)autoscrollWithOffset:(CGPoint)a3;
- (CADisplayLink)displayLink;
- (CGRect)visibleRectForScrollView:(id)a3;
- (void)_handleDisplayLink:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)startRepeating;
- (void)stopRepeating;
- (void)updateWithGestureRecognizer:(id)a3;
@end

@implementation PXUIAutoScroller

- (void).cxx_destruct
{
}

- (void)setDisplayLink:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)updateWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v9 = [v4 view];
  [v4 locationInView:v9];
  double v6 = v5;
  double v8 = v7;

  -[PXAutoScroller updateWithUserInteractionLocation:inCoordinateSpace:](self, "updateWithUserInteractionLocation:inCoordinateSpace:", v9, v6, v8);
}

- (BOOL)autoscrollWithOffset:(CGPoint)a3
{
}

- (void)stopRepeating
{
  id v3 = [(PXUIAutoScroller *)self displayLink];
  [v3 setPaused:1];
  [v3 invalidate];
  [(PXUIAutoScroller *)self setDisplayLink:0];
}

- (void)_handleDisplayLink:(id)a3
{
  [a3 timestamp];
  -[PXAutoScroller updateWithTimestamp:](self, "updateWithTimestamp:");
}

- (void)startRepeating
{
  id v4 = [(PXUIAutoScroller *)self displayLink];

  if (v4)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXUIAutoScroller.m" lineNumber:36 description:@"display link already exists"];
  }
  objc_msgSend(MEMORY[0x1E4F39B68], "px_displayLinkWithWeakTarget:selector:", self, sel__handleDisplayLink_);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ([off_1E5DA6208 highFramerateRequiresReasonAndRange])
  {
    [v7 setHighFrameRateReason:2228225];
    PXFrameRateRangeTypeGetCAFrameRateRange();
  }
  [v7 setPaused:0];
  double v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v7 addToRunLoop:v5 forMode:*MEMORY[0x1E4F1C4B0]];

  [(PXUIAutoScroller *)self setDisplayLink:v7];
}

- (CGRect)visibleRectForScrollView:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v5 + v15;
  double v21 = v7 + v13;
  double v22 = v9 - (v15 + v19);
  double v23 = v11 - (v13 + v17);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

@end