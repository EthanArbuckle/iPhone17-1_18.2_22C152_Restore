@interface DataLinkHealthKitHostConnection
- (_TtC11WorkoutCore31DataLinkHealthKitHostConnection)init;
- (void)dealloc;
- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6;
- (void)workoutSession:(id)a3 didDisconnectFromRemoteDeviceWithError:(id)a4;
- (void)workoutSession:(id)a3 didFailWithError:(id)a4;
- (void)workoutSession:(id)a3 didReceiveDataFromRemoteWorkoutSession:(id)a4;
@end

@implementation DataLinkHealthKitHostConnection

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11WorkoutCore31DataLinkHealthKitHostConnection_recorder))
  {
    v3 = self;
    swift_retain();
    sub_236A85AD4();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DataLinkHealthKitHostConnection();
  [(DataLinkHealthKitHostConnection *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore31DataLinkHealthKitHostConnection_lastResetOfSequences;
  uint64_t v4 = sub_236C73F58();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

- (_TtC11WorkoutCore31DataLinkHealthKitHostConnection)init
{
  result = (_TtC11WorkoutCore31DataLinkHealthKitHostConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
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
  sub_236B49BC4(v8);
}

- (void)workoutSession:(id)a3 didReceiveDataFromRemoteWorkoutSession:(id)a4
{
  uint64_t v5 = sub_236C750A8();
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    id v7 = a3;
    id v8 = self;
    v9 = (unint64_t *)(v5 + 40);
    do
    {
      uint64_t v10 = *(v9 - 1);
      unint64_t v11 = *v9;
      sub_236A5B9DC(v10, *v9);
      sub_236B49DA0(v10, v11);
      sub_236A57E80(v10, v11);
      v9 += 2;
      --v6;
    }
    while (v6);
  }
  else
  {
    id v12 = a3;
  }
  swift_bridgeObjectRelease();
}

- (void)workoutSession:(id)a3 didDisconnectFromRemoteDeviceWithError:(id)a4
{
  uint64_t v6 = qword_26AF30478;
  id v7 = a3;
  v13 = self;
  id v8 = a4;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_236C74B98();
  __swift_project_value_buffer(v9, (uint64_t)qword_26AF2E5B8);
  uint64_t v10 = sub_236C74B78();
  os_log_type_t v11 = sub_236C752D8();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_236A4F000, v10, v11, "We received a disconnection notice!", v12, 2u);
    MEMORY[0x237E0C720](v12, -1, -1);
  }
}

@end