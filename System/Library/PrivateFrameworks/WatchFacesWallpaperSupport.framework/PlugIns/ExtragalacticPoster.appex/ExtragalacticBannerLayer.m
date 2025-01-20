@interface ExtragalacticBannerLayer
- (_TtC19ExtragalacticPoster24ExtragalacticBannerLayer)init;
- (_TtC19ExtragalacticPoster24ExtragalacticBannerLayer)initWithCoder:(id)a3;
- (_TtC19ExtragalacticPoster24ExtragalacticBannerLayer)initWithLayer:(id)a3;
@end

@implementation ExtragalacticBannerLayer

- (_TtC19ExtragalacticPoster24ExtragalacticBannerLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExtragalacticBannerLayer();
  return [(BannerLayer *)&v3 init];
}

- (_TtC19ExtragalacticPoster24ExtragalacticBannerLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_100018BE0();
  swift_unknownObjectRelease();
  sub_1000071C0(v8, v8[3]);
  uint64_t v4 = sub_100018DD0();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ExtragalacticBannerLayer();
  v5 = [(BannerLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  sub_1000070CC((uint64_t)v8);
  return v5;
}

- (_TtC19ExtragalacticPoster24ExtragalacticBannerLayer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ExtragalacticBannerLayer();
  return [(BannerLayer *)&v5 initWithCoder:a3];
}

@end