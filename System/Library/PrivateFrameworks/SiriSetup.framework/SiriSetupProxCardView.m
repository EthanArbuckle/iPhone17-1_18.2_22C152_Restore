@interface SiriSetupProxCardView
- (_TtC9SiriSetup21SiriSetupProxCardView)initWithCardStyle:(int64_t)a3;
- (_TtC9SiriSetup21SiriSetupProxCardView)initWithCoder:(id)a3;
- (_TtC9SiriSetup21SiriSetupProxCardView)initWithFrame:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation SiriSetupProxCardView

- (_TtC9SiriSetup21SiriSetupProxCardView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_constraintsSpecified) = 0;
  id v4 = a3;

  result = (_TtC9SiriSetup21SiriSetupProxCardView *)sub_235A68E40();
  __break(1u);
  return result;
}

- (void)updateConstraints
{
  v2 = self;
  sub_235A407FC();
}

- (_TtC9SiriSetup21SiriSetupProxCardView)initWithCardStyle:(int64_t)a3
{
  result = (_TtC9SiriSetup21SiriSetupProxCardView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup21SiriSetupProxCardView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SiriSetup21SiriSetupProxCardView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup21SiriSetupProxCardView_orbView));
}

@end