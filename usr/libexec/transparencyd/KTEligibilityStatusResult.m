@interface KTEligibilityStatusResult
+ (id)statusResultWithFailureWithElement:(id)a3 error:(id)a4;
+ (id)statusResultWithFailureWithElement:(id)a3 error:(id)a4 dateStored:(id)a5;
+ (id)statusResultWithSuccessWithElement:(id)a3;
+ (id)statusResultWithSuccessWithElement:(id)a3 dateStored:(id)a4;
- (NSDate)dateStored;
- (NSString)description;
- (_TtC13transparencyd25KTEligibilityStatusResult)init;
- (int64_t)result;
@end

@implementation KTEligibilityStatusResult

- (int64_t)result
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_result);
}

- (NSDate)dateStored
{
  uint64_t v3 = sub_100080E08((uint64_t *)&unk_10031F9A0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000985E0((uint64_t)self + OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_dateStored, (uint64_t)v5);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }

  return (NSDate *)isa;
}

- (NSString)description
{
  v2 = self;
  sub_1000EACF0();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (id)statusResultWithSuccessWithElement:(id)a3
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  uint64_t v4 = sub_100080E08((uint64_t *)&unk_10031F9A0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  v11 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(void *)&v11[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_result] = 0;
  *(void *)&v11[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_error] = 0;
  v12 = (uint64_t *)&v11[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_element];
  uint64_t *v12 = v7;
  v12[1] = v9;
  sub_1000985E0((uint64_t)v6, (uint64_t)&v11[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_dateStored]);
  v15.receiver = v11;
  v15.super_class = ObjCClassMetadata;
  swift_bridgeObjectRetain();
  id v13 = [super init];
  sub_100087A1C((uint64_t)v6, (uint64_t *)&unk_10031F9A0);
  swift_bridgeObjectRelease();

  return v13;
}

+ (id)statusResultWithSuccessWithElement:(id)a3 dateStored:(id)a4
{
  uint64_t v5 = sub_100080E08((uint64_t *)&unk_10031F9A0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v21 - v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 1, 1, v15);
  }
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  sub_1000985E0((uint64_t)v10, (uint64_t)v8);
  v17 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(void *)&v17[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_result] = 0;
  *(void *)&v17[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_error] = 0;
  v18 = (uint64_t *)&v17[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_element];
  uint64_t *v18 = v11;
  v18[1] = v13;
  sub_1000985E0((uint64_t)v8, (uint64_t)&v17[OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_dateStored]);
  v21.receiver = v17;
  v21.super_class = ObjCClassMetadata;
  swift_bridgeObjectRetain();
  id v19 = [super init];
  sub_100087A1C((uint64_t)v8, (uint64_t *)&unk_10031F9A0);
  swift_bridgeObjectRelease();
  sub_100087A1C((uint64_t)v10, (uint64_t *)&unk_10031F9A0);

  return v19;
}

+ (id)statusResultWithFailureWithElement:(id)a3 error:(id)a4 dateStored:(id)a5
{
  uint64_t v7 = sub_100080E08((uint64_t *)&unk_10031F9A0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (a5)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  id v15 = a4;
  id v16 = sub_1000F5B78(v10, v12, v15, (uint64_t)v9);

  swift_bridgeObjectRelease();
  sub_100087A1C((uint64_t)v9, (uint64_t *)&unk_10031F9A0);

  return v16;
}

+ (id)statusResultWithFailureWithElement:(id)a3 error:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  id v8 = a4;
  id v9 = sub_1000F5CA8(v5, v7, v8);

  swift_bridgeObjectRelease();

  return v9;
}

- (_TtC13transparencyd25KTEligibilityStatusResult)init
{
  result = (_TtC13transparencyd25KTEligibilityStatusResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100087A1C((uint64_t)self + OBJC_IVAR____TtC13transparencyd25KTEligibilityStatusResult_dateStored, (uint64_t *)&unk_10031F9A0);
}

@end