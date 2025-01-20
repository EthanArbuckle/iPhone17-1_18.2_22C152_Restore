@interface FMClusteredAnnotationView
- (MKAnnotation)annotation;
- (_TtC6FindMy25FMClusteredAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC6FindMy25FMClusteredAnnotationView)initWithCoder:(id)a3;
- (void)prepareForDisplay;
- (void)setAnnotation:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMClusteredAnnotationView

- (MKAnnotation)annotation
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(FMClusteredAnnotationView *)&v4 annotation];

  return v2;
}

- (void)setAnnotation:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100083388((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (_TtC6FindMy25FMClusteredAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = swift_unknownObjectRetain();
  return (_TtC6FindMy25FMClusteredAnnotationView *)sub_100082518(v7, v4, v6);
}

- (_TtC6FindMy25FMClusteredAnnotationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000834BC();
}

- (void)prepareForDisplay
{
  v2 = self;
  sub_100082E4C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(FMClusteredAnnotationView *)&v7 traitCollectionDidChange:v4];
  unint64_t v6 = swift_bridgeObjectRetain();
  sub_100081834(v6);
  swift_bridgeObjectRelease();
  sub_100082C88();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_balloonLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_firstImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_secondImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_thirdImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_additionalCount));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_additionalText));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_puckBackgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_puckIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_cachedHomeIcon));

  swift_bridgeObjectRelease();
}

@end