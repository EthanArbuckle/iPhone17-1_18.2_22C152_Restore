@interface FMWaitingView
- (_TtC6FindMy13FMWaitingView)init;
- (_TtC6FindMy13FMWaitingView)initWithCoder:(id)a3;
- (_TtC6FindMy13FMWaitingView)initWithFrame:(CGRect)a3;
@end

@implementation FMWaitingView

- (_TtC6FindMy13FMWaitingView)init
{
  return (_TtC6FindMy13FMWaitingView *)sub_10047C9A8();
}

- (_TtC6FindMy13FMWaitingView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy13FMWaitingView_title;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy13FMWaitingView_activityIndicator;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];

  result = (_TtC6FindMy13FMWaitingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy13FMWaitingView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy13FMWaitingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy13FMWaitingView_activityIndicator);
}

@end