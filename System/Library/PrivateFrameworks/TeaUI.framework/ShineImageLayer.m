@interface ShineImageLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (_TtC5TeaUI15ShineImageLayer)init;
- (_TtC5TeaUI15ShineImageLayer)initWithCoder:(id)a3;
- (_TtC5TeaUI15ShineImageLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation ShineImageLayer

- (_TtC5TeaUI15ShineImageLayer)init
{
  return (_TtC5TeaUI15ShineImageLayer *)sub_1B5EEF2B0();
}

- (_TtC5TeaUI15ShineImageLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1B61B3030();
  swift_unknownObjectRelease();
  return (_TtC5TeaUI15ShineImageLayer *)sub_1B5EEF3CC(v4);
}

- (_TtC5TeaUI15ShineImageLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5EEF580();
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v3 = sub_1B61B20F0();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  char v6 = sub_1B5EEF640(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)layoutSublayers
{
  v2 = self;
  sub_1B5EEF760();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI15ShineImageLayer_shineImageLayer);
}

@end