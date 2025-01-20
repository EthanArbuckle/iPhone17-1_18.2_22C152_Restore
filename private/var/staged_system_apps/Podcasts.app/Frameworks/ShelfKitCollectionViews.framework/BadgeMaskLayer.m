@interface BadgeMaskLayer
- (_TtC23ShelfKitCollectionViews14BadgeMaskLayer)init;
- (_TtC23ShelfKitCollectionViews14BadgeMaskLayer)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews14BadgeMaskLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation BadgeMaskLayer

- (_TtC23ShelfKitCollectionViews14BadgeMaskLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_385640();
  swift_unknownObjectRelease();
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14BadgeMaskLayer_size);
  v5 = (objc_class *)type metadata accessor for BadgeMaskLayer();
  void *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = v5;
  v6 = [(BadgeMaskLayer *)&v8 init];
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

- (_TtC23ShelfKitCollectionViews14BadgeMaskLayer)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14BadgeMaskLayer_size);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews14BadgeMaskLayer *)sub_385890();
  __break(1u);
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  id v5 = self;
  sub_2543DC(v4);
}

- (_TtC23ShelfKitCollectionViews14BadgeMaskLayer)init
{
  result = (_TtC23ShelfKitCollectionViews14BadgeMaskLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end