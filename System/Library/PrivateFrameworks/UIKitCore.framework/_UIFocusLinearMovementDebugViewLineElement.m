@interface _UIFocusLinearMovementDebugViewLineElement
+ (id)elementWithCGPathElement:(const CGPathElement *)a3;
- (CGPoint)cp1;
- (CGPoint)cp2;
- (CGPoint)point;
- (_UIFocusLinearMovementDebugViewLineElement)initWithType:(int)a3 point:(CGPoint)a4 cp1:(CGPoint)a5 cp2:(CGPoint)a6;
- (int)type;
@end

@implementation _UIFocusLinearMovementDebugViewLineElement

+ (id)elementWithCGPathElement:(const CGPathElement *)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  switch(a3->type)
  {
    case kCGPathElementMoveToPoint:
    case kCGPathElementAddLineToPoint:
      points = a3->points;
      double x = points->x;
      double y = points->y;
      goto LABEL_4;
    case kCGPathElementAddQuadCurveToPoint:
      v10 = a3->points;
      double x = v10[1].x;
      double y = v10[1].y;
      double v8 = v10->x;
      double v9 = v10->y;
      break;
    case kCGPathElementAddCurveToPoint:
      v11 = a3->points;
      double x = v11[2].x;
      double y = v11[2].y;
      double v8 = v11->x;
      double v9 = v11->y;
      double v3 = v11[1].x;
      double v4 = v11[1].y;
      break;
    default:
      double x = *MEMORY[0x1E4F1DAD8];
      double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
LABEL_4:
      double v8 = *MEMORY[0x1E4F1DAD8];
      double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      break;
  }
  v12 = objc_msgSend(objc_alloc((Class)a1), "initWithType:point:cp1:cp2:", a3->type, x, y, v8, v9, v3, v4);
  return v12;
}

- (_UIFocusLinearMovementDebugViewLineElement)initWithType:(int)a3 point:(CGPoint)a4 cp1:(CGPoint)a5 cp2:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  v14.receiver = self;
  v14.super_class = (Class)_UIFocusLinearMovementDebugViewLineElement;
  result = [(_UIFocusLinearMovementDebugViewLineElement *)&v14 init];
  if (result)
  {
    result->_type = a3;
    result->_point.CGFloat x = v11;
    result->_point.CGFloat y = v10;
    result->_cp1.CGFloat x = v9;
    result->_cp1.CGFloat y = v8;
    result->_cp2.CGFloat x = x;
    result->_cp2.CGFloat y = y;
  }
  return result;
}

- (int)type
{
  return self->_type;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)cp1
{
  double x = self->_cp1.x;
  double y = self->_cp1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)cp2
{
  double x = self->_cp2.x;
  double y = self->_cp2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end