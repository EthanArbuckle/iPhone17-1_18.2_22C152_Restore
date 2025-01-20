@interface StopwatchViewModel
- (_TtC18MobileTimerSupport18StopwatchViewModel)init;
- (_TtC18MobileTimerSupport18StopwatchViewModel)initWithStopwatch:(id)a3 manager:(id)a4 delegate:(id)a5 dateProvider:(id)a6 registerForNotifications:(BOOL)a7 broadcastUpdates:(BOOL)a8;
- (double)runningTotalForLap:(int64_t)a3;
- (id)getStopwatch;
- (id)sourceIdentifier;
- (void)addLap:(double)a3;
- (void)clearAllLaps;
- (void)dealloc;
- (void)invalidateDisplayLink;
- (void)lapLapTimer;
- (void)pauseLapTimer;
- (void)resetLapTimer;
- (void)resumeLapTimer;
- (void)startLapTimer;
- (void)updateStopwatch:(id)a3;
- (void)updateTime;
- (void)updateWithDisplayLink;
@end

@implementation StopwatchViewModel

- (_TtC18MobileTimerSupport18StopwatchViewModel)initWithStopwatch:(id)a3 manager:(id)a4 delegate:(id)a5 dateProvider:(id)a6 registerForNotifications:(BOOL)a7 broadcastUpdates:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC18MobileTimerSupport18StopwatchViewModel *)StopwatchViewModel.init(stopwatch:manager:delegate:dateProvider:registerForNotifications:broadcastUpdates:)(a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v9, v8);
}

- (void)dealloc
{
  v2 = self;
  StopwatchViewModel.unregisterNotifications()();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for StopwatchViewModel();
  [(StopwatchViewModel *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_internalStopwatch));
  swift_unknownObjectRelease();
  sub_1BE2AC340((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_delegate);
  swift_release();

  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_updatedCancellable, &qword_1EB838C28);
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_lapAddedCancellable, &qword_1EB838C28);
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_clearAllLapsCancellable, &qword_1EB838C28);
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_startLapTimerCancellable, &qword_1EB838C28);
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_pauseLapTimerCancellable, &qword_1EB838C28);
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_lapLapTimerCancellable, &qword_1EB838C28);
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_resetLapTimerCancellable, &qword_1EB838C28);
  sub_1BE29F8A8((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_resumeLapTimerCancellable, &qword_1EB838C28);
}

- (void)updateStopwatch:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE2A4378(v4);
}

- (void)addLap:(double)a3
{
  id v4 = self;
  sub_1BE2A45D4(1, a3);
}

- (void)clearAllLaps
{
  v2 = self;
  sub_1BE2A4D28();
}

- (void)updateWithDisplayLink
{
  v2 = self;
  sub_1BE2A51FC();
}

- (void)invalidateDisplayLink
{
  uint64_t v3 = OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_displayLink;
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_displayLink);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  id v6 = *(Class *)((char *)&self->super.isa + v3);
  *(Class *)((char *)&self->super.isa + v3) = 0;
}

- (void)updateTime
{
  v2 = self;
  sub_1BE2A540C();
}

- (void)startLapTimer
{
  v2 = self;
  sub_1BE2A5C0C();
}

- (void)pauseLapTimer
{
  v2 = self;
  sub_1BE2A653C();
}

- (void)lapLapTimer
{
  v2 = self;
  sub_1BE2A7440();
}

- (void)resetLapTimer
{
  v2 = self;
  sub_1BE2A7F88();
}

- (void)resumeLapTimer
{
  v2 = self;
  sub_1BE2A85F4();
}

- (id)getStopwatch
{
  v2 = self;
  uint64_t v3 = sub_1BE2A8E04();

  return v3;
}

- (double)runningTotalForLap:(int64_t)a3
{
  id v4 = self;
  sub_1BE2A908C(a3);
  double v6 = v5;

  return v6;
}

- (_TtC18MobileTimerSupport18StopwatchViewModel)init
{
  result = (_TtC18MobileTimerSupport18StopwatchViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)sourceIdentifier
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_broadcastUpdates) == 1)
  {
    v2 = self;
    sub_1BE323770();
    sub_1BE323AD0();

    uint64_t v3 = (void *)sub_1BE3233B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

@end