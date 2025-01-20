@interface CatchAllPassiveGestureRecognizer.AlwaysSimultaneousGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (_TtCC5Music32CatchAllPassiveGestureRecognizer43AlwaysSimultaneousGestureRecognizerDelegate)init;
@end

@implementation CatchAllPassiveGestureRecognizer.AlwaysSimultaneousGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (_TtCC5Music32CatchAllPassiveGestureRecognizer43AlwaysSimultaneousGestureRecognizerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CatchAllPassiveGestureRecognizer.AlwaysSimultaneousGestureRecognizerDelegate();
  return [(CatchAllPassiveGestureRecognizer.AlwaysSimultaneousGestureRecognizerDelegate *)&v3 init];
}

@end