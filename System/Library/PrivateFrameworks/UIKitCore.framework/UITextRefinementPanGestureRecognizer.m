@interface UITextRefinementPanGestureRecognizer
- (CGPoint)startPoint;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation UITextRefinementPanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  p_startPoint = &self->_startPoint;
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 anyObject];
  v10 = [(UIGestureRecognizer *)self view];
  [v9 locationInView:v10];
  p_startPoint->x = v11;
  p_startPoint->y = v12;

  v13.receiver = self;
  v13.super_class = (Class)UITextRefinementPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v13 touchesBegan:v8 withEvent:v7];
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