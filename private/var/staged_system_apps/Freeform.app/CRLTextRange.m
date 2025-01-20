@interface CRLTextRange
+ (_TtC8Freeform12CRLTextRange)textRangeWith:(_NSRange)a3;
+ (id)textRangeForAllOf:(id)a3;
+ (id)textRangeForEndOf:(id)a3;
+ (id)textRangeForStartOf:(id)a3;
- (BOOL)containsPosition:(id)a3;
- (BOOL)containsTextRange:(id)a3;
- (BOOL)eolAffinity;
- (BOOL)isAtParagraphBoundaryIn:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInsertionPointRange;
- (NSString)debugDescription;
- (_NSRange)nsRange;
- (_TtC8Freeform12CRLTextRange)init;
- (_TtC8Freeform12CRLTextRange)initWithRange:(_NSRange)a3;
- (_TtC8Freeform15CRLTextPosition)end;
- (_TtC8Freeform15CRLTextPosition)start;
- (id)description;
- (id)makeLeadingInsertionPoint;
- (id)makeTrailingInsertionPoint;
- (id)textRangeByCollapsingToZeroLength;
- (id)textRangeByExpandingTo:(id)a3;
- (id)textRangeByMovingLocationBy:(int64_t)a3;
- (int64_t)length;
- (unint64_t)caretAffinity;
- (unint64_t)insertionEdge;
- (void)setCaretAffinity:(unint64_t)a3;
- (void)setInsertionEdge:(unint64_t)a3;
@end

@implementation CRLTextRange

- (unint64_t)caretAffinity
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_caretAffinity);
}

- (void)setCaretAffinity:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_caretAffinity) = (Class)a3;
}

- (unint64_t)insertionEdge
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_insertionEdge);
}

- (void)setInsertionEdge:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_insertionEdge) = (Class)a3;
}

- (BOOL)eolAffinity
{
  return *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_caretAffinity) == (Class)1;
}

- (_NSRange)nsRange
{
  v2 = self;
  v3 = [(CRLTextRange *)v2 start];
  uint64_t v4 = *(uint64_t *)((char *)&v3->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);

  if (v4 == NSNotFound.getter())
  {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v6 = 0;
  }
  else
  {
    uint64_t v5 = *(uint64_t *)((char *)&v2->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_range);
    uint64_t v7 = *(void *)&v2->range[OBJC_IVAR____TtC8Freeform12CRLTextRange_range];

    BOOL v10 = __OFSUB__(v7, v5);
    NSUInteger v6 = v7 - v5;
    if (v10)
    {
      __break(1u);
      goto LABEL_6;
    }
  }
  NSUInteger v8 = v5;
  NSUInteger v9 = v6;
LABEL_6:
  result.length = v9;
  result.location = v8;
  return result;
}

- (BOOL)isInsertionPointRange
{
  return [(CRLTextRange *)self isEmpty];
}

- (BOOL)isEmpty
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_range);
  uint64_t v2 = *(void *)&self->range[OBJC_IVAR____TtC8Freeform12CRLTextRange_range];
  if (__OFSUB__(v2, v3)) {
    __break(1u);
  }
  else {
    LOBYTE(self) = v2 == v3;
  }
  return (char)self;
}

- (_TtC8Freeform15CRLTextPosition)start
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_range);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_caretAffinity);
  uint64_t v4 = (objc_class *)type metadata accessor for CRLTextPosition();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC8Freeform15CRLTextPosition_insertionEdge] = 0;
  *(void *)&v5[OBJC_IVAR____TtC8Freeform15CRLTextPosition_location] = v2;
  *(void *)&v5[OBJC_IVAR____TtC8Freeform15CRLTextPosition_caretAffinity] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  NSUInteger v6 = [(CRLTextRange *)&v8 init];

  return (_TtC8Freeform15CRLTextPosition *)v6;
}

- (_TtC8Freeform15CRLTextPosition)end
{
  uint64_t v2 = self;
  id v3 = sub_1006CC698();

  return (_TtC8Freeform15CRLTextPosition *)v3;
}

- (int64_t)length
{
  uint64_t v2 = self;
  id v3 = [(CRLTextRange *)v2 start];
  uint64_t v4 = *(uint64_t *)((char *)&v3->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);

  if (v4 == NSNotFound.getter())
  {
    int64_t v5 = 0;

    return v5;
  }
  uint64_t v6 = *(uint64_t *)((char *)&v2->super.super.isa + OBJC_IVAR____TtC8Freeform12CRLTextRange_range);
  uint64_t v7 = *(void *)&v2->range[OBJC_IVAR____TtC8Freeform12CRLTextRange_range];

  BOOL v9 = __OFSUB__(v7, v6);
  int64_t v5 = v7 - v6;
  if (!v9) {
    return v5;
  }
  __break(1u);
  return result;
}

- (_TtC8Freeform12CRLTextRange)initWithRange:(_NSRange)a3
{
  return (_TtC8Freeform12CRLTextRange *)sub_1006CC83C(a3.location, a3.length);
}

+ (_TtC8Freeform12CRLTextRange)textRangeWith:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = objc_allocWithZone((Class)type metadata accessor for CRLTextRange());
  uint64_t v6 = (void *)sub_1006CC83C(location, length);

  return (_TtC8Freeform12CRLTextRange *)v6;
}

+ (id)textRangeForAllOf:(id)a3
{
  return sub_1006CCA28((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1006CE690);
}

+ (id)textRangeForStartOf:(id)a3
{
  id v3 = sub_1006CE880();

  return v3;
}

+ (id)textRangeForEndOf:(id)a3
{
  return sub_1006CCA28((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1006CE5B4);
}

- (BOOL)isAtParagraphBoundaryIn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1006CCAA0(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (id)textRangeByExpandingTo:(id)a3
{
  id v4 = (char *)a3;
  id v5 = self;
  char v6 = sub_1006CCFA4(v4);

  return v6;
}

- (id)textRangeByCollapsingToZeroLength
{
  uint64_t v2 = self;
  id v3 = (void *)sub_1006CD0A0();

  return v3;
}

- (id)makeLeadingInsertionPoint
{
  uint64_t v2 = self;
  id v3 = sub_1006CD0E8();

  return v3;
}

- (id)makeTrailingInsertionPoint
{
  uint64_t v2 = self;
  id v3 = sub_1006CD208();

  return v3;
}

- (id)textRangeByMovingLocationBy:(int64_t)a3
{
  id v4 = self;
  id v5 = sub_1006CD32C((char *)a3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1006CE09C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1006CD5BC);
}

- (BOOL)containsTextRange:(id)a3
{
  id v4 = (char *)a3;
  id v5 = self;
  LOBYTE(self) = sub_1006CD678(v4);

  return self & 1;
}

- (BOOL)containsPosition:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1006CD7C8((uint64_t)v4);

  return self & 1;
}

- (NSString)debugDescription
{
  return (NSString *)sub_1006CE1C4(self, (uint64_t)a2, (void (*)(void))sub_1006CD8D4);
}

- (_TtC8Freeform12CRLTextRange)init
{
  int64_t result = (_TtC8Freeform12CRLTextRange *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)description
{
  id v1 = a1;
  id v2 = [v1 debugDescription];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

@end