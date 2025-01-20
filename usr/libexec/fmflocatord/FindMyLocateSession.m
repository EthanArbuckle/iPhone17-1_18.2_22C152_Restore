@interface FindMyLocateSession
+ (NSString)scheduleAlarmStream;
+ (NSString)scheduleTimerIdentifier;
- (_TtC11fmflocatord19FindMyLocateSession)init;
- (id)fencesUpdateCallback;
- (void)checkIfThisDeviceIsBeingUsedToShareLocationWithCompletionHandler:(id)a3;
- (void)getFences:(id)a3;
- (void)setFencesUpdateCallback:(id)a3;
- (void)triggerFenceWithID:(NSUUID *)a3 trigger:(int64_t)a4 location:(CLLocation *)a5 completionHandler:(id)a6;
@end

@implementation FindMyLocateSession

- (id)fencesUpdateCallback
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002C1F0;
    aBlock[3] = &unk_10005AA10;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setFencesUpdateCallback:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100031420;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002C3D4(v7);
}

- (_TtC11fmflocatord19FindMyLocateSession)init
{
  return (_TtC11fmflocatord19FindMyLocateSession *)sub_10002C478();
}

- (void)triggerFenceWithID:(NSUUID *)a3 trigger:(int64_t)a4 location:(CLLocation *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_10002C6C8(&qword_10006D098);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10006D168;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10006D170;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  sub_1000301A4((uint64_t)v13, (uint64_t)&unk_10006D178, (uint64_t)v18);
  swift_release();
}

- (void)checkIfThisDeviceIsBeingUsedToShareLocationWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10002C6C8(&qword_10006D098);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10006D128;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10006D138;
  v12[5] = v11;
  v13 = self;
  sub_1000301A4((uint64_t)v7, (uint64_t)&unk_10006D148, (uint64_t)v12);
  swift_release();
}

+ (NSString)scheduleTimerIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)scheduleAlarmStream
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (void).cxx_destruct
{
  sub_10002C3D4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback));

  swift_release();
}

- (void)getFences:(id)a3
{
  uint64_t v5 = sub_10002C6C8(&qword_10006D098);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  type metadata accessor for MainActor();
  uint64_t v11 = self;
  swift_retain();
  uint64_t v12 = static MainActor.shared.getter();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  v13[5] = sub_100030DAC;
  v13[6] = v9;
  sub_10002D5C4((uint64_t)v7, (uint64_t)&unk_10006D118, (uint64_t)v13);

  swift_release();
  swift_release();
}

@end