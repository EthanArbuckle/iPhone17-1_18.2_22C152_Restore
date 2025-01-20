@interface CRLFreehandDrawingToolMarqueeInput
- (CGPoint)unscaledTapPoint;
- (CRLFreehandDrawingToolMarqueeInput)initWithUnscaledTapPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (int64_t)inputType;
@end

@implementation CRLFreehandDrawingToolMarqueeInput

- (CRLFreehandDrawingToolMarqueeInput)initWithUnscaledTapPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingToolMarqueeInput;
  result = [(CRLFreehandDrawingToolMarqueeInput *)&v8 init];
  if (result)
  {
    result->_unscaledTapPoint.CGFloat x = x;
    result->_unscaledTapPoint.CGFloat y = y;
    result->_inputType = a4;
  }
  return result;
}

- (CGPoint)unscaledTapPoint
{
  double x = self->_unscaledTapPoint.x;
  double y = self->_unscaledTapPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)inputType
{
  return self->_inputType;
}

@end