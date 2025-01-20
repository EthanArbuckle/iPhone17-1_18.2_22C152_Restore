@interface InterestSyncProcessor
+ (BOOL)canSyncInterests;
- (BOOL)hasLocalChanges;
- (BOOL)requiresNextGetTransaction;
- (_TtC8Podcasts21InterestSyncProcessor)init;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
@end

@implementation InterestSyncProcessor

- (_TtC8Podcasts21InterestSyncProcessor)init
{
  return (_TtC8Podcasts21InterestSyncProcessor *)InterestSyncProcessor.init()();
}

- (void).cxx_destruct
{
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts21InterestSyncProcessor_interestSyncStorage);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts21InterestSyncProcessor_signpostID;
  uint64_t v4 = type metadata accessor for OSSignpostID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

- (int64_t)operationTypeForSET
{
  return 18;
}

- (BOOL)hasLocalChanges
{
  uint64_t v3 = (uint64_t)self + OBJC_IVAR____TtC8Podcasts21InterestSyncProcessor_interestSyncStorage;
  swift_beginAccess();
  sub_100056D54(v3, (uint64_t)v9);
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  sub_100041A98(v9, v10);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  sub_10004D2D8((uint64_t)v9);

  return v3 & 1;
}

- (BOOL)requiresNextGetTransaction
{
  return 1;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  id v9 = a3;
  uint64_t v10 = self;
  sub_10023BD14(v6, v8);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease();
  if (v12)
  {
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }

  return v13;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  id v11 = a3;
  uint64_t v12 = self;
  uint64_t v13 = sub_10023C30C(v8, v10, a5);
  unint64_t v15 = v14;

  swift_bridgeObjectRelease();
  if (v15 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10021A3FC(v13, v15);
  }

  return isa;
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = _Block_copy(a7);
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = self;
  if (a4)
  {
    id v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    unint64_t v18 = 0xF000000000000000;
  }
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v21 = v20;

  if (a6)
  {
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;

    if (v11)
    {
LABEL_6:
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = v11;
      v26 = sub_100227ED8;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    if (v11) {
      goto LABEL_6;
    }
  }
  v26 = 0;
  uint64_t v25 = 0;
LABEL_9:
  sub_10023D8A0((uint64_t)a4, v18, v19, v21, v22, v24, (void (*)(void))v26, v25);
  sub_1000536BC((uint64_t)v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10021A3FC((uint64_t)a4, v18);
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = _Block_copy(a7);
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = self;
  if (a4)
  {
    id v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    unint64_t v18 = 0xF000000000000000;
  }
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v21 = v20;

  if (a6)
  {
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;

    if (v11)
    {
LABEL_6:
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = v11;
      v26 = sub_100227ED8;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    if (v11) {
      goto LABEL_6;
    }
  }
  v26 = 0;
  uint64_t v25 = 0;
LABEL_9:
  sub_10023DAE8(v19, v21, v22, v24, (void (*)(void))v26, v25);
  sub_1000536BC((uint64_t)v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10021A3FC((uint64_t)a4, v18);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = _Block_copy(a7);
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = self;
  if (a4)
  {
    id v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    unint64_t v18 = 0xF000000000000000;
  }
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v21 = v20;

  if (a6)
  {
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;

    if (v11)
    {
LABEL_6:
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = v11;
      v26 = sub_100227E88;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    if (v11) {
      goto LABEL_6;
    }
  }
  v26 = 0;
  uint64_t v25 = 0;
LABEL_9:
  sub_10023DD24((uint64_t)a4, v18, v19, v21, v22, v24, (uint64_t (*)(void))v26, v25);
  sub_1000536BC((uint64_t)v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10021A3FC((uint64_t)a4, v18);
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  unint64_t v9 = (char *)self + OBJC_IVAR____TtC8Podcasts21InterestSyncProcessor_interestSyncStorage;
  swift_beginAccess();
  uint64_t v10 = *((void *)v9 + 3);
  uint64_t v11 = *((void *)v9 + 4);
  sub_100055EF0((uint64_t)v9, v10);
  id v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 96);
  swift_bridgeObjectRetain();
  id v13 = a3;
  id v14 = self;
  v12(v6, v8, v10, v11);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

+ (BOOL)canSyncInterests
{
  return sub_10023E088() & 1;
}

@end