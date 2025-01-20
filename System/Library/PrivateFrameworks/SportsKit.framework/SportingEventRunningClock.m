@interface SportingEventRunningClock
- (BOOL)isEqual:(id)a3;
- (_TtC9SportsKit25SportingEventRunningClock)init;
@end

@implementation SportingEventRunningClock

- (_TtC9SportsKit25SportingEventRunningClock)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_runningClockInterval;
  uint64_t v3 = sub_23F95B330();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23F95C220();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_23F92C170((uint64_t)v8);

  sub_23F8F78BC((uint64_t)v8);
  return v6;
}

@end