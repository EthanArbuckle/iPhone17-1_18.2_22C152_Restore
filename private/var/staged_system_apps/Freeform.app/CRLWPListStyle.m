@interface CRLWPListStyle
+ (NSString)defaultLabelString;
+ (unint64_t)defaultLabelNumberType;
- (_TtC8Freeform14CRLWPListStyle)init;
- (float)labelIndentForLevel:(int64_t)a3;
- (float)textIndentForLevel:(int64_t)a3;
- (id)boxedValueForProperty:(unint64_t)a3;
- (unint64_t)firstLabelType;
- (unint64_t)labelTypeForLevel:(int64_t)a3;
@end

@implementation CRLWPListStyle

+ (unint64_t)defaultLabelNumberType
{
  return 0;
}

+ (NSString)defaultLabelString
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (id)boxedValueForProperty:(unint64_t)a3
{
  v4 = self;
  id v5 = sub_100751BD0(a3);

  return v5;
}

- (_TtC8Freeform14CRLWPListStyle)init
{
  result = (_TtC8Freeform14CRLWPListStyle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100522AD8(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___listFontColor));
  sub_100752D70(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___fontName), *(void *)&self->listType[OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___fontName]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform14CRLWPListStyle____lazy_storage___shadow);

  sub_100522AD8(v3);
}

- (unint64_t)labelTypeForLevel:(int64_t)a3
{
  if (a3 > 8) {
    return 0;
  }
  v4 = self;
  unint64_t result = sub_1007521E8();
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(void *)(result + 16) > (unint64_t)a3)
  {
    unint64_t v6 = *(void *)(result + 8 * a3 + 32);

    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

- (unint64_t)firstLabelType
{
  NSString v2 = self;
  unint64_t v3 = sub_1007525DC();

  return v3;
}

- (float)labelIndentForLevel:(int64_t)a3
{
  sub_100752678(self, (uint64_t)a2, a3, (uint64_t (*)(void))sub_100752050);
  return result;
}

- (float)textIndentForLevel:(int64_t)a3
{
  sub_100752678(self, (uint64_t)a2, a3, sub_100752290);
  return result;
}

@end