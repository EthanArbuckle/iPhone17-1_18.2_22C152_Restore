@interface FindMyLocateShims
+ (_TtC4fmfd17FindMyLocateShims)shared;
- (_TtC4fmfd17FindMyLocateShims)init;
- (void)addFence:(id)a3 completion:(id)a4;
- (void)deleteFence:(id)a3 completion:(id)a4;
- (void)fencesForHandles:(id)a3 completion:(id)a4;
- (void)getFences:(id)a3;
- (void)muteFencesForHandle:(id)a3 untilDate:(id)a4 completion:(id)a5;
- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 completion:(id)a7;
- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8;
@end

@implementation FindMyLocateShims

+ (_TtC4fmfd17FindMyLocateShims)shared
{
  if (qword_1000BB8B0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1000BBFE0;

  return (_TtC4fmfd17FindMyLocateShims *)v2;
}

- (_TtC4fmfd17FindMyLocateShims)init
{
  return (_TtC4fmfd17FindMyLocateShims *)sub_100057684();
}

- (void)addFence:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a3;
  v13[5] = self;
  v13[6] = sub_100068DC0;
  v13[7] = v11;
  id v14 = a3;
  v15 = self;
  id v16 = v14;
  v17 = v15;
  swift_retain();
  sub_100059C84((uint64_t)v9, (uint64_t)&unk_1000BB3F0, (uint64_t)v13);
  swift_release();
  swift_release();
}

- (void)deleteFence:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a3;
  v13[5] = sub_10006A978;
  v13[6] = v11;
  v13[7] = self;
  id v14 = a3;
  v15 = self;
  id v16 = v14;
  v17 = v15;
  swift_retain();
  sub_100059C84((uint64_t)v9, (uint64_t)&unk_1000BB3E8, (uint64_t)v13);
  swift_release();
  swift_release();
}

- (void)getFences:(id)a3
{
  uint64_t v5 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_10006A954;
  v11[6] = v9;
  uint64_t v12 = self;
  swift_retain();
  sub_100059C84((uint64_t)v7, (uint64_t)&unk_1000BB3E0, (uint64_t)v11);
  swift_release();
  swift_release();
}

- (void)fencesForHandles:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (a3)
  {
    sub_100068ADC(0, &qword_1000BB3C0);
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_10006725C((unint64_t)a3, v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 completion:(id)a7
{
  id v23 = a5;
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v25 = *(void *)(v9 - 8);
  uint64_t v26 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  id v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v15;
  v20 = *(void (**)(char *, uint64_t, uint64_t, id, char *, void, uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x80);
  id v21 = v23;
  v22 = self;
  v20(v14, v16, v18, v21, v11, 0, sub_10006A978, v19);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v26);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v24);
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8
{
  uint64_t v27 = type metadata accessor for Date();
  uint64_t v25 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for UUID();
  uint64_t v14 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = _Block_copy(a8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v20 = v19;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v17);
  id v21 = a5;
  id v22 = a7;
  id v23 = self;
  sub_100067C10((uint64_t)v16, v18, v20, (uint64_t)v21, (uint64_t)v13, a7, v23, (void (**)(void, void))v17);
  _Block_release(v17);
  _Block_release(v17);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v27);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v26);
}

- (void)muteFencesForHandle:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  uint64_t v9 = sub_100059F80(&qword_1000BB368);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  _Block_copy(v12);
  id v15 = a3;
  uint64_t v16 = self;
  sub_100068450(a3, (uint64_t)v11, v16, (void (**)(void, void))v12);
  _Block_release(v12);
  _Block_release(v12);

  sub_100069390((uint64_t)v11, &qword_1000BB368);
}

- (void).cxx_destruct
{
}

@end