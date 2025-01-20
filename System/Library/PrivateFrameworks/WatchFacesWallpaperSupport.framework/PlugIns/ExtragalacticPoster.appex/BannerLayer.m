@interface BannerLayer
- (_TtC19ExtragalacticPoster11BannerLayer)init;
- (_TtC19ExtragalacticPoster11BannerLayer)initWithCoder:(id)a3;
- (_TtC19ExtragalacticPoster11BannerLayer)initWithLayer:(id)a3;
@end

@implementation BannerLayer

- (_TtC19ExtragalacticPoster11BannerLayer)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ExtragalacticPoster11BannerLayer_descriptor) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ExtragalacticPoster11BannerLayer_shapeLayers) = (Class)&_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BannerLayer();
  return [(BannerLayer *)&v3 init];
}

- (_TtC19ExtragalacticPoster11BannerLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_100018BE0();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ExtragalacticPoster11BannerLayer_descriptor) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ExtragalacticPoster11BannerLayer_shapeLayers) = (Class)&_swiftEmptyArrayStorage;
  sub_1000071C0(v8, v8[3]);
  uint64_t v4 = sub_100018DD0();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BannerLayer();
  v5 = [(BannerLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  sub_1000070CC((uint64_t)v8);
  return v5;
}

- (_TtC19ExtragalacticPoster11BannerLayer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ExtragalacticPoster11BannerLayer_descriptor) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ExtragalacticPoster11BannerLayer_shapeLayers) = (Class)&_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BannerLayer();
  return [(BannerLayer *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end