@interface CarEVChargingRowView
- (_TtC4Maps20CarEVChargingRowView)initWithCoder:(id)a3;
- (_TtC4Maps20CarEVChargingRowView)initWithFrame:(CGRect)a3;
@end

@implementation CarEVChargingRowView

- (_TtC4Maps20CarEVChargingRowView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC4Maps20CarEVChargingRowView____lazy_storage___leadingLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC4Maps20CarEVChargingRowView____lazy_storage___trailingLabel) = 0;
  id v4 = a3;

  result = (_TtC4Maps20CarEVChargingRowView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC4Maps20CarEVChargingRowView)initWithFrame:(CGRect)a3
{
  result = (_TtC4Maps20CarEVChargingRowView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC4Maps20CarEVChargingRowView_leadingText;
  uint64_t v4 = type metadata accessor for AttributedString();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps20CarEVChargingRowView____lazy_storage___leadingLabel));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Maps20CarEVChargingRowView____lazy_storage___trailingLabel);
}

@end