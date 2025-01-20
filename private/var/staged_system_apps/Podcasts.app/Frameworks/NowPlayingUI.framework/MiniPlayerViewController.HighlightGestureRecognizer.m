@interface MiniPlayerViewController.HighlightGestureRecognizer
- (_TtCC12NowPlayingUI24MiniPlayerViewControllerP33_C27FD6FABBED677CC1601843453D6A0126HighlightGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation MiniPlayerViewController.HighlightGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (_TtCC12NowPlayingUI24MiniPlayerViewControllerP33_C27FD6FABBED677CC1601843453D6A0126HighlightGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_12A280();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtCC12NowPlayingUI24MiniPlayerViewControllerP33_C27FD6FABBED677CC1601843453D6A0126HighlightGestureRecognizer *)sub_BE17C((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  sub_FB70(*(uint64_t *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtCC12NowPlayingUI24MiniPlayerViewControllerP33_C27FD6FABBED677CC1601843453D6A0126HighlightGestureRecognizer_handlePoint));
}

@end