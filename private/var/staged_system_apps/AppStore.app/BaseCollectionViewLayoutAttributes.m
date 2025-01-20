@interface BaseCollectionViewLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (_TtC8AppStore34BaseCollectionViewLayoutAttributes)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation BaseCollectionViewLayoutAttributes

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1000893E4((uint64_t)v8);

  sub_100089384((uint64_t)v8);
  return v6;
}

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_10008964C((uint64_t)a3, (uint64_t)v7);

  sub_100081D90(v7, v7[3]);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v7);
  return v5;
}

- (_TtC8AppStore34BaseCollectionViewLayoutAttributes)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8AppStore34BaseCollectionViewLayoutAttributes_rubberbandingDistance) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore34BaseCollectionViewLayoutAttributes_parallaxY) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8AppStore34BaseCollectionViewLayoutAttributes_isRubberbanding) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BaseCollectionViewLayoutAttributes();
  return [(BaseCollectionViewLayoutAttributes *)&v3 init];
}

@end