@interface FMBatteryWrapperView
- (_TtC6FindMy20FMBatteryWrapperView)initWithCoder:(id)a3;
- (_TtC6FindMy20FMBatteryWrapperView)initWithFrame:(CGRect)a3;
@end

@implementation FMBatteryWrapperView

- (_TtC6FindMy20FMBatteryWrapperView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC6FindMy20FMBatteryWrapperView_batteryView;
  id v9 = objc_allocWithZone((Class)type metadata accessor for FMBatteryView());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 init];

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for FMBatteryWrapperView();
  v11 = -[FMBatteryWrapperView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  sub_100430970();

  return v11;
}

- (_TtC6FindMy20FMBatteryWrapperView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy20FMBatteryWrapperView_batteryView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMBatteryView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy20FMBatteryWrapperView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end