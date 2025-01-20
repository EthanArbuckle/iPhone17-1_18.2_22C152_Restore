@interface TTRIApplication
- (BOOL)runTest:(id)a3 options:(id)a4;
- (_TtC9Reminders15TTRIApplication)init;
- (id)_extendLaunchTest;
@end

@implementation TTRIApplication

- (id)_extendLaunchTest
{
  type metadata accessor for PPTLaunch_ExtendedApp();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v4 = self;
  v5 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC9Reminders15TTRIApplication)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRIApplication();
  return [(TTRIApplication *)&v3 init];
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  if (!a3)
  {
    if (!a4) {
      goto LABEL_12;
    }
    LOBYTE(self) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    __break(1u);
    goto LABEL_11;
  }
  NSString v6 = self;
  self = (_TtC9Reminders15TTRIApplication *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v4 = v7;
  if (!a4)
  {
LABEL_11:
    if (v4) {
      goto LABEL_13;
    }
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v8 = self;
  self = (_TtC9Reminders15TTRIApplication *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (!v4) {
    goto LABEL_12;
  }
  if (!self)
  {
LABEL_13:
    __break(1u);
    return (char)self;
  }
  v9 = v6;
  if (sub_1005F8E00((uint64_t)v8, v4, (uint64_t)v9))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unsigned __int8 v10 = 1;
  }
  else
  {
    NSString v11 = String._bridgeToObjectiveC()();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    v14.receiver = v9;
    v14.super_class = (Class)type metadata accessor for TTRIApplication();
    unsigned __int8 v10 = [(TTRIApplication *)&v14 runTest:v11 options:isa];

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  LOBYTE(self) = v10;
  return (char)self;
}

@end