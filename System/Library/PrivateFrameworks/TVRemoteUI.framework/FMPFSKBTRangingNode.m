@interface FMPFSKBTRangingNode
- (_TtC10TVRemoteUI19FMPFSKBTRangingNode)init;
- (_TtC10TVRemoteUI19FMPFSKBTRangingNode)initWithCoder:(id)a3;
@end

@implementation FMPFSKBTRangingNode

- (_TtC10TVRemoteUI19FMPFSKBTRangingNode)init
{
  return (_TtC10TVRemoteUI19FMPFSKBTRangingNode *)FMPFSKBTRangingNode.init()();
}

- (_TtC10TVRemoteUI19FMPFSKBTRangingNode)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized FMPFSKBTRangingNode.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI19FMPFSKBTRangingNode_rangeDiskNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI19FMPFSKBTRangingNode_rangeDotNode));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10TVRemoteUI19FMPFSKBTRangingNode_levelRingsNode);
}

@end