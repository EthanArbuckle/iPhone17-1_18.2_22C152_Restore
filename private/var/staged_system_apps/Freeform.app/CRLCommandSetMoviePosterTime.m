@interface CRLCommandSetMoviePosterTime
- (NSString)creator;
- (NSString)title;
- (NSUUID)id;
- (_TtC8Freeform28CRLCommandSetMoviePosterTime)init;
- (_TtC8Freeform28CRLCommandSetMoviePosterTime)initWithId:(id)a3 movieData:(id)a4 posterImageData:(id)a5 posterTime:(double)a6 startTime:(double)a7 endTime:(double)a8 title:(id)a9 creator:(id)a10;
- (_TtC8Freeform28CRLCommandSetMoviePosterTime)initWithMovieItem:(id)a3 movieData:(id)a4 posterImageData:(id)a5 posterTime:(double)a6 startTime:(double)a7 endTime:(double)a8 title:(id)a9 creator:(id)a10;
- (_TtC8Freeform8CRLAsset)movieData;
- (_TtC8Freeform8CRLAsset)posterImageData;
- (double)endTime;
- (double)posterTime;
- (double)startTime;
@end

@implementation CRLCommandSetMoviePosterTime

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (_TtC8Freeform8CRLAsset)movieData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_movieData));
}

- (_TtC8Freeform8CRLAsset)posterImageData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_posterImageData));
}

- (double)posterTime
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_posterTime);
}

- (double)startTime
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_startTime);
}

- (double)endTime
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_endTime);
}

- (NSString)title
{
  return (NSString *)sub_1006BFB84((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_title);
}

- (NSString)creator
{
  return (NSString *)sub_1006BFB84((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_creator);
}

- (_TtC8Freeform28CRLCommandSetMoviePosterTime)initWithId:(id)a3 movieData:(id)a4 posterImageData:(id)a5 posterTime:(double)a6 startTime:(double)a7 endTime:(double)a8 title:(id)a9 creator:(id)a10
{
  uint64_t v17 = type metadata accessor for UUID();
  __chkstk_darwin(v17 - 8, v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (!a9)
  {
    uint64_t v22 = 0;
    if (a10) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v24 = 0;
    goto LABEL_6;
  }
  a9 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;
  if (!a10) {
    goto LABEL_5;
  }
LABEL_3:
  a10 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;
LABEL_6:
  id v25 = a4;
  id v26 = a5;
  return (_TtC8Freeform28CRLCommandSetMoviePosterTime *)sub_1006BFC94((uint64_t)v20, v25, a5, (uint64_t)a9, v22, (uint64_t)a10, v24, a6, a7, a8);
}

- (_TtC8Freeform28CRLCommandSetMoviePosterTime)initWithMovieItem:(id)a3 movieData:(id)a4 posterImageData:(id)a5 posterTime:(double)a6 startTime:(double)a7 endTime:(double)a8 title:(id)a9 creator:(id)a10
{
  uint64_t v10 = (uint64_t)a10;
  if (!a9)
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    if (a10) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v21 = 0;
    goto LABEL_6;
  }
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;
LABEL_6:
  uint64_t v22 = (char *)a3;
  id v23 = a4;
  id v24 = a5;
  return (_TtC8Freeform28CRLCommandSetMoviePosterTime *)sub_1006C008C(v22, v23, a5, v17, v19, v10, v21, a6, a7, a8);
}

- (_TtC8Freeform28CRLCommandSetMoviePosterTime)init
{
  result = (_TtC8Freeform28CRLCommandSetMoviePosterTime *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_posterImageData));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end