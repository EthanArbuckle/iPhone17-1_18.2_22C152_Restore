@interface InteractiveDismissalGestureRecognizer
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC7Journal37InteractiveDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)didPan:(id)a3;
@end

@implementation InteractiveDismissalGestureRecognizer

- (void)didPan:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002642BC(v4);
}

- (_TtC7Journal37InteractiveDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC7Journal37InteractiveDismissalGestureRecognizer *)sub_100264744((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100264BA0(v4);
  char v7 = v6;

  return v7 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    type metadata accessor for InteractiveDismissalGestureRecognizer();
    LOBYTE(v4) = swift_dynamicCastClass() != 0;
  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

@end