@interface LoadTimeoutWarningView
- (_TtC8BookEPUB22LoadTimeoutWarningView)initWithCoder:(id)a3;
- (_TtC8BookEPUB22LoadTimeoutWarningView)initWithFrame:(CGRect)a3;
- (void)buttonAction;
- (void)layoutSubviews;
@end

@implementation LoadTimeoutWarningView

- (void)layoutSubviews
{
  v2 = self;
  sub_5923C();
}

- (_TtC8BookEPUB22LoadTimeoutWarningView)initWithCoder:(id)a3
{
  result = (_TtC8BookEPUB22LoadTimeoutWarningView *)sub_2FD010();
  __break(1u);
  return result;
}

- (void)buttonAction
{
  v2 = *(void (**)(void))((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8BookEPUB22LoadTimeoutWarningView_action);
  v3 = self;
  v2();
}

- (_TtC8BookEPUB22LoadTimeoutWarningView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB22LoadTimeoutWarningView_labelHeightConstraint));

  swift_release();
}

@end