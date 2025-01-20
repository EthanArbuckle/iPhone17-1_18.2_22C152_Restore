@interface TTRIRemindersListReminderCellAccessoryStackView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIView)viewForFirstBaselineLayout;
- (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView)initWithArrangedSubviews:(id)a3;
- (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView)initWithFrame:(CGRect)a3;
- (void)appLinkButtonAction:(id)a3;
- (void)assigneeViewAction:(id)a3;
- (void)infoButtonAction:(id)a3;
@end

@implementation TTRIRemindersListReminderCellAccessoryStackView

- (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *)sub_1B94ED9E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_accessoryDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_viewModel;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *((void *)v5 + 5) = 1;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + 8) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + 10) = 0u;
  *((_OWORD *)v5 + 11) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *((_OWORD *)v5 + 13) = 0u;
  *((_OWORD *)v5 + 14) = 0u;
  *((_OWORD *)v5 + 15) = 0u;
  *((_OWORD *)v5 + 16) = 0u;
  *((_OWORD *)v5 + 17) = 0u;
  *((_OWORD *)v5 + 18) = 0u;
  *((_OWORD *)v5 + 19) = 0u;
  *((_OWORD *)v5 + 20) = 0u;
  id v6 = a3;

  result = (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v4 = (objc_class *)a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v11.value.super.isa = v4;
  LOBYTE(v4) = NUIContainerView.ttr_pointIncludingExpandedHitTestInsets(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (UIView)viewForFirstBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_subtaskCountLabel));
}

- (void)assigneeViewAction:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v5 = self;
  }
  uint64_t v6 = MEMORY[0x1BA9DB180]((char *)self+ OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_accessoryDelegate);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_assigneeView);
    uint64_t v9 = v6 + direct field offset for TTRIRemindersListReminderCell.delegate;
    swift_beginAccess();
    if (MEMORY[0x1BA9DB180](v9))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 48))(v7, v8, ObjectType, v10);

      swift_unknownObjectRelease();
    }
    else
    {
    }
    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_1B90CCA68((uint64_t)v12, &qword_1EB9B4D10);
}

- (void)infoButtonAction:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1B94EE46C();

  sub_1B90CCA68((uint64_t)v6, &qword_1EB9B4D10);
}

- (void)appLinkButtonAction:(id)a3
{
  uint64_t v5 = MEMORY[0x1BA9DB180]((char *)self+ OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_accessoryDelegate, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = v5 + direct field offset for TTRIRemindersListReminderCell.delegate;
    swift_beginAccess();
    if (MEMORY[0x1BA9DB180](v7))
    {
      uint64_t v8 = *(void *)(v7 + 8);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 56);
      id v11 = a3;
      v12 = self;
      v10(v6, ObjectType, v8);

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView)initWithArrangedSubviews:(id)a3
{
  result = (_TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_accessoryDelegate);
  sub_1B90CCA68((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_viewModel, &qword_1EB9ACB20);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_flaggedImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_infoButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_subtaskCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_subtaskDisclosure));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_appLinkButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore47TTRIRemindersListReminderCellAccessoryStackView_assigneeView);
}

@end