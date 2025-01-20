@interface TTRILocationIndicator
- (_TtC9Reminders21TTRILocationIndicator)init;
- (_TtC9Reminders21TTRILocationIndicator)initWithArrangedSubviews:(id)a3;
- (_TtC9Reminders21TTRILocationIndicator)initWithCoder:(id)a3;
- (_TtC9Reminders21TTRILocationIndicator)initWithFrame:(CGRect)a3;
@end

@implementation TTRILocationIndicator

- (_TtC9Reminders21TTRILocationIndicator)init
{
  return -[TTRILocationIndicator initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (_TtC9Reminders21TTRILocationIndicator)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders21TTRILocationIndicator *)sub_100613794(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders21TTRILocationIndicator)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100613BC4();
}

- (_TtC9Reminders21TTRILocationIndicator)initWithArrangedSubviews:(id)a3
{
  result = (_TtC9Reminders21TTRILocationIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->NUIContainerStackView_opaque[OBJC_IVAR____TtC9Reminders21TTRILocationIndicator____lazy_storage___textLabel];
}

@end