@interface _UIDoubleTapInteractionGestureRecognizer
- (_UIDoubleTapInteractionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
@end

@implementation _UIDoubleTapInteractionGestureRecognizer

- (_UIDoubleTapInteractionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDoubleTapInteractionGestureRecognizer;
  v4 = [(UITapGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIGestureRecognizer *)v4 setName:@"com.apple.UIKit._UIDoubleTapInteraction.tap"];
    [(UITapGestureRecognizer *)v5 setNumberOfTapsRequired:1];
    [(UIGestureRecognizer *)v5 _setAcceptsFailureRequiments:0];
  }
  return v5;
}

- (void)reset
{
  didReset = (void (**)(void))self->_didReset;
  if (didReset) {
    didReset[2]();
  }
}

- (void).cxx_destruct
{
}

@end