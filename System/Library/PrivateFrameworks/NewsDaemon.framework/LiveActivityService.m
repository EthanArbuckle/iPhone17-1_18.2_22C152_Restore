@interface LiveActivityService
- (_TtC5newsd19LiveActivityService)init;
- (void)cancelScheduledLiveActivityWithId:(NSString *)a3 backgroundTaskID:(NSString *)a4 completionHandler:(id)a5;
- (void)scheduleLiveActivityWithRequest:(_TtC10NewsDaemon27LiveActivityScheduleRequest *)a3 completionHandler:(id)a4;
@end

@implementation LiveActivityService

- (void)scheduleLiveActivityWithRequest:(_TtC10NewsDaemon27LiveActivityScheduleRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000170E8(&qword_10006B220);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10006B0A0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10006B0A8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100040A38((uint64_t)v9, (uint64_t)&unk_10006B0B0, (uint64_t)v14);
  swift_release();
}

- (void)cancelScheduledLiveActivityWithId:(NSString *)a3 backgroundTaskID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000170E8(&qword_10006B220);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10006B088;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10006BA90;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100040A38((uint64_t)v11, (uint64_t)&unk_10006BAA0, (uint64_t)v16);
  swift_release();
}

- (_TtC5newsd19LiveActivityService)init
{
  result = (_TtC5newsd19LiveActivityService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000185C0((uint64_t)self + OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityLauncher);
  sub_1000185C0((uint64_t)self + OBJC_IVAR____TtC5newsd19LiveActivityService_liveActivityRepository);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5newsd19LiveActivityService_currentConnection);
}

@end