@interface WeatherMapOverlaySonifier
- (void)handleGestureWithRecognizer:(id)a3;
- (void)hoverTimerFiredWithTimer:(id)a3;
@end

@implementation WeatherMapOverlaySonifier

- (void)hoverTimerFiredWithTimer:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_20A30F6C8();
  swift_release();
}

- (void)handleGestureWithRecognizer:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_20A3100A0(v3);
  swift_release();
}

@end