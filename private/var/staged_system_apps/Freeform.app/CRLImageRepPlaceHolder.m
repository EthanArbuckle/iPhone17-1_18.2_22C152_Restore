@interface CRLImageRepPlaceHolder
- (NSString)previewItemTitle;
- (NSURL)previewItemURL;
- (_TtC8Freeform22CRLImageRepPlaceHolder)init;
- (void)setPreviewItemURL:(id)a3;
@end

@implementation CRLImageRepPlaceHolder

- (NSURL)previewItemURL
{
  uint64_t v3 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemURL;
  swift_beginAccess();
  sub_1005F7C80((uint64_t)v7, (uint64_t)v6);
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    v11 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (NSURL *)v11;
}

- (void)setPreviewItemURL:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = (char *)self + OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemURL;
  swift_beginAccess();
  v12 = self;
  sub_100757E50((uint64_t)v8, (uint64_t)v11);
  swift_endAccess();
}

- (NSString)previewItemTitle
{
  if (*(void *)&self->previewItemTitle[OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemTitle])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (_TtC8Freeform22CRLImageRepPlaceHolder)init
{
  result = (_TtC8Freeform22CRLImageRepPlaceHolder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemURL, &qword_101672E90);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_imageRep);
}

@end