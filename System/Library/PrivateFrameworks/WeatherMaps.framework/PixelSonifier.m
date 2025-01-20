@interface PixelSonifier
- (void)handleGestureWithRecognizer:(id)a3;
- (void)hoverTimerFiredWithTimer:(id)a3;
@end

@implementation PixelSonifier

- (void)hoverTimerFiredWithTimer:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_20A26F580();
  swift_release();
}

- (void)handleGestureWithRecognizer:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_20A2701C0(v3);
  swift_release();
}

@end