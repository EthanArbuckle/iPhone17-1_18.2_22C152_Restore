@interface SILConstraints
- (NSArray)devices;
- (NSString)constraintsFile;
- (_TtC10SILManager14SILConstraints)init;
- (unsigned)noticeableFrame;
- (void)setConstraintsFile:(id)a3;
@end

@implementation SILConstraints

- (NSString)constraintsFile
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10SILManager14SILConstraints_constraintsFile);
  swift_beginAccess();
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x261165820](v4, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setConstraintsFile:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10SILManager14SILConstraints_constraintsFile);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)devices
{
  return (NSArray *)@objc SILConstraints.devices.getter();
}

- (unsigned)noticeableFrame
{
  return *(_WORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager14SILConstraints_noticeableFrame);
}

- (_TtC10SILManager14SILConstraints)init
{
  result = (_TtC10SILManager14SILConstraints *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end