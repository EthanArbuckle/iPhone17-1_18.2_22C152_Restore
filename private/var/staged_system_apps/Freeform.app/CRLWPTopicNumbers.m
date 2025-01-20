@interface CRLWPTopicNumbers
- (_TtC8Freeform17CRLWPTopicNumbers)init;
- (_TtC8Freeform17CRLWPTopicNumbers)initWithStorage:(id)a3;
- (id)numberedListLabelForCharIndex:(int64_t)a3 includeFormatting:(BOOL)a4;
- (unint64_t)listNumberForCharIndex:(int64_t)a3;
- (void)invalidateFromCharIndex:(int64_t)a3;
@end

@implementation CRLWPTopicNumbers

- (_TtC8Freeform17CRLWPTopicNumbers)initWithStorage:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC8Freeform17CRLWPTopicNumbers_topicNumberData;
  swift_unknownObjectRetain();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_100A3CDB8((uint64_t)_swiftEmptyArrayStorage);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC8Freeform17CRLWPTopicNumbers_invalidCharIndex) = 0;
  type metadata accessor for CRLWPStorage();
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC8Freeform17CRLWPTopicNumbers_storage) = (Class)swift_dynamicCastClassUnconditional();
  swift_unknownObjectRetain();

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CRLWPTopicNumbers();
  v6 = [(CRLWPTopicNumbers *)&v8 init];
  swift_unknownObjectRelease();
  return v6;
}

- (void)invalidateFromCharIndex:(int64_t)a3
{
  uint64_t v4 = self;
  CRLWPTopicNumbers.invalidate(from:)(a3);
}

- (unint64_t)listNumberForCharIndex:(int64_t)a3
{
  uint64_t v4 = self;
  Swift::UInt v5 = CRLWPTopicNumbers.listNumber(for:)(a3);

  return v5;
}

- (id)numberedListLabelForCharIndex:(int64_t)a3 includeFormatting:(BOOL)a4
{
  v6 = self;
  CRLWPTopicNumbers.numberedListLabel(for:includeFormatting:)(a3, a4);

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v7;
}

- (_TtC8Freeform17CRLWPTopicNumbers)init
{
  result = (_TtC8Freeform17CRLWPTopicNumbers *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end