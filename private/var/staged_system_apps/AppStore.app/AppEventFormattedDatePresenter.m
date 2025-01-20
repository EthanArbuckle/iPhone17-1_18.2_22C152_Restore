@interface AppEventFormattedDatePresenter
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)update;
@end

@implementation AppEventFormattedDatePresenter

- (void)update
{
  swift_retain();
  sub_10000DA90();

  swift_release();
}

- (void)appEnteredWhileAppeared
{
  swift_retain();
  sub_10000DA90();

  swift_release();
}

- (void)appExitedWhileAppeared
{
  uint64_t v3 = OBJC_IVAR____TtC8AppStore30AppEventFormattedDatePresenter_updateTimer;
  v4 = *(void **)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8AppStore30AppEventFormattedDatePresenter_updateTimer];
  swift_retain();
  if (v4)
  {
    [v4 invalidate];
    id v5 = *(id *)&self->_TtCs12_SwiftObject_opaque[v3];
  }
  else
  {
    id v5 = 0;
  }
  *(void *)&self->_TtCs12_SwiftObject_opaque[v3] = 0;
  swift_release();
}

@end