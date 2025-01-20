@interface FMSettingSwitchView
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC6FindMy19FMSettingSwitchView)init;
- (_TtC6FindMy19FMSettingSwitchView)initWithCoder:(id)a3;
- (_TtC6FindMy19FMSettingSwitchView)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)subtitleLabelSelected;
- (void)switchChanged;
@end

@implementation FMSettingSwitchView

- (_TtC6FindMy19FMSettingSwitchView)init
{
  return (_TtC6FindMy19FMSettingSwitchView *)sub_100143344();
}

- (_TtC6FindMy19FMSettingSwitchView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100144800();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityValue
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)accessibilityLabel
{
  NSString v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_titleLabel);
  id v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    v5 = v4;
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

- (unint64_t)accessibilityTraits
{
  return (unint64_t)[*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_settingSwitch) accessibilityTraits];
}

- (BOOL)accessibilityActivate
{
  NSString v2 = self;
  unsigned __int8 v3 = sub_1001436A0();

  return v3 & 1;
}

- (void)switchChanged
{
  NSString v2 = self;
  sub_100144510();
}

- (void)subtitleLabelSelected
{
  unsigned __int8 v3 = (char *)self + OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC6FindMy19FMSettingSwitchView *, uint64_t, uint64_t))(v4 + 16))(self, ObjectType, v4);
    swift_unknownObjectRelease();
  }
}

- (_TtC6FindMy19FMSettingSwitchView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy19FMSettingSwitchView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_delegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end