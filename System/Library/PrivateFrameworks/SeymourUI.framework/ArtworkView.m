@interface ArtworkView
- (_TtC9SeymourUI11ArtworkView)initWithCoder:(id)a3;
- (_TtC9SeymourUI11ArtworkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArtworkView

- (_TtC9SeymourUI11ArtworkView)initWithFrame:(CGRect)a3
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for ArtworkView());
  v4 = sub_239FA877C(0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC9SeymourUI11ArtworkView *)v4;
}

- (_TtC9SeymourUI11ArtworkView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239FA8BF8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239FA7E6C();
}

- (void).cxx_destruct
{
  sub_239FA8DB0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI11ArtworkView_artwork);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI11ArtworkView_layoutHandler));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI11ArtworkView_layout);
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI11ArtworkView_imageView);
}

@end