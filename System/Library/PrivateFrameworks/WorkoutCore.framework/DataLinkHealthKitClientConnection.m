@interface DataLinkHealthKitClientConnection
- (_TtC11WorkoutCore33DataLinkHealthKitClientConnection)init;
- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6;
- (void)workoutSession:(id)a3 didDisconnectFromRemoteDeviceWithError:(id)a4;
- (void)workoutSession:(id)a3 didFailWithError:(id)a4;
- (void)workoutSession:(id)a3 didReceiveDataFromRemoteDevice:(id)a4;
- (void)workoutSession:(id)a3 didReceiveDataFromRemoteWorkoutSession:(id)a4;
@end

@implementation DataLinkHealthKitClientConnection

- (_TtC11WorkoutCore33DataLinkHealthKitClientConnection)init
{
  return (_TtC11WorkoutCore33DataLinkHealthKitClientConnection *)sub_236BECC14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11WorkoutCore33DataLinkHealthKitClientConnection_session));
  sub_236A6BD7C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11WorkoutCore33DataLinkHealthKitClientConnection_metricsUpdater));
  sub_236A6BD7C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11WorkoutCore33DataLinkHealthKitClientConnection_notificationHandler));
  sub_236A6BD7C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11WorkoutCore33DataLinkHealthKitClientConnection_presenceHandler));
  swift_weakDestroy();

  swift_bridgeObjectRelease();
}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  uint64_t v6 = sub_236C73F58();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236C73F28();
  sub_236B499BC();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)workoutSession:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  sub_236BF1988(MEMORY[0x263F90280], "Workout session did fail, not logging error");
}

- (void)workoutSession:(id)a3 didReceiveDataFromRemoteDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11 = self;
  uint64_t v8 = sub_236C73DF8();
  unint64_t v10 = v9;

  sub_236BF0FF4(v8, v10);
  sub_236A57E80(v8, v10);
}

- (void)workoutSession:(id)a3 didReceiveDataFromRemoteWorkoutSession:(id)a4
{
  uint64_t v6 = sub_236C750A8();
  id v7 = a3;
  uint64_t v8 = self;
  sub_236BEDBCC((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (void)workoutSession:(id)a3 didDisconnectFromRemoteDeviceWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_236BF1988(MEMORY[0x263F90290], "We received a disconnection notice!");
}

@end