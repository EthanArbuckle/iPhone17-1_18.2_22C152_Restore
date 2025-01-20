@interface TTRIQuickBarQuickPickView
- (BOOL)isAccessibilityElement;
- (NSArray)accessibilityElements;
- (_TtC15RemindersUICore25TTRIQuickBarQuickPickView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore25TTRIQuickBarQuickPickView)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)itemAction:(id)a3;
- (void)layoutSubviews;
@end

@implementation TTRIQuickBarQuickPickView

- (_TtC15RemindersUICore25TTRIQuickBarQuickPickView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore25TTRIQuickBarQuickPickView *)sub_1B934E390(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore25TTRIQuickBarQuickPickView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore25TTRIQuickBarQuickPickView *)sub_1B934EB38(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B934EC54();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  [(TTRIQuickBarQuickPickView *)&v3 _dynamicUserInterfaceTraitDidChange];
  v2[OBJC_IVAR____TtC15RemindersUICore25TTRIQuickBarQuickPickView_needsUpdateItemImages] = 1;
  objc_msgSend(v2, sel_setNeedsLayout, v3.receiver, v3.super_class);
}

- (void)itemAction:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B9970200();
  swift_unknownObjectRelease();
  sub_1B934FA70((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSArray)accessibilityElements
{
  v2 = self;
  objc_super v3 = sub_1B934FD24();

  if (v3)
  {
    v4 = (void *)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore25TTRIQuickBarQuickPickView_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore25TTRIQuickBarQuickPickView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore25TTRIQuickBarQuickPickView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore25TTRIQuickBarQuickPickView____lazy_storage___titleLabelTopToViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore25TTRIQuickBarQuickPickView____lazy_storage___viewTopToQuickPickStackViewTopConstraint));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore25TTRIQuickBarQuickPickView____lazy_storage___quickPickStackViewTopToTitleLabelLastBaselineConstraint);
}

@end