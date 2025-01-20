@interface PlaceSummaryViewModelTemplate
- (BOOL)containsPhotoCarouselLine;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (BOOL)searchAlongRoute;
- (_TtC4Maps19PlaceSummaryMetrics)metrics;
- (_TtC4Maps29PlaceSummaryViewModelTemplate)init;
- (double)containerWidth;
- (id)hyperlinkString;
- (int)hyperlinkType;
- (int)trailingEntityType;
- (void)setContainerWidth:(double)a3;
- (void)setContainsPhotoCarouselLine:(BOOL)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setMetrics:(id)a3;
@end

@implementation PlaceSummaryViewModelTemplate

- (BOOL)isSelected
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  return v5;
}

- (void)setIsSelected:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  static Published.subscript.setter();
}

- (double)containerWidth
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  return v5;
}

- (void)setContainerWidth:(double)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  static Published.subscript.setter();
}

- (BOOL)searchAlongRoute
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_searchAlongRoute);
}

- (_TtC4Maps19PlaceSummaryMetrics)metrics
{
  return (_TtC4Maps19PlaceSummaryMetrics *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_metrics));
}

- (void)setMetrics:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_metrics);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_metrics) = (Class)a3;
  id v3 = a3;
}

- (BOOL)containsPhotoCarouselLine
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_containsPhotoCarouselLine);
}

- (void)setContainsPhotoCarouselLine:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_containsPhotoCarouselLine) = a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    double v5 = self;
  }
  char v6 = sub_1001A08DC((uint64_t)v8);

  sub_1000FF2E0((uint64_t)v8, (uint64_t *)&unk_1015CD260);
  return v6 & 1;
}

- (_TtC4Maps29PlaceSummaryViewModelTemplate)init
{
  result = (_TtC4Maps29PlaceSummaryViewModelTemplate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate__lines;
  uint64_t v4 = sub_1000FF33C(&qword_1015D2B30);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  double v5 = (char *)self + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate__leadingEntity;
  uint64_t v6 = sub_1000FF33C(&qword_1015D2AE8);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate__trailingEntity, v6);
  v8 = (char *)self + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate__isSelected;
  uint64_t v9 = sub_1000FF33C((uint64_t *)&unk_1015D5AD0);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate__containerWidth;
  uint64_t v11 = sub_1000FF33C(&qword_1015D2AE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryViewModelTemplate_metrics);
}

- (int)trailingEntityType
{
  v2 = self;
  int v3 = sub_1001A7F20();

  return v3;
}

- (id)hyperlinkString
{
  v2 = self;
  sub_1001A8074();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return v5;
}

- (int)hyperlinkType
{
  v2 = self;
  int v3 = sub_1001A8EBC();

  return v3;
}

@end