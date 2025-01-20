@interface ObservabilityXPCTimerActivityDelegate
- (APXPCActivityCriteria)criteria;
- (BOOL)runActivity:(id)a3;
- (NSString)taskID;
- (_TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate)init;
- (id)checkinWithCriteria:(id)a3;
- (void)deferActivity:(id)a3 completionHandler:(id)a4;
- (void)setTaskID:(id)a3;
- (void)terminateActivity:(id)a3;
@end

@implementation ObservabilityXPCTimerActivityDelegate

- (NSString)taskID
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_10019B0A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTaskID:(id)a3
{
  uint64_t v4 = sub_10019B0B0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_taskID);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (APXPCActivityCriteria)criteria
{
  NSString v2 = self;
  v3 = (void *)sub_10000B960();

  return (APXPCActivityCriteria *)v3;
}

- (BOOL)runActivity:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10000BB5C(v4);

  return self & 1;
}

- (void)deferActivity:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  v7 = (char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = sub_10000C73C;
    *(void *)(v10 + 24) = v6;
    v11 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v8 + 24);
    id v12 = a3;
    v13 = self;
    _Block_copy(v5);
    swift_retain();
    v11(sub_10000C78C, v10, ObjectType, v8);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    id v14 = a3;
    v15 = self;
    _Block_copy(v5);
    (*((void (**)(void *, uint64_t))v5 + 2))(v5, 1);
  }
  swift_release();
  _Block_release(v5);
}

- (void)terminateActivity:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = *(void (**)(uint64_t (*)(void), void, uint64_t, uint64_t))(v6 + 24);
    id v9 = a3;
    uint64_t v10 = self;
    v8(nullsub_1, 0, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (id)checkinWithCriteria:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10000BF40((uint64_t)a3);
  swift_unknownObjectRelease();

  return 0;
}

- (_TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_taskID);
  void *v3 = 0xD000000000000031;
  v3[1] = 0x8000000100209980;
  *(void *)&self->taskID[OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v4 = (char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_currentScheduledTime;
  uint64_t v5 = sub_10019ABA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ObservabilityXPCTimerActivityDelegate();
  return [(ObservabilityXPCTimerActivityDelegate *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10000C7B8((uint64_t)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC16promotedcontentd37ObservabilityXPCTimerActivityDelegate_currentScheduledTime;

  sub_10000C4EC((uint64_t)v3);
}

@end