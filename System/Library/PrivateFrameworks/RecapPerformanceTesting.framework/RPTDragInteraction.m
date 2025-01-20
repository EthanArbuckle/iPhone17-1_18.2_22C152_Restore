@interface RPTDragInteraction
- (BOOL)_locationsAreAlreadyScreenSpace;
- (CGPoint)destinationLocation;
- (CGPoint)sourceLocation;
- (RPTCoordinateSpaceConverter)conversion;
- (id)_andThenDragBy:(CGVector)a3;
- (id)initByDraggingWindow:(id)a3 byDelta:(CGVector)a4;
- (id)initFromSourceLocation:(CGPoint)a3 toDestinationLocation:(CGPoint)a4;
- (id)interactionByScalingBy:(double)a3;
- (id)reversedInteraction;
- (void)invokeWithComposer:(id)a3 duration:(double)a4;
- (void)setConversion:(id)a3;
- (void)setDestinationLocation:(CGPoint)a3;
- (void)setSourceLocation:(CGPoint)a3;
- (void)set_locationsAreAlreadyScreenSpace:(BOOL)a3;
@end

@implementation RPTDragInteraction

- (id)initByDraggingWindow:(id)a3 byDelta:(CGVector)a4
{
  double dy = a4.dy;
  double dx = a4.dx;
  id v7 = a3;
  objc_msgSend(v7, "rpt_accessibilityActivationPointAttribute");
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v20.receiver = self;
  v20.super_class = (Class)RPTDragInteraction;
  v12 = [(RPTDragInteraction *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_sourceLocation.x = v9;
    v12->_sourceLocation.y = v11;
    uint64_t v14 = +[RPTCoordinateSpaceConverter converterFromWindow:v7];
    conversion = v13->_conversion;
    v13->_conversion = (RPTCoordinateSpaceConverter *)v14;

    -[RPTCoordinateSpaceConverter convertVector:](v13->_conversion, "convertVector:", dx, dy);
    CGFloat v18 = v17 + v13->_sourceLocation.y;
    v13->_destinationLocation.x = v16 + v13->_sourceLocation.x;
    v13->_destinationLocation.y = v18;
    v13->__locationsAreAlreadyScreenSpace = 1;
  }

  return v13;
}

- (id)initFromSourceLocation:(CGPoint)a3 toDestinationLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)RPTDragInteraction;
  double v8 = [(RPTDragInteraction *)&v13 init];
  CGFloat v9 = v8;
  if (v8)
  {
    v8->_sourceLocation.CGFloat x = v7;
    v8->_sourceLocation.CGFloat y = v6;
    v8->_destinationLocation.CGFloat x = x;
    v8->_destinationLocation.CGFloat y = y;
    uint64_t v10 = +[RPTCoordinateSpaceConverter identityConverter];
    conversion = v9->_conversion;
    v9->_conversion = (RPTCoordinateSpaceConverter *)v10;

    v9->__locationsAreAlreadyScreenSpace = 0;
  }
  return v9;
}

- (void)invokeWithComposer:(id)a3 duration:(double)a4
{
  id v16 = a3;
  if ([(RPTDragInteraction *)self _locationsAreAlreadyScreenSpace])
  {
    double x = self->_sourceLocation.x;
    double y = self->_sourceLocation.y;
  }
  else
  {
    double v8 = [(RPTDragInteraction *)self conversion];
    objc_msgSend(v8, "convertPoint:", self->_sourceLocation.x, self->_sourceLocation.y);
    double x = v9;
    double y = v10;
  }
  if ([(RPTDragInteraction *)self _locationsAreAlreadyScreenSpace])
  {
    double v11 = self->_destinationLocation.x;
    double v12 = self->_destinationLocation.y;
  }
  else
  {
    objc_super v13 = [(RPTDragInteraction *)self conversion];
    objc_msgSend(v13, "convertPoint:", self->_destinationLocation.x, self->_destinationLocation.y);
    double v11 = v14;
    double v12 = v15;
  }
  objc_msgSend(v16, "pointerMoveToPointIfApplicable:", x, y);
  objc_msgSend(v16, "pointerOrFingerTapDown:", x, y);
  objc_msgSend(v16, "pointerOrFingerMoveToPoint:duration:", v11, v12, a4);
  objc_msgSend(v16, "pointerOrFingerTapUp:", v11, v12);
}

- (id)reversedInteraction
{
  id v3 = -[RPTDragInteraction initFromSourceLocation:toDestinationLocation:]([RPTDragInteraction alloc], "initFromSourceLocation:toDestinationLocation:", self->_destinationLocation.x, self->_destinationLocation.y, self->_sourceLocation.x, self->_sourceLocation.y);
  objc_msgSend(v3, "set_locationsAreAlreadyScreenSpace:", -[RPTDragInteraction _locationsAreAlreadyScreenSpace](self, "_locationsAreAlreadyScreenSpace"));
  [v3 setConversion:self->_conversion];
  return v3;
}

- (id)interactionByScalingBy:(double)a3
{
  id v4 = -[RPTDragInteraction initFromSourceLocation:toDestinationLocation:]([RPTDragInteraction alloc], "initFromSourceLocation:toDestinationLocation:", self->_sourceLocation.x, self->_sourceLocation.y, vaddq_f64((float64x2_t)self->_sourceLocation, vmulq_n_f64(vsubq_f64((float64x2_t)self->_destinationLocation, (float64x2_t)self->_sourceLocation), a3)));
  objc_msgSend(v4, "set_locationsAreAlreadyScreenSpace:", -[RPTDragInteraction _locationsAreAlreadyScreenSpace](self, "_locationsAreAlreadyScreenSpace"));
  [v4 setConversion:self->_conversion];
  return v4;
}

- (id)_andThenDragBy:(CGVector)a3
{
  double dy = a3.dy;
  double dx = a3.dx;
  CGFloat v6 = [(RPTDragInteraction *)self conversion];
  objc_msgSend(v6, "convertVector:", dx, dy);
  double v8 = v7;
  double v10 = v9;

  id v11 = -[RPTDragInteraction initFromSourceLocation:toDestinationLocation:]([RPTDragInteraction alloc], "initFromSourceLocation:toDestinationLocation:", self->_destinationLocation.x, self->_destinationLocation.y, v8 + self->_destinationLocation.x, v10 + self->_destinationLocation.y);
  objc_msgSend(v11, "set_locationsAreAlreadyScreenSpace:", -[RPTDragInteraction _locationsAreAlreadyScreenSpace](self, "_locationsAreAlreadyScreenSpace"));
  [v11 setConversion:self->_conversion];
  return v11;
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
}

- (CGPoint)sourceLocation
{
  double x = self->_sourceLocation.x;
  double y = self->_sourceLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSourceLocation:(CGPoint)a3
{
  self->_sourceLocation = a3;
}

- (CGPoint)destinationLocation
{
  double x = self->_destinationLocation.x;
  double y = self->_destinationLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDestinationLocation:(CGPoint)a3
{
  self->_destinationLocation = a3;
}

- (BOOL)_locationsAreAlreadyScreenSpace
{
  return self->__locationsAreAlreadyScreenSpace;
}

- (void)set_locationsAreAlreadyScreenSpace:(BOOL)a3
{
  self->__locationsAreAlreadyScreenSpace = a3;
}

- (void).cxx_destruct
{
}

@end