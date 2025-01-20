@interface _UIZoomEdgeFeedbackGenerator
- (_UIZoomEdgeFeedbackGenerator)init;
- (_UIZoomEdgeFeedbackGenerator)initWithView:(id)a3;
- (double)maximumTemporaryZoomScale;
- (double)maximumZoomScale;
- (double)minimumTemporaryZoomScale;
- (double)minimumZoomScale;
- (void)_updateMaximumValue;
- (void)_zoomScaleUpdated:(double)a3 withVelocity:(double)a4 atLocation:(CGPoint)a5;
- (void)setMaximumTemporaryZoomScale:(double)a3;
- (void)setMaximumZoomScale:(double)a3;
- (void)setMinimumTemporaryZoomScale:(double)a3;
- (void)setMinimumZoomScale:(double)a3;
- (void)zoomScaleUpdated:(double)a3;
- (void)zoomScaleUpdated:(double)a3 atLocation:(CGPoint)a4;
@end

@implementation _UIZoomEdgeFeedbackGenerator

- (_UIZoomEdgeFeedbackGenerator)init
{
  v3 = +[_UIEdgeFeedbackGeneratorConfiguration _zoomConfiguration];
  v4 = [(_UIEdgeFeedbackGenerator *)self initWithConfiguration:v3 view:0];

  return v4;
}

- (_UIZoomEdgeFeedbackGenerator)initWithView:(id)a3
{
  id v4 = a3;
  v5 = +[_UIEdgeFeedbackGeneratorConfiguration _zoomConfiguration];
  v6 = [(_UIEdgeFeedbackGenerator *)self initWithConfiguration:v5 view:v4];

  return v6;
}

- (void)_updateMaximumValue
{
  double v3 = log(self->_maximumZoomScale / self->_minimumZoomScale);
  [(_UIEdgeFeedbackGenerator *)self setDistance:v3];
}

- (void)setMinimumZoomScale:(double)a3
{
  if (self->_minimumZoomScale != a3)
  {
    self->_minimumZoomScale = a3;
    [(_UIZoomEdgeFeedbackGenerator *)self _updateMaximumValue];
  }
}

- (void)setMaximumZoomScale:(double)a3
{
  if (self->_maximumZoomScale != a3)
  {
    self->_maximumZoomScale = a3;
    [(_UIZoomEdgeFeedbackGenerator *)self _updateMaximumValue];
  }
}

- (void)zoomScaleUpdated:(double)a3 atLocation:(CGPoint)a4
{
}

- (void)zoomScaleUpdated:(double)a3
{
}

- (void)_zoomScaleUpdated:(double)a3 withVelocity:(double)a4 atLocation:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  if ([(UIFeedbackGenerator *)self _isEnabled] && [(_UIEdgeFeedbackGenerator *)self _state])
  {
    double minimumZoomScale = self->_minimumZoomScale;
    double v11 = log(a3 / minimumZoomScale);
    if (minimumZoomScale <= a3) {
      double v12 = -log(self->_minimumTemporaryZoomScale / minimumZoomScale);
    }
    else {
      double v12 = log(self->_maximumTemporaryZoomScale / self->_maximumZoomScale);
    }
    [(_UIEdgeFeedbackGenerator *)self setExtentBeyondDistance:v12];
    if (a4 == 0.0)
    {
      -[_UIEdgeFeedbackGenerator positionUpdated:atLocation:](self, "positionUpdated:atLocation:", v11, x, y);
    }
    else
    {
      -[_UIEdgeFeedbackGenerator _positionUpdated:withVelocity:atLocation:](self, "_positionUpdated:withVelocity:atLocation:", v11, a4, x, y);
    }
  }
}

- (double)minimumZoomScale
{
  return self->_minimumZoomScale;
}

- (double)maximumZoomScale
{
  return self->_maximumZoomScale;
}

- (double)minimumTemporaryZoomScale
{
  return self->_minimumTemporaryZoomScale;
}

- (void)setMinimumTemporaryZoomScale:(double)a3
{
  self->_minimumTemporaryZoomScale = a3;
}

- (double)maximumTemporaryZoomScale
{
  return self->_maximumTemporaryZoomScale;
}

- (void)setMaximumTemporaryZoomScale:(double)a3
{
  self->_maximumTemporaryZoomScale = a3;
}

@end