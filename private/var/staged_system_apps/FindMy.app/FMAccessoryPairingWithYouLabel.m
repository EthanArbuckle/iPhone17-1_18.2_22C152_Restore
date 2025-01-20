@interface FMAccessoryPairingWithYouLabel
- (_TtC6FindMy30FMAccessoryPairingWithYouLabel)init;
- (_TtC6FindMy30FMAccessoryPairingWithYouLabel)initWithCoder:(id)a3;
- (_TtC6FindMy30FMAccessoryPairingWithYouLabel)initWithFrame:(CGRect)a3;
@end

@implementation FMAccessoryPairingWithYouLabel

- (_TtC6FindMy30FMAccessoryPairingWithYouLabel)init
{
  uint64_t v3 = OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_dotView;
  id v4 = objc_allocWithZone((Class)type metadata accessor for FMAccessoryPairingWithYouIndicator());
  v5 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)[v4 init];
  uint64_t v6 = OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_textLabel;
  *(Class *)((char *)&v5->super.super.super.super.isa + v6) = (Class)[objc_allocWithZone((Class)UILabel) init];

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for FMAccessoryPairingWithYouLabel();
  v7 = -[FMAccessoryPairingWithYouLabel initWithFrame:](&v9, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_1003C588C();

  return v7;
}

- (_TtC6FindMy30FMAccessoryPairingWithYouLabel)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_dotView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMAccessoryPairingWithYouIndicator());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_textLabel;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UILabel) init];

  result = (_TtC6FindMy30FMAccessoryPairingWithYouLabel *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy30FMAccessoryPairingWithYouLabel)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy30FMAccessoryPairingWithYouLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_dotView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy30FMAccessoryPairingWithYouLabel_textLabel);
}

@end