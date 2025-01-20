@interface FMLoadingView
- (_TtC6FindMy13FMLoadingView)init;
- (_TtC6FindMy13FMLoadingView)initWithCoder:(id)a3;
- (_TtC6FindMy13FMLoadingView)initWithFrame:(CGRect)a3;
@end

@implementation FMLoadingView

- (_TtC6FindMy13FMLoadingView)init
{
  return (_TtC6FindMy13FMLoadingView *)sub_10004D514();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy13FMLoadingView_activityIndicator);
}

- (_TtC6FindMy13FMLoadingView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy13FMLoadingView_title;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy13FMLoadingView_activityIndicator;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];

  result = (_TtC6FindMy13FMLoadingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy13FMLoadingView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy13FMLoadingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end