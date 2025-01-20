@interface RoundCloseButton
- (_TtC7Measure16RoundCloseButton)initWithCoder:(id)a3;
- (void)layoutSubviews;
@end

@implementation RoundCloseButton

- (_TtC7Measure16RoundCloseButton)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Measure16RoundCloseButton_contentView;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v8 = OBJC_IVAR____TtC7Measure16RoundCloseButton_closeImageView;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIImageView) initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC7Measure16RoundCloseButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(RoundCloseButton *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC7Measure16RoundCloseButton_contentView];
  [v3 frame];
  [v3 _setCornerRadius:CGRectGetHeight(v5) * 0.5];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure16RoundCloseButton_contentView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Measure16RoundCloseButton_closeImageView);
}

@end