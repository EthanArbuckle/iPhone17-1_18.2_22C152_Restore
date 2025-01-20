@interface UITextRangeAdjustmentGestureRecognizer
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (CGPoint)startPoint;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation UITextRangeAdjustmentGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  p_startPoint = &self->_startPoint;
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 anyObject];
  v10 = [(UIGestureRecognizer *)self view];
  v11 = [v10 textInputView];
  [v9 locationInView:v11];
  p_startPoint->x = v12;
  p_startPoint->y = v13;

  v14.receiver = self;
  v14.super_class = (Class)UITextRangeAdjustmentGestureRecognizer;
  [(UIPanGestureRecognizer *)&v14 touchesBegan:v8 withEvent:v7];
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return [a3 _isGestureType:8];
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end