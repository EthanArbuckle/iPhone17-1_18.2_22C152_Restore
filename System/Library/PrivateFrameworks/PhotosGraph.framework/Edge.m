@interface Edge
- (KGNode)sourceNode;
- (KGNode)targetNode;
- (NSDictionary)properties;
- (NSSet)labels;
- (_TtC11PhotosGraph4Edge)init;
- (_TtC11PhotosGraph4Edge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7;
- (unint64_t)identifier;
- (void)resolveIdentifier:(unint64_t)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setLabels:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSourceNode:(id)a3;
- (void)setTargetNode:(id)a3;
@end

@implementation Edge

- (KGNode)targetNode
{
  v2 = (void *)swift_unknownObjectRetain();
  return (KGNode *)v2;
}

- (void)setTargetNode:(id)a3
{
}

- (KGNode)sourceNode
{
  v2 = (void *)swift_unknownObjectRetain();
  return (KGNode *)v2;
}

- (void)setSourceNode:(id)a3
{
}

- (unint64_t)identifier
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_identifier);
}

- (void)setIdentifier:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_identifier) = (Class)a3;
}

- (NSSet)labels
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBE420();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)setLabels:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_labels) = (Class)sub_1D1EBE430();
  swift_bridgeObjectRelease();
}

- (NSDictionary)properties
{
  sub_1D190FE44();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBDCC0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setProperties:(id)a3
{
  sub_1D190FE44();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_properties) = (Class)sub_1D1EBDCE0();
  swift_bridgeObjectRelease();
}

- (_TtC11PhotosGraph4Edge)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  v11 = (objc_class *)sub_1D1EBE430();
  sub_1D190FE44();
  v12 = (objc_class *)sub_1D1EBDCE0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_identifier) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_labels) = v11;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_properties) = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_sourceNode) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_targetNode) = (Class)a7;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for Edge();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return [(Edge *)&v14 init];
}

- (void)resolveIdentifier:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Edge_identifier) = (Class)a3;
}

- (_TtC11PhotosGraph4Edge)init
{
  result = (_TtC11PhotosGraph4Edge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end