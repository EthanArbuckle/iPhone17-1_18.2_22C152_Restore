@interface FMPFSKPatternFragmentNode
- (NSString)description;
- (_TtC10TVRemoteUI25FMPFSKPatternFragmentNode)init;
- (_TtC10TVRemoteUI25FMPFSKPatternFragmentNode)initWithCoder:(id)a3;
@end

@implementation FMPFSKPatternFragmentNode

- (_TtC10TVRemoteUI25FMPFSKPatternFragmentNode)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized FMPFSKPatternFragmentNode.init(coder:)();
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = FMPFSKPatternFragmentNode.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x22A677130](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC10TVRemoteUI25FMPFSKPatternFragmentNode)init
{
  result = (_TtC10TVRemoteUI25FMPFSKPatternFragmentNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI25FMPFSKPatternFragmentNode_gimbalNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI25FMPFSKPatternFragmentNode_dotNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI25FMPFSKPatternFragmentNode_perimeterRotateOnceAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI25FMPFSKPatternFragmentNode_disturbanceScatterOffsetXSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI25FMPFSKPatternFragmentNode_disturbanceScatterOffsetYSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI25FMPFSKPatternFragmentNode_disturbanceHomingFactorSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI25FMPFSKPatternFragmentNode_headingSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI25FMPFSKPatternFragmentNode_noiseSubSpring));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10TVRemoteUI25FMPFSKPatternFragmentNode_renderingColor);
}

@end