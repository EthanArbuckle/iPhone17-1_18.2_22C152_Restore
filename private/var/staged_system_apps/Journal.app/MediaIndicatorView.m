@interface MediaIndicatorView
- (_TtC7Journal18MediaIndicatorView)initWithCoder:(id)a3;
- (_TtC7Journal18MediaIndicatorView)initWithFrame:(CGRect)a3;
@end

@implementation MediaIndicatorView

- (_TtC7Journal18MediaIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal18MediaIndicatorView *)sub_1005B50D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal18MediaIndicatorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Journal18MediaIndicatorView_mediaImageView;
  id v6 = objc_allocWithZone((Class)UIImageView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC7Journal18MediaIndicatorView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end