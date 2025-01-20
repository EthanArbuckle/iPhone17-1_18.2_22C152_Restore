@interface Node
- (NSDictionary)properties;
- (NSSet)labels;
- (_TtC11PhotosGraph4Node)init;
- (_TtC11PhotosGraph4Node)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5;
- (unint64_t)identifier;
- (void)resolveIdentifier:(unint64_t)a3;
- (void)setIdentifier:(unint64_t)a3;
@end

@implementation Node

- (unint64_t)identifier
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_identifier);
}

- (void)setIdentifier:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_identifier) = (Class)a3;
}

- (NSSet)labels
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBE420();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (NSDictionary)properties
{
  sub_1D190FE44();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBDCC0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtC11PhotosGraph4Node)initWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  v7 = (objc_class *)sub_1D1EBE430();
  sub_1D190FE44();
  v8 = (objc_class *)sub_1D1EBDCE0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_identifier) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_labels) = v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_properties) = v8;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for Node();
  return [(Node *)&v10 init];
}

- (void)resolveIdentifier:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph4Node_identifier) = (Class)a3;
}

- (_TtC11PhotosGraph4Node)init
{
  result = (_TtC11PhotosGraph4Node *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end