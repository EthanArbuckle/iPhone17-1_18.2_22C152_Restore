@interface ICShowDebugMenuGestureRecognizer
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (ICShowDebugMenuGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation ICShowDebugMenuGestureRecognizer

- (ICShowDebugMenuGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICShowDebugMenuGestureRecognizer;
  v4 = [(ICShowDebugMenuGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(ICShowDebugMenuGestureRecognizer *)v4 setNumberOfTapsRequired:2];
    [(ICShowDebugMenuGestureRecognizer *)v5 setNumberOfTouchesRequired:4];
    [(ICShowDebugMenuGestureRecognizer *)v5 setDelegate:v5];
  }
  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

@end