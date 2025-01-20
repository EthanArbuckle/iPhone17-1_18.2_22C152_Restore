@interface _UISelectionBandVisualProvider_iOS
- (BOOL)_isActive;
- (BOOL)enabled;
- (CGPoint)initialPoint;
- (UIPointerInteraction)ptrInteraction;
- (UIView)view;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)beginAtPoint:(CGPoint)a3;
- (void)endAtPoint:(CGPoint)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInitialPoint:(CGPoint)a3;
- (void)setPtrInteraction:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _UISelectionBandVisualProvider_iOS

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UISelectionBandVisualProvider_iOS *)self ptrInteraction];
  [v4 setEnabled:v3];
}

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    -[_UISelectionBandVisualProvider_iOS setInitialPoint:](self, "setInitialPoint:", 1.79769313e308, 1.79769313e308);
    v6 = [(_UISelectionBandVisualProvider_iOS *)self ptrInteraction];
    v7 = [v6 view];
    v8 = [(_UISelectionBandVisualProvider_iOS *)self ptrInteraction];
    [v7 removeInteraction:v8];

    id v9 = objc_storeWeak((id *)&self->_view, obj);
    v5 = obj;
    if (obj)
    {
      v10 = [(_UISelectionBandVisualProvider_iOS *)self ptrInteraction];

      if (!v10)
      {
        v11 = [[UIPointerInteraction alloc] initWithDelegate:self];
        [(_UISelectionBandVisualProvider_iOS *)self setPtrInteraction:v11];
      }
      id v12 = objc_loadWeakRetained((id *)&self->_view);
      v13 = [(_UISelectionBandVisualProvider_iOS *)self ptrInteraction];
      [v12 addInteraction:v13];

      v5 = obj;
    }
  }
}

- (UIPointerInteraction)ptrInteraction
{
  return self->_ptrInteraction;
}

- (void)setPtrInteraction:(id)a3
{
}

- (void)setInitialPoint:(CGPoint)a3
{
  self->_initialPoint = a3;
}

- (BOOL)enabled
{
  v2 = [(_UISelectionBandVisualProvider_iOS *)self ptrInteraction];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)beginAtPoint:(CGPoint)a3
{
  -[_UISelectionBandVisualProvider_iOS setInitialPoint:](self, "setInitialPoint:", a3.x, a3.y);
  id v4 = [(_UISelectionBandVisualProvider_iOS *)self ptrInteraction];
  [v4 invalidate];
}

- (void)endAtPoint:(CGPoint)a3
{
  -[_UISelectionBandVisualProvider_iOS setInitialPoint:](self, "setInitialPoint:", 1.79769313e308, 1.79769313e308);
  id v4 = [(_UISelectionBandVisualProvider_iOS *)self ptrInteraction];
  [v4 invalidate];
}

- (BOOL)_isActive
{
  [(_UISelectionBandVisualProvider_iOS *)self initialPoint];
  return v3 != 1.79769313e308 || v2 != 1.79769313e308;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a3;
  if ([(_UISelectionBandVisualProvider_iOS *)self _isActive])
  {
    v7 = [v6 view];
    [v7 bounds];
    v8 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", @"UIBandSelectionInteraction.band");

    [v8 setLatchingAxes:3];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  [(_UISelectionBandVisualProvider_iOS *)self initialPoint];
  id v4 = +[UIPointerShape _elasticRectShapePinnedAtPoint:](UIPointerShape, "_elasticRectShapePinnedAtPoint:");
  v5 = +[UIPointerStyle styleWithShape:v4 constrainedAxes:0];

  return v5;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (CGPoint)initialPoint
{
  double x = self->_initialPoint.x;
  double y = self->_initialPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ptrInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end