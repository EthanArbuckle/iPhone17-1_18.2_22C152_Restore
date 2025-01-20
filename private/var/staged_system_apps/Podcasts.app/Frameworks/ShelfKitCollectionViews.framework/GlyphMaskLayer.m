@interface GlyphMaskLayer
- (_TtC23ShelfKitCollectionViews14GlyphMaskLayer)init;
- (_TtC23ShelfKitCollectionViews14GlyphMaskLayer)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews14GlyphMaskLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation GlyphMaskLayer

- (_TtC23ShelfKitCollectionViews14GlyphMaskLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_385640();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14GlyphMaskLayer_symbolImage) = 0;
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  uint64_t v4 = sub_385970();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for GlyphMaskLayer();
  v5 = [(GlyphMaskLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

- (_TtC23ShelfKitCollectionViews14GlyphMaskLayer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14GlyphMaskLayer_symbolImage) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews14GlyphMaskLayer *)sub_385890();
  __break(1u);
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  id v4 = a3;
  v5 = self;
  sub_254770(v4);
}

- (_TtC23ShelfKitCollectionViews14GlyphMaskLayer)init
{
  result = (_TtC23ShelfKitCollectionViews14GlyphMaskLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14GlyphMaskLayer_symbolImage));
}

@end