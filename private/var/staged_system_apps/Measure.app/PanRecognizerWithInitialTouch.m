@interface PanRecognizerWithInitialTouch
- (_TtC7Measure29PanRecognizerWithInitialTouch)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation PanRecognizerWithInitialTouch

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_10001FD84();
  sub_10001FDC4();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_10009FAA0(v6, (uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (_TtC7Measure29PanRecognizerWithInitialTouch)initWithTarget:(id)a3 action:(SEL)a4
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
  return (_TtC7Measure29PanRecognizerWithInitialTouch *)sub_10009FC34((uint64_t)v6, (uint64_t)a4);
}

@end