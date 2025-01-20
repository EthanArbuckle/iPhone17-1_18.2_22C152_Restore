@interface CRLWPCharacterStyle
- (BOOL)isEqual:(id)a3;
- (_TtC8Freeform19CRLWPCharacterStyle)init;
- (id)boxedValueForProperty:(unint64_t)a3;
@end

@implementation CRLWPCharacterStyle

- (id)boxedValueForProperty:(unint64_t)a3
{
  v4 = self;
  id v5 = sub_100BCA2CC(a3);

  return v5;
}

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
    memset(v11, 0, sizeof(v11));
    id v5 = self;
  }
  sub_100557A70((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_10052E2B0((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for CRLWPCharacterStyle();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = sub_100BCAC7C((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_10052E2B0((uint64_t)v11);
  return v6 & 1;
}

- (_TtC8Freeform19CRLWPCharacterStyle)init
{
  return (_TtC8Freeform19CRLWPCharacterStyle *)sub_100BCA800();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLWPCharacterStyle_underlineColor);
}

@end