@interface FMLostModeSummaryEntryView
- (_TtC6FindMy26FMLostModeSummaryEntryView)init;
- (_TtC6FindMy26FMLostModeSummaryEntryView)initWithCoder:(id)a3;
- (_TtC6FindMy26FMLostModeSummaryEntryView)initWithFrame:(CGRect)a3;
@end

@implementation FMLostModeSummaryEntryView

- (_TtC6FindMy26FMLostModeSummaryEntryView)init
{
  uint64_t v3 = OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_platter;
  id v4 = objc_allocWithZone((Class)UIView);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)[v4 init];
  uint64_t v6 = OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_footer;
  *(Class *)((char *)&v5->super.super.super.super.isa + v6) = (Class)[objc_allocWithZone((Class)UILabel) init];

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for FMLostModeSummaryEntryView();
  v7 = -[FMLostModeSummaryEntryView initWithFrame:](&v9, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_1004370C4();

  return v7;
}

- (_TtC6FindMy26FMLostModeSummaryEntryView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_platter;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_footer;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UILabel) init];

  result = (_TtC6FindMy26FMLostModeSummaryEntryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy26FMLostModeSummaryEntryView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy26FMLostModeSummaryEntryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_platter));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_footer);
}

@end