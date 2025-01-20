@interface LocationManagerDelegateTrampoline
- (_TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationManagerDelegateTrampoline

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001D4B0(0, (unint64_t *)&qword_101646830);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = Strong;
    uint64_t v12 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
    v13 = (void *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = v11;
    v13[5] = v9;
    id v14 = a3;
    v15 = self;
    swift_bridgeObjectRetain();
    sub_1008F5E44((uint64_t)v8, (uint64_t)&unk_101665E38, (uint64_t)v13);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = Strong;
    uint64_t v12 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
    v13 = (void *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = v11;
    v13[5] = a4;
    id v14 = a4;
    id v15 = a3;
    uint64_t v16 = self;
    sub_1008F5E44((uint64_t)v9, (uint64_t)&unk_101665E18, (uint64_t)v13);
    swift_release();
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t v10 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    id v12 = a3;
    v13 = self;
    sub_1008F5E44((uint64_t)v7, (uint64_t)&unk_101665E08, (uint64_t)v11);
    swift_release();
  }
}

- (_TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(LocationManagerDelegateTrampoline *)&v5 init];
}

- (void).cxx_destruct
{
}

@end