@interface UIScrollViewKnobLongPressGestureRecognizer
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)forPointer;
- (UIScrollViewKnobLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)setForPointer:(BOOL)a3;
@end

@implementation UIScrollViewKnobLongPressGestureRecognizer

- (UIScrollViewKnobLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIScrollViewKnobLongPressGestureRecognizer;
  v4 = [(UILongPressGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4) {
    [(UILongPressGestureRecognizer *)v4 set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:1];
  }
  return v5;
}

- (void)setForPointer:(BOOL)a3
{
  self->_forPointer = a3;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  char v5 = [a3 _isPointerTouch];
  return v5 ^ [(UIScrollViewKnobLongPressGestureRecognizer *)self forPointer] ^ 1;
}

- (BOOL)forPointer
{
  return self->_forPointer;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

@end