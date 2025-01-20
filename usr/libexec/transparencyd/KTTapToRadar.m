@interface KTTapToRadar
+ (id)SASTTRRequestWithUnique:(id)a3 title:(id)a4 description:(id)a5 relatedRadar:(id)a6 radar:(id)a7 failingDevices:(id)a8 error:(id *)a9;
- (BOOL)hasRecentlyFiledTTRWithTapToRadarType:(id)a3;
- (_TtC13transparencyd12KTTapToRadar)init;
- (_TtC13transparencyd12KTTapToRadar)initWithDataStore:(id)a3 configBag:(id)a4 dewConfig:(id)a5;
- (void)clearTapToRadarWithUnique:(id)a3;
- (void)presentTapToRadarError:(id)a3 title:(id)a4 message:(id)a5;
- (void)presentTapToRadarRemote:(id)a3 fromHandle:(id)a4;
@end

@implementation KTTapToRadar

- (_TtC13transparencyd12KTTapToRadar)initWithDataStore:(id)a3 configBag:(id)a4 dewConfig:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (_TtC13transparencyd12KTTapToRadar *)sub_1000C80CC(v7, v8, v9);

  return v10;
}

- (BOOL)hasRecentlyFiledTTRWithTapToRadarType:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  id v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = KTTapToRadar.hasRecentlyFiledTTR(tapToRadarType:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

+ (id)SASTTRRequestWithUnique:(id)a3 title:(id)a4 description:(id)a5 relatedRadar:(id)a6 radar:(id)a7 failingDevices:(id)a8 error:(id *)a9
{
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  v16 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  sub_1000C926C();
  sub_1000C92AC();
  uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v28 = a6;
  id v20 = a7;
  sub_1000C8B84(v27, v12, v13, v15, v16, v18, a6, a7, v19);
  uint64_t v22 = v21;
  unint64_t v24 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v25.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100080CB0(v22, v24);

  return v25.super.isa;
}

- (void)presentTapToRadarRemote:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  KTTapToRadar.presentTap(toRadarRemote:fromHandle:)(v8, v10, v11, v13);
  swift_bridgeObjectRelease();
  sub_100080CB0(v8, v10);
}

- (void)clearTapToRadarWithUnique:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd12KTTapToRadar_dataStore);
  v5 = self;
  id v6 = String._bridgeToObjectiveC()();
  [v4 storeTTR:0 withType:v6];

  swift_bridgeObjectRelease();
}

- (void)presentTapToRadarError:(id)a3 title:(id)a4 message:(id)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = self;
  v16._countAndFlagsBits = v6;
  v16._object = v8;
  v17._countAndFlagsBits = v9;
  v17._object = v11;
  v18._countAndFlagsBits = v12;
  v18._object = v14;
  KTTapToRadar.presentTapToRadarError(unique:title:message:)(v16, v17, v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC13transparencyd12KTTapToRadar)init
{
  result = (_TtC13transparencyd12KTTapToRadar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd12KTTapToRadar_configBag);
}

@end