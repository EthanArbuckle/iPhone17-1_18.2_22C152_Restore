@interface RPTResizeInteraction
- (BOOL)shouldLift;
- (BOOL)shouldPress;
- (CGPoint)dragPoint;
- (CGSize)finalSize;
- (CGSize)initialSize;
- (CGVector)delta;
- (RPTCoordinateSpaceConverter)conversion;
- (RPTResizeInteraction)initWithDragPoint:(CGPoint)a3 delta:(CGVector)a4 sourceSize:(CGSize)a5;
- (RPTResizeInteraction)initWithDragPoint:(CGPoint)a3 sourceSize:(CGSize)a4 destinationSize:(CGSize)a5;
- (RPTResizeInteraction)initWithWindow:(id)a3 destinationSize:(CGSize)a4;
- (id)interactionByScalingBy:(double)a3;
- (id)reversedInteraction;
- (void)invokeWithComposer:(id)a3 duration:(double)a4;
- (void)setConversion:(id)a3;
- (void)setDelta:(CGVector)a3;
- (void)setDragPoint:(CGPoint)a3;
- (void)setShouldLift:(BOOL)a3;
- (void)setShouldPress:(BOOL)a3;
@end

@implementation RPTResizeInteraction

- (RPTResizeInteraction)initWithDragPoint:(CGPoint)a3 sourceSize:(CGSize)a4 destinationSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)RPTResizeInteraction;
  v11 = [(RPTResizeInteraction *)&v15 init];
  if (v11)
  {
    uint64_t v12 = +[RPTCoordinateSpaceConverter identityConverter];
    conversion = v11->_conversion;
    v11->_conversion = (RPTCoordinateSpaceConverter *)v12;

    v11->_dragPoint.CGFloat x = x;
    v11->_dragPoint.CGFloat y = y;
    v11->_initialSize.double width = v8;
    v11->_initialSize.double height = v7;
    v11->_finalSize.double width = width;
    v11->_finalSize.double height = height;
    v11->_delta.dCGFloat x = width - v8;
    v11->_delta.dCGFloat y = height - v7;
    *(_WORD *)&v11->_shouldLift = 257;
  }
  return v11;
}

- (RPTResizeInteraction)initWithDragPoint:(CGPoint)a3 delta:(CGVector)a4 sourceSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  dCGFloat y = a4.dy;
  dCGFloat x = a4.dx;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)RPTResizeInteraction;
  v11 = [(RPTResizeInteraction *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_dragPoint.CGFloat x = x;
    v11->_dragPoint.CGFloat y = y;
    v11->_initialSize.double width = width;
    v11->_initialSize.double height = height;
    uint64_t v13 = +[RPTCoordinateSpaceConverter identityConverter];
    conversion = v12->_conversion;
    v12->_conversion = (RPTCoordinateSpaceConverter *)v13;

    v12->_finalSize.double width = dx + width;
    v12->_finalSize.double height = dy + height;
    v12->_delta.dCGFloat x = dx;
    v12->_delta.dCGFloat y = dy;
    *(_WORD *)&v12->_shouldLift = 257;
  }
  return v12;
}

- (RPTResizeInteraction)initWithWindow:(id)a3 destinationSize:(CGSize)a4
{
  id v5 = a3;
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  [v5 bounds];
  double v10 = CGRectGetMaxX(v23) + -5.0;
  [v5 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v24.origin.CGFloat x = v12;
  v24.origin.CGFloat y = v14;
  v24.size.double width = v16;
  v24.size.double height = v18;
  double v19 = CGRectGetMaxY(v24) + -5.0;
  return -[RPTResizeInteraction initWithDragPoint:sourceSize:destinationSize:](self, "initWithDragPoint:sourceSize:destinationSize:", v10, v19, v7, v9, a4.width, a4.height);
}

- (void)invokeWithComposer:(id)a3 duration:(double)a4
{
  id v11 = a3;
  id v5 = [(RPTResizeInteraction *)self conversion];
  objc_msgSend(v5, "convertPoint:", self->_dragPoint.x, self->_dragPoint.y);
  objc_msgSend(v11, "pointerMoveToPointIfApplicable:");

  if (self->_shouldPress)
  {
    double v6 = [(RPTResizeInteraction *)self conversion];
    objc_msgSend(v6, "convertPoint:", self->_dragPoint.x, self->_dragPoint.y);
    objc_msgSend(v11, "pointerOrFingerTapDown:");
  }
  double v7 = self->_delta.dx + self->_dragPoint.x;
  double v8 = self->_delta.dy + self->_dragPoint.y;
  double v9 = [(RPTResizeInteraction *)self conversion];
  objc_msgSend(v9, "convertPoint:", v7, v8);
  objc_msgSend(v11, "pointerOrFingerMoveToPoint:duration:");

  if (self->_shouldLift)
  {
    double v10 = [(RPTResizeInteraction *)self conversion];
    objc_msgSend(v10, "convertPoint:", v7, v8);
    objc_msgSend(v11, "pointerOrFingerTapUp:");
  }
}

- (id)reversedInteraction
{
  v3 = -[RPTResizeInteraction initWithDragPoint:sourceSize:destinationSize:]([RPTResizeInteraction alloc], "initWithDragPoint:sourceSize:destinationSize:", self->_delta.dx + self->_dragPoint.x, self->_delta.dy + self->_dragPoint.y, self->_finalSize.width, self->_finalSize.height, self->_initialSize.width, self->_initialSize.height);
  [(RPTResizeInteraction *)v3 setConversion:self->_conversion];
  return v3;
}

- (id)interactionByScalingBy:(double)a3
{
  v4 = -[RPTResizeInteraction initWithDragPoint:delta:sourceSize:]([RPTResizeInteraction alloc], "initWithDragPoint:delta:sourceSize:", self->_dragPoint.x, self->_dragPoint.y, self->_delta.dx * a3, self->_delta.dy * a3, self->_initialSize.width, self->_initialSize.height);
  [(RPTResizeInteraction *)v4 setConversion:self->_conversion];
  return v4;
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
}

- (CGPoint)dragPoint
{
  double x = self->_dragPoint.x;
  double y = self->_dragPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDragPoint:(CGPoint)a3
{
  self->_dragPoint = a3;
}

- (CGVector)delta
{
  ddouble x = self->_delta.dx;
  ddouble y = self->_delta.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (void)setDelta:(CGVector)a3
{
  self->_delta = a3;
}

- (CGSize)initialSize
{
  double width = self->_initialSize.width;
  double height = self->_initialSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)finalSize
{
  double width = self->_finalSize.width;
  double height = self->_finalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)shouldLift
{
  return self->_shouldLift;
}

- (void)setShouldLift:(BOOL)a3
{
  self->_shouldLift = a3;
}

- (BOOL)shouldPress
{
  return self->_shouldPress;
}

- (void)setShouldPress:(BOOL)a3
{
  self->_shouldPress = a3;
}

- (void).cxx_destruct
{
}

@end