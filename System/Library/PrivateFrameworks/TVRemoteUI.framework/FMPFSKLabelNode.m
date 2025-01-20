@interface FMPFSKLabelNode
- (NSString)description;
- (_TtC10TVRemoteUI15FMPFSKLabelNode)init;
- (_TtC10TVRemoteUI15FMPFSKLabelNode)initWithCoder:(id)a3;
@end

@implementation FMPFSKLabelNode

- (_TtC10TVRemoteUI15FMPFSKLabelNode)initWithCoder:(id)a3
{
  result = (_TtC10TVRemoteUI15FMPFSKLabelNode *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = FMPFSKLabelNode.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x22A677130](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC10TVRemoteUI15FMPFSKLabelNode)init
{
  result = (_TtC10TVRemoteUI15FMPFSKLabelNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC10TVRemoteUI15FMPFSKLabelNode_style));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10TVRemoteUI15FMPFSKLabelNode_labelNode);
}

@end