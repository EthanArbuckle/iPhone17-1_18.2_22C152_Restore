@interface TTRILabeledIconsView
- (_TtC15RemindersUICore20TTRILabeledIconsView)initWithArrangedSubviews:(id)a3;
- (_TtC15RemindersUICore20TTRILabeledIconsView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore20TTRILabeledIconsView)initWithFrame:(CGRect)a3;
- (void)layoutMarginsDidChange;
@end

@implementation TTRILabeledIconsView

- (_TtC15RemindersUICore20TTRILabeledIconsView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore20TTRILabeledIconsView *)sub_1B92A4638(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore20TTRILabeledIconsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B92A5D68();
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TTRILabeledIconsView *)&v3 layoutMarginsDidChange];
  sub_1B92A3DB0();
}

- (_TtC15RemindersUICore20TTRILabeledIconsView)initWithArrangedSubviews:(id)a3
{
  result = (_TtC15RemindersUICore20TTRILabeledIconsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore20TTRILabeledIconsView_viewDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore20TTRILabeledIconsView_titleFont));

  swift_bridgeObjectRelease();
}

@end