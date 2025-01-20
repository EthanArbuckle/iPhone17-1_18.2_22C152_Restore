@interface TTRIQuickBar
- (_TtC15RemindersUICore12TTRIQuickBar)initWithCoder:(id)a3;
- (_TtC15RemindersUICore12TTRIQuickBar)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIQuickBar

- (_TtC15RemindersUICore12TTRIQuickBar)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore12TTRIQuickBar *)sub_1B9344AB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore12TTRIQuickBar)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore12TTRIQuickBar *)sub_1B9344ED4(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B9344FA8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore12TTRIQuickBar_clipViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore12TTRIQuickBar_bottomBarToContainerTopConstraint));

  swift_release();
}

@end