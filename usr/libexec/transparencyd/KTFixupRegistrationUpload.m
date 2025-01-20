@interface KTFixupRegistrationUpload
+ (NSString)fixupName;
+ (void)setFixupName:(id)a3;
- (_TtC13transparencyd25KTFixupRegistrationUpload)init;
- (_TtC13transparencyd25KTFixupRegistrationUpload)initWithDependencies:(id)a3;
- (id)doFixupOperation;
@end

@implementation KTFixupRegistrationUpload

+ (NSString)fixupName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (void)setFixupName:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  swift_beginAccess();
  qword_100321630 = v3;
  off_100321638 = v5;
  swift_bridgeObjectRelease();
}

- (id)doFixupOperation
{
  NSString v2 = self;
  id v3 = sub_1000D2E70();

  return v3;
}

- (_TtC13transparencyd25KTFixupRegistrationUpload)initWithDependencies:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd25KTFixupRegistrationUpload_deps) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for KTFixupRegistrationUpload();
  id v4 = a3;
  return [(KTFixupRegistrationUpload *)&v6 init];
}

- (_TtC13transparencyd25KTFixupRegistrationUpload)init
{
  result = (_TtC13transparencyd25KTFixupRegistrationUpload *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end