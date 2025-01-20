@interface FMPFSKShapeNode
- (_TtC10TVRemoteUI15FMPFSKShapeNode)init;
- (_TtC10TVRemoteUI15FMPFSKShapeNode)initWithCoder:(id)a3;
@end

@implementation FMPFSKShapeNode

- (_TtC10TVRemoteUI15FMPFSKShapeNode)init
{
  v2 = (char *)self + OBJC_IVAR____TtC10TVRemoteUI15FMPFSKShapeNode_previousBrightness;
  *(void *)v2 = 0;
  v2[8] = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMPFSKShapeNode();
  return [(SKShapeNode *)&v4 init];
}

- (_TtC10TVRemoteUI15FMPFSKShapeNode)initWithCoder:(id)a3
{
  objc_super v4 = (char *)self + OBJC_IVAR____TtC10TVRemoteUI15FMPFSKShapeNode_previousBrightness;
  *(void *)objc_super v4 = 0;
  v4[8] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMPFSKShapeNode();
  return [(SKShapeNode *)&v6 initWithCoder:a3];
}

@end