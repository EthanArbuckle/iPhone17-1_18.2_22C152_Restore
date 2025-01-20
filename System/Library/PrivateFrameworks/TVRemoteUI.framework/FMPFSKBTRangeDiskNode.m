@interface FMPFSKBTRangeDiskNode
- (_TtC10TVRemoteUI21FMPFSKBTRangeDiskNode)init;
- (_TtC10TVRemoteUI21FMPFSKBTRangeDiskNode)initWithCoder:(id)a3;
@end

@implementation FMPFSKBTRangeDiskNode

- (_TtC10TVRemoteUI21FMPFSKBTRangeDiskNode)init
{
  uint64_t v3 = OBJC_IVAR____TtC10TVRemoteUI21FMPFSKBTRangeDiskNode_sizeSpring;
  v4 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)specialized static FMPFFluidSpring.lazySpringWith(initialValue:stableValueThreshold:)(0, 0, 0x3F50624DD2F1A9FCLL, 0);
  uint64_t v5 = OBJC_IVAR____TtC10TVRemoteUI21FMPFSKBTRangeDiskNode_opacitySpring;
  *(Class *)((char *)&v4->super.super.super.super.super.isa + v5) = (Class)specialized static FMPFFluidSpring.defaultSpringWith(initialValue:stableValueThreshold:response:)(0, 0, 0x3F847AE147AE147BLL, 0, 0, 1);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for FMPFSKBTRangeDiskNode();
  v6 = [(FMPFSKShapeNode *)&v8 init];
  FMPFSKBTRangeDiskNode.setup()();

  return v6;
}

- (_TtC10TVRemoteUI21FMPFSKBTRangeDiskNode)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC10TVRemoteUI21FMPFSKBTRangeDiskNode_sizeSpring;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)specialized static FMPFFluidSpring.lazySpringWith(initialValue:stableValueThreshold:)(0, 0, 0x3F50624DD2F1A9FCLL, 0);
  uint64_t v6 = OBJC_IVAR____TtC10TVRemoteUI21FMPFSKBTRangeDiskNode_opacitySpring;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)specialized static FMPFFluidSpring.defaultSpringWith(initialValue:stableValueThreshold:response:)(0, 0, 0x3F847AE147AE147BLL, 0, 0, 1);

  result = (_TtC10TVRemoteUI21FMPFSKBTRangeDiskNode *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMPFSKBTRangeDiskNode_sizeSpring));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10TVRemoteUI21FMPFSKBTRangeDiskNode_opacitySpring);
}

@end