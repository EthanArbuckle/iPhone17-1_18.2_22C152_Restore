@interface CuratedGuideViewModel
- (BOOL)isEqual:(id)a3;
- (BOOL)useRichLayout;
- (GEOPlaceCollection)placeCollection;
- (NSString)guideNumberOfPlaces;
- (NSString)guideSubtitle;
- (NSString)guideTitle;
- (_TtC4Maps19GuideSummaryMetrics)metrics;
- (_TtC4Maps21CuratedGuideViewModel)init;
- (_TtC4Maps21CuratedGuideViewModel)initWithPlaceCollection:(id)a3 useRichLayout:(BOOL)a4;
- (double)guideBrickHeight;
- (double)guideBrickWidth;
- (double)width;
- (int64_t)hash;
- (void)setMetrics:(id)a3;
- (void)setWidth:(double)a3;
@end

@implementation CuratedGuideViewModel

- (GEOPlaceCollection)placeCollection
{
  return (GEOPlaceCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_placeCollection));
}

- (BOOL)useRichLayout
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_useRichLayout);
}

- (_TtC4Maps19GuideSummaryMetrics)metrics
{
  return (_TtC4Maps19GuideSummaryMetrics *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_metrics));
}

- (void)setMetrics:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_metrics);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_metrics) = (Class)a3;
  id v3 = a3;
}

- (double)width
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  return v5;
}

- (void)setWidth:(double)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = self;
  static Published.subscript.setter();
}

- (_TtC4Maps21CuratedGuideViewModel)initWithPlaceCollection:(id)a3 useRichLayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = (_TtC4Maps21CuratedGuideViewModel *)sub_1001FF84C(v5, v4);

  return v6;
}

- (NSString)guideNumberOfPlaces
{
  v2 = self;
  sub_1001FEB18();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)guideTitle
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_placeCollection);
  NSString v3 = self;
  id v4 = [v2 collectionTitle];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (NSString)guideSubtitle
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel_placeCollection);
  NSString v3 = self;
  id v4 = [v2 publisherAttribution];
  if (v4
    && (id v5 = [v4 displayName], swift_unknownObjectRelease(), v5))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (double)guideBrickWidth
{
  v2 = self;
  double v3 = sub_1001FEF28();

  return v3;
}

- (double)guideBrickHeight
{
  v2 = self;
  double v3 = sub_1001FF02C();

  return v3;
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
    id v5 = self;
  }
  char v6 = sub_1001FF0E8((uint64_t)v8);

  sub_1001189D4((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = NSObject.hashValue.getter();

  return v3;
}

- (_TtC4Maps21CuratedGuideViewModel)init
{
  result = (_TtC4Maps21CuratedGuideViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel__width;
  uint64_t v4 = sub_1000FF33C(&qword_1015D2AE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel__publisherIcon;
  uint64_t v6 = sub_1000FF33C(&qword_1015D2B18);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v6 - 8), v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC4Maps21CuratedGuideViewModel__collectionImage;

  v8(v7, v6);
}

@end