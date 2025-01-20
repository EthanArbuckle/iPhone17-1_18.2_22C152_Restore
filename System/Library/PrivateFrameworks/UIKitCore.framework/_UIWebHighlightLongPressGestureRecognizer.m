@interface _UIWebHighlightLongPressGestureRecognizer
- (BOOL)_isGestureType:(int64_t)a3;
- (_UIWebHighlightLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)cancel;
@end

@implementation _UIWebHighlightLongPressGestureRecognizer

- (void)cancel
{
  if (self)
  {
    if ((*(void *)&self->super.super._gestureFlags & 0x200000000) != 0)
    {
      UIGestureRecognizerState v3 = [(UIGestureRecognizer *)self state];
      if ((unint64_t)v3 <= UIGestureRecognizerStateChanged)
      {
        uint64_t v4 = qword_186B9E800[v3];
        [(UIGestureRecognizer *)self setState:v4];
      }
    }
  }
}

- (_UIWebHighlightLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIWebHighlightLongPressGestureRecognizer;
  uint64_t v4 = [(UILongPressGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4) {
    [(UILongPressGestureRecognizer *)v4 set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:1];
  }
  return v5;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 15 || a3 == 1;
}

@end