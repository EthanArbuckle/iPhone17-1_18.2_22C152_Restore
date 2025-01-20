@interface SEKeySyncManager
+ (_TtC10seserviced16SEKeySyncManager)singleton;
+ (void)kickOff;
- (NSString)ptcViewName;
- (_TtC10seserviced16SEKeySyncManager)init;
- (id)getAvailableTLKForViewName:(id)a3 secureElement:(id)a4;
- (id)haveAvailableTLKForEncryptedData:(id)a3 secureElement:(id)a4 error:(id *)a5;
- (void)onAlarm:(id)a3;
- (void)onDarwinNotification:(id)a3;
@end

@implementation SEKeySyncManager

+ (_TtC10seserviced16SEKeySyncManager)singleton
{
  if (qword_1004536F8 != -1) {
    swift_once();
  }
  v2 = (void *)swift_retain();

  return (_TtC10seserviced16SEKeySyncManager *)v2;
}

- (NSString)ptcViewName
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC10seserviced16SEKeySyncManager)init
{
  return (_TtC10seserviced16SEKeySyncManager *)sub_1001414D8();
}

+ (void)kickOff
{
}

- (void)onDarwinNotification:(id)a3
{
  uint64_t v4 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v4 - 8, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = v8;
  v12[6] = v10;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_10028E720((uint64_t)v7, (uint64_t)&unk_1004565E8, (uint64_t)v12);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (id)getAvailableTLKForViewName:(id)a3 secureElement:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;
  id v8 = a4;
  swift_retain();
  uint64_t v9 = sub_1001445A0(v5, v7, v8);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  swift_release();

  if (v11 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100075868(v9, v11);
  }

  return isa;
}

- (id)haveAvailableTLKForEncryptedData:(id)a3 secureElement:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  swift_retain();
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  Class v11 = sub_100146738(v8, v10, v7);
  swift_release();
  sub_10006D144(v8, (unint64_t)v10);

  return v11;
}

- (void)onAlarm:(id)a3
{
  uint64_t v4 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v4 - 8, v5);
  id v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  strcpy((char *)v16, "Retry Alarm ");
  BYTE5(v16[1]) = 0;
  HIWORD(v16[1]) = -5120;
  swift_retain();
  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  uint64_t v13 = v16[0];
  uint64_t v12 = v16[1];
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v7, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = v13;
  v15[6] = v12;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_10028E720((uint64_t)v7, (uint64_t)&unk_100456580, (uint64_t)v15);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end