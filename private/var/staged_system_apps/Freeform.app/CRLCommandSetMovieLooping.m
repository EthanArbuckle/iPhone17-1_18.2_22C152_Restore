@interface CRLCommandSetMovieLooping
- (BOOL)isLooping;
- (NSUUID)id;
- (_TtC8Freeform25CRLCommandSetMovieLooping)init;
- (_TtC8Freeform25CRLCommandSetMovieLooping)initWithId:(id)a3 isLooping:(BOOL)a4;
- (_TtC8Freeform25CRLCommandSetMovieLooping)initWithMovieItem:(id)a3 isLooping:(BOOL)a4;
@end

@implementation CRLCommandSetMovieLooping

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (BOOL)isLooping
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLCommandSetMovieLooping_isLooping);
}

- (_TtC8Freeform25CRLCommandSetMovieLooping)initWithId:(id)a3 isLooping:(BOOL)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR____TtC8Freeform25CRLCommandSetMovieLooping_id, v10, v6);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLCommandSetMovieLooping_isLooping) = a4;
  v11 = (objc_class *)type metadata accessor for CRLCommandSetMovieLooping(0);
  v14.receiver = self;
  v14.super_class = v11;
  v12 = [(CRLCommandSetMovieValue *)&v14 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v12;
}

- (_TtC8Freeform25CRLCommandSetMovieLooping)initWithMovieItem:(id)a3 isLooping:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(uint64_t))(**(void **)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                       + 256);
  id v13 = a3;
  uint64_t v14 = swift_retain();
  v12(v14);
  swift_release();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v16 = [(CRLCommandSetMovieLooping *)self initWithId:isa isLooping:v4];

  return v16;
}

- (_TtC8Freeform25CRLCommandSetMovieLooping)init
{
  result = (_TtC8Freeform25CRLCommandSetMovieLooping *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end