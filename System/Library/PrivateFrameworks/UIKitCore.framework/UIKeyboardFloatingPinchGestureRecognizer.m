@interface UIKeyboardFloatingPinchGestureRecognizer
- (UIKeyboardFloatingPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation UIKeyboardFloatingPinchGestureRecognizer

- (UIKeyboardFloatingPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardFloatingPinchGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
    activeTouches = v4->_activeTouches;
    v4->_activeTouches = (NSMutableSet *)v5;
  }
  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSMutableSet *)self->_activeTouches unionSet:v6];
  if ((unint64_t)[(NSMutableSet *)self->_activeTouches count] < 3)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboardFloatingPinchGestureRecognizer;
    [(UIGestureRecognizer *)&v10 touchesBegan:v6 withEvent:v7];
  }
  else
  {
    if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateBegan
      || [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateChanged)
    {
      objc_super v8 = self;
      uint64_t v9 = 3;
    }
    else
    {
      objc_super v8 = self;
      uint64_t v9 = 5;
    }
    [(UIGestureRecognizer *)v8 setState:v9];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  activeTouches = self->_activeTouches;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableSet *)activeTouches minusSet:v8];
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardFloatingPinchGestureRecognizer;
  [(UIGestureRecognizer *)&v9 touchesEnded:v8 withEvent:v7];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  activeTouches = self->_activeTouches;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableSet *)activeTouches minusSet:v8];
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardFloatingPinchGestureRecognizer;
  [(UIGestureRecognizer *)&v9 touchesCancelled:v8 withEvent:v7];
}

- (void)reset
{
  [(NSMutableSet *)self->_activeTouches removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardFloatingPinchGestureRecognizer;
  [(UIGestureRecognizer *)&v3 reset];
}

- (void).cxx_destruct
{
}

@end