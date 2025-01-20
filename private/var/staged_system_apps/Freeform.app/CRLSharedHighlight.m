@interface CRLSharedHighlight
- (NSString)description;
- (_TtC8Freeform18CRLSharedHighlight)init;
@end

@implementation CRLSharedHighlight

- (NSString)description
{
  v2 = self;
  sub_10053C5C0();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC8Freeform18CRLSharedHighlight)init
{
  result = (_TtC8Freeform18CRLSharedHighlight *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC8Freeform18CRLSharedHighlight_shareURL;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_100510028((uint64_t)self + OBJC_IVAR____TtC8Freeform18CRLSharedHighlight_boardIdentifier);
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform18CRLSharedHighlight_timeStamp;
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform18CRLSharedHighlight_previewImage);
}

@end