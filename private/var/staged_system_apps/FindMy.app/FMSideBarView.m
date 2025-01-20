@interface FMSideBarView
- (_TtC6FindMy13FMSideBarView)init;
- (_TtC6FindMy13FMSideBarView)initWithCoder:(id)a3;
- (_TtC6FindMy13FMSideBarView)initWithFrame:(CGRect)a3;
@end

@implementation FMSideBarView

- (_TtC6FindMy13FMSideBarView)init
{
  uint64_t v3 = OBJC_IVAR____TtC6FindMy13FMSideBarView_blurredBackground;
  id v4 = objc_allocWithZone((Class)UIVisualEffectView);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)[v4 init];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for FMSideBarView();
  v6 = -[FMSideBarView initWithFrame:](&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_1003E257C();
  sub_1003E2750();

  return v6;
}

- (_TtC6FindMy13FMSideBarView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy13FMSideBarView_blurredBackground;
  id v6 = objc_allocWithZone((Class)UIVisualEffectView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy13FMSideBarView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy13FMSideBarView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy13FMSideBarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end