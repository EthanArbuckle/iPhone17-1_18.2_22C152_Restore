@interface KTFixupRemoveMacAppSupportFiles
+ (NSString)fixupName;
+ (void)setFixupName:(id)a3;
- (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles)init;
- (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles)initWithDependencies:(id)a3;
- (id)doFixupOperation;
@end

@implementation KTFixupRemoveMacAppSupportFiles

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
  qword_100322420 = v3;
  off_100322428 = v5;
  swift_bridgeObjectRelease();
}

- (id)doFixupOperation
{
  return 0;
}

- (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles)initWithDependencies:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd31KTFixupRemoveMacAppSupportFiles_deps) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for KTFixupRemoveMacAppSupportFiles();
  id v4 = a3;
  return [(KTFixupRemoveMacAppSupportFiles *)&v6 init];
}

- (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles)init
{
  result = (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end