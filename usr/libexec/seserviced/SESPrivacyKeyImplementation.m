@interface SESPrivacyKeyImplementation
+ (void)createPrivacyKeyWithGroupIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)decryptPayload:(id)a3 groupIdentifier:(id)a4 completion:(id)a5;
+ (void)deletePrivacyKey:(id)a3 completion:(id)a4;
+ (void)encryptPayload:(id)a3 scheme:(id)a4 recipientPublicKey:(id)a5 completion:(id)a6;
+ (void)getPrivacyKeyWithGroupIdentifier:(id)a3 keyIdentifier:(id)a4 completion:(id)a5;
- (_TtC10seserviced27SESPrivacyKeyImplementation)init;
@end

@implementation SESPrivacyKeyImplementation

+ (void)createPrivacyKeyWithGroupIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  swift_getObjCClassMetadata();
  sub_100213F00(v7, v9, (uint64_t)a4, (uint64_t)sub_10021B678, v10);
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

+ (void)getPrivacyKeyWithGroupIdentifier:(id)a3 keyIdentifier:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  swift_getObjCClassMetadata();
  sub_100214434(v7, v9, v10, (uint64_t)a4, (uint64_t)sub_10021B678, v12);
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

+ (void)deletePrivacyKey:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_getObjCClassMetadata();
  id v7 = a3;
  sub_10021542C(v7, (uint64_t)sub_10011F6D0, v6);

  swift_release();
}

+ (void)decryptPayload:(id)a3 groupIdentifier:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v5;
  swift_getObjCClassMetadata();
  sub_100215CF0(v6, v7, v9, (uint64_t)sub_100219A48, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

+ (void)encryptPayload:(id)a3 scheme:(id)a4 recipientPublicKey:(id)a5 completion:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  id v10 = a3;
  id v19 = a4;
  id v11 = a5;
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;

  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v9;
  swift_getObjCClassMetadata();
  sub_100216C94(v12, v14, v19, v15, v17, (uint64_t)sub_100219498, v18);
  swift_release();
  sub_10006D144(v15, v17);
  sub_10006D144(v12, v14);
}

- (_TtC10seserviced27SESPrivacyKeyImplementation)init
{
  return (_TtC10seserviced27SESPrivacyKeyImplementation *)sub_10021895C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10seserviced27SESPrivacyKeyImplementation_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end