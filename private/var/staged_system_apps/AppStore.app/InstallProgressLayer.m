@interface InstallProgressLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (_TtC8AppStore20InstallProgressLayer)init;
- (_TtC8AppStore20InstallProgressLayer)initWithCoder:(id)a3;
- (_TtC8AppStore20InstallProgressLayer)initWithLayer:(id)a3;
- (id)actionForKey:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation InstallProgressLayer

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  if (v3 == 0x73736572676F7270 && v5 == 0xE800000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || v3 == 0x6F72507265746E65 && v5 == 0xED00007373657267
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || v3 == 0x676F725074697865 && v5 == 0xEC00000073736572
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    NSString v9 = String._bridgeToObjectiveC()();
    v10.receiver = ObjCClassFromMetadata;
    v10.super_class = (Class)&OBJC_METACLASS____TtC8AppStore20InstallProgressLayer;
    unsigned __int8 v6 = [super needsDisplayForKey:v9];
    swift_bridgeObjectRelease();
  }
  return v6;
}

- (id)actionForKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = sub_1001CB1DC(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  sub_1001CB4FC(v4);
}

- (_TtC8AppStore20InstallProgressLayer)init
{
  return (_TtC8AppStore20InstallProgressLayer *)sub_1001CBCE8();
}

- (_TtC8AppStore20InstallProgressLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC8AppStore20InstallProgressLayer *)sub_1001CBDD8(v4);
}

- (_TtC8AppStore20InstallProgressLayer)initWithCoder:(id)a3
{
  return (_TtC8AppStore20InstallProgressLayer *)sub_1001CBF30(a3);
}

- (void).cxx_destruct
{
}

@end