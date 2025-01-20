@interface BottomPlayerViewController.HighlightGestureRecognizer
- (_TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer)initWithCoder:(id)a3;
- (_TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation BottomPlayerViewController.HighlightGestureRecognizer

- (_TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
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
  return (_TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer *)sub_100078DFC((uint64_t)v6, (uint64_t)a4);
}

- (_TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer)initWithCoder:(id)a3
{
  result = (_TtCC5Music26BottomPlayerViewControllerP33_0D1D480FE386CD4AFA10E33B57CA809026HighlightGestureRecognizer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  v6 = self;
  if (![(BottomPlayerViewController.HighlightGestureRecognizer *)v6 state]) {
    [(BottomPlayerViewController.HighlightGestureRecognizer *)v6 setState:1];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_100057778(0, &qword_1010A1318);
  sub_10006B444((unint64_t *)&unk_1010A1320, &qword_1010A1318);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  v7 = self;
  sub_100273E4C();

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

@end